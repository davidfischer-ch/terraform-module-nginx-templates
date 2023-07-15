output "inc_path" {
  value       = "${abspath(path.module)}/inc/"
  description = "Absolute path to the templates."
}
