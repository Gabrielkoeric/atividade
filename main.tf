terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  access_key = "**********"
  secret_key = "**********"
  region = "sa-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0b7af114fb404cd23"
  instance_type = "t2.micro"
  user_data = file("scripts/bash.sh")

    tags = {
     Name = var.instance_name
   }
}
