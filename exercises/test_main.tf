variable "my_access_key" {
  description = "Access-key-for-AWS"
  default = "no_access_key_value_found"
}
 
variable "my_secret_key" {
  description = "Secret-key-for-AWS"
  default = "no_secret_key_value_found"
}
 
output "access_key_is" {
  value = var.my_access_key
}
 
output "secret_key_is" {
  value = var.my_secret_key
}
 
provider "aws" {
	region = "us-east-1"
	access_key = var.my_access_key
	secret_key = var.my_secret_key
}

resource "aws_instance" "example" {
	ami = "ami-0870650fde0fef2d4"
	instance_type = "t2.micro"
  tags = {
    type = "test",
    source = "terraform",
    Name = "EC2 from terraform"
  }
}