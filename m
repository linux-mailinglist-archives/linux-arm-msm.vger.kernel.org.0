Return-Path: <linux-arm-msm+bounces-86147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3F3CD5321
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE73D3052E06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978E73328E0;
	Mon, 22 Dec 2025 08:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIJtwn1D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EB43321D4
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766392117; cv=none; b=Smco1qTxoEOGy1hN6HE/R74TK49GF6s24+OVbnZOGwLTLE9MAR6JQe9ZrH+wmMjdwQ0+imgufM7WET8qpYZdDwlqT6U3csLEixcmtz9tmD2UqHcC+JeTdRxqpAoao/sffCNWQZ16UzD60+OaDKrhaTYbPVdbxJ1PQ4JEteVcO1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766392117; c=relaxed/simple;
	bh=AK/bnfFexI75Q/0N26IRCouQSTxRNRsO2xPVvCV9E/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BEfqXIa3jE0MMv/sN7hrws67VT81ifGJcZGFkXqezrSvqPoNWR3FhQpsaeReFIK85Jxbdu66VsqM39gTeW5Bal1V2wv/eIRvlIDB+nbWam20b2FC8qrCnxEVR1I1KBsqKFULTP45oxQcKUj7MasYvsg/LW/7S5cOKnjve0tBGaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIJtwn1D; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso2805446b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766392115; x=1766996915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ABMBtHazCQPbXZPvqunvxRiAtO4J7KVdTol8wYfw0Q=;
        b=fIJtwn1D8uTLW1F9gJriRM38SkoDbyBPhwPYT07LKFiJLCvH75BTWZlb8uXhl3GJjf
         6j8gV9kdbCLm857eFC1c1ZTGZyp7gA3AA3co/Q0ektpv6WH9XXDgl4JWBlNBhfZ5dB1B
         vWYwU4dBTzTZBbZi/K8R0k/I2TSQ9QBy4kx9TTS7/6SvxfWjKcn4ZsY+MixLsxjFsrPv
         3YnOvU9Ttqytr+PmNBG4JYewgWWbJ9BKJSYq/68RS5vWgCYkc8zIO5ZEkoyWfonWa0zy
         QniPvQsLjULzQpBNX2ahpsJE7LP5wfeRdAI/ExMBzoSbvDye823C55kR9VuYN0TlGTU6
         ARzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766392115; x=1766996915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ABMBtHazCQPbXZPvqunvxRiAtO4J7KVdTol8wYfw0Q=;
        b=bqG8itqHj8DeR9aFIsTECHsHkbiFgN4ZuMDJA2fPbv8bLr7ssBsRKnlgY6BRkwDacS
         UzK1EyAOFYFvzKw7IHpLrjt48BFUEv7aYqMDzXVRw5NwGTPzZfDvrr97LWlpWQq4n+CR
         r2etqOK4Hbm/uWtRi+b31oJFn9bi4Vc0L5J8TgMIPjJ5LBE8XLKSk2HFk6v6VCRTV6/Y
         89N/JbpN77dkE4Gwk4x/AJV0qkRmOMQ87NrdAQjBEeo/byj1cXEVDscsGiTGk46C9XWg
         ezXp2hp8WNYMwM8y+gml2KmQHRPd7QiUVPJsI9/+0cJqEhzNf5njwSwgzKyNgtxLLssu
         yhOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgTXh4daspeAJ4f8Kx+1QspJHLeLEQsb5eRyoFjdZhmO/rUvCj8qMhs5g2CGDBvgXLBf+y8zF11efC8lxG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3CVUf1vH/tBHQLHYoMwDoUROqMQsODI9RMG/H1dgvx4iEZzhC
	ECO7rJDxz9mZ4yaHM4qCR6BJIC06Osl2I4PZ736kBmTXVIaURLxCHcGC
X-Gm-Gg: AY/fxX6XDbJbMn6DuZpHWwQWB1Ri3oLqAJ0fQPuKczkb1PUWQkZcq27iJWdZAseJeEl
	gkOd8XULh72zcqnomjoawIVcgOBXmn9jetAiQPHzydH3QHDMtetQnFvT53nBYUT6ub8sOOoM7jq
	0GgTrxrXcDM4HO0Ak7QUHtXjPqUCTwWVtwFVWBfvrua+PJWpzk0qlC/7yTnqW1E+Ajy1vnUUNFQ
	gxBwYhA9mjuMgYF4a0WxVM9ydCbWnUKvC+F9RP7VG5N5LVtkBzZ5z0Shd3xQ0l0JH9fLKqUrKE4
	IDqjbPGoAp1qL2aGuCQUC+Yn+pnw7fV85M/4Q0kpkqwatGhqT+9Fd30K1jWlttKbcO8N2/ugrqH
	WZ74jnsWLLmDXXxzuYGGCYgiVXxN7vh+n4lxsC3cMOwA1bno+YJzvq/QpQibGZpGbmYgWmW8+Jb
	oGRRx+BAWa
X-Google-Smtp-Source: AGHT+IEdf8lOhDtPYqKizeM1Dh4nWRJWzDSgY4CwDeK+ppE6vvK3k4DXx/lWFGZRYtXZSu5qWUHggg==
X-Received: by 2002:a05:6a00:1d98:b0:7aa:8397:7754 with SMTP id d2e1a72fcca58-7ff64ed1413mr8654654b3a.2.1766392115098;
        Mon, 22 Dec 2025 00:28:35 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:28:34 -0800 (PST)
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
Subject: [PATCH v7 31/31] docs/dyndbg: add classmap info to howto
Date: Mon, 22 Dec 2025 21:20:48 +1300
Message-ID: <20251222082049.1782440-32-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the 3 API macros providing dynamic_debug's classmaps

DYNAMIC_DEBUG_CLASSMAP_DEFINE - create & export a classmap
DYNAMIC_DEBUG_CLASSMAP_USE    - refer to exported map
DYNAMIC_DEBUG_CLASSMAP_PARAM  - bind control param to the classmap
DYNAMIC_DEBUG_CLASSMAP_PARAM_REF + use module's storage - __drm_debug

NB: The _DEFINE & _USE model makes the user dependent on the definer,
just like EXPORT_SYMBOL(__drm_debug) already does.

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       | 135 ++++++++++++++++--
 1 file changed, 123 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 89ee15d7ae58..c85266ee8eed 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -146,6 +146,9 @@ keywords are::
   "1-30" is valid range but "1 - 30" is not.
 
 
+Keywords
+--------
+
 The meanings of each keyword are:
 
 func
@@ -194,16 +197,6 @@ format
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
@@ -218,6 +211,25 @@ line
 	line -1605          // the 1605 lines from line 1 to line 1605
 	line 1600-          // all lines from line 1600 to the end of the file
 
+class
+
+    The given class_name is validated against each module, which may
+    have declared a list of class_names it accepts.  If the class_name
+    accepted by a module, callsite & class matching and adjustment
+    proceeds.  Examples::
+
+	class DRM_UT_KMS	# a drm.debug category
+	class JUNK		# silent non-match
+	// class TLD_*		# NOTICE: no wildcard in class names
+
+.. note::
+
+    Unlike other keywords, classes are "name-to-change", not
+    "omitting-constraint-allows-change".  See Dynamic Debug Classmaps
+
+Flags
+-----
+
 The flags specification comprises a change operation followed
 by one or more flag characters.  The change operation is one
 of the characters::
@@ -238,11 +250,15 @@ The flags are::
   s    Include the source file name
   l    Include line number
 
+.. note::
+
+   * To query without changing	``+_`` or ``-_``.
+   * To clear all flags		``=_`` or ``-fslmpt``.
+
 For ``print_hex_dump_debug()`` and ``print_hex_dump_bytes()``, only
 the ``p`` flag has meaning, other flags are ignored.
 
-Note the regexp ``^[-+=][fslmpt_]+$`` matches a flags specification.
-To clear all flags at once, use ``=_`` or ``-fslmpt``.
+The regexp ``^[-+=][fslmpt_]+$`` matches a flags specification.
 
 
 Debug messages during Boot Process
@@ -394,3 +410,98 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
 For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
 its ``prefix_str`` argument, if it is constant string; or ``hexdump``
 in case ``prefix_str`` is built dynamically.
+
+.. _dyndbg-classmaps:
+
+Dynamic Debug Classmaps
+=======================
+
+The "class" keyword selects prdbgs based on author supplied,
+domain-oriented names.  This complements the nested-scope keywords:
+module, file, function, line.
+
+The main difference from the others: classes must be named to be
+changed.  This protects them from unintended overwrite::
+
+  # IOW this cannot undo any drm.debug settings
+  :#> ddcmd -p
+
+This protection is needed; /sys/module/drm/parameters/debug is ABI.
+drm.debug is authoritative when dyndbg is not used, dyndbg-under-DRM
+is an implementation detail, and must not behave erratically, just
+because another admin fed >control something unrelated.
+
+So each class must be enabled individually (no wildcards)::
+
+  :#> ddcmd class DRM_UT_CORE +p
+  :#> ddcmd class DRM_UT_KMS +p
+  # or more selectively
+  :#> ddcmd class DRM_UT_CORE module drm +p
+
+That makes direct >control wordy and annoying, but it is a secondary
+interface; it is not intended to replace the ABI, just slide in
+underneath and reimplement the guaranteed behavior.  So DRM would keep
+using the convenient way, and be able to trust it::
+
+  :#> echo 0x1ff > /sys/module/drm/parameters/debug
+
+That said, since the sysfs/kparam is the ABI, if the author omits the
+CLASSMAP_PARAM, theres no ABI to guard, and he probably wants a less
+pedantic >control interface.  In this case, protection is dropped.
+
+Dynamic Debug Classmap API
+==========================
+
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(clname,type,_base,classnames) - this maps
+classnames (a list of strings) onto class-ids consecutively, starting
+at _base.
+
+DYNAMIC_DEBUG_CLASSMAP_USE(clname) & _USE_(clname,_base) - modules
+call this to refer to the var _DEFINEd elsewhere (and exported).
+
+DYNAMIC_DEBUG_CLASSMAP_PARAM(clname) - creates the sysfs/kparam,
+maps/exposes bits 0..N as class-names.
+
+Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize
+dyndbg to update those named classes.  "class FOO" queries are
+validated against the classes defined or used by the module, this
+finds the classid to alter; classes are not directly selectable by
+their classid.
+
+Classnames are global in scope, so subsystems (module-groups) should
+prepend a subsystem name; unqualified names like "CORE" are discouraged.
+
+NB: It is an inherent API limitation (due to class_id's int type) that
+the following are possible:
+
+  // these errors should be caught in review
+  __pr_debug_cls(0, "fake DRM_UT_CORE msg");  // this works
+  __pr_debug_cls(62, "un-known classid msg"); // this compiles, does nothing
+
+There are 2 types of classmaps:
+
+* DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like drm.debug
+* DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
+
+DYNAMIC_DEBUG_CLASSMAP_PARAM - modelled after module_param_cb, it
+refers to a DEFINEd classmap, and associates it to the param's
+data-store.  This state is then applied to DEFINEr and USEr modules
+when they're modprobed.
+
+The PARAM interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
+amongst the contained classnames; all classes are independent in the
+control parser itself.  There is no implied meaning in names like "V4"
+or "PL_ERROR" vs "PL_WARNING".
+
+Modules or subsystems (drm & drivers) can define multiple classmaps,
+as long as they (all the classmaps) share the limited 0..62
+per-module-group _class_id range, without overlap.
+
+If a module encounters a conflict between 2 classmaps it is _USEing or
+_DEFINEing, it can invoke the extended _USE_(name,_base) macro to
+de-conflict the respective ranges.
+
+``#define DEBUG`` will enable all pr_debugs in scope, including any
+class'd ones.  This won't be reflected in the PARAM readback value,
+but the class'd pr_debug callsites can be forced off by toggling the
+classmap-kparam all-on then all-off.
-- 
2.52.0


