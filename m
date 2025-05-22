Return-Path: <linux-arm-msm+bounces-59121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 188CAAC149A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D24E67BAEEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE6A299930;
	Thu, 22 May 2025 19:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DyQ52Vz3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F474299A97
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940665; cv=none; b=EkPngClHDD2y2JSXuHBpQJUvi4IuPHMmpI66jrlqo10b/fw3TwKFYLkt5PUFv73qHZszt6sVL7crzJYhfrQRtjpUWjOO5OHdq+Nn6fqPHAeg0QOLteZKkpDCiS6kJUnFFtxX+SHWCu8X4yMvPHRkTieW2b5+yBNu7Ya1GdooZmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940665; c=relaxed/simple;
	bh=Cr7EYJ1w7Ui/eeX7TDCei01GmlH644WBdvwzxUndo5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGjIbcTvDeRr7jejiFjX9zkG13w+LViaBU+tkRKBDPPSJecEyi9n0Hu2hm8QXjCZ3kpEMiko4hBimdD59PBXSTZzN7PRz1BSEQsO57ex06cqOAeA5v9zMOlFBJ2NHOQhhYE307mf4W95Z/AY7D8kftxUsUpDaf48EzQQwHycWnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DyQ52Vz3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MIFBEj001723
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z2mG8cxIS8Q8W9z59itb+4PstMNGCr+eIADuRS6MBbI=; b=DyQ52Vz3op5hpbex
	yy8o0Rm+KSiGSZu3MpG7bgDXpdFmBKlORX6yMnaFtItgAPE3DBKC2dQgEEvjDxhh
	1/ImlMofE6ctESSLgWGgvdN2xHnkX398Danx9LJ6BkwtZb/McM1UdS5+RTcfGDV4
	/gLsHFs7bMP5ZfLuC3Y6M5B5cdNdqT6EUnuVcUOowfzt6nQWxpwYE6LfGGxw8NQy
	kVIr1j4tTC2yO2dRRQD7nX1OZJL0XidXHr6vRFAkyuzbEzfGuHqSrhsx60WPU33W
	QdfRs3bD3mQ4itiU5OA4/x3XxWT9h6UqdgD49df6VupywVFOGBI+xYejImY8zerl
	mM29/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6ybh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5750ca8b2so1214629685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940662; x=1748545462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2mG8cxIS8Q8W9z59itb+4PstMNGCr+eIADuRS6MBbI=;
        b=ty6nj8+zUT6fbI8mHDbpdBAHFGyPDNBCqzapTJDeDsTxpDi0YfTVlW4wqVBHFbLsdV
         CoysCom8apES/5s4qboz4Jkqwi2x/wAdDTFTfR1rzKYXwxRlYIVyNB4JWu88BtxIyfOa
         sbOGoZRhyZqVoOK/9VWwkCb5YDyUDewL7vtEPlcplckkYxm8UTJkM1V8q1kkPMPsFUMy
         M397scEgXWQX5tKrG0wqI0O2cPPCrUROb/vC0tmZJ63m/In7brDaULT5DI+WRsYod2dP
         nDgWvZ0g9gsu0jFTAYpER4ZGtTyWjDKx1Jjd3tIRpPOYtHKhajoUtU8OxksgPaxKSoxR
         7cAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqFHx97hAopzsPu1Cbx5dd8Lj2fHLS8fm416RKqTsKcZFaY5h3acQKtT7hYRpL/zCiye6t4rMmrldjgDV9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywex6prN2J71Bv4LdzIMnrOKGA6LG1ds1eLqbaZd0YVefSbcG/9
	jwFgsgumzEKS7+kYuLM7s3AVyJkKqu81rsBnpO0yrUFl6erqAPkCupKqqqZcmG/Zpaqb9leYih/
	8prxED4K5jkAiEIO43b8A/MxCuTdCLR0e0x1BRpqVihCN0qLjWUODyd/VuKligVIgD5+e
X-Gm-Gg: ASbGncsPgZyPufZ1n0VbVLqP4y1Q6lYc3XMCfF2e4+suQENnpnU6mnfIJJsq0klwbjN
	pCpomOIPDiyo5OFQfefgriHhbWUsn3BeFZNacQFJUM8GWbqfrcE9z0RiFzEjX1APoqTL7LkLjnP
	EAW94eYlPOxKDZxyjoxHe5pJ7o7iUJmmGQ6T4k4MAIevDpKarVCGeXl5wjS3r7g95nPr8nYEKyg
	sF8rzoLNN8567SqhvVFvjW0gW64IsAL1g94N2/o9Az1HMpCLuRMVveV0fv89DGR3hwrtH7ZLbOX
	sdSy/2jL2YmDmvkoc08yINCcWx7ypRr3omsNOGbME9tML73LYJ7nkwS4cDhNdL9x/CgYOHrK2YE
	vDpwEEW+vPBo0ZZbQpNkzpLkA
X-Received: by 2002:a05:620a:31a3:b0:7c5:4001:3e9f with SMTP id af79cd13be357-7cd467334c2mr3649008685a.29.1747940661781;
        Thu, 22 May 2025 12:04:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUtTiP4/ujnM4/f1UIjeVCJ0tIpWKtmtJlDx8u6T2C+sSF4p2i3t8uQNPgbghUmIQrDlFXCQ==
X-Received: by 2002:a05:620a:31a3:b0:7c5:4001:3e9f with SMTP id af79cd13be357-7cd467334c2mr3649004185a.29.1747940661342;
        Thu, 22 May 2025 12:04:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:04:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:35 +0300
Subject: [PATCH v5 16/30] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-16-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4399;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8C+zkxaDTJSXItCIlDecEEvq4hEyx2Q9rh41cf2R1uI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T+6Vo7A/TuAXzcpo59a4AgI6+6FZw9GJd8B
 sf0vWei7P6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/gAKCRCLPIo+Aiko
 1Wp+B/wJg1F2PJfrSjFkAINTs5XuNswb7x7B1Ixmq1lGX092C2NUyO7AxiFXQkS5LtIoLqkdmkr
 ZhgmtyKxFbUnkWKPbJ9cuqztCx/NEciZwbwZmVB7X2XU4LXH8VYW/tcQTXRzifiblEW8oNqL825
 fXwkGLlDKjJ1ztC8SP/Le92yu8rTtYvfG6A1d3bs7r/oj5HeGp0CceRJdVKQ8mdSrV9q7Tf9UwV
 glKUqDKuOqI0Zw++hbZSMXRqB+sDKd/4XwbVOBzxaXD/wV5Md33QxfP010YR3ZI++xgjDyZWEfB
 vTXgDfWaNup9OnVgcOwO/Nvc1Eu6HkOox3gvNvRvxYTyP516
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Gi3SX80cMWG9hRiJisfhfaumZm5ASAIb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfX+15fu25Ct4Kp
 XfvUHgj7bZMl5zyiPpSCeJU0axTimrV0tnLWllAGiQFE6sYljyNXeGJubSohGMglomHct4jY+LC
 8k1rasaTKRZVJM03C9EnLOdNy0dI8XY5a+AC8sT1YpQrRrXzxWKLlDx/NUGA2eq8Wy9SsdUQc9G
 bX9lL6GG0ACaXVD9yWl6L80YcEWejbX/mA/hzwjEoSHVbR8YRkD2ElIGZHQNg/h/vw4vtc+l6jK
 mKS/k5uYa490UXhzm6QM+y7s7JCghV58LdVt97DEKAIL7UZb6xz6PTUzeLcbM5GVHBMlpoZRoJW
 77D2n5Is8im9NOIyy3eqwdkTrX68fsELVq8nLROtZe4AYmZhE04+9xAIXu4TJma0r1poV9m6Smx
 aBEUgbEzhN7g9lvTo+WxlIHUCYd+qMuIMihB5WC/u0V+Mfv3DeRcDhC9udst6lFpu5KpzbZg
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682f7537 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=K8QCOMLVtaD6p7eYglIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Gi3SX80cMWG9hRiJisfhfaumZm5ASAIb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220191

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_PINGPONG_DSC feature bit with the core_major_ver < 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 7 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c         | 2 +-
 4 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 8fe07a5683f734a058e7e7250f0811e3b7b7cf07..0e8e71775f2c1c38af018353c85ffeb6ccddb42f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -181,28 +181,24 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index df1eeb9082f74ab734c235f0cd0baf8c0eda14b5..75b679cd2bd27dd25971489a2d3a6f516b248235 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -95,14 +95,11 @@
 #define MIXER_QCM2290_MASK \
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
-#define PINGPONG_MSM8996_MASK \
-	(BIT(DPU_PINGPONG_DSC))
-
 #define PINGPONG_SDM845_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER))
 
 #define PINGPONG_SM8150_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index bc71ec9a5bc8b6e15d7af13c42ba5d4197729822..ac63f753b43615f7c34d2da51fce919fd77142bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -118,14 +118,12 @@ enum {
  * @DPU_PINGPONG_SPLIT      PP block supports split fifo
  * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
  * @DPU_PINGPONG_DITHER     Dither blocks
- * @DPU_PINGPONG_DSC        PP block supports DSC
  * @DPU_PINGPONG_MAX
  */
 enum {
 	DPU_PINGPONG_SPLIT = 0x1,
 	DPU_PINGPONG_SLAVE,
 	DPU_PINGPONG_DITHER,
-	DPU_PINGPONG_DSC,
 	DPU_PINGPONG_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 36c0ec775b92036eaab26e1fa5331579651ac27c..49e03ecee9e8b567a3f809b977deb83731006ac0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -319,7 +319,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(struct drm_device *dev,
 		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
 	}
 
-	if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
+	if (mdss_rev->core_major_ver < 7) {
 		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
 		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
 		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;

-- 
2.39.5


