# TODO: Designate a cloud provider, region, and credentials
variable "my_access_key" {
  description = "Access-key-for-AWS"
  default = "no_access_key_value_found"
}
 
variable "my_secret_key" {
  description = "Secret-key-for-AWS"
  default = "no_secret_key_value_found"
}
 

variable "countM4" {
  type = number
  default = 2
}

variable "countT2" {
  type = number
  default = 4
}

variable "indexM4" {
  type = number
  default = 10
}
provider "aws" {
  region = "us-east-1"
  access_key = var.my_access_key
  secret_key = var.my_secret_key
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "t2" {
  count = var.countT2
  ami = "ami-0870650fde0fef2d4"
  instance_type = "t2.micro"
  subnet_id = "subnet-09b2ac67adcd3cf8e"
  tags = {
    type = "project",
    source = "terraform",
    Name = "Udacity T2"
  }
}


# TODO: provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "m4" {
  count = var.countM4
  ami = "ami-0870650fde0fef2d4"
  instance_type = "m4.large"
  subnet_id = "subnet-09b2ac67adcd3cf8e"
  tags = {
    type = "test",
    source = "terraform",
    Name = "Udacity M4"
  }
}
