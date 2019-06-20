kubectl apply -f traefik-cr.yaml --validate=false
kubectl apply -f traefik-service-acc.yaml --validate=false
kubectl apply -f traefik-crb.yaml --validate=false
kubectl apply -f traefik-config.yaml --validate=false
kubectl apply -f traefik-deployment.yaml --validate=false
kubectl apply -f traefik-svc.yaml --validate=false
kubectl apply -f traefik-ing.yaml --validate=false
kubectl create namespace "testing"
kubectl apply -f app.yaml --validate=false
kubectl apply -f ing.yaml --validate=false