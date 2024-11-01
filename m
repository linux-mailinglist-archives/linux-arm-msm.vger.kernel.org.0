Return-Path: <linux-arm-msm+bounces-36758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB42F9B940C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 16:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7988C281E7C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 15:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962291ADFE8;
	Fri,  1 Nov 2024 15:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bKnQxhrS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3863319F43B;
	Fri,  1 Nov 2024 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730473858; cv=none; b=o71Be0ApADhm639I1Mipy4t79GQjSSlKN4lQZVQBQwe7dv75zGsaKcOtn1/o68jT2O0NcBSZWZo/a0MRuS8cSBaTAW7n8jgI3XV3OkVUFaiLCXhWZJQjfYuMXuLqu276+c5CfW/+XtRaLeWxEpqWptLkBDuhrDLNAdPy+CPmrYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730473858; c=relaxed/simple;
	bh=E5zbXoBW0c/GFunfXC4AyXmrDTADH90SzOdi3C+M1E4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=bHUW5tRFOMXhAzHyou5wNsxaHchkHsfyNIibDidU1ggx+Zppu2CISqrub08Cax+tlC/GCZiGPaWysEePbTSO9xytsliQsJVm3Mk4PBod5Dojeb9PKAd8CWTpQtBcuyBGbh9KKR7PeN7Yk64nbKla6B2XjKnKIr4xamupZxgEfpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bKnQxhrS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1CTpOh020112;
	Fri, 1 Nov 2024 15:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KvNdtrUw6GnRmcL02FGao/
	e/VXGyiL5juN85nsnYwR0=; b=bKnQxhrSDI9n0dANJOQHB3jyRnUV6YHWI3zhMn
	PEZMbISLXRUlwZuzKLBgNmm8qxjczU1KXQpRBzY/rPVVx4dnZcIsW3tf5Zii7Hck
	FX9L+Dur3+xrVjFvHuhNbk+1O+lg884RS8c0hH/ZXN0Xu3JhTXr8/sg6KQX3MByN
	qLKnqRyb1G0RGpfkGeKWvi6qTBYMWG0mB1q9rRMgdhszNvyXoHLdIicVgQ49XTqn
	IGoDYAssGoupITLM0ZMXnME7nKRS83P+hIR3PjAFjZu5jPJSbsSLBRLc6UWfo0I+
	UyZPLzaU76U5OCIwuDxdO72mpK6PFoLaSrQNrwxKDf1cmr5g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kmp0qsus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 15:10:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A1FAhnD004688
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 15:10:43 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 1 Nov 2024
 08:10:39 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Fri, 1 Nov 2024 20:40:17 +0530
Subject: [PATCH] drm/msm/a6xx: Add support for Adreno 612
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241101-a612-gpu-support-v1-1-bdfe8f6d9306@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAFjvJGcC/yXMQQ6DIBCF4auYWZeEATpKr9K4QBksC5WCNk2Md
 y+py+8l7z+gcI5c4NEckPkTS1yXCrw1ML7cMrGIvhqUVAalRuEIlZjSLsqe0po34UlrGbD1EgP
 UW8oc4veffPaXM7/3Wt6uEQZXWIzrPMft0RhHwUsio11w1trOOsk0dKZjVHdpLbVGqXaA/jx/F
 HQtAa4AAAA=
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Jie Zhang
	<quic_jiezh@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730473839; l=6325;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=vOdz74fdlLwHcnFKe5oBpR6RcL0urN5l22sp47YBvSc=;
 b=XQakzLx+Aoo41l/buuksHMFHYVOoI9oL9KBQeHzF7thtsk3Q7x8EHuRZNQEqhjcCX80ULHOhD
 GIDmHfXYotpB//0RZG6IayEvMcj0uFVzoM1dQYVgQ8nL5HXb2Ka3HR8
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: je5nu35HTjc9W1h9NBsKUa15HpnHwG67
X-Proofpoint-ORIG-GUID: je5nu35HTjc9W1h9NBsKUa15HpnHwG67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010110

From: Jie Zhang <quic_jiezh@quicinc.com>

Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
of A615 GPU.

A612 has a new IP called Reduced Graphics Management Unit or RGMU
which is a small state machine which helps to toggle GX GDSC
(connected to CX rail) to implement IFPC feature. It doesn't support
any other features of a full fledged GMU like clock control, resource
voting to rpmh etc. So we need linux clock driver support like other
gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
Since there is no benefit with enabling RGMU at the moment, RGMU is
entirely skipped in this patch.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
Mesa support is already available for A612. Verified Glmark2 with
weston.

Some dependencies for the devicetree change are not yet available
in the mailing lists. I will send it out as a separate patch later.
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 15 +++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 28 +++++++++++++++++++++-------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 11 ++++++++---
 3 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 0c560e84ad5a..234083b69844 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -704,6 +704,21 @@ static const struct adreno_info a6xx_gpus[] = {
 			{ 157, 3 },
 			{ 127, 4 },
 		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06010200),
+		.family = ADRENO_6XX_GEN1,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+		},
+		.gmem = (SZ_128K + SZ_4K),
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a612_hwcg,
+			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00000022,
+			.prim_fifo_threshold = 0x00080000,
+		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06010500),
 		.family = ADRENO_6XX_GEN1,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 019610341df1..f69607267262 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -504,15 +504,26 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 
 	if (adreno_is_a630(adreno_gpu))
 		clock_cntl_on = 0x8aa8aa02;
-	else if (adreno_is_a610(adreno_gpu))
+	else if (adreno_is_a610(adreno_gpu) || adreno_is_a612(adreno_gpu))
 		clock_cntl_on = 0xaaa8aa82;
 	else if (adreno_is_a702(adreno_gpu))
 		clock_cntl_on = 0xaaaaaa82;
 	else
 		clock_cntl_on = 0x8aa8aa82;
 
-	cgc_delay = adreno_is_a615_family(adreno_gpu) ? 0x111 : 0x10111;
-	cgc_hyst = adreno_is_a615_family(adreno_gpu) ? 0x555 : 0x5555;
+	if (adreno_is_a612(adreno_gpu))
+		cgc_delay = 0x11;
+	else if (adreno_is_a615_family(adreno_gpu))
+		cgc_delay = 0x111;
+	else
+		cgc_delay = 0x10111;
+
+	if (adreno_is_a612(adreno_gpu))
+		cgc_hyst = 0x55;
+	else if (adreno_is_a615_family(adreno_gpu))
+		cgc_delay = 0x555;
+	else
+		cgc_delay = 0x5555;
 
 	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
 			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
@@ -600,6 +611,9 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		gpu->ubwc_config.ubwc_swizzle = 0x7;
 	}
 
+	if (adreno_is_a612(gpu))
+		gpu->ubwc_config.highest_bank_bit = 13;
+
 	if (adreno_is_a618(gpu))
 		gpu->ubwc_config.highest_bank_bit = 14;
 
@@ -1165,7 +1179,7 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_CP_LPAC_PROG_FIFO_SIZE, 0x00000020);
 
 	/* Setting the mem pool size */
-	if (adreno_is_a610(adreno_gpu)) {
+	if (adreno_is_a610(adreno_gpu) || adreno_is_a612(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 48);
 		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_DBG_ADDR, 47);
 	} else if (adreno_is_a702(adreno_gpu)) {
@@ -1199,7 +1213,7 @@ static int hw_init(struct msm_gpu *gpu)
 
 	/* Enable fault detection */
 	if (adreno_is_a730(adreno_gpu) ||
-	    adreno_is_a740_family(adreno_gpu))
+	    adreno_is_a740_family(adreno_gpu) || adreno_is_a612(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0xcfffff);
 	else if (adreno_is_a690(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x4fffff);
@@ -1864,7 +1878,7 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
 static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
 {
 	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
-	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
+	if (adreno_has_gmu_wrapper(&a6xx_gpu->base) && !adreno_is_a612(&a6xx_gpu->base))
 		return;
 
 	llcc_slice_putd(a6xx_gpu->llc_slice);
@@ -1877,7 +1891,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 	struct device_node *phandle;
 
 	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
-	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
+	if (adreno_has_gmu_wrapper(&a6xx_gpu->base) && !adreno_is_a612(&a6xx_gpu->base))
 		return;
 
 	/*
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e71f420f8b3a..5cde84817a03 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -420,6 +420,11 @@ static inline int adreno_is_a610(const struct adreno_gpu *gpu)
 	return adreno_is_revn(gpu, 610);
 }
 
+static inline int adreno_is_a612(const struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x06010200;
+}
+
 static inline int adreno_is_a618(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 618);
@@ -489,9 +494,9 @@ static inline int adreno_is_a610_family(const struct adreno_gpu *gpu)
 {
 	if (WARN_ON_ONCE(!gpu->info))
 		return false;
-
-	/* TODO: A612 */
-	return adreno_is_a610(gpu) || adreno_is_a702(gpu);
+	return adreno_is_a610(gpu) ||
+	       adreno_is_a702(gpu) ||
+	       adreno_is_a612(gpu);
 }
 
 /* TODO: 615/616 */

---
base-commit: 4a6fd06643afa99989a0e6b848e125099674227b
change-id: 20241031-a612-gpu-support-d6330f17d01f

Best regards,
-- 
Akhil P Oommen <quic_akhilpo@quicinc.com>


