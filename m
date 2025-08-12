Return-Path: <linux-arm-msm+bounces-68804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD06B22A6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 16:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E8415A1DAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 14:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613A12F3C1C;
	Tue, 12 Aug 2025 14:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S+AuW0PT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A0B2F3C10;
	Tue, 12 Aug 2025 14:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755007906; cv=none; b=iYfmyHx42JIKHQCUTusmnBUOw/zhLSsCv+o3ja4dzivIE1AdgFtqK9R8coJXLdujgZ1Fl5DPgsqWYZun/yrUADVZ/qaiDPWeM1wZhf1VR9EqlxdpOtaeKSe+xX1HxdMq07+43dARaRnRw9vyHSqNBHt/EGDlBIbOZ//LnWWAnVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755007906; c=relaxed/simple;
	bh=nDO5nyj+AFcqlvVLZC8QlRQttx6zL4Sbe9OdjyiSN8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tC3iZEyk/ysxf5fKmhMd+5uAVGqsdEBVXztuLQ9aDQBfONdIHxyLqmfdb4y5I0ZB/1ic7Wy4qOBTE0a9YkmGbQrTWZka4cqbTzaQDWr9xQsrOGudozQX5MFag0NT1y2Sp1uFBuqs6cF3QvkhYWMvB69e6AFv9ea/R8tz1Gj/9vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S+AuW0PT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvf3R029550;
	Tue, 12 Aug 2025 14:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p3n+dCGfgcXTyZXTuNmvjvzRKYI2/CBkRGXzFPwcgAI=; b=S+AuW0PTy8RRnKdQ
	G4j07daL1Gu0m4n7KxNOqrTMI2jT4tTD+ZU4rRljyl429W1HdMQ77jtu/OncJOnD
	tv17PxqE05cRgulsd9FdmFb1/6a+1aZXI8/bN1W2C9CP8SowDqmDlNn391UjaWPv
	Tiy75NjLocelJh7qvlRSmgr/eqsikVvTqnRMaKF9HK7hyLFXOYTZMr642OsCUGSY
	aHXAOs+w5/nZJwvnOd9MDgAmLMzCSRcC5/jzHpEZTxRJK92atR9rVHzS+Z//dTyv
	08+RTOYMBTjOdWjC3iDa1v+/sAhG7TASkZ/+OvlR7Il2eTMB+xt6kTz3Uw36+byq
	Cjzk1Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g8c10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 14:11:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57CEBWsV016741
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 14:11:32 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 07:11:27 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 12 Aug 2025 22:10:33 +0800
Subject: [PATCH net-next v7 09/14] net: ethernet: qualcomm: Initialize PPE
 port control settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250812-qcom_ipq_ppe-v7-9-789404bdbc9a@quicinc.com>
References: <20250812-qcom_ipq_ppe-v7-0-789404bdbc9a@quicinc.com>
In-Reply-To: <20250812-qcom_ipq_ppe-v7-0-789404bdbc9a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755007841; l=8606;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=nDO5nyj+AFcqlvVLZC8QlRQttx6zL4Sbe9OdjyiSN8E=;
 b=szAMjNVs3J6zGdntIaFT28GEFjUNz/4ZUunGxoRl1Uuqgo0Ph7tlmCupY9MBst7uiyfQUwwZN
 tnS+1Re6mAWAfiDicglD+fv5CMfmdmBjdysmW1bU4Vjs7clgtBY9Exo
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689b4b95 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=J0k_80nE0nYP0oceNegA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX5+deDrn1tnTX
 3R3pBhQ/PTtAElycXpJkKJzcB41H/UP2lcRWAPG3xOE7KP4Gfrs5zVDN9QDJGxfhFIl7UH3HczI
 eaLvqDlj1pyefScJNy5DUdbQ29AcAlG/u33/27AiMlIFgUc04xshZwc7E5QxGLC+Lqe6ZfX0jQ8
 9IEUA9KMarKI7iUuObsFL1vl500xfvTEFdaGzRJhoB0hQwd5G0oEArxtLUO6h/usEymQqxW9Gyn
 x/mUWAwbwE89jyWVqfVHssrH9HTpkS2h2xIDeYloVC6Wd7vwjScWi49J1XX1MmYRXCYhPJsxNC3
 966+9jFQvOtU+4PvGPbdCOLoUjXE/amRoVoTWo5h47UTD1nIW240hxubfH/2NKtdt8YmAXIhm5t
 br/0p0Hu
X-Proofpoint-GUID: ygNQMj04K9rV8gSSQJqjVUBRso4MFWbU
X-Proofpoint-ORIG-GUID: ygNQMj04K9rV8gSSQJqjVUBRso4MFWbU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

Configure the default action as drop when the packet size is more than
the configured MTU of physical port. Also enable port specific counters
in PPE.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 87 +++++++++++++++++++++++++-
 drivers/net/ethernet/qualcomm/ppe/ppe_config.h | 15 +++++
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   | 47 ++++++++++++++
 3 files changed, 148 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index 39a01f25f5ef..a02d3300bac0 100644
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
@@ -1606,6 +1644,49 @@ static int ppe_servcode_init(struct ppe_device *ppe_dev)
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
+		/* Drop the packet when the packet size is more than the MTU
+		 * and redirect the packet to the CPU port when the received
+		 * packet size is more than the MRU of the physical interface.
+		 */
+		PPE_MRU_MTU_CTRL_SET_MRU_CMD(mru_mtu_val, PPE_ACTION_REDIRECT_TO_CPU);
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
@@ -1626,5 +1707,9 @@ int ppe_hw_config(struct ppe_device *ppe_dev)
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
index 2b3f7e39cc7e..84fa447742e3 100644
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
index 4cb76313db87..c26bee83252f 100644
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


