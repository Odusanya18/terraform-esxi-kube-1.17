#########################################
#  ESXI Provider host/login details
#########################################
#
#   Use of variables here to hide/move the variables to a separate file
#
provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}

#########################################
#  ESXI Guest resource
#########################################
resource "esxi_guest" "kubernetes-node" {
  count = 1
  guest_name = "kubernetes-node-${count.index}"
  disk_store = "datastore1"
  guestos    = "debian9-64"
  boot_disk_type = "thin"
  boot_disk_size = "1"
  memsize            = "1024"
  numvcpus           = "4"
  resource_pool_name = "/"
  power              = "on"
  ovf_source        = "C:\\Users\\victor.odusanya.INTERSWITCHNG\\Desktop\\packer-esxi\\debian-9-kube-1.17\\debian-9-kube-1.17.ova"
  network_interfaces {
    virtual_network = "VM Network"
  }
  guest_startup_timeout  = 45
  guest_shutdown_timeout = 30
}