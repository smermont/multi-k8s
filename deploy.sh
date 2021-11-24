docker build -t sergiomermont/multi-client:latest -t sergiomermont/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t sergiomermont/multi-server:latest -t sergiomermont/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t sergiomermont/multi-worker:latest -t sergiomermont/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push sergiomermont/multi-client:latest
docker push sergiomermont/multi-client:$SHA
docker push sergiomermont/multi-server:latest
docker push sergiomermont/multi-server:$SHA
docker push sergiomermont/multi-worker:latest
docker push sergiomermont/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=sergiomermont/multi-server:$SHA
kubectl set image deployments/client-deployment client=sergiomermont/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=sergiomermont/multi-worker:$SHA