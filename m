Return-Path: <linux-arm-msm+bounces-65785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E053AB0B54D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 13:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D86CE17D20B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 11:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2276A22D7A5;
	Sun, 20 Jul 2025 10:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HN0psLyP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A54F22AE75;
	Sun, 20 Jul 2025 10:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753009121; cv=none; b=ujxySLLbaLjmTAAuCOsWsRby4l5tqqw291zaG849/lLA6PnBDk5uYBCR1VDj6kMrB7XJ5njJTXbGA7Pre3FvgTSuufqKjjHwgiE/daX0JC4q4qklqKRf/+1RWUEkZdBudMQzFY1HF4c2Y3qR8+z/l0fiHwDILNQWJ0dnJZTo3X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753009121; c=relaxed/simple;
	bh=6VtWVkTNVOZtUgFVvV9b2fZ8HCfvt7B0qC/AHI2oVAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=J8FkwJlc+XfCuCr0J2eN1VkSQ3bDxtX6AeLd/+0VitfW0h+NK24pznz/YtTRyEwYTNYIHiJEcx04BtrEUepqmrsB3QdFqfDIbX16qCd6sKuRA2xfONQke1O6zyRy47rc1GJbTC0GtgSA5zt5UogI0XqbpWQ/pR/PI1MKfpRGLuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HN0psLyP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K9t3C7014955;
	Sun, 20 Jul 2025 10:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WevQSwYMpLNixNcM6oNa4PjG86D6J4a6glhP26QVi1U=; b=HN0psLyPBWn5XdpR
	dL8zaqz4NTGJ0AGvrbYJIPZkbXUGngekW5+6g8p/mCmDnRoWAq6EFB5t2AwvdYbC
	/qsGKENZn/GmpimDwa8CK4RKxGQPpGwb4FC/8XdZx7oT7jiH60E/o/Q1XEzLsv+R
	weQmeWQ9pnoUhHG97AEzv6u4mvD8V+e94Yx26tbie2BsE897mfcXUY0/b1aiwFpm
	9hFzZUc2A4nmawHQCrxtYQjYsNt3q0rrULEQjWLUZ6+5TPSe5ZaU/S3thUtg/JCT
	RzRqCtUWp6f3vzImvhfFCnHQHQiKmvZ1m0PCGog7T5Tn4hEgd1MKkRWcgZnhhw56
	3fdgZQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480459j2ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 10:58:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56KAwGnB000580
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 10:58:16 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 20 Jul 2025 03:58:11 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Sun, 20 Jul 2025 18:57:18 +0800
Subject: [PATCH net-next v6 11/14] net: ethernet: qualcomm: Initialize PPE
 queue to Ethernet DMA ring mapping
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250720-qcom_ipq_ppe-v6-11-4ae91c203a5f@quicinc.com>
References: <20250720-qcom_ipq_ppe-v6-0-4ae91c203a5f@quicinc.com>
In-Reply-To: <20250720-qcom_ipq_ppe-v6-0-4ae91c203a5f@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753009036; l=4626;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=6VtWVkTNVOZtUgFVvV9b2fZ8HCfvt7B0qC/AHI2oVAk=;
 b=6pLTnVInHBwPfZrXbMkGuqyrCrsWGoWByYiBTjcHXl69iGRn9NmeeVK2xMIKvtGIuaMZS+7Pr
 S5zh0fqN1vEBu9/n46Ca7tfFdQObFdyXXN42+HPWNaaLzHFI9s1OKpy
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tfrQeSgVA2AxFJa6Fso64B29Qxf4JtaA
X-Authority-Analysis: v=2.4 cv=fdyty1QF c=1 sm=1 tr=0 ts=687ccbc9 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=r3sHWlaIaOML1aV7Y10A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tfrQeSgVA2AxFJa6Fso64B29Qxf4JtaA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDEwNSBTYWx0ZWRfX7AK54Vq4DIuL
 T33wbHwZZ5dSmb0+UCSZAU1FkvXhMbSmwZ/uZyFKS5DRXDmvbDs6fBRZIwEqkWYI9e6xuPUhLqC
 nlNpM4ZIS66sxhDE/jfCJFO336tPlG37PW/r3u22ISXj7crGY92LeWO68MW3VRAfBTUd7sfeo4K
 byzGLg9a/oM24+JLWA87vbKPdY/4EYlKfTdmxDHws6677M72KW9JRBdZy3H1BKaeSc+nMrbnucm
 7Ri5MXl7mrKPQOWpx/SP3VnSCXJJpy9aHGTo4Pd1d+4cPXCVlVLkt9Ou3yP4KAgEswNnImolkpC
 KKOAOgRfOsLdrT7PB8huq2M9c1/mmKjPxQQUy+SFe2sm4E1VcgbLAxtF4vskIIcMeWDdGcjJ0Ol
 PXHX7I+AQxtZ1iNj8Uh0g6A52hoLpSR/ZlDenez+hHJZC9VML+emteCXe9Pq5SlEwU1YVMzl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200105

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
index 778cb07f4ba4..b9e99fd28831 100644
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
@@ -1878,6 +1900,25 @@ static int ppe_rss_hash_init(struct ppe_device *ppe_dev)
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
@@ -1906,5 +1947,9 @@ int ppe_hw_config(struct ppe_device *ppe_dev)
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


