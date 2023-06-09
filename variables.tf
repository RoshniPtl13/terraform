variable "aws_region" {
  description = "AWS region"
  default     = "ca-central-1" #aws region
}

variable "ec2_ami" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0940df33750ae6e7f"  # Replace with your desired AMI ID
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro" #choose your instance type
}

variable "ec2_instance_name" {
  description = "Name for the EC2 instance"
  default     = "terraform-exp" #name of your instance
}

variable "ec2_security_group_name" {
  description = "Name for the EC2 security group"
  default     = "terraform-test-sg" #name of your security group
}
