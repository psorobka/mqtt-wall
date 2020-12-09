echo "Set MQTT host to $HOST"
sed -i -e "s,ws://localhost:8080/,$HOST,g" /usr/share/nginx/html/index.html
echo "Set MQTT username to $USERNAME"
sed -i -e "s,//username: \"\",$USERNAME,g" /usr/share/nginx/html/index.html
echo "Set MQTT password to $PASSWORD"
sed -i -e "s,//password: \"\",$PASSWORD,g" /usr/share/nginx/html/index.html

nginx -g 'daemon off;'
