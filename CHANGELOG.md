# Changelog

## Release v1.1.0 (2026-04-28)

### Minor compatibility breaks

* Drop TLS 1.0 and 1.1 (RFC 8996, deprecated); minimum is TLS 1.2
* Replace cipher list with Mozilla "intermediate" AEAD-only suite (GCM, ChaCha20-Poly1305); CBC and SHA1-MAC ciphers no longer offered
* Stop re-emitting deprecated `X-Xss-Protection`; only strip it from upstream

### Features

* Add opt-in OCSP stapling via the new `with_ocsp_stapling` site flag (default `false`)
* Add `Permissions-Policy` header with a restrictive default (`camera=(), geolocation=(), microphone=(), interest-cohort=()`), overridable per site via the `permissions_policy` variable
* Add `site.basic-auth.conf.j2` for HTTP basic auth via per-site `htpasswd`

### Fix and enhancements

* Bump HSTS `max-age` from 1 year to 2 years and add `includeSubDomains`
* Strip upstream `Strict-Transport-Security` when `with_hsts` is enabled, so the edge owns HSTS (fixes duplicate headers when proxying upstreams that emit their own, e.g. GitLab's bundled nginx)
* Disable TLS session tickets (`ssl_session_tickets off`) - a leaked ticket key compromises forward secrecy retroactively
* Set `ssl_prefer_server_ciphers off` per Mozilla intermediate guidance
* Remove orphaned `inc/site.hsts.conf.j2` (HSTS lives in `site.ssl.conf.j2`)

## Release v1.0.0 (2025-01-20)

Initial release
