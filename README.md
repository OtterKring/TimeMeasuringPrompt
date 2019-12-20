# PS_TimeMeasuringPrompt
A prompt function for PowerShell which shows the runtime of the previously executed command at the right of the screen

The function takes the default prompt line from the original PS prompt function (get-content function:prompt) and adds code
to retrieve the runtime of the previous command from the command history, taking in account that it must handle this differently
in PS versions old than 6 and 6 upwards.

The measured time is formatted depending on the amount of time passed and writen to the end of the input line to save on save at the
line start. This way it can just be overwritten when writing long commands instead of making the the left side prompt unnecessarily long.
