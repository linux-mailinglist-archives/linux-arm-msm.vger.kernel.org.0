Return-Path: <linux-arm-msm+bounces-65028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B924B05854
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 13:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00D3A188AD41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 11:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609C52DCF5D;
	Tue, 15 Jul 2025 11:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NBEy4Tsx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FC12DA748;
	Tue, 15 Jul 2025 11:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752577390; cv=none; b=XfD/F9evOJQe+aRqdiozNfu2ukeIXLcuYlZsGxoojduXZT5apQw3+FzY55bZp2hXjBrJceVgck+0h7XyvmChuIsMoJVOvKEbBmqk5xqqHXzOpyOj7ShpWXWn/DqcImJwMF4JDfBPaEY2d2gdpN9wew/R3h7fWUfbf4QYdhLQROs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752577390; c=relaxed/simple;
	bh=Sf+4eY2bRsCMo0zv2ROC1H3bQJQUZwTqapVWUaGcPyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=k2POc9FtoVQFZvdJQwnTMFqwT0d7xbfO+OlcEAUK+cNbYujxTXlQ4nuZNEdlofldTuF28Iunp694gIjaMj040/1CWcAly2asg+IrOf7z5ERXZeX2a56EeWJI11RF9xYgFaGRTBlDknn7IKGfn11S1BVXrqYKrRji+4FAzrqeGuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NBEy4Tsx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F3kJw3004376;
	Tue, 15 Jul 2025 11:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aze+Cds7D/XOCL4YrNJPzNJdEgywaovIlQABSpTXB/c=; b=NBEy4TsxxXLG6Knm
	pi1JfQDXc7R0AgOq98yGnW4tLefmWjC1fMpg6qSL42zoIv18je4dNjW7r7O2K6Xx
	tJaZsleTorjbd27MEifabTnHq6MBQ+iy7d2g9DPxBB0Trug5hR8KFHuhRuh0bifX
	1nBv0dFKpjALr+BfD3Gp/u1GVED3o9JJC37RAaulQk925Td7GtIjNI2vAoLAwkIu
	27oMOeWwJKhcfik6dpAiDyJKsA0Z2Xl12pQWbd4Du4O6qcvCuNu3N0wFdPpzrWcD
	6FpEA7VqZEpFItcQEX+ozaMQTbd3+i8HefbO2CPfliikK5wBgpCgF1LYqV+SoUfa
	AfjOcQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca174k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 11:02:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56FB2m9B004036
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 11:02:48 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 15 Jul 2025 04:02:45 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 15 Jul 2025 19:02:28 +0800
Subject: [PATCH net-next v3 3/3] net: phy: qcom: qca807x: Support PHY
 counter
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250715-qcom_phy_counter-v3-3-8b0e460a527b@quicinc.com>
References: <20250715-qcom_phy_counter-v3-0-8b0e460a527b@quicinc.com>
In-Reply-To: <20250715-qcom_phy_counter-v3-0-8b0e460a527b@quicinc.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Luo Jie <quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752577357; l=2565;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=Sf+4eY2bRsCMo0zv2ROC1H3bQJQUZwTqapVWUaGcPyI=;
 b=e2kqQpb8QEJ8Mz3v3ZX0gatUwTbnWfVKkg60/fMKvwW+mEN2RyfeKZarMhoroA0IJ4E4yFsBq
 zVN5xZptfkIB2SEjiRzrWqnoOgMHh5u5g5U5SMST5K9Du92fp6SuqeL
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEwMCBTYWx0ZWRfXxMIXnoxa7arK
 LzTV4fFYhRvKhBeyCEk5oEYXA202zSg8LNwwOW4ob1ic2Gqd/Uhni+TlmYYWq9FSfC7a7W0iN37
 vOJVa2LmjNVFCjNIQQkSQumqOpVS1I8GVnr7xIMG1Z59qymcDxOKB6bX84u3Nj/enxnlY4hChXD
 uCPZ58L+vAWCogqqQPifVrWsgAMm9P/d36lNj+McTHVk5BOINRj9jWn6GsUUwEO7SHa8l30dWGD
 xRrrHbDseFJJqiFo2G0GVe+4Ev0JqkIWGU3GBBmOE/g8XMHAa/NStuxgRBZ4uCySCcElWUb0DeH
 5A780DhgNAiT9C/e2KHPe2tFpUkNUEagsns+Cg127lZNg19C1QwSu3uYj9PRXntEQ3QUM2bIk9L
 5SM1Romc4jO8KMCvPiLKrxoE01XHHI1JN9xao4WoIy7xq7RBKksynmXaVZX0vs0Ugh+yOOyj
X-Proofpoint-GUID: jrHqGPJ8yxOx94DszffTTYYr4D4HubzM
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=68763559 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=uQsTNyxmMXL8gVczaX4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jrHqGPJ8yxOx94DszffTTYYr4D4HubzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150100

Within the QCA807X PHY operation's config_init() function, enable CRC
checking for received and transmitted frames and configure counter to
clear after being read to support counter recording. Additionally, add
support for PHY counter operations.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/phy/qcom/qca807x.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 6d10ef7e9a8a..291f052ea53c 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -124,6 +124,7 @@ struct qca807x_priv {
 	bool dac_full_amplitude;
 	bool dac_full_bias_current;
 	bool dac_disable_bias_current_tweak;
+	struct qcom_phy_hw_stats hw_stats;
 };
 
 static int qca807x_cable_test_start(struct phy_device *phydev)
@@ -768,6 +769,10 @@ static int qca807x_config_init(struct phy_device *phydev)
 			return ret;
 	}
 
+	ret = qcom_phy_counter_config(phydev);
+	if (ret)
+		return ret;
+
 	control_dac = phy_read_mmd(phydev, MDIO_MMD_AN,
 				   QCA807X_MMD7_1000BASE_T_POWER_SAVE_PER_CABLE_LENGTH);
 	control_dac &= ~QCA807X_CONTROL_DAC_MASK;
@@ -782,6 +787,22 @@ static int qca807x_config_init(struct phy_device *phydev)
 			     control_dac);
 }
 
+static int qca807x_update_stats(struct phy_device *phydev)
+{
+	struct qca807x_priv *priv = phydev->priv;
+
+	return qcom_phy_update_stats(phydev, &priv->hw_stats);
+}
+
+static void qca807x_get_phy_stats(struct phy_device *phydev,
+				  struct ethtool_eth_phy_stats *eth_stats,
+				  struct ethtool_phy_stats *stats)
+{
+	struct qca807x_priv *priv = phydev->priv;
+
+	qcom_phy_get_stats(stats, priv->hw_stats);
+}
+
 static struct phy_driver qca807x_drivers[] = {
 	{
 		PHY_ID_MATCH_EXACT(PHY_ID_QCA8072),
@@ -800,6 +821,8 @@ static struct phy_driver qca807x_drivers[] = {
 		.suspend	= genphy_suspend,
 		.cable_test_start	= qca807x_cable_test_start,
 		.cable_test_get_status	= qca808x_cable_test_get_status,
+		.update_stats		= qca807x_update_stats,
+		.get_phy_stats		= qca807x_get_phy_stats,
 	},
 	{
 		PHY_ID_MATCH_EXACT(PHY_ID_QCA8075),
@@ -823,6 +846,8 @@ static struct phy_driver qca807x_drivers[] = {
 		.led_hw_is_supported = qca807x_led_hw_is_supported,
 		.led_hw_control_set = qca807x_led_hw_control_set,
 		.led_hw_control_get = qca807x_led_hw_control_get,
+		.update_stats		= qca807x_update_stats,
+		.get_phy_stats		= qca807x_get_phy_stats,
 	},
 };
 module_phy_driver(qca807x_drivers);

-- 
2.34.1


