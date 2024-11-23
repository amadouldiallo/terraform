# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "aws_access_key" {
  sensitive = true
}
variable "aws_secret_key" {
  sensitive = true
}
variable "aws_region" {
  sensitive = true
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.aws_region
}

# Generate a random pet names
resource "random_pet" "petname" {
  length    = 5
  separator = "-"
}

resource "aws_s3_bucket" "sample" {
  bucket = random_pet.petname.id

  tags = {
    public_bucket = false
    name = "s3-amadou"
  }
}
