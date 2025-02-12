Return-Path: <linux-arm-msm+bounces-47707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FA4A31FCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 08:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C7997A1104
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 07:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBCC204597;
	Wed, 12 Feb 2025 07:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J4VtgJ83"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03CE2040A4;
	Wed, 12 Feb 2025 07:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739344574; cv=none; b=kN8mQCLXZQI4Hd0Oqdmarn4HbCrUC67KlE1BHFVPliwJH4iyRJ9IhsPfSVuemPWJrr3xhaT23TQQneA+fN19AylKl2sY3bdcfi7YeDGFTbRNfR0I4tXVWh7vbAqLQPn8hLZgNsB9GPLAy9Jhldf1tVGdodzH/m/sas1KLZRWXTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739344574; c=relaxed/simple;
	bh=MQIzh3ziF5d0/tKmlR9+IXcta4eS2hJO/yRwQIK/O0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dkH1qKh740ZQM49Qhuh1QMsTZnCkA/9Ha/QbcNjlXm3XOHKpZjTggOnbM/r9w2QXu3gcOCygIVcVKWYi3hPVXBOawH6xS30SrZXe6oTzJcS+9azGghnrGaZU/XAGcJF+/Q189KLYIxZ/GrRr30gwfy6u8vg/oyfa1imdeeSk5hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J4VtgJ83; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C0UdPr030555;
	Wed, 12 Feb 2025 07:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dhzKottr+LRsQwy0L+XNzGMpp54hezociQQ9kRAcT2U=; b=J4VtgJ831FVudxdg
	1E4VWdBvgEiEpQAyNSIQ5lS0Ii+oC6Mwmp8LmzjCvoDZrOfigYh1VZAKOUKJWmDZ
	MUKZWvQ+D39IQ9as2QmS28Kd4TVp4HSr/JscIIVxIDHA90YTanRFeWBuk3R646oe
	RK/eSnJTdLFz3W5i9kZiIIwHM7sT+ZWofq649+UMdArzMMMNKBHbQ6r5oeAoMMbe
	vQbHxrQgl6SczsUbWnqr5LTe9VnJ7a0ApkysYBJXfHOSi4GWZNVY84V8hSLaGYyx
	/VHniX5EZPBZFUMF44eIWGZDN2nym4v1N6yv6SY3fcu2mA9f2U5zH0z+8A95q9gF
	xmtgAQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxg9m0tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 07:16:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51C7Fxxj000691
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 07:15:59 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Feb 2025 23:15:53 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 12 Feb 2025 15:12:26 +0800
Subject: [PATCH 3/4] drm/msm/dp: Populate the max_streams for qcs8300 mst
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250212-mst_qcs8300-v1-3-38a8aa08394b@quicinc.com>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
In-Reply-To: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739344534; l=1965;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=MQIzh3ziF5d0/tKmlR9+IXcta4eS2hJO/yRwQIK/O0g=;
 b=lVXIzKJ/Ze2NoCCcq3qD85778CQudhDkisTY+M/nSrdUO3oz2ne9/r3oFRtcYqXyKu1aMtnOZ
 N1NfV2hOe3KBNIlUSCxbvk9cRY8yKgybgCwkI8lmVSFTyjKiS3mKUOW
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mKJFZMzEt5t5mxenRYUvrcZvDo1DMJMM
X-Proofpoint-GUID: mKJFZMzEt5t5mxenRYUvrcZvDo1DMJMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120055

Add support to program 2 streams MST for qcs8300. Previously, the
qcs8300 reused the driver of the sm8650's DP controller because they
have the same base address, offset, and number of controllers. However,
now we need to enable the MST feature for the qcs8300, so we need a new
patch The qcs8300 use the same DPU hardware as sa8775p but only have one
DPU and dp controller which supports 4 streams MST, but currently we only
enable 2 streams MST. It use the intf0 and intf3 to output the data
streams of MST0 and MST1.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fbbd39d1e53ba3172757105937a528b5c58ea290..fbe4658af1be2ec8c02e8f567667f1dc93ee5537 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -149,6 +149,13 @@ static const unsigned int stream_intf_map_sa_8775p[][DP_STREAM_MAX] = {
 	{}
 };
 
+static const struct msm_dp_desc msm_dp_desc_qcs8300[] = {
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true, .max_streams = 2,
+	  .intf_map = stream_intf_map_sa_8775p[MSM_DP_CONTROLLER_0],
+	},
+	{}
+};
+
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true, .max_streams = 2,
 	  .intf_map = stream_intf_map_sa_8775p[MSM_DP_CONTROLLER_0],
@@ -205,6 +212,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 };
 
 static const struct of_device_id msm_dp_dt_match[] = {
+	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_qcs8300 },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.34.1


