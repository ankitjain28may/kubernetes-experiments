#!/bin/sh



delete() {
    kubectl delete -f traefik-cr.yaml
    kubectl delete -f traefik-service-acc.yaml
    kubectl delete -f traefik-crb.yaml
    kubectl delete -f traefik-config.yaml
    kubectl delete -f traefik-deployment.yaml
    kubectl delete -f traefik-svc.yaml
    kubectl delete -f traefik-ingress.yaml
    kubectl delete -f app.yaml
    kubectl delete -f ingress.yaml 
    kubectl delete namespace "testing"
}




apply() {
    kubectl apply -f traefik-cr.yaml --validate=false
    kubectl apply -f traefik-service-acc.yaml --validate=false
    kubectl apply -f traefik-crb.yaml --validate=false
    # kubectl apply -f traefik-config.yaml --validate=false
    kubectl apply -f traefik-deployment.yaml --validate=false
    kubectl apply -f traefik-svc.yaml --validate=false
    kubectl apply -f traefik-ingress.yaml --validate=false
    kubectl create namespace "testing"
    kubectl apply -f app.yaml --validate=false
    kubectl apply -f ingress.yaml --validate=false
    kubectl create secret generic admin --from-file auth -n kube-system 
}

OPTION=$1
if [[ $OPTION == "apply" ]] 
then
    apply
else
    delete
fi
