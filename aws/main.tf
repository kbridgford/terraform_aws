terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_instance" "app_server" {
  ami                    = "ami-0121ef35996ede438"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0cc9a55747ccffd34"]
  subnet_id              = "subnet-08db272cfdf3231eb"

  tags = {
    Name = var.instance_name
  }
}
