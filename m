Return-Path: <linux-arm-msm+bounces-28092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D9094A839
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 15:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D33B285404
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 13:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30361E4F03;
	Wed,  7 Aug 2024 13:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oth39xsU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6336155C83
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Aug 2024 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723035916; cv=none; b=rBUQE3gpE/gVYIxyGMZGZRod64Eg5Y0TCHity2RyHcxePIsl+Y+7XndyioPfF+1uxTk/0RAx7pQr58zEar6tsw7dY8/jE7Kg/Sau/IvZsKuIIq5y6whyUmrXFQLcpdRZdcQ7wRuUjYYOg8RRyIbP4vGObgCT2qMP2nf7CM77Tng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723035916; c=relaxed/simple;
	bh=YqSTQt5dLeLvGVR7Cw3NpcAP/JRh88mVQ19Mjdbd+so=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jtBnuXSI2ytaXmRhKru7hUKu7QPPtmFWodTMQowz3FHTeWyWzW8g9m6MnLRquSJrsXTKr5FfGYCSFwcF3MzLCfCafhMFJ0Yw6+CqROeb45XhCXzHiBrp5Z4ryeGn7ajXVvYaDaVUZ4m+9LPol41USM8Tul18+LHhq/Fco+8A8vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oth39xsU; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-369cb9f086aso1108079f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Aug 2024 06:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723035913; x=1723640713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eSNGG3GotjTBAlAnmapyQDldxvgMj+vGrJqRSjQ/FdI=;
        b=Oth39xsUENd9uIeYu7gPraHqZ1yWR2NZqFX+f4iXKP+8I0+ErjevTc4bHEz3T1XMdH
         c/k7dc//gElwp44RjQ7rsn4yRO5dqsgbR3dpQx+s08Zygr6sf9H74StxRkAr1w9lnSY1
         I/nFOB9g3tyukGCJL+FRr7kgvfbBAro6X4OnZHPo2rcB+udq4o9kckfH19T/A5F0bBjB
         pcz0emO6QtvYNVzC7yvl98hZnm+oYX0o6Br2H/X8YHwcitgz0HJv/VtArKpR4quVHmzI
         PaJrzgRhK802rv8gOPkEu4pzPJk8GA/qyzJfBqyQCzzu1WWuvPv6lUdMDr0fqmHXpGYR
         NVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723035913; x=1723640713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSNGG3GotjTBAlAnmapyQDldxvgMj+vGrJqRSjQ/FdI=;
        b=bhIjU/QtgeUO5vhrSSS60+CO3w4SEBe4kq63g9uaZhCyvJM0xBGpcajJuNcld3dKGj
         I9XJhW0YUKoUlnRt1VXkWntJnki6JeOanRDXz601kMNDRdHamfVFxHNEo0kAWefg1JHW
         Miq5MuYFXet3o1IUhvZMfAc8FnBacoRxTHzQcWuDRMre4QOhkdK3ALcSIqLUuTpfsQD2
         PAYm5uwASzJq9s4S3CjIpI8Gsp2YZSYSCIDnOnVqHa6S74ave78ulOYvGL71i0w7kYki
         Yps2XkBh5b0AWw84QvLGQgSvVvhh108hxi98Xhex4xP/7ZWf8f13Le6mPZiwyXT84ozC
         2Ccg==
X-Gm-Message-State: AOJu0YwUeMIAyXb39YSW4NAgd2tamQ/Neo4tBgPh+cHjL5rL8OnkociL
	46YY08c6dIWw1uE+r0yZgRQZENNXaVIcNMWlmxsApw6VRr7i+BRr
X-Google-Smtp-Source: AGHT+IEVihQ/enbqo557pBdcDAromC8hvGH0wJJ3SOz3/ngZqBuYMGtcs3lfS/dXja46KX0ptKPeww==
X-Received: by 2002:adf:e411:0:b0:364:3ba5:c5af with SMTP id ffacd0b85a97d-36bbc1c34e2mr13190156f8f.61.1723035912901;
        Wed, 07 Aug 2024 06:05:12 -0700 (PDT)
Received: from [192.168.0.12] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd05980csm16072849f8f.76.2024.08.07.06.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 06:05:12 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 07 Aug 2024 14:04:57 +0100
Subject: [PATCH v3 2/4] drm/msm: Expand UBWC config setting
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-msm-tiling-config-v3-2-ef1bc26efb4c@gmail.com>
References: <20240807-msm-tiling-config-v3-0-ef1bc26efb4c@gmail.com>
In-Reply-To: <20240807-msm-tiling-config-v3-0-ef1bc26efb4c@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723035909; l=6571;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=YqSTQt5dLeLvGVR7Cw3NpcAP/JRh88mVQ19Mjdbd+so=;
 b=P5jyBp0Q0bjWVd0ij4ec8KGzM8lAUFGvkfsd5iNbP21FQ2K9NUgnhAWC4GQbUeHYC9+offb50
 ib0AzeLNfzTDTAAdfBktOVj2Z253hUGca9jDlTcjaHECi50pfa2DgFa
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

According to downstream we should be setting RBBM_NC_MODE_CNTL to a
non-default value on a663 and a680, we don't support a663 and on a680
we're leaving it at the wrong (suboptimal) value. Just set it on all
GPUs. Similarly, plumb through level2_swizzling_dis which will be
necessary on a663.

ubwc_mode is expanded and renamed to ubwc_swizzle to match the name on
the display side. Similarly macrotile_mode should match the display
side.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  4 ++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 34 +++++++++++++++++----------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 32 ++++++++++++++++++++++++++++++-
 3 files changed, 53 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index c003f970189b..33b0f607f913 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1788,5 +1788,9 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	else
 		adreno_gpu->ubwc_config.highest_bank_bit = 14;
 
+	/* a5xx only supports UBWC 1.0, these are not configurable */
+	adreno_gpu->ubwc_config.macrotile_mode = 0;
+	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
+
 	return gpu;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index bcaec86ac67a..7c2fdd1e7684 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -493,24 +493,17 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 
 static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 {
-	/* Unknown, introduced with A650 family, related to UBWC mode/ver 4 */
 	gpu->ubwc_config.rgb565_predicator = 0;
-	/* Unknown, introduced with A650 family */
 	gpu->ubwc_config.uavflagprd_inv = 0;
-	/* Whether the minimum access length is 64 bits */
 	gpu->ubwc_config.min_acc_len = 0;
-	/* Entirely magic, per-GPU-gen value */
-	gpu->ubwc_config.ubwc_mode = 0;
-	/*
-	 * The Highest Bank Bit value represents the bit of the highest DDR bank.
-	 * This should ideally use DRAM type detection.
-	 */
+	gpu->ubwc_config.ubwc_swizzle = 0x6;
+	gpu->ubwc_config.macrotile_mode = 0;
 	gpu->ubwc_config.highest_bank_bit = 15;
 
 	if (adreno_is_a610(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 13;
 		gpu->ubwc_config.min_acc_len = 1;
-		gpu->ubwc_config.ubwc_mode = 1;
+		gpu->ubwc_config.ubwc_swizzle = 0x7;
 	}
 
 	if (adreno_is_a618(gpu))
@@ -536,6 +529,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
+		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
 	if (adreno_is_7c3(gpu)) {
@@ -543,12 +537,12 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
+		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
 	if (adreno_is_a702(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 14;
 		gpu->ubwc_config.min_acc_len = 1;
-		gpu->ubwc_config.ubwc_mode = 0;
 	}
 }
 
@@ -564,21 +558,26 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
+	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
+	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
+		  level2_swizzling_dis << 12 |
 		  adreno_gpu->ubwc_config.rgb565_predicator << 11 |
 		  hbb_hi << 10 | adreno_gpu->ubwc_config.amsbc << 4 |
 		  adreno_gpu->ubwc_config.min_acc_len << 3 |
-		  hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
+		  hbb_lo << 1 | ubwc_mode);
 
-	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, hbb_hi << 4 |
+	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL,
+		  level2_swizzling_dis << 6 | hbb_hi << 4 |
 		  adreno_gpu->ubwc_config.min_acc_len << 3 |
-		  hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
+		  hbb_lo << 1 | ubwc_mode);
 
-	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, hbb_hi << 10 |
+	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
+		  level2_swizzling_dis << 12 | hbb_hi << 10 |
 		  adreno_gpu->ubwc_config.uavflagprd_inv << 4 |
 		  adreno_gpu->ubwc_config.min_acc_len << 3 |
-		  hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
+		  hbb_lo << 1 | ubwc_mode);
 
 	if (adreno_is_a7xx(adreno_gpu))
 		gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
@@ -586,6 +585,9 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
 		  adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo << 21);
+
+	gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
+		  adreno_gpu->ubwc_config.macrotile_mode);
 }
 
 static int a6xx_cp_init(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e1c69bb022d6..6aca9a9e904d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -191,12 +191,42 @@ struct adreno_gpu {
 	const struct firmware *fw[ADRENO_FW_MAX];
 
 	struct {
+		/**
+		 * @rgb565_predicator: Unknown, introduced with A650 family,
+		 * related to UBWC mode/ver 4
+		 */
 		u32 rgb565_predicator;
+		/** @uavflagprd_inv: Unknown, introduced with A650 family */
 		u32 uavflagprd_inv;
+		/** @min_acc_len: Whether the minimum access length is 64 bits */
 		u32 min_acc_len;
-		u32 ubwc_mode;
+		/**
+		 * @ubwc_swizzle: Whether to enable level 1, 2 & 3 bank swizzling.
+		 *
+		 * UBWC 1.0 always enables all three levels.
+		 * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & 3.
+		 * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
+		 *
+		 * This is a bitmask where BIT(0) enables level 1, BIT(1)
+		 * controls level 2, and BIT(2) enables level 3.
+		 */
+		u32 ubwc_swizzle;
+		/**
+		 * @highest_bank_bit: Highest Bank Bit
+		 *
+		 * The Highest Bank Bit value represents the bit of the highest
+		 * DDR bank.  This should ideally use DRAM type detection.
+		 */
 		u32 highest_bank_bit;
 		u32 amsbc;
+		/**
+		 * @macrotile_mode: Macrotile Mode
+		 *
+		 * Whether to use 4-channel macrotiling mode or the newer
+		 * 8-channel macrotiling mode introduced in UBWC 3.1. 0 is
+		 * 4-channel and 1 is 8-channel.
+		 */
+		u32 macrotile_mode;
 	} ubwc_config;
 
 	/*

-- 
2.31.1


