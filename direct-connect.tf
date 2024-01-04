data "opentelekomcloud_identity_project_v3" "project_1" {}

resource "opentelekomcloud_dc_endpoint_group_v2" "dc_endpoint_group_1" { # precisa endpoint group para as subnets da vpc e para as redes on prem tbm
  name        = "ep-1"
  type        = "cidr"
  endpoints   = ["192.168.0.0/24"]
  description = "first"
  project_id  = data.opentelekomcloud_identity_project_v3.project_1.id
}

resource "opentelekomcloud_dc_endpoint_group_v2" "dc_endpoint_group_2" { # precisa endpoint group para as subnets da vpc e para as redes on prem tbm
  name        = "ep-2"
  type        = "cidr"
  endpoints   = ["10.0.0.0/16"]
  description = "second"
  project_id  = data.opentelekomcloud_identity_project_v3.project_1.id
}

resource "opentelekomcloud_dc_virtual_gateway_v2" "vgw_1" {
  vpc_id            = "b8502d9a-a7db-4e07-99dc-4aace7b22b86"
  name              = "my_virtual_gateway"
  description       = "acc test"
  local_ep_group_id = opentelekomcloud_dc_endpoint_group_v2.dc_endpoint_group_1.id
}

resource "opentelekomcloud_dc_virtual_interface_v2" "int_1" {
  direct_connect_id  = "f68b54f7-3066-4913-b174-61428cddfe16"
  virtual_gateway_id = opentelekomcloud_dc_virtual_gateway_v2.vgw_1.id
  name               = "vi_1"
  description        = "description"
  type               = "private"
  route_mode         = "bgp"
  asn                = "65201"
  bgp_md5            = "11R+6n&Lz3h7"
  vlan               = 100
  bandwidth          = 10000
  service_type       = "vpc"

  remote_ep_group_id   = opentelekomcloud_dc_endpoint_group_v2.dc_endpoint_group_2.id
  local_gateway_v4_ip  = "180.1.1.1/24"
  remote_gateway_v4_ip = "180.1.1.2/24"
}
