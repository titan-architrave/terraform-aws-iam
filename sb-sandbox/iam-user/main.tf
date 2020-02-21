provider "aws" {
  region = "eu-central-1"
}

module "iam_user" {
  source = "../../modules/iam-user"

  name          = "sheep"
  force_destroy = false

  pgp_key = "keybase:titanarch"

  password_reset_required = true
  password_length = 28
}
