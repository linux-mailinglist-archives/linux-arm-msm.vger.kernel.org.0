Return-Path: <linux-arm-msm+bounces-25115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4C4925B1A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 13:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1E041C209A5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D4F1822C8;
	Wed,  3 Jul 2024 10:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLm9T6Ky"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6510E1741C5
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 10:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004046; cv=none; b=SeVROUAiaMo0/oKKHpdK51mjbcpfjQ6nnx06KovyOdAZYL2Xe6OPA5bAc+OIHrxQR2rnVGEmZOOEl1qnt7+ARq4L6ygvJa4i0XGMvoltsyuNu2llHEMjA1sRqAWy1SxCsGz9aq/MrH1WH1wcGDDzvV6KQHp0Qorid5ABi5du78Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004046; c=relaxed/simple;
	bh=YqSTQt5dLeLvGVR7Cw3NpcAP/JRh88mVQ19Mjdbd+so=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nXJ6j5/+kJeH702FpiOUsdyhOVHzSx7ehS4x3PgehNFHri7IdkEiiPzLln/MHzXxeXQr5rPSU3otT72DrTHrIeM6lxQgd00MxpeM5Jqsjd6aJRSsCwf6wZaaxwtG7kUNVbemUtnfOd1ygY40Cs0UP9o4Crec8x55HNW6FsINW6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLm9T6Ky; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-367975543a8so105686f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 03:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720004043; x=1720608843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eSNGG3GotjTBAlAnmapyQDldxvgMj+vGrJqRSjQ/FdI=;
        b=RLm9T6Ky49zXkZNn3PdpijE4WbhlxlAzBnItCvcH75XuPNmYOyn0FuBFoA1itsw5H+
         WqJattqrm0giVGkONE8gn323433DApSPJhSRBp379kjOUVKo0YpEouLoX9bMJH6WaNFP
         NwFevWzE3X2QgaPa9A/ZMLitFvuhR0fDfYCNUxYuzPnrWv2GQOKBG7SYUmgHqfaM4z0d
         SUbE3argJaSARJkJX6HNPdgeKL094meHg2vHP8FJ51XryMhoAa7jyWTBbhw0ut5+g5TS
         /INoRRuD7n665IGBbYB+m0j9ieuNR8uMBJXp6BI33MxujBjZw7Glb6PwatNfxiQxkhA2
         mC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720004043; x=1720608843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSNGG3GotjTBAlAnmapyQDldxvgMj+vGrJqRSjQ/FdI=;
        b=cThnWteN3b/uI5ax7DVuolVrAfMdM1oCARjUZn1H4hafZ9lktdZJpSOOeDD+OtP2l0
         +0NfvLPstVVY3KTdHDpWVj49MgbieJW1dTNGTQ+GLjpfAYrb+CGTiPr4ZGLufzOIvYQb
         XpFXx6iLddqFS5uNm258flC7ysj0ELlWZAv76gfrUEEu+tX7lkhERWkjsTSwOjEVpL0n
         SsZr+HtBV2zRmjRusS1MknFfRISCPqOAKOH+0LX3fukTXv2RvKqrVNR1QA2t7zWPWfos
         E6LD7iYx6JFYKIZkFTKXHwKVahJtLDBJSqHxp+fZFc9uL3k4ZJl51r2mmNvqVlqgSUua
         t5ig==
X-Gm-Message-State: AOJu0YzFzU+YmpE4QpKL+eGDft1MYbwOJ76SlVpGQhRQHlxGDMTLc9zW
	EMomWBfGVaLgTdGlEjW8q4ZSWkAKyQ/0NwDZpG+k/G8yiWzZ8Zp3
X-Google-Smtp-Source: AGHT+IFbYFGKaiANXXTF8Ajl8YzGmcI1/8803WNaXqJuwoPgXi/1kQzdfs0rqHSfVvkIPq1XqmueVA==
X-Received: by 2002:a05:6000:18ae:b0:360:79d4:b098 with SMTP id ffacd0b85a97d-367756bad06mr7567131f8f.29.1720004042449;
        Wed, 03 Jul 2024 03:54:02 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d9b1dsm15644879f8f.42.2024.07.03.03.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:54:02 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 03 Jul 2024 11:53:48 +0100
Subject: [PATCH v2 2/3] drm/msm: Expand UBWC config setting
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-msm-tiling-config-v2-2-b9da29ab6608@gmail.com>
References: <20240703-msm-tiling-config-v2-0-b9da29ab6608@gmail.com>
In-Reply-To: <20240703-msm-tiling-config-v2-0-b9da29ab6608@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720004038; l=6571;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=YqSTQt5dLeLvGVR7Cw3NpcAP/JRh88mVQ19Mjdbd+so=;
 b=Zzxey0YUXABYR+iwfrPaLUlCL6pq087DsQ+FQ2whIMX3wOyYnunXemygLoztY5jm7vfoSW55b
 OrofpEJ0fd9BxsQQ2B1zxdggowJaEeb3j7GCEbmueBHBlZyDHxKiWhK
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


