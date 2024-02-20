Return-Path: <linux-arm-msm+bounces-11761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFCA85B21A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 06:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72F01B20EE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 05:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E645482D1;
	Tue, 20 Feb 2024 05:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GO/vQvx9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79145481B3;
	Tue, 20 Feb 2024 05:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708405699; cv=none; b=l6h1NatCkCAWqNIwKsaPsZQpJ1zGnYwtyZ+kHULBc+Ny1Xrv9MbKgJ6Eyn99eNXpNlXsHpnFcp8Vief55yY9jLjSVT5fh++6f2hRbi3cQ6hrml78a9MjmPITWCfspuXEYIUMbfI1IFUcrK7LarV9Q82Ag1YcHaC6F92IUCCLfVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708405699; c=relaxed/simple;
	bh=OOQts34tAdzeELzHw+Ngbf4pg4xCendhnsfyqCJ9JAc=;
	h=From:To:Cc:Subject:Date:Message-Id; b=MkMUUU7uU+olz8E1rF7/ywYwz7kx2Z9osuFgSA/BXZUwoomK49zUIcxOFB8fIGr2Ovh//81cXrbVI8pagSWHCCUgmaOSNCs1a6yr8Dlzj7aaZZoQSxLq4rJJna7bu1ooVQ2CroIpKOV6rQrBGlpbACKHeEPPSEyY8RkhcWcijA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GO/vQvx9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41K4kSDM024893;
	Tue, 20 Feb 2024 05:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id; s=qcppdkim1; bh=MhtlekRsepEl
	CIsKwt+ETmTkwwxR1cINhfvJXfVw7aU=; b=GO/vQvx9SXK9PrwyrPdfLbcOwIni
	lA9MXRxuS6GRGBo/DIQtGgGCxWE4P30cLD0iqU0N44f312Ic1LphWfh4U7x1Igho
	LqQ7JEBgIIWwR/PzbbOTbe+DuBpNU6p4Eym4DTlQHNKAtqMhgmrxMN8u/rhb7hNC
	MR1v3j9MlLWkjGaq8N7nED3+6SwEN0gZIoDnYuJPywmcajaLBAhCtJikWwfZphwn
	S1Kotu8NKnQHFq0wR9SCks4acE/WUwymoKBFQR4m6SxDO/hRXJKwfbbURfRN8zpt
	wtbyH7zSHOBzRRlar/fStSCxW9p09p13TUMhYNuyASfYTuiBYLUv9qAkHA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wcnbd80x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 05:07:53 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 41K56ZaB032676;
	Tue, 20 Feb 2024 05:07:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3wanvkbfmx-1;
	Tue, 20 Feb 2024 05:07:48 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41K57mlP000910;
	Tue, 20 Feb 2024 05:07:48 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-snehshah-hyd.qualcomm.com [10.147.246.35])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 41K57mPg000907;
	Tue, 20 Feb 2024 05:07:48 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2319345)
	id 454B15013A6; Tue, 20 Feb 2024 10:37:47 +0530 (+0530)
From: Sneh Shah <quic_snehshah@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Sneh Shah <quic_snehshah@quicinc.com>, kernel@quicinc.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH net-next v5] net: stmmac: dwmac-qcom-ethqos: Add support for 2.5G SGMII
Date: Tue, 20 Feb 2024 10:37:35 +0530
Message-Id: <20240220050735.29507-1-quic_snehshah@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gxu3sjaCAaaVmTgWOtimBZ76QZLeF7Zl
X-Proofpoint-ORIG-GUID: gxu3sjaCAaaVmTgWOtimBZ76QZLeF7Zl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_04,2024-02-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1011
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402200034
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Serdes phy needs to operate at 2500 mode for 2.5G speed and 1000
mode for 1G/100M/10M speed.
Added changes to configure serdes phy and mac based on link speed.
Changing serdes phy speed involves multiple register writes for
serdes block. To avoid redundant write operations only update serdes
phy when new speed is different.
For 2500 speed MAC PCS autoneg needs to disabled. Added changes to
disable MAC PCS autoneg if ANE parameter is not set.

Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
---
v5 changelog:
- Updated commit message with more details on MAC PCS autoneg disable
v4 changelog:
- Made cosmetic changes
v3 changelog:
- updated commit message
---
v2 changelog:
- updated stmmac_pcs_ane to support autoneg disable
- Update serdes speed to 1000 for 100M and 10M also---
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 26 +++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 31631e3f89d0..6bbdbb7bef44 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -106,6 +106,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	unsigned int speed;
+	int serdes_speed;
 	phy_interface_t phy_mode;
 
 	const struct ethqos_emac_por *por;
@@ -606,19 +607,39 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
  */
 static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 {
+	struct net_device *dev = platform_get_drvdata(ethqos->pdev);
+	struct stmmac_priv *priv = netdev_priv(dev);
 	int val;
 
 	val = readl(ethqos->mac_base + MAC_CTRL_REG);
 
 	switch (ethqos->speed) {
+	case SPEED_2500:
+		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
+		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
+			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
+			      RGMII_IO_MACRO_CONFIG2);
+		if (ethqos->serdes_speed != SPEED_2500)
+			phy_set_speed(ethqos->serdes_phy, SPEED_2500);
+		ethqos->serdes_speed = SPEED_2500;
+		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 0, 0, 0);
+		break;
 	case SPEED_1000:
 		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
+		if (ethqos->serdes_speed != SPEED_1000)
+			phy_set_speed(ethqos->serdes_phy, SPEED_1000);
+		ethqos->serdes_speed = SPEED_1000;
+		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
 		break;
 	case SPEED_100:
 		val |= ETHQOS_MAC_CTRL_PORT_SEL | ETHQOS_MAC_CTRL_SPEED_MODE;
+		if (ethqos->serdes_speed != SPEED_1000)
+			phy_set_speed(ethqos->serdes_phy, SPEED_1000);
+		ethqos->serdes_speed = SPEED_1000;
+		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
 		break;
 	case SPEED_10:
 		val |= ETHQOS_MAC_CTRL_PORT_SEL;
@@ -627,6 +648,10 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR,
 					 SGMII_10M_RX_CLK_DVDR),
 			      RGMII_IO_MACRO_CONFIG);
+		if (ethqos->serdes_speed != SPEED_1000)
+			phy_set_speed(ethqos->serdes_phy, ethqos->speed);
+		ethqos->serdes_speed = SPEED_1000;
+		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
 		break;
 	}
 
@@ -799,6 +824,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to get serdes phy\n");
 
 	ethqos->speed = SPEED_1000;
+	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index aefc121464b5..13a30e6df4c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -110,6 +110,8 @@ static inline void dwmac_ctrl_ane(void __iomem *ioaddr, u32 reg, bool ane,
 	/* Enable and restart the Auto-Negotiation */
 	if (ane)
 		value |= GMAC_AN_CTRL_ANE | GMAC_AN_CTRL_RAN;
+	else
+		value &= ~GMAC_AN_CTRL_ANE;
 
 	/* In case of MAC-2-MAC connection, block is configured to operate
 	 * according to MAC conf register.
-- 
2.17.1


