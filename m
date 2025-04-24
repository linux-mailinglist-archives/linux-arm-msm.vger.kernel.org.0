Return-Path: <linux-arm-msm+bounces-55331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB1AA9A840
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64DCF3B4D35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9005E24468D;
	Thu, 24 Apr 2025 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cpRlpmjk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE48C243954
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487083; cv=none; b=tv0krH7BlqtlZ9/rOJQRLlRu8rvQGeIdmgXg3EyytV4f9uwdVmRNwzvskeR/PyUC3a4GPFM/XpYxxhTroeY6zH7vRPHb+PrqijK+WYT6yVNxhouJ+8SfMPWnDwLXT/jF0N9EgGHvST2qXWXEsu4bDf3SmCIgeSjexUTfhEXUUPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487083; c=relaxed/simple;
	bh=RoacreTEMFn9/+AgadLU7Bc5airyr1KCWBHPP03RBuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WgjdjvqFDHFke4LcWYVgjbRNLb86XbOJiTFpUa+TkIgsjZ5aiNTlFRQvErJ623azqZmTrCbG95GMHqX0p9VpJK5pjOI6TAlHumikxAh4AjaYm/JnYySgz/Pu3LuA9p54KK1hQGFSH6gSfltVv17ymJELxMBySIC64EjKshlrqj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cpRlpmjk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F8Do010276
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wrHE1bOaB3NiekNvDO5+9u9GO4wap7dKxyNQIc6R/uI=; b=cpRlpmjkKG9kcZ4c
	iEJUgOR8r5BAuIrtJsnFEW3UIzJ6TOUzEOaurxQNi1bfZfWdHiJijXzRsBHRIgOb
	H4pC6cY6wLF94+9aaPXCJs/lo6SNhw2pbii4hI+Yp98nmrJRTl5BSVekEShmr36w
	M6F13hHd2tqv3eCtewzC4nXrXrNNR07/VnZ+mb6f7oU/zuWPyfgSU7pu0DhF6qS4
	/XXOPVjphl0x29onQUsK7SHSqw15VkIvqsJqDVcLPrSiIpugpt92PFd9nEYUytkT
	sJ4Cy2ypGYz7WQUXWP2F+ZxtRHdAtKW1LCrf/oJ6ynoN6f15aHUasHXcHmzZ/jAj
	CgL7EA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3mytd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c9305d29abso142283485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487075; x=1746091875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrHE1bOaB3NiekNvDO5+9u9GO4wap7dKxyNQIc6R/uI=;
        b=DFUvNeEi9z04m6B4pC5GvhEXE7Ye98plRwCxM50sbMo/0OiMliJG5CKogq/G9Ji25f
         w+3CMbOcKXlNAnxjDc6aizQs74+tFn2+O7QPMmHhZL58RmFYfE2nuNHVt6NkhLvk0+5K
         rrF8dzsfM1Lq9+Hh7j7ZYEFsoWhh1znHLZ14ZsOITeY/5oJGZpWbmvdXhvMCgc8G16Jg
         ThmZAyCUc2WxwRxe4rW6f3aJyNTM1hPgQer0ykMTi8DsR/r1JOMLZ0ETv88TBbGneTaf
         EOtDKdKqLCdyNsJDAdyY86EPzvUMUF0thA9dXTdMgcIkHp5TTyirtLhNhRjTpLBqJhqu
         1F3Q==
X-Gm-Message-State: AOJu0YzgVvAXe3BS+buyfOe+rwT5ugTq4YiU9TvY3mgb+Ut5By4ofMyF
	wcc8PH3y0Vqdkn0x0ggP9ynC9zx3rY0J9vPdXyqzX/R2GkOZiUp2mFvhD/AD4l5HP8AquIomcST
	QSSj1U13qrnCaVZxJUCK5RUhegJ59rOH4/gLuEzI7X5GwQlvp3EdK2bGABQ9qNijk
X-Gm-Gg: ASbGncvFeCg9yKL7SX/Oe+gSg6PF0X61+/I1YkJoeFeU7SjbEs69Js14Ri65rDYRLgj
	6yTELb3cfjraAyNNwZ8ieHqqy3o9mGdk+J7L0dRbFh0yGTgsiA7YOOZdioJvk2QddwVSRrEaspY
	qMxanjruCgujc2F2kOf+/cTRynqtCyevd6eoCD7+upcGtV18hQEkVAyYmn8fAkvmd/O/9yh35qf
	ELubVPvGPrQTvzNlOo9liQjSNndwPsRrATRL6MU+Q2hfYwciXBouUK3tuqGxzIZh6afTEBPPC1F
	KthvhjJymREVQh647PioP4KSR8m0u1QBn9FmnuHSs305R3FurRVlbT1kUlZAi/6JTZNq/LG7/me
	Tl3Z5DD+lQ3oHUDnMjAd5y3HA
X-Received: by 2002:a05:620a:44c8:b0:7c5:4caa:21af with SMTP id af79cd13be357-7c956f88f3cmr289574885a.53.1745487075605;
        Thu, 24 Apr 2025 02:31:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzIFg1zDeiIX8vbuG/puPSsm0w6YxIMJS6CwQB6kTZP4GzarC7rZpOw7DNXg9ofkifNfCrzA==
X-Received: by 2002:a05:620a:44c8:b0:7c5:4caa:21af with SMTP id af79cd13be357-7c956f88f3cmr289570085a.53.1745487075134;
        Thu, 24 Apr 2025 02:31:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:31:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:30 +0300
Subject: [PATCH v3 26/33] drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-26-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3942;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rblN28s9WApGRvSdgwWOoAg2/8R6bFt84IMaWAtpt4E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSv0gl9OlrXtLqzN0AezOXYOY6txxUCsh9LH
 CWulThU4cOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoErwAKCRCLPIo+Aiko
 1TJbCACh7guP2wcixkRto0VBCiA2LpayBzP+xMAujF2Y7DwSW0zKJ5lLv5PbFQLXqVz3P7S4Imq
 Bri1XMVdY3LEImpBDWpojCK+MKl4FLBpEpM/mGKpY1JDLRVnZWJyJczAneAXt5LK8Fd+6X1YVlv
 QIhtbBS5Ggs2/isbefFAj1PU1WljaHs/aXhhUkXpoDPErtb5JNbKMsHvRn8sNrDfYy4MnLO6OBX
 6ydBR0+9/qkV9GFejoxwRUvWQogVKQ9jmKujXxW9PCR+n12XjLf4lbjDd4tN3PKgLWz7wn0wz7a
 3FM0DTLPiHv52kc0XYAk5HzSftk1JUAcvXX6O1UHq+YCRq9F
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: WuOyx-Yqa1M0rqDScxAcx3JniVy7XAox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MiBTYWx0ZWRfXx3bxmM7q84uZ 0gpo2ARrV0tUmIoL3ExYekx3nMfZMnLq9N8pjJJnFaCIto0cgsgcLQ/yA8upkO6ryVzlUwhoBZN TOI2a48oskDsRNrZrJdO4cE8o1XPMp2cOI7kGHvpPpKWzn4EnTKOdhXgO5G66fNyTx+7DYZ+2hp
 1VAOp6gP7drpvwRZ3S5gjzHjHykDeQxWvphk83zhAHpVqLL3O1eu/vpdSz+Ij6DG0NSfPGD8QQz sR/zo4RF3Wy4noZR3RWy1i35fFZYqagkiwO3kRH6YvWFIl+oaqbaeeNRJIPr3PK2o0mwWQ+qQ0W m7vn+uHZf70hYF75HiTHxHWAuG2Y7OcOrqXw96nefjTrXtaaud3w8HNYmh/mOifA+v5DuUyMieI
 OlLtlXg2Um41SluHm+i4UCvVzpTVDVp4Zhjcn1JCY2LtxSzZRDz/7wSF01kLgfSU0p8V5gX7
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a04e4 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=8GrYFQBjgVhM5uvzyoMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WuOyx-Yqa1M0rqDScxAcx3JniVy7XAox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240062

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_SSPP_QOS_8LVL feature bit with the core_major_ver >= 4 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    | 2 ++
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6a96fa529508673493712d7cb72846c29d0f5a07..8496a44e2f04edeec884e1bac029c513022bf79a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -35,12 +35,12 @@
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
 #define VIG_SDM845_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
+	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
 #define VIG_SDM845_MASK_SDMA \
 	(VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
-#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
+#define VIG_QCM2290_MASK (VIG_BASE_MASK)
 
 #define DMA_MSM8953_MASK \
 	(BIT(DPU_SSPP_QOS))
@@ -60,7 +60,7 @@
 	(VIG_SC7280_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define DMA_SDM845_MASK \
-	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
+	(BIT(DPU_SSPP_QOS) | \
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index e0efa65afd0b734234f1080baf2d91e348882dcf..01763e0bf1359527b0c441ca36b27264dad636c0 100644
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


