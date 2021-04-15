#!/usr/bin/env bash

# required packages for installation
REQ="apt-transport-https ca-certificates curl gnupg lsb-release jq"

# docker packaes
DPACK="docker-ce docker-ce-cli containerd.io"

# install requierd packages and docker repo
apt-get update && apt-get install -y ${REQ}
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
$(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# install docker and add user to docker group
apt-get update && apt-get install -y ${DPACK}
usermod -aG docker vagrant

# docker-compose install
# check latest version of docker-compose
VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | jq .name -r)

# install 
curl -fsSL "https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
