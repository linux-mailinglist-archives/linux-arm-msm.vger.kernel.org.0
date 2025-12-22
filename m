Return-Path: <linux-arm-msm+bounces-86152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE36CD5318
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 467DD304D49E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3AB33B6CF;
	Mon, 22 Dec 2025 08:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCAsUmAC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB2633ADB1
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766392156; cv=none; b=ELO+JvPaXit4uuGf6pWFV9J9LJqPFPTVL7hKf5nWVB7nO9EiLPnVUmsF6CYIwONBiJwkun6KCaMa4LvdhzC1NdZ9mO+kTD4yKflPgVjaGsF84DL/cXEtJVWePsVnYPENE+nIB25Guk5O0mg3/YgwE5EonqA98RkUGlfxi5h9Pbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766392156; c=relaxed/simple;
	bh=3T9xNdtnniOkbktihXa6zKeP0cWRNstkr75DMt5/kOs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IngFWABMGKtjpiJu241mW5i4s/JcO/ZZsRFuPmqEsVxYbWN/lkqwndtF81ZKMDkiUMcIDgN3ND/P/U1GQwq5p3kAB6zNgs6GOkiCe1cRycHZtPlfJkOtnGCjsEEuMw8ds8pCjNgw7mfEFNOpLfZ4JPECHyPh7UPJXha5R1GhSv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCAsUmAC; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso4176464b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766392154; x=1766996954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UJ0Fy32CNz68gAtuvvvAIFbPIlI5INll01DQrP39TKA=;
        b=CCAsUmACmp7C1gOpD/9Wx7zCfAjja1dRxCEhaKSSVXShUCR1nbqXb8jk0UhOznkwHS
         hMH2t4H+1mWfX9bhbkvj+ziyOlHyWH1fgUmJD85uVpCPQJ62DvL6FhAHsRo481VNorCU
         PMBzNJpq1etzd8YauzzeUxy2Z7peT2FOw0p+dMVqx0LxiiSMdUX5N+8zP+Nc+WKi0jCX
         gk4X32kduN/St3qG5yS08XUFk0MfyrXpI/ZqBmN0wtbyil/+LgPPHUq1QuIck0yo1Yln
         k3FIEOWknRGb/q5guY1tqrlWIrWsLVKAc455QiCCt8RDZVbIlRLARwEucEm2W5CE2bLx
         ViHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766392154; x=1766996954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJ0Fy32CNz68gAtuvvvAIFbPIlI5INll01DQrP39TKA=;
        b=eIokhv1opGm46DkkZZI5GnmfdRonS9vWjPX56ZJPS7tzE07REa2hE8/GNC3t00rJhI
         xb2Ixs/NapdPPj4X0+p0Zp7jDv9aHW+uMIqbwpVHhw++97kzxkV6Ndu/jjbHUEXN8Lpu
         mXlPLJ7qzgbvrk7LUkmKoqcvztMXIQKvJ58LeSIVj4BS+f4X8Q/u1wmBzdXC8E+ClzXM
         jSVY842y60fWIHDj8j6EDCtavRcHxeno3m9JMSF5sxCjWWnrlTZbN5z5f+zzWZQ/mdjA
         2h5rs0FRTTPSpze2bmArdF1rrbp4jnFl3IgM5O2MJad7wZTFPw9TfkA/hO0dPDVRv2oC
         5t9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAcg9phdk+G1E7jYLtzrBHhnYoqTCdtaDwlt6wYk/1Pod3sRt91MKFbfdzCy3ClUjPrKAxcF6zwoLhS0NG@vger.kernel.org
X-Gm-Message-State: AOJu0YxppqEln5mhrbiTENp8Y8hjBJe2VsbBdGmgNSWQJLuytVWrziX1
	EP9x8AX3tNZkdqY5CDl6du+pJRvoOelF7egBvVfVb/uyIW7l9mOtw+Cl
X-Gm-Gg: AY/fxX7vZB12+/lDnxiTH1wrfj2vvZ3vwiWWrBhTgMDhK0k7LaUfp+rLd4dTZTOJSVB
	q67NrI3Ca/zm/NhgjQHdCYiLXfSlhQyBxmurexmC2Jyd28eSXXURpC0cZ0O5plHN9D6vPa6vEIs
	zf0tmjHNEhw40e/Tn99idH8rm9jaMjadbOAxOWHVsVSJ7NOQBl4Kjg/O5Mr/fVDGOZup5Vbd2Kn
	gZEtxE6bXVbyFSk7lhfycHCpHOeZBvC6m46qEuwr6NvymrVNF1K5Ji8+nRYksPqwCRzLW5SZf/r
	VHQRMfdguY+sVkMrASbtaRIZvDUpkrqhvrqln3+TnjwbXbUoKKG+MZ7TN45m9gKbiS2pKyivojK
	vzpW7qSONfgsAOUp8BQh4wnbdxz6st3k4nCkkzFSWm3u4OhtoSx8jYroIGr1kLJiHY1sW7+51fS
	XR4cYQ7Jh4
X-Google-Smtp-Source: AGHT+IH91xYoqgoO/9cTyIkcwq8ylRSPWssYXk7Ak1UGNvKWMh8b4fE0tkVyhdkLY2d/CPzf+gHPIA==
X-Received: by 2002:a05:6a00:1f17:b0:7f1:fad7:2ce with SMTP id d2e1a72fcca58-7ff679669d1mr11073286b3a.48.1766392153873;
        Mon, 22 Dec 2025 00:29:13 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7af29dcfsm9640064b3a.17.2025.12.22.00.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:29:13 -0800 (PST)
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
	jim.cromie@gmail.com
Subject: [PATCH v7 00/31] drm/dyndbg: Fix dynamic debug classmap regression
Date: Mon, 22 Dec 2025 21:28:12 +1300
Message-ID: <20251222082843.1816701-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hello all,

commit aad0214f3026 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")

added dyndbg's "classmaps" feature, which brought dyndbg's 0-off-cost
debug to DRM.  Dyndbg wired to /sys/module/drm/parameters/debug,
mapped its bits to classes named "DRM_UT_*", and effected the callsite
enablements only on updates to the sys-node (and underlying >control).

Sadly, it hit a CI failure, resulting in:
commit bb2ff6c27bc9 ("drm: Disable dynamic debug as broken")

The regression was that drivers, when modprobed, did not get the
drm.debug=0xff turn-on action, because that had already been done for
drm.ko itself.

The core design bug is in the DECLARE_DYNDBG_CLASSMAP macro.  Its use
in both drm.ko (ie core) and all drivers.ko meant that they couldn't
fundamentally distinguish their respective roles.  They each
"re-defined" the classmap separately, breaking K&R-101.

My ad-hoc test scripting helped to hide the error from me, by 1st
testing various combos of boot-time module.dyndbg=... and
drm.debug=... configurations, and then inadvertently relying upon
those initializations.

This series addresses both failings:

It replaces DECLARE_DYNDBG_CLASSMAP with

- `DYNAMIC_DEBUG_CLASSMAP_DEFINE`: Used by core modules (e.g.,
  `drm.ko`) to define their classmaps.  Based upon DECLARE, it exports
  the classmap so USE can use it.

- `DYNAMIC_DEBUG_CLASSMAP_USE`: this lets other "subsystem" users
  create a linkage to the classmap defined elsewhere (ie drm.ko).
  These users can then find their "parent" and apply its settings.

It adds a selftest script, and a 2nd "sub-module" to recapitulate
DRM's multi-module "subsystem" use-case, including the specific
failure scenario.

It also adds minor parsing enhancements, allowing easier construction
of multi-part debug configurations.  These enhancements are used to
test classmaps in particular, but are not otherwize required.

v7 adds:
. WARN_ONCE when classmap isnt found for a class'd callsite, JBaron
. reorder macro args to match kdoc, JBaron
. Doc formatting fixes, by Bagas

Thank you for your review.

P.S. Id also like to "tease" some other work:

1. patchset to send pr_debugs to tracefs on +T flag

   allows 63 "private" tracebufs, 1 "common" one (at 0)
   "drm.debug_2trace=0x1ff" is possible
   from Lukas Bartoski

2. patchset to save 40% of DATA_DATA footprint

   move (modname,filename,function) to struct _ddebug_site
   save their descriptor intervals to 3 maple-trees
   3 accessors fetch on descriptor, from trees
   move __dyndbg_sites __section to INIT_DATA

3. patchset to cache dynamic-prefixes
   should hide 2.s cost increase.


Jim Cromie (31):

fixes, cleanups, simple stuff::

Jim Cromie (31):
  dyndbg: factor ddebug_match_desc out from ddebug_change
  dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
  docs/dyndbg: update examples \012 to \n
  docs/dyndbg: explain flags parse 1st
  test-dyndbg: fixup CLASSMAP usage error
  dyndbg: reword "class unknown," to "class:_UNKNOWN_"
  dyndbg: make ddebug_class_param union members same size
  dyndbg: drop NUM_TYPE_ARRAY
  dyndbg: tweak pr_fmt to avoid expansion conflicts
  dyndbg: reduce verbose/debug clutter

callchain grooming, re-structs, code simplify/dedup by macros::

  dyndbg: refactor param_set_dyndbg_classes and below
  dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
  dyndbg: replace classmap list with a vector
  dyndbg: macrofy a 2-index for-loop pattern
  dyndbg,module: make proper substructs in _ddebug_info
  dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
  dyndbg: move mod_name down from struct ddebug_table to _ddebug_info
  dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
  selftests-dyndbg: add a dynamic_debug run_tests target
  dyndbg: change __dynamic_func_call_cls* macros into expressions

core fix, detect api misuse errors, etc::

  dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
  dyndbg: detect class_id reservation conflicts
  dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time
  dyndbg-test: change do_prints testpoint to accept a loopct
  dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
  dyndbg: treat comma as a token separator
  dyndbg: split multi-query strings with %
  selftests-dyndbg: add test_mod_submod
  dyndbg: resolve "protection" of class'd pr_debug
  dyndbg: add DYNAMIC_DEBUG_CLASSMAP_USE_(dd_class_name, offset)
  docs/dyndbg: add classmap info to howto

 .../admin-guide/dynamic-debug-howto.rst       | 187 ++++-
 MAINTAINERS                                   |   3 +-
 include/asm-generic/vmlinux.lds.h             |   5 +-
 include/linux/dynamic_debug.h                 | 302 +++++--
 kernel/module/main.c                          |  15 +-
 lib/Kconfig.debug                             |  24 +-
 lib/Makefile                                  |   5 +
 lib/dynamic_debug.c                           | 776 +++++++++++-------
 lib/test_dynamic_debug.c                      | 198 +++--
 lib/test_dynamic_debug_submod.c               |  21 +
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/dynamic_debug/Makefile  |   9 +
 tools/testing/selftests/dynamic_debug/config  |   7 +
 .../dynamic_debug/dyndbg_selftest.sh          | 373 +++++++++
 14 files changed, 1465 insertions(+), 461 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

-- 
2.52.0


