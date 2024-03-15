;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	footballmania.com. ns.footballmania. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	ns.footballmania.com.
@	IN	A	192.168.33.10
ns	IN	A	192.168.33.10
;@	IN	AAAA	::1
