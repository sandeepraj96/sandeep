# Terraform Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# Create EC2 Instance
resource "aws_instance" "web" {
  ami               = "ami-0dfcb1ef8550277af" # Amazon Linux
  instance_type     = "t2.micro"
  availability_zone = "us-east-1f"
  #availability_zone = "ap-south-1b"
  tags = {
    "Name" = "web-1"
  }

resource "vpc_id" {}

data "aws_vpc" "nokia" {
  id = "vpc-06916843d761a129d"
}

resource "subnet_id" {}

data "aws_subnet" "intra" {
  id = "subnet-09bc3a1a14f788352"
}

  lifecycle {
    create_before_destroy = true
  }
}