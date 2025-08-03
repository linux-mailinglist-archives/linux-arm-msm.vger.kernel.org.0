Return-Path: <linux-arm-msm+bounces-67574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF98B192A1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97AD61884E1D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3B528C85A;
	Sun,  3 Aug 2025 03:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eu7Q6Rr7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539B028C5BA;
	Sun,  3 Aug 2025 03:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193599; cv=none; b=OkhOkZ+mWx0RAkX25PTZO4nKhf+PTcxMBUmeW5VzOK2Y4OXOkKv2+y94Usu4FQs7BV2wSKsw4OAdIiqmrjrL/ZOXGoOPh8CsjI8Z02BLwTYlNywnWWNjK9U5NTHaQPRha517+9x/S01B8TMDy7IN0Zakj5QxQbeW2WP3rdFgZMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193599; c=relaxed/simple;
	bh=X8cJQOCd2dU0zx+9xJvSUWkDqmIMbghrLU91KjmtJP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=euM0b2KbrVfmWEsKoyZGHTTE5jEAu1KMEF/jsU+S+ReQwMbtn6N2FpmuOkU5BIFc8PFLRZ76PQyJlss2ty5JtibMtyaw66bVV6LTqjIzkMBTaAHucXLZ0O3aRUvvZCDdWJzWpuDFxfzT5TMF847yXqmFcX+3p6ExkfVT0rPMzPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eu7Q6Rr7; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3e3f0f29d09so9438365ab.2;
        Sat, 02 Aug 2025 20:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193597; x=1754798397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6zBJEgANuVffuY9NQJyHG8/+Xeax9coZJWuW6ZJ2WM=;
        b=Eu7Q6Rr7877GuIUPAh84THAHkMhvHGmN7Ng2tLRUxiOUwk+tbHFxvQ3nc6vrDm3GEc
         8WyJm/P4W8CpV5WsvOpG/IRg4zv6ALBn1p7/8Hjw7cHo024gcx8BDXMWbp81d6rwjUZr
         9VK5D6zdS1JLDwVF9NI6qzhjWK/JF505UJeTu0a/ZUivwVNnWXcG3gSr591KNq7aIwTc
         ChVma8x6v0dsNlsqr+I7IW630eDbkhtEi7F87LG9OB2fIym7UbGm8uhvedz+qV8teWwq
         39hUl6Sz3fFYR6m2wuFtwgfNI91WlHsXVKOdePEORy4erce0cKW9h1MDeZmapRPz3OYR
         i3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193597; x=1754798397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6zBJEgANuVffuY9NQJyHG8/+Xeax9coZJWuW6ZJ2WM=;
        b=KGoiXYDhZytjKj4hlOmJvZBCGZEXyKgf+XwVAD+U/rUIXPCIDixYlaofHM4Zi0ITVQ
         JE0Xo+XCzGOcWnCop5A8xuqj0OAeDSI6VjNprOhunEYyAYZlFXPTr2ZyWnrMdrf/Hp1X
         VEFTsrmvrw91NKnNN2i/YmsBZDNQdHvjzILywOEgruNKcX256dMCfLdkOVjQQXzSOSbf
         rYZFke/lOV2fC8JdN4xkLVy7sR34QAFoqto9TiW4hjVDOiM7Vz+4OImO1P94hjXyXQ3C
         ABfdk8nWBI33+zuNmCJzYiZLrZLvZGlnk0eMbQNGKu3R/CVIKnpHzD1RDKZHuOcwAK94
         Ao3w==
X-Forwarded-Encrypted: i=1; AJvYcCUhQ550pJeLN8L3p0HCDs9/85RRZ+I4N0L/YJtZ+YBbfDoqkQuLMq8e0FrF6445j187mKwggocbiFS87ikE@vger.kernel.org
X-Gm-Message-State: AOJu0YxkpSRKZoq3f/XB0ib0qDeWAkKAf1N4pOeu0VJ8LgBK27ck4H4w
	hy5C/z+qe2097xGmazpfHj2XDgWUZRpDXN9zoKTVm19GIU21EgDa82r/laU/vfMgZoA=
X-Gm-Gg: ASbGncvgPs91LvsgyV1b3yHm6GHc6SewBvLzjqVJ1ftWMe9NoBF7lm7NW3v6teuAwxU
	Ak2IHYFfGnBn/A8CB7RJlFweTK0IRNSRrjBZGvLFPThr6ryoWPPwdmaJUf1c4xxbQ2/d9eQuj6g
	jPW3P1th3taAkf7jktjbC0BtxBmumWZW8uyb8kzcwYCmlNtTlxYVxBf7DjZc3SYSgKZ61I0w3q8
	7OqIvBmUlRa7P4814arTfiewVXL0v8EmPvvicssRKef2NWXnJfyX4+W4/eS6a1TUDWG2KxmbZBP
	SFEw1x/4lIRjWswJryq8HIwKqOJSMSOOFyZ+gGK3/fBVZ1EdXQv3EQHYpb/TyVSt2pZCtZBIaxI
	W0b/Lq40r0DdDF6NgZJMDzEK3y+PsVGfOjGb5wNZ6P8GT+HgKob0wC8KYK8UQN76PJ6c7UoSNqS
	d7kf4qhap+qjja
X-Google-Smtp-Source: AGHT+IGUOgHvStYGi2AGuiva7QKSCj6X9DfG9+bxlaldERvaqq+8SW2QK11YiYCBPzmbmAT64CKkJw==
X-Received: by 2002:a05:6602:6c01:b0:881:4a70:4651 with SMTP id ca18e2360f4ac-88168309e74mr805665539f.3.1754193597187;
        Sat, 02 Aug 2025 20:59:57 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:56 -0700 (PDT)
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
Subject: [PATCH v4 58/58] accel: add -DDYNAMIC_DEBUG_MODULE to subdir-cflags - RFC
Date: Sat,  2 Aug 2025 21:58:16 -0600
Message-ID: <20250803035816.603405-59-jim.cromie@gmail.com>
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

Currently amdxdna uses drm_dbg, so it needs this cflag in order to
compile; it currently gets the cflag from its own Makefile.

If other accel modules want to use DRM.debug, they will need this flag
too, so add it in accel/Makefile.

NOTE: ivpu has its own CLASS-ish dbg system:

./drivers/accel/ivpu$ grep IVPU_DBG_ *
ivpu_drv.c:MODULE_PARM_DESC(dbg_mask, "Driver debug mask. See IVPU_DBG_* macros.");
ivpu_drv.h:#define IVPU_DBG_REG	 BIT(0)
ivpu_drv.h:#define IVPU_DBG_IRQ	 BIT(1)
ivpu_drv.h:#define IVPU_DBG_MMU	 BIT(2)
ivpu_drv.h:#define IVPU_DBG_FILE	 BIT(3)
ivpu_drv.h:#define IVPU_DBG_MISC	 BIT(4)
ivpu_drv.h:#define IVPU_DBG_FW_BOOT BIT(5)
ivpu_drv.h:#define IVPU_DBG_PM	 BIT(6)
ivpu_drv.h:#define IVPU_DBG_IPC	 BIT(7)
ivpu_drv.h:#define IVPU_DBG_BO	 BIT(8)
ivpu_drv.h:#define IVPU_DBG_JOB	 BIT(9)
ivpu_drv.h:#define IVPU_DBG_JSM	 BIT(10)
ivpu_drv.h:#define IVPU_DBG_KREF	 BIT(11)
ivpu_drv.h:#define IVPU_DBG_RPM	 BIT(12)
ivpu_drv.h:#define IVPU_DBG_MMU_MAP BIT(13)
ivpu_drv.h:	if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                         \

./drivers/accel/ivpu$ grep ivpu_dbg * | cut -f1,2 -d, | cut -d: -f2- | perl -pe 's/\s+/ /' | sort -u
extern int ivpu_dbg_mask;
 if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                         \
int ivpu_dbg_mask;
 ivpu_dbg_bo(vdev, bo
 ivpu_dbg(vdev, BO
 ivpu_dbg(vdev, FILE
 ivpu_dbg(vdev, FW_BOOT
 ivpu_dbg(vdev, IPC
 ivpu_dbg(vdev, IRQ
 ivpu_dbg(vdev, JOB
 ivpu_dbg(vdev, JSM
 ivpu_dbg(vdev, KREF
 ivpu_dbg(vdev, MISC
 ivpu_dbg(vdev, MMU
 ivpu_dbg(vdev, MMU_MAP
 ivpu_dbg(vdev, PM
 ivpu_dbg(vdev, REG
module_param_named(dbg_mask, ivpu_dbg_mask
static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo

This looks readily convertible to a dyndbg classmap and controlling kparam.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/accel/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index a301fb6089d4c..e437549cba8ac 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+subdir-cflags-$(CONFIG_DYNAMIC_DEBUG_CORE) == -DDYNAMIC_DEBUG_MODULE
+
 obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
-- 
2.50.1


