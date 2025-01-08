Return-Path: <linux-arm-msm+bounces-44281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC3CA05117
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 03:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAA271677A7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 02:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371E8198A06;
	Wed,  8 Jan 2025 02:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pVe2Q3XL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0EC146013;
	Wed,  8 Jan 2025 02:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736304689; cv=none; b=ZBk9aKrdXXT1m3CAWxvX5tad/nGCf4+fRgfAoWozos9QCuLNA9pzdTuF/LloVFXEN9gdiHdyUODG86LgURmuNKpPqyg+eHkgnMGow/Bp7F+3rX0vHFspM+gIA9gnLPvAjYLEWDoPmTG2k8TGR0VqwQTXj9FUKeJETjmfg/gh3KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736304689; c=relaxed/simple;
	bh=l44Snzp4QzxJEOi/GPvPyFASkD++mPLBc/2TLzN40ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Y8U4d1+fhLT/bwfnjJGKru7gfuEc2OJxqttEzEhMnr6BjQ38/j67EZCb1MDzuin47Eneaz4PMe5c5YVMN1qRnl7O8hwD0YFNs6BfIxx6+ZgO0l3bqOB9sbzHxnfLJsOI2dLrWLXDTa+DZq0Bd/dA00cv2E49rIyMH+CKPZYs5dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pVe2Q3XL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507ELcn6006787;
	Wed, 8 Jan 2025 02:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tA5bcAGY4ti7J34msSG2KCebcrgPrWmnUhlPlDxoM2w=; b=pVe2Q3XLPE9nO7j5
	wGqJoJppvCM9HqjAUFeEtdXiuzekCfdc2fmf1+Mcy5WvMH3kXHkv96ASzxu1j8nU
	k0XHJw52OvA5tPgnNcAzZI05/Ha2o4FNb/MaTYzembWyMDVIMiFgOAaZ/2vRgirA
	fuetNJde5vh39Ecz/iNxkcCeag9FSAyDbUtb2JgDLB719/zo9EY3jKHXChL1INmE
	gZ9Q9/tGEXZvXcx7ZTPjA68tms+Sudak2fxEqzsq9sEC+xD5JMuGe5jPPywVEO+i
	nAnMBaSQ7ayu1A/aupZF2UHvOcAo/6DFOvvLLmD60aHMhBQzhIfXWO4tmgd++N2H
	TaTHBQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4415y9hmkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 02:51:12 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5082p77G029049
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 02:51:07 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 Jan 2025 18:51:02 -0800
From: Lei Wei <quic_leiwei@quicinc.com>
Date: Wed, 8 Jan 2025 10:50:27 +0800
Subject: [PATCH net-next v4 4/5] net: pcs: qcom-ipq9574: Add USXGMII
 interface mode support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-ipq_pcs_net-next-v4-4-0de14cd2902b@quicinc.com>
References: <20250108-ipq_pcs_net-next-v4-0-0de14cd2902b@quicinc.com>
In-Reply-To: <20250108-ipq_pcs_net-next-v4-0-0de14cd2902b@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736304637; l=7606;
 i=quic_leiwei@quicinc.com; s=20240829; h=from:subject:message-id;
 bh=l44Snzp4QzxJEOi/GPvPyFASkD++mPLBc/2TLzN40ak=;
 b=TmvvsIOPe/ROBrBkSmhtXRMdaKC+TwIOxP+ob/m7XnuvWp5UeJArjUF7EdiyIYAg1XoTpJgJX
 QOIovJ/g413B6ZMIGHrhBLaujbBp2WSaJpyLxs/O/Ey3zsQHYtLMI9X
X-Developer-Key: i=quic_leiwei@quicinc.com; a=ed25519;
 pk=uFXBHtxtDjtIrTKpDEZlMLSn1i/sonZepYO8yioKACM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VcI01UvsGgxWmRY_ENuyALomqJlTy_Rc
X-Proofpoint-ORIG-GUID: VcI01UvsGgxWmRY_ENuyALomqJlTy_Rc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080020

USXGMII mode is enabled by PCS when 10Gbps PHYs are connected, such as
Aquantia 10Gbps PHY.

Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
---
 drivers/net/pcs/pcs-qcom-ipq9574.c | 170 +++++++++++++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/drivers/net/pcs/pcs-qcom-ipq9574.c b/drivers/net/pcs/pcs-qcom-ipq9574.c
index a34f6d708a56..1c17adbd03d5 100644
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
@@ -303,6 +465,9 @@ static void ipq_pcs_get_state(struct phylink_pcs *pcs,
 	case PHY_INTERFACE_MODE_QSGMII:
 		ipq_pcs_get_state_sgmii(qpcs, index, state);
 		break;
+	case PHY_INTERFACE_MODE_USXGMII:
+		ipq_pcs_get_state_usxgmii(qpcs, state);
+		break;
 	default:
 		break;
 	}
@@ -329,6 +494,8 @@ static int ipq_pcs_config(struct phylink_pcs *pcs,
 	case PHY_INTERFACE_MODE_SGMII:
 	case PHY_INTERFACE_MODE_QSGMII:
 		return ipq_pcs_config_sgmii(qpcs, index, neg_mode, interface);
+	case PHY_INTERFACE_MODE_USXGMII:
+		return ipq_pcs_config_usxgmii(qpcs);
 	default:
 		return -EOPNOTSUPP;
 	};
@@ -350,6 +517,9 @@ static void ipq_pcs_link_up(struct phylink_pcs *pcs,
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


