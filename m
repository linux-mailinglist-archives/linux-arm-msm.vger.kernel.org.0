Return-Path: <linux-arm-msm+bounces-39272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3B39DA3C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 09:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E54F166AAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 08:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1EE18BC3F;
	Wed, 27 Nov 2024 08:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fjQebtGt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CAE18A6C6;
	Wed, 27 Nov 2024 08:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732695540; cv=none; b=QR/4CIu6zxwxHO+elGZ64sfjwqRA6J+LFv+YxAqJYealLnSvWtDtQJ3S7Whr/kT+reTA3rsJuRqN8q8vfRF+Tb8vP4WXyafu1V7zNa/B0GpPSItjQ0Y25dWS75rMcm3SJJjF12WZFDkFmqyCRWLmp0UQ4xXIVOg0kyY/Y7UtCLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732695540; c=relaxed/simple;
	bh=Kv3WcddR9MsUgmmClIy6q8Ol60TMO7sokyn1kAcZnI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=E2fQtIeQo2UvC24QmZ0QlhR9EkM6gL/fh1Q1RYWPxEWVXs7D1fhfcBPHPi8/H3hdk8+mVhxoi2TgmTUW2qSJi2pwDgLRKLOVDE9EuJG2oCZzTqTDnSIkVNbfj61G8I0DzYG8+vu2UeMq0PLrKTWuFtHZfGWdhdzgN4XxPPFO53U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fjQebtGt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQKLUFa009560;
	Wed, 27 Nov 2024 08:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S49XxjYQNmdAdEVu477YowaV1cPclRxsr1RN2ho/qg4=; b=fjQebtGt3S/9YbN+
	00hLIED3yC5/X94URUbg8nXFV27OiXs8/jCiRE7Hq7G5ykYLgMjZlWf6sJ47cEft
	HHHDaI4XEcSIF/a39mwKJWa23l42/FWGDnOzqumG8fjAU9/+Ui7OiEGXhOPU3/Td
	TA+HqnMg3pVUWMTpeYPmFVjOkRVregdbdvy67HOmAUY3+QOS5DCxOJoSp229IAJo
	Jw5fasZI18hIseH4A4mF3xI3rC0+ASwcAa2z67bSsLOGKdzIqHx6z6/J9CxBmCP4
	jKNT25ire82z3rd8V3ZyBtVNNMIhRepA2uYXr8cHx/MiHEO2yrMgAMFfIZpK3qoq
	F8cv/g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435ffytmpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 08:18:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR8Ijnv003409
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 08:18:45 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 27 Nov 2024 00:18:39 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 27 Nov 2024 16:15:51 +0800
Subject: [PATCH 4/4] drm/msm/dp: Add DisplayPort controller for QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241127-qcs8300_dp-v1-4-0d30065c8c58@quicinc.com>
References: <20241127-qcs8300_dp-v1-0-0d30065c8c58@quicinc.com>
In-Reply-To: <20241127-qcs8300_dp-v1-0-0d30065c8c58@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Ritesh Kumar
	<quic_riteshk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732695494; l=1479;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=Kv3WcddR9MsUgmmClIy6q8Ol60TMO7sokyn1kAcZnI0=;
 b=nKAXbddFVsiAR94QMc1A+Ohe7IUC926G7ccN2lxVljNRmpK2wFe2dGhd3ufV51sfCYRUeZgLJ
 fsN+Q/f+X4rAuz4UOM6JtKg8wJirmfbG/K25znIeDivsKyLmMzPQpRu
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fsuVfvHHkua5bQRgWYR688JvNKKVF82A
X-Proofpoint-ORIG-GUID: fsuVfvHHkua5bQRgWYR688JvNKKVF82A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270068

The Qualcomm QCS8300 platform comes with a DisplayPort controller
with same base offset with SA8775P, add support for this in the
DisplayPort driver.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index aba925aab7ad7c6652e81004043864c1cb3ac370..f870faa89f26a8cb5bd7f4caf11f42e919c9efac 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -118,6 +118,11 @@ struct msm_dp_desc {
 	bool wide_bus_supported;
 };
 
+static const struct msm_dp_desc msm_dp_desc_qcs8300[] = {
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{}
+};
+
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
@@ -170,6 +175,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 };
 
 static const struct of_device_id msm_dp_dt_match[] = {
+	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_qcs8300 },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.34.1


