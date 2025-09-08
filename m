Return-Path: <linux-arm-msm+bounces-72515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3C9B4871B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A66EE3414A7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487DB2EC56E;
	Mon,  8 Sep 2025 08:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWI9YHWL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1032EC09D
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757320064; cv=none; b=YMOkX5NOIIT8q7OWJrhqXN0DzqvaOkBMwTm78ZdaLghEM+SYiuV0Ub0kXyPxA9bT3xW6UOa32RBK3/HZ86TypXQbNSLB97AXqalyDt0p9I0xyOc1pCnGOrHwYsGmrl4P4coP4S+ZABfVmKQpbiYFT93VuKW+FmLLLI7lQKmdc98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757320064; c=relaxed/simple;
	bh=giC1WMM/22jbsYABWcvDAeFCcEWVS1OnTn0KmBBmmok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WU4IsT57vxCwhkQSWlmYRv78hycNiottaJ6SPEAKkP4YDYY9mTWdrjs8b9gZdbssg0jwS3JaEoym+qX6W6bvDoIPjzckP7xYdlSFwZH3OR600JqoaNoCtn3/TYZvmLryb63bNk1CYOp+e1f+/UaOikgbZV+hq4pZzVlLn58CPdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mWI9YHWL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LnPTk028663
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jzazIGzZ/t3zV87a3OBQ5k2i0Hby+qyQ7WI+u2m4iEY=; b=mWI9YHWLpV1tGAtZ
	o4n5P0TIcdd8Dy0MGJu9kjUPiyp+vmmhe9xD0KbnlVX6XBEPOVYuJSi6Xxl0yS7a
	yLGEO2LMl4q7K+gPB7FaNWtssafnHdWxze4fGlh6MdwbBpnRkenr9eBrmEt8l1On
	Y+EMMFP0EAWFrCdLrhC9oKXSVT3KhWIEObmSFoC/GgqtWOitn3DTnHB3ecrh6XE5
	AIVjPkg0lmbM+d7PUHhM08azLGseMMeta/KQQk6nB7M3Uf5+x0jXNHm6RGEUU5z9
	TlxWsnSgkzFyvQTKz+Jxdgs9GjC9wtJk+aVNZyKo1albDt+ktUMImG3z29AZP/Zo
	+DlvLg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j3vdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:27:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7741ef59d18so2370930b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757320060; x=1757924860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzazIGzZ/t3zV87a3OBQ5k2i0Hby+qyQ7WI+u2m4iEY=;
        b=tjTG6tpvS4hYDKA8wBocVMu8briaYjOW7tqAI9L7i1BP+q6gl/rIMhUiw2a9oQhpxX
         HkxkANJhY9YNBHrjQ4vuF2Es8w7cNVdOPmSBuQ++k36e8XrzCtwIFpnR1NtCqOVGwsyJ
         A1+73NcjAZY4takEWrlKeNSUJS8XXiVH7z5xSetxOJ1G49NnZqE3fQuX4N1gRe0dc8zH
         9VCyVla8z2jb9AUPmnLFNFqyXQbteTWcy4v5M9uXbtVwmWJpGEeC2aDRyWlYq2NLHeLq
         LH6IIK7Y0jd360L4WN50VDdgCxT3AcABitkOGEqVXY1B9XiCaWMQ+FXwIM35N6yngA17
         snSw==
X-Gm-Message-State: AOJu0YzoiCY6k1hGrvIx4X6KuJuZVhl2h+sOdzv9nd8JApWjd/cWR0yr
	QWEUMRWiWxr85qDgiQ7gM/uzR4F9tHIIRCuwb8QKlasE3Jhzh386Tp0Psl2p2dn1cwEepz6VROF
	ircrkfpDm0onkYzwA7O+kG4Ca3PtbMNzPIgw078jXorZ3TY0Idm0NBCEpjvyTO2FGIgal
X-Gm-Gg: ASbGnct6WTZfZBOrsVQLBmwXgvzfcRnfwIyr99uheuzrxUo2ehsOlmUC/U9SU2+mCG9
	6qH6GUTzPDbrYsCax8SpDNP2gth9lfxV1yGr+WezyF0dgTd5h4FEcZTsyRP40MVwKY9gYFX+YUn
	8vMOeLZQlQjFKZbtAYHc62EcOUIkU/CV/oHO8j/RBw0o1oInvcwBygQ9fq3ltQH8VYOR7nqNI5C
	IEUxCDHcwDZGDHq0mTLRgRareXZXNLdip5SuzqbqsVLx4VLLnR6cNyB94qT75GuqSS7Up4NAXKt
	MCKQzUS1aRVvggzOPkuljUVHPjCf89OwZFU1VMuudB+dlNTR3HZXMADyjHcHzScZ
X-Received: by 2002:a05:6a00:13a0:b0:770:579a:bb84 with SMTP id d2e1a72fcca58-7742dca7eb8mr7517554b3a.5.1757320059722;
        Mon, 08 Sep 2025 01:27:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsPuW308JspzsiBLsT9VDk94w9AdRmHL4vZNlbS733C/aU1uZfvEcmFy4pBw35K0EQ8R8XEw==
X-Received: by 2002:a05:6a00:13a0:b0:770:579a:bb84 with SMTP id d2e1a72fcca58-7742dca7eb8mr7517523b3a.5.1757320059121;
        Mon, 08 Sep 2025 01:27:39 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:27:38 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:56:57 +0530
Subject: [PATCH v2 04/16] drm/msm/a6xx: Fix PDC sleep sequence
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-4-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=4096;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=giC1WMM/22jbsYABWcvDAeFCcEWVS1OnTn0KmBBmmok=;
 b=Tb5Zcomn1I+DstzVX10EQ5FnDJHdOVbMDBWYloXfnfItaUHkTGKpcpE4K3t4PP6tKwRxxju3G
 JYCJ5GOSGTTCayUcml6GNRYQLBeM/t+yZ0BwdS03XPaBqow4gw9U6UI
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX8YHyg7KmF2vy
 7VGV+FBQ/MeGcsThcJIAGBRpo9d+/7Od90d7uqp8WCxSedu/l0dj47JVG0QOxz+IKNqtRpOJ058
 cvyIrZX2H6PLHCYO+0e33pghvm4RYDP+UjXBgjRs+njyrr1OkqyIJd+MMpRl/nz2uAuskSzCVhr
 BHQf+RmpCCCsrwzw6b9Vd/RKD5kxtmOkfy4qt5S6hQM98V+A2dnRTwuHdVnlOlxCgMqybNddaRB
 1wpQr901zqbA946vod7vHZEgPhkRyB2jvt7/MYItNHZWZWB0x90Xg8UpQtrp/eiK726RQieRt2C
 F1BhsqPvbGsN6q4y6udFDJSrmQ1BP94YPsSQuVKZ0AnvrKkpEGJ2JpLsJYFQDCiLysyAuqhp4+E
 x4BQ+izz
X-Proofpoint-ORIG-GUID: DK_cxEkssdYPqj9inlZdozf5FEZmrer4
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68be937d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=R1CZgRJynTePKTnkIkwA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: DK_cxEkssdYPqj9inlZdozf5FEZmrer4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

Since the PDC resides out of the GPU subsystem and cannot be reset in
case it enters bad state, utmost care must be taken to trigger the PDC
wake/sleep routines in the correct order.

The PDC wake sequence can be exercised only after a PDC sleep sequence.
Additionally, GMU firmware should initialize a few registers before the
KMD can trigger a PDC sleep sequence. So PDC sleep can't be done if the
GMU firmware has not initialized. Track these dependencies using a new
status variable and trigger PDC sleep/wake sequences appropriately.

Cc: stable@vger.kernel.org
Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 28 +++++++++++++++++-----------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  6 ++++++
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 06870f6596a7cb045deecaff3c95fba32ee84d52..ba593ccfe3c6a2f3a2ea0db3a1435d0668ed7bf2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -279,6 +279,8 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 	if (ret)
 		DRM_DEV_ERROR(gmu->dev, "GMU firmware initialization timed out\n");
 
+	set_bit(GMU_STATUS_FW_START, &gmu->status);
+
 	return ret;
 }
 
@@ -525,6 +527,9 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
+	if (!test_and_clear_bit(GMU_STATUS_PDC_SLEEP, &gmu->status))
+		return 0;
+
 	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
 
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
@@ -552,6 +557,9 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
+	if (test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
+		return;
+
 	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1);
 
 	ret = gmu_poll_timeout_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0,
@@ -560,6 +568,8 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
 		DRM_DEV_ERROR(gmu->dev, "Unable to power off the GPU RSC\n");
 
 	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 0);
+
+	set_bit(GMU_STATUS_PDC_SLEEP, &gmu->status);
 }
 
 static inline void pdc_write(void __iomem *ptr, u32 offset, u32 value)
@@ -688,8 +698,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	/* ensure no writes happen before the uCode is fully written */
 	wmb();
 
-	a6xx_rpmh_stop(gmu);
-
 err:
 	if (!IS_ERR_OR_NULL(pdcptr))
 		iounmap(pdcptr);
@@ -849,19 +857,15 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	else
 		gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
 
-	if (state == GMU_WARM_BOOT) {
-		ret = a6xx_rpmh_start(gmu);
-		if (ret)
-			return ret;
-	} else {
+	ret = a6xx_rpmh_start(gmu);
+	if (ret)
+		return ret;
+
+	if (state == GMU_COLD_BOOT) {
 		if (WARN(!adreno_gpu->fw[ADRENO_FW_GMU],
 			"GMU firmware is not loaded\n"))
 			return -ENOENT;
 
-		ret = a6xx_rpmh_start(gmu);
-		if (ret)
-			return ret;
-
 		ret = a6xx_gmu_fw_load(gmu);
 		if (ret)
 			return ret;
@@ -1046,6 +1050,8 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 
 	/* Reset GPU core blocks */
 	a6xx_gpu_sw_reset(gpu, true);
+
+	a6xx_rpmh_stop(gmu);
 }
 
 static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index d1ce11131ba6746056b3314dccdc3612cf982306..069a8c9474e8beb4ebe84d1609a8d38b44314125 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -117,6 +117,12 @@ struct a6xx_gmu {
 
 	struct qmp *qmp;
 	struct a6xx_hfi_msg_bw_table *bw_table;
+
+/* To check if we can trigger sleep seq at PDC. Cleared in a6xx_rpmh_stop() */
+#define GMU_STATUS_FW_START	0
+/* To track if PDC sleep seq was done */
+#define GMU_STATUS_PDC_SLEEP	1
+	unsigned long status;
 };
 
 static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)

-- 
2.50.1


