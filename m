Return-Path: <linux-arm-msm+bounces-64838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 933BFB0426E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 17:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DF7E3A67B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 15:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6224A25E814;
	Mon, 14 Jul 2025 14:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aJAyI15a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F42F25C804;
	Mon, 14 Jul 2025 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505180; cv=none; b=PMk+Dp8xswF+AWrIiBSD4YPOOIafzjCTYZbljboZHZiZbnmDxCwvxuPLvKG/F0kBZW62Ngw3lPpUTwc7NeQWz6wy/uyMLIUerGPv5c5JcQBdK8f9SM7h6afP+/d0YLr2I592l7hmePXTxY0T73HfK1pyoOFjSTahtvi0BdxYeEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505180; c=relaxed/simple;
	bh=Sf+4eY2bRsCMo0zv2ROC1H3bQJQUZwTqapVWUaGcPyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ckBFj8FHg8JFOlHlhCaeNfgWu918kP+yNZk+qgD9AjSCgWGcm15jrON+xLwi3ySHmDyc2YofFHZ50h05yuYLXekeJTIJIfhV3+/ec3ly5yEyn4IZydtJR+o5oBphJmGEz2AQRJpoYIg2rqXN6iYH54+3FsJVtM4o7CMTTCnAsEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aJAyI15a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EC3LgK000797;
	Mon, 14 Jul 2025 14:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aze+Cds7D/XOCL4YrNJPzNJdEgywaovIlQABSpTXB/c=; b=aJAyI15avZ8sW0ug
	/4uYO5YaOSIRjaFSY0y1ysasVC7Oho2qy1SXy/yAGpJ5Zqiq/FXp+LfHrdL1zQ6C
	nFtgDy/4TDN/bM62VE22Kt3sqpPJJePa5AW9wN7MWBhbstK/Xf7XABIwF0vKl7kW
	5ERwOTQA5IfU7aFtWxyqe3ZJ7WmtGn53d4+Ktq4N1zTOi3z7Pdfv9fiRaxgROhSv
	gAs/ESQoHgN92C3j2+8ivVQSDJ5GFI2gLYU+OknjgddQH5gszso2H9Vy9yboECl6
	8lanxkiIxTT/Y/fb4DcYQOAwJt/ncNuXq1FdaxhDFztpRwpKy801JPyfghCNH3cv
	ckjwdQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vvay1kyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 14:59:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56EExPG9004124
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 14:59:25 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 14 Jul 2025 07:59:22 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Mon, 14 Jul 2025 22:58:57 +0800
Subject: [PATCH net-next v2 3/3] net: phy: qcom: qca807x: Support PHY
 counter
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250714-qcom_phy_counter-v2-3-94dde9d9769f@quicinc.com>
References: <20250714-qcom_phy_counter-v2-0-94dde9d9769f@quicinc.com>
In-Reply-To: <20250714-qcom_phy_counter-v2-0-94dde9d9769f@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752505154; l=2565;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=Sf+4eY2bRsCMo0zv2ROC1H3bQJQUZwTqapVWUaGcPyI=;
 b=76PkpLdc11Yo0o1dp4xRksC2SVnQqVUXk4/BeZAoKNUP3iNWaZfkhNMJ/yO6Ub4kYt+qLNaTf
 g8Kmo9/g59jDAReYVAbmdyYicSP2kAPSUUu4N3XWLMmYD7IIlAHpw8m
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4wQZe1e_bO5gppnJxWI3JxbCyLhImKBx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA4OCBTYWx0ZWRfX8qSi0XNmWyHi
 sYBxTH03cOC+jJytomVUnj7oWi/gqcxQcnO/KJV1BPyabuHBI8ucFaGYBlyiixUqGH9kWdx3tKG
 8dJXf0dQYKCQuQYURbUmWodM4WbIIOxyaUv/JZVuNgZBGqIKaCSA1wZTrrqjKrD3oyXihFDkx84
 hfONAKsYKnWlkXpV40vN6t/ocxIKuH0kFnHZxO/GeCdsnr0gX0Nx3rUy4vo+uapEaEWCnq7+mIz
 ZGAAlDj0WNFLOjqg39z7lckXJxmXg6iYX+I63TYJ+GxFdFxVJcUoGkrAJVXP1ENbo2aaHBpwzfH
 6EXO4+rJDFN0bVQwXJFuQ7jbmhyONQ0K9aBo1heEsM/XJSXsYeReAVsrnxExLFEm43MYOq+yB1/
 OhyetIQp4SLCXvMYlkOKgwD7T3dclP1Izj6Bt0kuxpz5Y01IfyRih0K/fWhc8B+lfkVSQ9Bq
X-Authority-Analysis: v=2.4 cv=GNIIEvNK c=1 sm=1 tr=0 ts=68751b4d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=uQsTNyxmMXL8gVczaX4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4wQZe1e_bO5gppnJxWI3JxbCyLhImKBx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140088

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


