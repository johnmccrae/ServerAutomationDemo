[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$ResourceGroupName
)

#requires -Module Az.Accounts,Az.Resources

$VerbosePreference = 'Continue'

describe 'Template validation' {
    it 'template passes validation check' {
        $parameters = @{
            TemplateFile      = 'server.json'
            ResourceGroupName = $ResourceGroupName
            adminUsername     = 'adam'
            adminPassword     = (ConvertTo-SecureString -String 'testing' -AsPlainText -Force)
            vmName            = 'TESTING'
        }
        (Test-AzResourceGroupDeployment @parameters -Verbose).Details | should -Benullorempty
    }
}