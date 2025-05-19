Return-Path: <linux-arm-msm+bounces-58501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7ABABC3F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C28EC7AA96F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE50C28B7C7;
	Mon, 19 May 2025 16:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AX5e04hD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB6528B4F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670714; cv=none; b=oo/JaY3I4X9xRcm1aGDXXNf5uaSq2ztJHPX28dsStV+AjeJkPAYsnE9aJZ2oBsbZRApyXricNPRY39h9w+EsiW5WV356Ksn1pvjdeLPzmO+Fnop4jLnI+XMxCy1DhDdWPDF2JNvvCLRL7Tstjd5kerDBqNHPHBRvisKzepWa+3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670714; c=relaxed/simple;
	bh=+8iM5RoRdDrdfb4vYM2vQg+K1HaSu9+YdxZr2klCEKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVJAwGIewf/YrmtcUdvFa0I23UjsxgWbPEY2/ePTelUPr2P/fL6kxurXhiLCIQ7xtuakVSCsRQ5wRgP1zvJKhbeCgQvh2iTmzVEUHzQsiO2NGfaU8YirfW/ipF6Ak6KbvC/lJN/pe5KUqi+HCxVEsLlgGTXmDnocDmOCZWNnqSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AX5e04hD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9DCAQ025567
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uOxgkiB0mTNl61F0HDHh6KUW8/O6/rYpHORLV22YI+8=; b=AX5e04hD2x+AkY2G
	rpFMaqa5edaARzSCM3tBaDuJMEBU6/D3t+4r+RtjDC6XRw+Iemm08ewoaV2sRHaF
	EqbR0FYWFs6EMiLEc52wYFZEqb5mdX/GnkLChmaxjGcZeGpdFTahrfWFM0s9nNP3
	GI0RxFQ4xy6AH7gzIhAKFLt50r6UHrDlm3E5S+IqiasSB/Epelj3E1uXSrYRtczK
	bdEuZuk3AXwYTizGTEmc2Ttw7RJ+80OAWKgZedvHuLklbpQtLoNLM5oyrW3kirQS
	jD4mtFVcGJRwHJe7W+qWI8Jo3uocPaAOCnhvVPCTLfc2aPazD7GDkD50ey9J6gNQ
	mX6TBA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7cvwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:11 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3f9cbcfbb7aso5279181b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670711; x=1748275511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOxgkiB0mTNl61F0HDHh6KUW8/O6/rYpHORLV22YI+8=;
        b=mejZFo+sW/FBLKA7TrMmoRUXv3nLwhAFIyLkXFMlVwmqiX2YSDQJ7akzl0dtfNVS+q
         +DiZBCVZpRE9k7grkwpCA36CLvUI/Uz3C4w263T4dcJxZHgJ6xpPmBgb7GRx6dyc5f2b
         kULXk3AvT6a3MaItFyRob8F+6JAdRfYI/z5iyEM+8ZZgxG2BwKzVzsje+C5havHkmYJf
         9BMRq74dtCfRWvsyD+F37Q6y2APWdynwykUl0EiV5zi0T7kDuJ6SZkUYeMfW6B71k2YJ
         c4XKP4YCAatsh3gcxWPpX7ZlOY4T1C6y3WYD2pJ7vnekzYsQ3jaKjdliO+LuhyKz4VBS
         pvUg==
X-Gm-Message-State: AOJu0YwxSvWz3wziap1DoQXVyf1RFey79K+FC29cJwAkC/lldXF9PzoH
	7NzNGR1C1qcPJPEOSCFneJczSb0JNzLV4QSlcVUQuW3FI4HCPnd7qUlT7Xm9rZysoo+fLFpn9LZ
	QacgYcMP5Eppww5xVU4eOgwcxxMQ5Cfp1yTusopJGtjEekRHeveo/XGVNldFE1+mtfj43
X-Gm-Gg: ASbGncuet87NouP31ULdgNzbdvLEGZwdAzmrLj4hZEHW1z8D0SRmx4SsxAhmLQZz19d
	JoM8kKKw2ZkDBF5OCVFA8g5pEyPn6SbOhBMI6L0BrS0SGs8XMlWEFaBTueeYY4NcDxJSEkq2bSZ
	9JUPdfkW6dJ5BoUDbCTm/Ug9mbJoxq04woaLnjvG5P9MgwW41HY/S3bXb6G7kWbEDeTlfSmFQsV
	IpK154BRebdFZNmsLaKhYGJA41aP8laO6kHd6NAiKxZR0uBrh/DsIiFYRC5s2Du5zIRqSGBM/QO
	DtCQ6p2IyH2n3/riAyg+QPH7UgVL3mKn5J5faDafUeyrunny5EMwb5MEpulwv1HsR80fBbIfotl
	oz52DzUgIbg5EQFiJGb4C9szq
X-Received: by 2002:a05:6808:1250:b0:3f6:a851:fe56 with SMTP id 5614622812f47-404cd7430b3mr7429375b6e.12.1747670710449;
        Mon, 19 May 2025 09:05:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNNAdWljPmoXA+vmz1zu3H5qDTiJdykIj41bLw/Vsp5s5fa6WWdvtunpGUT+2A47vfzTKJ2Q==
X-Received: by 2002:a05:6808:1250:b0:3f6:a851:fe56 with SMTP id 5614622812f47-404cd7430b3mr7429292b6e.12.1747670709145;
        Mon, 19 May 2025 09:05:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:05:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:26 +0300
Subject: [PATCH v4 24/30] drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-24-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9006;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IW4d4xBKTgHyNVii0QUGpaeTXsIQim6e/aNBlVdX5gA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z9pdyh7FLdsFH4gMuj7uy4N88VsmsoCxYC2
 SZpwA4/8ZqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfQAKCRCLPIo+Aiko
 1RBKB/944p5xRYZlhXU+OIqgwJKrO2ner/qjoHkT0qpR77B3YzfIg7Ptbr0pL/Y4VOWBIa+KCal
 J2tMaWJpvNkkxaadvcmIP+bMg267D7HNpTlM+B68GjJJfgzVpl55FvL5o3F6GnLy9QFaUfc4+EK
 XOkI/TNl/9neZR/UmPMR0ppujGltfLG4gbrfZy9aCwxC6rRd893Q1QM8ayvWuafGpihqXy631zz
 JqZ94oWmwHBolxkl8oGgTMBSeU8I7DhmBDqvDkggK3z8TSYqRSUM2MbGYvXbF8s6bvOdZVwk/ri
 dhdL3LoDML6PKszkUOpwft4ikQLqL4/xsRoxJ6hO6qSAe6MS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682b56b7 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Vb8ASh8KX3Dd0k_o0G4A:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6sRJwFmPE1ReBIpGlu1dKSHgj7OOcOcP
X-Proofpoint-GUID: 6sRJwFmPE1ReBIpGlu1dKSHgj7OOcOcP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX5IsmK6WWtfEi
 Rz80/2cI2lIj23jlzK+ZuafnfwZ+AKIqmSaBIMmZptGcgRZ3Nxypmmu6xhD1OpCePDbLHJyIslw
 EirK/uedeuArTl9iYxfGd0Wd2M3eEbBP42VZ/lIIM1/mTvMVRhsZMWuj1bXZ8f/ThQL0DEK0cAL
 gzfvQrlpZMsnysPruoc6PF+APMI0u88CQhRGuA9P2HNpCvbj8Vskp8IKBWiIx8BGC7fXWTQsVPQ
 sTujajGrGkxe4Ta0ipWGjQ+LTYfoZhsjWutQ6LB1h+q8XtDKMSVUpFhv+KJRMJnL67hLCIhv1h6
 nJrRn3eMZ3MPIYFWpQ+wt5gG+AwFEXA6r1UD2RtiJckqqGVjyqhWrMjcz7+DrzM0wKCBnAlTXa1
 33veXoPvg+0kkTrWki+9eNaUO7jCFPW3o7R02Wqwq9BlHTRH2zNSI2ykxJ6n4qJy234ua2z2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_DSC_OUTPUT_CTRL feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 5 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c              | 6 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h              | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                  | 2 +-
 10 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 8e37c40620b62aacdcb47c7a04bcfce944ab0b4c..5d3b864d28a86fb86fc4576210c9418604afd844 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -259,19 +259,15 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_2", .id = DSC_2,
 		.base = 0x80800, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_3", .id = DSC_3,
 		.base = 0x80c00, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index a05d2ef8fc9d217898b8c12d4639563b28b4477b..a6e9dfc583f283d752545b3f700c3d509e2a2965 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -259,27 +259,21 @@ static const struct dpu_dsc_cfg sc8180x_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_2", .id = DSC_2,
 		.base = 0x80800, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_3", .id = DSC_3,
 		.base = 0x80c00, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_4", .id = DSC_4,
 		.base = 0x81000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_5", .id = DSC_5,
 		.base = 0x81400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index cb0b5687b5239418f50c539447f9cfa56e81fcc6..fe9c9301e3d9d2d3a0a34ab9aed0f307d08c34ca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -193,11 +193,9 @@ static const struct dpu_dsc_cfg sm7150_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 17fa0ef9ac03e4649a218cd837b296211ef4506c..9ceff398fd6f554085440f509b6f8398b4fbf304 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -258,19 +258,15 @@ static const struct dpu_dsc_cfg sm8250_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_2", .id = DSC_2,
 		.base = 0x80800, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_3", .id = DSC_3,
 		.base = 0x80c00, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 06bcaf4d8b0db74c349112af6884f7f3139a7ff8..a46e9e3ff565ba5ef233af76f1c6cebb1d0c318a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -135,7 +135,6 @@ static const struct dpu_dsc_cfg sm6350_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 9c4e8450b67760c880d9bd2528c6a954a0282e08..98190ee7ec7aca6835376b030379a5a3d8b0859b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -87,7 +87,6 @@ static const struct dpu_dsc_cfg sm6375_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 01430ff90ab0988bdaa91b85458dd649aab543b3..41906dadff5a8ef39b2e90f3e80bb699a5cf59b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -174,14 +174,11 @@ enum {
 
 /**
  * DSC sub-blocks/features
- * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
- *                            the pixel output from this DSC.
  * @DPU_DSC_NATIVE_42x_EN     Supports NATIVE_422_EN and NATIVE_420_EN encoding
  * @DPU_DSC_MAX
  */
 enum {
-	DPU_DSC_OUTPUT_CTRL = 0x1,
-	DPU_DSC_NATIVE_42x_EN,
+	DPU_DSC_NATIVE_42x_EN = 0x1,
 	DPU_DSC_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index c7db917afd27e3daf1e8aad2ad671246bf6c8fbf..3a149caa7ff4f20dc7a902033cf29a168268839e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -186,11 +186,13 @@ static void dpu_hw_dsc_bind_pingpong_blk(
  * @dev:  Corresponding device for devres management
  * @cfg:  DSC catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
+ * @mdss_ver: dpu core's major and minor versions
  * Return: Error code or allocated dpu_hw_dsc context
  */
 struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 				   const struct dpu_dsc_cfg *cfg,
-				   void __iomem *addr)
+				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver)
 {
 	struct dpu_hw_dsc *c;
 
@@ -207,7 +209,7 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 	c->ops.dsc_disable = dpu_hw_dsc_disable;
 	c->ops.dsc_config = dpu_hw_dsc_config;
 	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
-	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
+	if (mdss_ver->core_major_ver >= 5)
 		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 
 	return c;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
index fc171bdeca488f6287cf2ba7362ed330ad55b28f..b7013c9822d23238eb5411a5e284bb072ecc3395 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -64,7 +64,8 @@ struct dpu_hw_dsc {
 
 struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 				   const struct dpu_dsc_cfg *cfg,
-				   void __iomem *addr);
+				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver);
 
 struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
 				       const struct dpu_dsc_cfg *cfg,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index c2a659512cb747e1dd5ed9e28534286ff8d67f4f..a2219c4f55a45db894ff18c1fd0a810c1a3cf811 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -171,7 +171,7 @@ int dpu_rm_init(struct drm_device *dev,
 		if (cat->mdss_ver->core_major_ver >= 7)
 			hw = dpu_hw_dsc_init_1_2(dev, dsc, mmio);
 		else
-			hw = dpu_hw_dsc_init(dev, dsc, mmio);
+			hw = dpu_hw_dsc_init(dev, dsc, mmio, cat->mdss_ver);
 
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);

-- 
2.39.5


