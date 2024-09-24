Return-Path: <linux-arm-msm+bounces-32286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFB19844CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 13:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 457D4281C5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 11:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E798A1AC435;
	Tue, 24 Sep 2024 11:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2uVFuu5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184FC1ABECA;
	Tue, 24 Sep 2024 11:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727177459; cv=none; b=YsFohqnhZYQKoqjedDUbe6rhUN7kh15pPA+6NABxliSqUvahuP9Rbr/ej0drL46b8ZccvimTLPHDzQqGmMiASckLQX92mlTJb9b5eb+kXoIoFpsEh97WQ/FjyfqfD2CmJg4age1QR5Ae5n2x5DYpgUjdG7EcPmsaxlfZa9/+oFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727177459; c=relaxed/simple;
	bh=sm9hanaGRS16RZfX1ly7ITrlxWebFBdSbkyJsPoWlBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iZ7JiZtYH9xQuxhPdouV2DT24T1U97vK9L2ur+XzYf5VQPOcjC99tkoL7OCzX0WWgYQ/2mTv1Bxb0evr6kA4fea2p/rSEq0OW/EPJeHssNKcazE2SG/q+lUsrKDkx/ie5yu6eDJcpMCDTiPg39L/CKcV1XlXe7VEZyz8FoyYuYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2uVFuu5; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8d6d0fe021so894771566b.1;
        Tue, 24 Sep 2024 04:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727177456; x=1727782256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T83s0xZ77l7YiPJQjU4R2cbGSxzbmPdpWc03YQ0vP9s=;
        b=G2uVFuu5sw9mP8H4ip2YBi2Ky6OnqUxBTg6TFq5nr2ZJ2xo4knzUKHWCsViT5QCdLw
         bRsFAg5M8NdOh41tnFoIxnZR746m3gtYkywD+qFfoQW0ZVU7DC8R+vCtq9x93clmTYJD
         PZwJmvPZDJocqJai7tPengFMq8pRyWO68tB51UMKfcS8nFYEJ3DonXind886HMaAUu/u
         5YvhdrGQEJLxf9b0QLju4GimKE6YAi774y8RMQkr+2lPdo6Q2ufRW8xLAR3w7++y1tw3
         MxE4kVRuBSrkMGQACRlBDnOspMWZBGDtA5vY10DqPY4g5Mm0s464gAg+T+5WnlUaM3OW
         Zplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727177456; x=1727782256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T83s0xZ77l7YiPJQjU4R2cbGSxzbmPdpWc03YQ0vP9s=;
        b=ag9YBOlGo7eTaYEFFPvESF2EHRIc9She5Q+LNK3psupkXVibSKN8BENerSGWjLSYEV
         Y/dLQFbkFgzsWHi8QKucdIa9HTFNf2NZBVQFyEa07tuBpjygrz/AyqtgKdCZZz+IhUxF
         VsabsVV8Mn2TSYfQuynKQe5XZjDQ253w+hpL7xyg1pTdT7BsixqZaAAwbGvozQUGkAI9
         0G+a5ek8UwgW8N4O5TAZxa+4IlAebezHnfRtZxPVrxZN296ox5q35uBzGJjXiCTxuLOn
         7FyR/vyY2nOetSDN3Zce/724TOsRCkhdshnZCAT0i/UqTuTVn86b5FseO8z1VHScYm2F
         exJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrI7iB9Qgoiy4vFVHJfDg3Uh9gdxsPJ8pUyUHgOspaXRtQ1LLudgadgmP0X3gvwilv8Zg3FWR6YR71rU0A@vger.kernel.org, AJvYcCXCOsbKkNuvP7H3eW62Fju7l46TedieBtV63BwYGfGBeWiZqVdmn2t4cGttolAiBfYIYm0D8i8B5Ko=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhbQ2ILzOmL3C7nXAtfUnEksBU7A/uAGtSCmg5np9W0f/RGtb6
	4roNLlEEeJOhGsyYO566q9jqXfexYwSAKpt3wWICXuzb4UUa1q7v24gGQ+eL
X-Google-Smtp-Source: AGHT+IHzITFJBQBOI6Od6A8yXGnuggjC4ofP7uNdX7aHomBgU3s1nRHgaOTt/jI/hvsoBLh0+MUDjw==
X-Received: by 2002:a17:907:f74e:b0:a86:9c41:cfc1 with SMTP id a640c23a62f3a-a90d4fe01e1mr1426129666b.8.1727177456317;
        Tue, 24 Sep 2024 04:30:56 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it. [87.7.171.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930cae0fsm72612766b.120.2024.09.24.04.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 04:30:56 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 24 Sep 2024 13:30:45 +0200
Subject: [PATCH v5 10/11] drm/msm/A6xx: Enable preemption for A750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-preemption-a750-t-v5-10-0be2bf81c187@gmail.com>
References: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
In-Reply-To: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727177437; l=3953;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=sm9hanaGRS16RZfX1ly7ITrlxWebFBdSbkyJsPoWlBc=;
 b=5jfqYFhN2eShGqsYyYpOlxaTj84UM3HppgBbzgf3lt8IUti4AVbDgN7q71k7ecpT0AeYM81n0
 7XPW2ONeBHJCF+NeEn+fg5T6o6TysRAytAwMTgegbVVPq8JuxZfx/aj
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Initialize with 4 rings to enable preemption.

For now only on A750 as other targets require testing.

Add the "preemption_enabled" module parameter to override this for other
A7xx targets.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 3 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 6 +++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 1 +
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 316f23ca91671d973797f2a5b69344f376707325..0e3041b2941905f1acdc9e571e0549a960a7edfa 100644
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
index edbcb6d229ba614be910ee70e75731538116e4a4..4760f9469613c0bf208f56be9608747b5aa75606 100644
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
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index cfc74a9e2646d3de76a06bd67457d69afa49e309..9ffe91920fbfb4841b28aabec9fbde94539fdd83 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -20,6 +20,10 @@ bool allow_vram_carveout = false;
 MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in place of IOMMU");
 module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600);
 
+int enable_preemption = -1;
+MODULE_PARM_DESC(enable_preemption, "Enable preemption (A7xx only) (1=on , 0=disable, -1=auto (default))");
+module_param(enable_preemption, int, 0600);
+
 extern const struct adreno_gpulist a2xx_gpulist;
 extern const struct adreno_gpulist a3xx_gpulist;
 extern const struct adreno_gpulist a4xx_gpulist;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 87098567483b69c21025b80f356e0a68f0e7f172..d1cd53f05de68b3873f35520655e09e82fc40449 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -56,6 +56,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
 #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
 #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
+#define ADRENO_QUIRK_PREEMPTION			BIT(5)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.

-- 
2.46.1


