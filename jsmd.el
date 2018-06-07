;;; jsmd.el --- Major mode for editing Iodide JSMD files  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Michael Droettboom

;; Author: Michael Droettboom <mdboom@gmail.com>
;; Keywords: languages
;; Version: 0.0.1

;;; Commentary:

;; This provides a major mode, `jsmd-mode`, to edit Iodide's notebook format, JSMD.

;; Put this file in your load path, and then M-x jsmd-mode to activate on the Iodide .html file.

;;; Code:

(require 'polymode)

(defcustom pm-host/jsmd
  (pm-bchunkmode "html" :mode 'html-mode)
  "HTML"
  :group 'hostmodes
  :type 'object)

(defcustom pm-inner/markdown
  (pm-hbtchunkmode "markdown"
                   :mode 'markdown-mode
                   :head-mode 'host
                   :head-reg "^%% md$"
                   :tail-reg "^%% ")
  "Markdown chunk"
  :group 'innermodes
  :type 'object)

(defcustom pm-inner/js
  (pm-hbtchunkmode "js"
                   :mode 'js2-mode
                   :head-mode 'host
                   :head-reg "^%% js$"
                   :tail-reg "^%% ")
  "Javascript chunk"
  :group 'innermodes
  :type 'object)

(defcustom pm-inner/python
  (pm-hbtchunkmode "python"
                   :mode 'python-mode
                   :head-mode 'host
                   :head-reg "^%% code \{\"language\":\"py\"\}$"
                   :tail-reg "^%% ")
  "Python chunk"
  :group 'innermodes
  :type 'object)

(defcustom pm-inner/css
  (pm-hbtchunkmode "css"
                   :mode 'css-mode
                   :head-mode 'host
                   :head-reg "^%% css$"
                   :tail-reg "^%% ")
  "CSS chunk"
  :group 'innermodes
  :type 'object)

(defcustom pm-inner/json
  (pm-hbtchunkmode "json"
                   :mode 'json-mode
                   :head-mode 'host
                   :head-reg "^%% \\(\\(meta\\)\\|\\(plugin\\)\\)$"
                   :tail-reg "^%% ")
  "Plugin chunk"
  :group 'innermodes
  :type 'object)

(defcustom pm-poly/jsmd
  (pm-polymode-multi "jsmd"
                   :hostmode 'pm-host/jsmd
                   :innermodes '(pm-inner/markdown
                                 pm-inner/js
                                 pm-inner/python
                                 pm-inner/css
                                 pm-inner/json))
  "JSMD inner"
  :group 'polymodes
  :type 'object)

(define-polymode jsmd-mode pm-poly/jsmd)

(provide 'jsmd)
;;; jsmd.el ends here
