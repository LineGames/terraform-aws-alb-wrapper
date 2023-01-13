output "wrapper" {
  description = "Map of outputs of a wrapper."
  value       = module.wrapper
  # sensitive = false  # No sensitive module output found
}
  
output "target_group_arns" {
  description = "Map of outputs of a wrapper."
  value       = [for v in module.wrapper : v.target_group_arns]
  # sensitive = false  # No sensitive module output found
}
