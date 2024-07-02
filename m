Return-Path: <linux-arm-msm+bounces-24884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1BC923E39
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 14:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D01DB1F2233C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 12:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2594016D327;
	Tue,  2 Jul 2024 12:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yxdiukk5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430B616C847
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jul 2024 12:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719925019; cv=none; b=g9G8sGaJZB0R3Ml0ApiekKTPx96cNEVCzbky81anWHSwXHsNeqT2IflXNKR2etQdudmsvobV8HB9M72qiEJY/MocFuQw7M3Fx5BbGGEGJddWxXaVw1wIJAwD6hdBUYxSkgBNqOMPWojPMsbC+8fk6Fh1t55S+Yuyie0phsakR1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719925019; c=relaxed/simple;
	bh=wfae/FqGppsFAFeYSmy9hzy6du6jrKi2qMsq/GmcavQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hmNQL3fTQGa00UfmUu0TDW5BYbP9VpZT51X1fwcqa0dxrsizlenJE80slLFOVDfjegy3JsO+T4oeOxII+k8grq/oDlJj8S+tYwtt/eZ4+0m8KiziODpdIdgd/+E4cKrWRFRksBBfC5gcc/72tH2GcBbTVBmzU7I1Z6h4EGAsLc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yxdiukk5; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so43156031fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jul 2024 05:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719925015; x=1720529815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnGAeKy6cKabHkI1nmqibTkSazH5JxrYUCYAVQVNUgc=;
        b=Yxdiukk5BNrpCHe24J+U6cQlYVopHNO5tm60WnXsqx7VDnvx0jqOXyONpsiaFMpeLG
         pKlQNu6ca9OqidtoM//wleQMfdwM8qLOxbTYOFVM6etKE8+n/tMgQale57bWvXX802ue
         spt4g1XO/Qr0l9N8Mg55NnKfMChYIg6jQZgo4yzq7Miv2YggaonvjkDygOuhgZIbum9I
         y2qBCoSCSZuamcjC01CR1Waj6ljujWzkJgt9JBpg4s5YnYs63TiZzl6fN6ACqLMeFfY8
         qmP8x7PeixxXyTGSObYAncSQgfTCrQrnWuzwWL7HQOhEhdZYqwFBPEpQ+3b6DUjtTPVU
         0AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719925015; x=1720529815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnGAeKy6cKabHkI1nmqibTkSazH5JxrYUCYAVQVNUgc=;
        b=whdFSfr3p07tYg9XSW9DHG22Alxib0cZFqyqP4cr7Tmo5sedojWk9vuirEIpdX4QWD
         Ss2cCwWAJb/8h+VJawjO0NcjARv/16IjHmlS8alTJiXaOllpL+ID0gCMMbvNEJOExLei
         Ml80+FoVLElUwswadHiJheqiWDhaEv3XBlORabX8zZNfnhrPyfc39hXldi09cP9+0NNt
         DMp91aazHoPUL8KdNjkhnXgoWR5kXdoKexmufNGFV3dO935hjzfs591ZPhrumaAKu/7H
         9lII9rTXcv97qLqfrCzWyl9qJ7cw+Lk1FSiYD7GrZRjCmyXw78OV2oFZdSqHghz292AR
         knIA==
X-Gm-Message-State: AOJu0Yzhqg+9xMRd3ExZHJwmZUNrMDVf0sVqnfdojrhuRmgTlTqDGQ6M
	6EgxE7QhNHN4wVmj0SEVDmG6SSWK2oG1lmSmVsTyKIG2oxDbNMHu
X-Google-Smtp-Source: AGHT+IHqqYpYc7QoftKQzFzASkQHWObzeV6B+bP/VIjnFJCXVyW4kV3tImdNe1+sfli7z/0dPhfOuA==
X-Received: by 2002:a05:651c:244:b0:2ee:7255:5047 with SMTP id 38308e7fff4ca-2ee7255541cmr24696971fa.50.1719925015088;
        Tue, 02 Jul 2024 05:56:55 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fc429sm13145533f8f.68.2024.07.02.05.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 05:56:54 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 02 Jul 2024 13:56:31 +0100
Subject: [PATCH 2/3] drm/msm: Expand UBWC config setting
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-msm-tiling-config-v1-2-adaa6a6e4523@gmail.com>
References: <20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com>
In-Reply-To: <20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719925012; l=5620;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=wfae/FqGppsFAFeYSmy9hzy6du6jrKi2qMsq/GmcavQ=;
 b=2SEambhuX70gN17T2Bi7H4ND7MnPk4Xsb73JiHeQ97gQ57KqU6kpRymtE7i24NxUEyp4OJXDz
 muMO1iDAImID6whIvdAvuMMzvnKGCPl4iWZEvruYvvzW6Fkilhr0CkV
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 36 ++++++++++++++++++++++++---------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 ++-
 3 files changed, 33 insertions(+), 10 deletions(-)

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
index c98cdb1e9326..7a3564dd7941 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -499,8 +499,17 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	gpu->ubwc_config.uavflagprd_inv = 0;
 	/* Whether the minimum access length is 64 bits */
 	gpu->ubwc_config.min_acc_len = 0;
-	/* Entirely magic, per-GPU-gen value */
-	gpu->ubwc_config.ubwc_mode = 0;
+	/* Whether to enable level 1, 2 & 3 bank swizzling.
+	 * UBWC 1.0 always enables all three levels.
+	 * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & 3.
+	 * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
+	 */
+	gpu->ubwc_config.ubwc_swizzle = 0x6;
+	/* Whether to use 4-channel macrotiling mode or the newer 8-channel
+	 * macrotiling mode introduced in UBWC 3.1. 0 is 4-channel and 1 is
+	 * 8-channel.
+	 */
+	gpu->ubwc_config.macrotile_mode = 0;
 	/*
 	 * The Highest Bank Bit value represents the bit of the highest DDR bank.
 	 * This should ideally use DRAM type detection.
@@ -510,7 +519,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (adreno_is_a610(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 13;
 		gpu->ubwc_config.min_acc_len = 1;
-		gpu->ubwc_config.ubwc_mode = 1;
+		gpu->ubwc_config.ubwc_swizzle = 0x7;
 	}
 
 	if (adreno_is_a618(gpu))
@@ -536,6 +545,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
+		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
 	if (adreno_is_7c3(gpu)) {
@@ -543,12 +553,12 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
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
 
@@ -564,21 +574,26 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
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
@@ -586,6 +601,9 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
 		  adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo << 21);
+
+	gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
+		  adreno_gpu->ubwc_config.macrotile_mode);
 }
 
 static int a6xx_cp_init(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index cff8ce541d2c..b2da660c10c7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -194,9 +194,10 @@ struct adreno_gpu {
 		u32 rgb565_predicator;
 		u32 uavflagprd_inv;
 		u32 min_acc_len;
-		u32 ubwc_mode;
+		u32 ubwc_swizzle;
 		u32 highest_bank_bit;
 		u32 amsbc;
+		u32 macrotile_mode;
 	} ubwc_config;
 
 	/*

-- 
2.31.1


