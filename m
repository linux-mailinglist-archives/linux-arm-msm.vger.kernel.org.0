Return-Path: <linux-arm-msm+bounces-52236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D88A6C2CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 19:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98ED63B2DF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 18:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8F61E766F;
	Fri, 21 Mar 2025 18:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5mNr0ai"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059581E4929;
	Fri, 21 Mar 2025 18:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742583291; cv=none; b=hjcwJdOm2zpKPiBtwT44VlF7osMdrk4siqouUlkMbNCWR0dwLLXuaWPcmHWNPXGafw5lRP7cTdEaPPbCdkT8hlRq3niAhg6l1gXCcQINFbpg2KhFRyI9Rhv7hqMRd79vS2N15LQGcv4D4HY2C/vXzebNzCI5b/4XhVDcAYgierA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742583291; c=relaxed/simple;
	bh=t0ZHaxmV5cOkCSEt5AJnxYkZkzDjcnMSfUD0lDgYxNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sNMLHsHBgEk/K4qS8h5mQqfNpzoFLoaG6M4e3xsN4HjfGpzww/VevCtoAgCJJCLisYCLkzMiKIYUGB9G4uuJe7zrsJoDV50bctQsblaXBKdmyLI94WDpEVycToHJ+U+JbT3aN9AjF89+bjctQO2uls3gAxv0EnYEGFygbv0HSkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5mNr0ai; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22622ddcc35so24513945ad.2;
        Fri, 21 Mar 2025 11:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742583289; x=1743188089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kuWrbcuvodyfwyDX9ovNtAfDuo8x7JtH0NBDGtHQx3E=;
        b=Y5mNr0aiR5MmZf9Vdn80NreckloCljBgDeHQGfNJKOCzuWVDzgd+RzzYFJ/9BuWUKu
         JqNF37jhUA58aiP4KpNkAhBMBhF1ovWZLxyXFZK3T3dcSSaS8yOjVqLvav4pXVYS7zvQ
         w/tSF9SkIkroXXaaazN66qm7ChtRCsxHRmENTWueE3pM748Lb8G5MrsROymZpxH/QHZI
         z1+gL1Bnoomk7F4Xc+CdZald/w1ZDNavWr7YeliqeCZAbMDdGMlJ7ZAYKrXql6TC+zDk
         jvpGSwXyPIP+brhJkwDUlpHhLyFgM/N/kFPeN1O4ltfMlsyUNjv68s8lHYmsD3l73wfl
         qb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742583289; x=1743188089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuWrbcuvodyfwyDX9ovNtAfDuo8x7JtH0NBDGtHQx3E=;
        b=q/KNmphCExPHR4IcDSFRD61x1Q2sH99pdTuZWh+09s49sIGM12isSWyZGe+BiX8wsh
         D3NRMDzBM5RztWR7bayZTtDm8PPnJYAPxOh1UqbdH7dikCfnJEDhqVCSROXhpRIEe7Op
         ivkqfQHb7Opiq5qNELSVoZ4CnbiRDzHA9DdBX3BsgzFMMwHLN+bqdEMboFvEDIb+N32s
         cwg7otZRtA/ZYU6dSp7RYBe5Ch/EeqyJmsn9mmbuvPrnj7fM7zjRbfQK5sgsOGyt0fxG
         S6Dt4Vi0bnelsv8TseOFiaGg300O/CaPzDBQ40TTRb9duFbdsnq3Qoj+d9WD1oqrh/+d
         vxwg==
X-Forwarded-Encrypted: i=1; AJvYcCUCHy5eT7Kf9hFOb3Vd65Zw4T8DrBiIDjMYhGSypQe3rmLRe8i/Oit0825GD9ndQkJUs9PhxkxhyE075DA5@vger.kernel.org, AJvYcCV9obKOsTU60I/5zE0GaDew2LvHO9iPrO7cZGGOt6ByiVxEw6BiexnlBPX34etd5Rk1QK3fMeI1hjz1OUv2@vger.kernel.org
X-Gm-Message-State: AOJu0YxMSC+GSrQEOf3mpYxcIM71W/iRD288KeNgEhoOXpGCuaw64Ue3
	ObkI5J2arxeDZ8+yKnCs2Z0PYI2dXyDB1VpmthUXH7ZZg0YxL4Vs
X-Gm-Gg: ASbGncuV/hhgeYtVLQADN9wLal3Nnqpkl56c0Eeof3IuEX5r0kJTudM17VgnEVtJdvP
	bhRX1bqYbESYUuUtFnfHMr/jhUN3vshAEMzX+QFoNK6ySsSbXe0R5Rox0nzIV3DpK8Zvso282Kh
	6TcLnmDGLMWXgHOoCZeZ27roYmFDYH5XzdFoXK+2YVDZq+HYfcEHFxfzvVE6tueCGXLuc70eRLx
	iHS6TXGfiDAt/jelMzaIYPnXqUvMU4ZHc0xRcwjBPTjO5YuQrSJN2SPeOqoWRHuxmotEuWaePej
	eBvHBKK6rGXLVAk5TdX+97xkMe90TpT9CrDIli0x3KX5I588t6n1uzxV2T2ryCLJCQhjm7BcVnX
	iKOCc0wzHN+iLrMED+jQ=
X-Google-Smtp-Source: AGHT+IENwJPy3NZ2JgeNry3ajUMcfwlItfAMwMe80EXJa+Ja58OE0NniLaywafeM20eG0xAejI6Hpg==
X-Received: by 2002:a17:902:ce05:b0:223:fd7f:2752 with SMTP id d9443c01a7336-22780d9325amr73936175ad.29.1742583289057;
        Fri, 21 Mar 2025 11:54:49 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4c4easm20943485ad.84.2025.03.21.11.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 11:54:48 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/adreno: Drop fictional address_space_size
Date: Fri, 21 Mar 2025 11:54:37 -0700
Message-ID: <20250321185437.5890-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Really the only purpose of this was to limit the address space size to
4GB to avoid 32b rollover problems in 64b pointer math in older sqe fw.
So replace the address_space_size with a quirk limiting the address
space to 4GB.  In all other cases, use the SMMU input address size (IAS)
to determine the address space size.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 33 +++++++++++------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 19 ++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  2 +-
 3 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 53e2ff4406d8..f85b7e89bafb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -681,6 +681,7 @@ static const struct adreno_info a6xx_gpus[] = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
 		},
 		.gmem = (SZ_128K + SZ_4K),
+		.quirks = ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a610_zap.mdt",
@@ -713,6 +714,7 @@ static const struct adreno_info a6xx_gpus[] = {
 			[ADRENO_FW_GMU] = "a630_gmu.bin",
 		},
 		.gmem = SZ_512K,
+		.quirks = ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
@@ -743,7 +745,8 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_4GB_VA,
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
@@ -769,7 +772,8 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_4GB_VA,
 		.init = a6xx_gpu_init,
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a630_protect,
@@ -791,6 +795,7 @@ static const struct adreno_info a6xx_gpus[] = {
 			[ADRENO_FW_GMU] = "a619_gmu.bin",
 		},
 		.gmem = SZ_512K,
+		.quirks = ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
@@ -815,6 +820,7 @@ static const struct adreno_info a6xx_gpus[] = {
 			[ADRENO_FW_GMU] = "a619_gmu.bin",
 		},
 		.gmem = SZ_512K,
+		.quirks = ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
@@ -838,8 +844,9 @@ static const struct adreno_info a6xx_gpus[] = {
 			[ADRENO_FW_GMU] = "a619_gmu.bin",
 		},
 		.gmem = SZ_512K,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -874,7 +881,6 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00010000,
 		},
-		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0, 0 },
 			{ 137, 1 },
@@ -907,7 +913,6 @@ static const struct adreno_info a6xx_gpus[] = {
 				{ /* sentinel */ },
 			},
 		},
-		.address_space_size = SZ_16G,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(
 			0x06030001,
@@ -920,8 +925,9 @@ static const struct adreno_info a6xx_gpus[] = {
 			[ADRENO_FW_GMU] = "a630_gmu.bin",
 		},
 		.gmem = SZ_1M,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a630_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -939,8 +945,9 @@ static const struct adreno_info a6xx_gpus[] = {
 			[ADRENO_FW_GMU] = "a640_gmu.bin",
 		},
 		.gmem = SZ_1M,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a640_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -973,7 +980,6 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00300200,
 		},
-		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0, 0 },
 			{ 1, 1 },
@@ -1000,7 +1006,6 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020000,
 			.prim_fifo_threshold = 0x00300200,
 		},
-		.address_space_size = SZ_16G,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06060300),
 		.family = ADRENO_6XX_GEN4,
@@ -1019,7 +1024,6 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00300200,
 		},
-		.address_space_size = SZ_16G,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06030500),
 		.family = ADRENO_6XX_GEN4,
@@ -1039,7 +1043,6 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00200200,
 		},
-		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
 			{ 117, 0 },
@@ -1056,8 +1059,9 @@ static const struct adreno_info a6xx_gpus[] = {
 			[ADRENO_FW_GMU] = "a640_gmu.bin",
 		},
 		.gmem = SZ_2M,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a640_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -1085,7 +1089,6 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00800200,
 		},
-		.address_space_size = SZ_16G,
 	}
 };
 DECLARE_ADRENO_GPULIST(a6xx);
@@ -1395,7 +1398,6 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_cgc_mode = 0x00020000,
 		},
-		.address_space_size = SZ_16G,
 		.preempt_record_size = 2860 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43050a01), /* "C510v2" */
@@ -1429,7 +1431,6 @@ static const struct adreno_info a7xx_gpus[] = {
 				{ /* sentinel */ },
 			},
 		},
-		.address_space_size = SZ_16G,
 		.preempt_record_size = 4192 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" */
@@ -1451,7 +1452,6 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7050001,
 			.gmu_cgc_mode = 0x00020202,
 		},
-		.address_space_size = SZ_256G,
 		.preempt_record_size = 4192 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
@@ -1484,7 +1484,6 @@ static const struct adreno_info a7xx_gpus[] = {
 				{ /* sentinel */ },
 			},
 		},
-		.address_space_size = SZ_16G,
 		.preempt_record_size = 3572 * SZ_1K,
 	}
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index bac6cd3afe37..b07c785d3aee 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -236,14 +236,27 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
 u64 adreno_private_vm_size(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(&gpu->pdev->dev);
+	const struct io_pgtable_cfg *ttbr1_cfg;
 
 	if (address_space_size)
 		return address_space_size;
 
-	if (adreno_gpu->info->address_space_size)
-		return adreno_gpu->info->address_space_size;
+	if (adreno_gpu->info->quirks & ADRENO_QUIRK_4GB_VA)
+		return SZ_4G;
+
+	if (!adreno_smmu || !adreno_smmu->get_ttbr1_cfg)
+		return SZ_4G;
+
+	ttbr1_cfg = adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
 
-	return SZ_4G;
+	/*
+	 * Userspace VM is actually using TTBR0, but both are the same size,
+	 * with b48 (sign bit) selecting which TTBRn to use.  So if IAS is
+	 * 48, the total (kernel+user) address space size is effectively
+	 * 49 bits.  But what userspace is control of is the lower 48.
+	 */
+	return BIT(ttbr1_cfg->ias);
 }
 
 void adreno_check_and_reenable_stall(struct adreno_gpu *adreno_gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index a76f4c62deee..ec58dd2ff208 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -56,6 +56,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
 #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
 #define ADRENO_QUIRK_PREEMPTION			BIT(5)
+#define ADRENO_QUIRK_4GB_VA			BIT(6)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.
@@ -103,7 +104,6 @@ struct adreno_info {
 	union {
 		const struct a6xx_info *a6xx;
 	};
-	u64 address_space_size;
 	/**
 	 * @speedbins: Optional table of fuse to speedbin mappings
 	 *
-- 
2.49.0


