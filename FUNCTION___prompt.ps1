function prompt {
    # Check PS version to decide on available data
    if ($PSVersionTable.PSVersion.Major -lt 6) {
        $Duration = Get-History -Count 1 | Foreach-Object { $_.EndExecutionTime - $_.StartExecutionTime}
    } else {
        $Duration = (Get-History -Count 1).Duration
    }

    # change output format depending on amount of time passed
    switch ($Duration) {
        {$_.TotalMinutes -gt 1} {$time = "{0:mm}m{0:ss}s" -f $_; break}
        {$_.TotalSeconds -gt 1} {$time = "{0:n2}s" -f $_.TotalSeconds; break}
        {$_.TotalMilliseconds -gt 1} {$time = "{0:n2}ms" -f $_.TotalMilliseconds; break}
        Default {}
    }

    [console]::CursorLeft = [console]::WindowWidth - $time.Length - 1       # get maximum window with minus length of our time string minus 1 (just to be sure)
    [console]::Write($time)                                                 # write passed time. Used [console]::Write instead of Write-Host -NoNewline for increased performance
    [console]::CursorLeft = 0                                               # go back to the beginning of the line
    "PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) "       # Original prompt line
}
