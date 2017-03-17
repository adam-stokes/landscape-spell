sudo apt-get -qq update > /dev/null 2>&1
sudo apt-get -qqyf install landscape-api > /dev/null 2>&1
landscape-api call BootstrapLDS --json admin_email="$LDS_EMAIL" admin_name="$LDS_NAME" admin_password="$LDS_PASSWORD" --uri https://$HAPROXY/api/ --ssl-ca-file /etc/ssl/certs/landscape_server_ca.crt > /dev/null 2>&1
# export LANDSCAPE_API_KEY=$(echo $CREDS|python -c "import sys,yaml; print(yaml.load(sys.stdin))['LANDSCAPE_API_KEY']")
# export LANDSCAPE_API_SECRET=$(echo $CREDS|python -c "import sys,yaml; print(yaml.load(sys.stdin))['LANDSCAPE_API_SECRET']")
# Dont register against MAAS until AutoPilot works with MAAS v2+
# landscape-api call RegisterMAASRegionController --json endpoint="$MAAS_ENDPOINT" credentials="$MAAS_APIKEY" --uri https://$HAPROXY/api/ --ssl-ca-file /etc/ssl/certs/landscape_server_ca.crt > /dev/null 2>&1
