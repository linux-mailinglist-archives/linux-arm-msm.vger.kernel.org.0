Return-Path: <linux-arm-msm+bounces-50432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F15A5411A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 04:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 022B51890A10
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 03:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2290D4315F;
	Thu,  6 Mar 2025 03:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lDyt+/Ws"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CD06FC3;
	Thu,  6 Mar 2025 03:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741230923; cv=none; b=n0Pdhm0/bmEC8LvhJobf2CZQO8jZ8PCubUT4fMrbAW8z0Fz1sXXXEzYv748uPD53Dk/85vJDiUnDi2Yuchmh3vavwE8WExTuOdnBbs1xLWc2WY/AbitfF/BHtT6sBrGJuJOQIPfHjhC7low8En5gMFxPkehYFepIzBlMi1RTpnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741230923; c=relaxed/simple;
	bh=T6Eg3jHQRZjNZA2biHpCd/Z11nU+PWVm8Nm1NbKbkZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=mUdLYdzf6aPh+ddfcVuK18cRkJ3FSDxgJc1EGmeOkN/JdRJEner1aoL7UBcVZJNn3qEldME1jgpa+IOb9tsNmYsLvGNzo5+6SulE5eYjsUvlXPHtbSbeIb8iJQgdUeHz4q29TUxKKi2giv4UJseuJ3zCDSONO+Y1IYXtwf+39/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lDyt+/Ws; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525LIQQi025491;
	Thu, 6 Mar 2025 03:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qaZhFp42MmEJNzOT5RZMPU
	mJ/QcxRENOj4hsd/6um8Y=; b=lDyt+/WsV2CThJQWRAYcKzt2F4iKb00ydsVExq
	UMBlqPJwc4IoMj3UjV4IDUnyXKphthHtuEIDaFSlRrlbe1A1Qs8gKSj31Ox2DhMI
	6ktEmWl6bfEZqvplAWkVdJxvE9RdeSwc1G29APRFJiT9q6Or2AFNULpmXNElE/Pc
	Pxoxiak8IYhunjRpNRkegobkoCHOwLf+e3syc8NIK6twpg2XxxxxkdsioTOEnljX
	nJawmq3blc61NuAohrHnoSaZrAz2+0cE5CbSqcQpakicYnRUitOwJafaGDDS6hvv
	LpobvMjq3sL66YJy5f3Ft4Z2Fs/ej9byk/eg0P1deL6eO6dg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tyhb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 03:15:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5263F80V008494
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 03:15:08 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 19:15:08 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 5 Mar 2025 19:15:05 -0800
Subject: [PATCH] drm/msm/dpu: Support YUV formats on writeback for DPU 5.x+
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250305-cdm-yuv-fix-v1-1-5f1dd8ecf76c@quicinc.com>
X-B4-Tracking: v=1; b=H4sIADgTyWcC/x2MQQqAIBAAvyJ7bkEtL30lOpiutYcslKSQ/p50n
 IGZCpkSU4ZRVEhUOPMRG6hOgNtsXAnZNwYttZG9NOj8js9VMPCNFJRbhhCMkxZacSZq+r9N8/t
 +IZ/G6V0AAAA=
X-Change-ID: 20250305-cdm-yuv-fix-ef1cb4ff5c0a
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-f0f05
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741230908; l=9714;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=T6Eg3jHQRZjNZA2biHpCd/Z11nU+PWVm8Nm1NbKbkZQ=;
 b=JginAgk1MAos8fazpWixxF9cs1djUWypLUklb285BTU3iLb0L0AHy7utIelHQhpUvn5Lgj4MG
 ixTBNqvtjNSAw06gSGlNKzP+p8Vxd3jaV4I/QivOvr7P9oRt+tSEKl/
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cd86C0yHXLK6pPzSz4gGx-YPf9R6gvVh
X-Proofpoint-ORIG-GUID: cd86C0yHXLK6pPzSz4gGx-YPf9R6gvVh
X-Authority-Analysis: v=2.4 cv=Sf4NduRu c=1 sm=1 tr=0 ts=67c9133d cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=MteKOLTB0tUDDyy3xKIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_02,2025-03-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=721
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060020

Now that CDM_0 has been enabled for DPU 5.x+, add support for YUV formats
on writeback

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ++--
 12 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 85fde7243dd4..6ac97c378056 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -343,8 +343,8 @@ static const struct dpu_wb_cfg sm8650_wb[] = {
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
 		.features = WB_SM8250_MASK,
-		.format_list = wb2_formats_rgb,
-		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
 		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 23188290001f..979527d98fbc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -298,8 +298,8 @@ static const struct dpu_wb_cfg sm8150_wb[] = {
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
 		.features = WB_SM8250_MASK,
-		.format_list = wb2_formats_rgb,
-		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
 		.vbif_idx = VBIF_RT,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index de8ccf589f1f..d76b8992a6c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -305,8 +305,8 @@ static const struct dpu_wb_cfg sc8180x_wb[] = {
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
 		.features = WB_SM8250_MASK,
-		.format_list = wb2_formats_rgb,
-		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
 		.vbif_idx = VBIF_RT,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index b2ebf76e3867..83db11339b29 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -261,8 +261,8 @@ static const struct dpu_wb_cfg sm7150_wb[] = {
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
 		.features = WB_SM8250_MASK,
-		.format_list = wb2_formats_rgb,
-		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
 		.vbif_idx = VBIF_RT,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 2b4aea177bca..da11830d4407 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -168,8 +168,8 @@ static const struct dpu_wb_cfg sm6150_wb[] = {
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
 		.features = WB_SM8250_MASK,
-		.format_list = wb2_formats_rgb,
-		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
 		.vbif_idx = VBIF_RT,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index cc2951112bda..d3d3a34d0b45 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -145,8 +145,8 @@ static const struct dpu_wb_cfg sm6125_wb[] = {
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
 		.features = WB_SM8250_MASK,
-		.format_list = wb2_formats_rgb,
-		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
 		.vbif_idx = VBIF_RT,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 42a00550eefb..040c94c0bb66 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -157,8 +157,8 @@ static const struct dpu_wb_cfg sc7180_wb[] = {
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
 		.features = WB_SM8250_MASK,
-		.format_list = wb2_formats_rgb,
-		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
 		.vbif_idx = VBIF_RT,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 828a02429405..397278ba999b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -151,8 +151,8 @@ static const struct dpu_wb_cfg sm6350_wb[] = {
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
 		.features = WB_SM8250_MASK,
-		.format_list = wb2_formats_rgb,
-		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
 		.vbif_idx = VBIF_RT,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 795e9ebf8c11..0c860e804cab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -305,8 +305,8 @@ static const struct dpu_wb_cfg sm8350_wb[] = {
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
 		.features = WB_SM8250_MASK,
-		.format_list = wb2_formats_rgb,
-		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
 		.vbif_idx = VBIF_RT,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 048dfb9dbb60..19b2ee8bbd5f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -321,8 +321,8 @@ static const struct dpu_wb_cfg sm8450_wb[] = {
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
 		.features = WB_SM8250_MASK,
-		.format_list = wb2_formats_rgb,
-		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
 		.vbif_idx = VBIF_RT,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index a5b90e5e3120..24f988465bf6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -317,8 +317,8 @@ static const struct dpu_wb_cfg sm8550_wb[] = {
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
 		.features = WB_SM8250_MASK,
-		.format_list = wb2_formats_rgb,
-		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
 		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 8977fa48926b..6417baa84f82 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -317,8 +317,8 @@ static const struct dpu_wb_cfg x1e80100_wb[] = {
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
 		.features = WB_SM8250_MASK,
-		.format_list = wb2_formats_rgb,
-		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
 		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,

---
base-commit: 6d3175a72cc07e90f81fb35841048a8a9b5134cb
change-id: 20250305-cdm-yuv-fix-ef1cb4ff5c0a

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>


