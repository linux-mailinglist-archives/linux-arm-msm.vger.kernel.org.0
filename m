Return-Path: <linux-arm-msm+bounces-31912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 582C697AF84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 13:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DD211C226B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 11:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67D7185B66;
	Tue, 17 Sep 2024 11:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtgIRTzw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E4C17DFE2;
	Tue, 17 Sep 2024 11:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726571675; cv=none; b=U4sTOZYT2m7kGRa+XEXydtDV4YNBe+KnF7RNg9CVlNoLTE25690PV7FTNSVj+is7W3L02TW56ypTfiBUjTkJQUy8iSmhK1N2WhnN9aPOJT+mozmOBmB3szF5Ki3B9iTZsWSScDVgQuYktpn4mXszAmrf3c02si90zBA3TvsGsII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726571675; c=relaxed/simple;
	bh=S/uPk1A6L6zoLEK5e3/J6SuTUVklEoPewqPKULcqefU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pgJouSerlsjzcm3Br+gE6VCFpdgudgLbDm+WSnHw6fRX7625j3/XWA4dzLpuGLHdxk0AVIgpqTuMwIbBrGG0IONQEesa5y7PdxU7QZelD3K/KAyt4aOITkopFyxVwUFzSDnIG/HGtNiFrU8MfDqKBmCzrtSnL8jeAex4aEzLL3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtgIRTzw; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c42bd0386cso4487151a12.2;
        Tue, 17 Sep 2024 04:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726571672; x=1727176472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XuxR3jfC4KGpIF8SEWZEG4Rd8w+GT5DWDiO6Yllrbvc=;
        b=WtgIRTzwRTrONJSRk6L1Ius+HQ4e7ad9czO/PH+EDqD3TTe+4rIZfFQ30PoFt3+v9a
         G6U2wyHzxR2dJvOGuOoifJGzK5S7H2s/MqDOTlInmiRdzPzjC9BNEf+iOfc9grNGup9K
         r8ozqYPvAQWfMmmpFbe/5NUkt84ypgv5dkisjlByNF2FUz/tyhnOaoxWFgEApPmsjRIU
         +HfVUXYgh9R5MhkOt9aiP4Da92O1NWwe2w6WkT+JfRlZPdftmsE1pkP7IfMzvBG0oFmL
         IjWvMpDztis23DqS+mg1U80KqSrh0F3V/ELzztyDHeMjK4oZt43dmpOmBtgKEb1sJSml
         S7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726571672; x=1727176472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuxR3jfC4KGpIF8SEWZEG4Rd8w+GT5DWDiO6Yllrbvc=;
        b=xDxQ+b7rStkCMF1X4X3gqlQU6Q6ifHBCoPX1agbm0QK3ohDqYVjNmfAN9GGs9a5YhR
         GX3ARQnr3EqP9lKnymKBmzK9O4A3L3t3byCphTN+xjgxiwgHaPDKrtzrKMW+UHBHIRRc
         JQomimrze31+REp+vlIizlNbYkOoxf/WBB/KVq+drSYj5aOVygSHz8bJYG4738ita3Vp
         JW4ZYVcgcp4EaODxuw6J6EOj61++V04XkfJlBiMWOM5FNSJTwi1EoLHNSrW5SK5GxCfm
         jTz9ETnJOTyJNOn34VOUAf3Ekc/43KBoTSGP3ujDDovR1VMlAxLhFNmZ2JgCv8ZYVQMx
         R3Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVUqv83btVFwuEEkOFSWFNJ8r5l0DCz+gW+pz8oa69gUrc+qAc9m+CuKxoHuFQhqiCCRutlYsiYDl0=@vger.kernel.org, AJvYcCWVqy1SfDP85ZRjrPp8cdfIMuBgcmfP+57EVtSOa63LZGo/cLMVARWTBwFWsQd5jZgfaA/gHAPIBb2CjIEC@vger.kernel.org
X-Gm-Message-State: AOJu0YxbQ8BeN6dxPgk6PsNwV93a/hsHIQoR5KsrIZHaPH2RPsPstFNM
	cS2vsWxBEh/PzEVwXAxKt9+SJWNZ5OoAlkLIG0Kxi/wZ/x7hMY7x
X-Google-Smtp-Source: AGHT+IEFbl5eP/8hHQSK7oCw/f7NgyjOx4ej01rgi8K9UZxyYfKhrU83g7TuGvWIseCmmQOBQX3IGA==
X-Received: by 2002:a17:906:478a:b0:a8a:8c04:ce9f with SMTP id a640c23a62f3a-a90296eabbemr2165571066b.52.1726571671751;
        Tue, 17 Sep 2024 04:14:31 -0700 (PDT)
Received: from [192.168.1.17] (host-82-51-105-30.retail.telecomitalia.it. [82.51.105.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612e1a55sm430745166b.157.2024.09.17.04.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 04:14:31 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 17 Sep 2024 13:14:20 +0200
Subject: [PATCH v4 10/11] drm/msm/A6xx: Enable preemption for A750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-preemption-a750-t-v4-10-95d48012e0ac@gmail.com>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
In-Reply-To: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726571652; l=3440;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=S/uPk1A6L6zoLEK5e3/J6SuTUVklEoPewqPKULcqefU=;
 b=3YqKkgH7Z0NA1nK01EBqUUZp8DWABMJ2ebOhsRZhphQvyRK90H56chUPa/k59UjjCahsUXi6K
 m6Fm5Zp246uDlqeR1vwHVA/SmqMX9XiUgIxWVgpvFgye9X25nwgWaul
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Initialize with 4 rings to enable preemption.

For now only on A750 as other targets require testing.

Add the "preemption_enabled" module parameter to override this for other
A7xx targets.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 6 +++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
 drivers/gpu/drm/msm/msm_drv.c             | 4 ++++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 316f23ca9167..0e3041b29419 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1240,7 +1240,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.gmem = 3 * SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV,
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION,
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index edbcb6d229ba..4760f9469613 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2529,6 +2529,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	struct a6xx_gpu *a6xx_gpu;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
+	extern int enable_preemption;
 	bool is_a7xx;
 	int ret;
 
@@ -2567,7 +2568,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
-	if (is_a7xx)
+	if ((enable_preemption == 1) || (enable_preemption == -1 &&
+	    (config->info->quirks & ADRENO_QUIRK_PREEMPTION)))
+		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 4);
+	else if (is_a7xx)
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
 	else if (adreno_has_gmu_wrapper(adreno_gpu))
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 87098567483b..d1cd53f05de6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -56,6 +56,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
 #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
 #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
+#define ADRENO_QUIRK_PREEMPTION			BIT(5)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9c33f4e3f822..7c64b20f5e3b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -58,6 +58,10 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
+int enable_preemption = -1;
+MODULE_PARM_DESC(enable_preemption, "Enable preemption (A7xx only) (1=on , 0=disable, -1=auto (default))");
+module_param(enable_preemption, int, 0600);
+
 #ifdef CONFIG_FAULT_INJECTION
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);

-- 
2.46.0


