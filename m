Return-Path: <linux-arm-msm+bounces-23122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB9E90D9A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 18:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 527861C25091
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 16:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F00146D49;
	Tue, 18 Jun 2024 16:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACBnnhJm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4956813DB8D;
	Tue, 18 Jun 2024 16:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718729000; cv=none; b=Pe7zW5eBwfBelL8iyA7ZJdjLtGJWs0peqvuK4NK5qHzUG8Edo6XApaKtsiSOM+kZYwWQxIPHvmaJqrCV+kkbW8bQgpYPLWVmyJ7LsFJkuxp0JaL78IZWGZQUV9YQVMif0TXs1SU6mq3gVDPvQPHTf4JfnNxhOSCx5E1EE2jS+gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718729000; c=relaxed/simple;
	bh=PIKOltqlxnUs02KmIABWP2nt/qNhav6RqYdbAHlzqe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QrNBAtti2o5iHNrCJpJO2svFskO7sfxExDKyVLEEFiiZ0ofAqtTJ1LUAkNR6+QspGcGguN3rcDLYkJaSdmPWDsd3GPItP+PA7orl2vwX+VuKuQ5nfmL8bRtDSf6ZUHgTX49xcGWCsOmVZjRSIkL7btmfT634QFRQOA4z/breLHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACBnnhJm; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f70131063cso44752435ad.2;
        Tue, 18 Jun 2024 09:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718728998; x=1719333798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iCa1Bp2bzt6MYn6y2G70n3IPt3Zbos5LlYITaVNaTQ=;
        b=ACBnnhJmAsi2ID9N8oTHiWTn6Gv5cvvjtvysAqEK+v/VwipqKv5w0grLBr/mKsmXoB
         7nPFPfpKwLM+KSJyrgMYh50PMhkrF/EZVGwQsTJ47Bk+W320nDamCxuKpV6K1daj4vXL
         2aOTKxQjsRjd1+WVnu9b8ArBBrvOrmfXtzzntAw1NtrSUYFXRf141A+yw6/FuaO1kHgf
         gHvKqb4xp9hehsQRt29howOEcgnMMO3VcR5PLH4/ksp7XF4ZjmJv8waQzKFQ7Edj/CW4
         S90iHUxgREw5Rk2SomhJr335vsOdsjBO9peum8HF1gFkcwxkKaIhNgw/QFMmaA65yWJV
         Vdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718728998; x=1719333798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iCa1Bp2bzt6MYn6y2G70n3IPt3Zbos5LlYITaVNaTQ=;
        b=luwwsEpnPRYf3t4mCGD2dBxZER7ZV8YdcC5nGcaPriyHMWG5/fDuIRwN0yDbvbKF37
         Ywvp1LDQ2LLfBBR4gieEo7Grju1nWhZx0xVFO2RHFU93+BrCNtcNdUJfMPMRSVq8NFV+
         q3JEkC5x64mVA/G4pQOXSSXHn6fFLLTDtn8QqinxUfHP1Leo5a9jZKXe7zKq7NGRRr6d
         uwZ151kWYFF4q9P2L1lHYhOK6OwIavgMs7/05d5sBUbdQRIsbPT1oQBEtRgIN5W9ceP3
         PLFTl0Uy54vrcsr4bVIKDi0xvAy6ReUWQDNeoSX3z75w7pTNLDtaTRDxr4Kco9/ax3HZ
         gswA==
X-Forwarded-Encrypted: i=1; AJvYcCWStGj7duHL8YL77m0ipbhkhK+UTz63fbM23CE7CYqqnETGBnwsrhnduHlaFiHGSRCYmMke5U4CK9TqJXIyrsypX5OWBcqbgLCc7gyg
X-Gm-Message-State: AOJu0YyELVlaN/52//l+/jt4OzpP9oqSfbh0xhOfwXqT4qHWDCVmNvwR
	bzmmOWR5QHp9AgnrL2FwLcS63HokpUUE527cyGyxxIIm77VgTk8H
X-Google-Smtp-Source: AGHT+IEUVq3SaZMlZ6VYEHMb10dXcZe7S4mL9ZYwurUfKi2bl1O9TZmn09A5MBM+/1P/QnpfS1buVg==
X-Received: by 2002:a17:902:ecc9:b0:1f6:dfbc:7f1c with SMTP id d9443c01a7336-1f9aa3f87bdmr1685585ad.35.1718728998422;
        Tue, 18 Jun 2024 09:43:18 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e55e3csm100137555ad.1.2024.06.18.09.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 09:43:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 4/5] drm/msm/adreno: Move hwcg table into a6xx specific info
Date: Tue, 18 Jun 2024 09:42:50 -0700
Message-ID: <20240618164303.66615-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618164303.66615-1-robdclark@gmail.com>
References: <20240618164303.66615-1-robdclark@gmail.com>
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 65 +++++++++++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  6 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  9 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++-
 4 files changed, 67 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index bcc2f4d8cfc6..b81bcae59ac3 100644
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
+		.a6xx = &(const struct a6xx_info) {
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
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a615_hwcg,
+		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
 			{ 128, 1 },
@@ -513,6 +518,8 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
+		.a6xx = &(const struct a6xx_info) {
+		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
 			{ 169, 1 },
@@ -531,7 +538,9 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
-		.hwcg = a615_hwcg,
+		.a6xx = &(const struct a6xx_info) {
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
+		.a6xx = &(const struct a6xx_info) {
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
+		.a6xx = &(const struct a6xx_info) {
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
+		.a6xx = &(const struct a6xx_info) {
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
+		.a6xx = &(const struct a6xx_info) {
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
+		.a6xx = &(const struct a6xx_info) {
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
+		.a6xx = &(const struct a6xx_info) {
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
+		.a6xx = &(const struct a6xx_info) {
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
+		.a6xx = &(const struct a6xx_info) {
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
+		.a6xx = &(const struct a6xx_info) {
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
+		.a6xx = &(const struct a6xx_info) {
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
+		.a6xx = &(const struct a6xx_info) {
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
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a740_hwcg,
+		},
 		.address_space_size = SZ_16G,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
@@ -951,6 +984,8 @@ static const struct adreno_info a7xx_gpus[] = {
 			  ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
+		.a6xx = &(const struct a6xx_info) {
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


