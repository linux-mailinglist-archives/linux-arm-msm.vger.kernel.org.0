Return-Path: <linux-arm-msm+bounces-57683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 504AEAB50CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 12:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB21B3AF0F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 10:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D90248F70;
	Tue, 13 May 2025 09:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JqMgFRFk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345EA248F48;
	Tue, 13 May 2025 09:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130383; cv=none; b=T2+Y7sfiQ2vVTNkBTKszMd/y5GSA4dTNIdmtrotTRwjljhWILd8pVUwg49ok/PjivBN2ZISqbP/MOO/IVcNnQ1Q7MsFhHFjfmF9c+Cpb2SKJybySN1eSHghY/ExzQCEDY5melpJD7q/QtlJnZUpCo8CTIlNHDMQjqaynvrJwHSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130383; c=relaxed/simple;
	bh=t33QIBx7tsivEIpMIABoiBmVVr4tRgSUAKeWD0Dy75s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rr6mXFzCwwRXfnfkEXVeoQj+G0UGWr9jgQsftjrD1VwG/Uf/W6egGMrsz8njuTm1FFErPoUJMVSQTUz+3TezQsVKIp0FYEk5YKsQLvNu6Ang2S4z/sbNRqnAPrf9bjJYCbkvpt5sAfFFvR3cvocBxrG+uVTNOUvTvdeFKpox8yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JqMgFRFk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D7M9UR026164;
	Tue, 13 May 2025 09:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4eepTEq3dBUW+PZUnJgh/gYhWbxJhWbJZ04TAWR5Dcg=; b=JqMgFRFk6zT4JIYp
	F3ug5C8q0VDiNIdmBtIGA8IdoJ4tB1lQLIRYuczUY7zXaZnv9TQc++qjBvZ8cFea
	GkoEbUxC9KDRn0eNeHkHqYp/7Qa4VEp+S9VFQXsM4WfOZ9nntJ4AdBp7l7q0eSOG
	Liob2fccp01aYAqDJwox5SfiKtrldCH2rdpTz6qMS2bap8EOBiwuV/Gdo5ZDmycS
	gvxkWqQ15ZQN95t96C6dtn+G8hE+XShKiiytzU/xSp4XKSrCn5I14KcI1tpm2C/v
	9Xw6W0GNOFYkzYPmgaseQ+0RTqTxuAZqcwaM9P2oqZ5R7rGQM3gJ+LgEJSQgMIn+
	XoYMYA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyyny71e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 09:59:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54D9xRtM009414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 09:59:27 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 02:59:21 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 13 May 2025 17:58:29 +0800
Subject: [PATCH net-next v4 09/14] net: ethernet: qualcomm: Initialize PPE
 port control settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250513-qcom_ipq_ppe-v4-9-4fbe40cbbb71@quicinc.com>
References: <20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com>
In-Reply-To: <20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747130311; l=8508;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=t33QIBx7tsivEIpMIABoiBmVVr4tRgSUAKeWD0Dy75s=;
 b=wzqBTIQjnkXM42xsqeyGJd09GQdXL5/4abUNhPYw1TrxwlZTaXBzy41JvCVZYsmMPf+Ww5JR3
 Ct4QuLXx3ydCsEjjioqsPggbP5oqkUTllzfN+DJsRWKxsRgBDve/kdb
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDA5NCBTYWx0ZWRfXwHsV82rYJisi
 Ls1Vj5okXninsdFdn5LNkkwYrW2YR8EQ6YbaAcRN0D4UD+HAShcHUuAGscX1BaX2YKjIGJpeXYG
 er+kyDd/XrHMKBtjVEgWsTUmCdPnhReqtLPUDRuLfrOXsADio47DdFZA2sjPSmqXWrXeHnsC3yt
 kyB60c1rsA5A3/65ga06Xi/e4CNaUTA1X37HbckKS3mMqG6j7V2HGC06AHsXFHIiOwpABNkB9m+
 CxtSbOg8ahNIg8s+tW9EDZxNcz9QjDrYeKNdaAG52kOoN6l4Qweiyn7pt10L98o4mYBzx1eeohH
 jYntD6smUhGwuUEO1Bpf5KrbKlqY/JeDRvu+ajjPmkn0Fw9PNlHGf6xz/HONoj0eyrvu4RarDE6
 2VNP/v4W5rKx7y2sVXo6YranOT4foCk3+GvwY92gg/RyQnIGXHOcY5gbH8Yc6Mo9wStj9z+Y
X-Proofpoint-ORIG-GUID: iz3zVvXsOZrGwWnhHxb_be6IARtxjSuw
X-Authority-Analysis: v=2.4 cv=Uo9jN/wB c=1 sm=1 tr=0 ts=682317ff cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=J0k_80nE0nYP0oceNegA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: iz3zVvXsOZrGwWnhHxb_be6IARtxjSuw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505130094

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


