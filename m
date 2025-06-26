Return-Path: <linux-arm-msm+bounces-62668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 528D5AEA0BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 16:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3376A7AEC3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 14:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72612EF64F;
	Thu, 26 Jun 2025 14:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OfVAoeZj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBD52EF2B1;
	Thu, 26 Jun 2025 14:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948341; cv=none; b=BfM8gHfryyk3B5h3SCITTw8C47rUCxHegNK/1c9GyWfFLheTe3Q8kjGNNEmpZj45lyk/0xTFngs5m8Ev/0fS7+qDyl3aZfZc84dy7ZSa4v8qv5KodeJZ5WVSwrEZ+cRQDbSSsjd5GCaireAczEajvYZh5BTPlgUkn5kcJL7F2iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948341; c=relaxed/simple;
	bh=RL4eU+Ww5lTkAQ1MMHEL1b8EYy2ZO2hBO1eHGYuiH8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aUNRxKC/tSEKuabtV3Bm6r99bSLolCSq4a4swjd9mYwmcDMW4RpA1tCzbngczEdx7dhyu4qvN5OVhmqgQvpnj6Gz5H9sN7bT/DGJvGdIXQ7+xwlvlm0rfjHinvtYRst8xiYx+OZbvt0hCcXDcGFCZBzHO1lHIbuqYjpvlbVNt0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OfVAoeZj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9CP2r018960;
	Thu, 26 Jun 2025 14:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wuO+J4H0VXvSvixMVNZkyo7uOYr3zGO9aJXQVdGjVwQ=; b=OfVAoeZjGWNxOhgU
	y6iP1NS+Jx8lVpdTxWJI8hoSsAFV1Kqe7+iCrxiOdIUme8/fte2WT1GZCKf1XaRr
	Qr5Tplpvu+ctteaP1yIAMDfGaQWYRQ6qYsOYK5mJiJDgMYyVdjMo5c9YgazAs5KE
	O5f4JiP6FDzqhe6J7qCTcGGJuO+hQbZUxhyKNcZQVepD8QREpe/J4GZYjHVJ4H8s
	ywItjqOnVyBV+Tg5995mtLdv+WfHVLgQgHm2jB6G9pXaX09OQrvkeFRDXj178IRd
	JKFbr2j1AHthZoCYyXQkHl0FXgwcMJP93BPA56rMTOxOaFzEY1ZsnF+XuhwUNmv+
	fBkMhw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tddjuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:32:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55QEW9Pq027530
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:32:09 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Jun 2025 07:32:03 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Thu, 26 Jun 2025 22:31:08 +0800
Subject: [PATCH net-next v5 09/14] net: ethernet: qualcomm: Initialize PPE
 port control settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250626-qcom_ipq_ppe-v5-9-95bdc6b8f6ff@quicinc.com>
References: <20250626-qcom_ipq_ppe-v5-0-95bdc6b8f6ff@quicinc.com>
In-Reply-To: <20250626-qcom_ipq_ppe-v5-0-95bdc6b8f6ff@quicinc.com>
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
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750948277; l=8504;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=RL4eU+Ww5lTkAQ1MMHEL1b8EYy2ZO2hBO1eHGYuiH8A=;
 b=0upLr/8cHrLUuU0Qp2Rxf3gBA5+hTwRppo5yWIR/Mk/WsdtBLh96Z3UPo22GmMd7dZi9Y0tm1
 GWFDQai431WDjPaQDRVqz/w1oy/lQNLo2keNYXh/l4+FpyB3Asxwd3A
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685d59e9 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=J0k_80nE0nYP0oceNegA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyMyBTYWx0ZWRfXxh0FZtxFaYLC
 PqHcCM2I1h3lUVrAV5e8ICZ9B0Iw9gfSNNxep2yFM6Wl6EjM9sp4AjtejGjcscHlu0HGdgE6SCB
 rT1clm+nKNbdHXl0OxJ2wUBRJ2eqXZczWyZsczI8dCaUVIU3oNrZ0LjHNfwcRvqh7jWZehfPluz
 ehNBosgzh5BonCCy4wgjBvel6lWyMuQ28q698HpVBSqBS/dfhY/+18YL5u91Z6B1t53utqkCTyx
 vnUiPgHVXsXPdVrLT7H8aCfrUTP+3Ix/PcVPmrQAuomej3faIOO+ynH4+NczbMgSyzj79eVNGSJ
 lMyDXFa2bcAcdWLhUmjEhU+ozMW4q4KsS9K29pnkmClziQ9Ep6GThnoqO+Ho7uodUm2q43GPgYn
 SUbZKuLv7C4IO3n0ulLIbsua+aP23tq2Wky5BR7EEpK9qcDMMJ31cglMAecb+FqeODl+VFjw
X-Proofpoint-GUID: jFyyfVt2yB3ktzUZFo75C4p3PtDxVbS-
X-Proofpoint-ORIG-GUID: jFyyfVt2yB3ktzUZFo75C4p3PtDxVbS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260123

Configure the default action as drop when the packet size is more than
the configured MTU of physical port. Also enable port specific counters
in PPE.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 86 +++++++++++++++++++++++++-
 drivers/net/ethernet/qualcomm/ppe/ppe_config.h | 15 +++++
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   | 47 ++++++++++++++
 3 files changed, 147 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index 1fecb6ea927c..dd7a4949f049 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -1178,6 +1178,44 @@ int ppe_sc_config_set(struct ppe_device *ppe_dev, int sc, struct ppe_sc_cfg cfg)
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
@@ -1606,6 +1644,48 @@ static int ppe_servcode_init(struct ppe_device *ppe_dev)
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
@@ -1626,5 +1706,9 @@ int ppe_hw_config(struct ppe_device *ppe_dev)
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
index 5d43326ad99b..82716c3d42e9 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
@@ -40,6 +40,18 @@
 #define PPE_SERVICE_SET_RX_CNT_EN(tbl_cfg, value)	\
 	FIELD_MODIFY(PPE_SERVICE_W1_RX_CNT_EN, (tbl_cfg) + 0x1, value)
 
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
 	FIELD_MODIFY(PPE_EG_SERVICE_W1_TX_CNT_EN, (tbl_cfg) + 0x1, value)
 
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
+	FIELD_MODIFY(PPE_MRU_MTU_CTRL_W0_MRU, tbl_cfg, value)
+#define PPE_MRU_MTU_CTRL_SET_MRU_CMD(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_MRU_MTU_CTRL_W0_MRU_CMD, tbl_cfg, value)
+#define PPE_MRU_MTU_CTRL_SET_MTU(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_MRU_MTU_CTRL_W0_MTU, tbl_cfg, value)
+#define PPE_MRU_MTU_CTRL_SET_MTU_CMD(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_MRU_MTU_CTRL_W0_MTU_CMD, tbl_cfg, value)
+#define PPE_MRU_MTU_CTRL_SET_RX_CNT_EN(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_MRU_MTU_CTRL_W1_RX_CNT_EN, (tbl_cfg) + 0x1, value)
+#define PPE_MRU_MTU_CTRL_SET_TX_CNT_EN(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_MRU_MTU_CTRL_W1_TX_CNT_EN, (tbl_cfg) + 0x1, value)
+
 /* PPE service code configuration for destination port and counter. */
 #define PPE_IN_L2_SERVICE_TBL_ADDR		0x66000
 #define PPE_IN_L2_SERVICE_TBL_ENTRIES		256

-- 
2.34.1


