Return-Path: <linux-arm-msm+bounces-63519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E42AF7376
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 14:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57C9A5609FF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 12:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0781B2E4991;
	Thu,  3 Jul 2025 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IKdwTdvu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DF82E3AFF;
	Thu,  3 Jul 2025 12:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544899; cv=none; b=i5zeX9KEAmkVwRobq60F8fYG4QMj0NtuKzT1kJVXIIKThbhGiPNo+oC3Tcxozg6XqKxZ67wBaLFTB8q8MubyBie2fdSuHE0n1M0hAoUaBKZpOSx1XTzrhH4ZRVjbIvf+Bn7X1qpwqYsC3fv5xAAEQzLUd2uuIZcEcIaIxfT3VzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544899; c=relaxed/simple;
	bh=Wry0WOWGUuKjqxJHJc64nYIagLBcxZ+O8R0+ylovNQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dQEfAydqZ597w8NaeoPWGH7BoeloPql6dWF2peV+wLv17g7YG0OTxsvzos/qLpoM6rEjRzW68lqsJuyndfcZR7kP/m7+K4cPToz16rL9gsA9rRyxSzh9OxA4aPxYPmMt6rj+zStZ7T/SEW1izfcSYVNR63knStRzqwg6xqaKWcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IKdwTdvu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563B8sVp025180;
	Thu, 3 Jul 2025 12:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2uqyRLg0iW69d7i3Rn1FEm6miIh83Z7StHixR42+gHI=; b=IKdwTdvuEqmxZIWm
	mjKosBZ59hy4ik7Rcl5TDXQ7DXAqQp6xCuehNPj89rBHY2OKRT3yJE9IkfaAhYwK
	dBALElIffJ7IPATftNJxZlYbZy9+6OSqCygwtwLHmsEVTw/n9sFrWf2wmPT+tOGv
	1ASzjUdTTeVklsiLdpfL3h/Nq/C2/4Xcyr5OFWc6KjaPEM7H8x+y3haKSPt/2typ
	z4gPDXprZsoyiKx7/Y2ByEkzs6aAE8iZy2L8o+vFhuXcHEZO94uG0BbUwijD2yyD
	/fibo1C4Se3iuVUXv8BxDwqEQMLTFOH50AGMepdvlK01KedIrQzYu2OZl7Au5/qI
	tgmBYA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64wg9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 12:14:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563CEidg031556
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 12:14:44 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 05:14:40 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Thu, 3 Jul 2025 20:14:28 +0800
Subject: [PATCH net-next 1/3] net: phy: qcom: move the WoL function to
 shared library
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250703-qcom_phy_wol_support-v1-1-83e9f985b30a@qti.qualcomm.com>
References: <20250703-qcom_phy_wol_support-v1-0-83e9f985b30a@qti.qualcomm.com>
In-Reply-To: <20250703-qcom_phy_wol_support-v1-0-83e9f985b30a@qti.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>,
        Viorel Suman <viorel.suman@nxp.com>, Li Yang
	<leoyang.li@nxp.com>,
        Wei Fang <wei.fang@nxp.com>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Luo Jie <luoj@qti.qualcomm.com>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751544877; l=3766;
 i=luoj@qti.qualcomm.com; s=20250209; h=from:subject:message-id;
 bh=Wry0WOWGUuKjqxJHJc64nYIagLBcxZ+O8R0+ylovNQU=;
 b=nDy/pEt5EK/t2SzDVUTKsNdtMMxeBRCCnxn7PC3gYNW+e0C+NT1HxjA/A4MgjaBOK8OiEnoEV
 rx06DDwHv6qDEzH6tD+UttrTeVry+MyRWdb1o4PmhpDHd+Ysh0PxZv2
X-Developer-Key: i=luoj@qti.qualcomm.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=68667435 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=_nt0bXS9cE6sRtUw5vwA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwMSBTYWx0ZWRfX/pSvrK9qb+T9
 TzpPQxWphE/bp4TMJRAgFe9iBreE7DaAxQUm7/2tTbfGPsQBS1WkDIIkDei46qlkFem3N+gt4c5
 S+ckkG7Dqi1poThYAvZv3DvnAUq994igNWOPJRCgQ/tGnqtdDvg+94nUwSyQj4LbM/B8Bk+J4xH
 U9O13gMVdw1qucbhIin2Atbh75A+3HFeND++9JD7/lb8Tpi52+efgMt3d+aH4Io+Gn2m9/G3o6y
 4Ipz1SnOGnOOmxo+XTVxK2KEnPWkz5UUVNGRuor0yYsWxdRX0AMIDoW6DOCTdceTfguApuwesJm
 +AZclrrnhnqt400mv7j/MeSOQyB2oaTl98neotUAt2ILgUr7/uGY1oJc98SqLOuKXYwiT2zAsrN
 +I5g4g97j8VaCrxsYsbXl3hZBEBT5yepFSLFZ4GDbOBovlUcZBBrUxiC9VPjV7DRG4aH8W+a
X-Proofpoint-GUID: xXVD1tePrIhgNGm_8BvgNnQ9OfW0sOaz
X-Proofpoint-ORIG-GUID: xXVD1tePrIhgNGm_8BvgNnQ9OfW0sOaz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030101

Move the WoL (Wake-on-LAN) functionality to a shared library to enable
its reuse by the QCA808X PHY driver, incorporating support for WoL
functionality similar to the implementation in at8031_set_wol().

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/phy/qcom/at803x.c       | 27 ---------------------------
 drivers/net/phy/qcom/qcom-phy-lib.c | 25 +++++++++++++++++++++++++
 drivers/net/phy/qcom/qcom.h         |  5 +++++
 3 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index 43e604171828..51a132242462 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -27,9 +27,6 @@
 
 #define AT803X_LED_CONTROL			0x18
 
-#define AT803X_PHY_MMD3_WOL_CTRL		0x8012
-#define AT803X_WOL_EN				BIT(5)
-
 #define AT803X_REG_CHIP_CONFIG			0x1f
 #define AT803X_BT_BX_REG_SEL			0x8000
 
@@ -916,30 +913,6 @@ static int at8031_config_init(struct phy_device *phydev)
 	return at803x_config_init(phydev);
 }
 
-static int at8031_set_wol(struct phy_device *phydev,
-			  struct ethtool_wolinfo *wol)
-{
-	int ret;
-
-	/* First setup MAC address and enable WOL interrupt */
-	ret = at803x_set_wol(phydev, wol);
-	if (ret)
-		return ret;
-
-	if (wol->wolopts & WAKE_MAGIC)
-		/* Enable WOL function for 1588 */
-		ret = phy_modify_mmd(phydev, MDIO_MMD_PCS,
-				     AT803X_PHY_MMD3_WOL_CTRL,
-				     0, AT803X_WOL_EN);
-	else
-		/* Disable WoL function for 1588 */
-		ret = phy_modify_mmd(phydev, MDIO_MMD_PCS,
-				     AT803X_PHY_MMD3_WOL_CTRL,
-				     AT803X_WOL_EN, 0);
-
-	return ret;
-}
-
 static int at8031_config_intr(struct phy_device *phydev)
 {
 	struct at803x_priv *priv = phydev->priv;
diff --git a/drivers/net/phy/qcom/qcom-phy-lib.c b/drivers/net/phy/qcom/qcom-phy-lib.c
index d28815ef56bb..af7d0d8e81be 100644
--- a/drivers/net/phy/qcom/qcom-phy-lib.c
+++ b/drivers/net/phy/qcom/qcom-phy-lib.c
@@ -115,6 +115,31 @@ int at803x_set_wol(struct phy_device *phydev,
 }
 EXPORT_SYMBOL_GPL(at803x_set_wol);
 
+int at8031_set_wol(struct phy_device *phydev,
+		   struct ethtool_wolinfo *wol)
+{
+	int ret;
+
+	/* First setup MAC address and enable WOL interrupt */
+	ret = at803x_set_wol(phydev, wol);
+	if (ret)
+		return ret;
+
+	if (wol->wolopts & WAKE_MAGIC)
+		/* Enable WOL function for 1588 */
+		ret = phy_modify_mmd(phydev, MDIO_MMD_PCS,
+				     AT803X_PHY_MMD3_WOL_CTRL,
+				     0, AT803X_WOL_EN);
+	else
+		/* Disable WoL function for 1588 */
+		ret = phy_modify_mmd(phydev, MDIO_MMD_PCS,
+				     AT803X_PHY_MMD3_WOL_CTRL,
+				     AT803X_WOL_EN, 0);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(at8031_set_wol);
+
 void at803x_get_wol(struct phy_device *phydev,
 		    struct ethtool_wolinfo *wol)
 {
diff --git a/drivers/net/phy/qcom/qcom.h b/drivers/net/phy/qcom/qcom.h
index 4bb541728846..7f7151c8baca 100644
--- a/drivers/net/phy/qcom/qcom.h
+++ b/drivers/net/phy/qcom/qcom.h
@@ -172,6 +172,9 @@
 #define AT803X_LOC_MAC_ADDR_16_31_OFFSET	0x804B
 #define AT803X_LOC_MAC_ADDR_32_47_OFFSET	0x804A
 
+#define AT803X_PHY_MMD3_WOL_CTRL		0x8012
+#define AT803X_WOL_EN				BIT(5)
+
 #define AT803X_DEBUG_ADDR			0x1D
 #define AT803X_DEBUG_DATA			0x1E
 
@@ -215,6 +218,8 @@ int at803x_debug_reg_mask(struct phy_device *phydev, u16 reg,
 int at803x_debug_reg_write(struct phy_device *phydev, u16 reg, u16 data);
 int at803x_set_wol(struct phy_device *phydev,
 		   struct ethtool_wolinfo *wol);
+int at8031_set_wol(struct phy_device *phydev,
+		   struct ethtool_wolinfo *wol);
 void at803x_get_wol(struct phy_device *phydev,
 		    struct ethtool_wolinfo *wol);
 int at803x_ack_interrupt(struct phy_device *phydev);

-- 
2.34.1


