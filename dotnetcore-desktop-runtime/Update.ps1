. $PSScriptRoot\..\dotnetcore-desktop-runtime.install\update.ps1

function global:au_SearchReplace {
    Write-Host "---- $Latest ---"
   @{
        ".\$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { update -ChecksumFor none }