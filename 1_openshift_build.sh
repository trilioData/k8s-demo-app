#!/bin/bash

## Install helm
curl -s https://storage.googleapis.com/kubernetes-helm/helm-v2.9.0-linux-amd64.tar.gz | tar xz
cp linux-amd64/helm /usr/local/bin/
oc -n kube-system create serviceaccount tiller
oc get sa --namespace kube-system | grep tiller
oc create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
oc get clusterrolebinding | grep tiller
helm init --service-account tiller
until (kubectl get pods -n kube-system -l app=helm,name=tiller 2>/dev/null | grep Running); do sleep 1; done

## Install CSI host path driver
git clone https://github.com/kubernetes-csi/csi-driver-host-path.git
cd /root/csi-driver-host-path/
deploy/kubernetes-1.15/deploy-hostpath.sh
cd /root/
oc get pods
