echo "Enter Your VM Name:"
read vmname
az network vnet create \
  --name $vmname"Net" \
  --resource-group learn-d9acb93a-5c50-4323-8136-b427ef15a78c \
  --address-prefixes 10.0.0.0/16 \
  --subnet-name $vmname"SubNet" \
  --subnet-prefixes 10.0.0.0/24
 
 az vm create \
  --resource-group learn-d9acb93a-5c50-4323-8136-b427ef15a78c \
  --name $vmname \
  --image UbuntuLTS \
  --vnet-name $vmname"Net" \
  --subnet $vmname"SubNet" \
  --generate-ssh-keys \
  --location eastasia \
  --output json \
  --verbose 
