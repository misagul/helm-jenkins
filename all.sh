helm repo add jenkins https://charts.jenkins.io
helm repo update
kubectl apply -f namespace.yaml
helm install jenkins jenkins/jenkins -n jenkins -f values.yaml 
echo "Waiting for the pod to be ready..."
kubectl wait --for=condition=Ready --timeout=-1s $(kubectl get pods -n jenkins -o name | grep '^pod/jenkins') -n jenkins
kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo
