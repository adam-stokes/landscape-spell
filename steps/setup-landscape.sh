sudo apt-get -qq update && sudo apt-get -qqyf install landscape-api
landscape-api call BootstrapLDS --json admin_email="$LDS_EMAIL" admin_name="$LDS_NAME" admin_password="$LDS_PASSWORD" --uri https://$HAPROXY/api/ --ssl-ca-file /etc/ssl/certs/landscape_server_ca.crt > $HOME/creds
export LANDSCAPE_API_KEY=$(cat $HOME/creds|python -c "import sys,yaml; print(yaml.load(sys.stdin))['LANDSCAPE_API_KEY']")
export LANDSCAPE_API_SECRET=$(cat $HOME/creds|python -c "import sys,yaml; print(yaml.load(sys.stdin))['LANDSCAPE_API_SECRET']")
landscape-api call RegisterMAASRegionController --json endpoint="$MAAS_ENDPOINT" credentials="$MAAS_APIKEY" --uri https://$HAPROXY/api/ --ssl-ca-file /etc/ssl/certs/landscape_server_ca.crt > /dev/null 2>&1
