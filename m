Return-Path: <linux-arm-msm+bounces-26617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 538F6937664
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 12:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76B041C20B92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 10:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B30284052;
	Fri, 19 Jul 2024 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mlkp1GSa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904C579949
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 10:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721383432; cv=none; b=MCMHdVQ9cczqgxnkcZxszVpCV8g/EjHoioMflYOS0F66iWxZXvMrw4GesU9MO64n5/YawVDBMy27vhIXzdoVBYj/pIcWfsKXHj4Q2OZlfUXKDjfe4G30ExNrtwewVlHcENurYQq+2Jnpiwr5dskzUIzA9A0SRyKfPvdcvD3MBHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721383432; c=relaxed/simple;
	bh=zkDn4XWgFIKZvenj/MtKpRKALI7nhyDW1jck50cKmuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tIBFbTN4rbmuqnbYfH4ohFl7yz6NvZ94JYIng53rMrLCb2eRFuRkcl5OEKJcTOCb+Kl9qC/XA1h9RlBZvYQYmwzbgWugF26/ZWRCP8oxkqkSs+sQGXsVBJFh5U1gq7NizzTXqCCr2Hq02GsAGohdrDkNdym6177bVhKSD/w8ItI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mlkp1GSa; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eefeab807dso23337791fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 03:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721383429; x=1721988229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJh3VNGyy8RGWW2vvPXR6WGBCCjUp2QIoReWGyMyfcM=;
        b=Mlkp1GSav7PHhfiEObvDXFyyDlWh5SGfUcQNSOWrYhqy4h/KE0jQ4pwJG8epQ1FmdU
         ePZC1854pcE5yn5ncMm6akXuX6NQOnPuEW3bImXmgeKZVPi/6oIMRdX/0NhscSMZYXgK
         mOdhQ52T+QoeLLIQ+R47DHUjGB1CneMVjx8osR0Isvpxl8+AZaTr7/KKoCBWfqn1+hsk
         /laL3cXnPChytslHpDRvK1q3/TEQUBLsM13Jtj1t37KBNo0LG0lunFzyDKcEbs7fvmcJ
         BAU40K2PlxnaJaG94+mbNV2wIiWVAGaOVC7ZqotFLVCwPoI00EVGsG1w4GHanayRjkY0
         lBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721383429; x=1721988229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJh3VNGyy8RGWW2vvPXR6WGBCCjUp2QIoReWGyMyfcM=;
        b=WC0dfc73Tj7r+lbIfHrd1rDO8SBTquM4Wed+LSE8jhIm4pr+b9xF7gfz+edwrq/b4d
         2m9EJ+cvJouNcLV8B+0r364dDO41PFUfu9dW9ITXECxe4Nt9n2vxQRmNSecYYJS71Nia
         2gx5KKFF5WFNyeUquwaFGwuxv0B9/mljiJWcj2PTWkpkwPEOWaVWC5rH85naBf1zCCRI
         jzSYrkhNXe/5jsvCkFdEL7IWfH7joS8Mn4ltbFFtqcq0QQTjtB8qGVfWfcJqOB3gQidO
         bDyziyAOzg1UpbSEI/fq3WWQQePBNEF2c1ixcEepUoBkPcg0VQqvR5K5dLszxHHq9reC
         RVgg==
X-Forwarded-Encrypted: i=1; AJvYcCVRoEESwP+9JePhq/RkAE+CMS3TMFoeRexZnWclG7l9AoBkOimxfnpyDLjg6zhyT9g8b1y2i2X/jXquvSJsmR7Pc4Qr+Bo9BHHkWMP7mA==
X-Gm-Message-State: AOJu0YyGuVGpUoqY1qojtV3VP+PfaFcpGVIpoXNO4Uf+rnAp9FlhHneA
	wmessX9ZyOIVkI2/Y70zN8F0oxwlZ/x4WnNuwJ0vZ39+ERQaJu3b3Yl1KH+wWC4=
X-Google-Smtp-Source: AGHT+IEI4mSIktHc/EA72Qw0dnZWWNwMSf6JB1FUS42liMCMZPGuych/bPIq2q2xXi7Lt7f07RnFmA==
X-Received: by 2002:a2e:3014:0:b0:2ec:58e8:d795 with SMTP id 38308e7fff4ca-2ef05c79ccamr31309941fa.13.1721383428440;
        Fri, 19 Jul 2024 03:03:48 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30aaa31e0sm919984a12.27.2024.07.19.03.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 03:03:48 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 Jul 2024 12:03:27 +0200
Subject: [PATCH 2/5] drm/msm/a6xx: Store primFifoThreshold in struct
 a6xx_info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-topic-a621-v1-2-850ae5307cf4@linaro.org>
References: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
In-Reply-To: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721383413; l=6473;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=zkDn4XWgFIKZvenj/MtKpRKALI7nhyDW1jck50cKmuI=;
 b=37UU/h22A6Dt+jb/oX69TLlKGWj7cEdTh6E9zAtxmBueIpOCcAnce1pctoO8yBgO6D9yP5RE/
 0p2z+Fg4inDCdq+6j5OnVqikYdfGGvhztD9y8xmSH0pywBNX7c0aLwk
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

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
2.45.2


