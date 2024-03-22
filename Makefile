.PHONY: kind-cluster, kind-destroy-cluster, kind-create-capivara-cluster, k-rm-all-ns, k-delete-service, k-delete-all-cluster, k-create-namespace, k-create-deployment, k-delete-deployment, k-create-service, k-delete-service, k-create-ingress, k-delete-ingress, k-create-hpa, k-delete-hpa, k-get-pod, k-get-no, k-get-svc, k-get-namespace, k-get-cluster, k-port-forward

help: 
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' 
	
.DEFAULT_GOAL := help
##
## ------------------------------------
## Time Makefile
## ------------------------------------
##

## make create kind cluster - kind create cluster
kind-cluster:
	@kind create cluster

## make create kind cluster - kind create cluster --name
kind-create-capivara-cluster:
	@kind create cluster --name capivara-application --config cluster-ingress.yml

## make delete kind cluster - kubectl delete cluster
kind-destroy-cluster:
	@kind delete cluster

## make delete all namespaces - kubectl delete all namespaces
k-rm-all-ns:
	@kubectl delete --all --all-namespaces

## make delete all cluster - kubectl delete all cluster
k-delete-all-cluster:
	@kind delete clusters --all

## ## make create namespace - kubectl create namespace
k-create-namespace:
	@kubectl apply -f namespace.yml

## ## make delete namespace - kubectl create delete
k-create-delete:
	@kubectl apply -f delete.yml

## ## make create deployment - kubectl delete deployment
k-create-deployment:
	@kubectl apply -f deployment.yml

## ## make delete deployment - kubectl delete deployment
k-delete-deployment:
	@kubectl delete -f deployment.yml

## make delete service - kubectl delete service
k-create-service:
	@kubectl apply -f service.yml

## make create service - kubectl create service
k-delete-service:
	@kubectl delete -f service.yml

## ## make create ingress - kubectl create ingress
k-create-ingress:
	@kubectl apply -f ingress.yml

## ## make delete ingress - kubectl create delete
k-delete-ingress:
	@kubectl delete -f ingress.yml

## ## make create hpa - kubectl create hpa
k-create-hpa:
	@kubectl apply -f hpa.yml

## ## make delete hpa - kubectl delete hpa
k-delete-hpa:
	@kubectl delete -f hpa.yml

## ## port-forward - kubectl port-forward pod
k-port-forward:
	@kubectl port-forward pod/capivara-deployment-7497ddbfd4-l2c8v 8080:80

