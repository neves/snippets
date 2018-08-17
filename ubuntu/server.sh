# entrar como root
sudo su -
# desativar cloud-init
echo 'network: {config: disabled}' > /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
# remover netplans atuais
mv /etc/netplan/* /tmp
# listar interfaces
ip a
# criar configuração
cat <<'EOF' > /etc/netplan/01-local.yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    ens33:
      dhcp4: no
      addresses: [192.168.100.100/24]
      gateway4: 192.168.100.1
      nameservers:
        addresses: [8.8.8.8,8.8.4.4]
EOF
# gerar
netplan generate
# aplicar
netplan apply
# testar
ping 8.8.8.8

sudo apt install -y zsh
chsh -s /bin/zsh

# temperatura
cat /sys/class/thermal/thermal_zone0/temp

echo '%sudo  ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/passwordless

cat <<'EOF' >> /etc/environment 
LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8
EOF

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   edge"

 sudo apt update
sudo apt install -y docker-ce
sudo usermod -aG docker $USER
# depois do comando acima, precisa deslogar para aplicar o novo grupo
docker run --rm hello-world

sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

