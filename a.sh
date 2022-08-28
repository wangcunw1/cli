#!/bin/bash
echo "Enter Your VM Name:"
read vmname
az network vnet create \
  --name $vmname"Net" \
  --resource-group learn-bc35e0aa-27ff-4078-bcba-9032fea619ea \
  --address-prefixes 10.0.0.0/16 \
  --subnet-name $vmname"SubNet" \
  --subnet-prefixes 10.0.0.0/24
 
 az vm create \
  --resource-group learn-bc35e0aa-27ff-4078-bcba-9032fea619ea \
  --name $vmname \
  --image UbuntuLTS \
  --vnet-name $vmname"Net" \
  --subnet $vmname"SubNet" \
  --generate-ssh-keys \
  --location eastasia \
  --output json \
  --verbose 
