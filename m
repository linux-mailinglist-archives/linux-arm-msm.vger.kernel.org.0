Return-Path: <linux-arm-msm+bounces-54871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10995A9552B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 19:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 450193B2065
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 17:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CC71E5707;
	Mon, 21 Apr 2025 17:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fctg+mXS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C311E5B71;
	Mon, 21 Apr 2025 17:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745256110; cv=none; b=NtspxLteh0g/W5ajfNxwzPXqOpLsPbsa6TUfYXJqnM6Z7wbDo7q+9h6QcZBlmpPHE1RuA4Tg0jQdz5LfoI3AWt8nmtJrjZPC82cpWXSOl4YIB1+Cn5ieoy5byI8dfQE1SW+QX1X32GhM0TtEhOjC3nagzmWn3RiBflLqfEcF/QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745256110; c=relaxed/simple;
	bh=y6HuR4ua3EAd1Z8RKCZkUyllyzezlwvlZeKY4vp+ay8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QrMGH7rsGJ7++qWuHEniUY7or2on5v59l3ntdiQ/PgpWZesrWANmruOHK8bY7pnF3BdJgAHKSgpN3lH4ZDsY7WUXDKIWhQYeVWE+Gt25idyaYrXsJtAv34mRV1zzsa/1EaGjfw4QLb8wc0XhlE/lpauHo21OWb65Bfn2OK7IjGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fctg+mXS; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so3400376a12.3;
        Mon, 21 Apr 2025 10:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745256108; x=1745860908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hI/kPYQwcnebx1GK8sp1T5NZWGKFVC/9WVdP0WQS4qs=;
        b=fctg+mXSMH0XMYK0fdCsy2/ospdcUWcpf1YHyrEDwgjMnLYSUAHYJug8SJyZdjRt9P
         j7eOmDTj3LXU3dxhgX8FWlKrbplWlNFSpP+X7SmhOad3MkkD7UYKSpWmzzUdsQ2L51Im
         ER78PC3t6BIHtT/Mry2YAAdCzxAtOxVdrDxyZuJhvdTiLuckErIQNv+6P7M+VxtDZiOK
         wQoGAjt8zFTgXvWP6IGDZS+YNnhkaDi3d7ifWXKzr95dkbmMg7Mv8Y/VyC/VpFXTw8KD
         hzAp9p+Qb2TQoDdt9IE0r2V+qXpanB0Jw23OCliR+rBJZcbXUhhG0rNBcjK85hzCcLQv
         6w4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745256108; x=1745860908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hI/kPYQwcnebx1GK8sp1T5NZWGKFVC/9WVdP0WQS4qs=;
        b=fZofXbOUfZLMR2e4HGhPCFEURpYZyZT10VSCydW2EW3d/+5lv0KGSN6mJ548Ol9YJ2
         3T7wYRTLQ+fxvelr0KtAjeMy5LuQ5zTir2AdTGoWsINIay9+blXIMGmyDzT3zUeYW9Je
         BgO/5+ZbOtvKqTfnKFvt+nzycipKRG5cP3iQosrndLffS0Ezm08S7/9LqnUlX29R8TrE
         vu0RjZhHu0EqslgfgLjZkzzQYX6cvNtJLTt3eqgH9MG/4KxZ5FsJg6VzvOcpA+6/o1AC
         D8/CpkDK7KAhTLJ9qmBxaf8OAt+UX0JdOI7j+pdnkb6Ks+5SwNQdICadJp6RPwV/b1gI
         l+9A==
X-Forwarded-Encrypted: i=1; AJvYcCXQXWH7xZsS4l5IrGqAAxxEIAGkQeJhpKpEyKMlaFmnNx2iZnHNkF7ODazRCXbZmVgWgfyj8/4XE8CvxRpA@vger.kernel.org, AJvYcCXdbiP7nuUo912vqya1zo9cWfrqZM7lO/bwawhQM5jtkAJfBq5B1pCXvxNeWSLbY7OdEBC5lByUywVE9qNr@vger.kernel.org
X-Gm-Message-State: AOJu0YzyVJd3DoKKwRwftLbKKiVnmEZhlyeKlcpU7VoAYBKmOkEY9FJo
	+0TvtRSbigo0SXm3t3wfzft3kqvq/XBioQ5xN32OvqQpoPC4cImMcTiFhA==
X-Gm-Gg: ASbGncuoe5xkJrJ4Qc/IXjYMlQRvbPypCpX1gapRVR4WSYr8jat5LRwKUnp7KANA2kc
	EU6j6lkpLZIxVaJVxj42XitMHFnPRo9Pjq/1HEdjnMHhYIqssoYrAcdODffr5gLKw2WlVmbiUHS
	2jn7SGlFv9IGEc2c+wtGMednXwViDumHWI02nMsToDe3Zy8pktgEEtqKJ2wjpZCnt31l325i3dh
	axv5vZhP2R7XB84IGb+azmSbMw0jEVntK77jNAV0exBItGi9LP02/cFfWUSVgHoDgdM8LSts/Rg
	d1VvGZaCwOdItODC2+DBfEZW2/1kIDqgpm5jm/ea8tUpCEqLJ076TOTOuC+oCtGXsztDCpuUOhK
	YDpQNbZ9x7aH7pMY=
X-Google-Smtp-Source: AGHT+IFUf+PTQfUR2eCURDiia5Zf7s/G+bncDAm/QXNWolKB8z01IfAgsK8aNPfU0hLSVli4c4Ul7A==
X-Received: by 2002:a05:6a21:6daa:b0:1f5:67c2:e3e9 with SMTP id adf61e73a8af0-203cbd2383fmr18140909637.29.1745256107724;
        Mon, 21 Apr 2025 10:21:47 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db127742bsm4642984a12.1.2025.04.21.10.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 10:21:47 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm/adreno: Drop fictional address_space_size
Date: Mon, 21 Apr 2025 10:21:43 -0700
Message-ID: <20250421172144.168273-1-robdclark@gmail.com>
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

v2: Properly account for vm_start

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 33 +++++++++++------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 19 ++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  4 ++-
 4 files changed, 36 insertions(+), 22 deletions(-)

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
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index eeb8b5e582d5..129c33f0b027 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2272,7 +2272,7 @@ a6xx_create_private_address_space(struct msm_gpu *gpu)
 		return ERR_CAST(mmu);
 
 	return msm_gem_address_space_create(mmu,
-		"gpu", 0x100000000ULL,
+		"gpu", ADRENO_VM_START,
 		adreno_private_address_space_size(gpu));
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 59cfed5acace..e80db01a01c0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -236,14 +236,27 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 u64 adreno_private_address_space_size(struct msm_gpu *gpu)
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
 
-	return SZ_4G;
+	if (!adreno_smmu || !adreno_smmu->get_ttbr1_cfg)
+		return SZ_4G;
+
+	ttbr1_cfg = adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
+
+	/*
+	 * Userspace VM is actually using TTBR0, but both are the same size,
+	 * with b48 (sign bit) selecting which TTBRn to use.  So if IAS is
+	 * 48, the total (kernel+user) address space size is effectively
+	 * 49 bits.  But what userspace is control of is the lower 48.
+	 */
+	return BIT(ttbr1_cfg->ias) - ADRENO_VM_START;
 }
 
 void adreno_check_and_reenable_stall(struct adreno_gpu *adreno_gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index a1e2d9e87b75..2366a57b280f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -57,6 +57,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
 #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
 #define ADRENO_QUIRK_PREEMPTION			BIT(5)
+#define ADRENO_QUIRK_4GB_VA			BIT(6)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.
@@ -104,7 +105,6 @@ struct adreno_info {
 	union {
 		const struct a6xx_info *a6xx;
 	};
-	u64 address_space_size;
 	/**
 	 * @speedbins: Optional table of fuse to speedbin mappings
 	 *
@@ -600,6 +600,8 @@ static inline int adreno_is_a7xx(struct adreno_gpu *gpu)
 	       adreno_is_a740_family(gpu);
 }
 
+/* Put vm_start above 32b to catch issues with not setting xyz_BASE_HI */
+#define ADRENO_VM_START 0x100000000ULL
 u64 adreno_private_address_space_size(struct msm_gpu *gpu);
 int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len);
-- 
2.49.0


