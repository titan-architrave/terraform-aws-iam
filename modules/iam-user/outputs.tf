output "this_iam_user_name" {
  description = "The user's name"
  value       = concat(aws_iam_user.this.*.name, [""])
}

output "this_iam_user_arn" {
  description = "The ARN assigned by AWS for this user"
  value       = concat(aws_iam_user.this.*.arn, [""])
}

output "this_iam_user_unique_id" {
  description = "The unique ID assigned by AWS"
  value       = concat(aws_iam_user.this.*.unique_id, [""])
}

output "this_iam_user_login_profile_key_fingerprint" {
  description = "The fingerprint of the PGP key used to encrypt the password"
  value       = concat(aws_iam_user_login_profile.this.*.key_fingerprint, [""])
}

output "this_iam_access_key_id" {
  description = "The access key ID"
  value = concat(
    aws_iam_access_key.this.*.id,
    aws_iam_access_key.this_no_pgp.*.id,
    [""],
  )
}

output "this_iam_access_key_secret" {
  description = "The access key secret"
  value       = concat(aws_iam_access_key.this_no_pgp.*.secret, [""])
}

output "this_iam_access_key_key_fingerprint" {
  description = "The fingerprint of the PGP key used to encrypt the secret"
  value       = concat(aws_iam_access_key.this.*.key_fingerprint, [""])
}

output "this_iam_access_key_ses_smtp_password" {
  description = "The secret access key converted into an SES SMTP password"
  value = concat(
    aws_iam_access_key.this.*.ses_smtp_password,
    aws_iam_access_key.this_no_pgp.*.ses_smtp_password,
    [""],
  )
}

output "this_iam_access_key_status" {
  description = "Active or Inactive. Keys are initially active, but can be made inactive by other means."
  value = concat(
    aws_iam_access_key.this.*.status,
    aws_iam_access_key.this_no_pgp.*.status,
    [""],
  )
}

output "pgp_key" {
  description = "PGP key used to encrypt sensitive data for this user (if empty - secrets are not encrypted)"
  value       = var.pgp_key
}

output "keybase_password_decrypt_command" {
  value = concat(aws_iam_user_login_profile.this.*.encrypted_password, ["| base64 --decode | keybase pgp decrypt"])
}

output "keybase_secret_key_decrypt_command" {
  value = concat(aws_iam_access_key.this.*.encrypted_secret, ["| base64 --decode | keybase pgp decrypt"])
}

output "this_iam_user_ssh_key_ssh_public_key_id" {
  description = "The unique identifier for the SSH public key"
  value       = concat(aws_iam_user_ssh_key.this.*.ssh_public_key_id, [""])
}

output "this_iam_user_ssh_key_fingerprint" {
  description = "The MD5 message digest of the SSH public key"
  value       = concat(aws_iam_user_ssh_key.this.*.fingerprint, [""])
}

