terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"  # Specify a version or use the latest compatible version
    }
  }
}
provider "digitalocean" {
  token = var.digitalocean_token
}



resource "digitalocean_droplet" "example" {
  image  = "ubuntu-20-04-x64"
  name   = "ci-cd-droplet"
  region = "blr1"
  size   = "s-1vcpu-1gb"
  
  # Use cloud-init user data to set default password
  user_data = <<-EOF
  #cloud-config
  chpasswd:
    list: |
      root:jack2153
    expire: False
  EOF
}

# Output Droplet IP
output "droplet_ip" {
  value = digitalocean_droplet.example.ipv4_address
}

variable "digitalocean_token" {
  type = string
  description = "Your DigitalOcean API Token"
}

