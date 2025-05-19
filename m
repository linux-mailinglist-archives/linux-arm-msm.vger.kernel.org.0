Return-Path: <linux-arm-msm+bounces-58503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82604ABC3EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 115223A35D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D27628B7F0;
	Mon, 19 May 2025 16:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ht3E7QG/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2C628B519
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670718; cv=none; b=CRTCADcS7BCHVdgv+WG+a1RhCirHeTKMgpEDHiXKw8SRxr5pZwXhCKSffO2JYbMEW0TlxbBmWM6v8wdUVEnCS59tcGVaMGxo1u1YdGror02kjtlTbO/JxsekPEzTuF3zcb/ESr7OB8OhAqksbgvY9sZwj3Ps3nh10xa/KpcFw8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670718; c=relaxed/simple;
	bh=0jeV0cB1ciNiHJqLAxEmWL4T47S6GJvwMbYLSQ52Txg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u/iaXRbE7Ht4XCAfZg0Yz69A3S9SPdaJ+HBJp+mjWWv48eqgH6xc+SXJQy6bzLrkSfTEWJ+77LjaQabYlAkL/7/EzEZXhvQ8TwyMtSRejOJJIBxRzyKQ/sjsdXrZRyV1Dr1gA+xj0zn6RKB35iQCTmwTjxYIYNg1vCIZFIwSLfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ht3E7QG/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J90bkD004518
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2neXdOhnJTjuU17ok+uwBfbRcitQtwF8akxouMK3jPU=; b=Ht3E7QG/4eKq+y9j
	Af5/ivP8j1nUOnjR+B86fPt3/0FmPnY8NpAQhH8QrdXo/M8ReOhDwEeAVDZq55SS
	zGw8wMJV8KSY8xe4S35vkeyzNAPnPmLrKUnTe8sPXVIH7g065Ucc94wDTp81RSEj
	69bUkUQNYuC7KrDKPsFhLMqC6VLUHY5c7ThnbLkyDrnbXb0jh3s7s0SwaVbkAceJ
	Aw7jINweLkhNwLum4bCa2ZtOLOeYkj6L2j4cxxSMkeIIl18ZwRbicZ6MHxHh1R6M
	0x09L6xU4AjP1JYekEMFy9QuIsVodHmtM1RYqYhSVoDYMoT/vAbSQW5wAmZj1Qb9
	L8sLjQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyn18a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:15 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3f7ade514c8so1849594b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670714; x=1748275514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2neXdOhnJTjuU17ok+uwBfbRcitQtwF8akxouMK3jPU=;
        b=NOt7bFASCK3B0r+1mzPibM99qx3I0KDdEFC4Ew7SU1S9XTaJh9I4o43Fzx0ZBJ9Fe2
         ivK3QZ7SA9TPMmwX7fEj1HplJaUGfsyQGcVSYHqR8W2/tvshGELISILAF9G+Y/OvrCBk
         Kooxrrr2sUBa2QlAmOkvZBNfJYeWDv9RyWYN4CO9woJ8sWj3O8RNuYaUxzFfwQW5P/R9
         APAw2N3JYlTnwo/5lgm98CRMIGgRIKgmeL9tswVo4iU7qB8dPjkI66GlH4DH/4kLBMIG
         PCLm7VOwEBIZ+HzpYl3Oo7ciT3SIJhjaEsgpnQALgQc3oSoBhCtCaqhlbWzMERmbhhJF
         B3mA==
X-Gm-Message-State: AOJu0Yz5qTrwBOTC6A6ZgLCp4KGnQoUIjg0k0vKbned+FaLrJWyD/I7g
	l4QL1qfGvc+LDdKVQ61nevcMo3FR30SYPsuSkHrcey+zowRgWv+CTk850dKpgCJp2eaj/A1oVsY
	4SOXGKd2l5bSv1B+Px8svJRPvasB1udt32ZTy0LihKH5COaOOUb50FE7ex6otuj/guz22
X-Gm-Gg: ASbGnctj6YlxT0DAwgmUWorBx5NhFt1VgJzeyMyJr9vLnic5+Rjexf4KtmWT5eDFSNR
	nzmHSKp8/3KwqjhyeUgEHoDbzsBtUBPf1nOybluH5F8t0djtM1JBJRz6YQnd0X7VFcPwTQDGt4A
	8QmfjFlVP2I15QYX2YoOeY7ZWwBs5prLnB1/TZtUexh4lZhaEjibUS5myDRg41jW6dZNi8ZRasj
	Uzx0EIgiOs+DHO6JUdPMFOdFbsO6FTECMfBlRnpYDzQ2et/5LlabZccBVAO3R7tqaBRe2aqwh87
	H4AkEJBI/aX1Hk6xBemAc+2TdHwjgHLHpeqM7gD2mF2EutAjMcBnv14hD64aoCFMaJ6s5hTTBHU
	KfDf6x8izkJdjdf7qy8IX3V8s
X-Received: by 2002:a05:6808:3a0f:b0:402:b0f:4ccc with SMTP id 5614622812f47-404da767684mr6654807b6e.16.1747670714425;
        Mon, 19 May 2025 09:05:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUbV3ew6oubfUnWxt1aUvELzaHK0OJtSZQcmN+b2tu6H7JVXztI0DPcE351TF1eCUf+mbv1A==
X-Received: by 2002:a05:6808:3a0f:b0:402:b0f:4ccc with SMTP id 5614622812f47-404da767684mr6654761b6e.16.1747670713990;
        Mon, 19 May 2025 09:05:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:05:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:28 +0300
Subject: [PATCH v4 26/30] drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-26-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4035;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=L7mJTI5rsgbVWMUZu2GxZgWbaMQSjJd7VgKp6IzcT1Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z9Th6fbTLW609TJZpxgvCPsfDseBOvrb6DS
 VP0FRT1Xo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfQAKCRCLPIo+Aiko
 1du7B/0ecWkTu3CSsdMWL26axm8CMUPNeM/eFtG0F7Dvu4Uri3nA7ZdQwSAhw+p8ECqDwz+v/dn
 iPd00IBfeLw/0WKbjPhgkCFIpj0wECf0+o8IbrHck9PTgrmiJ4uMnvCoP5ttZpk/y+Q0R3XD6ij
 r7VB2orTwhcWzP50dKSizx3Qi+U16WB4izsrCnvWO2Q2QWtf4bHX0ja6180jtrKfV4PIczMVkAI
 catNlf2O01tr9eGP3348o6ICm93XFKbYI/CeerjKPNNUQfM4oFajbBfRNa60kVkcnlbR2PraulS
 oxloSi9sqg96NEuv9AgUuedAk9CGDlWn+ZaiQgyT/jS3HUAh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: jRI9kXagK3v4-JypUTHzdaOXeBUkE9Pj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX6j01wMZXHsMw
 XQof3dvm1eCF3rqroS869R3xAwB6Q1PUxqDQEARKpkLF5KJVinCqVSp08CLMWTF3gIApu3XwfU+
 N8GJvmvbOtnVuPPPpjsM0THBlnL9Ed8TlUfKmaKsBN15t0ATJPmqnfIKd06pm8C51mEG/pAOM2V
 UHHcG5J/PzTNlA/1QuMmpWwySeWvEanihU1KDVSUemRVZrrPRyxEPMRLOZ5PP3i4qzOpiW9JVKf
 3WE8rtK1BARbmFCAmFC16gaDtR7sYe7HB/yrYIq6A5n7rsDe5O1KtSoEcH0vZZH12spdJR2uDlr
 KPWwGjXoi/gLhlFqPpaBH33cM//ImVuvZn0Bda6BTieELyQtEB8eoi2qJ+B8uX1WpMzOQEJ2Pjf
 GB/RNVVoDDkIeM4uKmqSL0/dh3G9a+nXIynHCVSXdsflXkmUZvk18RQUvDwiOJ8HmQm+gs3J
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682b56bb cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8GrYFQBjgVhM5uvzyoMA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jRI9kXagK3v4-JypUTHzdaOXeBUkE9Pj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_SSPP_QOS_8LVL feature bit with the core_major_ver >= 4 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    | 2 ++
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6d7be74bafe326a1998a69ed9b3495c5acf6350f..a276a1beaf95d183f6119452e5516fa8ee60cef6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -35,12 +35,12 @@
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
 #define VIG_SDM845_MASK_NO_SDMA \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
+	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
 #define VIG_SDM845_MASK_SDMA \
 	(VIG_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_SMART_DMA_V2))
 
-#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
+#define VIG_QCM2290_MASK (VIG_BASE_MASK)
 
 #define DMA_MSM8953_MASK \
 	(BIT(DPU_SSPP_QOS))
@@ -60,7 +60,7 @@
 	(VIG_SC7280_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define DMA_SDM845_MASK_NO_SDMA \
-	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
+	(BIT(DPU_SSPP_QOS) | \
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 8c394e7d6496ca2d120c81c7776b4b979368be23..c582ef1ffe022f2e92b1b80cbab97ff41a2acfe9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -50,7 +50,6 @@ enum {
  * @DPU_SSPP_CSC_10BIT,      Support of 10-bit Color space conversion
  * @DPU_SSPP_CURSOR,         SSPP can be used as a cursor layer
  * @DPU_SSPP_QOS,            SSPP support QoS control, danger/safe/creq
- * @DPU_SSPP_QOS_8LVL,       SSPP support 8-level QoS control
  * @DPU_SSPP_EXCL_RECT,      SSPP supports exclusion rect
  * @DPU_SSPP_SMART_DMA_V1,   SmartDMA 1.0 support
  * @DPU_SSPP_SMART_DMA_V2,   SmartDMA 2.0 support
@@ -68,7 +67,6 @@ enum {
 	DPU_SSPP_CSC_10BIT,
 	DPU_SSPP_CURSOR,
 	DPU_SSPP_QOS,
-	DPU_SSPP_QOS_8LVL,
 	DPU_SSPP_EXCL_RECT,
 	DPU_SSPP_SMART_DMA_V1,
 	DPU_SSPP_SMART_DMA_V2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 32c7c80845533d720683dbcde3978d98f4972cce..7dfd0e0a779535e1f6b003f48188bc90d29d6853 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -543,7 +543,7 @@ static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
 		return;
 
 	_dpu_hw_setup_qos_lut(&ctx->hw, SSPP_DANGER_LUT,
-			      test_bit(DPU_SSPP_QOS_8LVL, &ctx->cap->features),
+			      ctx->mdss_ver->core_major_ver >= 4,
 			      cfg);
 }
 
@@ -703,6 +703,9 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
 	hw_pipe->ubwc = mdss_data;
 	hw_pipe->idx = cfg->id;
 	hw_pipe->cap = cfg;
+
+	hw_pipe->mdss_ver = mdss_rev;
+
 	_setup_layer_ops(hw_pipe, hw_pipe->cap->features, mdss_rev);
 
 	return hw_pipe;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 56a0edf2a57c6dcef7cddf4a1bcd6f6df5ad60f6..ed90e78d178a497ae7e2dc12b09a37c8a3f79621 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -314,6 +314,8 @@ struct dpu_hw_sspp {
 	enum dpu_sspp idx;
 	const struct dpu_sspp_cfg *cap;
 
+	const struct dpu_mdss_version *mdss_ver;
+
 	/* Ops */
 	struct dpu_hw_sspp_ops ops;
 };

-- 
2.39.5


