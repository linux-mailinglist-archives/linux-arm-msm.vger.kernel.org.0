Return-Path: <linux-arm-msm+bounces-47317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5E7A2DE7F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 15:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A2F73A50FE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 14:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947441E5B8D;
	Sun,  9 Feb 2025 14:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zzh0gA+C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D952D1E98E3;
	Sun,  9 Feb 2025 14:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739111474; cv=none; b=Nz6UGrb0sLs+H151Nby33XdWwucw0hVNgV05YeQCulm0XONnYSnNkbjvxzL/6EAZi+uuv8hb7qXCbKEnrd48Czd8rcs+MfU+oRFz8LXog2Jaj9fstezjN1QP6dm0TtMInyqddf9gnOrwUvVhbod6u6/3WMtNvLAX6iUdv86DgKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739111474; c=relaxed/simple;
	bh=nSldvyYvVFvnbaFvZYjCZhhS3X2enuEHZArB5Uadi8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SOOGg3nYeAjkfEWelRW1hkN0V7gwrtejzv/IqK0DSDci0EzCh4eI1GIW1ILVC0T0d/H4Pm4Xko2cG/s96bh3ZMHBLQv5FsPRF/9tI6bR21GBBeKPoE3ju0Pyt7Y5tisNqfABT39v6DrNHVY9AP1sxq6Mwjg+hmSNK63K2vcYDpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zzh0gA+C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5197sfSX012709;
	Sun, 9 Feb 2025 14:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+b+DOsqKfuWDmppWRXqfaKyaZq8yaEGS27rzw9EyTZQ=; b=Zzh0gA+CjFiWy5vK
	R7yBXojSPV2WH+kPB2svmU8bWAZDsQPVahfaTaJm3DzN5WWo2Ukg0b7/U+QsMkQu
	oheyH5dq0TLQwVTRPZ9EtXPJbtP1c07ml/S0fCOW9moBS3oAfnuuVDkjeM7tCHBF
	y2aAkuxRHI4lbwIHJjRY/lZNluAYlYecc/fhliqAYTmYp5I1rIIWmKgTFVBJVozk
	vDqjOOV/J9FrHSnjiz70JD/8ChESRU1+H/8mWKi5uhIKf6DCAVYS77OuaRKIPSRU
	yZh1sCN1kjPGLDrq8oCktKJCNXTzJCznxWkgzEHAPVX+m/vgj6c4Fh/Jo85O77Dc
	AokfQQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dxa434-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Feb 2025 14:30:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 519EUuHl026954
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 9 Feb 2025 14:30:56 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 9 Feb 2025 06:30:50 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Date: Sun, 9 Feb 2025 22:29:45 +0800
Subject: [PATCH net-next v3 11/14] net: ethernet: qualcomm: Initialize PPE
 queue to Ethernet DMA ring mapping
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250209-qcom_ipq_ppe-v3-11-453ea18d3271@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739111388; l=4626;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=nSldvyYvVFvnbaFvZYjCZhhS3X2enuEHZArB5Uadi8A=;
 b=V93VyVeq6Y6rB5R6bDUuiOBxdn/QS6tgzEquEaW6ftWoOpB9SCSe7cKKwyxPg63SqTSMv4hrB
 TkUEpHgEXkPBS5EOtCpjT+TtiugD7eRZnNlUK/7WiWikj+uEJeXW5Pm
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: alluo5Gi8Deqi0JinXhwN_LZO0dZTONE
X-Proofpoint-ORIG-GUID: alluo5Gi8Deqi0JinXhwN_LZO0dZTONE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-09_06,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502090129

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
index d9dda7102a28..cf4d653bcfc5 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -1328,6 +1328,28 @@ int ppe_rss_hash_config_set(struct ppe_device *ppe_dev, int mode,
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
+ * Return: 0 on success, negative error code on failure.
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
 				   const struct ppe_bm_port_config port_cfg)
 {
@@ -1847,6 +1869,25 @@ static int ppe_rss_hash_init(struct ppe_device *ppe_dev)
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
@@ -1875,5 +1916,9 @@ int ppe_hw_config(struct ppe_device *ppe_dev)
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
index fedcb9d9602f..6383f399df54 100644
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
@@ -308,4 +311,7 @@ int ppe_sc_config_set(struct ppe_device *ppe_dev, int sc,
 int ppe_counter_enable_set(struct ppe_device *ppe_dev, int port);
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


