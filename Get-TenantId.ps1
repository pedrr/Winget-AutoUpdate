$TenantID = ''

$DSReg = dsregcmd /status

$AADJ = $DSReg | Select-String AzureAdJoined
$AADJ = ($AADJ.tostring() -split ":")[1].trim()
if ($AADJ -eq "YES"){
    $TenantID = $DSReg | Select-String TenantId | Select-Object -First 1
    $TenantID = ($TenantID.tostring() -split ":")[1].trim()
}

$WPJ = $DSReg | Select-String WorkplaceJoined | Select-Object -First 1
$WPJ = ($WPJ.tostring() -split ":")[1].trim()
if ($WPJ -eq 'YES'){
    $TenantID = $DSReg | Select-String WorkplaceTenantId | Select-Object -First 1
    $TenantID = ($TenantID.tostring() -split ":")[1].trim()
}

$TenantID