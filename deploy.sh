docker build -t sergiomermont/multi-client:latest -t sergiomermont/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t sergiomermont/multi-server:latest -t sergiomermont/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t sergiomermont/multi-worker:latest -t sergiomermont/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push sergiomermont/multi-client
docker push sergiomermont/multi-server
docker push sergiomermont/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=sergiomermont/multi-server