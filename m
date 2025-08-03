Return-Path: <linux-arm-msm+bounces-67551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D63B19273
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EC1B17A54F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CD12882CE;
	Sun,  3 Aug 2025 03:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cs+Iy54w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244A92882D9;
	Sun,  3 Aug 2025 03:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193568; cv=none; b=WNGz6U7Ctef0itsVxtJm93OSlcsE/YhJZKvcQ/3VnUlix/n7Ayj6ei/O8Hkn/8hv6r9SSJC7KqaCBrVYTr1KV9XNcxnnG2q+xAuY0yFvC+f8116xPFNxtWu71QMmJYSTdG6UGEZUcMfg7r5SzE+lF6oAXadZ3rbIBW7RhPtmogg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193568; c=relaxed/simple;
	bh=PX9WCXb5F8CSwcxQi5N9WJNdwHa/mMWtQGYqtojaU/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MsXp+QO6KQQj25c469jdEmn2YHe1B7d1VYe2MFYVykexrzt1cyQwvx8ggsFjDWrthX9/94lZ2IefRJQD6pN5ENbycYIaw8eUgK18kI05SzTQwNIvjSJepcEarzvxw9v8VKP77Rp3DEt8Yg2PRI1giw7gH3pzMxVVz1zuDQ5LuRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cs+Iy54w; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3e3f378ea68so21345705ab.1;
        Sat, 02 Aug 2025 20:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193566; x=1754798366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPCuAnoyt2yaK7PHqEP4KAuT17bxG8DAm/V2Pw+3mVE=;
        b=Cs+Iy54wigTQZ1OnQPHLZ0Ni3z7++hBa3UEkPe1J6/jC7tdy6Ggu/dWMnnujbPuoNA
         zSrmMqDvAXZUM7nrEBfRgYCd030bDIR/jogli7RmCnv++e7JUta0KvUTn+VzbGAog2Gy
         JZwT0nM/Ai+RuKyuXQQRE+kjUwSNmOHD2E8GYjr7LSqDrrPQPz1s13Lfx30KvyG5Sagq
         aTSo3AywtTbkT6OYomaPKcZbAOnX4ylbrU7ekHgELegL1Hp2cpbkKm3HkpBv06b11h2j
         FZCfk53AgC1sZSRxewwG0bn6GWTbsCtKkcbJgnaMxOirwcdqwhoSFksiNiXuNlSWOn9C
         DeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193566; x=1754798366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPCuAnoyt2yaK7PHqEP4KAuT17bxG8DAm/V2Pw+3mVE=;
        b=KnMJQ/Yw+c2VnvfQa59CW/mQFpdxbnSlXMJAp4onEVbwRrdKoNbT60SLjLe0gBtJ+l
         6qstt5NrwQycZbIj92hNBDTQkGFWOjQc7l8BWIDsZ6E5qMTf6DOFx/DfpbqcruFz80sx
         ddOBEwILbVkW5JpYzlixtD3pWTOcMwcfoND4bBPH/AC1NxW/0Yw/EpAGi4dIImhgDMol
         Wsyitn9v2F/f+ltl2olZuHAtIk+4g3M+/ll7PXWhoOqwnMAOJnh29OVw2ivkE4JFDY4k
         T2K8ZZukgdNU7XOINLzAIGsWMnxI1HpC2dMcnfvFJZ2SlkuHknSMjixUIDU/9g4GonRB
         tiug==
X-Forwarded-Encrypted: i=1; AJvYcCWmhU59R9cZmadVPZfC7Dk/Cvo1WtEiKKQg0IiqP/BVan24Bu2jCGdMwnzwVapMnUP4qxMSZv14Cu3c3vBb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzjg0l+kHGBZrUMFOJe4aRsynPBZKWkfSh92hjrN6DCKE2vafu
	AohjIzehmI/ycdv0kYrnuTDTp+B536JFjNbo1qEb+QF+KgQ5W93BCR6tMOZ7BhclczQ=
X-Gm-Gg: ASbGncspbigPy6eU4FwrAaSIDVOwtQGwRizqTRhj6PwiotE4fYd5qJk8nY6bcE8+s8S
	GZ3p8/CHugb5t64P61Qp15w6Al0vExhSnQHNxvyI9uVDVrQvSWLrQ3h8GBqu8Jgj8u0PC1IaTnX
	OnSZVTHUKd1CWFeFfaNx+/FHKFREIoKMvMwM7O93fxNzCuUbNm5/QLrB86wNx95Vt8ZjbgohoVx
	bcPqcBDi3I7crE2N7P6v+tYmmO2WirYuESl/wgsvZ8I1iYClmwFuw8aDYQkFFQFyAJ2eJjXC8pV
	fEo3H9V1f7XPOmjuHNtVUui/Dld2m4xA+pY6KdyfcYULoUTMlgWiN3Qg1X2mBG99e00Pf5nem96
	vRoxXeKyqzvLJwQRihvjn4dWsCp76tGZwdip/aGUwJg8IZxoKkmk6eOC94OeV0YBgwXRZCPVG4R
	CnMVDqirYW00Br
X-Google-Smtp-Source: AGHT+IGoLnVRK0ZsQUveSL4ZB3Aom5SaUMztjFiNEQTdBWyQuqxM4dmylhRHkY6dHcuDvZjPdgtOKg==
X-Received: by 2002:a05:6e02:308a:b0:3e3:fc9e:b2d4 with SMTP id e9e14a558f8ab-3e416176df0mr85880415ab.10.1754193566087;
        Sat, 02 Aug 2025 20:59:26 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:25 -0700 (PDT)
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
Subject: [PATCH v4 35/58] drm-dyndbg: adapt DRM to invoke DYNAMIC_DEBUG_CLASSMAP_PARAM
Date: Sat,  2 Aug 2025 21:57:53 -0600
Message-ID: <20250803035816.603405-36-jim.cromie@gmail.com>
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

Invoke DYNAMIC_DEBUG_CLASSMAP_PARAM to hook drm.debug (__drm_debug) to the
DRM_UT_* classmap, replacing the ad-hoc wiring previously doing it.

Add DRM_CLASSMAP_* adapter macros to selectively use
DYNAMIC_DEBUG_CLASSMAP_* when DRM_USE_DYNAMIC_DEBUG=y is configured.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_print.c | 8 ++------
 include/drm/drm_print.h     | 4 ++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index a3b70d104afaa..46d53fe302047 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -69,12 +69,8 @@ DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
 		    "DRM_UT_DP",
 		    "DRM_UT_DRMRES");
 
-static struct ddebug_class_param drm_debug_bitmap = {
-	.bits = &__drm_debug,
-	.flags = "p",
-	.map = &drm_debug_classes,
-};
-module_param_cb(debug, &param_ops_dyndbg_classes, &drm_debug_bitmap, 0600);
+DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
+
 #endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 03b0a2bbf91b3..769036b2942b8 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -144,9 +144,13 @@ enum drm_debug_category {
 #ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
 #define DRM_CLASSMAP_DEFINE(...)    DYNAMIC_DEBUG_CLASSMAP_DEFINE(__VA_ARGS__)
 #define DRM_CLASSMAP_USE(name)      DYNAMIC_DEBUG_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...) DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(__VA_ARGS__)
+#define DRM_CLASSMAP_PARAM(...)     DYNAMIC_DEBUG_CLASSMAP_PARAM(__VA_ARGS__)
 #else
 #define DRM_CLASSMAP_DEFINE(...)
 #define DRM_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...)
+#define DRM_CLASSMAP_PARAM(...)
 #endif
 
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
-- 
2.50.1


