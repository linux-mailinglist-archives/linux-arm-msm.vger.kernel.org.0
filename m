Return-Path: <linux-arm-msm+bounces-57685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA51AB50D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 12:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78C1916E27E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 10:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B1B2505A9;
	Tue, 13 May 2025 09:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ldIcZrtj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D69624EF76;
	Tue, 13 May 2025 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130394; cv=none; b=fdMwYFu4fjqhOh8N8ZMdsDdxQE2MMT2vYJbAManC/xHh1IU//G/OAApooMzF7J6hO0j0xxkSxXYInEAIwVM9QUYMmQ12WuRO/OrXiN2Qh9TlQpf03Vc38At7ZObsgYaHKiEjvgb4Ornv+obl0WIHBjXo1HQkPRJV09undxInvhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130394; c=relaxed/simple;
	bh=BlNJ5t+bUTaBWb6Qh/kBzakrg4DmJ8basTXwW4rJH5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QaXDR2ibaf3bxB/mB1DyqA8CGDkwFnmZKAlgCVc8ZwbX/quFE3ffSL+1NO3jKYsvQo9soZHZCKsV0YbeEVG6A5X3zZZ6rKIMXGje+X256WrN5+1MVOkxJCGPwiBYHrbtqYCBleRh3hdwqfeZ+jls2si3m3kFS2Y9QKzqbOmfFKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ldIcZrtj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D9IRjl028451;
	Tue, 13 May 2025 09:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JC9s/wxtE4UM6Qo1URmWdNgQMlkOE90jvv0j7LFuxls=; b=ldIcZrtjl0Bg49MZ
	ACIyODZro9idxhUGMFgSN6xzevWZygZedkI0NYc+rw88kcN2SLNdTwOTc+5Ng7M6
	GxSqahOg0RprOYcGYdwffpS2zPldMhon0D4335NkNVgwGvZ/pyp8RB/IBtNnm4H3
	zP8X6n/6orweOfxJp9ABDlPgkSZESohA14WXqJdboVVnfvDpndwJV1G59ni3eVjf
	V5x1bf54m1mgGLXKNF6xOgJPfZXOGKa4SGF5k5sBmBI1mJOPQpN9CDb9yhoYll6T
	kBfAgHvq9V7fATyazzhopUSe5i3/DZ3gZiV9MHYMAzA5K1ykdpaTIhstm6YAShxv
	WfomkA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hxvxf95e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 09:59:39 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54D9xctO018264
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 09:59:38 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 02:59:32 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 13 May 2025 17:58:31 +0800
Subject: [PATCH net-next v4 11/14] net: ethernet: qualcomm: Initialize PPE
 queue to Ethernet DMA ring mapping
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250513-qcom_ipq_ppe-v4-11-4fbe40cbbb71@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747130311; l=4626;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=BlNJ5t+bUTaBWb6Qh/kBzakrg4DmJ8basTXwW4rJH5w=;
 b=WfFIlVNDFoxcFsnEPG6SfavkR4V+snN1a+kuJpcrqQUoqCsV/U4kJ3pOzFQ6cUc2Lqw1ynO37
 qFS+P62O709CfV4pBLgJmH0GJVeeQ13IDe5/6oJiebwB7AuJPg/Myiy
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDA5NCBTYWx0ZWRfXznd+0vBFQZ72
 88KPwYm+0yIUWzbkTbgmvtCvyEh+xjqQBVXmFmqJxdcXEABYfSUAH2MOAxN7OuL2AOjLvjM2FZY
 0jp1AhnSh+8yGWFwwX+A+hvauV1H869bL75HpLuvwUsAE/8XafIbw0Fw28mP85H+83LwZrAqmDw
 6aWKCvcOd6Ov1IJ+5W9cFhmc+51Ui0zGpY3zgKpeD0XxmF90hebOzkRjzq8PvdftzzGXIo83MBE
 /wrqRbzNzEImx8IJSh0LGZOeMqEZE2Yds7QXSa9a06iJnj1Q77zS9DqUFRLIaJkBecoxYvW5hhr
 lm3KZjTRtMy9Ce3MK+NzqFvaucXljFrp5qkNXtCtuuMets3+/fOvYsVzYZeFnijs+gi0Q+Cc0Fb
 B8s3ZfLKalhNMsxI0pB5sgEX/LykkkmZVQyW9QPid4+YT3A6XFqnplunzYdQw3t3NEqlaT0h
X-Proofpoint-GUID: hOsfHQ4vBzH7XOGCFVvDz8GO6QoiM7Xf
X-Authority-Analysis: v=2.4 cv=WMV/XmsR c=1 sm=1 tr=0 ts=6823180b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=r3sHWlaIaOML1aV7Y10A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hOsfHQ4vBzH7XOGCFVvDz8GO6QoiM7Xf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505130094

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
index 3b290eda7633..29d0af091854 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -1353,6 +1353,28 @@ int ppe_rss_hash_config_set(struct ppe_device *ppe_dev, int mode,
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
@@ -1874,6 +1896,25 @@ static int ppe_rss_hash_init(struct ppe_device *ppe_dev)
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
@@ -1902,5 +1943,9 @@ int ppe_hw_config(struct ppe_device *ppe_dev)
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
index ef1602674ec4..8a89d9aa82ae 100644
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


