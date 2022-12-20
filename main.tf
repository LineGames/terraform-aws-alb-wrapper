module "wrapper" {
  source = "github.com/kyeongju/terraform-aws-alb.git"

  for_each = var.items

  create_lb                        = try(each.value.create_lb, var.defaults.create_lb, true)
  drop_invalid_header_fields       = try(each.value.drop_invalid_header_fields, var.defaults.drop_invalid_header_fields, false)
  # preserve_host_header             = try(each.value.preserve_host_header, var.defaults.preserve_host_header, false)
  enable_deletion_protection       = try(each.value.enable_deletion_protection, var.defaults.enable_deletion_protection, false)
  enable_http2                     = try(each.value.enable_http2, var.defaults.enable_http2, true)
  enable_cross_zone_load_balancing = try(each.value.enable_cross_zone_load_balancing, var.defaults.enable_cross_zone_load_balancing, false)
  extra_ssl_certs                  = try(each.value.extra_ssl_certs, var.defaults.extra_ssl_certs, [])
  https_listeners                  = try(each.value.https_listeners, var.defaults.https_listeners, [])
  http_tcp_listeners               = try(each.value.http_tcp_listeners, var.defaults.http_tcp_listeners, [])
  https_listener_rules             = try(each.value.https_listener_rules, var.defaults.https_listener_rules, [])
  http_tcp_listener_rules          = try(each.value.http_tcp_listener_rules, var.defaults.http_tcp_listener_rules, [])
  idle_timeout                     = try(each.value.idle_timeout, var.defaults.idle_timeout, 60)
  ip_address_type                  = try(each.value.ip_address_type, var.defaults.ip_address_type, "ipv4")
  listener_ssl_policy_default      = try(each.value.listener_ssl_policy_default, var.defaults.listener_ssl_policy_default, "ELBSecurityPolicy-2016-08")
  internal                         = try(each.value.internal, var.defaults.internal, false)
  load_balancer_create_timeout     = try(each.value.load_balancer_create_timeout, var.defaults.load_balancer_create_timeout, "10m")
  load_balancer_delete_timeout     = try(each.value.load_balancer_delete_timeout, var.defaults.load_balancer_delete_timeout, "10m")
  name                             = try(each.value.name, var.defaults.name, null)
  name_prefix                      = try(each.value.name_prefix, var.defaults.name_prefix, null)
  load_balancer_type               = try(each.value.load_balancer_type, var.defaults.load_balancer_type, "application")
  load_balancer_arn                = try(each.value.load_balancer_arn, var.defaults.load_balancer_arn, null)
  load_balancer_update_timeout     = try(each.value.load_balancer_update_timeout, var.defaults.load_balancer_update_timeout, "10m")
  access_logs                      = try(each.value.access_logs, var.defaults.access_logs, {})
  subnets                          = try(each.value.subnets, var.defaults.subnets, null)
  subnet_mapping                   = try(each.value.subnet_mapping, var.defaults.subnet_mapping, [])
  tags                             = try(each.value.tags, var.defaults.tags, {})
  lb_tags                          = try(each.value.lb_tags, var.defaults.lb_tags, {})
  target_group_tags                = try(each.value.target_group_tags, var.defaults.target_group_tags, {})
  # https_listener_rules_tags        = try(each.value.https_listener_rules_tags, var.defaults.https_listener_rules_tags, {})
  # http_tcp_listener_rules_tags     = try(each.value.http_tcp_listener_rules_tags, var.defaults.http_tcp_listener_rules_tags, {})
  # https_listeners_tags             = try(each.value.https_listeners_tags, var.defaults.https_listeners_tags, {})
  # http_tcp_listeners_tags          = try(each.value.http_tcp_listeners_tags, var.defaults.http_tcp_listeners_tags, {})
  security_groups                  = try(each.value.security_groups, var.defaults.security_groups, [])
  target_groups                    = try(each.value.target_groups, var.defaults.target_groups, [])
  vpc_id                           = try(each.value.vpc_id, var.defaults.vpc_id, null)
  # enable_waf_fail_open             = try(each.value.enable_waf_fail_open, var.defaults.enable_waf_fail_open, false)
  # desync_mitigation_mode           = try(each.value.desync_mitigation_mode, var.defaults.desync_mitigation_mode, "defensive")
  # putin_khuylo                     = try(each.value.putin_khuylo, var.defaults.putin_khuylo, true)
}
