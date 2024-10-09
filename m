Return-Path: <linux-arm-msm+bounces-33733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8299997608
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 21:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3093CB21958
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 19:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC59F1E32B6;
	Wed,  9 Oct 2024 19:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NGY4W356"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD721E1A12;
	Wed,  9 Oct 2024 19:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728503685; cv=none; b=atE6J77unVG99ahxPmqg8ONe9MxlPbB4tz02FTCV0MO8iirK0vCLqwdzTuHecGZ/3+BW8YTqrXP4ZUPrFJkr8vbub+XbJAiDcq8oSmF4jT/ubi8oWy5Ax/OF6c3aNei8OPq1A2l1OjgCRmL86qhFLNHKm7wuxOH2r6v8sELa2Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728503685; c=relaxed/simple;
	bh=W6At72j7D/gplqLmsCssspdheUj+0h5bwZiyfuILhPU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H2qUtfjQOMZspRmvJ48tTcfb+e8lY3AFxzOqeeHV4yTWWque8LNkDJ7Zs+LOh1OjecLBN1aoGiM/C75Jut6Bx0KlPiqCr3lXdtg7XQjqPzrsfkaNY9hqbXBBJ9aTLSDHyRYpwL/AAOCjMI3EoBGkukHaZpcI+gSIG8ii2oeAO7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NGY4W356; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499HwBQX016441;
	Wed, 9 Oct 2024 19:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cj2LoH0vOVR3Cqlt1mCbnNmmieEOjT4Oxsh6eILS1JE=; b=NGY4W356ohrrUSrL
	bn8OqkQnDPAt4lkpVXzGVt7dPhuRRtNiYi4wzqpCRT0qHWs+j7h6goCUEX22Mlo0
	7vcxZ4UJ7s4ONMT2iV2qmeedivO7ZNYStTOy8BYZi+iDMV8npLsieQ0GB2jM5nHH
	3THm1H6i5kNYViJ7zRKZYQOR+LwHcl+x5kRkKm7h1prv7wvljEx1R5XThWgtJX2y
	DX4zB3y6GWXK90RaxXjFGnN8OYq7AdCNVKQIIuf6ELrOOBWlZbOawEJPLm+0f6r9
	9+lPtzpgLL5Th7cRMz6zONihMp5BiNUx4J7GNpw2MYCzz1scq+P2ptBgD0gZ9BGr
	U2gEpw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425xptr9u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 19:54:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 499JsY4T028413
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 19:54:34 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 12:54:28 -0700
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Mantas Pucka <mantas@8devices.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH 4/4] phy: qcom: qmp: Add qmp configuration for QCS8300
Date: Thu, 10 Oct 2024 01:23:48 +0530
Message-ID: <20241009195348.2649368-5-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009195348.2649368-1-quic_kriskura@quicinc.com>
References: <20241009195348.2649368-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LC3XUC_x99BKnhR7scv_r8UnWLnaaLu8
X-Proofpoint-GUID: LC3XUC_x99BKnhR7scv_r8UnWLnaaLu8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410090124

Add qmp configuration for QCS8300. It is similar to SA8775P and
SC8280XP except for some Lane configuration settings specific to
QCS8300.

Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 65 +++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 2fd49355aa37..a8f90159395f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -871,6 +871,16 @@ static const struct qmp_phy_init_tbl sdx75_usb3_uniphy_pcs_usb_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
 };
 
+static const struct qmp_phy_init_tbl qcs8300_usb3_uniphy_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0xa5),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_2, 0xf2),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_3, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_4, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PI_QEC_CTRL, 0x21),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x0e),
+};
+
 static const struct qmp_phy_init_tbl sm8350_usb3_uniphy_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0xa5),
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_2, 0x82),
@@ -989,6 +999,40 @@ static const struct qmp_phy_init_tbl sc8280xp_usb3_uniphy_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x0e),
 };
 
+static const struct qmp_phy_init_tbl qcs8300_usb3_uniphy_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH4, 0xec),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0xbd),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH2, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_LOW, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH4, 0xa9),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH3, 0x7b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH2, 0xe4),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_LOW, 0x64),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CONTROLS, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_GAIN1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_GAIN2, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FO_GAIN, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL1, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x47),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_GAIN, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_GM_CAL, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_ENABLES, 0x00),
+};
+
 static const struct qmp_phy_init_tbl sc8280xp_usb3_uniphy_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH4, 0xdc),
 	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0xbd),
@@ -1462,6 +1506,24 @@ static const struct qmp_phy_cfg sa8775p_usb3_uniphy_cfg = {
 	.regs			= qmp_v5_usb3phy_regs_layout,
 };
 
+static const struct qmp_phy_cfg qcs8300_usb3_uniphy_cfg = {
+	.offsets		= &qmp_usb_offsets_v5,
+
+	.serdes_tbl		= sc8280xp_usb3_uniphy_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sc8280xp_usb3_uniphy_serdes_tbl),
+	.tx_tbl			= qcs8300_usb3_uniphy_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(qcs8300_usb3_uniphy_tx_tbl),
+	.rx_tbl			= qcs8300_usb3_uniphy_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(qcs8300_usb3_uniphy_rx_tbl),
+	.pcs_tbl		= sa8775p_usb3_uniphy_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sa8775p_usb3_uniphy_pcs_tbl),
+	.pcs_usb_tbl		= sa8775p_usb3_uniphy_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(sa8775p_usb3_uniphy_pcs_usb_tbl),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= qmp_v5_usb3phy_regs_layout,
+};
+
 static const struct qmp_phy_cfg sc8280xp_usb3_uniphy_cfg = {
 	.offsets		= &qmp_usb_offsets_v5,
 
@@ -2246,6 +2308,9 @@ static const struct of_device_id qmp_usb_of_match_table[] = {
 	}, {
 		.compatible = "qcom,msm8996-qmp-usb3-phy",
 		.data = &msm8996_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,qcs8300-qmp-usb3-uni-phy",
+		.data = &qcs8300_usb3_uniphy_cfg,
 	}, {
 		.compatible = "qcom,qdu1000-qmp-usb3-uni-phy",
 		.data = &qdu1000_usb3_uniphy_cfg,
-- 
2.34.1


