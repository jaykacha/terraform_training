provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAIKWNCOPL6PFZFUQA"
  secret_key = "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"
}

variable "subnet_prefix" {
  description = "cide block for the subnet"
}

resource "aws_vpc" "prod_vpc_2" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "production1"
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id            = aws_vpc.prod_vpc_2.id
  cidr_block        = var.subnet_prefix[1].cidr_block
  availability_zone = "us-east-1a"
  tags = {
    Name = var.subnet_prefix[1].name
  }
}

resource "aws_subnet" "subnet-3" {
  vpc_id            = aws_vpc.prod_vpc_2.id
  cidr_block        = var.subnet_prefix[0].cidr_block
  availability_zone = "us-east-1a"
  tags = {
    Name = var.subnet_prefix[0].name
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-jay"
  acl    = "private"
  tags = {
    Name        = "My-bucket-1"
    Environment = "Dev"
  }
}
