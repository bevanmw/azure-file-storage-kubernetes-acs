#!/bin/bash

#Detects the user
user=$(whoami)

kubectl get nodes | grep -o 'k8s-agent-.*-[0-9]*' | while read -r agent; do
    echo $agent
    scp -o "StrictHostKeyChecking no" local.sh $user@$agent:~/
    ssh -o "StrictHostKeyChecking no" -n $user@$agent sudo sh ~/local.sh
done
