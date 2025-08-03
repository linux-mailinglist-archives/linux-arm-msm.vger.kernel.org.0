Return-Path: <linux-arm-msm+bounces-67516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0422CB191B6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 05:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A3881739C8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 03:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F66D13DB9F;
	Sun,  3 Aug 2025 03:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jme5BgHC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB7135942;
	Sun,  3 Aug 2025 03:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193509; cv=none; b=RFwygYXnENupj+cdsgGTv2tAsSGT5xOJt5+DE5o6+sIE2+fPdFdwAaeqVpJgJFeoCq4y3lCl2ylaV1E9U9pA47XT4Jg3gji3Q9IOp/h/UIcClEltQkCkiOu4j33bQxZ9N80WQJ0rX0j40TYZFEwYBqIR0TsI0873c6P5csnL+uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193509; c=relaxed/simple;
	bh=wuWmhYywEFH5w7fW+48kViqD9deF32Z2dudpvpDSuKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HDiwRADgZ0sBKxUcu5+6eMprdhxJYpk6aLJrdl36nmv0wETcSaxdsiiSKW1/zuw23e9zeCIrFg2vD7Ru+P7Cnyap2e2BImcZFO0/tKYwtMrJEWfTJJ1LhHnTfytiaiCBAB6r042n788fMGn1BYAM7CumtYfWYgwCMcqeTuG82CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jme5BgHC; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3e406ca2d22so10974505ab.1;
        Sat, 02 Aug 2025 20:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193506; x=1754798306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DMLk2rTO/k/ZvCq5mpXv9xnm8IkxOQH6hbAYPKMfY2Y=;
        b=jme5BgHC8648wJPDeu9/EiQvhoM9DpAZDDzHL70FE56g8YZ9/Ceg37YuxhC4mfgYDQ
         GyDCCaOuTxT2LJ6QseYgAwCXot/vABpH60+8uiItBK11OXU0mXwmrkV2QU0NBYeEf3ZI
         dZZ46JjtnOOg/ngdo2fg/OJm9yeDPm1LoFGfzhxo2LKuxgC+XRGEAh3fyBnryjcjvYGL
         QFLecx9TPGBYD/zIcr/ROf+mz6A2+mlFpdnW4FPko4ycS9mAzsyMsfSDt7Ijm1CcmfGC
         Vde1yKbPYp09nJ7AhCOG29jVwQ/sQrrPcV6J18gjK7ZD+JMriZUf/1Ii1J+kLepHXaWd
         Pp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193506; x=1754798306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMLk2rTO/k/ZvCq5mpXv9xnm8IkxOQH6hbAYPKMfY2Y=;
        b=gFgeWN+mCBDzH5iCXC6Ah5BcO/6bR3s8nilV2Q62mvbwF8ktqI7PXI1pe1K7lKZxNm
         R9/6KOynQoUN1DS7MzVBo1vnDJ8WMY0sSgr8mEw1PuJRMdRCBN4hIAti4Czpf+AFuiCh
         SC72JIAiXQ5ywWi7/JLHZFkFh7DNj+dYV3qyWdPgUKExQZ4P8aVNeGapHzwHNgeUEjU9
         3Nbwzsi/e7+fE14Tlt5hehiRHfV9VO8HgVfXGl7Y05sSc7E+n6ruAqtTJX3ikJ3IOHR9
         gcy5ER9qm1GKnwZ3ClfmUzHYDG4uJ9eUNmhHXv58ir6/7sJlXwCuQgMLPRR1eOhb/4PD
         +86g==
X-Forwarded-Encrypted: i=1; AJvYcCUjbfPEy0TkKMPcwLZrwFlwl0hvseiH57ijS2eegn3yjA/DzKXWpHdKQLBsPk0zlxSARL7cX9BUS1SPWgRw@vger.kernel.org
X-Gm-Message-State: AOJu0YwdXqaLpbpBKwpF+HhcHmGQRGrMHsEBiGNGrVdQDQX/SYFxP4se
	X12SLy4K3Bgbpsy5Ny21lZJmF4HM6QbhwznCuHwqWrrcMCMFBf6R/qVpjY0bKLmHXeI=
X-Gm-Gg: ASbGnctQAmGHH9zEXrb6C2Lbs94PkKt8M5dlXbhlgOgk7tVpu1xcKUBkraKMu3hbhkV
	q+VJtukfWbPsFe2yG58M1B51j4u4i04zJLrIUzCoo5eUPtwegBvlbFrtQdgsx3WPbK6VBsJRvCd
	WxLgHf4SdCCoo42UT0E3gl0QSiGtsyI8ds0NqiTXhISm7NLXP/rCllpiKCkDlw1pmwwY+OUC6Hz
	HIjY0LBCI0vDcmaKjtNUnrcQKacRyWGDG4UyxsgqtgMO07HquSY4yiIsI2W4WQtl1SlvxTJl3bR
	cyKV9AjIOXJr2ZohOgesoCGzaXUJGnIXR5Oo51p6qVfjHq1B/GFrd68FSReUeuBbPA1s7NNUMys
	eHyJp5NqrqylihPoKbRJBInJbyJOt/cXEa3ZJ//nGO5ID7oXeYh4bILe+rNs+JHtE0YXnGWotMv
	lY9MWYKwdOhUBx
X-Google-Smtp-Source: AGHT+IFDXWcxeK0ansnvS8D6N8J4pmENlNHFL9Jokjsm9G5CrdL7bnhQGMlEMGxcgihYNzJFEiflTg==
X-Received: by 2002:a92:c26c:0:b0:3e3:e78e:4dfd with SMTP id e9e14a558f8ab-3e41610ba62mr93262065ab.4.1754193506340;
        Sat, 02 Aug 2025 20:58:26 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:25 -0700 (PDT)
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
Subject: [PATCH v4 00/58] fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
Date: Sat,  2 Aug 2025 21:57:18 -0600
Message-ID: <20250803035816.603405-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


This series fixes dynamic-debug's support for DRM debug-categories.
Classmaps-v1 evaded full review, and got committed in 2 chunks:

  b7b4eebdba7b..6ea3bf466ac6    # core dyndbg changes
  0406faf25fb1..ee7d633f2dfb    # drm adoption

Then DRM-CI found a regression when booting with drm.debug=<initval>;
the callsites' static-keys under the drm-dbgs in drm.ko got enabled,
but those in drivers & helpers did not, since they weren't yet
modprobed, and didn't yet exist.

The fix is to retire DECLARE_DYNAMIC_DEBUG_CLASSMAP, and distinguish
DYNAMIC_DEBUG_CLASSMAP_USEs from _DEFINEs, then adjust the drivers to
_USE the CLASSMAP _DEFINEd by core drm.ko.  The _DEFINE exports the
classmap, the _USE refs it, adding a linkage dependency, just like
__drm_debug already does.

rev3 is here:
https://lore.kernel.org/lkml/20250402174156.1246171-1-jim.cromie@gmail.com/

changes since are minor:
 .rework several cleanup patches forward
 .code/doc/commit-msg tweaks for Louis Chauvet feedback.
 .refactor dyndbg dynamic-prefix to split TID from cacheable prefix
 .cflags for drivers/accel borrowing DRM.debug

Jim Cromie (58):
  docs/dyndbg: update examples \012 to \n
  docs/dyndbg: explain flags parse 1st
  test-dyndbg: fixup CLASSMAP usage error
  dyndbg: reword "class unknown," to "class:_UNKNOWN_"
  dyndbg: make ddebug_class_param union members same size
  dyndbg: drop NUM_TYPE_ARRAY
  dyndbg: tweak pr_fmt to avoid expansion conflicts
  dyndbg: reduce verbose/debug clutter
  dyndbg: refactor param_set_dyndbg_classes and below
  dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
  dyndbg: replace classmap list with a vector
  dyndbg: macrofy a 2-index for-loop pattern
  dyndbg,module: make proper substructs in _ddebug_info
  dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
  dyndbg: ddebug_table.mod_name down to _ddebug_info
  dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
  selftests-dyndbg: add a dynamic_debug run_tests target
  dyndbg: change __dynamic_func_call_cls* macros into expressions
  dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
  dyndbg: detect class_id reservation conflicts
  dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time
  dyndbg-test: change do_prints testpoint to accept a loopct
  dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
  dyndbg: treat comma as a token separator
  dyndbg: split multi-query strings with %
  selftests-dyndbg: add test_mod_submod
  dyndbg: drop "protection" of class'd pr_debugs from legacy queries
  dyndbg: restore classmap protection when theres a controlling_param
  docs/dyndbg: add classmap info to howto
  dyndbg: reserve flag-bit _DPRINTK_FLAGS_PREFIX_CACHED
  dyndbg: add _DPRINTK_FLAGS_INCL_LOOKUP for +mfsl flags
  dyndbg: refactor *dynamic_emit_prefix to split lookups
  drm: use correct ccflags-y spelling
  drm-dyndbg: adapt drm core to use dyndbg classmaps-v2
  drm-dyndbg: adapt DRM to invoke DYNAMIC_DEBUG_CLASSMAP_PARAM
  drm-print: fix config-dependent unused variable
  drm-dyndbg: DRM_CLASSMAP_USE in amdgpu driver
  drm-dyndbg: DRM_CLASSMAP_USE in i915 driver
  drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
  drm-dyndbg: DRM_CLASSMAP_USE in drm_dp_helper
  drm-dyndbg: DRM_CLASSMAP_USE in nouveau
  drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
  drm-dyndbg: add DRM_CLASSMAP_USE to virtio_gpu
  drm-dyndbg: add DRM_CLASSMAP_USE to simpledrm
  drm-dyndbg: add DRM_CLASSMAP_USE to bochs
  drm-dyndbg: add DRM_CLASSMAP_USE to etnaviv
  drm-dyndbg: add DRM_CLASSMAP_USE to gma500 driver
  drm-dyndbg: add DRM_CLASSMAP_USE to radeon
  drm-dyndbg: add DRM_CLASSMAP_USE to vmwgfx driver
  drm-dyndbg: add DRM_CLASSMAP_USE to vkms driver
  drm-dyndbg: add DRM_CLASSMAP_USE to udl driver
  drm-dyndbg: add DRM_CLASSMAP_USE to mgag200 driver
  drm-dyndbg: add DRM_CLASSMAP_USE to the gud driver
  drm-dyndbg: add DRM_CLASSMAP_USE to the qxl driver
  drm-dyndbg: add DRM_CLASSMAP_USE to the drm_gem_shmem_helper driver
  drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
  amdxdna: add -DDYNAMIC_DEBUG_MODULE to cflags - RFC
  accel: add -DDYNAMIC_DEBUG_MODULE to subdir-cflags - RFC

 .../admin-guide/dynamic-debug-howto.rst       | 187 ++++-
 MAINTAINERS                                   |   3 +-
 drivers/accel/Makefile                        |   2 +
 drivers/accel/amdxdna/Makefile                |   2 +
 drivers/gpu/drm/Kconfig.debug                 |   1 -
 drivers/gpu/drm/Makefile                      |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +-
 drivers/gpu/drm/display/drm_dp_helper.c       |  12 +-
 drivers/gpu/drm/drm_crtc_helper.c             |  12 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |   1 +
 drivers/gpu/drm/drm_print.c                   |  38 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         |   2 +
 drivers/gpu/drm/gma500/psb_drv.c              |   2 +
 drivers/gpu/drm/gud/gud_drv.c                 |   2 +
 drivers/gpu/drm/i915/i915_params.c            |  12 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c         |   2 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  12 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |   2 +
 drivers/gpu/drm/radeon/radeon_drv.c           |   2 +
 drivers/gpu/drm/sysfb/simpledrm.c             |   2 +
 drivers/gpu/drm/tiny/bochs.c                  |   2 +
 drivers/gpu/drm/udl/udl_main.c                |   2 +
 drivers/gpu/drm/virtio/virtgpu_drv.c          |   2 +
 drivers/gpu/drm/vkms/vkms_drv.c               |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   2 +
 drivers/gpu/drm/xe/xe_drm_client.c            |   2 +
 include/asm-generic/vmlinux.lds.h             |   5 +-
 include/drm/drm_print.h                       |  12 +
 include/linux/dynamic_debug.h                 | 254 +++++--
 kernel/module/main.c                          |  15 +-
 lib/Kconfig.debug                             |  24 +-
 lib/Makefile                                  |   5 +
 lib/dynamic_debug.c                           | 679 +++++++++++-------
 lib/test_dynamic_debug.c                      | 203 ++++--
 lib/test_dynamic_debug_submod.c               |  21 +
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/dynamic_debug/Makefile  |   9 +
 tools/testing/selftests/dynamic_debug/config  |   7 +
 .../dynamic_debug/dyndbg_selftest.sh          | 373 ++++++++++
 39 files changed, 1423 insertions(+), 508 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

-- 
2.50.1


