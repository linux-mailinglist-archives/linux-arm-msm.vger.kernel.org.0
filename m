Return-Path: <linux-arm-msm+bounces-55217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EAFA99A77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CA7617F117
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320D529290B;
	Wed, 23 Apr 2025 21:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VNN3qlDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AC82BCF69
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442681; cv=none; b=UNy2LgUi7JD84bEwoxFadHpwkwj6FhwD0S/J7r8juc5Zhr/g8wiNucIOvq/GyGqFF8l0lBEgwDV1ofwhLy33GfwZjsp1zvEXyD9xsTmF5p0O/Y+N35HBnjgBQlq9jzz98Aqqs4w+NUPEApxfyZiMNi9hxikIj7SsD/71rIoZXHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442681; c=relaxed/simple;
	bh=xLwD6ahBSf7CX3t/Ry4PTqmWVEeZyZtvQlbXqUPOXWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t8aYjIig01kDA1xM8hblc00HG7B15zW3bSk5bWRkHsviLvdMa7rJIQ8Q1BKFMaXELvm3GmKx4ENOQkmOPfumrg2hs7lw0l2rldCfrBGU5KP4mpoBYVf5eURo3qNMNclO+tRdBngn1mad+7Iy7f3Xk9guS2Y08XMqm/4VvJmBy0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VNN3qlDZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NL2PXB003039
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kiHJvO5PXdvNNQC6G1dktKgbK2lR+jl2GM509tdluVM=; b=VNN3qlDZRKySnud4
	JNTwg2E2Z8e99Ta23Te1fhx5Z1oj2ZXMnZZxPCWH3a8nQduqhroA5hVddNb6X4Hx
	x7wBpLEKFOx3tQRXtZAHRUi+Kf3BUXbVX0SoLD7UMH5LSwQD0kN3SzgFEUrSH4aj
	RWda8geP5j+yP0qEu/X7h11YyD/sJtqYCuW6jSk3jyB7KAgCxxBJpOPWXX7lz7ow
	3R81Nu6Y3c5y2W6TLNKW0vY78ZvQHPtLrNff05SnqIDuIXzU8YjbxfsJbY8VilKR
	Gou0e6NtjWvlbm4SSRj53VNk9xyfM7J7XxeEY+Wp3fU2NZievOoyqX6sRuiuhSQ4
	wffCIg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy3dkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c793d573b2so52963785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442677; x=1746047477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kiHJvO5PXdvNNQC6G1dktKgbK2lR+jl2GM509tdluVM=;
        b=QJTQ56l89fRroUvBLo+lFmixSGp2xGe4Hu54s3Rt8NUu/+pDETIu2o5x31rWFx/c0r
         mi/JRffh+VZpMuqqUILnOpmpxlBpRM1M+q7S1v42748LxXFIAOgdEVxiyTESlh5MjkrI
         Rqlz+vpo/CzHQSPtOrIKacC3QUcJ/7YKqASQP04rAVdW9ArCWL5gD6poHlRlRIMW+V19
         LD6C2n8rIdDxWXg+jJuuaAhszIu+LzdG7LKdBcC3rgFTqG9AU0N8IecNcBZASBU9e+Mq
         PfeM0brGXGFjc72uuDYd9tIbJcbzFpSc0yA5/nuk9yRSg/W8fCe2EQ3mZlogHwmoTs9g
         jexQ==
X-Gm-Message-State: AOJu0YykVCSCsYNIfpWGmcNnLt9s4Rk2JsGuKIqojkDsU7yaXcAapDn7
	un2XNHclHc4VJtKepVnATnodeV02rIevH3puXVEgmMBl7fnWR9siQygPXJRsIsSzzLR5vky6rBv
	FcIJlGVQ3C7TKWImE44SxdLdjRs8Y324MMEX3guGOTqQGKQB/go5nJAdS9bnPGwyG
X-Gm-Gg: ASbGncs6KEhsrl8r+QdeG4REGg/0TqfkWEEIcEZlq8p5cpxAp9Oy6TNJFy7fPkxA5eU
	LOQXuTftYtUywa59TYkdLiYXRd4vOEDOp/FZhFHw0HyLaK/dFODC8eRzFZso/1qhUaX0Ap4J1t5
	+GGINrRBYyTEjI8RL4VMNO8806et0BWLE9u9c8v6xpQr8XDPIK1511kgolFjELaPzPY3jpixN4I
	hMRjuIJrDjhPlNpgiOYqe7EqhKpos2fupkHkTR4waeYIXg3q5+JPDG1whGIxUQpMlblhAjbSw3H
	4wW9/AJb3231KY9gpcmY2sqVshZYZUd8Ka0+gn9C9rLC/pqg9Y+JEYZMEcDZR7t1GRVnWmOiWO6
	RA+GYQL4NpokuMSAJK0h0/g2g
X-Received: by 2002:a05:620a:2901:b0:7c7:a5cd:5bd3 with SMTP id af79cd13be357-7c956ef6056mr55975885a.28.1745442677511;
        Wed, 23 Apr 2025 14:11:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHafujm7ZGc7mFtDE481JiApU03Lg9Q7a0SG0LwI1gjwYjkxVd+G64nDXmJ34hzTYhigIWplQ==
X-Received: by 2002:a05:620a:2901:b0:7c7:a5cd:5bd3 with SMTP id af79cd13be357-7c956ef6056mr55969985a.28.1745442677002;
        Wed, 23 Apr 2025 14:11:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:11:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:22 +0300
Subject: [PATCH v2 26/33] drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-26-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3942;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rblN28s9WApGRvSdgwWOoAg2/8R6bFt84IMaWAtpt4E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcuUjI7V0IWayB8TboT+S2ewNpAnG8U+DaH6
 SlYk1VkvvSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLgAKCRCLPIo+Aiko
 1QEiCACH93x5c+9Pb2IU8/6bNEGRgFN8NuCgw25W+Me2E8BTKLsN3ftupC2swrORTRpZEH22U7p
 l756JJp0YM9YYTzqjXr8KH+/Ibaw4lQgBxUEEI3r99EX1Vm8kTOMSrsEe6ltNOioW1CnrmZNaLG
 TLLCLgbTmPPavLRqKtvRW+s0E6/gc9/LLY3HhY3ESjXpSnZujwEvLNKV9kL2WtO2SYNqmJx8WYi
 ZaRqgXTlcP6V2V4F/OdoY0fdg4MKTOuZYgQA9DxsJ+fDQmOP3Mxw+TAIbN1V8ZvgMWNMwRCBZBg
 ZavNZ8eGzm9lRcjBbdG8w7va1xzlVwKXI9dyESrI5se5kE5z
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX6/UlpVTUPOni slKeoWcqES5Src5DNiSP8eGuPLBDpBJdqRWab4sUNu6y6MQc9lXFPsL+nSP5IUI49KLomsLrSw9 gxyMHurXeKHAx3nC1BMHeQ0B+jqIjYteRRKk2vBBpA+iv6w41940/eWg8A1g/TTqWZVm02B/+Xs
 VPGzQFgmaVSTiB/cdL3wSEcCdpQ6jxbSaXKeeiAC+5OQhoa9l0abpJpFcSM06rX7Sat5StYx1aN EmxNGrL7kllm1vD1LHmOI+oeuAzMV5s+/48tX3ZH1FFa9DPAQ+HIabpTdsY/2Cnx921QRcjMB6t fWLwyN9GRwtgM/l9aQw4NgHi9Pyvl+H/sSInqJxv+p/lBbZkfkDbj5g/Ef0e4d3nxVd1MnYiGVy
 uArqdsZgwhDVLBe4KQFSqgaeN4UoW9uITVDUQZV0GSvfeyjMQWRThNWy9FU+CSm1Z0zmaLjY
X-Proofpoint-GUID: xt5z7KMJY7j5hCcrjVGsRTG-5Mbo0lZD
X-Proofpoint-ORIG-GUID: xt5z7KMJY7j5hCcrjVGsRTG-5Mbo0lZD
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=68095776 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=8GrYFQBjgVhM5uvzyoMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

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


