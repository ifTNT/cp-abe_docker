cp-abe_docker
===
A wrapper of http://acsc.cs.utexas.edu/cpabe/ powered by docker.  
[Docker hub](https://hub.docker.com/r/iftnt/cp-abe)

### About Ciphertext-Policy Attribute-based-encryption

> In ciphertext-policy attribute-based encryption (CP-ABE) a user’s private-key is associated with a set of attributes and a ciphertext specifies an access policy over a defined universe of attributes within the system. A user will be ale to decrypt a ciphertext, if and only if his attributes satisfy the policy of the respective ciphertext. Policies may be defined over attributes using conjunctions, disjunctions and (k,n)-threshold gates, i.e., k out of n attributes have to be present (there may also be non-monotone access policies with additional negations and meanwhile there are also constructions for policies defined as arbitrary circuits). For instance, let us assume that the universe of attributes is defined to be {A,B,C,D} and user 1 receives a key to attributes {A,B} and user 2 to attribute {D}. If a ciphertext is encrypted with respect to the policy (A∧C)∨D, then user 2 will be able to decrypt, while user 1 will not be able to decrypt.
>  
> CP-ABE thus allows to realize implicit authorization, i.e., authorization is included into the encrypted data and only people who satisfy the associated policy can decrypt data. Another nice features is, that users can obtain their private keys after data has been encrypted with respect to policies. So data can be encrypted without knowledge of the actual set of users that will be able to decrypt, but only specifying the policy which allows to decrypt. Any future users that will be given a key with respect to attributes such that the policy can be satisfied will then be able to decrypt the data.

### Installation
`docker pull iftnt/cp-abe`

### License
MIT 2018 ifTNT  

Hope you like it :)
