(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(auto-compression-mode t nil (jka-compr))
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backup"))))
 '(blink-matching-paren-on-screen t)
 '(case-fold-search t)
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(focus-follows-mouse t)
 '(frame-title-format (quote (:eval (concat "(" user-login-name "@" (nth 0 (split-string system-name "\\.")) ") " invocation-name ": " (if buffer-file-name default-directory "%b %+%+%f")))) t)
 '(fringe-mode (quote (1 . 1)) nil (fringe))
 '(global-font-lock-mode t nil (font-lock))
 '(mail-host-address "akamai.com")
 '(message-send-mail-function (quote message-send-mail-with-sendmail))
 '(message-sendmail-extra-arguments (quote ("-a" "default")))
 '(mouse-autoselect-window t)
 '(mouse-wheel-mode t nil (mwheel))
 '(recentf-max-menu-items 25)
 '(recentf-max-saved-items 25)
 '(require-final-newline t)
 '(save-place t nil (saveplace))
 '(scheme-program-name "scheme")
 '(show-paren-mode t nil (paren))
 '(show-paren-style (quote parenthesis))
 '(tex-default-mode (quote tex-pdf-mode))
 '(transient-mark-mode t)
 '(truncate-partial-width-windows nil)
 '(user-full-name "Christian Ternus")
 '(user-mail-address "cternus@akamai.com")
 '(vc-delete-logbuf-window nil)
 '(weblogger-config-alist (quote (("default" "http://ternus.scripts.mit.edu/blog/xmlrpc.php" "ternus" "" "1")))))

(setq auto-mode-alist (cons '("\\.org.*$" . org-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("emacs$" . lisp-mode) auto-mode-alist))
(setq auto-mode-alist (cons '(".*TODO.*$" . org-mode) auto-mode-alist))

(setq message-kill-buffer-on-exit t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
					; NON BUILTINS GO BELOW THIS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d")

					;(require 'notmuch)

					;(setq notmuch-saved-searches '(("inbox" . "tag:inbox")
					;                    ("unread" . "tag:inbox AND tag:unread")
					;                    ("secarch" . "tag:secarch")
					;                    ("white-hat" . "tag:white-hat")))

					;(add-hook 'message-setup-hook 'mml-secure-message-sign-pgpmime)

					;(setq sendmail-program "/usr/bin/msmtp")
(require 'ido)
(ido-mode 'both)


(windmove-default-keybindings 'meta)

;; (require 'font-lock)
;; (setq font-lock-face-attributes
;;       '((font-lock-comment-face		 "Firebrick")
;; 	(font-lock-string-face	    "SpringGreen4")
;; 	(font-lock-keyword-face		  "RoyalBlue")
;; 	(font-lock-function-name-face	  "Blue")
;; 	(font-lock-variable-name-face	  "GoldenRod")
;; 	(font-lock-type-face	    "DarkGoldenRod")
;; ;;	(font-lock-reference-face   "Purple")
;; 	))

(global-set-key "\C-c\C-g" 'goto-line)
(setq inhibit-startup-message t)
(setq font-lock-maximum-decoration t) 
(add-hook 'after-init-hook (global-font-lock-mode t))
(mouse-wheel-mode t)
					;(pc-selection-mode)
(global-set-key [vertical-scroll-bar mouse-1] 'scroll-bar-drag)
(global-set-key [vertical-scroll-bar drag-mouse-1] 'scroll-bar-drag)
(setq make-backup-files nil
      backup-inhibited t)
(which-function-mode)
(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode t)

(if 
    (eq window-system 'X)
    (tool-bar-mode 0))
(global-set-key [insert] (lambda () (interactive)))
(global-set-key [insertchar] (lambda () (interactive)))
(define-key ctl-x-map "F" 'find-function)
(define-key ctl-x-map "V" 'find-variable)
(defalias 'perl-mode 'cperl-mode)
(require 'savehist)
					;(require 'gnus-art)

(savehist-load)

(put 'erase-buffer 'disabled nil)

;; (global-set-key [(tab)] 'smart-tab)
;; (defun smart-tab ()
;;   "This smart tab is minibuffer compliant: it acts as usual in
;;     the minibuffer. Else, if mark is active, indents region. Else if
;;     point is at the end of a symbol, expands it. Else indents the
;;     current line."
;;   (interactive)
;;   (if (minibufferp)
;;       (unless (minibuffer-complete)
;;         (dabbrev-expand nil))
;;     (if mark-active
;;         (indent-region (region-beginning)
;;                        (region-end))
;;       (if (looking-at "\\_>")
;;           (dabbrev-expand nil)
;;         (indent-for-tab-command)))))

;; (defun indent-or-expand (arg)
;;   "Either indent according to mode, or expand the word preceding
;; point."
;;   (interactive "*P")
;;   (if (and
;;        (or (bobp) (= ?w (char-syntax (char-before))))
;;        (or (eobp) (not (= ?w (char-syntax (char-after))))))
;;       (dabbrev-expand arg)
;;     (indent-according-to-mode)))

;; (defun my-tab-fix ()
;;   (local-set-key [tab] 'indent-or-expand))

;; (add-hook 'c-mode-hook          'my-tab-fix)
;; (add-hook 'python-mode-hook 	'my-tab-fix)
;; (add-hook 'sh-mode-hook         'my-tab-fix)
;; (add-hook 'emacs-lisp-mode-hook 'my-tab-fix)

;; more mode hooks, yada yada, etc ...
(setq package-enable-at-startup nil)

(require 'package)
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)


;; (require 'company)
;; (require 'company-go)                                ; load company mode go backend
;; (setq company-tooltip-limit 20)                      ; bigger popup window
;; (setq company-minimum-prefix-length 0)               ; autocomplete right after '.'
;; (setq company-idle-delay .3)                         ; shorter delay before autocompletion popup
;; (setq company-echo-delay 0)                          ; removes annoying blinking
;; (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
;; (add-hook 'go-mode-hook (lambda ()
;; 			  (set (make-local-variable 'company-backends) '(company-go))
;; 			  (company-mode)))



;; ;; Word count!
(defun word-count (&optional filename)
  "Returns the word count of the current buffer.  If `filename' is not nil, returns the word count of that file."
  (interactive)
  (save-some-buffers) ;; Make sure the current buffer is saved
  (let ((tempfile nil))
    (if (null filename)
        (progn
          (let ((buffer-file (buffer-file-name))
                (lcase-file (downcase (buffer-file-name))))
            (if (and (>= (length lcase-file) 4) (string= (substring lcase-file -4 nil) ".tex"))
                ;; This is a LaTeX document, so DeTeX it!
                (progn
                  (setq filename (make-temp-file "wordcount"))
                  (shell-command-to-string (concat "detex < " buffer-file " > " filename))
                  (setq tempfile t))
              (setq filename buffer-file)))))
    (let ((result (car (split-string (shell-command-to-string (concat "wc -w " filename)) " "))))
      (if tempfile
          (delete-file filename))
      (message (concat "Word Count: " result)))))

					;(server-start)

					;(shell)

					;(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
