# comp_
Comp_ is a Racket threading macro which composes functions in order, using a '_' placeholder to pass values.

Example:
<pre>
((comp_ (string-append "1" _ "3")
        (string-append _ "end"))
   "2")
-> "123end"
</pre>
