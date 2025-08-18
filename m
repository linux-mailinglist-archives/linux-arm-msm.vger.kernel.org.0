Return-Path: <linux-arm-msm+bounces-69582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5325B2A4FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 15:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 526FE6805BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 13:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA06F343D83;
	Mon, 18 Aug 2025 13:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d5fZ9/l0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C38343D72;
	Mon, 18 Aug 2025 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755522963; cv=none; b=ag/EVB8mYWAocqsPYRm3lCVG6Xvol10LkcrxyZV/GH8B09WDBMk/xNY9KT4qONVdNHNgwQpGGg2pK5TGNBF+n6XLkFSVckgXQm7NajRAMbrHG41YGn0CNeLe7qlICLiZpnS7IC+mJXg3H26KKr1FipII5zW8o5JkzBfcH6fY3TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755522963; c=relaxed/simple;
	bh=3mfJCOR0NS3MQtBN5FnvywVQlioFVlO58COMrzJC7+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=I9Qxt8kANM12UaBpQWpcAeMbvQj1nXWHdQ07h0dv6UfN15/e9ToQ5Rb8fFzIDX/ybP8Vb3nsIhCvmLpweSou5Z3Kpg+lcuP9CCJyxxo5g/2p4QGE3BhSSPDDYjDqk2543aIunBWTyxmVXiCVQ/DEkC70wFXXGgzhtVCFaHQnHcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d5fZ9/l0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I83WpB017909;
	Mon, 18 Aug 2025 13:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	weB+bLl1WhskwwxfNfERjkewJapw684zzpA1K7nX09M=; b=d5fZ9/l0XFn+W8+G
	Jkjjb/UYSgD4zA66l2gZSm5P6iQdvDGp58hf5k1/pZqxtTaYUGniAUO9VZkvfuW9
	oR9pz+4sfSm0Amok98mrOs03P6iHwwydsP+GQzYNeZ0wOy6Ft5sKpF8LA1e4njgG
	UsTRlHcC21URXmklfsHJpFpIWn5q0RpQb7KXwDdlxUYGTtPrmZo5GBpEGuxodR6Q
	hFXp+Manx77b+2ypMeFvlNwEIyfKCWhPx70eERzuxDWSv3K+j4u28Ry/8payOnV7
	F+cInIXHttc3hLXRCFjHNN8ORiifrRdunAAqsrVQqmiMTZLRZAIzKckdoHhllZbl
	paR4gQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtcx4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 13:15:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57IDFoTk002670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 13:15:50 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 18 Aug 2025 06:15:45 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Mon, 18 Aug 2025 21:14:35 +0800
Subject: [PATCH net-next v8 11/14] net: ethernet: qualcomm: Initialize PPE
 queue to Ethernet DMA ring mapping
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250818-qcom_ipq_ppe-v8-11-1d4ff641fce9@quicinc.com>
References: <20250818-qcom_ipq_ppe-v8-0-1d4ff641fce9@quicinc.com>
In-Reply-To: <20250818-qcom_ipq_ppe-v8-0-1d4ff641fce9@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755522889; l=4626;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=3mfJCOR0NS3MQtBN5FnvywVQlioFVlO58COMrzJC7+0=;
 b=VViKm9Ot4s69qaYLRkbtl0h2kZdOs3GWdtEdbIoXLTOy2T4wxJML4caTJT6Eaeo0DqEk8yadr
 z3TohI9wRV7BI8eI+h+yxlNVZsya+RPNdToOb7PHbaQWRTkVy6Wf+SG
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wq4Vk9unKrHc6mCiJgpyaq2xFu8LDwml
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX+TOZDTdOvtG4
 WC5RH26JVbuw5fLZZHy+UCXQ+FdGeKO78Tv4uExNoae/hB1FQj/1K94ybqBubqo2r2Kh4rqZHrg
 paZjv0M48fMw/79VJzoHRMJyUYfE1thwe5C76ZZWXM5vNNYe88Ut/gbAbYmXWRkGyH7QmsPiov7
 UrYYLN5z5PYyfZtQ1EZpjBA3RD5X4JDcYEN5ASy6SkFhgOMYo1O4AyfcQZkNdXhKNhaAdOMzcHm
 oNj8o9uX+wcJSOQsbEqtGa9TWsKStrJjtkI/WtYGBtdOBYgXytdMKA/+MpJ2gM6jiDWpNgMRHhV
 qPtVauwDkx6nk80FCJmOvaN+9ox3CRM9ElEtpx61rhgrl/YlWGVpi0rloDyP0d8EHd7SzzirG6u
 i8p/3VOn
X-Proofpoint-GUID: wq4Vk9unKrHc6mCiJgpyaq2xFu8LDwml
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a32787 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=r3sHWlaIaOML1aV7Y10A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020

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
index a794ccd3b517..928fc0879269 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -1357,6 +1357,28 @@ int ppe_rss_hash_config_set(struct ppe_device *ppe_dev, int mode,
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
@@ -1879,6 +1901,25 @@ static int ppe_rss_hash_init(struct ppe_device *ppe_dev)
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
@@ -1907,5 +1948,9 @@ int ppe_hw_config(struct ppe_device *ppe_dev)
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
index eb4a82375bb2..4bb45ca40144 100644
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
index 3e9cccedc6be..224beda046d4 100644
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


