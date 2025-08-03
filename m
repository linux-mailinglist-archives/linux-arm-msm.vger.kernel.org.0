Return-Path: <linux-arm-msm+bounces-67546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D27FBB19267
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDF8A17A132
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B294F28726A;
	Sun,  3 Aug 2025 03:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahwxK2Nm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3D3286D73;
	Sun,  3 Aug 2025 03:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193561; cv=none; b=hRRV1MLKqHznnw4FokXCbMnngn2TNAuknEmFVG8RnAd+RMTFJZ131/Vi4cZV7uawn+VBXm9jZHSjTKhL4nSK3npzTSXhRmqlNOq3644thwxe1huHIsoQLJoT5Ps/nCH8u+sgEEiHw7piYPhNzAGqxZe2brRV1b0fAYUA1bZo3Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193561; c=relaxed/simple;
	bh=hfhdyPgNPmI59nT/uW5MmPjomrGBwFDKj1cx3ofW7kI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hGMTaMVg3mNZBEvGI9xPmjA+cwbZH7+ZBWgUqNU5nNic/8DLW0qk7plUmSI8wKjKD/hOLr2Dc39ya9ZBtItCYTdLydaBuJN87kt5ylH/NLqPMBNaRf0U6q/Y6vbGEnTn+OX5s9xvM8hmCGKN6w5ebh/ud2haf5stgeval72Tglw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahwxK2Nm; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3e412f3a0f0so18938315ab.2;
        Sat, 02 Aug 2025 20:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193557; x=1754798357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeJcBthhmF2i0ZuBLswvHjerHxMSPDvK/fXonxnOFN8=;
        b=ahwxK2Nm/l562/Db6dQx/8pdL1a33/jaLdvZlazK6tIEENlmNfIZO2P+CVlXkhpUCw
         +B0FtjhzmU2FmWHDIk/dl6X2XtW/lqFmBBYOPYoCSJiEAugjFnjncHpIpOretdpxgZWg
         TdqGKE0VRgA2TogxhGsGwC5Y8zK+iYcSd4y9wCFBGhC83jSSIQD+BKWmMOG4cwvZsvB/
         EjouA9PIK40exXBTp2lcy5aYP4kYOnrs4GTN/ANnICVvxesS1GWV1LU/epoZoGBPHdWO
         6siEpYBVCic0jse6vExyofHWxzXy10uOgm6VD59wjYOJfk9wpYW54G/lU1aCcD+ByGlK
         Fqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193557; x=1754798357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeJcBthhmF2i0ZuBLswvHjerHxMSPDvK/fXonxnOFN8=;
        b=LnqmRT7UwD+0DNRjOcYvjaaF71jad2OlPErD3MiSvk6Ww6p+UfbYQ+eOt2FHtp6FoV
         60BQeTPlr0D8i3hGteyoPHiFVHXsxeL0U1Deh9wNl5R3e3OD6ZK0R7Y3d/ClBu1YSKNI
         0+ikQSftRMxscuueOjk/mADcxDM09yRnMg7EFy3BN9c3zG5Q/6uzDjO8/JVELgUP/cxA
         v6shlYJBdaTAeNBqxjZuBDXYiyR44QnVckmo+R1byKTelh2BieQGm6df2GOUHr+cNnTW
         qODlc9+zsZLnUxQ3OcHLXW/bUApbGO27EIqbeN5ADb+C0tfrNZM/KI266ObQr+YXHlwF
         vL7A==
X-Forwarded-Encrypted: i=1; AJvYcCU42MTr5NaDz32AGmh6qFE4KdmKPK5q/3s24ujTRaNTuaKJp58Xgry2OxwN7sw8ojQVMBNEYVopjF8BYp89@vger.kernel.org, AJvYcCUdqVCS+OYAJ+wKIPX83ByGWv3xgwY+lJQGy0YbL/8bf5n53iVcKzG2TwzBLZt9H/+26fQNDWjXfjfB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl+q5+FwPbQShLb/R0d8zZ8sxAPYAsgJ8J4tWq31Q2kgWMLMBr
	WurwCmd+HKI3CYNlgfsRw8s+iSV+4BdyhsgtWoYsHA/tnv77CfphiBWkJe8/Lp1pbQY=
X-Gm-Gg: ASbGncuD6I4tYevki/jjBsHmseJAtaUyIGK2y7Nn4TIfqGFvKm0IxVKyRgy9hA3LL0G
	H1UAEAfmIikWOZcv9Ax9zDTmwaURyjKqO26H3E17LB7qfwyRRGZ3QTG0bhjj3ILzToMuR6WUDzt
	9Co8CCApE8C9GlDEo32WIymb3hKhYmVoOCPzDukDZ/R0bMoqrRyawQlF5RZJaQ56FkSfPLxJEZh
	Y+4hs7P7RWbJ9WdHOjl4BX6HzvIhyhtm0UlEDPBAPsGVINo+2XcQ5EIFhlQbLhukWulO9hPB/U5
	XDEElF36Gpa0HF63CzxeN50yJyJ3KgCB0FGmfnqOmFTIiEXjQjEdz3vzuItfcyric1OCWJkqzn9
	OxEnBuxP2PJQJfB2ZAJA7obAoB8qL3lDhI0UA5HPzShBgJPvmcgpURAH2h02Zjde5XyM2j6StG3
	FKKw==
X-Google-Smtp-Source: AGHT+IHrzCRd82nJmWB4NzeYPcpOd69cqcO9QfV4pWarBbSRRr9gtL6A2/9Lh/HUHDDW9s/Kka8FzQ==
X-Received: by 2002:a92:cda7:0:b0:3e2:9fa7:a60a with SMTP id e9e14a558f8ab-3e41611a0aamr87564645ab.3.1754193557316;
        Sat, 02 Aug 2025 20:59:17 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:16 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 29/58] docs/dyndbg: add classmap info to howto
Date: Sat,  2 Aug 2025 21:57:47 -0600
Message-ID: <20250803035816.603405-30-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the 3 API macros providing dynamic_debug's classmaps

DYNDBG_CLASSMAP_DEFINE - create & export a classmap
DYNDBG_CLASSMAP_USE    - refer to exported map
DYNDBG_CLASSMAP_PARAM  - bind control param to the classmap
DYNDBG_CLASSMAP_PARAM_REF + use module's storage - __drm_debug

TBD: some of this might be over-specification, or just over-talked.

NB: The _DEFINE & _USE model makes the user dependent on the definer,
just like EXPORT_SYMBOL(__drm_debug) already does.

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v3- rework protection around PARAM

v0.5 adjustments per Randy Dunlap
v0.7 checkpatch fixes
v0.8 more
v0.9 rewords

fixup-howto
---
 .../admin-guide/dynamic-debug-howto.rst       | 137 ++++++++++++++++--
 1 file changed, 126 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 1ceadf4f28f9f..556e00299ed35 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -146,7 +146,9 @@ keywords are:::
   "1-30" is valid range but "1 - 30" is not.
 
 
-The meanings of each keyword are:
+Keywords:::
+
+The meanings of each keyword are::
 
 func
     The given string is compared against the function name
@@ -194,16 +196,6 @@ format
 	format "nfsd: SETATTR"  // a neater way to match a format with whitespace
 	format 'nfsd: SETATTR'  // yet another way to match a format with whitespace
 
-class
-    The given class_name is validated against each module, which may
-    have declared a list of known class_names.  If the class_name is
-    found for a module, callsite & class matching and adjustment
-    proceeds.  Examples::
-
-	class DRM_UT_KMS	# a DRM.debug category
-	class JUNK		# silent non-match
-	// class TLD_*		# NOTICE: no wildcard in class names
-
 line
     The given line number or range of line numbers is compared
     against the line number of each ``pr_debug()`` callsite.  A single
@@ -218,6 +210,24 @@ line
 	line -1605          // the 1605 lines from line 1 to line 1605
 	line 1600-          // all lines from line 1600 to the end of the file
 
+class
+
+    The given class_name is validated against each module, which may
+    have declared a list of class_names it accepts.  If the class_name
+    accepted by a module, callsite & class matching and adjustment
+    proceeds.  Examples::
+
+	class DRM_UT_KMS	# a DRM.debug category
+	class JUNK		# silent non-match
+	// class TLD_*		# NOTICE: no wildcard in class names
+
+.. note ::
+
+    Unlike other keywords, classes are "name-to-change", not
+    "omitting-constraint-allows-change".  See Dynamic Debug Classmaps
+
+Flags:::
+
 The flags specification comprises a change operation followed
 by one or more flag characters.  The change operation is one
 of the characters::
@@ -394,3 +404,108 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
 For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
 its ``prefix_str`` argument, if it is constant string; or ``hexdump``
 in case ``prefix_str`` is built dynamically.
+
+Dynamic Debug Classmaps
+=======================
+
+The "class" keyword selects prdbgs based on author supplied,
+domain-oriented names.  This complements the nested-scope keywords:
+module, file, function, line.
+
+The main difference from the others: classes must be named to be
+changed.  This protects them from generic overwrite:
+
+  # IOW this cannot undo any DRM.debug settings
+  :#> ddcmd -p
+
+This protection is needed; /sys/module/drm/parameters/debug is ABI.
+DRM.debug is authoritative when dyndbg is not used, dyndbg's PARAM
+cannot undermine that guarantee just because its optional for DRM to
+use it.
+
+  :#> echo 0x1ff > /sys/module/drm/parameters/debug
+
+So each class must be enabled individually (no wildcards):
+
+  :#> ddcmd class DRM_UT_CORE +p
+  :#> ddcmd class DRM_UT_KMS +p
+  # or more selectively
+  :#> ddcmd class DRM_UT_CORE module drm +p
+
+That makes direct >control wordy and annoying, but it is a secondary
+interface; it is not intended to replace the ABI, just slide in
+underneath and reimplement it.
+
+However, since the sysfs/kparam is the ABI, if a classmap DEFINEr
+doesn't also add a _CLASSMAP_PARAM, there is no ABI, and no protection
+is needed.  In that case, class'd prdbgs would be enabled/disabled by
+legacy (class-less) queries, as a convenience, and because there's no
+need to enforce irrelevant rules.
+
+
+Dynamic Debug Classmap API
+==========================
+
+DRM.debug is built upon:
+
+- enum drm_debug_category: DRM_UT_<*> - <T> for short
+- 23 categorized api macros: drm_dbg_<T>(), DRM_DEBUG_<T>()
+- 5000 calls to them
+- all calling to __pr_debug_cls(<T>, ...)
+
+Those compile-time const short ints are good for optimizing compilers;
+a primary classmaps design goal was to keep that property.
+So basically .class_id === category.
+
+Then we use the drm_categories DRM_UT_* enum for both the classnames
+(stringified enum symbols) and their numeric values.
+
+Its expected that future users will also use categorized macros and an
+enum-defined categorization scheme like DRM's, with dyndbg inserted in
+similarly.
+
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(var,type,_base,classnames) - this maps
+classnames (a list of strings) onto class-ids consecutively, starting
+at _base, it also maps the names onto CLASSMAP_PARAM bits 0..N.
+
+DYNAMIC_DEBUG_CLASSMAP_USE(var) - modules call this to refer to the
+var _DEFINEd elsewhere (and exported).
+
+Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize
+dyndbg to update those classes.  "class FOO" queries are validated
+against the classes, this finds the classid to alter; classes are not
+directly selectable by their classid.
+
+NB: It is an inherent API limitation that the following are possible:
+
+  // these would be caught in review
+  __pr_debug_cls(0, "fake DRM_UT_CORE msg");  // this works
+  __pr_debug_cls(62, "un-known classid msg"); // this compiles, does nothing
+
+There are 2 types of classmaps:
+
+ DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like DRM.debug
+ DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
+
+DYNAMIC_DEBUG_CLASSMAP_PARAM - modelled after module_param_cb, it
+refers to a DEFINEd classmap, and associates it to the param's
+data-store.  This state is then applied to DEFINEr and USEr modules
+when they're modprobed.
+
+The PARAM interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
+amongst the contained classnames; all classes are independent in the
+control parser itself; there is no implied meaning in names like "V4".
+
+Modules or module-groups (drm & drivers) can define multiple
+classmaps, as long as they (all the classmaps) share the limited 0..62
+per-module-group _class_id range, without overlap.
+
+If a module encounters a conflict between 2 classmaps its USEing, we
+can extend the _USE macro with an offset to allow de-conflicting the
+respective ranges.  Or they use the DEFINErs macro-api, but with new
+enum symbols.
+
+``#define DEBUG`` will enable all pr_debugs in scope, including any
+class'd ones.  This won't be reflected in the PARAM readback value,
+but the class'd pr_debug callsites can be forced off by toggling the
+classmap-kparam all-on then all-off.
-- 
2.50.1


