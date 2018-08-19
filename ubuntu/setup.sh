# set system datetime
sudo timedatectl set-timezone America/Sao_Paulo


# set default shell to zsh
chsh -s /bin/zsh


# passwordless sudo
echo '%sudo  ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/passwordless


# set default system locale
echo 'LC_ALL=en_US.UTF-8' >> /etc/environment
echo 'LANG=en_US.UTF-8' >> /etc/environment


# disable ipv6
sudo tee /proc/sys/net/ipv6/conf/all/disable_ipv6 <<< "1"


# sensors temperature (ENTER for all questions)
sudo apt install -y lm-sensors
sudo sensors-detect
sensors
