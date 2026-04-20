
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Desktop file


;; load desktop 

(require 'desktop)
(setq desktop-save-path (list "~/.emacs.d/"))
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
(desktop-change-dir desktop-dirname)

(setq desktop-buffers-not-to-save
      (concat "\\("
              "\\.log\\|(ftp)\\|^tags\\|^TAGS"
              "\\|\\.emacs.*\\|\\.diary\\|\\.newsrc-dribble\\|\\.bbdb"
              "\\)$"))

(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)


(setq history-length 512)
(add-to-list 'desktop-globals-to-save 'file-name-history)


;; Desktop auto save every 10 minutes
(defun my-desktop-save ()
  ;; (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))

;;(add-hook 'auto-save-hook 'my-desktop-save)

;; Customization goes between desktop-load-default and desktop-read
(add-to-list 'desktop-globals-to-save 'file-name-history)




;; (transient-mark-mode 1)  ; Now on by default: makes the region act quite like the text "highlight" in many apps.
;; (setq shift-select-mode t) ; Now on by default: allows shifted cursor-keys to control the region.
(setq mouse-drag-copy-region nil)  ; stops selection with a mouse being immediately injected to the kill ring
(setq x-select-enable-primary nil)  ; stops killing/yanking interacting with primary X11 selection
(setq x-select-enable-clipboard t)  ; makes killing/yanking interact with clipboard X11 selection
;; these will probably be already set to these values, leave them that way if so!
;; (setf interprogram-cut-function 'x-select-text)
;; (setf interprogram-paste-function 'x-cut-buffer-or-selection-value)
;; You need an emacs with bug #902 fixed for this to work properly. It has now been fixed in CVS HEAD.
;; it makes "highlight/middlebutton" style (X11 primary selection based) copy-paste work as expected
;; if you're used to other modern apps (that is to say, the mere act of highlighting doesn't
;; overwrite the clipboard or alter the kill ring, but you can paste in merely highlighted
;; text with the mouse if you want to)
(setq select-active-regions t) ;  active region sets primary X11 selection
(global-set-key [mouse-2] 'mouse-yank-primary)  ; make mouse middle-click only paste from primary X11 selection, not clipboard and kill ring.
;; with this, doing an M-y will also affect the X11 clipboard, making emacs act as a sort of clipboard history, at
;; least of text you've pasted into it in the first place.
;; (setq yank-pop-change-selection t)  ; makes rotating the kill ring change the X11 clipboard.




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start EMACS server
(server-start)

(autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode." t)
(setq auto-mode-alist (append '(("\\.\\(frm\\|bas\\|vbs\\|vb\\|cls\\|rvb\\)$" .
                                 visual-basic-mode)) auto-mode-alist))

(autoload 'makefile-gmake-mode "makefile-mode" "Makefile mode." t)
(setq auto-mode-alist (append '(("Makefile.*" .
                                 makefile-gmake-mode)) auto-mode-alist))
(require 'grep-edit)

;; Don't warn when reloading log files
(setq revert-without-query '(".*\\.txt" ".*\\.log"))

;; ido is fantastic!
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set various preferences

(defun set-all-vars ()
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(default-tab-width 4 t)
   '(tab-width 4)
   '(auto-compression-mode t nil (jka-compr))
   '(c-basic-offset tab-width)
   '(c-default-style (quote ((c-mode . "bsd") (java-mode . "java") (awk-mode . "awk") (other . "bsd"))))
   '(case-fold-search t)
   '(column-number-mode t)
   '(current-language-environment "English")
   '(debug-on-error nil)
   '(desktop-load-locked-desktop t)
   '(display-time-mode t)
   '(global-font-lock-mode t nil (font-lock))
   '(desktop-save-mode t) 

   '(ecb-eshell-fit-window-to-command-output nil)
   '(ecb-layout-window-sizes nil)
   '(ecb-source-path (quote ("./" "../common" "../include" "./include" "/usr/include")))
   '(ecb-tip-of-the-day nil)
   '(ecb-use-speedbar-instead-native-tree-buffer (quote dir))
   '(ecb-windows-width 0.2)
   '(ediff-split-window-function (quote split-window-horizontally))
   '(eshell-windows-shell-file "/usr/bin/bash")

   '(global-semantic-decoration-mode t nil (semantic-decorate-mode))
   '(global-semantic-folding-mode t nil (semantic-util-modes))
   '(global-semantic-highlight-func-mode t nil (semantic-util-modes))
   '(global-semantic-idle-completions-mode t nil (semantic-idle))
   '(global-semantic-idle-scheduler-mode t nil (semantic-idle))
   '(global-semantic-idle-summary-mode t nil (semantic-idle))
   '(global-semantic-mru-bookmark-mode t nil (semantic-util-modes))
   '(global-semantic-stickyfunc-mode t nil (semantic-util-modes))
   '(global-semantic-tag-folding-mode t nil (semantic-util-modes))
   '(semantic-c-dependency-system-include-path (quote ("./include" "../include" "./" "../common")))
   '(semantic-c-obey-conditional-section-parsing-flag nil)
   '(semantic-decoration-styles (quote (("semantic-tag-folding" . t) ("semantic-tag-folding-decoration" . t) ("semantic-decoration-on-protected-members" . t) ("semantic-decoration-on-private-members" . t) ("semantic-tag-boundary" . t))))
   '(semantic-idle-scheduler-idle-time 20)
   '(semantic-tag-folding-show-tooltips t)
   '(semanticdb-default-file-name "semantic.cache")
   '(semanticdb-global-mode t nil (semanticdb))
   '(semanticdb-persistent-path (quote (always)))


   '(ido-create-new-buffer (quote always))
   '(ido-enable-flex-matching t)
   '(ido-mode (quote buffer) nil (ido))
   '(indent-tabs-mode nil)
   '(minibuffer-auto-raise t)
   '(minibuffer-depth-indicate-mode t)
   '(minibuffer-electric-default-mode t)
   '(minibuffer-frame-alist (quote ((width . 80) (height . 2))))
   '(minibuffer-prompt-properties (quote (read-only t face minibuffer-prompt)))
   '(nxhtml-skip-welcome t)
   '(save-place t nil (saveplace))

   '(shell-file-name "/usr/bin/bash")
   '(show-paren-mode t nil (paren))
   '(uniquify-buffer-name-style (quote forward) nil (uniquify))
   '(widget-menu-minibuffer-flag t)
   '(use-file-dialog nil)

   )
  )

(set-all-vars)



(set-face-background 'default "white")
(set-face-foreground 'default "black") 
(require 'font-lock)

(line-number-mode t)            ; show line numbers in the mode-line
(column-number-mode t)          ; show column numbers in the mode-line

(setq auto-mode-alist (cons '("\\.sco$" . csound-sco-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.csd$" . csound-sco-mode) auto-mode-alist))
(autoload 'csound-sco-mode "csound-sco" "Csound Score major mode." t)

(delete-selection-mode 1)       ; delete the selection area with a keypress
(setq scroll-step 1)            ; scroll one line at a time
(fset 'yes-or-no-p 'y-or-n-p)   ; enable one letter y/n answers to yes/no 

(setq x-select-enable-clipboard t) ; copy-paste should work

(setq inhibit-startup-message t)           ; don't show startup
(setq inhibit-startup-echo-area-message t) ;  crap



; what should a frame look like
(setq frame-title-format '("%b (%m)" )  ; "filename (mode)" in title bar
      icon-title-format '("%b"))        ; "filename" in icon

(define-key global-map (kbd "M-r") 'revert-buffer)   ; revert buffer from file with alt-r

(define-key global-map (kbd "C-<tab>") 'dabbrev-expand)   ; completion with ctrl-tab


(define-key global-map (kbd "<backspace>") 'delete-backward-char) ; bs means bs 
(define-key global-map (kbd "<delete>")    'delete-char)  ; delete means delete         
(define-key global-map (kbd "M-g")         'goto-line)    ; M-g means 'goto-line


; isearch - the defaults are _so_ annoying...
(define-key isearch-mode-map (kbd "<backspace>") 'isearch-del-char) ; bs means bs 
(define-key isearch-mode-map (kbd "<delete>")    'isearch-delete-char)  ; delete means delete         
(define-key isearch-mode-map (kbd "C-<insert>")  'isearch-yank-x-selection) 

;; Enable recent files mode
(recentf-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; backups  (emacs will write backups and number them)
;;
(setq make-backup-files t ; do make backups
      backup-by-copying t ; and copy them ...
      backup-directory-alist '(("." . "~/.emacs-backup")) ; ... here
      version-control t
      kept-new-versions 2
      kept-old-versions 5
      delete-old-versions t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; time-stamps 
;;   when there is a "Time-stamp: <>" in the first 10 lines of the file,
;;   emacs will write time-stamp information there when saving the file.
(setq 
  time-stamp-active t          ; do enable time-stamps
  time-stamp-line-limit 10     ; check the first 10 lines of the file for Time-stamp: <>
  time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S (%u)") ; dates should look like this
(add-hook 'write-file-hooks 'time-stamp) ; update when saving
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; macros to save me some type creating keyboard macros
;;
(defmacro set-key-func (key expr)
  "macro to save me typing"
  (list 'local-set-key (list 'kbd key) 
        (list 'lambda nil 
              (list 'interactive nil) expr)))

(defmacro set-key (key str) 
  (list 'local-set-key 
        (list 'kbd key) 
        str)
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tramp, for remote access
;;
(setq tramp-default-method "ssh")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; time/date/calendar stuff
;; 
(setq warning-suppress-types t)
(display-time)
(setq holidays-in-diary-buffer          t
      mark-holidays-in-calendar         t
      all-christian-calendar-holidays   t)
(setq display-time-24hr-format t
      display-time-day-and-date nil
      display-time-format ""
      
      display-time-use-mail-icon t
      display-time-load-average-threshold 20)

(setq calendar-latitude 60.10)
(setq calendar-longitude 24.56)
(setq calendar-location-name "Prague, Czech Republic")

(setq c-basic-offset 4)

(hippie-expand t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load CEDET
;; Don't forget to edit ecb-update.el if using a CVS check out
;;
(add-to-list 'load-path
	     "/usr/share/emacs/site-lisp/cedet")
(add-to-list 'load-path
	     "/usr/share/emacs/site-lisp/cedet/common")
(add-to-list 'load-path
	     "/usr/share/emacs/site-lisp/cedet/semantic")
(add-to-list 'load-path
	     "/usr/share/emacs/site-lisp/cedet/semantic/bovine")
(add-to-list 'load-path
	     "/usr/share/emacs/site-lisp/cedet/eieio")
(add-to-list 'load-path
	     "/usr/share/emacs/site-lisp/cedet/speedbar")
(add-to-list 'load-path
	     "/usr/share/emacs/site-lisp/cedet/srecode/")
(load-file "/usr/share/emacs/site-lisp/cedet/common/cedet.el")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Semantic configuration

(require 'semantic)
(require 'semantic-ia)
(require 'semantic-gcc)
(require 'semanticdb)

;; Enabling various SEMANTIC minor modes.  See semantic/INSTALL for more ideas.
;; Select one of the following:

;; * This enables the database and idle reparse engines
;; (semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;; (semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as the nascent intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-guady-code-helpers)

;; * This turns on which-func support (Plus all other code helpers)
(semantic-load-enable-excessive-code-helpers)

;; This turns on modes that aid in grammar writing and semantic tool
;; development.  It does not enable any other features such as code
;; helpers above.
;; (semantic-load-enable-semantic-debugging-helpers)

(global-semantic-idle-completions-mode)

(semantic-add-system-include "/usr/local/include" 'c-mode)
(semantic-add-system-include "/usr/include" 'c-mode)
(semantic-add-system-include "/include" 'c-mode)
(semantic-add-system-include "~/include" 'c-mode)
(semantic-add-system-include "./include" 'c-mode)
(semantic-add-system-include "./common" 'c-mode)
(semantic-add-system-include "../include" 'c-mode)
(semantic-add-system-include "../common" 'c-mode)
;; (semantic-add-system-include "../" 'c-mode)
(semantic-add-system-include "./" 'c-mode)

(global-semanticdb-minor-mode 1)

'(semantic-c-dependency-system-include-path (quote ("./include" "../include" "./" "../common")))
'(semantic-c-obey-conditional-section-parsing-flag nil)
'(semantic-decoration-styles (quote (("semantic-tag-folding" . t) ("semantic-tag-folding-decoration" . t) ("semantic-decoration-on-protected-members" . t) ("semantic-decoration-on-private-members" . t) ("semantic-tag-boundary" . t))))
'(semantic-idle-scheduler-idle-time 20)
'(semantic-tag-folding-show-tooltips t)
'(semanticdb-default-file-name "semantic.cache")
'(semanticdb-global-mode t nil (semanticdb))
'(semanticdb-persistent-path (quote (always)))
 

(defun my-semantic-hook ()
  (imenu-add-to-menubar "ETAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)

(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-\T" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'my-cedet-hook)
(add-hook 'c++-mode-common-hook 'my-cedet-hook)

(setq semantic-ectag-program "/usr/bin/ctags-exuberant")
;; (global-srecode-minor-mode 1)            ; Enable template insertion menu
(semantic-load-enable-all-exuberent-ctags-support)
;; enable ctags for some languages:
;;  Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
(defun cedet-called-interactively-p () t)
(define-key global-map (kbd "M-.") 'semantic-ia-fast-jump)   ; semantic-ia-fast-jump


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ECB stuff

(global-ede-mode 1)

(add-to-list 'load-path
             "/usr/share/emacs/site-lisp/ecb/")
(require 'ecb)
(ecb-activate)




(set-buffer-file-coding-system 'unix)

;; (zone-when-idle)


(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 104 :width normal :foundry "sony" :family "fixed")))))

(setq minibuffer-frame-alist
      '((top . 0) (left . 0) (width . 80) (height . 4)))


(defun djcb-opacity-modify (&optional dec)
  "modify the transparency of the emacs frame; if DEC is t,
    decrease the transparency, otherwise increase it in 10%-steps"
  (let* ((alpha-or-nil (frame-parameter nil 'alpha)) ; nil before setting
         (oldalpha (if alpha-or-nil alpha-or-nil 100))
         (newalpha (if dec (- oldalpha 10) (+ oldalpha 10))))
    (when (and (>= newalpha frame-alpha-lower-limit) (<= newalpha 100))
      (modify-frame-parameters nil (list (cons 'alpha newalpha)))))
  )

 ;; C-8 will increase opacity (== decrease transparency)
 ;; C-9 will decrease opacity (== increase transparency
 ;; C-0 will returns the state to normal
(global-set-key (kbd "C-8") '(lambda() (interactive) (djcb-opacity-modify)))
(global-set-key (kbd "C-9") '(lambda()(interactive)(djcb-opacity-modify t)))
(global-set-key (kbd "C-0") '(lambda()(interactive)
                               (modify-frame-parameters nil `((alpha . 100)))))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(c-basic-offset tab-width)
 '(c-default-style (quote ((c-mode . "bsd") (java-mode . "java") (awk-mode . "awk") (other . "bsd"))))
 '(case-fold-search t)
 '(column-number-mode t)
 '(current-language-environment "English")
 '(debug-on-error nil)
 '(default-tab-width 4 t)
 '(desktop-load-locked-desktop t)
 '(display-time-mode t)
 '(ecb-eshell-auto-activate t)
 '(ecb-eshell-fit-window-to-command-output nil)
 '(ecb-layout-window-sizes nil)
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote ("./" "../common" "../include" "./include" "/usr/include")))
 '(ecb-tip-of-the-day nil)
 '(ecb-use-speedbar-instead-native-tree-buffer (quote dir))
 '(ecb-windows-width 0.2)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(eshell-windows-shell-file "/usr/bin/bash")
 '(global-font-lock-mode t nil (font-lock))
 '(global-semantic-decoration-mode t nil (semantic-decorate-mode))
 '(global-semantic-folding-mode t nil (semantic-util-modes))
 '(global-semantic-highlight-func-mode t nil (semantic-util-modes))
 '(global-semantic-idle-completions-mode t nil (semantic-idle))
 '(global-semantic-idle-scheduler-mode t nil (semantic-idle))
 '(global-semantic-idle-summary-mode t nil (semantic-idle))
 '(global-semantic-mru-bookmark-mode t nil (semantic-util-modes))
 '(global-semantic-stickyfunc-mode t nil (semantic-util-modes))
 '(global-semantic-tag-folding-mode t nil (semantic-util-modes))
 '(ido-create-new-buffer (quote always))
 '(ido-enable-flex-matching t)
 '(ido-mode (quote buffer) nil (ido))
 '(indent-tabs-mode nil)
 '(minibuffer-auto-raise t)
 '(minibuffer-depth-indicate-mode t)
 '(minibuffer-electric-default-mode t)
 '(minibuffer-frame-alist (quote ((width . 80) (height . 2))))
 '(minibuffer-prompt-properties (quote (read-only t face minibuffer-prompt)))
 '(nxhtml-skip-welcome t)
 '(save-place t nil (saveplace))
 '(semantic-c-dependency-system-include-path (quote ("./include" "../include" "./" "../common")))
 '(semantic-c-obey-conditional-section-parsing-flag nil)
 '(semantic-decoration-styles (quote (("semantic-tag-folding" . t) ("semantic-tag-folding-decoration" . t) ("semantic-decoration-on-protected-members" . t) ("semantic-decoration-on-private-members" . t) ("semantic-tag-boundary" . t))))
 '(semantic-idle-scheduler-idle-time 20)
 '(semantic-tag-folding-show-tooltips t)
 '(semanticdb-default-file-name "semantic.cache")
 '(semanticdb-global-mode t nil (semanticdb))
 '(semanticdb-persistent-path (quote (always)))
 '(shell-file-name "/usr/bin/bash")
 '(show-paren-mode t nil (paren))
 '(tab-width 4)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(use-file-dialog nil)
 '(widget-menu-minibuffer-flag t))
