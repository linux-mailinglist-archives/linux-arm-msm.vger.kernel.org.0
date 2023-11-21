Return-Path: <linux-arm-msm+bounces-1391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C487F338E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 17:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84B191C21745
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 16:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58465A0F5;
	Tue, 21 Nov 2023 16:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WipS5yOl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF58112;
	Tue, 21 Nov 2023 08:21:51 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2839cf9ea95so2679990a91.1;
        Tue, 21 Nov 2023 08:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700583711; x=1701188511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KTFRsgH40UD7MzukJZyHOiKKI64hMJVUbzazPe+Qj2U=;
        b=WipS5yOlOG4RrpSzlFf3OGQb1AGAVj0GBR70jIC/Yn0Y6NreTMet4+TvQ72NV+QykB
         BTglDf/9E5sXb4wnWXyk0ZdOdQiXPjJvuAsH/vsrFhRfSTuvkCCmE2+k6qYfeBQYmJDf
         MTfx1/Lbx1vRSVNduyDcm4hn3uxzwIV7KBe4lR1C1XDk+WUhQbuqPX6wWSvdN3dFZDtA
         d3UJ2rfL/erP/l/1koQem4ZjqPD+x2kW5LHbjQJc7704MuwyNvRZRCEDZNFa4irDPOyS
         xj7xOgHKBfkRroXgl4HrDqZHvvKD2JC3K1im/cBWO/nSvRsSze4pOc0ObDSxRXND4Dmu
         ujow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700583711; x=1701188511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTFRsgH40UD7MzukJZyHOiKKI64hMJVUbzazPe+Qj2U=;
        b=M0+VNxSQWemGDB0yn466DxgL/HjjlHMSbEYE2ZaeMUV9220tgwEKzSGUuAacDgJjZT
         wRBOxkNkZNj6RLd31MGNeGjWbv2UHBXJrQVMuhJ1GZiShkrJt2OPXyDd8oguSYoBzl32
         tTSZnnFgAEzYMTr5BkLTZ4bKmd0HCaoWp+prEFvGVXJebGpb2sHrWj+gacW4VKpUVJWt
         gvSY41KkqSKpxFYaz8/ZOcisBWkibSds9zWEAEWdfXqJDKF+FI3cQXsBPgFgVrrEird6
         f6vzLj9RMfCA7kQdhmVYSnopIQElaWLGvmshnt2nx4WOlH+fLZBXFfb1B8nuLdBmxzT/
         dFsA==
X-Gm-Message-State: AOJu0YyMDY6+eMzwO366TthaXVpcGIayHQHotrHd6cgysEp1IGmk1TLw
	nGG5ZYBQc8w/FqknfHBYV18=
X-Google-Smtp-Source: AGHT+IGGtBENf9dS160s3wzmeIjVz/3q7r1rgfd53W48Vj7jDLdwxWWpKeJHhYrbHGCukPK/mmxSuA==
X-Received: by 2002:a17:90a:19c:b0:280:4f82:68ac with SMTP id 28-20020a17090a019c00b002804f8268acmr8403000pjc.24.1700583710574;
        Tue, 21 Nov 2023 08:21:50 -0800 (PST)
Received: from localhost ([47.215.232.245])
        by smtp.gmail.com with ESMTPSA id t2-20020a17090aae0200b00274262bcf8dsm9306648pjq.41.2023.11.21.08.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 08:21:49 -0800 (PST)
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
Subject: [PATCH] drm/msm/a690: Fix reg values for a690
Date: Tue, 21 Nov 2023 08:21:34 -0800
Message-ID: <20231121162137.60488-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8176ea8da7a7..75e1ea0404d3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1326,6 +1326,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		amsbc = 1;
 		rgb565_predicator = 1;
 		uavflagprd_inv = 2;
+		ubwc_mode = 2;
 	}
 
 	if (adreno_is_7c3(adreno_gpu)) {
@@ -1741,7 +1742,9 @@ static int hw_init(struct msm_gpu *gpu)
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
@@ -1775,6 +1778,8 @@ static int hw_init(struct msm_gpu *gpu)
 	if (adreno_is_a730(adreno_gpu) ||
 	    adreno_is_a740_family(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0xcfffff);
+	else if (adreno_is_a690(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x4fffff);
 	else if (adreno_is_a619(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
 	else if (adreno_is_a610(adreno_gpu))
@@ -1782,7 +1787,10 @@ static int hw_init(struct msm_gpu *gpu)
 	else
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x1fffff);
 
-	gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, 1);
+	if (adreno_is_a690(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, 0x81);
+	else
+		gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, 1);
 
 	/* Set weights for bicubic filtering */
 	if (adreno_is_a650_family(adreno_gpu)) {
@@ -1808,12 +1816,17 @@ static int hw_init(struct msm_gpu *gpu)
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


