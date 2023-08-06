# generate key
openssl genrsa -out developer.key 2048
# generate csr
openssl req -new -key developer.key -out developer.csr -subj "/CN=developer/O=developer"
# generate certificate developer.crt
openssl x509 -req -in developer.csr -CA  /var/snap/microk8s/current/certs/ca.crt -CAkey  /var/snap/microk8s/current/certs/ca.key -CAcreateserial -out developer.crt -days 500

# set credential
kubectl config set-credentials developer \
--client-certificate=developer.crt \
--client-key=developer.key 

# list config
kubectl config view
kubectl config current-context

# create contex
kubectl config set-context developer --cluster=microk8s-cluster --user=developer
# switch user / contex
kubectl config use-context developer
