provider "aws" {
    region = "${var.aws_region}"
}

variable "aws_region" { 
  default = "eu-west-2" 
  description = "AWS region"
} # London

module "tfc-demo-two-tier" {
  source  = "app.terraform.io/jaredfholgate-hashicorp/tfc-demo-two-tier/aws"
  version = "1.0.7"
  aws_region = "eu-west-2"
  aws_ami    = "ami-0ac10f53765369588"
  service_name = "${terraform.workspace}"
}

output "url" {
  value = module.tfc-demo-two-tier.address
}
