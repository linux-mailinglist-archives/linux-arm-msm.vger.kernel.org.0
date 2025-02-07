Return-Path: <linux-arm-msm+bounces-47160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37235A2C82A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 17:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 807EF1889840
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 16:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B8823FC7E;
	Fri,  7 Feb 2025 15:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lhiClJdO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F54823FC70;
	Fri,  7 Feb 2025 15:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943951; cv=none; b=br2hJgZH8tIfi6fprP7uiyDWCsUjbD9lORrJtxBSKW89jebLwJB4S7bfBcji9NEKOJDajv5ZFc1OfbHq0u2WKZGSt03QmOe/P3BhoGutDHjGwPt68dZYt9dShduWR51dAM96ZltB/SiWIYVE9cMsbsOz+83SSdlvz4TMSJHJ1vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943951; c=relaxed/simple;
	bh=fxqCdraWBnnIJZPN5xLPPSvURBBX8lMHMmoEO1NhZhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Ilf9JVzKycuAQvstRURATiJpRCK3rFBX+JmLh4GkAORKOj9AQ87mOfDwRtVbIqf9CkV4J39evqBTD91iiQv77KhiPuNyKsg6e5sACYqbzd9CdJSvhdiyWLALb5AIDWanoTPrTwUCBJtCJMH4gCk+qOUn1czin3Fqqx8Uhn3qkSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lhiClJdO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517BNWwE032176;
	Fri, 7 Feb 2025 15:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNz99dhMzCuKVYN8cfdJRUp/3EeOJSuncQmxCrYlLz0=; b=lhiClJdOx6+w1Jdg
	PQwfYvnmIyBNJB1UkHZrtd/d68y0Cb7dDFxKkJemh9Hh/BYHfSNkdv5n7IgyUifd
	PvUcyz/QLFV7rcsa6mSZBAI+Aa/AbIV596u9UxutvPuIFARdaoVSTY8jO9ZJDliF
	tQEbMuSZOjS0RArCJUIsnAS973NoJBvqMfmiuHCGCjFJLvsIJK/EmRLT2Eqp1Nq3
	WDNdP9Vov8MbEtlA+Wys/B7QNrbPxgamq1aYPXJTOiakf6FwSh4ZO/gF+TnwHKfg
	oyZEnuWeJGDYHppL3CeWIyRwIx5OShB7ru6Z/oe+UwB2mVAWDbCiYbIYHJjhNQ0F
	iCQdDw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nh8urp5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 15:58:54 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517FwsXJ007320
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 15:58:54 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 7 Feb 2025 07:58:49 -0800
From: Lei Wei <quic_leiwei@quicinc.com>
Date: Fri, 7 Feb 2025 23:53:15 +0800
Subject: [PATCH net-next v5 4/5] net: pcs: qcom-ipq9574: Add USXGMII
 interface mode support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250207-ipq_pcs_6-14_rc1-v5-4-be2ebec32921@quicinc.com>
References: <20250207-ipq_pcs_6-14_rc1-v5-0-be2ebec32921@quicinc.com>
In-Reply-To: <20250207-ipq_pcs_6-14_rc1-v5-0-be2ebec32921@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738943908; l=7629;
 i=quic_leiwei@quicinc.com; s=20240829; h=from:subject:message-id;
 bh=fxqCdraWBnnIJZPN5xLPPSvURBBX8lMHMmoEO1NhZhc=;
 b=TJR0u/H5vTDgaXvUtgGSSvrqPVSOrgnu4efKJVrwhIv0ZriMjrTMMmXqoXFzy6aIRN9E9yf4R
 laBsyG0U1MeCz6f9Fgtuft7AcaH0Ym3s06Bb708qvzL+2LZeSyjQVwX
X-Developer-Key: i=quic_leiwei@quicinc.com; a=ed25519;
 pk=uFXBHtxtDjtIrTKpDEZlMLSn1i/sonZepYO8yioKACM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TxvIGz8sR1L2g4r7AxOeTqL-wZDIRTS-
X-Proofpoint-ORIG-GUID: TxvIGz8sR1L2g4r7AxOeTqL-wZDIRTS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_07,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070121

USXGMII mode is enabled by PCS when 10Gbps PHYs are connected, such as
Aquantia 10Gbps PHY.

Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
---
 drivers/net/pcs/pcs-qcom-ipq9574.c | 170 +++++++++++++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/drivers/net/pcs/pcs-qcom-ipq9574.c b/drivers/net/pcs/pcs-qcom-ipq9574.c
index 2bb55814d2fb..c35281c9397b 100644
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
@@ -123,9 +152,54 @@ static void ipq_pcs_get_state_sgmii(struct ipq_pcs *qpcs,
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
 
@@ -137,6 +211,10 @@ static int ipq_pcs_config_mode(struct ipq_pcs *qpcs,
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
@@ -167,6 +245,21 @@ static int ipq_pcs_config_mode(struct ipq_pcs *qpcs,
 
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
 
@@ -195,6 +288,29 @@ static int ipq_pcs_config_sgmii(struct ipq_pcs *qpcs,
 			       PCS_MII_CTRL(index), PCS_MII_FORCE_MODE);
 }
 
+static int ipq_pcs_config_usxgmii(struct ipq_pcs *qpcs)
+{
+	int ret;
+
+	/* Configure the XPCS for USXGMII mode if required */
+	if (qpcs->interface == PHY_INTERFACE_MODE_USXGMII)
+		return 0;
+
+	ret = ipq_pcs_config_mode(qpcs, PHY_INTERFACE_MODE_USXGMII);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(qpcs->regmap, XPCS_DIG_CTRL, XPCS_USXG_EN);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(qpcs->regmap, XPCS_MII_AN_CTRL, XPCS_MII_AN_8BIT);
+	if (ret)
+		return ret;
+
+	return regmap_set_bits(qpcs->regmap, XPCS_MII_CTRL, XPCS_MII_AN_EN);
+}
+
 static int ipq_pcs_link_up_config_sgmii(struct ipq_pcs *qpcs,
 					int index,
 					unsigned int neg_mode,
@@ -237,6 +353,46 @@ static int ipq_pcs_link_up_config_sgmii(struct ipq_pcs *qpcs,
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
@@ -244,6 +400,11 @@ static int ipq_pcs_validate(struct phylink_pcs *pcs, unsigned long *supported,
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
@@ -255,6 +416,7 @@ static unsigned int ipq_pcs_inband_caps(struct phylink_pcs *pcs,
 	switch (interface) {
 	case PHY_INTERFACE_MODE_SGMII:
 	case PHY_INTERFACE_MODE_QSGMII:
+	case PHY_INTERFACE_MODE_USXGMII:
 		return LINK_INBAND_DISABLE | LINK_INBAND_ENABLE;
 	default:
 		return 0;
@@ -307,6 +469,9 @@ static void ipq_pcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 	case PHY_INTERFACE_MODE_QSGMII:
 		ipq_pcs_get_state_sgmii(qpcs, index, state);
 		break;
+	case PHY_INTERFACE_MODE_USXGMII:
+		ipq_pcs_get_state_usxgmii(qpcs, state);
+		break;
 	default:
 		break;
 	}
@@ -333,6 +498,8 @@ static int ipq_pcs_config(struct phylink_pcs *pcs,
 	case PHY_INTERFACE_MODE_SGMII:
 	case PHY_INTERFACE_MODE_QSGMII:
 		return ipq_pcs_config_sgmii(qpcs, index, neg_mode, interface);
+	case PHY_INTERFACE_MODE_USXGMII:
+		return ipq_pcs_config_usxgmii(qpcs);
 	default:
 		return -EOPNOTSUPP;
 	};
@@ -354,6 +521,9 @@ static void ipq_pcs_link_up(struct phylink_pcs *pcs,
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


