FROM ubuntu:18.04

WORKDIR /opt/
USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    make \
    automake \
    gcc \
    build-essential \
    g++ \
    cpp \
    libc6-dev \
    man-db \
    autoconf \
    pkg-config \
    wget

RUN wget http://acsc.cs.utexas.edu/cpabe/cpabe-0.11.tar.gz  &&\
    tar -zxvf cpabe-0.11.tar.gz

RUN apt-get install -y --no-install-recommends libglib2.0-dev libssl-dev libgmp-dev
RUN wget http://launchpadlibrarian.net/70575439/libgmp3c2_4.3.2+dfsg-2ubuntu1_amd64.deb &&\
    dpkg -i libgmp3c2_4.3.2+dfsg-2ubuntu1_amd64.deb &&\
    wget http://voltar.org/pbcfiles/libpbc0_0.5.9_amd64.deb &&\
    dpkg -i libpbc0_0.5.9_amd64.deb &&\
    wget http://voltar.org/pbcfiles/libpbc-dev_0.5.9_amd64.deb &&\
    dpkg -i libpbc-dev_0.5.9_amd64.deb

RUN wget http://acsc.cs.utexas.edu/cpabe/libbswabe-0.9.tar.gz &&\
    tar -zxvf libbswabe-0.9.tar.gz
WORKDIR libbswabe-0.9/
RUN ./configure &&\
    make &&\
    make install

WORKDIR ../cpabe-0.11/
RUN apt-get install -y checkinstall
RUN ./configure LDFLAGS="-O3 -Wall -lglib-2.0 -Wl,-rpath /usr/local/lib -lgmp -Wl,-rpath /usr/local/lib -lpbc -lbswabe -lcrypto -lcrypto -lgmp" &&\
    make LDFLAGS="-O3 -Wall -lglib-2.0 -Wl,-rpath /usr/local/lib -lgmp -Wl,-rpath /usr/local/lib -lpbc -lbswabe -lcrypto -lcrypto -lgmp" &&\
    make install

RUN apt-get install bash

WORKDIR /root/
RUN cpabe-setup -v
CMD /bin/bash
