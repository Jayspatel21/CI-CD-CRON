variable "TF_VAR_digitalocean_token" {
  type        = string
  description = "Your DigitalOcean API Token"
  sensitive   = true  # Added sensitive flag for security
}

variable "organization" {
    description = "organization name"
}

variable "workspace" {
  
}