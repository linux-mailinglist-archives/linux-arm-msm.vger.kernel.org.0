Return-Path: <linux-arm-msm+bounces-1997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3722C7F8DB9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 20:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6478281514
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 19:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B472F842;
	Sat, 25 Nov 2023 19:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+YMqppF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8BA2F3;
	Sat, 25 Nov 2023 11:12:07 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-35b1d57d7dbso9903695ab.3;
        Sat, 25 Nov 2023 11:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700939527; x=1701544327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InO944iGhkpnbZZ89M4jhM8BqOJsrw18SbpUTux2+2c=;
        b=k+YMqppFCgYM1JhOmczim9wumLqHRSQ5wTsAUydNqfiPkGr8UMorkDPLO9g3PriZDg
         yjyXFeXAQkeSAtjJHg5NbhXXqXdN/jYoDpLqJHEBcMBf4Tt6cEhN3Lw32QnK14TSpG6V
         Z39s90+c88e1ebKN5kDObSbRglxvzEJ42mqcWymXJAAKzeVp3+JUqoK3mNvy1c17MRKh
         k7neeObKGRm0UHSvyvcS6Q3uMbOI/yT4VOOnWIJai3OgiXUuWVtV7dcRpFybG7Jak42Y
         e3G6eR+3iUQ0ZM5b20/mQnigiezIFYw6Vd/R9mPd8TUpfFlGAu/uY9IPzRcYB6pYCf7k
         4+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700939527; x=1701544327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InO944iGhkpnbZZ89M4jhM8BqOJsrw18SbpUTux2+2c=;
        b=RM2taXz8zGpVM3rp+ERURd9AMcxEGDibt0OuvvmEmeWsV60cF6NiIzdpr3fzYoADKi
         R/FwOlBFX9Jy7pH7KWlBI48jAka8YkBaOkQGABLhWdVwsaOg0RwqhezEop6rRmAxkoh2
         Pz5oaWnjRI8KtA0SuxvOBPP3jJOQWKjRMRQW5FcxA31iINO6p2a0C7s6E97AC2AtgX56
         CH3Uas4DH3gAvkzxBvmsC6Gzw4XrtghZ2q4bPQ9z1eFkotmAyb4pfIyZIibi2hk086RR
         BClqKXeoA1SpFCZ2U1ShFeD3uxmD/6Tih8QC24DZ6Ms8Eze5dCfyKMO1CUoK1rXTFqg1
         5WMg==
X-Gm-Message-State: AOJu0YzLa+DpLw6h75nn5Fuqym4ypx9DoUVBHk/qUBRYhhl2oYpZ9UhO
	Qb2M6eufwddcuJx0fOd/BCzTyTtlAYY=
X-Google-Smtp-Source: AGHT+IFwE/dHHJzHe6umOUV9J8rWksNeOz/QBwxeptGGIiqOaT/t/oac6tTFX63Ey8kBhnkhJUYKeA==
X-Received: by 2002:a05:6e02:2142:b0:35c:9577:dee with SMTP id d2-20020a056e02214200b0035c95770deemr2672154ilv.1.1700939527119;
        Sat, 25 Nov 2023 11:12:07 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d25-20020aa78159000000b006cbae51f335sm4817092pfn.144.2023.11.25.11.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 11:12:06 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Danylo Piliaiev <dpiliaiev@igalia.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] drm/msm/a690: Fix reg values for a690
Date: Sat, 25 Nov 2023 11:11:51 -0800
Message-ID: <20231125191155.5375-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121162137.60488-1-robdclark@gmail.com>
References: <20231121162137.60488-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Danylo Piliaiev <dpiliaiev@igalia.com>

KGSL doesn't support a690 so all reg values were the same as
on a660. Now we know the values and they are different from the
windows driver.

This fixes hangs on D3D12 games and some CTS tests.

Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index d10b22eeda74..7784d7d39192 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1312,6 +1312,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 
 	if (adreno_is_a650(adreno_gpu) ||
 	    adreno_is_a660(adreno_gpu) ||
+	    adreno_is_a690(adreno_gpu) ||
 	    adreno_is_a730(adreno_gpu) ||
 	    adreno_is_a740_family(adreno_gpu)) {
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
@@ -1321,13 +1322,6 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		uavflagprd_inv = 2;
 	}
 
-	if (adreno_is_a690(adreno_gpu)) {
-		hbb_lo = 2;
-		amsbc = 1;
-		rgb565_predicator = 1;
-		uavflagprd_inv = 2;
-	}
-
 	if (adreno_is_7c3(adreno_gpu)) {
 		hbb_lo = 1;
 		amsbc = 1;
@@ -1741,7 +1735,9 @@ static int hw_init(struct msm_gpu *gpu)
 	/* Setting the primFifo thresholds default values,
 	 * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
 	*/
-	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu) || adreno_is_a690(adreno_gpu))
+	if (adreno_is_a690(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00800200);
+	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
 	else if (adreno_is_a640_family(adreno_gpu) || adreno_is_7c3(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
@@ -1775,6 +1771,8 @@ static int hw_init(struct msm_gpu *gpu)
 	if (adreno_is_a730(adreno_gpu) ||
 	    adreno_is_a740_family(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0xcfffff);
+	else if (adreno_is_a690(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x4fffff);
 	else if (adreno_is_a619(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
 	else if (adreno_is_a610(adreno_gpu))
@@ -1808,12 +1806,17 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_cp_protect(gpu);
 
 	if (adreno_is_a660_family(adreno_gpu)) {
-		gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, 0x1);
+		if (adreno_is_a690(adreno_gpu))
+			gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, 0x00028801);
+		else
+			gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, 0x1);
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x0);
 	}
 
+	if (adreno_is_a690(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x90);
 	/* Set dualQ + disable afull for A660 GPU */
-	if (adreno_is_a660(adreno_gpu))
+	else if (adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x66906);
 	else if (adreno_is_a7xx(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG,
-- 
2.42.0


