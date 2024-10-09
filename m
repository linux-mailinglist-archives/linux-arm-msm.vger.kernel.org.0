Return-Path: <linux-arm-msm+bounces-33709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68832996E22
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 16:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23F4C2816D5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 14:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2F91A0BC9;
	Wed,  9 Oct 2024 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EcPwRfy8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9695192B7A;
	Wed,  9 Oct 2024 14:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728484484; cv=none; b=bcwiVibNHMMLzu3cZGt7u4R8G8hOt9m5Dt2U94BQTOyLUQEHCoS99hffSoQb2HSnY2Xv2u8IUcjtVC0EZj16t1+BmA1b/swJQ002HZFf+egIFu2iN1XQ2trukOF8QKP1Nkhj5TzlTcdqfuG+WvkxbswIOLipq1iQrSUuzxs7HHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728484484; c=relaxed/simple;
	bh=Dts5Jx1UNanqF7lGMsb7hQpjII5ko22XSR6FrPTVabk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=kPXRY/vuIu9drMBbwuJbCI4nbNZKcbMcBh6Pn8Rd0RJFdY13RX3HD3YB6H5BXDYYtPxxvg9jbHQOkt/57aXKkmNvX3QdnR3GYwoXMox9dNuqZxeIZ4VU5yBek75ZdHuJy981jNFpV/Bs6bPbEDalJDINHzAlnlhYa0PVih675Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EcPwRfy8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4997qRH8022606;
	Wed, 9 Oct 2024 14:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t8u15V4fYoGSGeSgeB+3Ed54I2sMSE4DPTEdb1+tG5A=; b=EcPwRfy8Qla6mIJg
	XwMHB9mIKqZvue0tj+yNUU6zXMDomptVskf1adU5boj/XTPmCTTxCrQOJgwPKgKt
	KpB6I1tY1Sfz21sobMvaEwFpO6db53x6lfBP9z7hwlbXQqngrPwdouVxwMsxFvDB
	tCDl6YdbQ8AyqJh5hqqQMZiETe2idds0MmN04rhOOXYOMtXZofTD6QZzHLzikixw
	Eicc1xzezedzcXFvYeiJxYxZgg6/liMrWOAPM82CLh25rK6w3wSusK/Nf/aOazGo
	PQ+MMGsP1KF0QjsIdeKC9gzXxquRSBuKjSVbPOf1Ofep0m7KRmIElaWVUtKnLruF
	PihaEQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424kaexhb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 14:34:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 499EYUmT011068
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 14:34:30 GMT
Received: from hu-mahap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 07:34:23 -0700
From: Mahadevan <quic_mahap@quicinc.com>
Date: Wed, 9 Oct 2024 20:02:03 +0530
Subject: [PATCH v4 3/5] drm/msm: mdss: Add SA8775P support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241009-patchv3_1-v4-3-cd683a9ca554@quicinc.com>
References: <20241009-patchv3_1-v4-0-cd683a9ca554@quicinc.com>
In-Reply-To: <20241009-patchv3_1-v4-0-cd683a9ca554@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mahadevan <quic_mahap@quicinc.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Jayaprakash Madisetty <quic_jmadiset@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728484443; l=1502;
 i=quic_mahap@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=Dts5Jx1UNanqF7lGMsb7hQpjII5ko22XSR6FrPTVabk=;
 b=pktQio0he7EKjiQ92GMcLMlTZxE8jjHKvBdu1lwBGs7Q+XynPJj7FJEo85OyVVHoX9LuHP3mP
 ljhayMzWHv5BRqNR39Vxx7s1ax1AAVT86FZ5xqePFgvyClWnsF784Gc
X-Developer-Key: i=quic_mahap@quicinc.com; a=ed25519;
 pk=Xc9CA438o9mZKp4uZ8vZMclALnJ8XtlKn/n3Y42mMBI=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oCal0-mpSwpjR9RxDRMH9q-zyFPn6d0Y
X-Proofpoint-GUID: oCal0-mpSwpjR9RxDRMH9q-zyFPn6d0Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090090

Add Mobile Display Subsystem (MDSS) support for the SA8775P platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index faa88fd6eb4d6aec383a242b66a2b5125c91b3bc..8f1d42a43bd02dd79acf222a3423d11ff3b3cba3 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -573,6 +573,16 @@ static const struct msm_mdss_data qcm2290_data = {
 	.reg_bus_bw = 76800,
 };
 
+static const struct msm_mdss_data sa8775p_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = 4,
+	.ubwc_static = 1,
+	.highest_bank_bit = 0,
+	.macrotile_mode = 1,
+	.reg_bus_bw = 74000,
+};
+
 static const struct msm_mdss_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
@@ -710,6 +720,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
+	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
 	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },

-- 
2.34.1


