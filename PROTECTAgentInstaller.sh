#!/bin/sh -e
# ESET PROTECT
# Copyright (c) 1992-2024 ESET, spol. s r.o. All Rights Reserved

cleanup_file="$(mktemp -q)"
finalize()
{
  set +e
  if test -f "$cleanup_file"
  then
    while read f
    do
      rm -f "$f"
    done < "$cleanup_file"
    rm -f "$cleanup_file"
  fi
}

trap 'finalize' HUP INT QUIT TERM EXIT

eraa_server_hostname="csetup2xxaxexjky36xrz4i47u.a.ecaserver.eset.com"
eraa_server_port="443"
eraa_server_company_name='Anthem Properties Group Ltd.'
eraa_peer_cert_b64="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"
eraa_peer_cert_pwd=""
eraa_ca_cert_b64="MIIFpDCCA4ygAwIBAgIIMUSW0eFkh/8wDQYJKoZIhvcNAQELBQAwaDELMAkGA1UEBhMCU0sxGDAWBgNVBAgTD1Nsb3ZhayBSZXB1YmxpYzETMBEGA1UEBxMKQnJhdGlzbGF2YTENMAsGA1UEChMERXNldDEbMBkGA1UEAxMSRVBDIEFnZW50IHByb3h5IENBMB4XDTIyMDYyMDAwMDAwMFoXDTMyMDYxOTIzNTk1OVowaDELMAkGA1UEBhMCU0sxGDAWBgNVBAgTD1Nsb3ZhayBSZXB1YmxpYzETMBEGA1UEBxMKQnJhdGlzbGF2YTENMAsGA1UEChMERXNldDEbMBkGA1UEAxMSRVBDIEFnZW50IHByb3h5IENBMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEApFyygZ31hn6s/K7+Lm/r3KP+P5Gn0pb5J6IR0F+KtBUiNE9nRn5PnVDdyj9uVd6BZIKcczoHebH/70GQUuOzprDtHhWUTNDZ7R4NfNz0u5cYn2mKPk9lJRPEcuvqKr+aGsCs1yMv226xd72ngJE/Z2MlGLGX5+kuO0HmQWRUK/SDtmcCvforHs7zE19PjXmZQnpW+bUFkLeHcHS4WtJ64CNkbuTHssK8nNDQoJXLZVKafLWCkAZ94vpZWDRG5AffdBDnKrSy+WOTI6dOJw8i+uJ7YtWconTJo9NRCcgTzCHujylXgqWkwm3f+Wh/h0u5KIJEzTPN/RTzP+/SWEDrYi7+wECXWv6kU3Ty3KkzPGsAt9ABmnvAUGShi8Heyhnes6E3IiUt3wko+LHVw9hFyXFjfqtgRtxvOTcX06zinpQbtl+d1Wm7mU/ORFIPffRec4B9YewF1VRCm4gT5vqFZbO7BUnuyKFeGr6Vxlgrgz0mPS0PAoATI500x9g8Md3Mmshc/6wLInMHgSh//n+aylnePRrTvLEJhcWgoDx57wZ7G5fTeHEFIRrcU3ez6PSKbodCBcjfWrGLkXNQzmIwhDxVRmo4DXLga6MzbYqU54zQVfk60CiFEvwwK8l7WBZ7XlqxRl8QmsIUGf278N8Hxe0qOs7fcZPvuVHyhS4WKxsCAwEAAaNSMFAwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUZ9DJSflsyGkpLas5Ll3dMzeMJSEwCwYDVR0PBAQDAgEGMBEGCWCGSAGG+EIBAQQEAwIABzANBgkqhkiG9w0BAQsFAAOCAgEAWrXSFAd4OmT0bxHj1q+zMROTxXalzfAfqncTGaTm2NiqL5be3WfgnQLjGOMX+VVC1YXDlI2xs2JAWD3myRT4u7g1Y320HmjWczaE36h8PrnL+M/LEIHem3bM7e6ZFGHzwN80D5bmM++qacrGnnSDXid/sVx2Vi5KKXOXcFB74Haef5mqVm9uNpjDuUO+7Zdip6xqieHOpYD7HIWCkq/bJXxyrPr9CY37KyVdeMoU8QuIzdlgn5l0yc8LNBXXv7pba+ykPirIWe1ZR0O0z5e0gAqUe0kz9fpiMmzWpaGS/4s8gt0oYX2Ahibc3Lgg179OOpUFOsz92TmPVQCnzseZCPirikCA7qUAmMFKqs+l+X6DdKIrL4ocHs5zFAL9fysdKpczKczAWpZXr9LtuY6WFDkcWhxm4kj1MXyte8UBBC4C1UX47Km5TlOQUApnp7LMXI3jlBB+2Lo3T9N2FhiQ5R2PoNdA+XONNaBb8E9mh83wOvA6+Me1Rb7bIO6q/dTULd41Jns3JQ8zy0H8rQrOSOREWfieW0Czd38ZRJoa7MRp6Z3aYAuqt8pJpOykVbKQY/OYh43pt5gfgFvIkI3CuoJvLPQ3bYKyBiJN8PYhFpOyLYOrOJqbd26x+QFORgiBdZo6u6Em31l3fVpiaMcSAD9Cny6VUEC2aYn00beB2Vc="
eraa_product_uuid=""
eraa_initial_sg_token=""
eraa_policy_data=""

arch=$(uname -m)
eraa_installer_url="http://repository.eset.com/v1/com/eset/apps/business/era/agent/v12/12.0.1100.0/agent_linux_i386.sh"
eraa_installer_checksum="550682a41a1244314d3a04753ec8de928a22769022b6420d6fd88404c46c0623"

if $(echo "$arch" | grep -E "^(x86_64|amd64)$" 2>&1 > /dev/null)
then
    eraa_installer_url="http://repository.eset.com/v1/com/eset/apps/business/era/agent/v12/12.0.1100.0/agent_linux_x86_64.sh"
    eraa_installer_checksum="815d1951c885b25af07d658ee7154b4aeebb70e342e1f53e0067d2bcc73a78da"
else
    if $(echo "$arch" | grep -E "^(aarch64|arm64)$" 2>&1 > /dev/null)
    then
        eraa_installer_url=""
        eraa_installer_checksum=""
    fi
fi

echo "ESET Management Agent live installer script. Copyright © 1992-2024 ESET, spol. s r.o. - All rights reserved."

if test ! -z "$eraa_server_company_name"
then
  echo " * CompanyName: $eraa_server_company_name"
fi
echo " * Hostname: $eraa_server_hostname"
echo " * Port: $eraa_server_port"
echo " * Platform: $arch"
echo " * Installer: $eraa_installer_url"
echo

if test -z "$eraa_installer_url"
then
  echo "No installer available for '$arch' arhitecture."
  exit 1
fi

local_cert_path="$(mktemp -q -u)"
echo $eraa_peer_cert_b64 | base64 -d > "$local_cert_path" && echo "$local_cert_path" >> "$cleanup_file"

if test -n "$eraa_ca_cert_b64"
then
  local_ca_path="$(mktemp -q -u)"
  echo $eraa_ca_cert_b64 | base64 -d > "$local_ca_path" && echo "$local_ca_path" >> "$cleanup_file"
fi


eraa_http_proxy_value=""

local_installer="$(dirname $0)"/"$(basename $eraa_installer_url)"

if $(echo "$eraa_installer_checksum  $local_installer" | sha256sum -c 2> /dev/null > /dev/null)
then
    echo "Verified local installer was found: '$local_installer'"
else
    local_installer="$(mktemp -q -u)"

    echo "Downloading ESET Management Agent installer..."

    if test -n "$eraa_http_proxy_value"
    then
      export use_proxy=yes
      export http_proxy="$eraa_http_proxy_value"
      (wget --connect-timeout 300 --no-check-certificate -O "$local_installer" "$eraa_installer_url" || wget --connect-timeout 300 --no-proxy --no-check-certificate -O "$local_installer" "$eraa_installer_url" || curl --fail --connect-timeout 300 -k "$eraa_installer_url" > "$local_installer") && echo "$local_installer" >> "$cleanup_file"
    else
      (wget --connect-timeout 300 --no-check-certificate -O "$local_installer" "$eraa_installer_url" || curl --fail --connect-timeout 300 -k "$eraa_installer_url" > "$local_installer") && echo "$local_installer" >> "$cleanup_file"
    fi

    if test ! -s "$local_installer"
    then
       echo "Failed to download installer file"
       exit 2
    fi

    echo -n "Checking integrity of installer script " && echo "$eraa_installer_checksum  $local_installer" | sha256sum -c
fi

chmod +x "$local_installer"

command -v sudo > /dev/null && usesudo="sudo -E" || usesudo=""

export _ERAAGENT_PEER_CERT_PASSWORD="$eraa_peer_cert_pwd"

echo
echo Running installer script $local_installer
echo

$usesudo /bin/sh "$local_installer"\
   --skip-license \
   --hostname "$eraa_server_hostname"\
   --port "$eraa_server_port"\
   --cert-path "$local_cert_path"\
   --cert-password "env:_ERAAGENT_PEER_CERT_PASSWORD"\
   --cert-password-is-base64\
   --initial-static-group "$eraa_initial_sg_token"\
   \
   --disable-imp-program\
   $(test -n "$local_ca_path" && echo --cert-auth-path "$local_ca_path")\
   $(test -n "$eraa_product_uuid" && echo --product-guid "$eraa_product_uuid")\
   $(test -n "$eraa_policy_data" && echo --custom-policy "$eraa_policy_data")
