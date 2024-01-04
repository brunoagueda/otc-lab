variable "domain_name" {
 type = string
 default = "OTC00000000001000080605"
}

variable "tenant_name" {
 type = string
 default = "eu-ch2"
}

variable "project_name" {
  default = "brunotest"
}

variable "project_id" {
  type = string
  default = "498ea3c44a62400a832d34239f262330"
}

variable "user_name" {
  type = string
  default = "api_user_pg"
}

variable "password" {
  type = string
  default = ""
}

variable "vpc_name" {
  type = string
  default = "vpc-test-tf"
}

variable "vpc_cidr" {
  type = string
  default = "192.168.0.0/16"
}

variable "sec_cidr" {
  type = string
  default = "23.8.0.0/16"
}

variable "url_iam" {
  type = string
  default = "https://iam-pub.eu-ch2.sc.otc.t-systems.com:443/v3"
}

variable "url_vpc" {
  type = string
  default = "https://vpc.eu-ch2.sc.otc.t-systems.com"
}

variable "access_key" {
  default = "DX3DP35X0EUXJH9S716I"
}

variable "secret_key" {
  default = "xNCklVb2HP83LDIVBkJRfjw1HAVhhx0Ue1b5N6lh"
}

variable "security_token" {
  default = ""
}

variable "namming_pattern" {
  description = "Namming pattern for resources to be created"
  type        = map(object({
        context  = string
        stage = string
        cidr = string
       }))
}

variable "otc_domain_name" {
 default = "OTC00000000001000080605"
 type = string
}

variable "otc_idp_description" {
  default = "testing"
  type    = string
}

variable "otc_idp_protocol" {
  type = string
  default = "oidc"
}

