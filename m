Return-Path: <linux-arm-msm+bounces-37569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BED59C51A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 10:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FB9A1F23211
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 09:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77E620D4E2;
	Tue, 12 Nov 2024 09:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T2JvWglI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CE720C02B;
	Tue, 12 Nov 2024 09:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731402877; cv=none; b=RXwJPaFrR3h+YM63VKOdXQ8xyWAhwaWgHskd/SOUKv5ceFtpdRGo6mZnOI2aDILdSSFoWL3oCx3762JJjK8Eo+BEx/zPcKgS8lxoDFS4E0Pzc0lhhZqSY8HtJKytSFYSRNTk+5k/0xx5AGmJNbEamqo7SSt8jtwMI3wzs8vCtiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731402877; c=relaxed/simple;
	bh=UDAErwtmaP77pglufnbveBAI/W3/wA3e7h4ZWten144=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qLnxUfW0ayeeygb0yUCYsYOaB5RyVADpLPliMM1mA5w7AytpVveVT0bA0L7bFduCC8RGhUwdFJ956yB+0N7UWLhLwGngyEHTq+K3PI4TYkV2Rlvc5gFb+0tVTfJnOGnfqdddsYqtaEGKP6rhBy0B1EnZGAny8ba9NsufIl6+vDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T2JvWglI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC6YfY2005225;
	Tue, 12 Nov 2024 09:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A+hDc9FTcRASvSbQfTvGU3qPuDSK3ngMCagsyPF7nKY=; b=T2JvWglIfRM5DDKK
	7VhcmCD0tiB1Zb3j6iRk7ZcMplWlknhJN78xOdayaPDmOr5nQzbMaH6iQdwC1an1
	b4IBOal/GU1VhQ7bYSqixap2SsCP+KqqLSDNLt5k0fgAjP5GDgnPuUWF65trphBN
	gf++9TZyIS89oiDiLYJzpMWQ3mr+8AxippOeoB2Cj/uFJwnaHd3yanDO4J4OjxNi
	kaIngFIkho1Aq8C4KwdEzrcMqCzsT0XOvOcrC6cG8K8JJWB0vLOA0zjVWRAPJLz4
	BFP6seZ5ZwmzBCUs5/jRAIEdMTwKLevb2MA4LUCvK0jZSFSce7eO/8D2dgzk1h0y
	CHdcjA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v1vfrcvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 09:14:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC9ERdC025398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 09:14:27 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 01:14:20 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <mantas@8devices.com>, <quic_rohiagar@quicinc.com>,
        <johan+linaro@kernel.org>, <quic_kriskura@quicinc.com>,
        <abel.vesa@linaro.org>, <quic_kbajaj@quicinc.com>,
        <quic_wcheng@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v1 2/6] phy: qcom-qusb2: add QUSB2 support for IPQ5424
Date: Tue, 12 Nov 2024 14:43:51 +0530
Message-ID: <20241112091355.2028018-3-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112091355.2028018-1-quic_varada@quicinc.com>
References: <20241112091355.2028018-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jA5biYlQjgkz0JwawEUVQCQWwxe4neNx
X-Proofpoint-ORIG-GUID: jA5biYlQjgkz0JwawEUVQCQWwxe4neNx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120075

Add the phy init sequence for the Super Speed ports found
on IPQ5424.

Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index c52655a383ce..4513f0c81c50 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -151,6 +151,21 @@ static const struct qusb2_phy_init_tbl ipq6018_init_tbl[] = {
 	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9F),
 };
 
+static const struct qusb2_phy_init_tbl ipq5424_init_tbl[] = {
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL, 0x14),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0x00),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0x53),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0xC3),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TUNE, 0x30),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL1, 0x79),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL2, 0x21),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE5, 0x00),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_PWR_CTRL, 0x00),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TEST2, 0x14),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TEST, 0x80),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9F),
+};
+
 static const unsigned int ipq6018_regs_layout[] = {
 	[QUSB2PHY_PLL_STATUS]              = 0x38,
 	[QUSB2PHY_PORT_TUNE1]              = 0x80,
@@ -331,6 +346,16 @@ static const struct qusb2_phy_cfg ipq6018_phy_cfg = {
 	.autoresume_en   = BIT(0),
 };
 
+static const struct qusb2_phy_cfg ipq5424_phy_cfg = {
+	.tbl            = ipq5424_init_tbl,
+	.tbl_num        = ARRAY_SIZE(ipq5424_init_tbl),
+	.regs           = ipq6018_regs_layout,
+
+	.disable_ctrl   = POWER_DOWN,
+	.mask_core_ready = PLL_LOCKED,
+	.autoresume_en   = BIT(0),
+};
+
 static const struct qusb2_phy_cfg qusb2_v2_phy_cfg = {
 	.tbl		= qusb2_v2_init_tbl,
 	.tbl_num	= ARRAY_SIZE(qusb2_v2_init_tbl),
@@ -905,6 +930,9 @@ static const struct phy_ops qusb2_phy_gen_ops = {
 
 static const struct of_device_id qusb2_phy_of_match_table[] = {
 	{
+		.compatible	= "qcom,ipq5424-qusb2-phy",
+		.data		= &ipq5424_phy_cfg,
+	}, {
 		.compatible	= "qcom,ipq6018-qusb2-phy",
 		.data		= &ipq6018_phy_cfg,
 	}, {
-- 
2.34.1


