terraform {
  required_providers {
    aws={
      source = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws"{
  profile = "default"
  region = "us-west-1"  
}

resource "aws_vpc" "vpc1" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.vpc1.id
  cidr_block = "10.0.0.0/24"
  #map_public_ip_on_launch = "true"
}

resource "aws_instance" "instance1" {
  ami = "ami-066c82dabe6dd7f73"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet1.id
  
}

