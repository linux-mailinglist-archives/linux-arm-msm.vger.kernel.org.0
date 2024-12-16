Return-Path: <linux-arm-msm+bounces-42345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB4C9F31D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 14:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D0D01888714
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 13:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD28E205AB0;
	Mon, 16 Dec 2024 13:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LQxxNGlC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E57C205AA9;
	Mon, 16 Dec 2024 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734356568; cv=none; b=AickZYwjhqMdoETW2AVBDNMsG6YpmEPLbY6/eT+dLHbMxkCwmSADNldF+P9Q3Ljc1m6plssN/P2Dw6+hnQoM2DfCBbFalzr0Rv1+PK3nqhhXXhhIz7oyuWUjuIG/5I+iwN5g4EPHAxdlKQnI9Rj8W5oIHTvjWPgS4yjAPWZ369Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734356568; c=relaxed/simple;
	bh=1keVn0VPiiYnIVL6lRhZzEDiOJtPcYrpsVQ7/P8hzjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ci8a0Tv60GXA+0iY67kFrF7fJJR69WMupI+08UkcYgzCddHmhxVm8Yw9UD5jDIxwRwJFDIveQjwx7cQha86vm7X6f3AK4K6a0V2iWrIlgD7Tk6UFoZDpYwbzE8Oq69t2RN0CBFwLVgJ+6OlIe/FagEHwANw0+keqpwpEPVitgcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LQxxNGlC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGBCvkU007518;
	Mon, 16 Dec 2024 13:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UTsATL5EQpfQHU7bULpC333U6zdteRnb5doMMXLqxK8=; b=LQxxNGlCOLDxtbh3
	KLYNTMooApJZJWnXmCStbGorxRfTNjiQHnEUGVwOA4zv0AyAdUXCKY8tE4JAdV1p
	Kz+jwFlZ2UaDfqw52NnDxUFmcvq49rjiWLyO6QJwmeNw2KdaoVTyJXcL4D1cbIzr
	OELRkZ5ispb1IAFPBdBXjmWJVsBwirQn6l0nvT/8TMf94dvaZXnHBqhw34POFRJM
	BfdudoG63xbkmWiqUkzfd8WJumaZkUCGM5I8IOK+j7Qq7ZALr4+s0CSlqmZzprHf
	BYrCWbjXb2zx86DX9yr7Q6iSIhL5ychOkaM9A58Anq77PMeyY/FS9XvB/JD2Tw5y
	UWVwwQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jk4nge26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 13:42:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGDgVgh013394
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 13:42:31 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 05:42:26 -0800
From: Lei Wei <quic_leiwei@quicinc.com>
Date: Mon, 16 Dec 2024 21:40:26 +0800
Subject: [PATCH net-next v3 4/5] net: pcs: qcom-ipq9574: Add USXGMII
 interface mode support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241216-ipq_pcs_6-13_rc1-v3-4-3abefda0fc48@quicinc.com>
References: <20241216-ipq_pcs_6-13_rc1-v3-0-3abefda0fc48@quicinc.com>
In-Reply-To: <20241216-ipq_pcs_6-13_rc1-v3-0-3abefda0fc48@quicinc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit
	<hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_luoj@quicinc.com>, <quic_leiwei@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <vsmuthu@qti.qualcomm.com>, <john@phrozen.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734356525; l=7393;
 i=quic_leiwei@quicinc.com; s=20240829; h=from:subject:message-id;
 bh=1keVn0VPiiYnIVL6lRhZzEDiOJtPcYrpsVQ7/P8hzjY=;
 b=qDbLPgktgssVzoQqCBoxoH88XJ2CYefsySDRx09StdhmcvaJB2HJU4QtQX5y+Ps+YJhMWXWPf
 CJ6NmrFy5rxBnOxTm/PZWXvWQzHRe/BPV16z0uPL08PhNMZgFFthdtj
X-Developer-Key: i=quic_leiwei@quicinc.com; a=ed25519;
 pk=uFXBHtxtDjtIrTKpDEZlMLSn1i/sonZepYO8yioKACM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: q29-muapr2pb6OMCSb0OPupoQo6IL091
X-Proofpoint-ORIG-GUID: q29-muapr2pb6OMCSb0OPupoQo6IL091
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1015 adultscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160115

USXGMII mode is enabled by PCS when 10Gbps PHYs are connected, such as
Aquantia 10Gbps PHY.

Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
---
 drivers/net/pcs/pcs-qcom-ipq9574.c | 175 +++++++++++++++++++++++++++++++++++++
 1 file changed, 175 insertions(+)

diff --git a/drivers/net/pcs/pcs-qcom-ipq9574.c b/drivers/net/pcs/pcs-qcom-ipq9574.c
index 54acb1c8c67f..58ac1f012603 100644
--- a/drivers/net/pcs/pcs-qcom-ipq9574.c
+++ b/drivers/net/pcs/pcs-qcom-ipq9574.c
@@ -26,6 +26,7 @@
 #define PCS_MODE_SEL_MASK		GENMASK(12, 8)
 #define PCS_MODE_SGMII			FIELD_PREP(PCS_MODE_SEL_MASK, 0x4)
 #define PCS_MODE_QSGMII			FIELD_PREP(PCS_MODE_SEL_MASK, 0x1)
+#define PCS_MODE_XPCS			FIELD_PREP(PCS_MODE_SEL_MASK, 0x10)
 
 #define PCS_MII_CTRL(x)			(0x480 + 0x18 * (x))
 #define PCS_MII_ADPT_RESET		BIT(11)
@@ -54,6 +55,34 @@
 					 FIELD_PREP(GENMASK(9, 2), \
 					 FIELD_GET(XPCS_INDIRECT_ADDR_L, reg)))
 
+#define XPCS_DIG_CTRL			0x38000
+#define XPCS_USXG_ADPT_RESET		BIT(10)
+#define XPCS_USXG_EN			BIT(9)
+
+#define XPCS_MII_CTRL			0x1f0000
+#define XPCS_MII_AN_EN			BIT(12)
+#define XPCS_DUPLEX_FULL		BIT(8)
+#define XPCS_SPEED_MASK			(BIT(13) | BIT(6) | BIT(5))
+#define XPCS_SPEED_10000		(BIT(13) | BIT(6))
+#define XPCS_SPEED_5000			(BIT(13) | BIT(5))
+#define XPCS_SPEED_2500			BIT(5)
+#define XPCS_SPEED_1000			BIT(6)
+#define XPCS_SPEED_100			BIT(13)
+#define XPCS_SPEED_10			0
+
+#define XPCS_MII_AN_CTRL		0x1f8001
+#define XPCS_MII_AN_8BIT		BIT(8)
+
+#define XPCS_MII_AN_INTR_STS		0x1f8002
+#define XPCS_USXG_AN_LINK_STS		BIT(14)
+#define XPCS_USXG_AN_SPEED_MASK		GENMASK(12, 10)
+#define XPCS_USXG_AN_SPEED_10		0
+#define XPCS_USXG_AN_SPEED_100		1
+#define XPCS_USXG_AN_SPEED_1000		2
+#define XPCS_USXG_AN_SPEED_2500		4
+#define XPCS_USXG_AN_SPEED_5000		5
+#define XPCS_USXG_AN_SPEED_10000	3
+
 /* Per PCS MII private data */
 struct ipq_pcs_mii {
 	struct ipq_pcs *qpcs;
@@ -126,9 +155,54 @@ static void ipq_pcs_get_state_sgmii(struct ipq_pcs *qpcs,
 		state->duplex = DUPLEX_HALF;
 }
 
+static void ipq_pcs_get_state_usxgmii(struct ipq_pcs *qpcs,
+				      struct phylink_link_state *state)
+{
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(qpcs->regmap, XPCS_MII_AN_INTR_STS, &val);
+	if (ret) {
+		state->link = 0;
+		return;
+	}
+
+	state->link = !!(val & XPCS_USXG_AN_LINK_STS);
+
+	if (!state->link)
+		return;
+
+	switch (FIELD_GET(XPCS_USXG_AN_SPEED_MASK, val)) {
+	case XPCS_USXG_AN_SPEED_10000:
+		state->speed = SPEED_10000;
+		break;
+	case XPCS_USXG_AN_SPEED_5000:
+		state->speed = SPEED_5000;
+		break;
+	case XPCS_USXG_AN_SPEED_2500:
+		state->speed = SPEED_2500;
+		break;
+	case XPCS_USXG_AN_SPEED_1000:
+		state->speed = SPEED_1000;
+		break;
+	case XPCS_USXG_AN_SPEED_100:
+		state->speed = SPEED_100;
+		break;
+	case XPCS_USXG_AN_SPEED_10:
+		state->speed = SPEED_10;
+		break;
+	default:
+		state->link = false;
+		return;
+	}
+
+	state->duplex = DUPLEX_FULL;
+}
+
 static int ipq_pcs_config_mode(struct ipq_pcs *qpcs,
 			       phy_interface_t interface)
 {
+	unsigned long rate = 125000000;
 	unsigned int val;
 	int ret;
 
@@ -140,6 +214,10 @@ static int ipq_pcs_config_mode(struct ipq_pcs *qpcs,
 	case PHY_INTERFACE_MODE_QSGMII:
 		val = PCS_MODE_QSGMII;
 		break;
+	case PHY_INTERFACE_MODE_USXGMII:
+		val = PCS_MODE_XPCS;
+		rate = 312500000;
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -170,6 +248,21 @@ static int ipq_pcs_config_mode(struct ipq_pcs *qpcs,
 
 	qpcs->interface = interface;
 
+	/* Configure the RX and TX clock to NSSCC as 125M or 312.5M based
+	 * on current interface mode.
+	 */
+	ret = clk_set_rate(qpcs->rx_hw.clk, rate);
+	if (ret) {
+		dev_err(qpcs->dev, "Failed to set RX clock rate\n");
+		return ret;
+	}
+
+	ret = clk_set_rate(qpcs->tx_hw.clk, rate);
+	if (ret) {
+		dev_err(qpcs->dev, "Failed to set TX clock rate\n");
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -207,6 +300,35 @@ static int ipq_pcs_config_sgmii(struct ipq_pcs *qpcs,
 			       PCS_MII_CTRL(index), PCS_MII_FORCE_MODE);
 }
 
+static int ipq_pcs_config_usxgmii(struct ipq_pcs *qpcs)
+{
+	int ret;
+
+	/* Configure the XPCS for USXGMII mode if required */
+	if (qpcs->interface != PHY_INTERFACE_MODE_USXGMII) {
+		ret = ipq_pcs_config_mode(qpcs, PHY_INTERFACE_MODE_USXGMII);
+		if (ret)
+			return ret;
+
+		ret = regmap_set_bits(qpcs->regmap,
+				      XPCS_DIG_CTRL, XPCS_USXG_EN);
+		if (ret)
+			return ret;
+
+		ret = regmap_set_bits(qpcs->regmap,
+				      XPCS_MII_AN_CTRL, XPCS_MII_AN_8BIT);
+		if (ret)
+			return ret;
+
+		ret = regmap_set_bits(qpcs->regmap,
+				      XPCS_MII_CTRL, XPCS_MII_AN_EN);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int ipq_pcs_link_up_config_sgmii(struct ipq_pcs *qpcs,
 					int index,
 					unsigned int neg_mode,
@@ -249,6 +371,46 @@ static int ipq_pcs_link_up_config_sgmii(struct ipq_pcs *qpcs,
 			       PCS_MII_CTRL(index), PCS_MII_ADPT_RESET);
 }
 
+static int ipq_pcs_link_up_config_usxgmii(struct ipq_pcs *qpcs, int speed)
+{
+	unsigned int val;
+	int ret;
+
+	switch (speed) {
+	case SPEED_10000:
+		val = XPCS_SPEED_10000;
+		break;
+	case SPEED_5000:
+		val = XPCS_SPEED_5000;
+		break;
+	case SPEED_2500:
+		val = XPCS_SPEED_2500;
+		break;
+	case SPEED_1000:
+		val = XPCS_SPEED_1000;
+		break;
+	case SPEED_100:
+		val = XPCS_SPEED_100;
+		break;
+	case SPEED_10:
+		val = XPCS_SPEED_10;
+		break;
+	default:
+		dev_err(qpcs->dev, "Invalid USXGMII speed %d\n", speed);
+		return -EINVAL;
+	}
+
+	/* Configure XPCS speed */
+	ret = regmap_update_bits(qpcs->regmap, XPCS_MII_CTRL,
+				 XPCS_SPEED_MASK, val | XPCS_DUPLEX_FULL);
+	if (ret)
+		return ret;
+
+	/* XPCS adapter reset */
+	return regmap_set_bits(qpcs->regmap,
+			       XPCS_DIG_CTRL, XPCS_USXG_ADPT_RESET);
+}
+
 static int ipq_pcs_validate(struct phylink_pcs *pcs, unsigned long *supported,
 			    const struct phylink_link_state *state)
 {
@@ -256,6 +418,11 @@ static int ipq_pcs_validate(struct phylink_pcs *pcs, unsigned long *supported,
 	case PHY_INTERFACE_MODE_SGMII:
 	case PHY_INTERFACE_MODE_QSGMII:
 		return 0;
+	case PHY_INTERFACE_MODE_USXGMII:
+		/* USXGMII only supports full duplex mode */
+		phylink_clear(supported, 100baseT_Half);
+		phylink_clear(supported, 10baseT_Half);
+		return 0;
 	default:
 		return -EINVAL;
 	}
@@ -303,6 +470,9 @@ static void ipq_pcs_get_state(struct phylink_pcs *pcs,
 	case PHY_INTERFACE_MODE_QSGMII:
 		ipq_pcs_get_state_sgmii(qpcs, index, state);
 		break;
+	case PHY_INTERFACE_MODE_USXGMII:
+		ipq_pcs_get_state_usxgmii(qpcs, state);
+		break;
 	default:
 		break;
 	}
@@ -329,6 +499,8 @@ static int ipq_pcs_config(struct phylink_pcs *pcs,
 	case PHY_INTERFACE_MODE_SGMII:
 	case PHY_INTERFACE_MODE_QSGMII:
 		return ipq_pcs_config_sgmii(qpcs, index, neg_mode, interface);
+	case PHY_INTERFACE_MODE_USXGMII:
+		return ipq_pcs_config_usxgmii(qpcs);
 	default:
 		return -EOPNOTSUPP;
 	};
@@ -350,6 +522,9 @@ static void ipq_pcs_link_up(struct phylink_pcs *pcs,
 		ret = ipq_pcs_link_up_config_sgmii(qpcs, index,
 						   neg_mode, speed);
 		break;
+	case PHY_INTERFACE_MODE_USXGMII:
+		ret = ipq_pcs_link_up_config_usxgmii(qpcs, speed);
+		break;
 	default:
 		return;
 	}

-- 
2.34.1


