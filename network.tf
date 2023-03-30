resource "azurerm_virtual_network" "ntier_vnet" {
  name                = var.vnet_details.name
  location            = var.resourcegroup_details.location
  resource_group_name = var.resourcegroup_details.name
  address_space       = var.vnet_details.address_space
  depends_on = [
    azurerm_resource_group.ntier
  ]
}

resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_datails.names)
  name                 = var.subnet_datails.names[count.index]
  virtual_network_name = var.vnet_datails.name
  resource_group_name  = var.resourcegroup_details.name
  address_prefixes     = [cidrsubnet(var.vnet_datails.address_space[0], 8)]

}