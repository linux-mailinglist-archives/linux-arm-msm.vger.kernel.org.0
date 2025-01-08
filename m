Return-Path: <linux-arm-msm+bounces-44395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E9AA05D99
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 469123A15B9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A211FE46E;
	Wed,  8 Jan 2025 13:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D2xbS9Qu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF181FCF44;
	Wed,  8 Jan 2025 13:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736344157; cv=none; b=a1vM26HuZuwDKFOaRK6BCkcMqtpF++QtQTKOtjirbhbf+hiE0hRcILTZtn3Yqsr2S3is5LRde5pquO2V0s/2uAtGd9YZMwJMzR7blgOqCN5B9lUWofuHJvYFq8D84jP+EOIR1TzuLGYhqMX0VoKox0oDbL0wvqYzQ7AvALuS/qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736344157; c=relaxed/simple;
	bh=WIS11GVyw2P3qBOIKoIg717azYRxFjTvOF0hCk6VBiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sskCVUb7qpfNuB6pVXEzHiKCN3Dpsc2Kn4dM2IgfpsW2ZaxF1o2EIb355V/VMDhl8+HlmDjWXCqe6VWABwPz82DGAVLR+sr5YjyL2b3eobsmIWtqDIG2quIouHRugQkRlyrKCgcWUob0oBpHe0NEJmEHnV3bpaCycFZ8+fETmrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D2xbS9Qu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508BkhjE018565;
	Wed, 8 Jan 2025 13:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VWydOJylodGaOfkXjruGu8XO6AigPlVDtZolmWSPV8o=; b=D2xbS9QuTmkpfr2x
	vNqNRCfOvK5gSCo1Pg3r/HQtT9vlo9Py8ZCWZHWfggTd4cbpJ1bvcJGyMF7AzKE0
	LJ0tQXxzCrcMZPGdLZ3HlpgQ43UL7x6sEJby1dfbGCYEo2mw0DFgVieE9gQkLEG2
	9/zODPbTSNSjsky6j8MCR1fsWGM7cA6JcoeWo6qbtYJJmFwO5rIs+CNDwh8+SyLL
	WS2DywR5ppWZO3W1Rl5RoJXBfllHHdc5zj7RzE9rrKabomW41ONIAmkNLClXdHt7
	5tcyax6w3fdFLuMQCUuQHA0jyiSaFDBXUBV7y8oheEqiTMWEevbRlR8QMtkjsR2d
	uh2bJg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441nm18u2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 13:49:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508DmxfI027598
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 13:48:59 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 05:48:53 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Date: Wed, 8 Jan 2025 21:47:19 +0800
Subject: [PATCH net-next v2 12/14] net: ethernet: qualcomm: Initialize PPE
 L2 bridge settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-qcom_ipq_ppe-v2-12-7394dbda7199@quicinc.com>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
In-Reply-To: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal
	<quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Simon
 Horman" <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook
	<kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>, Luo Jie <quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736344057; l=7232;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=22QhPseO7oXZalCM+0Fh1Hh0dLteM8ovNmlK0gRUn7o=;
 b=WdozYzWr5GEgQiRAOMGLsDM62WpTgbxKj1iOtKuu3X39q3aLPcq1AFXs9tkSN52uYfaHRsXEy
 1cQ1YFmb856DCSNi5goL+428EGJiyWvcp4Gq8X9h79CeCRZTTtNcJiu
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pf1Le1yBR5gA8a6fEacRsiUer1IvcTMq
X-Proofpoint-GUID: pf1Le1yBR5gA8a6fEacRsiUer1IvcTMq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080115

From: Lei Wei <quic_leiwei@quicinc.com>

Configure the default L2 bridge settings for the PPE ports to
enable L2 frame forwarding between CPU port and PPE Ethernet
ports.

The per-port L2 bridge settings are initialized as follows:
For PPE CPU port, the PPE bridge TX is enabled and FDB learn is
disabled. For PPE physical port, the PPE bridge TX is disabled
and FDB learn is enabled by default and the L2 forward action
is initialized as forward to CPU port.

Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 74 +++++++++++++++++++++++++-
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   | 50 +++++++++++++++++
 2 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index 39e4d19c2bd6..ab008aa1c23c 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -1895,6 +1895,74 @@ static int ppe_queues_to_ring_init(struct ppe_device *ppe_dev)
 	return ppe_ring_queue_map_set(ppe_dev, 0, queue_bmap);
 }
 
+/* Initialize PPE bridge settings to enable L2 frame receive and transmit
+ * between CPU port and PPE Ethernet ports.
+ */
+static int ppe_bridge_init(struct ppe_device *ppe_dev)
+{
+	u32 reg, mask, port_cfg[4], vsi_cfg[2];
+	int ret, i;
+
+	/* Configure the following settings for CPU port0:
+	 * a.) Enable Bridge TX
+	 * b.) Disable FDB new address learning
+	 * c.) Disable station move address learning
+	 */
+	mask = PPE_PORT_BRIDGE_TXMAC_EN;
+	mask |= PPE_PORT_BRIDGE_NEW_LRN_EN;
+	mask |= PPE_PORT_BRIDGE_STA_MOVE_LRN_EN;
+	ret = regmap_update_bits(ppe_dev->regmap,
+				 PPE_PORT_BRIDGE_CTRL_ADDR,
+				 mask,
+				 PPE_PORT_BRIDGE_TXMAC_EN);
+	if (ret)
+		return ret;
+
+	for (i = 1; i < ppe_dev->num_ports; i++) {
+		/* Enable invalid VSI forwarding for all the physical ports
+		 * to CPU port0, in case no VSI is assigned to the physical
+		 * port.
+		 */
+		reg = PPE_L2_VP_PORT_TBL_ADDR + PPE_L2_VP_PORT_TBL_INC * i;
+		ret = regmap_bulk_read(ppe_dev->regmap, reg,
+				       port_cfg, ARRAY_SIZE(port_cfg));
+
+		if (ret)
+			return ret;
+
+		PPE_L2_PORT_SET_INVALID_VSI_FWD_EN(port_cfg, true);
+		PPE_L2_PORT_SET_DST_INFO(port_cfg, 0);
+
+		ret = regmap_bulk_write(ppe_dev->regmap, reg,
+					port_cfg, ARRAY_SIZE(port_cfg));
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < PPE_VSI_TBL_ENTRIES; i++) {
+		/* Enable address learning for the bridge VSI to enable
+		 * forwarding. Set VSI forward membership to include only
+		 * CPU port0.
+		 */
+		PPE_VSI_SET_MEMBER_PORT_BITMAP(vsi_cfg, BIT(0));
+		PPE_VSI_SET_UUC_BITMAP(vsi_cfg, BIT(0));
+		PPE_VSI_SET_UMC_BITMAP(vsi_cfg, BIT(0));
+		PPE_VSI_SET_BC_BITMAP(vsi_cfg, BIT(0));
+		PPE_VSI_SET_NEW_ADDR_LRN_EN(vsi_cfg, true);
+		PPE_VSI_SET_NEW_ADDR_FWD_CMD(vsi_cfg, PPE_ACTION_FORWARD);
+		PPE_VSI_SET_STATION_MOVE_LRN_EN(vsi_cfg, true);
+		PPE_VSI_SET_STATION_MOVE_FWD_CMD(vsi_cfg, PPE_ACTION_FORWARD);
+
+		reg = PPE_VSI_TBL_ADDR + PPE_VSI_TBL_INC * i;
+		ret = regmap_bulk_write(ppe_dev->regmap, reg,
+					vsi_cfg, ARRAY_SIZE(vsi_cfg));
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 int ppe_hw_config(struct ppe_device *ppe_dev)
 {
 	int ret;
@@ -1927,5 +1995,9 @@ int ppe_hw_config(struct ppe_device *ppe_dev)
 	if (ret)
 		return ret;
 
-	return ppe_queues_to_ring_init(ppe_dev);
+	ret = ppe_queues_to_ring_init(ppe_dev);
+	if (ret)
+		return ret;
+
+	return ppe_bridge_init(ppe_dev);
 }
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
index da55b06b30b8..f23fafa35766 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
@@ -117,6 +117,14 @@
 #define PPE_EG_SERVICE_SET_TX_CNT_EN(tbl_cfg, value)	\
 	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_EG_SERVICE_W1_TX_CNT_EN)
 
+/* PPE port bridge configuration */
+#define PPE_PORT_BRIDGE_CTRL_ADDR		0x60300
+#define PPE_PORT_BRIDGE_CTRL_ENTRIES		8
+#define PPE_PORT_BRIDGE_CTRL_INC		4
+#define PPE_PORT_BRIDGE_NEW_LRN_EN		BIT(0)
+#define PPE_PORT_BRIDGE_STA_MOVE_LRN_EN		BIT(3)
+#define PPE_PORT_BRIDGE_TXMAC_EN		BIT(16)
+
 /* PPE port control configurations for the traffic to the multicast queues. */
 #define PPE_MC_MTU_CTRL_TBL_ADDR		0x60a00
 #define PPE_MC_MTU_CTRL_TBL_ENTRIES		8
@@ -125,6 +133,36 @@
 #define PPE_MC_MTU_CTRL_TBL_MTU_CMD		GENMASK(15, 14)
 #define PPE_MC_MTU_CTRL_TBL_TX_CNT_EN		BIT(16)
 
+/* PPE VSI configurations */
+#define PPE_VSI_TBL_ADDR			0x63800
+#define PPE_VSI_TBL_ENTRIES			64
+#define PPE_VSI_TBL_INC				0x10
+#define PPE_VSI_W0_MEMBER_PORT_BITMAP		GENMASK(7, 0)
+#define PPE_VSI_W0_UUC_BITMAP			GENMASK(15, 8)
+#define PPE_VSI_W0_UMC_BITMAP			GENMASK(23, 16)
+#define PPE_VSI_W0_BC_BITMAP			GENMASK(31, 24)
+#define PPE_VSI_W1_NEW_ADDR_LRN_EN		BIT(0)
+#define PPE_VSI_W1_NEW_ADDR_FWD_CMD		GENMASK(2, 1)
+#define PPE_VSI_W1_STATION_MOVE_LRN_EN		BIT(3)
+#define PPE_VSI_W1_STATION_MOVE_FWD_CMD		GENMASK(5, 4)
+
+#define PPE_VSI_SET_MEMBER_PORT_BITMAP(tbl_cfg, value)		\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_VSI_W0_MEMBER_PORT_BITMAP)
+#define PPE_VSI_SET_UUC_BITMAP(tbl_cfg, value)			\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_VSI_W0_UUC_BITMAP)
+#define PPE_VSI_SET_UMC_BITMAP(tbl_cfg, value)			\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_VSI_W0_UMC_BITMAP)
+#define PPE_VSI_SET_BC_BITMAP(tbl_cfg, value)			\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_VSI_W0_BC_BITMAP)
+#define PPE_VSI_SET_NEW_ADDR_LRN_EN(tbl_cfg, value)		\
+	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_VSI_W1_NEW_ADDR_LRN_EN)
+#define PPE_VSI_SET_NEW_ADDR_FWD_CMD(tbl_cfg, value)		\
+	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_VSI_W1_NEW_ADDR_FWD_CMD)
+#define PPE_VSI_SET_STATION_MOVE_LRN_EN(tbl_cfg, value)		\
+	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_VSI_W1_STATION_MOVE_LRN_EN)
+#define PPE_VSI_SET_STATION_MOVE_FWD_CMD(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_VSI_W1_STATION_MOVE_FWD_CMD)
+
 /* PPE port control configurations for the traffic to the unicast queues. */
 #define PPE_MRU_MTU_CTRL_TBL_ADDR		0x65000
 #define PPE_MRU_MTU_CTRL_TBL_ENTRIES		256
@@ -163,6 +201,18 @@
 #define PPE_IN_L2_SERVICE_TBL_RX_CNT_EN		BIT(30)
 #define PPE_IN_L2_SERVICE_TBL_TX_CNT_EN		BIT(31)
 
+/* L2 Port configurations */
+#define PPE_L2_VP_PORT_TBL_ADDR			0x98000
+#define PPE_L2_VP_PORT_TBL_ENTRIES		256
+#define PPE_L2_VP_PORT_TBL_INC			0x10
+#define PPE_L2_VP_PORT_W0_INVALID_VSI_FWD_EN	BIT(0)
+#define PPE_L2_VP_PORT_W0_DST_INFO		GENMASK(9, 2)
+
+#define PPE_L2_PORT_SET_INVALID_VSI_FWD_EN(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_L2_VP_PORT_W0_INVALID_VSI_FWD_EN)
+#define PPE_L2_PORT_SET_DST_INFO(tbl_cfg, value)		\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_L2_VP_PORT_W0_DST_INFO)
+
 /* PPE service code configuration for the tunnel packet. */
 #define PPE_TL_SERVICE_TBL_ADDR			0x306000
 #define PPE_TL_SERVICE_TBL_ENTRIES		256

-- 
2.34.1


