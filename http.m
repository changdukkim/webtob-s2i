*DOMAIN
webtob1

*NODE
webtob	WEBTOBDIR="/root/webtob", 
		SHMKEY = 54000,
		DOCROOT="/root/webtob/docs",
		PORT = "8080", 
		HTH = 1,
		#Group = "nobody",
		#User = "nobody",
		NODENAME = "$(NODENAME)",
		ERRORDOCUMENT = "503",
		#Options="IgnoreExpect100Continue",
		#JSVPORT = 9900,
		LOGGING = "log1",
		ERRORLOG = "log2",
		SYSLOG = "syslog"

*SVRGROUP
htmlg		NODENAME = "webtob", SVRTYPE = HTML
cgig		NODENAME = "webtob", SVRTYPE = CGI
ssig		NODENAME = "webtob", SVRTYPE = SSI

*SERVER
html		SVGNAME = htmlg, MinProc = 2, MaxProc = 10, ASQCount = 1 
cgi		SVGNAME = cgig, MinProc = 2, MaxProc = 10, ASQCount = 1 
ssi 		SVGNAME = ssig, MinProc = 2, MaxProc = 10, ASQCount = 1

*URI
uri1		Uri = "/cgi-bin/",   Svrtype = CGI

*ALIAS
alias1		URI = "/cgi-bin/", RealPath = "/root/webtob/cgi-bin/"

*LOGGING
syslog		Format = "SYSLOG", FileName = "/root/webtob/log/system.log_%M%%D%%Y%",
			Option = "sync"
log1		Format = "DEFAULT", FileName = "/root/webtob/log/access.log_%M%%D%%Y%", 
			Option = "sync"
log2		Format = "ERROR", FileName = "/root/webtob/log/error.log_%M%%D%%Y%", 
			Option = "sync"

*ERRORDOCUMENT
503			status = 503,
			url = "/503.html"

*EXT
htm			MimeType = "text/html", SvrType = HTML


