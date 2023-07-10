#!/bin/bash

# Install python3.10 and dependency
sudo apt install software-properties-common -y
sudo -E add-apt-repository -y "ppa:deadsnakes/ppa"
sudo apt install python3.10 python3-pip python3.10-venv sshpass -y

# Clone git and install pypi package
git clone https://github.com/1GODLIKE1/Deploying-CryptoPro-CSP.git && sudo chown -R vagrant Deploying-CryptoPro-CSP/ && cd Deploying-CryptoPro-CSP
python3.10 -m venv venv && sudo chown -R vagrant venv/
source venv/bin/activate && pip install ansible

# Run playbook
ansible-playbook -i hosts.txt ./CryptoProCSP.yml --extra-vars "ansible_password=vagrant"
