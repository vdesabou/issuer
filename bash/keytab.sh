#!/usr/bin/env bash
keytab(){
  echo "Generating keytab"
  kadmin -kt /tmp/admin.keytab -p admin/admin -q "modprinc -maxrenewlife 11days +allow_renewable krbtgt/EXAMPLE.COM"
  kadmin -kt /tmp/admin.keytab -p admin/admin -q "addprinc -randkey $1"
  kadmin -kt /tmp/admin.keytab -p admin/admin -q "modprinc -maxlife 11days -maxrenewlife 11days +allow_renewable $1"
  kadmin -kt /tmp/admin.keytab -p admin/admin -q "ktadd -k $2 $1"
}