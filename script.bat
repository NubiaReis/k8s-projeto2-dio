echo "Criando a imagem."

docker build -t nubiareis/k8-projeto:1.0

echo "Realizando o push da imagem."

docker push nubiareis/k8-projeto:1.0

echo "Criando o load balancer."

kubectl apply -f ./load-balancer.yml

echo "Criando os deployments."

kubectl apply -f .\mysql-deployment.yml --record
kubectl apply -f .\app-deployment.yml --record

