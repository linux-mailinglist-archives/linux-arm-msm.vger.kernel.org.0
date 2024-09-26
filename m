Return-Path: <linux-arm-msm+bounces-32618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C797A987A96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 23:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46A6A1F230D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 21:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFD9188A00;
	Thu, 26 Sep 2024 21:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNMN92c0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BD218732A;
	Thu, 26 Sep 2024 21:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727385435; cv=none; b=AVuCNkipp+rHRDqPOKP54YAROGD2i4k/Kk+LigxMu1YAc5rxyCx+d2aNXCE/6VlMQdEfmv1oyUBbhan0QLD12VuJklzaSEM95uwhEz0KbLUUpDej0wlfk/FI1PE76V0OH5RHA+5Yemen7ZrCm4x2E85XJHbXNYiSrw4RJF68C3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727385435; c=relaxed/simple;
	bh=tJ1kdgy3bb373sdl5Q1008Ilk7kEqd+hupf+/02stds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j4n33DyzwgL1WUuYHjDA/O77fMZVjCUyFFTOzvoVgyuyzIB6UYZkII2k9zbCR36vhhfaDKwiM+9V9fNhxiyIWTNrDmdnykqUxPXQ869Qdn9Lix1QEWgZP1/iD7AawYIX8xmvd+HNmA7UOe1Oq5AMUmCs8N2hk+C6364iN49jESQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNMN92c0; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a8a7cdfdd80so185124266b.0;
        Thu, 26 Sep 2024 14:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727385431; x=1727990231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMGC6v5HDzDrNYIW2Y0FsEmwdy21TIrXb2BCqk6p3s0=;
        b=jNMN92c01sWcuSh65zgfpPv/8/7VBtccRgfeMi9SPtoyrkZ46v8jYaGb3yHHMXbQhL
         7ejlPGog6sq6MOY4UlMRMc1xx4WSU1ZS5gklGK7raW1ekIZ11AhgW3sQs9X/IycnJra4
         z6xJVdU/5x1QD0zy2+nbihb+h37vUxQc10I4ANkWvPEZ5qgDaaA5z4C9fc7nQPK3zhQ2
         PnBWfFOxsaASAQYNjqBLWwH4Ir3WzcVxy4Tq4Cp/mv5jWT97tdaRg/wi3fmGAR02ezhD
         UPr/Xm/GoijK9vSNNAPXBDwnrrgkj+fRe2tRj+j4ILSmbklZ2xIUVNXm0vFuPvCEifnk
         xEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727385431; x=1727990231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMGC6v5HDzDrNYIW2Y0FsEmwdy21TIrXb2BCqk6p3s0=;
        b=VanVQsYSYEhu3xQqlo9l5Ou0SV1LUMVqG6anafK3+pDhCjmaYn/xEXxWATgHh31Dne
         wI+Sk7fw9H8/qTdZLdIDuV80qQfHyGEDrTIi1+5lJBYSVhzYmRSEJjQhxgFCSegLnpZp
         Wr36pIEP0vpixFf2k9jSd8vf0UGef4c26g3yOv0/r+6+bDn1/kpyA8aJ8W3daAZ+6oG5
         OBuZDXn40oQiSnArLg54iFgQCYhVTX50M00btIpkUi1relwmwU7aiCLm8ivqsb/JxH80
         KVvPJwO5zW3HoxNoYXp8geI4GnFN5qFmtWnGoqYffoZcCNHJeoB2xoHJlfnA+ir/cLYP
         P/jw==
X-Forwarded-Encrypted: i=1; AJvYcCVSLEUFVDEwhsRqh+1SMPgp5pylJ5CW+7G/muXs0hipv/JoAaQOqiNqxVOKifcY3QkLKYMR3ki5YdUK2x1N@vger.kernel.org, AJvYcCVoRQN0FHebdL/DCi2lPOGEqfnyFmDCFJOCE5WgeFLyjDOHDMLiKRyueXAIvEHrie9DMqoDTQuG/xg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZQoGKWj/q8OrfHZKnuDwGY89jvH+d9wYOKRSrA2lQtkbhDQyL
	NgH89XTEearTgqHxfH3HLSo0JUBY+9rqy31ePS9JuXJR90GkGL1x
X-Google-Smtp-Source: AGHT+IF3wB74LP8e01KeteynvoWXRYKiStHQCxFyGVIn7DZ24h+gS59rfuRv6C5BtBtaB1bmMgZlPw==
X-Received: by 2002:a17:907:6ea1:b0:a86:7b71:7b77 with SMTP id a640c23a62f3a-a93c4a69aabmr65376766b.44.1727385431312;
        Thu, 26 Sep 2024 14:17:11 -0700 (PDT)
Received: from [192.168.1.17] (a-lu6-5.tin.it. [212.216.221.196])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297b7d6sm38862166b.162.2024.09.26.14.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 14:17:11 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 26 Sep 2024 23:16:52 +0200
Subject: [PATCH v6 10/11] drm/msm/a6xx: Enable preemption for a750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-preemption-a750-t-v6-10-7b6e1ef3648f@gmail.com>
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
In-Reply-To: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727385413; l=5085;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=tJ1kdgy3bb373sdl5Q1008Ilk7kEqd+hupf+/02stds=;
 b=q7238TaQocQjp+PUMQZ+d4DhBkOkFQe3NljCUUn8Fz0W9ogcvQAFV8FxsHN+lAouE9LzY2IFF
 11r0seMR8B4DbfsHOYJ2fpnCNrJWluBiupVTh+xu568GeiXXv+Nr03f
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Initialize with 4 rings to enable preemption.

For now only on a750 as other targets require testing.

Add the "preemption_enabled" module parameter to override this for other
a7xx targets.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 3 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 6 +++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 1 +
 drivers/gpu/drm/msm/msm_submitqueue.c      | 6 +++++-
 5 files changed, 17 insertions(+), 3 deletions(-)

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
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 9b3ffca3f3b471f509918edd4a2fdb0f80dfeb06..2fc3eaf81f4461990d48065f67bf5477787708e9 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -161,6 +161,8 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	struct msm_drm_private *priv = drm->dev_private;
 	struct msm_gpu_submitqueue *queue;
 	enum drm_sched_priority sched_prio;
+	extern int enable_preemption;
+	bool preemption_supported;
 	unsigned ring_nr;
 	int ret;
 
@@ -170,7 +172,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	if (!priv->gpu)
 		return -ENODEV;
 
-	if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && priv->gpu->nr_rings == 1)
+	preemption_supported = priv->gpu->nr_rings == 1 && enable_preemption != 0;
+
+	if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && preemption_supported)
 		return -EINVAL;
 
 	ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);

-- 
2.46.1


