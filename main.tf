#Notes:
# each ingress and egress statement represents a line in the security group
# 'from port' and 'to port' defines a port range that is to be configured in the sg
# singple port example: if 443 is define for both, only 443 will be allowed for that entry
# multi port exampel: of from 20 to 21 is defined, ports 20-21 will be allowed

provider "aws" {
  profile = "detnet"
  region = "us-east-1"
}

resource "aws_security_group" "detsec" {
  name = "det_sg"
  tags {
    Name = "det_sg"
  }
  description = "testing some sg shit"
  vpc_id = "vpc-80ae8ffb"

  ingress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = [
      "10.0.0.0/8"]
  }

  ingress {
    from_port = 20
    protocol = "tcp"
    to_port = 21
    cidr_blocks = [
      "10.0.0.0/8"]
  }
  egress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = [
      "10.0.0.0/8"]
  }

}
