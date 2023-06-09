provider "aws" {
  region = var.aws_region
}

//create ec2 machine
resource "aws_instance" "MyApacheServer" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y apache2
              sudo systemctl enable apache2
              sudo systemctl start apache2
              EOF

  tags = {
    Name = var.ec2_instance_name
  }
}

//creating security_group for ec2
resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "Security group for EC2 instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.ec2_security_group_name
  }
}
