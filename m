Return-Path: <linux-arm-msm+bounces-29788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7D3962B3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 17:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E0CAB236B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 15:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FD31A2C38;
	Wed, 28 Aug 2024 15:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+53UR4E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FEC1A2C33;
	Wed, 28 Aug 2024 15:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857638; cv=none; b=FMSAb2reK9e7qtaU0y+LJOY1WDRZz3lMvhm91aziE5Rb6kxWreIGysQ/rzqUM2YIFbqmx2MlU3sto8l8ZOFD7yoWEIlC2Y+QUYQR8kjN89A2wBvfus8nZ+o8kq6hTT/v1bsvQE9KrxhUgvyitBJMgbrTScOOJz+RP3HCS6U143A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857638; c=relaxed/simple;
	bh=a9ZZUDjjT3S7cBGB5enSwbmy4on96cF59kyuYni0rwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QcDE/8NS9/NL4cqn1K8hqs0pDhEdV0wpXLwEKvuG9SncsAcvSV3NcLw6eGSEy8aQyCj6aDfsFLX0iIXSXatz+zhSZsXEf1bYRen6d4QBkR0QXA6JrAUHcxlbA4yG6jQNniwzdwUA7mKJHO0/weCf27XhAPzRax6+TArrLEQ+oxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+53UR4E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC83C4CEC2;
	Wed, 28 Aug 2024 15:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724857637;
	bh=a9ZZUDjjT3S7cBGB5enSwbmy4on96cF59kyuYni0rwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U+53UR4E/X43N2EuGOEH657iEwjPxdUd7hvxN6K9KCO+7egsPEva1ET08ZQPpBr6a
	 XElnkC/nTrxcuS04S0oMrO0OuIegp+Ejz2vcXi33pB64CH92ZjBdUoQ1X71s8Mck4W
	 SHwhpesNQbF8g4VvUHnniL2cHmTRs7ioxyBtO1mV8CTsWhY0hHBETrsXScb5QMaKf7
	 qgJ2Fom6xLe7b4IWvNO7+fed8h+lw5hEW8MEK5wgo61g1g+sz1/mf7tpED0/V4LlL9
	 Hp3fhwJcc2V12yVm88ajUJcYZ7b2DvfgABR+tDXN3ssYoYAY0miUcOeUYwntMZNWGt
	 DRUralWznl4xg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 28 Aug 2024 17:06:55 +0200
Subject: [PATCH v2 2/6] drm/msm/a6xx: Store primFifoThreshold in struct
 a6xx_info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-topic-a621-v2-2-1882c6b57432@kernel.org>
References: <20240828-topic-a621-v2-0-1882c6b57432@kernel.org>
In-Reply-To: <20240828-topic-a621-v2-0-1882c6b57432@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724857626; l=6473;
 i=konradybcio@kernel.org; s=20230215; h=from:subject:message-id;
 bh=XmQJ6okLMLENeM9s7/dxGjGy/oGH2zJbA3KXVAvm660=;
 b=s9OtFZY+HhV8Xv3UFw/s3Tj/EecycJCeI4I/XK41giBBQUTzl3kefqx2qEhecfHYc14ldaL+9
 xh/68lf1Ne+DYgg6+YddtOHquD739aGRv51RemgRf4adF+Ul06EGSEq
X-Developer-Key: i=konradybcio@kernel.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@linaro.org>

The if-else monster is so unmaintainable that one case is repeated
twice. Get rid of it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 14 ++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 24 +++++-------------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506..1ea535960f32 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -636,6 +636,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a612_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00080000,
 		},
 		/*
 		 * There are (at least) three SoCs implementing A610: SM6125
@@ -667,6 +668,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00180000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -689,6 +691,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.init = a6xx_gpu_init,
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00180000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -711,6 +714,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00018000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -733,6 +737,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00018000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -755,6 +760,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00018000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
@@ -782,6 +788,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a630_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00180000,
 		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06040001),
@@ -799,6 +806,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00180000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0, 0 },
@@ -821,6 +829,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a650_hwcg,
 			.protect = &a650_protect,
+			.prim_fifo_threshold = 0x00300200,
 		},
 		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
@@ -846,6 +855,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
 			.protect = &a660_protect,
+			.prim_fifo_threshold = 0x00300200,
 		},
 		.address_space_size = SZ_16G,
 	}, {
@@ -864,6 +874,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
 			.protect = &a660_protect,
+			.prim_fifo_threshold = 0x00200200,
 		},
 		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
@@ -888,6 +899,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
 			.protect = &a630_protect,
+			.prim_fifo_threshold = 0x00200200,
 		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06090000),
@@ -905,6 +917,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
 			.protect = &a690_protect,
+			.prim_fifo_threshold = 0x00800200,
 		},
 		.address_space_size = SZ_16G,
 	}
@@ -1165,6 +1178,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a702_hwcg,
 			.protect = &a650_protect,
+			.prim_fifo_threshold = 0x0000c000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index bcaec86ac67a..aaeb1161f90d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -976,25 +976,11 @@ static int hw_init(struct msm_gpu *gpu)
 	} else if (!adreno_is_a7xx(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
 
-	/* Setting the primFifo thresholds default values,
-	 * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
-	*/
-	if (adreno_is_a702(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x0000c000);
-	else if (adreno_is_a690(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00800200);
-	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
-	else if (adreno_is_a640_family(adreno_gpu) || adreno_is_7c3(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
-	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
-	else if (adreno_is_a619(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00018000);
-	else if (adreno_is_a610(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
-	else if (!adreno_is_a7xx(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00180000);
+
+	/* Set the default primFifo threshold values */
+	if (adreno_gpu->info->a6xx->prim_fifo_threshold)
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL,
+			  adreno_gpu->info->a6xx->prim_fifo_threshold);
 
 	/* Set the AHB default slave response to "ERROR" */
 	gpu_write(gpu, REG_A6XX_CP_AHB_CNTL, 0x1);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index e3e5c53ae8af..bc37bd8c7f65 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -22,6 +22,7 @@ struct a6xx_info {
 	const struct adreno_reglist *hwcg;
 	const struct adreno_protect *protect;
 	u32 gmu_chipid;
+	u32 prim_fifo_threshold;
 };
 
 struct a6xx_gpu {

-- 
2.46.0


