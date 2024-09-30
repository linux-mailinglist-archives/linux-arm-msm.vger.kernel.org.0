Return-Path: <linux-arm-msm+bounces-32786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 507D698A635
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 15:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68B3C1C22763
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 13:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9AA6196D90;
	Mon, 30 Sep 2024 13:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FecbJAUC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C330F194ADB;
	Mon, 30 Sep 2024 13:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704382; cv=none; b=MH1mwwrucqh/ZkYCF5WL31eQZaSVtNkcmWgiFysjDRHBui8MmNz7a2XIR2YdWGgTVAS2XP7GZQQ7OiwFGUNyHE6O5Qi+nJPmXTfk9mjHihjoakuQyAj5KRk1m4Sj04cgAe+ePRCEgnGeUWFJFlMCySONlhmAZCJxxp5GS+P0Upg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704382; c=relaxed/simple;
	bh=v6B4qmUJBsuB41vVTIX8n9r0BxOexKUVJScDHt92rI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LWHSV7kjEasq1krUHHsxs/YbJR/E31AHpZn00FxrgeaFFlwH4s4+DzyUK0llnLVqjzc72glfZJYvVocaT8Rs21JfCq1ld8kg0GE1yW18SeUowjdpleZyeAWzpOow2IpFB91iI+61nmtqioTjPzNAKNnek9FSYEuE9joUk88Rn7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FecbJAUC; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c88e4a7c53so2223453a12.0;
        Mon, 30 Sep 2024 06:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727704379; x=1728309179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UcDFJwhFLvVfPmPv2/FHaJHKAbewBbg+EsVPbTO1gVo=;
        b=FecbJAUC+jx/m0xMPO+vVbMP0eddLtTwy4GQjnTtdFUlS6ADzKL9A5ON9NuIAA2nkA
         +t7QHf9hOt+hS2ZiNV8Pjz3an3JwJ+oJSZK2Sr6Tk5PuXkSvtLNH1gJA2w0w1diEkdG9
         GjVxtebt+OIxrlFFTbvlBOdwz2JlIScNDeIhW4vnMfwK34fLuJWSNNlqU0mj+QYQCVnH
         llFDwQ1UCkWeWqaLRT6YcoWgU4wbpo7pNmlpoySJNKHEPIbxp9zkVbN7LF6VYuq5w+Xn
         ClZjztCW6S2gpHvJ7Ms35eB/Xiz805s1I5XRwD/WEjaDcyiYOjCtVe253SHrkFkGj6Lo
         OMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727704379; x=1728309179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcDFJwhFLvVfPmPv2/FHaJHKAbewBbg+EsVPbTO1gVo=;
        b=bSo7AQcVnobPWgqm+ebiPegjmJyopPsiL6s3nVO9qOWIeb0s7nBASHyXre1L5BiMY/
         PM4RVbmi2OWwZmUWmmn6EPpYoBJM2+TXeWJ0V1qYysOXxch+hV0ShhoePnHaA7UoIOjs
         hvEW1hWnvvyp9FOjYqvWF+xXvDkzyvDUYu5z9vkg+6ytZ6RX8zejrL/+tMs5h6e2Ywa5
         wdeRFAEkiRQ/Lh8GIQ1pqoAKS+QKxy37YkTHOwQ5ndTwPOMn70BHj+twhIuqL5N/wyzi
         BKg4cObcMh3muurrkEdJS9F4s4V/c2WHOznhf2D6ZbiH/3sUXX8FzqMOAXiWfy0yoL2K
         cjmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdUHRtT61vQP9WsAu3+APPZyl9a3wuTpeJ9k24PwclakL1cHsJwJ9HyHiypJxVwlkE0dWPvhv5/u8=@vger.kernel.org, AJvYcCXsJ/3CsF2lQ40hin1pcI3H0HqJPccytS+V6WJ9YITp0AZYJfbugErrD/lDC1iMEJhVpL9K5QGLNsLGM1WK@vger.kernel.org
X-Gm-Message-State: AOJu0YzvjwiOhHn4+yPHsoHr2OWbRwIpAe5lGdkmVXdrWq0OetYcdc1O
	/ERe0HPiDAOEE90xbEXFjSRKpyXt8wD8HgLPKKlwPLhlnaRZ/hcz
X-Google-Smtp-Source: AGHT+IH8gsPCkKHhKBantAB3eRoUCZP14jJljiol7upU63dcVQ1G+EI4dcRCELjVqPqc414+GDvqow==
X-Received: by 2002:a05:6402:520e:b0:5c8:8610:98b0 with SMTP id 4fb4d7f45d1cf-5c886109966mr7775163a12.27.1727704379074;
        Mon, 30 Sep 2024 06:52:59 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it. [95.250.55.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 06:52:58 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Mon, 30 Sep 2024 15:52:46 +0200
Subject: [PATCH v7 11/12] drm/msm/a6xx: Enable preemption for a750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-preemption-a750-t-v7-11-47803c7a5a64@gmail.com>
References: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
In-Reply-To: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=6298;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=v6B4qmUJBsuB41vVTIX8n9r0BxOexKUVJScDHt92rI8=;
 b=IU2tkVpM6i1rJVydvzIOhaHq4YWV4yREzGkTdNK9qBK2DBmHQq+nG/St5qwljs4dn9Z5c4kH/
 OmAx7svbP+UBYcjtvG66FXDUB4tVBOascpk7p8lyKPSad7O7mvpclxn
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Initialize with 4 rings to enable preemption.

For now only on a750 as other targets require testing.

Add the "preemption_enabled" module parameter to override this for other
a7xx targets.

Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 12 ++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 +++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c |  4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
 drivers/gpu/drm/msm/msm_submitqueue.c      |  6 +++++-
 5 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index e4d271fa89cc66f188be04206e267fabd83cca83..1c8b31627eb68bff406e70995838e418331449ef 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1204,7 +1204,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.gmem = SZ_2M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV,
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION,
 		.init = a6xx_gpu_init,
 		.zapfw = "a730_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -1224,7 +1225,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.gmem = 3 * SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV,
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION,
 		.init = a6xx_gpu_init,
 		.zapfw = "a740_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -1245,7 +1247,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.gmem = 3 * SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV,
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION,
 		.init = a6xx_gpu_init,
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a740_hwcg,
@@ -1265,7 +1268,8 @@ static const struct adreno_info a7xx_gpus[] = {
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
index 2f7c93e74e097a78510700d2c6607d052cbdda66..dca9d011f09e741784ac6dc31b61841149acbae2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2439,6 +2439,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	struct a6xx_gpu *a6xx_gpu;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
+	extern int enable_preemption;
 	bool is_a7xx;
 	int ret;
 
@@ -2477,7 +2478,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
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
index 2d8eef6c668b0da246edceba0c5d92041ea9a35b..30c6b949d0b197fea130c9b2b69c9362c1527737 100644
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


