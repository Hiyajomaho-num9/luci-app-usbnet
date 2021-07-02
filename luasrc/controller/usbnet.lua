module("luci.controller.usbnet", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/usbnet") then
		return
	end
	entry( {"admin", "network", "usbnet"}, cbi("usbnet"), _("usbnet"), 59).dependent = true
	entry( {"admin", "network", "usbnet", "get_log"}, call("get_log")).leaf = true
	entry( {"admin", "network", "usbnet", "clear_log"}, call("clear_log")).leaf = true
end

function get_log()
    luci.http.write(luci.sys.exec("cat /tmp/log/usbnet.log 2>/dev/null"))
end

function clear_log()
    luci.sys.call("echo '' > /tmp/log/usbnet.log")
end
