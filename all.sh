mkdir /data
mkdir /data/jenkins-volume
sudo chown -R 1000:1000 /data/jenkins-volume
helm repo add jenkinsci https://charts.jenkins.io
helm repo update
kubectl apply -f namespace.yaml
kubectl apply -f jenkins-volume.yaml
kubectl apply -f jenkins-sa.yaml
helm install jenkins -n jenkins -f jenkins-values.yaml jenkinsci/jenkins
