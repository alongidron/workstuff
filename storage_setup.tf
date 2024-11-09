terraform {

  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "US"
}

resource "azurerm_storage_account" "example" {
  name                     = "example-storrage"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "example"
  }
}

resource "azurerm_storage_container" "example" {
  name                  = "example-name"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}
