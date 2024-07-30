Return-Path: <linux-arm-msm+bounces-27432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B473A942110
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 21:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E66B31C22E19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 19:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2769B18991F;
	Tue, 30 Jul 2024 19:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j71S+jl8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD1D189904;
	Tue, 30 Jul 2024 19:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722369043; cv=none; b=ZRcyclvAwQQ9EyVKKvCoCkAXIVejauvr5NNgBbG6C2IhCP+x5GI5EpRRRbd0Bl+dumwJYwhELngPQap7Wr6WB7AyOd1hxSsbestn9KuCA9nt/mBpQ9/j68A8Scs872GsOD9H4XwMOBkxX8pz9OQXWbK6o2rOj9nH9SNM2IOBkvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722369043; c=relaxed/simple;
	bh=ic/Ft85fbFZZFwRHh96XBUCi50DE5yzS8pnjSamgQQk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Glxc0AMG25zOFQ4ZR3v5m/KdfrM2EqK02DtpcHsamRNBFeWc0YWq7H5w5yta5XOsqZcEBLZlj/4g0KPwMqXBbPllL7R/qdR0ep1OwRrip1QueMYhm8Uj8l+7DfcwrzXR22On+qr+F/znZaYs9NOnkUwTndabXmrHDk7kKRenvno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j71S+jl8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UFt83T011943;
	Tue, 30 Jul 2024 19:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+r2zziTW3sg3RGdlP2efvq
	m43Tppbw/bVKRMKJ3QqRQ=; b=j71S+jl8RS2c18fT4Q2PtMn9gOygA14bo+h0Z9
	gvWkUysj8tipdDTMWTPlUC6vk02zZ6cBbg84303YCDrA1++M9i35f6DN32oOlRFJ
	d/vuaBzYrHT9Sri+TfCs21DleoDjC/5gsr80bUKmtP8MjVziNdqUqTzAdA7+yPve
	oVDElH9Q5SfM/mLRxvWcLMbc4FpMdyFJR4XxKcCobp7jwHY31HF4BRPwURajZG5a
	ueRtvglybS4JkNNocbCit3AHO4dN2QLMm+EmHX7WG5cw2sXGkgYPVLcrgiWUedNe
	tx42eT6BEVfqUkCwJjJxEoZi22Va2+4xeDb7+cpNZRqrm/8A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mryu0v6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 19:50:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46UJoLrR018492
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 19:50:21 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Jul 2024 12:50:20 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson
	<quic_bjorande@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
CC: <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <swboyd@chromium.org>, <dianders@chromium.org>, <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/msm/dp: enable widebus on all relevant chipsets
Date: Tue, 30 Jul 2024 12:50:11 -0700
Message-ID: <20240730195012.2595980-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2Q1tANMX2mldGRJY--Fq_LC2ZxJ3DW5u
X-Proofpoint-GUID: 2Q1tANMX2mldGRJY--Fq_LC2ZxJ3DW5u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_15,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300136

Hardware document indicates that widebus is recommended on DP on all
MDSS chipsets starting version 5.x.x and above.

Follow the guideline and mark widebus support on all relevant
chipsets for DP.

Fixes: 766f705204a0 ("drm/msm/dp: Remove now unused connector_type from desc")
Fixes: 1b2d98bdd7b7 ("drm/msm/dp: Add DisplayPort controller for SM8650")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index aead7d27305d..bbba016ebff7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -119,7 +119,7 @@ struct msm_dp_desc {
 };
 
 static const struct msm_dp_desc sc7180_dp_descs[] = {
-	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{}
 };
 
@@ -130,9 +130,9 @@ static const struct msm_dp_desc sc7280_dp_descs[] = {
 };
 
 static const struct msm_dp_desc sc8180x_dp_descs[] = {
-	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
-	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1 },
-	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2 },
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
 	{}
 };
 
@@ -149,7 +149,7 @@ static const struct msm_dp_desc sc8280xp_dp_descs[] = {
 };
 
 static const struct msm_dp_desc sm8650_dp_descs[] = {
-	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0 },
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{}
 };
 
-- 
2.44.0


