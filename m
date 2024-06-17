Return-Path: <linux-arm-msm+bounces-22945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4545090BDA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 00:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3C151F2203A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 22:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC5419A299;
	Mon, 17 Jun 2024 22:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kqr5o7CE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12F919A291;
	Mon, 17 Jun 2024 22:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718663382; cv=none; b=C7SX671EhckPyHcKNQCVGDpNxJeaWHSFIWTKlxRJUPCSyC8lNz6jm3L+uRP6ffqR8LMHrYmPJWFGL1hBLey0oPKga0QrQiFGqIn8VcsTnA2SFGZ6vwB6jerdDjxNsf1tg76Ie5zAxNQ9qkRpIzab0DyElM04eQUfw74zoy2thE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718663382; c=relaxed/simple;
	bh=AlWuH2hU35br9xuDRcYvEV1MF618XJjzVfEsJ6GdOlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BufxliIZe7dd4gRg2iArpf3RKemz8MhEwR9EXrTonq2AcD8wtUYIz82TwG2SlH0mbbKCjdfeNWS+5HY088Rz32vs+oO4U7CsRrixG76FRn7zuzDLFaFUtEaqAS+qFZRLwmzQFTi8/U5dmERXwqXgAZ2CoKHBe78lkfRmspXgmBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kqr5o7CE; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f70c457823so37903195ad.3;
        Mon, 17 Jun 2024 15:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718663380; x=1719268180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2u5XyyCALUyXTYTkrQdw3925d4Sy9F+3+rXSvxCSOZU=;
        b=Kqr5o7CEFccfxowWjwB6ft9DkDKZ5k623syIuvFXAISQzf+en8FKvBJ1vWRcuGUsqO
         eDqHPGerBi+q8KrOaUY3Og1ELyo1VJQg9/di7N5b9Gt4BF8v22YRGyFvL3vTYYLZ74nG
         /HFfYTTriBKnEUZcimziy471CythGhj8UogaqG7pZ5IqKUXyzB/Q8CThW+hr52szbx3K
         VSaBTGyVrKoHqvG+K69i7ymxOvt6oT1ebMDoXzOgnMJcpVcuPHCsTXAIjsA/+f2A62NV
         Mt5h1ue6JkT0HMcpDlLlIhQr/2ERCaA+e2vkSzBzDF4uuiUAsEu/6DKXnti4UChDVIcK
         TdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718663380; x=1719268180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2u5XyyCALUyXTYTkrQdw3925d4Sy9F+3+rXSvxCSOZU=;
        b=JEdHCh3OxgklaCurSL2XnmT5Qd5VNb9q0HqUnrqY1J9+3gX0Fvz5y7jXxtlIyB5/Y1
         dP2BAVlZcWDL5ACx8cA3eEinP7jyhJy1mQ2PiDn+HSeBmuttjkcONnfmHkGkfyDzfl4q
         fLiuq+DbOH/Mcqv7BEneowk1hsCNj3DHQUN2mbpysN0KjAQ0o+MPz0rBVy9ZfTAsAeMt
         o5fpVhkeGBL7wGstoGmJAVjDgJqkFqfLQs5seyN9M2Wn+XIx24ZSkKR95XXIkpLHUEX6
         vLNQWe/r+xFsZrwdV4oqrIfhvcMoD6rkUzF5Ulq+jpZbgahYMKrx0A9rNYmuKWUOmh3Z
         MPUA==
X-Forwarded-Encrypted: i=1; AJvYcCWfUPgbbzaMRrGABkyT3uN2JDxsUWAdqKpS7FQsJQ84GjAzuA2wpzEQkyYNuGhvM4G6E6lnGgoQK3neMsBzZcwqTkicEdKKYVdGxoxx
X-Gm-Message-State: AOJu0YwoDGYcUq07Trd3rSuhtCLsEhVQheJRtpzY2dPX68YGwa1dvkiB
	7dbQE2ixD1jI3fEOHvGLIWcmbueOGg+l9HcPFeD6hYnf/JUGs+yB
X-Google-Smtp-Source: AGHT+IFm7HkXJkLG4XiiMbncq6OwQ7O+NNcC2yRYjFYE06NBMuHaN6V2WnVDzvhTPQk1QeABJD7rtQ==
X-Received: by 2002:a17:902:ec8c:b0:1f7:3d61:b615 with SMTP id d9443c01a7336-1f86253a69dmr135459165ad.0.1718663379817;
        Mon, 17 Jun 2024 15:29:39 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f17d5esm84090805ad.225.2024.06.17.15.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 15:29:39 -0700 (PDT)
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
Subject: [PATCH v2 4/5] drm/msm/adreno: Move hwcg table into a6xx specific info
Date: Mon, 17 Jun 2024 15:29:02 -0700
Message-ID: <20240617222916.5980-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240617222916.5980-1-robdclark@gmail.com>
References: <20240617222916.5980-1-robdclark@gmail.com>
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
index b991d3646722..da49589f82d0 100644
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
index a988f4ed4ea7..849ce0ae9e75 100644
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


