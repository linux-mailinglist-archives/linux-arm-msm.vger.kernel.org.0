Return-Path: <linux-arm-msm+bounces-44394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D684A05D87
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 973A01628F8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B9320011A;
	Wed,  8 Jan 2025 13:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bt6PtQnP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FFF1FFC79;
	Wed,  8 Jan 2025 13:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736344150; cv=none; b=lkLfBy1+YaWDN9w+Fe3ehwlF/+4k+39BebuSPAzDWwPJULUdipSgrOXDeDhrAhgmhk4ZhC5FFGT/ccyanE1OXryLn+3yqhzVNg/BWivzpU8TyJzwp91wxb1H8Gp4/qge9dBeevwGUwDZ0cQJHb1rn/NlRjGVEkj5tBSCHiasNrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736344150; c=relaxed/simple;
	bh=m88q3dRMbC2B0bRFzycAWbr5fIWXSgjQAOZJu8ymaQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iPPBz2iFt+sAErVsyA4X3EVieCeHt0rYU7kc74ZyKqxF0FZ6ugNiQ0zXDpp40qGr0ItjewES7sLdjlS4KCGtjpPT9vVW1PpywKkLjGoupdLGagrRw+X/XlomlUL2msLWCXnJYlntfKzwDXlB50Akt09fg9YXC8WbbYjCE9Qdak0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bt6PtQnP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508BqcnI028792;
	Wed, 8 Jan 2025 13:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3cU/iqvzHgkvvEuBocq1qWY+mS22GSzG1Y26ckGukdQ=; b=bt6PtQnPw/RHwMaF
	vgdgWAqOc9eQKcUYvTtRj0msVYKhoMUSeyv48YENo3lsglGXmBqXvooHryay9FG9
	Y5J3H1jUbxr4V8Gn0JgnfGOeC4Yn7lEQaHykfx+ISOOkmwCRm/CXS4P836t5Kzv9
	FWmTR/CqcTxcaGmEf2a/vpvgyZCSaCfxJmSduChwBMwZjiMCK9BJOw4VsY5fsN72
	ck/rHrUQukrOL0D+n2b/n8WX2iuNKMp6xDA8O/+kX6+3giGxWfyH4FoIpbtXfi5r
	ehZfYO5ckEd7oeotfJKkOGMW2SDcRWsUKOykjz1vOqvkDFFBYjbMNwNHBxmHkJgF
	xHGdgQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441rvh084e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 13:48:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508DmroN027562
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 13:48:53 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 05:48:47 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Date: Wed, 8 Jan 2025 21:47:18 +0800
Subject: [PATCH net-next v2 11/14] net: ethernet: qualcomm: Initialize PPE
 queue to Ethernet DMA ring mapping
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-qcom_ipq_ppe-v2-11-7394dbda7199@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736344057; l=4632;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=m88q3dRMbC2B0bRFzycAWbr5fIWXSgjQAOZJu8ymaQM=;
 b=tpr1LDtUfDY4BjOrwCR057EhTUwHiFTfNYzSDBbdWMIlI3d9T0AXQp0XYoGS0hj4ePj3ischw
 SEIpqZTE+1pB+80GBB7OaYj2ilqgz7m8qb8rBTBQLMR6i/cuEb7WRAr
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OKmsRqk2ug-WTTK2g5JyzGj4VbH35m9M
X-Proofpoint-GUID: OKmsRqk2ug-WTTK2g5JyzGj4VbH35m9M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080115

Configure the selected queues to map with an Ethernet DMA ring for the
packet to receive on ARM cores.

As default initialization, all queues assigned to CPU port 0 are mapped
to the EDMA ring 0. This configuration is later updated during Ethernet
DMA initialization.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 47 +++++++++++++++++++++++++-
 drivers/net/ethernet/qualcomm/ppe/ppe_config.h |  6 ++++
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   |  5 +++
 3 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index 1f180784a330..39e4d19c2bd6 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -1332,6 +1332,28 @@ int ppe_rss_hash_config_set(struct ppe_device *ppe_dev, int mode,
 	return 0;
 }
 
+/**
+ * ppe_ring_queue_map_set - Set the PPE queue to Ethernet DMA ring mapping
+ * @ppe_dev: PPE device
+ * @ring_id: Ethernet DMA ring ID
+ * @queue_map: Bit map of queue IDs to given Ethernet DMA ring
+ *
+ * Configure the mapping from a set of PPE queues to a given Ethernet DMA ring.
+ *
+ * Return 0 on success, negative error code on failure.
+ */
+int ppe_ring_queue_map_set(struct ppe_device *ppe_dev, int ring_id, u32 *queue_map)
+{
+	u32 reg, queue_bitmap_val[PPE_RING_TO_QUEUE_BITMAP_WORD_CNT];
+
+	memcpy(queue_bitmap_val, queue_map, sizeof(queue_bitmap_val));
+	reg = PPE_RING_Q_MAP_TBL_ADDR + PPE_RING_Q_MAP_TBL_INC * ring_id;
+
+	return regmap_bulk_write(ppe_dev->regmap, reg,
+				 queue_bitmap_val,
+				 ARRAY_SIZE(queue_bitmap_val));
+}
+
 static int ppe_config_bm_threshold(struct ppe_device *ppe_dev, int bm_port_id,
 				   struct ppe_bm_port_config port_cfg)
 {
@@ -1854,6 +1876,25 @@ static int ppe_rss_hash_init(struct ppe_device *ppe_dev)
 	return ppe_rss_hash_config_set(ppe_dev, PPE_RSS_HASH_MODE_IPV6, hash_cfg);
 }
 
+/* Initialize mapping between PPE queues assigned to CPU port 0
+ * to Ethernet DMA ring 0.
+ */
+static int ppe_queues_to_ring_init(struct ppe_device *ppe_dev)
+{
+	u32 queue_bmap[PPE_RING_TO_QUEUE_BITMAP_WORD_CNT] = {};
+	int ret, queue_id, queue_max;
+
+	ret = ppe_port_resource_get(ppe_dev, 0, PPE_RES_UCAST,
+				    &queue_id, &queue_max);
+	if (ret)
+		return ret;
+
+	for (; queue_id <= queue_max; queue_id++)
+		queue_bmap[queue_id / 32] |= BIT_MASK(queue_id % 32);
+
+	return ppe_ring_queue_map_set(ppe_dev, 0, queue_bmap);
+}
+
 int ppe_hw_config(struct ppe_device *ppe_dev)
 {
 	int ret;
@@ -1882,5 +1923,9 @@ int ppe_hw_config(struct ppe_device *ppe_dev)
 	if (ret)
 		return ret;
 
-	return ppe_rss_hash_init(ppe_dev);
+	ret = ppe_rss_hash_init(ppe_dev);
+	if (ret)
+		return ret;
+
+	return ppe_queues_to_ring_init(ppe_dev);
 }
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.h b/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
index 6190e2d53aa8..786b0f76af24 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
@@ -29,6 +29,9 @@
 #define PPE_RSS_HASH_IP_LENGTH			4
 #define PPE_RSS_HASH_TUPLES			5
 
+/* PPE supports 300 queues, each bit presents as one queue. */
+#define PPE_RING_TO_QUEUE_BITMAP_WORD_CNT	10
+
 /**
  * enum ppe_scheduler_frame_mode - PPE scheduler frame mode.
  * @PPE_SCH_WITH_IPG_PREAMBLE_FRAME_CRC: The scheduled frame includes IPG,
@@ -304,4 +307,7 @@ int ppe_sc_config_set(struct ppe_device *ppe_dev, int sc,
 int ppe_counter_enable_set(struct ppe_device *ppe_dev, int port, bool enable);
 int ppe_rss_hash_config_set(struct ppe_device *ppe_dev, int mode,
 			    struct ppe_rss_hash_cfg hash_cfg);
+int ppe_ring_queue_map_set(struct ppe_device *ppe_dev,
+			   int ring_id,
+			   u32 *queue_map);
 #endif
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
index 5aa46c41e066..da55b06b30b8 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
@@ -207,6 +207,11 @@
 #define PPE_L0_COMP_CFG_TBL_SHAPER_METER_LEN	GENMASK(1, 0)
 #define PPE_L0_COMP_CFG_TBL_NODE_METER_LEN	GENMASK(3, 2)
 
+/* PPE queue to Ethernet DMA ring mapping table. */
+#define PPE_RING_Q_MAP_TBL_ADDR			0x42a000
+#define PPE_RING_Q_MAP_TBL_ENTRIES		24
+#define PPE_RING_Q_MAP_TBL_INC			0x40
+
 /* Table addresses for per-queue dequeue setting. */
 #define PPE_DEQ_OPR_TBL_ADDR			0x430000
 #define PPE_DEQ_OPR_TBL_ENTRIES			300

-- 
2.34.1


