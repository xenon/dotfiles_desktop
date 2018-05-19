(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
        (package-refresh-contents)
        (package-install 'use-package))

(unless (package-installed-p 'spacemacs-theme)
        (package-refresh-contents)
        (package-install 'spacemacs-theme))

;; Load the org file with our config
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight light :height 110 :width normal :foundry "DAMA" :family "DejaVu Sans Mono")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
	("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
	(evil djvu emms scribble-mode racket-mode which-key use-package symon switch-window sudo-edit spacemacs-theme spaceline slime-company rainbow-mode rainbow-delimiters pdf-tools org-bullets magit linum-relative htmlize diminish dashboard counsel avy))))
