Return-Path: <linux-arm-msm+bounces-44392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CD9A05D8B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:53:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF1A33A6869
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E111FF7D0;
	Wed,  8 Jan 2025 13:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oDylqJAp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488DE1FF7C5;
	Wed,  8 Jan 2025 13:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736344137; cv=none; b=J81KBYT0orcrJx9mw8R/0R2vwuW0sMfyO81A4r/pANggEt6fNOEI7SP9uQlbfwEDlBQmN52sJyNXwiURWySGXYgtZJp69LNaTua97ObZoyUKEATrj66zqGEKrsW+Mgy6LJB0q04F+NmufUfcIS+m3A+TvHVa8HPn+d3H0u3mFuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736344137; c=relaxed/simple;
	bh=YLqYbkmkm120bpBliK46hd2TtA1ALlL1JjmHdBtbaZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LQARUct//btXJ9hAiobPVOIoxW6HQfgdLByrDz5nayASrDd27bmVD7YbhdBCugaIK7zl0GWPv8B48tvzjKIjqS7WRCa6Cwtg2ODOqNyF59iyoy4lwmxYLAMtHPFLt+c0nA5l/bO4zzq3v+iC6URcXUpK7YqYxjdbUy+4KVAI+ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oDylqJAp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508BkpXg018635;
	Wed, 8 Jan 2025 13:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RMO69rrN0yCeK9w3s/FppFLL80wKuFHLpOwzA51t6SA=; b=oDylqJApYFsLuiG7
	GoooLOmNsJp+YDMPlIqdRqHc4qhF+vWHLfosOkd2FEK9a5lfkDDYP/c8iE1rv82p
	ngmIQFiOhlRxIbmEckp6jvjUvPDo1pvlvO2elZnCGGhxvqVpDXrFyjlHrYOtb2d7
	oOXs0kRTMFoaqDYG5lCFviVzjkPzbjgwBe0vFtipYhBTkzV9tbBYUu/18ux100C9
	F3sKXOhEdwOl7iUUjHjLRKt5O3OlNe7gOqPZYYB8QvvXzGJa0tyfMj4wGuddqF8K
	1ucUWOCyEqzkRrNPHurc7Oqa54OR5cYKzbUZPwZ5Ru0B3svZikucnCZdrilu33My
	Myn0iA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441nm18u1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 13:48:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508DmeEq027717
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 13:48:40 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 05:48:34 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Date: Wed, 8 Jan 2025 21:47:16 +0800
Subject: [PATCH net-next v2 09/14] net: ethernet: qualcomm: Initialize PPE
 port control settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-qcom_ipq_ppe-v2-9-7394dbda7199@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736344057; l=8669;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=YLqYbkmkm120bpBliK46hd2TtA1ALlL1JjmHdBtbaZo=;
 b=haG+xxqVBxnOmRnyEqPyTTT8UnJcVJ43w7qQyQE6lE0kB8BMMg3qE9t2oy0ZoK4Akbp/lsIQN
 zYEy1CUgqT2A+NXD7gYuUu2OyEGfLu2ljnmFVXlBE7ohkfhbkxhAm9Y
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: a3sHLqK-zSshFWjR50972WBubwEGZYap
X-Proofpoint-GUID: a3sHLqK-zSshFWjR50972WBubwEGZYap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080115

1. Enable port specific counters in PPE.
2. Configure the default action as drop when the packet size
   is more than the configured MTU of physical port.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 93 +++++++++++++++++++++++++-
 drivers/net/ethernet/qualcomm/ppe/ppe_config.h | 11 +++
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   | 47 +++++++++++++
 3 files changed, 150 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index c337b4deddc8..d3633cf12f81 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -1150,6 +1150,51 @@ int ppe_sc_config_set(struct ppe_device *ppe_dev, int sc, struct ppe_sc_cfg cfg)
 	return regmap_write(ppe_dev->regmap, reg, val);
 }
 
+/**
+ * ppe_counter_enable_set - Set PPE port counter enabled or not
+ * @ppe_dev: PPE device
+ * @port: PPE port ID
+ * @enable: Counter enabled or not
+ *
+ * Enable PPE counters on the given port for the unicast packet, multicast
+ * packet and VLAN packet received and transmitted by PPE.
+ *
+ * Return 0 on success, negative error code on failure.
+ */
+int ppe_counter_enable_set(struct ppe_device *ppe_dev, int port, bool enable)
+{
+	u32 reg, val, mru_mtu_val[3];
+	int ret;
+
+	reg = PPE_MRU_MTU_CTRL_TBL_ADDR + PPE_MRU_MTU_CTRL_TBL_INC * port;
+	ret = regmap_bulk_read(ppe_dev->regmap, reg,
+			       mru_mtu_val, ARRAY_SIZE(mru_mtu_val));
+	if (ret)
+		return ret;
+
+	PPE_MRU_MTU_CTRL_SET_RX_CNT_EN(mru_mtu_val, enable);
+	PPE_MRU_MTU_CTRL_SET_TX_CNT_EN(mru_mtu_val, enable);
+	ret = regmap_bulk_write(ppe_dev->regmap, reg,
+				mru_mtu_val, ARRAY_SIZE(mru_mtu_val));
+	if (ret)
+		return ret;
+
+	reg = PPE_MC_MTU_CTRL_TBL_ADDR + PPE_MC_MTU_CTRL_TBL_INC * port;
+	val = FIELD_PREP(PPE_MC_MTU_CTRL_TBL_TX_CNT_EN, enable);
+	ret = regmap_update_bits(ppe_dev->regmap, reg,
+				 PPE_MC_MTU_CTRL_TBL_TX_CNT_EN,
+				 val);
+	if (ret)
+		return ret;
+
+	reg = PPE_PORT_EG_VLAN_TBL_ADDR + PPE_PORT_EG_VLAN_TBL_INC * port;
+	val = FIELD_PREP(PPE_PORT_EG_VLAN_TBL_TX_COUNTING_EN, enable);
+
+	return regmap_update_bits(ppe_dev->regmap, reg,
+				  PPE_PORT_EG_VLAN_TBL_TX_COUNTING_EN,
+				  val);
+}
+
 static int ppe_config_bm_threshold(struct ppe_device *ppe_dev, int bm_port_id,
 				   struct ppe_bm_port_config port_cfg)
 {
@@ -1579,6 +1624,48 @@ static int ppe_servcode_init(struct ppe_device *ppe_dev)
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
+		/* Enable PPE port counter */
+		ret = ppe_counter_enable_set(ppe_dev, i, true);
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
+	return ppe_counter_enable_set(ppe_dev, 0, true);
+}
+
 int ppe_hw_config(struct ppe_device *ppe_dev)
 {
 	int ret;
@@ -1599,5 +1686,9 @@ int ppe_hw_config(struct ppe_device *ppe_dev)
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
index db5b033229d9..d5ffc48460df 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
@@ -233,6 +233,16 @@ struct ppe_sc_cfg {
 	int eip_offset_sel;
 };
 
+/* The action of packet received by PPE can be forwarded, dropped, copied
+ * to CPU (enter multicast queue), redirected to CPU (enter unicast queue).
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
@@ -254,4 +264,5 @@ int ppe_port_resource_get(struct ppe_device *ppe_dev, int port,
 			  int *res_start, int *res_end);
 int ppe_sc_config_set(struct ppe_device *ppe_dev, int sc,
 		      struct ppe_sc_cfg cfg);
+int ppe_counter_enable_set(struct ppe_device *ppe_dev, int port, bool enable);
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


