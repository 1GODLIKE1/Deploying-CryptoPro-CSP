# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANT_API_VERSION = 2

NODES = {
  "CryptoPro" => ["192.168.22.2", "2212", 16384, 7],
}

Vagrant.configure(VAGRANT_API_VERSION) do |config|
  config.vm.box = "ubuntu/focal64"

  NODES.each do |(name, cfg)|
    ip, ssh_conf, ram, cpu, disksize = cfg
    config.vm.define name do |machine|
      machine.vm.network :private_network, ip: ip
      machine.vm.provider "virtualbox" do |v|
        v.name = name
        v.gui = false
        v.memory = ram
        v.cpus = cpu
      end
      machine.vm.provision "shell", path: "update.sh"
      machine.vm.provision "shell", path: "build.sh"
      machine.vm.network "public_network"
      machine.vm.network "forwarded_port", host: ssh_conf, guest: 22, id: 'ssh'
    end
  end
end
