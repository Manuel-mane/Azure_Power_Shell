### Connecting to my Azure account 
Connect-AzAccount

### Creating a new DNS zone
$RSGroup = "1-d672b6ac-playground-sandbox"
New-AzDnsZone -name contoso.x23y -ResourceGroupName $RSGroup

### Creating a DNS Record
New-AzDnsRecordSet -Name wwww -RecordType A -ZoneName contoso.x23y -ResourceGroupName $RSGroup -Ttl 3600 -DnsRecords `
(New-AzDnsRecordConfig -Ipv4Address "10.11.11.11")

### Listing the DNS records in my zone
Get-AzDnsRecordSet -ZoneName contoso.x23y -ResourceGroupName $RSGroup -RecordType NS

### Testing the name resolution. Copy one of the server from the output of the commnand from before and 
### run on the command line: nslookup www.contoso.x23y <name server name> 