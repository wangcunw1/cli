#!/bin/bash
echo "Enter Your VM Name:"
read vmname
az network vnet create \
  --name $vmname"Net" \
  --resource-group learn-a240a501-f0a4-4ab1-aa3a-d7dbdff4af25 \
  --address-prefixes 10.0.0.0/16 \
  --subnet-name $vmname"SubNet" \
  --subnet-prefixes 10.0.0.0/24
 
 az vm create \
  --resource-group learn-a240a501-f0a4-4ab1-aa3a-d7dbdff4af25 \
  --size DS2_v2\
  --name $vmname \
  --image UbuntuLTS \
  --vnet-name $vmname"Net" \
  --subnet $vmname"SubNet" \
  --generate-ssh-keys \
  --location eastasia \
  --output json \
  --verbose 
