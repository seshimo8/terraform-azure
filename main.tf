resource "azurerm_resource_group" "test" {
  name     = local.resource_group_name
  location = local.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_consumption_budget_subscription" "example" {
  name            = local.budget_name
  subscription_id = "/subscriptions/サブスクリプションID"


  amount     = 1000
  time_grain = "Monthly"

  time_period {
    start_date = "2025-03-01T00:00:00Z"
    end_date   = "2035-12-31T00:00:00Z"
  }

  notification {
    enabled   = true
    threshold = 50
    operator  = "GreaterThan"

    contact_emails = [
      "seshimo3594@gmail.com"
    ]
  }
  notification {
    enabled   = true
    threshold = 100
    operator  = "GreaterThan"

    contact_emails = [
      "seshimo3594@gmail.com"
    ]
  }
}