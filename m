Return-Path: <linux-arm-msm+bounces-39270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 842419DA3BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 09:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC793166B9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 08:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7A718CBE8;
	Wed, 27 Nov 2024 08:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h/iFENqH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2D1188CDC;
	Wed, 27 Nov 2024 08:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732695527; cv=none; b=pMwp46dmUraXhcB+Sx98VRjuGdbASw05fB8X/Vpm1Nxx57LRsGYomOu1+EBump6AX7vkTgQE0lCDOJPqrtu95zm+rQbESEeLhRCprwnyte0JAw2dRGxNQNA4DBRrk1cFQC1tMp4pkhvf8MriCW00T0MhQF/QMm2x0FJLXqMKW1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732695527; c=relaxed/simple;
	bh=bYcWuM1MZj078n52o973JsHiGfYxhrYI6uzPLe1A4oQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DodqLN5RqEViGt3uvRFDbbep/gVyM3t1b9slV50DdVe7eh7VSKob66QfvheuEJJFLud2RN74F79UeS6sdCKpvS7JpdhVCJj1A5diENuW7eEhff6CI7xlK1oq4rV9TmYIZ4S//Ev9rrodgfqfaOZGJqc//mcnoPdtPwC7mdNfDpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h/iFENqH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQKLHSk013709;
	Wed, 27 Nov 2024 08:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1GGUeQevJqrCM6zzxTxYMArPmxYnSoodpZJnXPQLP2Y=; b=h/iFENqHpo4RqgJ3
	OVVLOdWUhvDqQJbx1e6Wlvi2r+gw//TLfLlD2X0S5QN9/tj/hPFh04F4YIdvpyF/
	2wkKvnooef+ivZ+gqFL/1uNEJLwLShcipWxFoUatmbbPcu6INt/w5N4O9yFeBPPP
	x8UiN5SzQlUL8XMcOz8fFoB0ZWOKfUbY8/Di4IS3fFLaz3onsh+A1OgXfkZ/w+8x
	3ZPrHVN0MVBKjv1ef2fys+CcRF3pgPtXonvGEDzyN4toabcPuQKST8qu0VGFQwpR
	XSf6Lal4uO0BNhpdoq/i6e0E8O+iwM6C2TuOft4DBtbKVt6KlUaZCUBWZtMDqXyE
	84DCLA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435epqasf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 08:18:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR8IWCF025600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 08:18:32 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 27 Nov 2024 00:18:26 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 27 Nov 2024 16:15:49 +0800
Subject: [PATCH 2/4] phy: qcom: edp: Add support for eDP PHY on QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241127-qcs8300_dp-v1-2-0d30065c8c58@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732695491; l=1431;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=bYcWuM1MZj078n52o973JsHiGfYxhrYI6uzPLe1A4oQ=;
 b=ZmUybd4RJfpI9daDccx+0oUa2dAFRhdirMkJN+gyh2bP8xc+bjM6Dq53I038eiucIQ8RE3uCO
 n4GZXyX6CEMDH/RO+TuB0N3aqKTnyeoEuq6vmTpPXXny708B2gpkf+s
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ko1OPWMx0dQAx96xesA83PXQjrWdvYX4
X-Proofpoint-ORIG-GUID: ko1OPWMx0dQAx96xesA83PXQjrWdvYX4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270068

Add support for eDP PHY v5 found on the Qualcomm QCS8300 platform.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index f1b51018683d51df064f60440864c6031638670c..90e0a399c25299ad1b2fb5df8512ba3888661046 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -532,6 +532,13 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v4,
 };
 
+static const struct qcom_edp_phy_cfg qcs8300_dp_phy_cfg = {
+	.is_edp = false,
+	.aux_cfg = edp_phy_aux_cfg_v5,
+	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
+	.ver_ops = &qcom_edp_phy_ops_v4,
+};
+
 static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
 	.is_edp = false,
 	.aux_cfg = edp_phy_aux_cfg_v5,
@@ -1133,6 +1140,7 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_edp_phy_match_table[] = {
+	{ .compatible = "qcom,qcs8300-edp-phy", .data = &qcs8300_dp_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
 	{ .compatible = "qcom,sc7280-edp-phy", .data = &sc7280_dp_phy_cfg, },
 	{ .compatible = "qcom,sc8180x-edp-phy", .data = &sc7280_dp_phy_cfg, },

-- 
2.34.1


