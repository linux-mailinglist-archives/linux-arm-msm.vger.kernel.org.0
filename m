Return-Path: <linux-arm-msm+bounces-44391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F42FA05D70
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 248F01889308
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E473D1FF61A;
	Wed,  8 Jan 2025 13:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NLtZ/CZ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6C01FF60F;
	Wed,  8 Jan 2025 13:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736344130; cv=none; b=F6ez2oGo7no/hOIHg5/wncq8nl2PNALFmzoNoyd7fkjOz9T5KLgxH9aEYV1b6Bw/Y6CqjDJecXu10rZ/mLXSn9wdM9x2p0puodGZGBM3A1ZcIHFj1sWGixbv00gBGrcGcUOX1f6NYdCgc0ws2wthX4mv/q9S9Qi98dOWqKNlACQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736344130; c=relaxed/simple;
	bh=+Ec43bSnbpku5NMv7jjRmcWpNRD4ah75dVYT4MMS8Xw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jfNRlbFMxntLc+UPgHUatMnk9MdqZPbYxwk1/tEV7ivHECe4nIAjXxlK4Yy38tbDSrVp3oYj3VtWfcGC+YKahmDCSQ8KecFeANciQdL5T/ZaeQ3XgCe/9u7mXLRaRAJ1+tOP9AHHo/zLFgd0AYjhuVAMtTgb94+c4ccapSFis6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NLtZ/CZ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508BkTQw018483;
	Wed, 8 Jan 2025 13:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c9mFC2KTHaa37mlku0aOp4p+azpelAzN21CmUqeEeZo=; b=NLtZ/CZ8tf1ADhna
	6l8gdzp1/E09JJ1JjVKIu4TixxsXEOO6bEZ+7DXu8XflvtYsW6oVvSl7KS5Udi1R
	1fW2jbl7cIDLnYoyM20+oJRKxn7YfmApBTF80FGpLx9hDxsb4JD51cO2RZh0C65C
	0Jk76wgHZSo8B/QnS0RvS5RX6Tc/2GWzyoEg8oK+nsr5Bk1/nM+DXOLPe3KeyFnD
	Lwu/5bYQ4/KJ/P2IFzztexIJ4OD/Do5/jdIS8jsNaoPqIfJaPiHoW7JWrVBRf1Zz
	EWKFyZbfGJxwQ//LWMwASuWpWLIRtsUdWT8RiMXDGopOpW7xktGnl7YKOa4YPebs
	2BziAQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441nm18u19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 13:48:35 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508DmYJq002507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 13:48:34 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 05:48:28 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Date: Wed, 8 Jan 2025 21:47:15 +0800
Subject: [PATCH net-next v2 08/14] net: ethernet: qualcomm: Initialize PPE
 service code settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-qcom_ipq_ppe-v2-8-7394dbda7199@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736344057; l=15825;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=+Ec43bSnbpku5NMv7jjRmcWpNRD4ah75dVYT4MMS8Xw=;
 b=wiFmOH2B5+o5LawCr3z6BR3V5ZDi5nH2EM9lEbOcRwlnMPQx0MmXLAS1+7dxCq+6zCFtHj5uP
 uDiP9U7aIqGDvO/h7eB+8LVjZBusAZMOb/gUiKFtP0Cw6uNiVDJti8N
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: m6oxz-gd-EKt0XGz4OuLpla_n7GkE4Ic
X-Proofpoint-GUID: m6oxz-gd-EKt0XGz4OuLpla_n7GkE4Ic
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080115

PPE service code is a special code (0-255) that is defined by PPE for
PPE's packet processing stages, as per the network functions required
for the packet.

For packet being sent out by ARM cores on Ethernet ports, The service
code 1 is used as the default service code. This service code is used
to bypass most of packet processing stages of the PPE before the packet
transmitted out PPE port, since the software network stack has already
processed the packet.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c |  95 +++++++++++++++-
 drivers/net/ethernet/qualcomm/ppe/ppe_config.h | 145 +++++++++++++++++++++++++
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   |  53 +++++++++
 3 files changed, 292 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index f379ee9d94a6..c337b4deddc8 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitmap.h>
 #include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/regmap.h>
@@ -1080,6 +1081,75 @@ int ppe_port_resource_get(struct ppe_device *ppe_dev, int port,
 	return 0;
 }
 
+/**
+ * ppe_sc_config_set - Set PPE service code configuration
+ * @ppe_dev: PPE device
+ * @sc: Service ID, 0-255 supported by PPE
+ * @cfg: Service code configuration
+ *
+ * PPE service code is used by the PPE during its packet processing stages,
+ * to perform or bypass certain selected packet operations on the packet.
+ *
+ * Return 0 on success, negative error code on failure.
+ */
+int ppe_sc_config_set(struct ppe_device *ppe_dev, int sc, struct ppe_sc_cfg cfg)
+{
+	u32 val, reg, servcode_val[2] = {};
+	unsigned long bitmap_value;
+	int ret;
+
+	val = FIELD_PREP(PPE_IN_L2_SERVICE_TBL_DST_PORT_ID_VALID, cfg.dest_port_valid);
+	val |= FIELD_PREP(PPE_IN_L2_SERVICE_TBL_DST_PORT_ID, cfg.dest_port);
+	val |= FIELD_PREP(PPE_IN_L2_SERVICE_TBL_DST_DIRECTION, cfg.is_src);
+
+	bitmap_value = bitmap_read(cfg.bitmaps.egress, 0, PPE_SC_BYPASS_EGRESS_SIZE);
+	val |= FIELD_PREP(PPE_IN_L2_SERVICE_TBL_DST_BYPASS_BITMAP, bitmap_value);
+	val |= FIELD_PREP(PPE_IN_L2_SERVICE_TBL_RX_CNT_EN,
+			  test_bit(PPE_SC_BYPASS_COUNTER_RX, cfg.bitmaps.counter));
+	val |= FIELD_PREP(PPE_IN_L2_SERVICE_TBL_TX_CNT_EN,
+			  test_bit(PPE_SC_BYPASS_COUNTER_TX, cfg.bitmaps.counter));
+	reg = PPE_IN_L2_SERVICE_TBL_ADDR + PPE_IN_L2_SERVICE_TBL_INC * sc;
+
+	ret = regmap_write(ppe_dev->regmap, reg, val);
+	if (ret)
+		return ret;
+
+	bitmap_value = bitmap_read(cfg.bitmaps.ingress, 0, PPE_SC_BYPASS_INGRESS_SIZE);
+	PPE_SERVICE_SET_BYPASS_BITMAP(servcode_val, bitmap_value);
+	PPE_SERVICE_SET_RX_CNT_EN(servcode_val,
+				  test_bit(PPE_SC_BYPASS_COUNTER_RX_VLAN, cfg.bitmaps.counter));
+	reg = PPE_SERVICE_TBL_ADDR + PPE_SERVICE_TBL_INC * sc;
+
+	ret = regmap_bulk_write(ppe_dev->regmap, reg,
+				servcode_val, ARRAY_SIZE(servcode_val));
+	if (ret)
+		return ret;
+
+	reg = PPE_EG_SERVICE_TBL_ADDR + PPE_EG_SERVICE_TBL_INC * sc;
+	ret = regmap_bulk_read(ppe_dev->regmap, reg,
+			       servcode_val, ARRAY_SIZE(servcode_val));
+	if (ret)
+		return ret;
+
+	PPE_EG_SERVICE_SET_NEXT_SERVCODE(servcode_val, cfg.next_service_code);
+	PPE_EG_SERVICE_SET_UPDATE_ACTION(servcode_val, cfg.eip_field_update_bitmap);
+	PPE_EG_SERVICE_SET_HW_SERVICE(servcode_val, cfg.eip_hw_service);
+	PPE_EG_SERVICE_SET_OFFSET_SEL(servcode_val, cfg.eip_offset_sel);
+	PPE_EG_SERVICE_SET_TX_CNT_EN(servcode_val,
+				     test_bit(PPE_SC_BYPASS_COUNTER_TX_VLAN, cfg.bitmaps.counter));
+
+	ret = regmap_bulk_write(ppe_dev->regmap, reg,
+				servcode_val, ARRAY_SIZE(servcode_val));
+	if (ret)
+		return ret;
+
+	bitmap_value = bitmap_read(cfg.bitmaps.tunnel, 0, PPE_SC_BYPASS_TUNNEL_SIZE);
+	val = FIELD_PREP(PPE_TL_SERVICE_TBL_BYPASS_BITMAP, bitmap_value);
+	reg = PPE_TL_SERVICE_TBL_ADDR + PPE_TL_SERVICE_TBL_INC * sc;
+
+	return regmap_write(ppe_dev->regmap, reg, val);
+}
+
 static int ppe_config_bm_threshold(struct ppe_device *ppe_dev, int bm_port_id,
 				   struct ppe_bm_port_config port_cfg)
 {
@@ -1490,6 +1560,25 @@ static int ppe_queue_dest_init(struct ppe_device *ppe_dev)
 	return 0;
 }
 
+/* Initialize the service code 1 used by CPU port. */
+static int ppe_servcode_init(struct ppe_device *ppe_dev)
+{
+	struct ppe_sc_cfg sc_cfg = {};
+
+	bitmap_zero(sc_cfg.bitmaps.counter, PPE_SC_BYPASS_COUNTER_SIZE);
+	bitmap_zero(sc_cfg.bitmaps.tunnel, PPE_SC_BYPASS_TUNNEL_SIZE);
+
+	bitmap_fill(sc_cfg.bitmaps.ingress, PPE_SC_BYPASS_INGRESS_SIZE);
+	clear_bit(PPE_SC_BYPASS_INGRESS_FAKE_MAC_HEADER, sc_cfg.bitmaps.ingress);
+	clear_bit(PPE_SC_BYPASS_INGRESS_SERVICE_CODE, sc_cfg.bitmaps.ingress);
+	clear_bit(PPE_SC_BYPASS_INGRESS_FAKE_L2_PROTO, sc_cfg.bitmaps.ingress);
+
+	bitmap_fill(sc_cfg.bitmaps.egress, PPE_SC_BYPASS_EGRESS_SIZE);
+	clear_bit(PPE_SC_BYPASS_EGRESS_ACL_POST_ROUTING_CHECK, sc_cfg.bitmaps.egress);
+
+	return ppe_sc_config_set(ppe_dev, PPE_EDMA_SC_BYPASS_ID, sc_cfg);
+}
+
 int ppe_hw_config(struct ppe_device *ppe_dev)
 {
 	int ret;
@@ -1506,5 +1595,9 @@ int ppe_hw_config(struct ppe_device *ppe_dev)
 	if (ret)
 		return ret;
 
-	return ppe_queue_dest_init(ppe_dev);
+	ret = ppe_queue_dest_init(ppe_dev);
+	if (ret)
+		return ret;
+
+	return ppe_servcode_init(ppe_dev);
 }
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.h b/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
index 6553da34effe..db5b033229d9 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
@@ -6,6 +6,8 @@
 #ifndef __PPE_CONFIG_H__
 #define __PPE_CONFIG_H__
 
+#include <linux/types.h>
+
 #include "ppe.h"
 
 /* There are different table index ranges for configuring queue base ID of
@@ -18,6 +20,9 @@
 #define PPE_QUEUE_INTER_PRI_NUM			16
 #define PPE_QUEUE_HASH_NUM			256
 
+/* The service code is used by EDMA port to transmit packet to PPE. */
+#define PPE_EDMA_SC_BYPASS_ID			1
+
 /**
  * enum ppe_scheduler_frame_mode - PPE scheduler frame mode.
  * @PPE_SCH_WITH_IPG_PREAMBLE_FRAME_CRC: The scheduled frame includes IPG,
@@ -90,6 +95,144 @@ struct ppe_queue_ucast_dest {
 	int dest_port;
 };
 
+/* Hardware bitmaps for bypassing features of the ingress packet. */
+enum ppe_sc_ingress_type {
+	PPE_SC_BYPASS_INGRESS_VLAN_TAG_FMT_CHECK = 0,
+	PPE_SC_BYPASS_INGRESS_VLAN_MEMBER_CHECK = 1,
+	PPE_SC_BYPASS_INGRESS_VLAN_TRANSLATE = 2,
+	PPE_SC_BYPASS_INGRESS_MY_MAC_CHECK = 3,
+	PPE_SC_BYPASS_INGRESS_DIP_LOOKUP = 4,
+	PPE_SC_BYPASS_INGRESS_FLOW_LOOKUP = 5,
+	PPE_SC_BYPASS_INGRESS_FLOW_ACTION = 6,
+	PPE_SC_BYPASS_INGRESS_ACL = 7,
+	PPE_SC_BYPASS_INGRESS_FAKE_MAC_HEADER = 8,
+	PPE_SC_BYPASS_INGRESS_SERVICE_CODE = 9,
+	PPE_SC_BYPASS_INGRESS_WRONG_PKT_FMT_L2 = 10,
+	PPE_SC_BYPASS_INGRESS_WRONG_PKT_FMT_L3_IPV4 = 11,
+	PPE_SC_BYPASS_INGRESS_WRONG_PKT_FMT_L3_IPV6 = 12,
+	PPE_SC_BYPASS_INGRESS_WRONG_PKT_FMT_L4 = 13,
+	PPE_SC_BYPASS_INGRESS_FLOW_SERVICE_CODE = 14,
+	PPE_SC_BYPASS_INGRESS_ACL_SERVICE_CODE = 15,
+	PPE_SC_BYPASS_INGRESS_FAKE_L2_PROTO = 16,
+	PPE_SC_BYPASS_INGRESS_PPPOE_TERMINATION = 17,
+	PPE_SC_BYPASS_INGRESS_DEFAULT_VLAN = 18,
+	PPE_SC_BYPASS_INGRESS_DEFAULT_PCP = 19,
+	PPE_SC_BYPASS_INGRESS_VSI_ASSIGN = 20,
+	/* Values 21-23 are not specified by hardware. */
+	PPE_SC_BYPASS_INGRESS_VLAN_ASSIGN_FAIL = 24,
+	PPE_SC_BYPASS_INGRESS_SOURCE_GUARD = 25,
+	PPE_SC_BYPASS_INGRESS_MRU_MTU_CHECK = 26,
+	PPE_SC_BYPASS_INGRESS_FLOW_SRC_CHECK = 27,
+	PPE_SC_BYPASS_INGRESS_FLOW_QOS = 28,
+	/* This must be last as it determines the size of the BITMAP. */
+	PPE_SC_BYPASS_INGRESS_SIZE,
+};
+
+/* Hardware bitmaps for bypassing features of the egress packet. */
+enum ppe_sc_egress_type {
+	PPE_SC_BYPASS_EGRESS_VLAN_MEMBER_CHECK = 0,
+	PPE_SC_BYPASS_EGRESS_VLAN_TRANSLATE = 1,
+	PPE_SC_BYPASS_EGRESS_VLAN_TAG_FMT_CTRL = 2,
+	PPE_SC_BYPASS_EGRESS_FDB_LEARN = 3,
+	PPE_SC_BYPASS_EGRESS_FDB_REFRESH = 4,
+	PPE_SC_BYPASS_EGRESS_L2_SOURCE_SECURITY = 5,
+	PPE_SC_BYPASS_EGRESS_MANAGEMENT_FWD = 6,
+	PPE_SC_BYPASS_EGRESS_BRIDGING_FWD = 7,
+	PPE_SC_BYPASS_EGRESS_IN_STP_FLTR = 8,
+	PPE_SC_BYPASS_EGRESS_EG_STP_FLTR = 9,
+	PPE_SC_BYPASS_EGRESS_SOURCE_FLTR = 10,
+	PPE_SC_BYPASS_EGRESS_POLICER = 11,
+	PPE_SC_BYPASS_EGRESS_L2_PKT_EDIT = 12,
+	PPE_SC_BYPASS_EGRESS_L3_PKT_EDIT = 13,
+	PPE_SC_BYPASS_EGRESS_ACL_POST_ROUTING_CHECK = 14,
+	PPE_SC_BYPASS_EGRESS_PORT_ISOLATION = 15,
+	PPE_SC_BYPASS_EGRESS_PRE_ACL_QOS = 16,
+	PPE_SC_BYPASS_EGRESS_POST_ACL_QOS = 17,
+	PPE_SC_BYPASS_EGRESS_DSCP_QOS = 18,
+	PPE_SC_BYPASS_EGRESS_PCP_QOS = 19,
+	PPE_SC_BYPASS_EGRESS_PREHEADER_QOS = 20,
+	PPE_SC_BYPASS_EGRESS_FAKE_MAC_DROP = 21,
+	PPE_SC_BYPASS_EGRESS_TUNL_CONTEXT = 22,
+	PPE_SC_BYPASS_EGRESS_FLOW_POLICER = 23,
+	/* This must be last as it determines the size of the BITMAP. */
+	PPE_SC_BYPASS_EGRESS_SIZE,
+};
+
+/* Hardware bitmaps for bypassing counter of packet. */
+enum ppe_sc_counter_type {
+	PPE_SC_BYPASS_COUNTER_RX_VLAN = 0,
+	PPE_SC_BYPASS_COUNTER_RX = 1,
+	PPE_SC_BYPASS_COUNTER_TX_VLAN = 2,
+	PPE_SC_BYPASS_COUNTER_TX = 3,
+	/* This must be last as it determines the size of the BITMAP. */
+	PPE_SC_BYPASS_COUNTER_SIZE,
+};
+
+/* Hardware bitmaps for bypassing features of tunnel packet. */
+enum ppe_sc_tunnel_type {
+	PPE_SC_BYPASS_TUNNEL_SERVICE_CODE = 0,
+	PPE_SC_BYPASS_TUNNEL_TUNNEL_HANDLE = 1,
+	PPE_SC_BYPASS_TUNNEL_L3_IF_CHECK = 2,
+	PPE_SC_BYPASS_TUNNEL_VLAN_CHECK = 3,
+	PPE_SC_BYPASS_TUNNEL_DMAC_CHECK = 4,
+	PPE_SC_BYPASS_TUNNEL_UDP_CSUM_0_CHECK = 5,
+	PPE_SC_BYPASS_TUNNEL_TBL_DE_ACCE_CHECK = 6,
+	PPE_SC_BYPASS_TUNNEL_PPPOE_MC_TERM_CHECK = 7,
+	PPE_SC_BYPASS_TUNNEL_TTL_EXCEED_CHECK = 8,
+	PPE_SC_BYPASS_TUNNEL_MAP_SRC_CHECK = 9,
+	PPE_SC_BYPASS_TUNNEL_MAP_DST_CHECK = 10,
+	PPE_SC_BYPASS_TUNNEL_LPM_DST_LOOKUP = 11,
+	PPE_SC_BYPASS_TUNNEL_LPM_LOOKUP = 12,
+	PPE_SC_BYPASS_TUNNEL_WRONG_PKT_FMT_L2 = 13,
+	PPE_SC_BYPASS_TUNNEL_WRONG_PKT_FMT_L3_IPV4 = 14,
+	PPE_SC_BYPASS_TUNNEL_WRONG_PKT_FMT_L3_IPV6 = 15,
+	PPE_SC_BYPASS_TUNNEL_WRONG_PKT_FMT_L4 = 16,
+	PPE_SC_BYPASS_TUNNEL_WRONG_PKT_FMT_TUNNEL = 17,
+	/* Values 18-19 are not specified by hardware. */
+	PPE_SC_BYPASS_TUNNEL_PRE_IPO = 20,
+	/* This must be last as it determines the size of the BITMAP. */
+	PPE_SC_BYPASS_TUNNEL_SIZE,
+};
+
+/**
+ * struct ppe_sc_bypss - PPE service bypass bitmaps
+ * @ingress: Bitmap of features that can be bypassed on the ingress packet.
+ * @egress: Bitmap of features that can be bypassed on the egress packet.
+ * @counter: Bitmap of features that can be bypassed on the counter type.
+ * @tunnel: Bitmap of features that can be bypassed on the tunnel packet.
+ */
+struct ppe_sc_bypass {
+	DECLARE_BITMAP(ingress, PPE_SC_BYPASS_INGRESS_SIZE);
+	DECLARE_BITMAP(egress, PPE_SC_BYPASS_EGRESS_SIZE);
+	DECLARE_BITMAP(counter, PPE_SC_BYPASS_COUNTER_SIZE);
+	DECLARE_BITMAP(tunnel, PPE_SC_BYPASS_TUNNEL_SIZE);
+};
+
+/**
+ * struct ppe_sc_cfg - PPE service code configuration.
+ * @dest_port_valid: Generate destination port or not.
+ * @dest_port: Destination port ID.
+ * @bitmaps: Bitmap of bypass features.
+ * @is_src: Destination port acts as source port, packet sent to CPU.
+ * @next_service_code: New service code generated.
+ * @eip_field_update_bitmap: Fields updated as actions taken for EIP.
+ * @eip_hw_service: Selected hardware functions for EIP.
+ * @eip_offset_sel: Packet offset selection, using packet's layer 4 offset
+ * or using packet's layer 3 offset for EIP.
+ *
+ * Service code is generated during the packet passing through PPE.
+ */
+struct ppe_sc_cfg {
+	bool dest_port_valid;
+	int dest_port;
+	struct ppe_sc_bypass bitmaps;
+	bool is_src;
+	int next_service_code;
+	int eip_field_update_bitmap;
+	int eip_hw_service;
+	int eip_offset_sel;
+};
+
 int ppe_hw_config(struct ppe_device *ppe_dev);
 int ppe_queue_scheduler_set(struct ppe_device *ppe_dev,
 			    int node_id, bool flow_level, int port,
@@ -109,4 +252,6 @@ int ppe_queue_ucast_offset_hash_set(struct ppe_device *ppe_dev,
 int ppe_port_resource_get(struct ppe_device *ppe_dev, int port,
 			  enum ppe_resource_type type,
 			  int *res_start, int *res_end);
+int ppe_sc_config_set(struct ppe_device *ppe_dev, int sc,
+		      struct ppe_sc_cfg cfg);
 #endif
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
index 0232f23dcefe..80f003afad78 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
@@ -25,10 +25,63 @@
 #define PPE_BM_SCH_CFG_TBL_SECOND_PORT_VALID	BIT(6)
 #define PPE_BM_SCH_CFG_TBL_SECOND_PORT		GENMASK(11, 8)
 
+/* PPE service code configuration for the ingress direction functions,
+ * including bypass configuration for relevant PPE switch core functions
+ * such as flow entry lookup bypass.
+ */
+#define PPE_SERVICE_TBL_ADDR			0x15000
+#define PPE_SERVICE_TBL_ENTRIES			256
+#define PPE_SERVICE_TBL_INC			0x10
+#define PPE_SERVICE_W0_BYPASS_BITMAP		GENMASK(31, 0)
+#define PPE_SERVICE_W1_RX_CNT_EN		BIT(0)
+
+#define PPE_SERVICE_SET_BYPASS_BITMAP(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_SERVICE_W0_BYPASS_BITMAP)
+#define PPE_SERVICE_SET_RX_CNT_EN(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_SERVICE_W1_RX_CNT_EN)
+
 /* PPE queue counters enable/disable control. */
 #define PPE_EG_BRIDGE_CONFIG_ADDR		0x20044
 #define PPE_EG_BRIDGE_CONFIG_QUEUE_CNT_EN	BIT(2)
 
+/* PPE service code configuration on the egress direction. */
+#define PPE_EG_SERVICE_TBL_ADDR			0x43000
+#define PPE_EG_SERVICE_TBL_ENTRIES		256
+#define PPE_EG_SERVICE_TBL_INC			0x10
+#define PPE_EG_SERVICE_W0_UPDATE_ACTION		GENMASK(31, 0)
+#define PPE_EG_SERVICE_W1_NEXT_SERVCODE		GENMASK(7, 0)
+#define PPE_EG_SERVICE_W1_HW_SERVICE		GENMASK(13, 8)
+#define PPE_EG_SERVICE_W1_OFFSET_SEL		BIT(14)
+#define PPE_EG_SERVICE_W1_TX_CNT_EN		BIT(15)
+
+#define PPE_EG_SERVICE_SET_UPDATE_ACTION(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_EG_SERVICE_W0_UPDATE_ACTION)
+#define PPE_EG_SERVICE_SET_NEXT_SERVCODE(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_EG_SERVICE_W1_NEXT_SERVCODE)
+#define PPE_EG_SERVICE_SET_HW_SERVICE(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_EG_SERVICE_W1_HW_SERVICE)
+#define PPE_EG_SERVICE_SET_OFFSET_SEL(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_EG_SERVICE_W1_OFFSET_SEL)
+#define PPE_EG_SERVICE_SET_TX_CNT_EN(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_EG_SERVICE_W1_TX_CNT_EN)
+
+/* PPE service code configuration for destination port and counter. */
+#define PPE_IN_L2_SERVICE_TBL_ADDR		0x66000
+#define PPE_IN_L2_SERVICE_TBL_ENTRIES		256
+#define PPE_IN_L2_SERVICE_TBL_INC		0x10
+#define PPE_IN_L2_SERVICE_TBL_DST_PORT_ID_VALID	BIT(0)
+#define PPE_IN_L2_SERVICE_TBL_DST_PORT_ID	GENMASK(4, 1)
+#define PPE_IN_L2_SERVICE_TBL_DST_DIRECTION	BIT(5)
+#define PPE_IN_L2_SERVICE_TBL_DST_BYPASS_BITMAP	GENMASK(29, 6)
+#define PPE_IN_L2_SERVICE_TBL_RX_CNT_EN		BIT(30)
+#define PPE_IN_L2_SERVICE_TBL_TX_CNT_EN		BIT(31)
+
+/* PPE service code configuration for the tunnel packet. */
+#define PPE_TL_SERVICE_TBL_ADDR			0x306000
+#define PPE_TL_SERVICE_TBL_ENTRIES		256
+#define PPE_TL_SERVICE_TBL_INC			4
+#define PPE_TL_SERVICE_TBL_BYPASS_BITMAP	GENMASK(31, 0)
+
 /* Port scheduler global config. */
 #define PPE_PSCH_SCH_DEPTH_CFG_ADDR		0x400000
 #define PPE_PSCH_SCH_DEPTH_CFG_INC		4

-- 
2.34.1


