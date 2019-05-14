#lang racket
(provide comp_)
(module+ test (require rackunit))

;;; purpose

; an in-order variant of ComposeX
; Example:
; ((comp_ (string-append "1" _ "3")
;         (string-append _ "end"))
;    "2")
; -> "123end"

;;; defs

; returns a function that composes parameters in order,
; using a placeholder _ for passing values between functions.
(define-syntax (comp_ stx)
  ; macro to compose functions passing an '_' parameter
  (syntax-case stx ()
    ((_ f1 ...)
     (with-syntax ([x-var (datum->syntax stx '_)])
       #'(apply compose1 (reverse (list (λ (x-var) f1) ...)))))))
; unit test
(module+ test
  (check-equal? ((comp_ (string-trim _)
                        (string-downcase _)
                        (string-replace _ " " "-")
                        ) "Hello World")
                "hello-world"))

; EOF
