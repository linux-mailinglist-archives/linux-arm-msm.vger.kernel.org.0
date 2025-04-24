Return-Path: <linux-arm-msm+bounces-55327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E7BA9A83B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7E133B4BD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA65241CB6;
	Thu, 24 Apr 2025 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VE13EaKX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA70924166F
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487076; cv=none; b=t16+3L7vg6xhQlv8T45GvFPoqit8lTZOJMsmCZJ2H0RlV4u39iEYc1WCtzoNbX3rpYx1HOQsnJTkJFUkf3kZMMBnFOo8FaenqAtLsSEICf00rUTakRy9ZGUnpz0CbRhB6K9VYCTkjvmAathbvtCNNGRR1iQvdXnsB2ZFiYZlk6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487076; c=relaxed/simple;
	bh=+LkgCLQTfsN1XshO4dd9+YhVnPh0FkfYstgaJMuLCEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IbIXf/pQZvTQvXk8TlaqvyGDMc0dykgpjCzLGdtJVvQrNoMtVj6sr/7PjoFgfEyf7mz2XJSxE0ieaAoLtzsveFpJHoqJfYFCYhD9iJvKCCIHw7aXUUwLlNk8xsaadR00zJ3LFIwypiI2A34HlYo9onCEAlqDVMWhqkSlxKygSdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VE13EaKX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FAUd005968
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p7QBd09toXDPTxrH5vx0XxRC7vdkh0nO6VZwdHqqgW8=; b=VE13EaKXN+/RiHfV
	vpONfXdaDTWbzLnDvF6B8I3nuIYPC6aPn9uFAmHH/BXS0li6Y6/VffWooLcj9GhG
	lDXHT8saj/uf3Sgf6H+U2Le+pKw/Y0OzFss7WOzt+ZwTWbegrvHD63DxFWTzLQnG
	0e8aaP3knsHSB0GwqCfClAkaAZj6T5jpNoWNTFbe5f00QzATsbBmYWG8QeFJvbJu
	49xDB+C4XkeprkfjhyQ9IWrZ1L0tQfwG1SorHzLHgdqz9W1NimNrI1psjzbi5vPV
	CvoJSE3C1uFQE0XDgpYd0PoLBDDyndxiN1oxxQEOS/9YWKeXSrLENPEUivieL7ru
	+ov7/Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0506t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6ed0526b507so13481536d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487073; x=1746091873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7QBd09toXDPTxrH5vx0XxRC7vdkh0nO6VZwdHqqgW8=;
        b=qOiCsJBbF3rvvvueZ5M5CzdK6sBlcWcINCA0FxiqWujoCn9mEKrxLqzs/KJ0SHzx9w
         UFJE0ix3aAzWNqpSsmS2hi0OZ+grmHvGgEdNgY0EdughHIyVt3cCTqijiWzdvMh1U4rZ
         4QMmAttMjNi58hbv/A/yerdqhEK9RCcGDFJ2KelC7uIWXRkDMX9twT4mj1mPQvjbce8e
         3R9CjUzdrEsCgufK+LrAsmQ8Esj+F91gZ7h39tpm9isbgPaPB1mSlhC/hni9xG2Fngyq
         XSG06JzVTn/1JUFs50L6iY/KUFRRD8nf5U9sLJBqzNSeGBCXT8FfuMZKQUEx5Zi9EoQ+
         QTCw==
X-Gm-Message-State: AOJu0YyRGGNyaWG3i1+53yIoAsvEgXnF7FvgaFgfudkiMiQn2tuwEAkn
	JNWt+IZ8rovw/cFAXyq2FS0oYT3Q0H4Bk/lJmGi4u/yZ4E0aJb4Mm40NAZIn20Phs5zQZSWYT/v
	GKd+X8H0xxNJQxiKBxU2TRDXq0EgJBIN19zqk+o1fNFB66QeVfnBxdRo7mVHteIGw
X-Gm-Gg: ASbGncsqZGq0S2nLyF0bkCIRwDqnR/+3VUNdl6A1G6Xh+x0Vh62ytppLcckNggOFJcP
	gJo0evaGPaYChzCuoWXYPA7qC9s+7wv8ydoc47a9oUO4JZl0sfoA7rPq0WGdjVOJvvc99tK9riN
	h5rvjr0J9P3FLLhfjpNeGixJ7f+Q+9gyB4tr9/jU/SKixb6CAd4gqRI2LWsIM4vE7LVT5lO7KKb
	VaR7YZ6GIVoqHdXsRIyjwZh8x8ywgFaExixCQ58qYxE7J51Uk3asccC/7Ws0Oo5TzTe+KH7HyAN
	ZK3FWuiP3LnIqVT2e0wvEf8q0579QWE4vM8TOUS9fxj6bta+b5d+8d0h4x6F45LIXu/Zf35vGxE
	+mjYKDElzjN7Lgjs+ZqqYctGR
X-Received: by 2002:a05:6214:dab:b0:6d8:a1fe:7293 with SMTP id 6a1803df08f44-6f4bfca4560mr28718316d6.42.1745487072689;
        Thu, 24 Apr 2025 02:31:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ+U3ha+fp2N8SiPtLrKv0a/ioyNMNuBlA0czrAfkLKqr62nyrIT47NeRoNYV4FWUxOEGfgA==
X-Received: by 2002:a05:6214:dab:b0:6d8:a1fe:7293 with SMTP id 6a1803df08f44-6f4bfca4560mr28717926d6.42.1745487072268;
        Thu, 24 Apr 2025 02:31:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:31:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:29 +0300
Subject: [PATCH v3 25/33] drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-25-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13833;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+LkgCLQTfsN1XshO4dd9+YhVnPh0FkfYstgaJMuLCEg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSvUxH/BqvZoDra4F3nGyl7TVGDYyC9dfCsQ
 +rvV+p0S26JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoErwAKCRCLPIo+Aiko
 1cCAB/9lHEu+2UJmzv6h2gHHCcxM3YOJLv2KBoWPCwqsB8CyiPpyX0nXnITmcDAAKk2u2anwASD
 Gaer39LznPmGtmDhw5Ajmp/bUde64DdREidlCZMe6SYUs5dy8Fk7ExAVer/2gGoY3p3KMb+8dpz
 TrAKfv83DN7s45H6PIKVh2H9FVe72iT3pDy95d5WHKDG3Zv7/5GMxrI9kQITpqsRAM82xqmncTO
 BWoCwxs29vPxk9kx0Q74Pnsg7QzfTz+RonfL4J2AC1qXeSZkuHpa2+H/Fx3aafwa4T1qrOrGCuP
 8HesI20PbVbeyNhT0ZcOE8gdO6qncrbZpHBDLhBSZZYsxuJb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX33NLnwsQanC2 IRVDg97gkTfmlr67cARFwX37QeKADZkAs5x38fSZVE7YylGX4weqp3iwIyJOQodddMqvguHG3KG /Yfg0A4bjUAnFwxX0+KJaMBLfBb5EY69RqQM2M6MquboPVHDDP6mfHTSyxzF2S7rPWAfE3W19eB
 pFjg7inVdfSJR5Prf0ZLM26fNbB/7W9lfTsirVtJaPamEGOhRNF0SJPQTTZRPf42ifRnL5kYtvw vZKjv20KS6UmbVNzXg5LBdNU8m+HM7UkPruDso8njVmK38GNY942DJCwtGafXWUHQ/PMxWjoMoR SqYxQrNi13SsZRCFVVAd1Aimi1SmXwxlCgVtU87tZCybjCSLTfk0VvHBuqkZzC+FZtq3vVNhpyq
 YrYmRSjMzMTaD0txLvws1SLx+DtRihEszIanp1RU0h3mq3IweOeSlyPw6fZGmN+CiTCcAh4p
X-Proofpoint-GUID: c7JaQGwaJKeThfyYU7rNancdi8OuKvax
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680a04e1 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PTNk0fzPuTrgWsykFtIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: c7JaQGwaJKeThfyYU7rNancdi8OuKvax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

Continue migration to the MDSS-revision based checks and replace
DPU_WB_INPUT_CTRL feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c                | 2 +-
 18 files changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 5f6b1251f30f3c6dfb20261a0d1bbf776ed5dd33..02bb3d01e2dcfb881d089c68b516abe1761f692d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -321,7 +321,7 @@ static const struct dpu_wb_cfg sm8650_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index c5d964e915cdde1f8a83c2793b0020d7cecde672..e1490dd6d0b35ef71b91b4b7dbc574b102e68652 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -278,7 +278,7 @@ static const struct dpu_wb_cfg sm8150_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index dc21c5c232a7ce7d8c21d3a3f30a5c1bc352ddd7..c53a0376fc3d040b69a35896aad613ff8aec73b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -283,7 +283,7 @@ static const struct dpu_wb_cfg sc8180x_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index c1e620ae9596f400655b64b47e6b51a8d25e1428..f72c986079803ec0d60f0bd6545ee0812657b8f2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -243,7 +243,7 @@ static const struct dpu_wb_cfg sm7150_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 8fb926bff36d32fb4ce1036cb69513599dc7b6b7..a065f102ce592311376f1186add7a47dca7fd84f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -154,7 +154,7 @@ static const struct dpu_wb_cfg sm6150_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index af7433fc6c128c2e29381ba6bf56388bccdd93f8..8c909c41b48a18fdc54753c68bc2ad19001cd3b4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -133,7 +133,7 @@ static const struct dpu_wb_cfg sm6125_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 81af11630202943b910cd5896f07a32e53a23c6a..448ec3def8c7e3e77ce0740e24588a14b0a44da7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -315,7 +315,7 @@ static const struct dpu_wb_cfg sm8250_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 77126039733bbb2941aa6698bb353334efab3804..f091503840182b624471c62ada5f8cb813a707bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -148,7 +148,7 @@ static const struct dpu_wb_cfg sc7180_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 8cdd601a5350e80a5324db42c23bdeb474a59b0c..f4cd9405cc1f0589bce7ec68db68989bd24b2faa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -142,7 +142,7 @@ static const struct dpu_wb_cfg sm6350_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index bb35eea64a5af844965259cd96bef10d9955b493..f4572433f352fb2c939b80c31e90bc2bfaa2a057 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -288,7 +288,7 @@ static const struct dpu_wb_cfg sm8350_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index d21b2266909050fd20bf55b6fabe07351e445c5a..d312b7ff375ebb0bb5159c4d26eadc6eb3094103 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -159,7 +159,7 @@ static const struct dpu_wb_cfg sc7280_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 305a798768c60a2ec409c1021a91efc4eccc92fd..72b2f67bb70eb09a3340097da6020a40cfbf87fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -301,7 +301,7 @@ static const struct dpu_wb_cfg sm8450_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 67aed1ebc78952c6dfce0cc9f1680fa75ec26e13..de7e79680a7353e73bb2c761276edd9ddc25ce97 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -308,7 +308,7 @@ static const struct dpu_wb_cfg sa8775p_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index b54a208e48a8508c39b4e4e95c9e26ce28ba7c02..674192923d8c184386e46870afc508e53917ff6c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -297,7 +297,7 @@ static const struct dpu_wb_cfg sm8550_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index da2fdf01a17d29fd9a7ea46890db7a33fedee31e..6cd7ddeb2b1fceed4cebc1f86793831b1cb75945 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -297,7 +297,7 @@ static const struct dpu_wb_cfg x1e80100_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 5ca696b8cd92cefe295cc7e45974e1da0d420cad..6a96fa529508673493712d7cb72846c29d0f5a07 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -101,9 +101,6 @@
 			 BIT(DPU_WB_QOS_8LVL) | \
 			 BIT(DPU_WB_CDP))
 
-#define WB_SM8250_MASK (WB_SDM845_MASK | \
-			 BIT(DPU_WB_INPUT_CTRL))
-
 #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
 #define DEFAULT_DPU_LINE_WIDTH		2048
 #define DEFAULT_DPU_OUTPUT_LINE_WIDTH	2560
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 981d259c33631d31f0216f5cfae948b828d03592..e0efa65afd0b734234f1080baf2d91e348882dcf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -142,8 +142,6 @@ enum {
   * @DPU_WB_QOS,             Writeback supports QoS control, danger/safe/creq
   * @DPU_WB_QOS_8LVL,        Writeback supports 8-level QoS control
   * @DPU_WB_CDP              Writeback supports client driven prefetch
-  * @DPU_WB_INPUT_CTRL       Writeback supports from which pp block input pixel
-  *                          data arrives.
   * @DPU_WB_CROP             CWB supports cropping
   * @DPU_WB_MAX              maximum value
   */
@@ -157,7 +155,6 @@ enum {
 	DPU_WB_QOS,
 	DPU_WB_QOS_8LVL,
 	DPU_WB_CDP,
-	DPU_WB_INPUT_CTRL,
 	DPU_WB_CROP,
 	DPU_WB_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 4853e516c48733231de240b9c32ad51d4cf18f0d..478a091aeccfc7cf298798e1c119df56737e3dc4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -208,7 +208,7 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
 	if (test_bit(DPU_WB_CDP, &features))
 		ops->setup_cdp = dpu_hw_wb_setup_cdp;
 
-	if (test_bit(DPU_WB_INPUT_CTRL, &features))
+	if (mdss_rev->core_major_ver >= 5)
 		ops->bind_pingpong_blk = dpu_hw_wb_bind_pingpong_blk;
 
 	if (mdss_rev->core_major_ver >= 9)

-- 
2.39.5


