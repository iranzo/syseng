#!/bin/bash
# Description: Generate CA for signing later certificates
# Author: Pablo Iranzo Gómez (Pablo.Iranzo@gmail.com) // https://iranzo.github.io

cat > ca-config.json <<EOF
{
  "signing": {
    "default": {
      "expiry": "8760h"
    },
    "profiles": {
      "kubernetes": {
        "usages": ["signing", "key encipherment", "server auth", "client auth"],
        "expiry": "8760h"
      }
    }
  }
}
EOF

cat > ca-csr.json <<EOF
{
  "CN": "Kubernetes",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "US",
      "L": "Austin",
      "O": "Kubernetes",
      "OU": "TX",
      "ST": "Texas"
    }
  ]
}
EOF
