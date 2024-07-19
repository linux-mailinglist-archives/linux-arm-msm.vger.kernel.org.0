Return-Path: <linux-arm-msm+bounces-26618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAD9937666
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 12:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 224EA1F26C1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 10:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B648585260;
	Fri, 19 Jul 2024 10:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v6ZfgPdV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2197A82D72
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 10:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721383434; cv=none; b=r/phBhaJEHeAEsqyBOkvaSZYOfdIGehLeuJjxUZo51VgYVdr8FjBOnf4jh1X6Riy+ESHC78KBoBccaDK/QR/Gf4sdp3lquIl7iQHlUQk+iQX4n3KIRDy7BRH8SCGLKqliHW0l/hh4OC6KOKGTvO43nt5FzUXa8oh0R2vP9K5UDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721383434; c=relaxed/simple;
	bh=IY5qNV2nX79fB2nRPkwck6ZxJ6ElFtG6EG/Rm+ZMVHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HgvJiFVNLFJO6L6Z+B+uyuUQhmBxpVjx8iXyl7Og9htusQiRfk/+OEoFbKME2B0kM9U25dHASmi2WTmAT1lYHkTr82cKiKIhwX8qr1i/HKoqCY59g+a6ojD1UXaIvudfNgWJ4LvQ7gm1Xv7ZBeCi+E7+71BmXdBTRQ2PYKWezBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v6ZfgPdV; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eea8ea8bb0so33606631fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 03:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721383430; x=1721988230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nauN0LUF6s5oCDx7BxqJdst/ffLcWF+2dEZ0vDL/Inw=;
        b=v6ZfgPdVVdI1Bf2iB0E13ct4FVNQHmpqc0ljgZIwGCDRq8zVeQKZLi4jln2la4jwgJ
         i1cduAf6Q1gPAZ5Zts0u+6Kk7s/cZWjlWcohSV8XA986EIE/M6fLUwOzvsCQaybF5Qh+
         9sy5W0NLx5pxX+PbGwKF1WqYY6D0Qn7jYMQxkCPYFc2p3MTi9BBdGSwV9UaRriJIPRaZ
         LG5ft8BnQNBZfPfKYtihm3eav056c1hRrxYBy9sgq1zgraU/HYpLC5yQmwkmP3wfeP9p
         Otwoxn1zg1/9/42t+0WzKA6Uo+dwdfPXFQEd8+vPKQI9hpkQN/ul03KZt/+zTtBYP1wX
         F1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721383430; x=1721988230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nauN0LUF6s5oCDx7BxqJdst/ffLcWF+2dEZ0vDL/Inw=;
        b=SuPwYFDRkRmWpsZQ8DSF9fPgCG0AMJDxNMsb2YUsDmxc/30zFQf5JVX1rt7a4oGR2T
         wHNWda0t+2HlzWWHaTCgX8dnTAuFdXciviHp/bGRfUOLJJnnUIGrG65qQvHAkSAodiiV
         IiDq3G5XFO8sALSjfDMdg1lVDLRXGpchLss1jZAisjdmJKwt2jlz++/d59FMMdzHrz1C
         poKB/tOZBDbW68Jw7njUTdsTvyZLL87haL2/NTPO552dFEPgsrSAR3v2hsfiK1aWPbd/
         a10Ac6wFm1EKS8mMbosAEzEg3Yqn5kyJsteDPFbfwJM3dxu9g8AkXos/JouUNx0/dHHw
         JfAw==
X-Forwarded-Encrypted: i=1; AJvYcCXpzUi5yL7NJnEjNMZgFCcP/54ivjC1GgAhRUuGpzYaUXEwxEaon2cj/psngnuSLsCpajy6mwT4tQtC1hSnojZm6Dx2lsnmNoPMD75e3w==
X-Gm-Message-State: AOJu0YwtzfKFwhWXLmRCGxV58f4AdZuNFiZ47CcqTAmTHVf24W9xgVcy
	VTKg8uHPXY8qSOP05im1oajRBNB8decAkGCK6nUZgMwwEq0Nkv2QG7jUAt0qsnc=
X-Google-Smtp-Source: AGHT+IEe9HbLr10nAhJHotiJHTC1frkIzKcXeB0pExbTPdwM8B9FTG1lqNq7cQ8A4NbjjPwjfcbtfQ==
X-Received: by 2002:a2e:9b95:0:b0:2ee:d5c3:3217 with SMTP id 38308e7fff4ca-2ef05d43aeemr35918621fa.47.1721383429921;
        Fri, 19 Jul 2024 03:03:49 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30aaa31e0sm919984a12.27.2024.07.19.03.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 03:03:49 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 Jul 2024 12:03:28 +0200
Subject: [PATCH 3/5] drm/msm/a6xx: Store gmu_cgc_mode in struct a6xx_info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-topic-a621-v1-3-850ae5307cf4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721383413; l=7380;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=IY5qNV2nX79fB2nRPkwck6ZxJ6ElFtG6EG/Rm+ZMVHc=;
 b=6y9Innit2xFlEH62+2TpCxA+gp2Eng3+iZZePtu05iML77armQgelT1KldFIXtFoeHJT+W37N
 zOn+eDjBzDCB017FBCU20RKRKSQIVObUUefXf7JVByfFeSbjNsm9PXB
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This was apparently almost never set on a6xx.. move the existing values
and fill out the remaining ones within the catalog.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 19 ++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  6 ++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 1ea535960f32..deee0b686962 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -448,7 +448,6 @@ static const struct adreno_reglist a690_hwcg[] = {
 	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
 	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
 	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
-	{REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL, 0x20200},
 	{REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL, 0x10111},
 	{REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL, 0x5555},
 	{}
@@ -636,6 +635,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a612_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00080000,
 		},
 		/*
@@ -668,6 +668,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00000222,
 			.prim_fifo_threshold = 0x00180000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -691,6 +692,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.init = a6xx_gpu_init,
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00000222,
 			.prim_fifo_threshold = 0x00180000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -714,6 +716,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00000222,
 			.prim_fifo_threshold = 0x00018000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -737,6 +740,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00000222,
 			.prim_fifo_threshold = 0x00018000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -760,6 +764,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00000222,
 			.prim_fifo_threshold = 0x00018000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -788,6 +793,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a630_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00180000,
 		},
 	}, {
@@ -806,6 +812,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00180000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -829,6 +836,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a650_hwcg,
 			.protect = &a650_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00300200,
 		},
 		.address_space_size = SZ_16G,
@@ -855,6 +863,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
 			.protect = &a660_protect,
+			.gmu_cgc_mode = 0x00020000,
 			.prim_fifo_threshold = 0x00300200,
 		},
 		.address_space_size = SZ_16G,
@@ -874,6 +883,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
 			.protect = &a660_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00200200,
 		},
 		.address_space_size = SZ_16G,
@@ -899,6 +909,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00200200,
 		},
 	}, {
@@ -917,6 +928,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
 			.protect = &a690_protect,
+			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00800200,
 		},
 		.address_space_size = SZ_16G,
@@ -1178,6 +1190,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a702_hwcg,
 			.protect = &a650_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x0000c000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -1202,6 +1215,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a730_hwcg,
 			.protect = &a730_protect,
+			.gmu_cgc_mode = 0x00020000,
 		},
 		.address_space_size = SZ_16G,
 	}, {
@@ -1221,6 +1235,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.gmu_chipid = 0x7020100,
+			.gmu_cgc_mode = 0x00020202,
 		},
 		.address_space_size = SZ_16G,
 	}, {
@@ -1239,6 +1254,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.gmu_chipid = 0x7050001,
+			.gmu_cgc_mode = 0x00020202,
 		},
 		.address_space_size = SZ_256G,
 	}, {
@@ -1257,6 +1273,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a730_protect,
 			.gmu_chipid = 0x7090100,
+			.gmu_cgc_mode = 0x00020202,
 		},
 		.address_space_size = SZ_16G,
 	}
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index aaeb1161f90d..871452daa189 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -402,7 +402,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	const struct adreno_reglist *reg;
 	unsigned int i;
-	u32 val, clock_cntl_on, cgc_mode;
+	u32 val, clock_cntl_on;
 
 	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
 		return;
@@ -417,10 +417,8 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 		clock_cntl_on = 0x8aa8aa82;
 
 	if (adreno_is_a7xx(adreno_gpu)) {
-		cgc_mode = adreno_is_a740_family(adreno_gpu) ? 0x20222 : 0x20000;
-
 		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
-			  state ? cgc_mode : 0);
+			  state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
 		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
 			  state ? 0x10111 : 0);
 		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index bc37bd8c7f65..0fb7febf70e7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -22,6 +22,7 @@ struct a6xx_info {
 	const struct adreno_reglist *hwcg;
 	const struct adreno_protect *protect;
 	u32 gmu_chipid;
+	u32 gmu_cgc_mode;
 	u32 prim_fifo_threshold;
 };
 

-- 
2.45.2


