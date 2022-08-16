# terraform {
#   backend "remote" {
#     hostname = "app.terraform.io"
#   }
# }


terraform {
  required_providers {
    docker = {
      source  = "p838683132/docker"
      version = "2.15.0"
    }
  }
}