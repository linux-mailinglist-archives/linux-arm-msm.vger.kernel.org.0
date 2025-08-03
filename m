Return-Path: <linux-arm-msm+bounces-67573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E076EB192A4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:10:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD54A3B94D3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B318728C5D2;
	Sun,  3 Aug 2025 03:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKPd0kDm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E508628C2D6;
	Sun,  3 Aug 2025 03:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193598; cv=none; b=eNWbXlVpxsE9eDkL5aLmzVlH8epDlTu6AwIBZMC5MLjFWTLceiDmXgrCJWD7h8FceAY1iowcFysARpxS1u8rU41wgnPBWI5JQerpcyPbbLsdu6bKlVkRtNyUUs6oBGfzngFk76CyTklDRl6atnaSxGFDnAdLjScdacYy4nlBmWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193598; c=relaxed/simple;
	bh=RBjRhhJunReBYeC8UhUGgQdGfGTrqKXIFdkExPYqf1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mDZTZJ/zk2/oax3HkHTip2/Ocq6wHOfBiKIo3R+h7+LPiEUvrSBwIMvkKwmEXU8D6tGkK0j8eV9vxBD0Z5UsPTUpT4AY7hXinZjTaC26nLcx8Wuecr8XNAUCE/7Nh84rJV7X+5FrKUAp7Eon1deTWpbtXSTvGpWNmDZ60YJ05bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKPd0kDm; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3e3f152700fso12489645ab.0;
        Sat, 02 Aug 2025 20:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193596; x=1754798396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ayWtPygJ2HBDiY24yxyRlwrUyqnG3sxcO8anqfHfeE=;
        b=YKPd0kDmKkOfL+KhXQL6gCbLNFhGu6gaHLeYkLi6lo6vJLZDaSCQnUXmjiQ1eQqPZw
         X8zx/pfbcSSiVwkdysFhHU+ZB1Cr8FJK2oBXJbvBYMVDThv3kIfts/xu7ABbPhae2OBc
         G5OVQ2IN2hbwgAq6BEcIdd2GwVE/AWgFgBNEfsRFYWmFKfOav7ZU0lsXDbclsoYYCWCy
         DmwwTjcvu80OsQSlqA9Qswn/Ki8W1IB2cgeQH+S7oaO7eTV2rX3LWHXax5Wn/HJ3inWa
         picObxDfky8iqBaPsRRQ260cYuW6mLuJW4rRIo04Adfi7uvxvA+kH7iBM65TNtTzVton
         CKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193596; x=1754798396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ayWtPygJ2HBDiY24yxyRlwrUyqnG3sxcO8anqfHfeE=;
        b=ScZJXWz+aQXcyW2A1M8rIUcC1U+MjZUTbdHNwM4y6uWtBGC93nLmjAiZqJboM3uHf1
         LRL9FDwlvghy5w+BRc5x5bblhOW0KkuVX/zS6mfVS2aQmIeeOiGFo7H6/7iFMKUyZVpU
         PqD0ptGMAQ2fpWlSOIu1+kJitkDsyPDuevkiG7JwN8GSHRRu/ddL1S4DKFkXDJaX12GT
         aEsoik43q2TFAssR13erg0UaJDg4N3DjHmVqWdjWFKhxh6E5pMbrLRdUwwWVsTnXfOsY
         xxGFzq17Tka6tAhWyI4W9NglXPJ3avaHznvptk4iWtSoWSOnkE8/dFgPRlbG07k8T6oS
         G2GA==
X-Forwarded-Encrypted: i=1; AJvYcCU1VMD8ylaA7pURVcFfYZNwQKL0tTd3QJt8BUBObnpj82Bxbnf/STXgrLXod6U4pmUFMrNfedcguXWqhIT+@vger.kernel.org
X-Gm-Message-State: AOJu0YyYw0duHm4HPBCqbgmXo+EbTzPcg+rVXPwsyUJnf7gr0XhytSUS
	Skjo4KIve3+PYwMA9KAcpATDZQxJpkFXMt9qmvUTYPLx+32SEOopd4Z9VJaG60rJhQ4=
X-Gm-Gg: ASbGnctHlkMriGUHAB3TQOxvuaFnH28FWblYQfDc5tVww0hB8YvAa37/PnfY9i9Seby
	2rErF+lR8j+dBeyB9safRUx/EV7LU2uEbogbpM94tCncFAZcWJp32OEyFfMuzIGxbfNeIbU49+l
	T3IN4rqZ0JlRkq5rIEXXMF8FUrm08skyLzQmf7yOzK82kbJjWLoJXX5GvBG2j6jwRWNTY3ELgY7
	Zemvc2eaovN+/nNK9yX7w9nEUEYk/GqMBo7q00gsiIOGOQ5rhkGRNzLfeAK9xkcfg8bjpDWJki+
	5kpP9mScR3cxznbvpfZOwIgWRtEfqEygIyGgYPfi8bBHMmLe2IfcNoT6geavWdjedxQTypsQDe9
	SGSnSul6CtCKd/zaVzG2mDseezGQNJnBtbLbh6FMleVFckNK3oWwysRw6GRtWIAZKYwM64c5RKo
	6j1HTyQkAFzs30
X-Google-Smtp-Source: AGHT+IE//iz8Ix/2Qpq304M23ozJJJm9YUKRCP4zX/GxkzB5VUsrG11JTXPFJK78GVVmx4p1MZOr2A==
X-Received: by 2002:a05:6e02:3093:b0:3e4:6d6:b436 with SMTP id e9e14a558f8ab-3e41618be54mr108220825ab.12.1754193595853;
        Sat, 02 Aug 2025 20:59:55 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:55 -0700 (PDT)
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
	kernel test robot <lkp@intel.com>,
	Min Ma <min.ma@amd.com>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v4 57/58] amdxdna: add -DDYNAMIC_DEBUG_MODULE to cflags - RFC
Date: Sat,  2 Aug 2025 21:58:15 -0600
Message-ID: <20250803035816.603405-58-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

with DRM_USE_DYNAMIC_DEBUG=y now un-BROKEN

for configs like:

  CONFIG_DRM_USE_DYNAMIC_DEBUG=y
  # CONFIG_DYNAMIC_DEBUG is not set
  CONFIG_DYNAMIC_DEBUG_CORE=y

this module gets macro breakage:

                 from ../drivers/accel/amdxdna/aie2_ctx.c:8:
../drivers/accel/amdxdna/aie2_ctx.c: In function ‘aie2_hwctx_restart’:
../include/drm/drm_print.h:578:9: error: implicit declaration of function ‘_dynamic_func_call_cls’ [-Wimplicit-function-declaration]
  578 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
      |         ^~~~~~~~~~~~~~~~~~~~~~
../include/drm/drm_print.h:663:9: note: in expansion of macro ‘drm_dev_dbg’
  663 |         drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~
../include/drm/drm_print.h:681:33: note: in expansion of macro ‘drm_dbg_driver’
  681 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
      |                                 ^~~~~~~~~~~~~~
../drivers/accel/amdxdna/amdxdna_pci_drv.h:15:41: note: in expansion of macro ‘drm_dbg’
   15 | #define XDNA_DBG(xdna, fmt, args...)    drm_dbg(&(xdna)->ddev, fmt, ##args)
      |                                         ^~~~~~~
../drivers/accel/amdxdna/aie2_ctx.c:76:17: note: in expansion of macro ‘XDNA_DBG’
   76 |                 XDNA_DBG(xdna, "hwctx is not ready, status %d", hwctx->status);
      |                 ^~~~~~~~

These sources include drm_print.h, which includes dynamic_debug.h and
then checks DRM_USE_DYNAMIC_DEBUG, to decide if drm_dbg() rides on
dynamic-debug underneath.

DRM_USE_DYNAMIC_DEBUG is possible with DYNAMIC_DEBUG_CORE alone, but
dynamic_debug.h also requires DYNAMIC_DEBUG_MODULE before defining
those macros above.

drm/Makefile adds this to cflags on behalf of all drivers, do so for
this driver.  TBC: do subdir-cflags in drivers/accel/Makefile instead,
for all accel/* modules.

RFC: Maybe decouple from DRM, at least the DRM_USE_DYNAMIC_DEBUG
itself (ie just CONFIG_DYNAMIC_DEBUG_CORE).  Its not obvious that
XDNA_DBG should be categorized with DRM_UT_DRIVER by default.

Do we need a new DRM_UT_ACCEL category ?

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508012015.2l89ZOLg-lkp@intel.com/
CC: Jason Baron <jbaron@akamai.com>
CC: Min Ma <min.ma@amd.com>
CC: Lizhi Hou <lizhi.hou@amd.com>
CC: Oded Gabbay <ogabbay@kernel.org>
CC: dri-devel@lists.freedesktop.org
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: David Airlie <airlied@gmail.com>
CC: Simona Vetter <simona@ffwll.ch>

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/accel/amdxdna/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
index 0e9adf6890a01..800f81f5a7023 100644
--- a/drivers/accel/amdxdna/Makefile
+++ b/drivers/accel/amdxdna/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+ccflags-$(CONFIG_DYNAMIC_DEBUG_CORE) += -DDYNAMIC_DEBUG_MODULE
+
 amdxdna-y := \
 	aie2_ctx.o \
 	aie2_error.o \
-- 
2.50.1


