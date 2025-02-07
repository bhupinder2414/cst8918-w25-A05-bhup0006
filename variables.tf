variable "labelPrefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "region" {
  description = "Azure region"
  default     = "eastus"
}

variable "admin_username" {
  description = "Admin username for the VM"
  default     = "azureadmin"
}
    