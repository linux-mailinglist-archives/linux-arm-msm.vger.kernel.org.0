Return-Path: <linux-arm-msm+bounces-65777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00855B0B521
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 12:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A98F16E494
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 10:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5294C21772D;
	Sun, 20 Jul 2025 10:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FLmb90hT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4174E1F5435;
	Sun, 20 Jul 2025 10:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753009083; cv=none; b=pvqiqxaXHdor9wwJf5hb7zqsvh38uP2ievizzVi4fjLdsFXHmkEEWIN4LaRt4cXVzY25T/tvWUfqejhtuXktB3sHMD/8GAU7tJDK0YqGzPOPAFPa93x23j/fPQbXHKCPCgX6uEaivLd3j8KFZh7ObkKZqns9+1wRiYVY7Jqpoqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753009083; c=relaxed/simple;
	bh=GiNaQ/QSnq3x1AnnJUk+RFm9Gh0f3DcsV8VK5hUyJ60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=L8DlqOFZm22CH9X4Gm/TKwW4Wsx0HJpNRgU61KK2aqeXopaoA99pgrNKgDjuDY0jhV9o7X79Yg98/ahl1N79zC/nowH4ABYTq8CjLDwXjR/qrfK4ZyWwhfAxvMVjN94jD1Boz1n7P5SbMGlMJTzvGI47Db1HIBteo/ka6SJxRSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FLmb90hT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K8uqMe029708;
	Sun, 20 Jul 2025 10:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+FYusXXHUAcy+Rd9CukLs9Yfx3JFO6W1otEVPr4WW7Y=; b=FLmb90hTT6+ax+jf
	R98SwwumFYskMF47MrWkUeBHQvPnx85TPlwDSLIQRrD+re+8geO59/JyquJwoPKk
	RHQK3wfyX1Z5Kt2NpIwbwdzmY7Kenyzq3PdK3xjIZ0908vX7IWicgyeo07h7d4sQ
	dTqUKeJkaw6w67IR19Kzi/cRhQ2MV1Tqx+DeYAwfxjW+W7953X48xiubCstvJp9F
	2KEWBoTTIciI1ONUXHOd2jp3BPovKlQ7JAivU/Zot37fyl4I6v28xdm2/1ab4ACk
	fTI2U7DnvAJmGdQgcSzk9bwEXk1EyKelpM4noURxnfVUbprBqYof2qQ9NeXxpe2t
	S1PpxQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048rt48e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 10:57:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56KAvksR028829
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 10:57:46 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 20 Jul 2025 03:57:41 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Sun, 20 Jul 2025 18:57:12 +0800
Subject: [PATCH net-next v6 05/14] net: ethernet: qualcomm: Initialize PPE
 queue management for IPQ9574
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250720-qcom_ipq_ppe-v6-5-4ae91c203a5f@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753009036; l=12547;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=GiNaQ/QSnq3x1AnnJUk+RFm9Gh0f3DcsV8VK5hUyJ60=;
 b=1qHlGTf7UXQr/r4WXQbo3/EM4eexH09OFL+0plWHQ91wyEKe0NxAxhjRigxFRgUdr6KsEnV3x
 gnkYYT57CLwDPwctQTOlgJfT3fDjeN95Mbn+DfdFcP2DPjCvG2gX3DY
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDEwNSBTYWx0ZWRfX/xBLUsRElie8
 zvMC8UxbpWA0C9eGMB7eNdjSXaqymk4kiCb/ZUg5giGOIkSu5D7PCas9RkE6tUD7c9RNusVPZtD
 GM9muVwhskhRB0zTKK1Ml1QctUkdOt99XkUy0DHRtSUpx2TPbnLuZoKnqMJCi1YR6X8GZB3v7uA
 i+aTibnbwZ/QE71iWfSJQlj9/x6IM2kepIWYSpCBsHqsmuMpHHa1i+AVrZ9SKLNaPAhAsZ3AIEy
 oP2KrPD0IMtoJjs1HOR84nAIObhxjseWs9csNmQMSUqbjZkMquy7dF6sQVhX6NP7dtghcI1AEe3
 er9vVr1mZQ8ECoFPd0j5l2ZNoV7/Xg9xWTY/WtfZYgYlt88hBpgp1T3+FNtfwgdSJ8iLKBQob5B
 SpKEso5VMfODfjK5TIrw+AhPRpotLJYm6bSZ8C3I2zYZPISThQVaErVLBiBSuQXfVqqpE+Ep
X-Proofpoint-ORIG-GUID: DfkonzP91xnhexPbI-xfa3ee3KP07I7b
X-Proofpoint-GUID: DfkonzP91xnhexPbI-xfa3ee3KP07I7b
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687ccbad cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=wXS57atiiGPxPzAmdy8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200105

QM (queue management) configurations decide the length of PPE queues
and the queue depth for these queues which are used to drop packets
in events of congestion.

There are two types of PPE queues - unicast queues (0-255) and multicast
queues (256-299). These queue types are used to forward different types
of traffic, and are configured with different lengths.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 184 ++++++++++++++++++++++++-
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   |  85 ++++++++++++
 2 files changed, 268 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index 45b031d4dd46..53887069b432 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -43,6 +43,29 @@ struct ppe_bm_port_config {
 	bool dynamic;
 };
 
+/**
+ * struct ppe_qm_queue_config - PPE queue config.
+ * @queue_start: PPE start of queue ID.
+ * @queue_end: PPE end of queue ID.
+ * @prealloc_buf: Queue dedicated buffer number.
+ * @ceil: Ceil to start drop packet from queue.
+ * @weight: Weight value.
+ * @resume_offset: Resume offset from the threshold.
+ * @dynamic: Threshold value is decided dynamically or statically.
+ *
+ * Queue configuration decides the threshold to drop packet from PPE
+ * hardware queue.
+ */
+struct ppe_qm_queue_config {
+	unsigned int queue_start;
+	unsigned int queue_end;
+	unsigned int prealloc_buf;
+	unsigned int ceil;
+	unsigned int weight;
+	unsigned int resume_offset;
+	bool dynamic;
+};
+
 /* There are total 2048 buffers available in PPE, out of which some
  * buffers are reserved for some specific purposes per PPE port. The
  * rest of the pool of 1550 buffers are assigned to the general 'group0'
@@ -106,6 +129,40 @@ static const struct ppe_bm_port_config ipq9574_ppe_bm_port_config[] = {
 	},
 };
 
+/* QM fetches the packet from PPE buffer management for transmitting the
+ * packet out. The QM group configuration limits the total number of buffers
+ * enqueued by all PPE hardware queues.
+ * There are total 2048 buffers available, out of which some buffers are
+ * dedicated to hardware exception handlers. The remaining buffers are
+ * assigned to the general 'group0', which is the group assigned to all
+ * queues by default.
+ */
+static const int ipq9574_ppe_qm_group_config = 2000;
+
+/* Default QM settings for unicast and multicast queues for IPQ9754. */
+static const struct ppe_qm_queue_config ipq9574_ppe_qm_queue_config[] = {
+	{
+		/* QM settings for unicast queues 0 to 255. */
+		.queue_start	= 0,
+		.queue_end	= 255,
+		.prealloc_buf	= 0,
+		.ceil		= 1200,
+		.weight		= 7,
+		.resume_offset	= 36,
+		.dynamic	= true,
+	},
+	{
+		/* QM settings for multicast queues 256 to 299. */
+		.queue_start	= 256,
+		.queue_end	= 299,
+		.prealloc_buf	= 0,
+		.ceil		= 250,
+		.weight		= 0,
+		.resume_offset	= 36,
+		.dynamic	= false,
+	},
+};
+
 static int ppe_config_bm_threshold(struct ppe_device *ppe_dev, int bm_port_id,
 				   const struct ppe_bm_port_config port_cfg)
 {
@@ -193,7 +250,132 @@ static int ppe_config_bm(struct ppe_device *ppe_dev)
 	return ret;
 }
 
+/* Configure PPE hardware queue depth, which is decided by the threshold
+ * of queue.
+ */
+static int ppe_config_qm(struct ppe_device *ppe_dev)
+{
+	const struct ppe_qm_queue_config *queue_cfg;
+	int ret, i, queue_id, queue_cfg_count;
+	u32 reg, multicast_queue_cfg[5];
+	u32 unicast_queue_cfg[4];
+	u32 group_cfg[3];
+
+	/* Assign the buffer number to the group 0 by default. */
+	reg = PPE_AC_GRP_CFG_TBL_ADDR;
+	ret = regmap_bulk_read(ppe_dev->regmap, reg,
+			       group_cfg, ARRAY_SIZE(group_cfg));
+	if (ret)
+		goto qm_config_fail;
+
+	PPE_AC_GRP_SET_BUF_LIMIT(group_cfg, ipq9574_ppe_qm_group_config);
+
+	ret = regmap_bulk_write(ppe_dev->regmap, reg,
+				group_cfg, ARRAY_SIZE(group_cfg));
+	if (ret)
+		goto qm_config_fail;
+
+	queue_cfg = ipq9574_ppe_qm_queue_config;
+	queue_cfg_count = ARRAY_SIZE(ipq9574_ppe_qm_queue_config);
+	for (i = 0; i < queue_cfg_count; i++) {
+		queue_id = queue_cfg[i].queue_start;
+
+		/* Configure threshold for dropping packets separately for
+		 * unicast and multicast PPE queues.
+		 */
+		while (queue_id <= queue_cfg[i].queue_end) {
+			if (queue_id < PPE_AC_UNICAST_QUEUE_CFG_TBL_ENTRIES) {
+				reg = PPE_AC_UNICAST_QUEUE_CFG_TBL_ADDR +
+				      PPE_AC_UNICAST_QUEUE_CFG_TBL_INC * queue_id;
+
+				ret = regmap_bulk_read(ppe_dev->regmap, reg,
+						       unicast_queue_cfg,
+						       ARRAY_SIZE(unicast_queue_cfg));
+				if (ret)
+					goto qm_config_fail;
+
+				PPE_AC_UNICAST_QUEUE_SET_EN(unicast_queue_cfg, true);
+				PPE_AC_UNICAST_QUEUE_SET_GRP_ID(unicast_queue_cfg, 0);
+				PPE_AC_UNICAST_QUEUE_SET_PRE_LIMIT(unicast_queue_cfg,
+								   queue_cfg[i].prealloc_buf);
+				PPE_AC_UNICAST_QUEUE_SET_DYNAMIC(unicast_queue_cfg,
+								 queue_cfg[i].dynamic);
+				PPE_AC_UNICAST_QUEUE_SET_WEIGHT(unicast_queue_cfg,
+								queue_cfg[i].weight);
+				PPE_AC_UNICAST_QUEUE_SET_THRESHOLD(unicast_queue_cfg,
+								   queue_cfg[i].ceil);
+				PPE_AC_UNICAST_QUEUE_SET_GRN_RESUME(unicast_queue_cfg,
+								    queue_cfg[i].resume_offset);
+
+				ret = regmap_bulk_write(ppe_dev->regmap, reg,
+							unicast_queue_cfg,
+							ARRAY_SIZE(unicast_queue_cfg));
+				if (ret)
+					goto qm_config_fail;
+			} else {
+				reg = PPE_AC_MULTICAST_QUEUE_CFG_TBL_ADDR +
+				      PPE_AC_MULTICAST_QUEUE_CFG_TBL_INC * queue_id;
+
+				ret = regmap_bulk_read(ppe_dev->regmap, reg,
+						       multicast_queue_cfg,
+						       ARRAY_SIZE(multicast_queue_cfg));
+				if (ret)
+					goto qm_config_fail;
+
+				PPE_AC_MULTICAST_QUEUE_SET_EN(multicast_queue_cfg, true);
+				PPE_AC_MULTICAST_QUEUE_SET_GRN_GRP_ID(multicast_queue_cfg, 0);
+				PPE_AC_MULTICAST_QUEUE_SET_GRN_PRE_LIMIT(multicast_queue_cfg,
+									 queue_cfg[i].prealloc_buf);
+				PPE_AC_MULTICAST_QUEUE_SET_GRN_THRESHOLD(multicast_queue_cfg,
+									 queue_cfg[i].ceil);
+				PPE_AC_MULTICAST_QUEUE_SET_GRN_RESUME(multicast_queue_cfg,
+								      queue_cfg[i].resume_offset);
+
+				ret = regmap_bulk_write(ppe_dev->regmap, reg,
+							multicast_queue_cfg,
+							ARRAY_SIZE(multicast_queue_cfg));
+				if (ret)
+					goto qm_config_fail;
+			}
+
+			/* Enable enqueue. */
+			reg = PPE_ENQ_OPR_TBL_ADDR + PPE_ENQ_OPR_TBL_INC * queue_id;
+			ret = regmap_clear_bits(ppe_dev->regmap, reg,
+						PPE_ENQ_OPR_TBL_ENQ_DISABLE);
+			if (ret)
+				goto qm_config_fail;
+
+			/* Enable dequeue. */
+			reg = PPE_DEQ_OPR_TBL_ADDR + PPE_DEQ_OPR_TBL_INC * queue_id;
+			ret = regmap_clear_bits(ppe_dev->regmap, reg,
+						PPE_DEQ_OPR_TBL_DEQ_DISABLE);
+			if (ret)
+				goto qm_config_fail;
+
+			queue_id++;
+		}
+	}
+
+	/* Enable queue counter for all PPE hardware queues. */
+	ret = regmap_set_bits(ppe_dev->regmap, PPE_EG_BRIDGE_CONFIG_ADDR,
+			      PPE_EG_BRIDGE_CONFIG_QUEUE_CNT_EN);
+	if (ret)
+		goto qm_config_fail;
+
+	return 0;
+
+qm_config_fail:
+	dev_err(ppe_dev->dev, "PPE QM config error %d\n", ret);
+	return ret;
+}
+
 int ppe_hw_config(struct ppe_device *ppe_dev)
 {
-	return ppe_config_bm(ppe_dev);
+	int ret;
+
+	ret = ppe_config_bm(ppe_dev);
+	if (ret)
+		return ret;
+
+	return ppe_config_qm(ppe_dev);
 }
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
index b89d717fdae8..ca256fe2a321 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
@@ -9,6 +9,16 @@
 
 #include <linux/bitfield.h>
 
+/* PPE queue counters enable/disable control. */
+#define PPE_EG_BRIDGE_CONFIG_ADDR		0x20044
+#define PPE_EG_BRIDGE_CONFIG_QUEUE_CNT_EN	BIT(2)
+
+/* Table addresses for per-queue dequeue setting. */
+#define PPE_DEQ_OPR_TBL_ADDR			0x430000
+#define PPE_DEQ_OPR_TBL_ENTRIES			300
+#define PPE_DEQ_OPR_TBL_INC			0x10
+#define PPE_DEQ_OPR_TBL_DEQ_DISABLE		BIT(0)
+
 /* There are 15 BM ports and 4 BM groups supported by PPE.
  * BM port (0-7) is for EDMA port 0, BM port (8-13) is for
  * PPE physical port 1-6 and BM port 14 is for EIP port.
@@ -56,4 +66,79 @@
 	FIELD_MODIFY(PPE_BM_PORT_FC_W1_DYNAMIC, (tbl_cfg) + 0x1, value)
 #define PPE_BM_PORT_FC_SET_PRE_ALLOC(tbl_cfg, value)	\
 	FIELD_MODIFY(PPE_BM_PORT_FC_W1_PRE_ALLOC, (tbl_cfg) + 0x1, value)
+
+/* PPE unicast queue (0-255) configurations. */
+#define PPE_AC_UNICAST_QUEUE_CFG_TBL_ADDR	0x848000
+#define PPE_AC_UNICAST_QUEUE_CFG_TBL_ENTRIES	256
+#define PPE_AC_UNICAST_QUEUE_CFG_TBL_INC	0x10
+#define PPE_AC_UNICAST_QUEUE_CFG_W0_EN		BIT(0)
+#define PPE_AC_UNICAST_QUEUE_CFG_W0_WRED_EN	BIT(1)
+#define PPE_AC_UNICAST_QUEUE_CFG_W0_FC_EN	BIT(2)
+#define PPE_AC_UNICAST_QUEUE_CFG_W0_CLR_AWARE	BIT(3)
+#define PPE_AC_UNICAST_QUEUE_CFG_W0_GRP_ID	GENMASK(5, 4)
+#define PPE_AC_UNICAST_QUEUE_CFG_W0_PRE_LIMIT	GENMASK(16, 6)
+#define PPE_AC_UNICAST_QUEUE_CFG_W0_DYNAMIC	BIT(17)
+#define PPE_AC_UNICAST_QUEUE_CFG_W0_WEIGHT	GENMASK(20, 18)
+#define PPE_AC_UNICAST_QUEUE_CFG_W0_THRESHOLD	GENMASK(31, 21)
+#define PPE_AC_UNICAST_QUEUE_CFG_W3_GRN_RESUME	GENMASK(23, 13)
+
+#define PPE_AC_UNICAST_QUEUE_SET_EN(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_AC_UNICAST_QUEUE_CFG_W0_EN, tbl_cfg, value)
+#define PPE_AC_UNICAST_QUEUE_SET_GRP_ID(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_AC_UNICAST_QUEUE_CFG_W0_GRP_ID, tbl_cfg, value)
+#define PPE_AC_UNICAST_QUEUE_SET_PRE_LIMIT(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_AC_UNICAST_QUEUE_CFG_W0_PRE_LIMIT, tbl_cfg, value)
+#define PPE_AC_UNICAST_QUEUE_SET_DYNAMIC(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_AC_UNICAST_QUEUE_CFG_W0_DYNAMIC, tbl_cfg, value)
+#define PPE_AC_UNICAST_QUEUE_SET_WEIGHT(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_AC_UNICAST_QUEUE_CFG_W0_WEIGHT, tbl_cfg, value)
+#define PPE_AC_UNICAST_QUEUE_SET_THRESHOLD(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_AC_UNICAST_QUEUE_CFG_W0_THRESHOLD, tbl_cfg, value)
+#define PPE_AC_UNICAST_QUEUE_SET_GRN_RESUME(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_AC_UNICAST_QUEUE_CFG_W3_GRN_RESUME, (tbl_cfg) + 0x3, value)
+
+/* PPE multicast queue (256-299) configurations. */
+#define PPE_AC_MULTICAST_QUEUE_CFG_TBL_ADDR	0x84a000
+#define PPE_AC_MULTICAST_QUEUE_CFG_TBL_ENTRIES	44
+#define PPE_AC_MULTICAST_QUEUE_CFG_TBL_INC	0x10
+#define PPE_AC_MULTICAST_QUEUE_CFG_W0_EN	BIT(0)
+#define PPE_AC_MULTICAST_QUEUE_CFG_W0_FC_EN	BIT(1)
+#define PPE_AC_MULTICAST_QUEUE_CFG_W0_CLR_AWARE	BIT(2)
+#define PPE_AC_MULTICAST_QUEUE_CFG_W0_GRP_ID	GENMASK(4, 3)
+#define PPE_AC_MULTICAST_QUEUE_CFG_W0_PRE_LIMIT	GENMASK(15, 5)
+#define PPE_AC_MULTICAST_QUEUE_CFG_W0_THRESHOLD	GENMASK(26, 16)
+#define PPE_AC_MULTICAST_QUEUE_CFG_W2_RESUME	GENMASK(17, 7)
+
+#define PPE_AC_MULTICAST_QUEUE_SET_EN(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_AC_MULTICAST_QUEUE_CFG_W0_EN, tbl_cfg, value)
+#define PPE_AC_MULTICAST_QUEUE_SET_GRN_GRP_ID(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_AC_MULTICAST_QUEUE_CFG_W0_GRP_ID, tbl_cfg, value)
+#define PPE_AC_MULTICAST_QUEUE_SET_GRN_PRE_LIMIT(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_AC_MULTICAST_QUEUE_CFG_W0_PRE_LIMIT, tbl_cfg, value)
+#define PPE_AC_MULTICAST_QUEUE_SET_GRN_THRESHOLD(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_AC_MULTICAST_QUEUE_CFG_W0_THRESHOLD, tbl_cfg, value)
+#define PPE_AC_MULTICAST_QUEUE_SET_GRN_RESUME(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_AC_MULTICAST_QUEUE_CFG_W2_RESUME, (tbl_cfg) + 0x2, value)
+
+/* PPE admission control group (0-3) configurations */
+#define PPE_AC_GRP_CFG_TBL_ADDR			0x84c000
+#define PPE_AC_GRP_CFG_TBL_ENTRIES		0x4
+#define PPE_AC_GRP_CFG_TBL_INC			0x10
+#define PPE_AC_GRP_W0_AC_EN			BIT(0)
+#define PPE_AC_GRP_W0_AC_FC_EN			BIT(1)
+#define PPE_AC_GRP_W0_CLR_AWARE			BIT(2)
+#define PPE_AC_GRP_W0_THRESHOLD_LOW		GENMASK(31, 25)
+#define PPE_AC_GRP_W1_THRESHOLD_HIGH		GENMASK(3, 0)
+#define PPE_AC_GRP_W1_BUF_LIMIT			GENMASK(14, 4)
+#define PPE_AC_GRP_W2_RESUME_GRN		GENMASK(15, 5)
+#define PPE_AC_GRP_W2_PRE_ALLOC			GENMASK(26, 16)
+
+#define PPE_AC_GRP_SET_BUF_LIMIT(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_AC_GRP_W1_BUF_LIMIT, (tbl_cfg) + 0x1, value)
+
+/* Table addresses for per-queue enqueue setting. */
+#define PPE_ENQ_OPR_TBL_ADDR			0x85c000
+#define PPE_ENQ_OPR_TBL_ENTRIES			300
+#define PPE_ENQ_OPR_TBL_INC			0x10
+#define PPE_ENQ_OPR_TBL_ENQ_DISABLE		BIT(0)
 #endif

-- 
2.34.1


