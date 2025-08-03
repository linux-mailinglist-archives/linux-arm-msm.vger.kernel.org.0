Return-Path: <linux-arm-msm+bounces-67557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F09BFB19280
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DFED1641C7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CC6289355;
	Sun,  3 Aug 2025 03:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eEijXF08"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651C7289804;
	Sun,  3 Aug 2025 03:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193578; cv=none; b=o3ZIrC6B+huZpMKvHlJJdBTYegA3Tp7+96DtrtwrS60zR3WAtTQ6ffkXxWQ4B+rjqkryv1cvk2UiMbMH8cEqTcdPpC3lOyWtQXPbwZ9lNZEv8oZ+mhv0A2t8HwHAT5ML5Uxh3KHpJeYDFS9FgLZmwj7miMFB+21h8G6Mw3Nr2Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193578; c=relaxed/simple;
	bh=1MlDlJ3OsgwYpJvGaUAnLZryHNKyoID1gz4OE6Ymt+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h6Ktp3dkM6tQDlrGwkqJ6FpzmhBD63px7ZWWos8Iiz9sPK3gVtAD5BqdwQjfmw0OmLP4muICg7M/nKBn+U+SzmxmGxwUdfsp4vETLQWI7PYGWAZnWra0f51VEdBCctliII+oQRV37QchnuDZUhiipw5UTwz/wk+MD7TH0H6yM8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eEijXF08; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-880f82dfc7fso170581439f.2;
        Sat, 02 Aug 2025 20:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193574; x=1754798374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyXTuG/pzO1S6KpBihte/IbjP5bnnmbeKtywtvutYYE=;
        b=eEijXF08cJXSK9v0OrHQ5f7fBY9ZWAf3ywlzr15rfWI1ImUzOH7CWWBETi8iUcyx/I
         ij9ocExyCiDTKWE5G+6CsqNgUertBIbiciKHzYj4FjlKzn1jKNtsYp5dtnzAsgOnuQs2
         Ha0FqSovVDbwX0HghAaqC4aVCMmoc/hu//3Oxso2WGSe4EtApwMazQQEGftnBxrvaGMb
         pXQdJpR/Az/wygpKIC41dZ/cZIrlLJNLnOu0GjVy4MqXSHhskT58f7mGTZM9kNuyin+Z
         2CDA1woqMDfARLJq3HDCwPK22gzthtSJMMA7UQJUo+UCOGpg/pedsMzSncnMcIYY4FTi
         L0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193574; x=1754798374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyXTuG/pzO1S6KpBihte/IbjP5bnnmbeKtywtvutYYE=;
        b=Ec/jC+togJvjBcOtkezY1ejlNr47g+WkUihdBpzwlnJYVOroKHQ115VXwpxOze78Bg
         g8r7UGtCzLZY0qAU5iDuAtz21K8eK0rJO8/FlJjV1JIgCh/yB3suu/QDKu7sxOnki3AG
         HVIHqRTXxzT21+tUw+Ffs26jif0LqnCKKn18Brg7ZEl3b3ox8sloGrziFrh6tY+GhDWD
         hEP1iCROHsAPW2+ty/4g0ltSHNTM7owi6pHb9fPOsBnd7zcVcAk4tzlcV/scbMuicwSl
         gQrB9nC8e1UyFWYyei82ZjWMcRqscGY/9ZUeFyyjr6TCbpQw2+Tp2ytdg52GoAqcLkkB
         evjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAKa8x6Qubj8KWwYvf40QOh2eOBy3dGWlJGmUhN2esCci3o6Ltb9B79Jddp2yHFjaEfIORnqOO2uW+A45X@vger.kernel.org
X-Gm-Message-State: AOJu0YzBUVsZQ9KaC7Kmo+AN4D6k2QCEmpBiZO6VGtZkhkl1TlIp9XHa
	SLpWtdD8wHcEZdPPE+02VG3SKgoaRizeW/soLTMjLnFAJ47PiBwfphGsLqfZIU4fFsM=
X-Gm-Gg: ASbGncu2+N4mrWCGWSXSD8OR64H0j0n2Rb7CEaQgSHDhMFQwG02Wwu4nCE3oyEvE4bU
	BPHrB6e7mFdUlxTvPBXR7nVk5JDWoYNc/PLYs66E+F4DtZUDhM6kO0V5iVRnfueYBI10/l0sMH1
	w5Yx/CuaUEEFCaMYDuPoKX+B+7lOajkzCEzpls32RimTEI7+JnILhIprTuo7217utjXgYcrX+3z
	lhtqDFX19AqYzDdRG5IKoB5LsmoAba78k2bqcXlhFlI2NTOmg5EiautEVHLw186u6rPYLqSqZfa
	ns9qMb4JRIQyVnny0KOukrCVt2Dx1T6Rf4gaZ/MTwkWQ0HHC5tNYz1064ngg4BSo9J5u3hvdsDb
	KLJWEjQbSHYoNSWaJP9qrdEfc5o6iR/xW0WmoCh9ma3GfeZAEEOdEM5FKa+OdLfPY906P/FS7Sw
	MQzQ==
X-Google-Smtp-Source: AGHT+IHHqpsxNwrIe1Yt8T+K5YT7f/N6jKSRjyJTXO375mjvAA+bcSXnn5xdTY/xrxu6S63FNdOpXA==
X-Received: by 2002:a05:6602:1545:b0:87c:41d0:9982 with SMTP id ca18e2360f4ac-881683515dfmr900119439f.6.1754193574199;
        Sat, 02 Aug 2025 20:59:34 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:33 -0700 (PDT)
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
Subject: [PATCH v4 41/58] drm-dyndbg: DRM_CLASSMAP_USE in nouveau
Date: Sat,  2 Aug 2025 21:57:59 -0600
Message-ID: <20250803035816.603405-42-jim.cromie@gmail.com>
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

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 1527b801f013a..67caebf768483 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -74,17 +74,7 @@
 #include "nouveau_uvmm.h"
 #include "nouveau_sched.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
-- 
2.50.1


