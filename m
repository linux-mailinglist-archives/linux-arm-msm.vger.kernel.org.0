Return-Path: <linux-arm-msm+bounces-47315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DF8A2DE78
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 15:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E99991659AF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 14:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE321E5729;
	Sun,  9 Feb 2025 14:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YVdVxpgL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176A51DFD85;
	Sun,  9 Feb 2025 14:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739111461; cv=none; b=Z0dsPW5GVJmEg3qiA7W1/Lpy0JWKotRy8nUUNe80MRxQljcp2nYvDGkqehcXLMJ7B80Y6n235l8zitnO2naheOi754uAFwCxd6rn/faYIIaGZSoGRLFltVCirxFE+dcA2QsxlrJlBe+AZzs5kX3QmGbuahjI8D4Gc0dAQ4EqX60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739111461; c=relaxed/simple;
	bh=w2hSM5r3+R0JKwEE2GmP4l7X/Sznl49r85p9ET/H87Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QDsl7KyzlADQtiJbz6a6FNBiX/cNVepLCtAk25DDMewHMGI3MoNf8pR58n0FNL22uCUjlxmY1vggkpzq/6zZC3eVcjI5iOc1eU7D3IdKRc1KgTiQcCWfmnFhRnHFvWKQhlE4wuHqohudIJGCefnoQZB0O25xQYwHEcN2SBcDtvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YVdVxpgL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519EBpNx013138;
	Sun, 9 Feb 2025 14:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVx6vax/wRvZmbZ6wp0f+zB6/dD/eZSuhHwUbqTb7AE=; b=YVdVxpgLBbVFn+O6
	So1pIpXEc+4lsCohZa42LM+YbkaTo7M+Z3Yb+shSlZhlpnowcUeNy7KZdmmDaXss
	1yWYTFQ+6l67ZtHNI5p99D2HnqbYy9A59xzepj46T6/dPBefPeKmZoBcNAAJBKAT
	h0CFUB2L4JOjYOMCP3TifuIzxV/h4xSmRMTgAVisaytkXV9wJ60snII9MUeaFug2
	lLp6+4J7XmVpEafnAPF4/PI984vWcKttsF13zmE/42MCRon/HxqC9r+FuHIRSVi2
	oOWb9scr1odxADqwAs7nBzGqoKMM453UevxcD2HWQ8cFBPCswPyADxBCkUFBaJWv
	9Oj/9Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyj28u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Feb 2025 14:30:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 519EUjQD014994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 9 Feb 2025 14:30:45 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 9 Feb 2025 06:30:39 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Date: Sun, 9 Feb 2025 22:29:43 +0800
Subject: [PATCH net-next v3 09/14] net: ethernet: qualcomm: Initialize PPE
 port control settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250209-qcom_ipq_ppe-v3-9-453ea18d3271@quicinc.com>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
In-Reply-To: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739111388; l=8604;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=w2hSM5r3+R0JKwEE2GmP4l7X/Sznl49r85p9ET/H87Q=;
 b=drxAJLYEF/TbycFVUsmKv45ILIpf8Gjq3SnGjOnzoZtor2rmsRpG1osHB1BWXY6ZHYWo+DiK8
 H30nelGYK3hCFXxegV0MVrBFRyaOIYi+kTR9xwi5lh4EW4KvrIiWOfI
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ew-7ykHESdFhk_DRRkkGbYWaTRe8kCIp
X-Proofpoint-GUID: Ew-7ykHESdFhk_DRRkkGbYWaTRe8kCIp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-09_06,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502090129

1. Enable port specific counters in PPE.
2. Configure the default action as drop when the packet size
   is more than the configured MTU of physical port.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 86 +++++++++++++++++++++++++-
 drivers/net/ethernet/qualcomm/ppe/ppe_config.h | 15 +++++
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   | 47 ++++++++++++++
 3 files changed, 147 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index fc6d887d0feb..d7b0cabe63ed 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -1153,6 +1153,44 @@ int ppe_sc_config_set(struct ppe_device *ppe_dev, int sc, struct ppe_sc_cfg cfg)
 	return regmap_write(ppe_dev->regmap, reg, val);
 }
 
+/**
+ * ppe_counter_enable_set - Set PPE port counter enabled
+ * @ppe_dev: PPE device
+ * @port: PPE port ID
+ *
+ * Enable PPE counters on the given port for the unicast packet, multicast
+ * packet and VLAN packet received and transmitted by PPE.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int ppe_counter_enable_set(struct ppe_device *ppe_dev, int port)
+{
+	u32 reg, mru_mtu_val[3];
+	int ret;
+
+	reg = PPE_MRU_MTU_CTRL_TBL_ADDR + PPE_MRU_MTU_CTRL_TBL_INC * port;
+	ret = regmap_bulk_read(ppe_dev->regmap, reg,
+			       mru_mtu_val, ARRAY_SIZE(mru_mtu_val));
+	if (ret)
+		return ret;
+
+	PPE_MRU_MTU_CTRL_SET_RX_CNT_EN(mru_mtu_val, true);
+	PPE_MRU_MTU_CTRL_SET_TX_CNT_EN(mru_mtu_val, true);
+	ret = regmap_bulk_write(ppe_dev->regmap, reg,
+				mru_mtu_val, ARRAY_SIZE(mru_mtu_val));
+	if (ret)
+		return ret;
+
+	reg = PPE_MC_MTU_CTRL_TBL_ADDR + PPE_MC_MTU_CTRL_TBL_INC * port;
+	ret = regmap_set_bits(ppe_dev->regmap, reg, PPE_MC_MTU_CTRL_TBL_TX_CNT_EN);
+	if (ret)
+		return ret;
+
+	reg = PPE_PORT_EG_VLAN_TBL_ADDR + PPE_PORT_EG_VLAN_TBL_INC * port;
+
+	return regmap_set_bits(ppe_dev->regmap, reg, PPE_PORT_EG_VLAN_TBL_TX_COUNTING_EN);
+}
+
 static int ppe_config_bm_threshold(struct ppe_device *ppe_dev, int bm_port_id,
 				   const struct ppe_bm_port_config port_cfg)
 {
@@ -1579,6 +1617,48 @@ static int ppe_servcode_init(struct ppe_device *ppe_dev)
 	return ppe_sc_config_set(ppe_dev, PPE_EDMA_SC_BYPASS_ID, sc_cfg);
 }
 
+/* Initialize PPE port configurations. */
+static int ppe_port_config_init(struct ppe_device *ppe_dev)
+{
+	u32 reg, val, mru_mtu_val[3];
+	int i, ret;
+
+	/* MTU and MRU settings are not required for CPU port 0. */
+	for (i = 1; i < ppe_dev->num_ports; i++) {
+		/* Enable Ethernet port counter */
+		ret = ppe_counter_enable_set(ppe_dev, i);
+		if (ret)
+			return ret;
+
+		reg = PPE_MRU_MTU_CTRL_TBL_ADDR + PPE_MRU_MTU_CTRL_TBL_INC * i;
+		ret = regmap_bulk_read(ppe_dev->regmap, reg,
+				       mru_mtu_val, ARRAY_SIZE(mru_mtu_val));
+		if (ret)
+			return ret;
+
+		/* Drop the packet when the packet size is more than
+		 * the MTU or MRU of the physical interface.
+		 */
+		PPE_MRU_MTU_CTRL_SET_MRU_CMD(mru_mtu_val, PPE_ACTION_DROP);
+		PPE_MRU_MTU_CTRL_SET_MTU_CMD(mru_mtu_val, PPE_ACTION_DROP);
+		ret = regmap_bulk_write(ppe_dev->regmap, reg,
+					mru_mtu_val, ARRAY_SIZE(mru_mtu_val));
+		if (ret)
+			return ret;
+
+		reg = PPE_MC_MTU_CTRL_TBL_ADDR + PPE_MC_MTU_CTRL_TBL_INC * i;
+		val = FIELD_PREP(PPE_MC_MTU_CTRL_TBL_MTU_CMD, PPE_ACTION_DROP);
+		ret = regmap_update_bits(ppe_dev->regmap, reg,
+					 PPE_MC_MTU_CTRL_TBL_MTU_CMD,
+					 val);
+		if (ret)
+			return ret;
+	}
+
+	/* Enable CPU port counters. */
+	return ppe_counter_enable_set(ppe_dev, 0);
+}
+
 int ppe_hw_config(struct ppe_device *ppe_dev)
 {
 	int ret;
@@ -1599,5 +1679,9 @@ int ppe_hw_config(struct ppe_device *ppe_dev)
 	if (ret)
 		return ret;
 
-	return ppe_servcode_init(ppe_dev);
+	ret = ppe_servcode_init(ppe_dev);
+	if (ret)
+		return ret;
+
+	return ppe_port_config_init(ppe_dev);
 }
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.h b/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
index 374635009ae3..277a77257b85 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
@@ -233,6 +233,20 @@ struct ppe_sc_cfg {
 	int eip_offset_sel;
 };
 
+/**
+ * enum ppe_action_type - PPE action of the received packet.
+ * @PPE_ACTION_FORWARD: Packet forwarded per L2/L3 process.
+ * @PPE_ACTION_DROP: Packet dropped by PPE.
+ * @PPE_ACTION_COPY_TO_CPU: Packet copied to CPU port per multicast queue.
+ * @PPE_ACTION_REDIRECT_TO_CPU: Packet redirected to CPU port per unicast queue.
+ */
+enum ppe_action_type {
+	PPE_ACTION_FORWARD = 0,
+	PPE_ACTION_DROP = 1,
+	PPE_ACTION_COPY_TO_CPU = 2,
+	PPE_ACTION_REDIRECT_TO_CPU = 3,
+};
+
 int ppe_hw_config(struct ppe_device *ppe_dev);
 int ppe_queue_scheduler_set(struct ppe_device *ppe_dev,
 			    int node_id, bool flow_level, int port,
@@ -254,4 +268,5 @@ int ppe_port_resource_get(struct ppe_device *ppe_dev, int port,
 			  int *res_start, int *res_end);
 int ppe_sc_config_set(struct ppe_device *ppe_dev, int sc,
 		      struct ppe_sc_cfg cfg);
+int ppe_counter_enable_set(struct ppe_device *ppe_dev, int port);
 #endif
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
index 80f003afad78..e4596ffe04f6 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
@@ -40,6 +40,18 @@
 #define PPE_SERVICE_SET_RX_CNT_EN(tbl_cfg, value)	\
 	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_SERVICE_W1_RX_CNT_EN)
 
+/* PPE port egress VLAN configurations. */
+#define PPE_PORT_EG_VLAN_TBL_ADDR		0x20020
+#define PPE_PORT_EG_VLAN_TBL_ENTRIES		8
+#define PPE_PORT_EG_VLAN_TBL_INC		4
+#define PPE_PORT_EG_VLAN_TBL_VLAN_TYPE		BIT(0)
+#define PPE_PORT_EG_VLAN_TBL_CTAG_MODE		GENMASK(2, 1)
+#define PPE_PORT_EG_VLAN_TBL_STAG_MODE		GENMASK(4, 3)
+#define PPE_PORT_EG_VLAN_TBL_VSI_TAG_MODE_EN	BIT(5)
+#define PPE_PORT_EG_VLAN_TBL_PCP_PROP_CMD	BIT(6)
+#define PPE_PORT_EG_VLAN_TBL_DEI_PROP_CMD	BIT(7)
+#define PPE_PORT_EG_VLAN_TBL_TX_COUNTING_EN	BIT(8)
+
 /* PPE queue counters enable/disable control. */
 #define PPE_EG_BRIDGE_CONFIG_ADDR		0x20044
 #define PPE_EG_BRIDGE_CONFIG_QUEUE_CNT_EN	BIT(2)
@@ -65,6 +77,41 @@
 #define PPE_EG_SERVICE_SET_TX_CNT_EN(tbl_cfg, value)	\
 	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_EG_SERVICE_W1_TX_CNT_EN)
 
+/* PPE port control configurations for the traffic to the multicast queues. */
+#define PPE_MC_MTU_CTRL_TBL_ADDR		0x60a00
+#define PPE_MC_MTU_CTRL_TBL_ENTRIES		8
+#define PPE_MC_MTU_CTRL_TBL_INC			4
+#define PPE_MC_MTU_CTRL_TBL_MTU			GENMASK(13, 0)
+#define PPE_MC_MTU_CTRL_TBL_MTU_CMD		GENMASK(15, 14)
+#define PPE_MC_MTU_CTRL_TBL_TX_CNT_EN		BIT(16)
+
+/* PPE port control configurations for the traffic to the unicast queues. */
+#define PPE_MRU_MTU_CTRL_TBL_ADDR		0x65000
+#define PPE_MRU_MTU_CTRL_TBL_ENTRIES		256
+#define PPE_MRU_MTU_CTRL_TBL_INC		0x10
+#define PPE_MRU_MTU_CTRL_W0_MRU			GENMASK(13, 0)
+#define PPE_MRU_MTU_CTRL_W0_MRU_CMD		GENMASK(15, 14)
+#define PPE_MRU_MTU_CTRL_W0_MTU			GENMASK(29, 16)
+#define PPE_MRU_MTU_CTRL_W0_MTU_CMD		GENMASK(31, 30)
+#define PPE_MRU_MTU_CTRL_W1_RX_CNT_EN		BIT(0)
+#define PPE_MRU_MTU_CTRL_W1_TX_CNT_EN		BIT(1)
+#define PPE_MRU_MTU_CTRL_W1_SRC_PROFILE		GENMASK(3, 2)
+#define PPE_MRU_MTU_CTRL_W1_INNER_PREC_LOW	BIT(31)
+#define PPE_MRU_MTU_CTRL_W2_INNER_PREC_HIGH	GENMASK(1, 0)
+
+#define PPE_MRU_MTU_CTRL_SET_MRU(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_MRU_MTU_CTRL_W0_MRU)
+#define PPE_MRU_MTU_CTRL_SET_MRU_CMD(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_MRU_MTU_CTRL_W0_MRU_CMD)
+#define PPE_MRU_MTU_CTRL_SET_MTU(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_MRU_MTU_CTRL_W0_MTU)
+#define PPE_MRU_MTU_CTRL_SET_MTU_CMD(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_MRU_MTU_CTRL_W0_MTU_CMD)
+#define PPE_MRU_MTU_CTRL_SET_RX_CNT_EN(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_MRU_MTU_CTRL_W1_RX_CNT_EN)
+#define PPE_MRU_MTU_CTRL_SET_TX_CNT_EN(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_MRU_MTU_CTRL_W1_TX_CNT_EN)
+
 /* PPE service code configuration for destination port and counter. */
 #define PPE_IN_L2_SERVICE_TBL_ADDR		0x66000
 #define PPE_IN_L2_SERVICE_TBL_ENTRIES		256

-- 
2.34.1


