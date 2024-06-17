Return-Path: <linux-arm-msm+bounces-22951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E9B90BF4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 00:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8BB41C229DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 22:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693DF19AA78;
	Mon, 17 Jun 2024 22:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cyxje7xC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE5519AA71;
	Mon, 17 Jun 2024 22:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718664709; cv=none; b=D8qFgDJMKTjJsSbV8LrgBq8vEOzeVn63rKNlLGpbJzoyIDIPEkF39TE7OcihPiPllf3hdyEO9dhmEFrM89xhcvPSb7kv+dmHhjfShfsNFYE9gelB0G8ztpgx8GlNoUgABEUbRWJ2Y3Px/0ZD4KqPBxB5rN2s2AwJg5sI+cJiu54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718664709; c=relaxed/simple;
	bh=j1FiG7GY4ANLH+W//TDGQ7jwyTFqy1dEpnBxUGyJZYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IMq5Zmk1IbAl7rCo9fdw1GH52RtS1sCaoQBLwoaOswLKtD0RfzYsjzAgtYI+1kkUJNHG2xFq1Nz7ULDofLwBr3PfAFz2S0j6lztp4AxoSofTFM+SNrGdrpE2UkjsWwy+tgK9lL9q29wktzYj2+zQWgSdksNTXG7OeydOMelf2cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cyxje7xC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f70fdc9644so43690145ad.0;
        Mon, 17 Jun 2024 15:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718664707; x=1719269507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fea0hnbXGDoTOjRhl05b9e8RAa3n1FmIY8YYYYTBFFI=;
        b=Cyxje7xChhcbTmLqjr90L7wYjOX8gkhcTrz3m8SKRaPjwl4Ry3DS6ALiNvAnZ/a3XB
         A6kO413aOct1jQm7FBK7BKOtH8gzChfM5QaS2GAPfYi+hCHF6t085UOlk0a/9UDjx/TR
         4AJyzj+zO3jEW1KAz3degn652w6Dz6+o+4CRY/v81XHm28G7B3TWqyWDr7PYSUz0Ya0C
         gAbBiZ8AUTZvPz3034uwP/k0IFVzJtey5QPVHG5cehwu7bpBAedI3LeytYc+1aVuSgm4
         ngtfG9aTZpVz1Ba5NYxeWSFsEAvpt8LPZRgAp4yvwY/7HS4F42XqvdDEKX0q89H0Nixr
         VmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718664707; x=1719269507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fea0hnbXGDoTOjRhl05b9e8RAa3n1FmIY8YYYYTBFFI=;
        b=FwH3FLEpqCUkohCdGuejBKUzYzOqHf+qrt+/HEANEbvd65+vsZAu3GmDPaRoviQF/Z
         1qCT0na+txZx8nFx5sQ7GOzaOvrqs/HBFz55xAUJ/VJBMHSLUtRqZVfNRzsmvueqQf1h
         7EDgn00V+34zucMlF13wRu3VGJ09ywNX4qrxUgMe+/lfCR+vJeFGcq8NeJpQLKCRDdya
         YlnNU0CKk6UwgCjgKJIgYNKDnX2VyM+JLfZFmC38CPnnXTY+AWK7ZADX6lJRYNVqUYOA
         YnpS8NxbL97Ay1vsKqMNtOdc9UI4WBcMhyTiF70DHyI3P8vAdg0+vrUBVkgMWF6YkqxX
         BdsA==
X-Forwarded-Encrypted: i=1; AJvYcCVzJ8kgUYNa+KoOTo4iqX0qaoVDqR6XzoODSYco2EpbbwnvQ5cCv/EbcOLbQ1f6vS8Fca3qkOPvAQ00NVYN2OvlmZPrzUu+R6dbPO/S
X-Gm-Message-State: AOJu0YytDAzLisN3MPcZx6wR9kOqsneKlBPnc0WxVsSgaYofPDx3wJmP
	omJfmYwiZi9I1rEGWiUc3w5ptq1RIUldap9z3GqToYRVPb3Ygvxq
X-Google-Smtp-Source: AGHT+IF6TkghzxiLicKG4qAWjm/mP58pJYDQP5DQ4VeXRmFfXcSPLQhdwCXZO01O4GR8y3etMLqmpA==
X-Received: by 2002:a17:902:e812:b0:1f3:620:c92 with SMTP id d9443c01a7336-1f98b213284mr11773765ad.7.1718664706937;
        Mon, 17 Jun 2024 15:51:46 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f868b83afesm65704305ad.156.2024.06.17.15.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 15:51:46 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 4/5] drm/msm/adreno: Move hwcg table into a6xx specific info
Date: Mon, 17 Jun 2024 15:51:14 -0700
Message-ID: <20240617225127.23476-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240617225127.23476-1-robdclark@gmail.com>
References: <20240617225127.23476-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Introduce a6xx_info where we can stash gen specific stuff without
polluting the toplevel adreno_info struct.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 65 +++++++++++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  6 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  9 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++-
 4 files changed, 67 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index bcc2f4d8cfc6..96d93251fdd6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -7,6 +7,7 @@
  */
 
 #include "adreno_gpu.h"
+#include "a6xx_gpu.h"
 #include "a6xx.xml.h"
 #include "a6xx_gmu.xml.h"
 
@@ -465,7 +466,9 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a610_zap.mdt",
-		.hwcg = a612_hwcg,
+		.a6xx = &(struct a6xx_info) {
+			.hwcg = a612_hwcg,
+		},
 		/*
 		 * There are (at least) three SoCs implementing A610: SM6125
 		 * (trinket), SM6115 (bengal) and SM6225 (khaje). Trinket does
@@ -493,7 +496,9 @@ static const struct adreno_info a6xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mbn",
-		.hwcg = a615_hwcg,
+		.a6xx = &(struct a6xx_info) {
+			.hwcg = a615_hwcg,
+		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
 			{ 128, 1 },
@@ -513,6 +518,8 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
+		.a6xx = &(struct a6xx_info) {
+		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
 			{ 169, 1 },
@@ -531,7 +538,9 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
-		.hwcg = a615_hwcg,
+		.a6xx = &(struct a6xx_info) {
+			.hwcg = a615_hwcg,
+		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
 			{ 138, 1 },
@@ -550,7 +559,9 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
-		.hwcg = a615_hwcg,
+		.a6xx = &(struct a6xx_info) {
+			.hwcg = a615_hwcg,
+		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
 			{ 190, 1 },
@@ -569,7 +580,9 @@ static const struct adreno_info a6xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
-		.hwcg = a615_hwcg,
+		.a6xx = &(struct a6xx_info) {
+			.hwcg = a615_hwcg,
+		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
 			{ 120, 4 },
@@ -593,7 +606,9 @@ static const struct adreno_info a6xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a630_zap.mdt",
-		.hwcg = a630_hwcg,
+		.a6xx = &(struct a6xx_info) {
+			.hwcg = a630_hwcg,
+		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06040001),
 		.family = ADRENO_6XX_GEN2,
@@ -607,7 +622,9 @@ static const struct adreno_info a6xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a640_zap.mdt",
-		.hwcg = a640_hwcg,
+		.a6xx = &(struct a6xx_info) {
+			.hwcg = a640_hwcg,
+		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0, 0 },
 			{ 1, 1 },
@@ -626,7 +643,9 @@ static const struct adreno_info a6xx_gpus[] = {
 			ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a650_zap.mdt",
-		.hwcg = a650_hwcg,
+		.a6xx = &(struct a6xx_info) {
+			.hwcg = a650_hwcg,
+		},
 		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0, 0 },
@@ -648,7 +667,9 @@ static const struct adreno_info a6xx_gpus[] = {
 			ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a660_zap.mdt",
-		.hwcg = a660_hwcg,
+		.a6xx = &(struct a6xx_info) {
+			.hwcg = a660_hwcg,
+		},
 		.address_space_size = SZ_16G,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06030500),
@@ -663,7 +684,9 @@ static const struct adreno_info a6xx_gpus[] = {
 			ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a660_zap.mbn",
-		.hwcg = a660_hwcg,
+		.a6xx = &(struct a6xx_info) {
+			.hwcg = a660_hwcg,
+		},
 		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -684,7 +707,9 @@ static const struct adreno_info a6xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a640_zap.mdt",
-		.hwcg = a640_hwcg,
+		.a6xx = &(struct a6xx_info) {
+			.hwcg = a640_hwcg,
+		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06090000),
 		.family = ADRENO_6XX_GEN4,
@@ -698,7 +723,9 @@ static const struct adreno_info a6xx_gpus[] = {
 			ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a690_zap.mdt",
-		.hwcg = a690_hwcg,
+		.a6xx = &(struct a6xx_info) {
+			.hwcg = a690_hwcg,
+		},
 		.address_space_size = SZ_16G,
 	}
 };
@@ -901,7 +928,9 @@ static const struct adreno_info a7xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a702_zap.mbn",
-		.hwcg = a702_hwcg,
+		.a6xx = &(struct a6xx_info) {
+			.hwcg = a702_hwcg,
+		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
 			{ 236, 1 },
@@ -921,7 +950,9 @@ static const struct adreno_info a7xx_gpus[] = {
 			  ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a730_zap.mdt",
-		.hwcg = a730_hwcg,
+		.a6xx = &(struct a6xx_info) {
+			.hwcg = a730_hwcg,
+		},
 		.address_space_size = SZ_16G,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43050a01), /* "C510v2" */
@@ -936,7 +967,9 @@ static const struct adreno_info a7xx_gpus[] = {
 			  ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a740_zap.mdt",
-		.hwcg = a740_hwcg,
+		.a6xx = &(struct a6xx_info) {
+			.hwcg = a740_hwcg,
+		},
 		.address_space_size = SZ_16G,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
@@ -951,6 +984,8 @@ static const struct adreno_info a7xx_gpus[] = {
 			  ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
+		.a6xx = &(struct a6xx_info) {
+		},
 		.address_space_size = SZ_16G,
 	}
 };
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index eea64ec1bfaa..7e01fb551f12 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -403,7 +403,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	unsigned int i;
 	u32 val, clock_cntl_on, cgc_mode;
 
-	if (!(adreno_gpu->info->hwcg || adreno_is_a7xx(adreno_gpu)))
+	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
 		return;
 
 	if (adreno_is_a630(adreno_gpu))
@@ -426,7 +426,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 			  state ? 0x5555 : 0);
 	}
 
-	if (!adreno_gpu->info->hwcg) {
+	if (!adreno_gpu->info->a6xx->hwcg) {
 		gpu_write(gpu, REG_A7XX_RBBM_CLOCK_CNTL_GLOBAL, 1);
 		gpu_write(gpu, REG_A7XX_RBBM_CGC_GLOBAL_LOAD_CMD, state ? 1 : 0);
 
@@ -455,7 +455,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	if (!adreno_is_a610_family(adreno_gpu) && !adreno_is_a7xx(adreno_gpu))
 		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
 
-	for (i = 0; (reg = &adreno_gpu->info->hwcg[i], reg->offset); i++)
+	for (i = 0; (reg = &adreno_gpu->info->a6xx->hwcg[i], reg->offset); i++)
 		gpu_write(gpu, reg->offset, state ? reg->value : 0);
 
 	/* Enable SP clock */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 0463a2006822..61c51e9c7f06 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -12,6 +12,15 @@
 
 extern bool hang_debug;
 
+/**
+ * struct a6xx_info - a6xx specific information from device table
+ *
+ * @hwcg: hw clock gating register sequence
+ */
+struct a6xx_info {
+	const struct adreno_reglist *hwcg;
+};
+
 struct a6xx_gpu {
 	struct adreno_gpu base;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 695e00ae1f62..13e68222228f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -82,6 +82,8 @@ struct adreno_speedbin {
 	uint16_t speedbin;
 };
 
+struct a6xx_info;
+
 struct adreno_info {
 	const char *machine;
 	/**
@@ -98,7 +100,9 @@ struct adreno_info {
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	const char *zapfw;
 	u32 inactive_period;
-	const struct adreno_reglist *hwcg;
+	union {
+		const struct a6xx_info *a6xx;
+	};
 	u64 address_space_size;
 	/**
 	 * @speedbins: Optional table of fuse to speedbin mappings
-- 
2.45.2


