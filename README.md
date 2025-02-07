# LAB-A05: Terraform Web Server on Azure

## Overview
This lab involves using **Terraform** to deploy a simple web server on **Azure**. The deployment includes setting up a **Virtual Machine (VM)** with **Ubuntu**, installing **Apache**, and configuring networking with a **public IP**, **subnet**, and **security rules**.

## Architecture Diagram
The following resources will be created:
- **Resource Group** (`bhup0006-A05-RG`)
- **Virtual Network (VNet)** (`bhup0006-A05-VNet`)
- **Subnet** (`bhup0006-A05-Subnet`)
- **Public IP Address** (`bhup0006-A05-PIP`)
- **Network Interface (NIC)** (`bhup0006-A05-NIC`)
- **Network Security Group (NSG)** (`bhup0006-A05-NSG`) with rules for SSH (22) and HTTP (80)
- **Linux Virtual Machine** (`bhup0006-A05-VM`) running Ubuntu with Apache installed

## Prerequisites
- Azure Subscription
- Terraform installed (`terraform >= 1.x`)
- Azure CLI (`az login` configured)
- SSH Key Pair (if not available, generate using `ssh-keygen`)

## Setup Instructions
### 1. Clone Repository
```sh
git clone https://github.com/bhupinder2414/cst8918-w25-A05-bhup0006.git
cd cst8918-w25-A05-bhup0006
```

### 2. Initialize Terraform
```sh
terraform init
```

### 3. Plan Deployment
```sh
terraform plan
```

### 4. Apply Configuration
```sh
terraform apply -auto-approve
```

### 5. Get Public IP Address
Run the following command to retrieve the public IP of the deployed VM:
```sh
echo $(terraform output -raw public_ip_address)
```

## Connecting to the VM
### 1. SSH into the VM
```sh
ssh azureadmin@<PUBLIC_IP>
```
If permission is denied, ensure your SSH keys are correctly set up and added to the VM.

### 2. Verify Apache Installation
Once connected, run:
```sh
sudo systemctl status apache2
```
You should see Apache running. Open a browser and go to `http://<PUBLIC_IP>` to verify the web server is active.

## Troubleshooting
### **Permission Denied (Public Key) Issue**
- Ensure your SSH key exists: `ls ~/.ssh/id_rsa.pub`
- Add your public key to the VM:
  ```sh
  az vm user update --resource-group bhup0006-A05-RG --name bhup0006-A05-VM --username azureadmin --ssh-key-value "$(cat ~/.ssh/id_rsa.pub)"
  ```

### **Apache Not Running**
If the web server is not accessible, check:
```sh
sudo systemctl restart apache2
sudo ufw allow 80
```

## Cleanup
To destroy all resources:
```sh
terraform destroy -auto-approve
```

## Submission Requirements
- GitHub repository link with Terraform scripts
- Screenshot of ssh commands in the terminal` output
- Screenshot of the web server running in a browser

---
✅ **Lab Completed!** 🚀

