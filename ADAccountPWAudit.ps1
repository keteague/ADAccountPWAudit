$groupMembers = (Get-ADGroupMember "Domain Admins").SamAccountName

$output = ForEach ($groupMember in $groupMembers) {
    Get-ADUser -Identity $groupMember -Properties Created,LastLogonDate,PasswordLastSet | Select-Object -Property Name, SAMAccountName, Created, LastLogonDate, PasswordLastSet
}

$output | Export-Csv 'C:\temp\GroupMembers.csv'