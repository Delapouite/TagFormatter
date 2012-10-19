TagFormatter
============

Custom Formatter for Caterpillar focused on log entries filtering.

Add tag(s) between separated by a comma between a pair of square brackets at the beginning of your log messages :
```
Welcome to software
[network] Request sent
[ui,network] Spinner hidden
[memory] Answer saved
```

Specify the white list of tags you want to keep in the output in the white list at the top of the file
```
displayedTags = ['ui']
```
Only the third line will be displayed
```
displayedTags = ['ui', 'memory']
```
Line 3 and 4 will be present in the output
```
displayedTags = ['network']
```
Line 2 and 3