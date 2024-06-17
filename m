Return-Path: <linux-arm-msm+bounces-22942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BAE90BD9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 00:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 774451F2203A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 22:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A4C199E91;
	Mon, 17 Jun 2024 22:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXTCJLfj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A71F187575;
	Mon, 17 Jun 2024 22:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718663373; cv=none; b=c1aqcjr7eljLeHBhJ5k4jHMFVmhP6Xzscla9VyX9K/ggjU/PoO6rivcLKHfX7ACqZxFxHlhuaeFiNpx9RqclCu9hP+MFoMX748UOtDK1zSOupWWA32IWZwx11H4Qnrtafhc6FmgNrq5J5C5n/y/yxPE4W8CIZRVoVPluheDpxs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718663373; c=relaxed/simple;
	bh=NkZo8RX25sudoClmFxD03msEVKOmv/1UFSjECb0a9V8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AQpKlnQiPn/fzP0aRlUV786jFCXZj8pHDED8HARVpLKyFja4nW8imSy6FHR7IWuH5EdnrPPh4VDJAp1V97p701MCcN4aOegaWMjl4FWt3h+jKDAXkxk4hW/w3QjQURnO4ygWMcDgko+kPjiZBeF4NGdLBIPJZ/TXoH5WYT/WQA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXTCJLfj; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70413de08c7so3505277b3a.0;
        Mon, 17 Jun 2024 15:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718663370; x=1719268170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4IYXAH6lVov3UMTU4HBmUE8GultQbuKxDL2V8XOctOE=;
        b=BXTCJLfj+impzX96F6a7OF8wpP/cREP1igzecNHW+L5C7+dKgVPHu5btdam6YxeIx2
         YS4txny3DLl7g+Yw8BM6lD+fkOp6DUwkhXped7WtBTv5PRLV9Wo9rWT+2hmVgERdFnjN
         rYz8x/0liSZ1fGYRDvo9IfQt4P7Y5ACuUfC0KD1xJa0EtTujN9emxku8L4NCP07MvgLa
         b7BS0ulyEv/onKLoau5yw1fRMWBu8pfIQwU/81y6BMzpGO9aI03UqsjB0Qttwydr/GPO
         2TON5ATJ/lCM891pb0gFv4Casiguw0aA4f9yWVcIrPeQer0oTPgnHrnuStWMeQqcQovA
         sBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718663370; x=1719268170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4IYXAH6lVov3UMTU4HBmUE8GultQbuKxDL2V8XOctOE=;
        b=tXl+uB1AUrw5aV5HN0u/Fzq8vDyYG2cd9Y97YqCHorpgCru8vS9ktkGR+Z0fNaiGSC
         mTOlxrKBcnaQa8W71EvgFbox9IeEbi9egYagXs5wiMvjtn0Tvq8RJeCQRUQlvHVV987l
         7h8pekTbzCCncX6BoLn7tti8Af+oRAPqiJ6zZAjJWOV4jBAOqGfZ83WjD/Vcd+C6g9tu
         WZkiYh0w38zN6RnIcPPOHqmdRf49ltH3laRp8Z/XrjQVQvlBNNnOIPLBCS4UreJSpgUS
         GFRwl7ImQxPB02GD2HaCwSFZNqV/aitKwew3Ich0q7otO9egOZDhOG7risYJQAyS6BAE
         Vrpw==
X-Forwarded-Encrypted: i=1; AJvYcCURCfdr2FwR964A5lYhalvdJqgyzDKS/oO3yRi6Z7l5DEJGeZ7wHeif0eNFXJeB5HSPFNxdPenu3s6LhBxgSqhTlLs1vADOXnkzlsLm
X-Gm-Message-State: AOJu0YzRa4baHdIRBC+Al3VnnFjOdXc5kR+0alCHi7yjoEeYjuNgCx2I
	jnqmOw4YTBhdTO/YVx0bSI5nIVRI/Uf04MfQnVodQ2BIbyDoNvV1
X-Google-Smtp-Source: AGHT+IEMNZNbb3l7I5P+6ZevtpY84ksxLR9Fb0E6NKr/WRyORzKCXJTc1fuh+ZcG5+jpkwJHT703/Q==
X-Received: by 2002:a05:6a20:8405:b0:1af:939b:d477 with SMTP id adf61e73a8af0-1bae7f14684mr10805057637.36.1718663369830;
        Mon, 17 Jun 2024 15:29:29 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4c468e5a6sm9518979a91.56.2024.06.17.15.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 15:29:28 -0700 (PDT)
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
Subject: [PATCH v2 1/5] drm/msm/adreno: Split up giant device table
Date: Mon, 17 Jun 2024 15:28:59 -0700
Message-ID: <20240617222916.5980-2-robdclark@gmail.com>
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

Split into a separate table per generation, in preparation to move each
gen's device table to it's own file.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 67 +++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 10 ++++
 2 files changed, 63 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index c3703a51287b..c8319706c5fe 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -20,7 +20,7 @@ bool allow_vram_carveout = false;
 MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in place of IOMMU");
 module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600);
 
-static const struct adreno_info gpulist[] = {
+static const struct adreno_info a2xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x02000000),
 		.family = ADRENO_2XX_GEN1,
@@ -54,7 +54,12 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a2xx_gpu_init,
-	}, {
+	}
+};
+DECLARK_ADRENO_GPULIST(a2xx);
+
+static const struct adreno_info a3xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x03000512),
 		.family = ADRENO_3XX,
 		.fw = {
@@ -116,7 +121,12 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a3xx_gpu_init,
-	}, {
+	}
+};
+DECLARK_ADRENO_GPULIST(a3xx);
+
+static const struct adreno_info a4xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x04000500),
 		.family = ADRENO_4XX,
 		.revn  = 405,
@@ -149,7 +159,12 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = (SZ_1M + SZ_512K),
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a4xx_gpu_init,
-	}, {
+	}
+};
+DECLARK_ADRENO_GPULIST(a4xx);
+
+static const struct adreno_info a5xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x05000600),
 		.family = ADRENO_5XX,
 		.revn = 506,
@@ -274,7 +289,12 @@ static const struct adreno_info gpulist[] = {
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
 		.init = a5xx_gpu_init,
 		.zapfw = "a540_zap.mdt",
-	}, {
+	}
+};
+DECLARK_ADRENO_GPULIST(a5xx);
+
+static const struct adreno_info a6xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
 		.family = ADRENO_6XX_GEN1,
 		.revn = 610,
@@ -520,7 +540,12 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a690_zap.mdt",
 		.hwcg = a690_hwcg,
 		.address_space_size = SZ_16G,
-	}, {
+	}
+};
+DECLARK_ADRENO_GPULIST(a6xx);
+
+static const struct adreno_info a7xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
 		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
 		.fw = {
@@ -582,7 +607,17 @@ static const struct adreno_info gpulist[] = {
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
 		.address_space_size = SZ_16G,
-	},
+	}
+};
+DECLARK_ADRENO_GPULIST(a7xx);
+
+static const struct adreno_gpulist *gpulists[] = {
+	&a2xx_gpulist,
+	&a3xx_gpulist,
+	&a4xx_gpulist,
+	&a5xx_gpulist,
+	&a6xx_gpulist,
+	&a6xx_gpulist,
 };
 
 MODULE_FIRMWARE("qcom/a300_pm4.fw");
@@ -617,13 +652,17 @@ MODULE_FIRMWARE("qcom/yamato_pm4.fw");
 static const struct adreno_info *adreno_info(uint32_t chip_id)
 {
 	/* identify gpu: */
-	for (int i = 0; i < ARRAY_SIZE(gpulist); i++) {
-		const struct adreno_info *info = &gpulist[i];
-		if (info->machine && !of_machine_is_compatible(info->machine))
-			continue;
-		for (int j = 0; info->chip_ids[j]; j++)
-			if (info->chip_ids[j] == chip_id)
-				return info;
+	for (int i = 0; i < ARRAY_SIZE(gpulists); i++) {
+		for (int j = 0; j < gpulists[i]->gpus_count; j++) {
+			const struct adreno_info *info = &gpulists[i]->gpus[j];
+
+			if (info->machine && !of_machine_is_compatible(info->machine))
+				continue;
+
+			for (int k = 0; info->chip_ids[k]; k++)
+				if (info->chip_ids[k] == chip_id)
+					return info;
+		}
 	}
 
 	return NULL;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 77526892eb8c..7f20029d3876 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -114,6 +114,16 @@ struct adreno_info {
 
 #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }
 
+struct adreno_gpulist {
+	const struct adreno_info *gpus;
+	unsigned gpus_count;
+};
+
+#define DECLARK_ADRENO_GPULIST(name)                  \
+const struct adreno_gpulist name ## _gpulist = {      \
+	name ## _gpus, ARRAY_SIZE(name ## _gpus)      \
+}
+
 /*
  * Helper to build a speedbin table, ie. the table:
  *      fuse | speedbin
-- 
2.45.2


