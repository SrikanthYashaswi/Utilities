# Utilities

>Helpful tools developed while working on projects

----
**Logread**
> Extract information from huge log files by providing a starting pattern and ending pattern


* -n (from first pattern, get n subsequent lines)
* -p (from first pattern, get all lines till second pattern is found)

*examples.*

    ./logread.sh "2018-05-12" -p "2018-05-13"
    ./logread.sh "2018-05-12" -n 30
----
