Return-Path: <linux-arm-msm+bounces-40278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EFE9E3E6F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 16:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 903D0B39547
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 14:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227DA20CCEB;
	Wed,  4 Dec 2024 14:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j9BFqMdC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397EB20CCE3;
	Wed,  4 Dec 2024 14:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733324004; cv=none; b=jw2xn+ZQvvx2Nrq8xY8g+WlO9/kZHuzv2fIgLu32k7SEkygzufMcaIcdcb0xAtsSonJIW/Gh4kTPFm1OQrRDI34Xr9oEhGNvKo0aGUr4XwB+z7MA/tarMqudWuD4tmV7QISgXMptD1+vlGgudh+8KrxdJRq+gAhITbTHYxhPfqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733324004; c=relaxed/simple;
	bh=PcwhxhxpzymGc5PEGoKTVEJ3RohYhfCjdnNuo6RNtJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JHySxA3J2jXYfgW4XvnRH3NEcFK3K6W6wh/EWTSfmqIC/gq5D4iKXyqntHEiGU2O+5Fn3+eHmaXMlSlCx7KTpuBI7XW0BrbSrfRzqh/ffz/AxxBBUCF4kgzBMhGi/R6XIlKc2IWJ/8g3K1bRYUXHqCfqKrzlZ1X/03Sk+PqxQ6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j9BFqMdC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4CjTrN027143;
	Wed, 4 Dec 2024 14:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o9Dd1F3RUOKl+Bh7LF6T7f8wWWFAJ1BzR8qSP5H+tkU=; b=j9BFqMdCVZdhUFn+
	Qdk5njkw+h7X1uzq8aB5JonSGtAcqvhpDa023jN56bW1/ym/h9os0CdXAYIsp2CX
	Cc6yATPYCH/D5r3LodEhY1V28CWu2b4ieyjbyC/VPnNMntxQsE2ZkpEu41VhCIDj
	5nHNGfJ0OhgzgN9nqBFlUPi94zXWYjNd5Ju3nomxflgam5LNskseEaONcpUJ4iM1
	/K1YvSx3RfqHH0qLm8+V7qaTp0UquBd4hIYvXQ3yjM1gvux/CSLqCD9MY/fqmiDJ
	hT0Hu6ZnlySoA/GFxFSZjuo6gNJQD1TdIEFfVLpw5QT76Ntsnkw8y5QII89CfZfA
	06ASew==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a1g5krf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 14:53:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4Er6gw031658
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 14:53:06 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 06:53:01 -0800
From: Lei Wei <quic_leiwei@quicinc.com>
Date: Wed, 4 Dec 2024 22:43:56 +0800
Subject: [PATCH net-next v2 4/5] net: pcs: qcom-ipq9574: Add USXGMII
 interface mode support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241204-ipq_pcs_rc1-v2-4-26155f5364a1@quicinc.com>
References: <20241204-ipq_pcs_rc1-v2-0-26155f5364a1@quicinc.com>
In-Reply-To: <20241204-ipq_pcs_rc1-v2-0-26155f5364a1@quicinc.com>
To: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Lunn
	<andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
	<linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_luoj@quicinc.com>,
        <quic_leiwei@quicinc.com>, <srinivas.kandagatla@linaro.org>,
        <bartosz.golaszewski@linaro.org>, <vsmuthu@qti.qualcomm.com>,
        <john@phrozen.org>, <linux-arm-msm@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733323958; l=7396;
 i=quic_leiwei@quicinc.com; s=20240829; h=from:subject:message-id;
 bh=PcwhxhxpzymGc5PEGoKTVEJ3RohYhfCjdnNuo6RNtJw=;
 b=fYXZCq15Z9PJMa7wBGRIp6HLhk+sOb/0VjCQowcPXQJsb9OTpE6tYEHGKmkF8GyV3fz6iK7m5
 rcTc2RRbaqPDuWdpmZspbtfpNH8DA2romOEDcqYm6AbPe2aAJ12jeBQ
X-Developer-Key: i=quic_leiwei@quicinc.com; a=ed25519;
 pk=uFXBHtxtDjtIrTKpDEZlMLSn1i/sonZepYO8yioKACM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hunt9awkvORd45ul8dT1z00WpaKAe8GF
X-Proofpoint-ORIG-GUID: hunt9awkvORd45ul8dT1z00WpaKAe8GF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040114

USXGMII mode is enabled by PCS when 10Gbps PHYs are connected, such as
Aquantia 10Gbps PHY.

Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
---
 drivers/net/pcs/pcs-qcom-ipq9574.c | 177 +++++++++++++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/drivers/net/pcs/pcs-qcom-ipq9574.c b/drivers/net/pcs/pcs-qcom-ipq9574.c
index 3608f5506477..ad5e9551675a 100644
--- a/drivers/net/pcs/pcs-qcom-ipq9574.c
+++ b/drivers/net/pcs/pcs-qcom-ipq9574.c
@@ -26,6 +26,7 @@
 #define PCS_MODE_SEL_MASK		GENMASK(12, 8)
 #define PCS_MODE_SGMII			FIELD_PREP(PCS_MODE_SEL_MASK, 0x4)
 #define PCS_MODE_QSGMII			FIELD_PREP(PCS_MODE_SEL_MASK, 0x1)
+#define PCS_MODE_XPCS			FIELD_PREP(PCS_MODE_SEL_MASK, 0x10)
 
 #define PCS_MII_CTRL(x)			(0x480 + 0x18 * (x))
 #define PCS_MII_ADPT_RESET		BIT(11)
@@ -54,6 +55,35 @@
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
+#define XPCS_USXG_AN_DUPLEX_FULL	BIT(13)
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
@@ -126,9 +156,57 @@ static void ipq_pcs_get_state_sgmii(struct ipq_pcs *qpcs,
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
+	if (val & XPCS_USXG_AN_DUPLEX_FULL)
+		state->duplex = DUPLEX_FULL;
+	else
+		state->duplex = DUPLEX_HALF;
+}
+
 static int ipq_pcs_config_mode(struct ipq_pcs *qpcs,
 			       phy_interface_t interface)
 {
+	unsigned long rate = 125000000;
 	unsigned int val;
 	int ret;
 
@@ -140,6 +218,10 @@ static int ipq_pcs_config_mode(struct ipq_pcs *qpcs,
 	case PHY_INTERFACE_MODE_QSGMII:
 		val = PCS_MODE_QSGMII;
 		break;
+	case PHY_INTERFACE_MODE_USXGMII:
+		val = PCS_MODE_XPCS;
+		rate = 312500000;
+		break;
 	default:
 		dev_err(qpcs->dev,
 			"Unsupported interface %s\n", phy_modes(interface));
@@ -174,6 +256,21 @@ static int ipq_pcs_config_mode(struct ipq_pcs *qpcs,
 
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
 
@@ -211,6 +308,35 @@ static int ipq_pcs_config_sgmii(struct ipq_pcs *qpcs,
 				  PCS_MII_FORCE_MODE, PCS_MII_FORCE_MODE);
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
+		ret = regmap_update_bits(qpcs->regmap, XPCS_DIG_CTRL,
+					 XPCS_USXG_EN, XPCS_USXG_EN);
+		if (ret)
+			return ret;
+
+		ret = regmap_update_bits(qpcs->regmap, XPCS_MII_AN_CTRL,
+					 XPCS_MII_AN_8BIT, XPCS_MII_AN_8BIT);
+		if (ret)
+			return ret;
+
+		ret = regmap_update_bits(qpcs->regmap, XPCS_MII_CTRL,
+					 XPCS_MII_AN_EN, XPCS_MII_AN_EN);
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
@@ -253,6 +379,49 @@ static int ipq_pcs_link_up_config_sgmii(struct ipq_pcs *qpcs,
 				  PCS_MII_ADPT_RESET, PCS_MII_ADPT_RESET);
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
+	/* USXGMII only support full duplex mode */
+	val |= XPCS_DUPLEX_FULL;
+
+	/* Configure XPCS speed */
+	ret = regmap_update_bits(qpcs->regmap, XPCS_MII_CTRL,
+				 XPCS_SPEED_MASK | XPCS_DUPLEX_FULL, val);
+	if (ret)
+		return ret;
+
+	/* XPCS adapter reset */
+	return regmap_update_bits(qpcs->regmap, XPCS_DIG_CTRL,
+				  XPCS_USXG_ADPT_RESET, XPCS_USXG_ADPT_RESET);
+}
+
 static int ipq_pcs_enable(struct phylink_pcs *pcs)
 {
 	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
@@ -299,6 +468,9 @@ static void ipq_pcs_get_state(struct phylink_pcs *pcs,
 	case PHY_INTERFACE_MODE_QSGMII:
 		ipq_pcs_get_state_sgmii(qpcs, index, state);
 		break;
+	case PHY_INTERFACE_MODE_USXGMII:
+		ipq_pcs_get_state_usxgmii(qpcs, state);
+		break;
 	default:
 		break;
 	}
@@ -325,6 +497,8 @@ static int ipq_pcs_config(struct phylink_pcs *pcs,
 	case PHY_INTERFACE_MODE_SGMII:
 	case PHY_INTERFACE_MODE_QSGMII:
 		return ipq_pcs_config_sgmii(qpcs, index, neg_mode, interface);
+	case PHY_INTERFACE_MODE_USXGMII:
+		return ipq_pcs_config_usxgmii(qpcs);
 	default:
 		dev_err(qpcs->dev,
 			"Unsupported interface %s\n", phy_modes(interface));
@@ -348,6 +522,9 @@ static void ipq_pcs_link_up(struct phylink_pcs *pcs,
 		ret = ipq_pcs_link_up_config_sgmii(qpcs, index,
 						   neg_mode, speed);
 		break;
+	case PHY_INTERFACE_MODE_USXGMII:
+		ret = ipq_pcs_link_up_config_usxgmii(qpcs, speed);
+		break;
 	default:
 		dev_err(qpcs->dev,
 			"Unsupported interface %s\n", phy_modes(interface));

-- 
2.34.1


