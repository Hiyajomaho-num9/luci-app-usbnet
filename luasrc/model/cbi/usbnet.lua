m=Map("usbnet",translate("usbnet"),
translate("Used to waste the GPRS data traffic of the mobile phone 2G, 3G, 4G, 5G band"))

s=m:section(TypedSection,"usbnet")
s.anonymous=true

o=s:option(Flag,"enabled", translate("Enabled"))
o.rmempty=false

o=s:option(Flag,"ipv4",translate("Enabled IPV4"))
o.default=0
o.rmempty=false

o=s:option(Flag,"ipv6",translate("Enabled IPV6"))
o.default=0
o.rmempty=false

if nixio.fs.access("/etc/init.d/mwan3") then
o=s:option(Flag,"mwan3",translate("Automatically configure load balancing"))
o.default=0
o.rmempty=false
o.description = translate("Automatically configure USB network interfaces to load balancing")
end

m:append(Template("usbnet/usbnet"))

return m
