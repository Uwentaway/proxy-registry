curl -sL https://get.acme.sh | sh -s email=aautoops@163.com
source ~/.bashrc
~/.acme.sh/acme.sh  --upgrade  --auto-upgrade
~/.acme.sh/acme.sh --set-default-ca --server letsencrypt

dnsname=registry.gcrio.dns.army
dnsname=k8s.gcrio.dns.army

acme.sh --issue -d $dnsname -w /var/www/html/

acme.sh --install-cert -d $dnsname \
	--key-file /etc/nginx/ssl/$dnsname.key \
	--fullchain-file /etc/nginx/ssl/fullchain.cer \
	--reloadcmd "systemctl reload nginx"
