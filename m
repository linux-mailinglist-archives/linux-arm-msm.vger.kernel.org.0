Return-Path: <linux-arm-msm+bounces-33038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE53B98F3F9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 18:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D94101C21FDD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 16:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019CB1B5336;
	Thu,  3 Oct 2024 16:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+xy6Wj1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196561AD3F6;
	Thu,  3 Oct 2024 16:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727972001; cv=none; b=cnFiuFktlI2i7eboelB9TIaCnOQjgsfeDzVkMW3bedqFIk/7VH8o6XEiRfetkZln+BWQpeTfZalW1nUyNvyb6dBN4ZENXskZOzgPmGLjciQgka5o3hqOIYoWDO0d9btNC98u8JXjmopIPh6i6htB0jbwPOHc2BdvdtuihgUW6M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727972001; c=relaxed/simple;
	bh=p8dXQLzJR/jPRlo026VsvM4xjBwdjBGjnZtTLsi6I5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BtS/C5/UgKZKl+J0g1oN/kWntptPaqqWUw21Mvn5LD0idF142S8XhQ54D96EHMzhLWdnrvzugpU2GoPMp335ciigQkd4ha0coeu2h1Fa5keZDk/Tl3fRoens3sV/x7+389FCK2KfdxG7cJ1mkCN9Ivi40+dSjc9EKKUqp8MDeAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+xy6Wj1; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8a7b1c2f2bso177548866b.0;
        Thu, 03 Oct 2024 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727971997; x=1728576797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKJFRuukzHMdicXNTKn9DNH9WIRDTQEFbWKyZAU8kdY=;
        b=b+xy6Wj1Sq0Q74gLBw2VgTgNBnRbISt/tCFM/AT2AIAwhXJhtcf9/T2Zou0OrwiPr1
         AIF6dt419LamKqbD/XOH8XnbzmGcvlsELtpTSW+ewud7M9oGfb/2BvCYg0HML2D+sEF5
         9rRZsrn6XkUMhFCPnW+TIgjY0yj/aHUNLXPu6fEHv8r2qs/xENlxp98jfk1URjO9JyFP
         hyNufQPhcExrB5PAelGyMUbNxOY6uo5GW71rl46gXjyP2Hwm2ITrmSQNcCnrc9nh3cC0
         TkFPaKu8ZL77kpllvpGK5tJk3ONv0EcRgYfEV2ra8IeedFPOjAxbs1lYOAtkDyBbAWWw
         xYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727971997; x=1728576797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKJFRuukzHMdicXNTKn9DNH9WIRDTQEFbWKyZAU8kdY=;
        b=VfVa6r12jq7+tsJmUzgFwwvCISWBJZWY/vqcrxwjSYC0UpbPQbVM0JV8dAui82fIfg
         V5gXqTblvMXOWT8S995b4pRCH+fqZGBudLSYplfjF0bUAPykSl/s2yfK8pwFg9EcdV2S
         H8Og6hRYEsUcWFIFhR0aW1ivn7wiY8XbHuak1imorFi+Z6vluAU7aQQccFRKeYIkAlNi
         Qa0c+j2A+6T/19rL8FrWDmHhr+3mvJkrOc+MiMSugR6bKc2EMm+OVUf0H9Rpga4fJnqY
         hgMlbY+gIK3KabYwucIWTFTxAp9vQDg9LxieqauWbA8fFSg1oMGdSl++s8mvOE1nWihf
         G8+A==
X-Forwarded-Encrypted: i=1; AJvYcCWU+Ak0R3qKPIPlp+9MXwXBaG8/ARfkD4+B6OuNQqnB6Zfb/ka9XJYXFVEvC/kA4alvb9YgSKHhenipQMT7@vger.kernel.org, AJvYcCXyAs0u562WiyQ9bt3O31EaETzodDO6htWe10BWkzTsuKIa7eXko6XRSp5lY53YB23wQUX0m17W+QI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXPK1/4HXqQfNCScRL+uYGSCYjyqXLFIhZwUUOp8d3S+Bm9wQ9
	AcKhoDPl/MvpJELmlWDE6o4jXgigiErGI3OYB2KvMHJjBNOshtR98uk+gJfswKJc3Q==
X-Google-Smtp-Source: AGHT+IHcNU+ucBCkSRq9sRA5jDmhMoPbP9eCdmVwT7A5aCxRX32s1cRNWnQ5GXUoPvz7ueJoYdS17g==
X-Received: by 2002:a17:907:3fa4:b0:a93:d5d3:def6 with SMTP id a640c23a62f3a-a98f821ea56mr645715566b.19.1727971997234;
        Thu, 03 Oct 2024 09:13:17 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it. [79.12.161.203])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 09:13:16 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:13:00 +0200
Subject: [PATCH v8 11/12] drm/msm/a6xx: Enable preemption for tested a7xx
 targets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-11-5c6cb9f256e0@gmail.com>
References: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
In-Reply-To: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=6216;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=p8dXQLzJR/jPRlo026VsvM4xjBwdjBGjnZtTLsi6I5U=;
 b=G6df5+75NylpuHekm/mwOE/ZF0IRDk6mgols9dNhlXQtjxK9TVajTFWNRoi56ynFAxGBMaTVo
 E6/9azpvOB6DmDOXFgpLzJJIEoGMbPiXUCP+XFf1EVek3hVO1OS4+NW
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Initialize with 4 rings to enable preemption.

Add the "preemption_enabled" module parameter to override this.

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


