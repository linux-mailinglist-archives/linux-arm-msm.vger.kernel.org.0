Return-Path: <linux-arm-msm+bounces-58500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E54ABC3E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 367713A61D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4642882BF;
	Mon, 19 May 2025 16:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHuOlQl5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3284628B4F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670712; cv=none; b=r78nKvHHxQ90a3YMt7DSpyew5JwvF3KYPiwH8oaAsWwkXlyEhhK3xQpob/nFkzjbxOwDc/wK8TP2mptNQ8gPbTFJ8oJnvAgGL2W0pZ+rO+IirSgS24Cx9GwMhy6lkVrmbYf3aX8ovLQFe2M1V3PAn8pPHstAxYGA0ldJjLzzD0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670712; c=relaxed/simple;
	bh=ysUlz+R3/u4F176nINRPnqOZlwtAgN3R6T/Mj3qi5T8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VmSj4wq81DJGlCTqIOPry86M5DV0pe6ypm3i8v7AU8FEuCzu83xKu7592nMZcN3aaAvD8gdPW8VoaDKzcaxzXFMTHXp4ED0SW1mhkTXPA8kYOAjpm5y0nw8pntf4M1I2nB4NcsDq6IdVCw5LhrUHarMCuOO1HZNJWqyBKn3mXhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHuOlQl5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JDwIFb006146
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3pz7HlReriWF25jopz5eMN8UYw3ZSgBqgcWROhc0jZA=; b=nHuOlQl5t8tjFieL
	WIzHxr6i7U0DmfvRn5ASfk93UcPR/OxnjZsazAegjBJjDehnJln42UjDZM2flUUY
	DvTdXJ+X81I3/ikB3jdsxDtugJQhubA2xNFWw3W6EFN4qWiI3qsrmwq+4KzaakU1
	xiDzFjJMBSguE1n3gxG23BRK26GBKfcg8KEzGtkCncaL+YxSA0pXSL3nEkja6dQH
	45ueFl0g23LK8d3uT/cT3/VsZl1jlNbwmencwX2g7/ZgFK0abbaT+BoBGAkV4Zlq
	xWHkSWOoUX4u8MfU1sytyPJp6EFsO0Qd7o4ZfyIDRqxpltXsHA9BtajQm1kR7LTm
	YsJr0A==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkhn0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:08 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4033c872b60so5170499b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670706; x=1748275506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pz7HlReriWF25jopz5eMN8UYw3ZSgBqgcWROhc0jZA=;
        b=WXqPCKcZRil2KnOdKZe15o+2vV51sGn/l45Q0i1NdWM7zArnuz3/rD4NAawtithIen
         R2uelktSi/rtL8BrBxCVcjJMzIdmFZCQf5SDTy2gEPanJnIqbqTeTsht7FAhsh9t+dMt
         Jn2ENdmnfEhjH97xSpVDpwFIyQggk4MlqZhma3uP5CtceRo21uAkZwz9Sy94033yqgx8
         Toz4c0za/pIRp8E7oSZ5bAz70Jp6dMwC34ftXAQAWWIFDVHP6XYKQHzlXsv7/gzsgVm4
         SWLu6OmYX+HFYprH6sGcv7qAqWH46SGsc8jxi9mR14ZYLxIL63/NpaG0MMC8Poa0mKGK
         kZjQ==
X-Gm-Message-State: AOJu0Yxo7w9v0QrobMyWDyfate0aq/iZ0CE5gzEBqMPOkjVKHIiHhDA9
	LXKFdM2kk5N9hk8weZqwBjsy13/onF0Kip8Y+wLYy60MUy8S17CIMAAHebG4oLSJBP1DQSUcWUF
	sjGznVBfBRsZ8wlezc4R+aLZFQBDVFlqitm6AU8FmxEU7EgXTd3zXu5CP5gO9fYjX+EaekLZChC
	35
X-Gm-Gg: ASbGncvgW512ShY8iPgKzpcOinQ55hyiWi+VBuNoeHE6gUJZunCUejpoZwie6JLLTO9
	NxGtdm9XpzwSCAC/euezyLsM3HBqID8tVCVhH4RBWhSBgp27V8sqNRREz5xT++SeMFICKP5vjX/
	QKzLyunWw8MhJccVNN6ft2Z5ivuWzVnLFxFrPagqQ6SLw9KFBal7BroQPFxEJhvoSc+lKxhSbwZ
	chTzXnw2Jx/jm0aPjT0wN1MXMRVWNxBl2x0oTHzVRxAl2PbqW9MvZR/0TOVPrkgh/M9EV6XpoMH
	9E3Sf5oBsFyPxxexHxaG8cfjtAoU1gNKDkHIxx6neuPgPkC3PXTj6MRl1kRmcQJTGq0GKreVRNz
	N67yfbal75CQoSOzNlY0rqyLF
X-Received: by 2002:a05:6808:640e:b0:404:e317:7694 with SMTP id 5614622812f47-404e31777f0mr7240159b6e.15.1747670705711;
        Mon, 19 May 2025 09:05:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlxD63pQ7cn7HczkmKw8RS7Tg3zS6lHXCeIYsnXgHH//BdE2PFXNPBEz/4NWLHpZVJx8nIsA==
X-Received: by 2002:a05:6808:640e:b0:404:e317:7694 with SMTP id 5614622812f47-404e31777f0mr7240110b6e.15.1747670705263;
        Mon, 19 May 2025 09:05:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:05:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:25 +0300
Subject: [PATCH v4 23/30] drm/msm/dpu: get rid of DPU_DSC_HW_REV_1_2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-23-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14150;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Syvj40vEuJlSxTVe6WKq8cUSBMNDsZlz0IOPCiPVsMY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z9x2VDMlwPm920HCcbod65AFDIZCTTAJ4R8
 8UAWAnVdQGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfQAKCRCLPIo+Aiko
 1Q/QB/wLXNssxFXWoXF2tER+bQ/N+DK6LK3O4ZKXla8TFU2b67Ucvhph/TmNaiwP1RU/rIjH7gT
 h7L1pvDX8Cy8qnVNExAnHsFuabclsg9p0oZs257SmSSiiN9VObT9qtU7gOdud93qpGWE8Ii0ENM
 nmWqVj9z+fKFtgWBuMTijF+56OfwZgprf20aCDnWCkzd5cceuHgPo9cILCtd7HfVDc5c2qJ5YYh
 MXNyNHSFwAMFr+p5CRKUufbJlqZj2h0WzLzpIIoStwPDGLhjnDKcbfSXf6k31jEZqFcCKqnl9Du
 Jkg61JPhtHnOHxl0qX9EG746PuqYlQWgz87f1Jzj2Nahmw22
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: tEuHM88SKdLuJ-S6XJf2s5hthlLzIOG7
X-Proofpoint-ORIG-GUID: tEuHM88SKdLuJ-S6XJf2s5hthlLzIOG7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX2laR+4t/TKSI
 HgTq3G/ojOv/xVkoVY/aBR3wpTMNjmgu5NPX9oRFtxGpqqnx2nPfnUrNYGkUnZTsnEbQu+pdsqu
 ustF8UxgdgR9bvoRMhj9K+Hnw5z9F7avj5aJdF/475nBw6Z+s9V7HKgTZqCsiBR5c6gDb5WOntF
 RiyVbeASER3j9Yp/hnr1p+KvaOxUP+HJ3xbpXJyFZPEEIbC1VgmAq1NhnDiYLUmtQPYOJM9EE2B
 OZl+esA3b2O85IMaIFNB/TcfzAbJPnAW3T+86C5/iDNTELOQV243rqTXCHtzm0sVrqStjxgnKh0
 KZlqd7WrUPUIBAaj5fnH4o8ckqEwj7FcbO1/2OLrotYC+uYimE/KiJvcng4bQjpUx6M5gEZ+jS/
 qHKl10IxQhB+FptIz/QzFbd+JBHvsMlpT5ZPk1y45U7ix1VKDjiRkQVXSR9CEcj3WrAp+eqt
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682b56b4 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=NuLJBD-5AyVUfQYi_k8A:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_DSC_HW_REV_1_2 feature bit with the core_major_ver >= 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 10 ++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                   |  2 +-
 12 files changed, 21 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 9a8f6043370997cb12414c4132eb68cc73f7030a..013314b2e716a6d939393b77b0edc87170dba27b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -286,32 +286,30 @@ static const struct dpu_dsc_cfg sm8650_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x6,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x6,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x6,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x6,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
 		.base = 0x82000, .len = 0x6,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_2_1", .id = DSC_5,
 		.base = 0x82000, .len = 0x6,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index e81a2a02e0a6379382058fd89500cf2064a2193f..b4d41e2644349bdbdbdacbe1e9b3748f90df4f3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -263,22 +263,20 @@ static const struct dpu_dsc_cfg sm8350_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index b0e94ccf7f83e9c3c41f1df363cb6a8c24f1503d..5d88f0261d8320a78f8d64c9bb68b938f83160a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -150,7 +150,7 @@ static const struct dpu_dsc_cfg sc7280_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 2cf30234e45da8a7776d61c49c26abd75d070941..303d33dc7783ac91a496fa0a19860564ad0b6d5d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -262,32 +262,28 @@ static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
 		.base = 0x82000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_2_1", .id = DSC_5,
 		.base = 0x82000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index dcef56683224b5715c2608b5472d2d5a0da62010..3c0728a4b37ea6af25ab64315cfe63ba6f8d2774 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -276,22 +276,20 @@ static const struct dpu_dsc_cfg sm8450_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 5f5987d5fc602df29c5eb289823de5dd359df014..b8a1646395916fde04b9750cf548edca5729d9c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -275,32 +275,28 @@ static const struct dpu_dsc_cfg sa8775p_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
 		.base = 0x82000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_2_1", .id = DSC_5,
 		.base = 0x82000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 6f310216fbccb985308f617db20c1878e622340a..ef22a9adf43ddc9d15be5f1359ea5f6690e9f27c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -272,22 +272,20 @@ static const struct dpu_dsc_cfg sm8550_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index ba8a2c5dc5e2b3474b295c86afbbbe8f8d416ccd..2e7d4403835353927bc85a5acd3e6c5967cac455 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -272,22 +272,20 @@ static const struct dpu_dsc_cfg sar2130p_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 77986a7bd62c1b6323482426e596e5974ba40865..ac95d46b3ecf2d95ec0d516a79567fe9c204b5f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -272,22 +272,20 @@ static const struct dpu_dsc_cfg x1e80100_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index cc17b20a7d4c15b0cd9c5dc8b9a4b78d4cb78315..01430ff90ab0988bdaa91b85458dd649aab543b3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -176,13 +176,11 @@ enum {
  * DSC sub-blocks/features
  * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
  *                            the pixel output from this DSC.
- * @DPU_DSC_HW_REV_1_2        DSC block supports DSC 1.1 and 1.2
  * @DPU_DSC_NATIVE_42x_EN     Supports NATIVE_422_EN and NATIVE_420_EN encoding
  * @DPU_DSC_MAX
  */
 enum {
 	DPU_DSC_OUTPUT_CTRL = 0x1,
-	DPU_DSC_HW_REV_1_2,
 	DPU_DSC_NATIVE_42x_EN,
 	DPU_DSC_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 80ffd46cbfe69fc90afcdc1a144fc5de7bb6af42..d478a7bce7568ab000d73467bcad91e29f049abc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1043,7 +1043,7 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len, base,
 					    "%s", cat->dsc[i].name);
 
-		if (cat->dsc[i].features & BIT(DPU_DSC_HW_REV_1_2)) {
+		if (cat->mdss_ver->core_major_ver >= 7) {
 			struct dpu_dsc_blk enc = cat->dsc[i].sblk->enc;
 			struct dpu_dsc_blk ctl = cat->dsc[i].sblk->ctl;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 7bcb1e057b143a5512aafbd640199c8f3b436527..c2a659512cb747e1dd5ed9e28534286ff8d67f4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -168,7 +168,7 @@ int dpu_rm_init(struct drm_device *dev,
 		struct dpu_hw_dsc *hw;
 		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
 
-		if (test_bit(DPU_DSC_HW_REV_1_2, &dsc->features))
+		if (cat->mdss_ver->core_major_ver >= 7)
 			hw = dpu_hw_dsc_init_1_2(dev, dsc, mmio);
 		else
 			hw = dpu_hw_dsc_init(dev, dsc, mmio);

-- 
2.39.5


