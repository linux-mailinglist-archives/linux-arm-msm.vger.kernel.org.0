Return-Path: <linux-arm-msm+bounces-47311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA758A2DE63
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 15:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD14216548D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 14:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E011DF968;
	Sun,  9 Feb 2025 14:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SDK/kj+W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1301E22FC;
	Sun,  9 Feb 2025 14:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739111440; cv=none; b=Jc8+SeLBekkHlod52YkSoz6vfoQeKUPk/hHxI4zrcwOlcMxGgQd2OaOBbgaRImm8yWWQ8okyIQeGKmnYi+KKx4kBDClrtRxrhirsSmcCM75EOnUSoi4n+RVtR9PSkPFcuHeAiUVx85myzSSyt4ksqvmrdLrGIuThtE4OsyURemM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739111440; c=relaxed/simple;
	bh=pEmll+esWWtp1bpfs2x8cZ3Tdw9UjtDCWRxu/pcViC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PjP6XkkOA/0F9H/AQwyVSoNL7D4Pwq6DIMOSIRiOF6v8zYc7dJG3oa0Y15+I/x3si7oFuDe+Q+yifwlU2sXOkfAe6nYOG9IbyusY9LLOQsUpBqWMnHjzDrx3ocRfJT8VQDQ2vyBetH/EG1P6L5FJCHuYiR6G33g0TB3riI2p3/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SDK/kj+W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519DUmbT023168;
	Sun, 9 Feb 2025 14:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kd6L5yuaZfJhL8y2TiqrbkG8GCGVi0EyPNABQHqu0WM=; b=SDK/kj+WZYaAR33B
	nrgmr0x7dM17vF8/20yhbT5Nx0m8KVk9+fG9v+bkOh4azg3ymy4qWqxTEcjU+AqW
	9RaSeTZHlJplfmeczdtDAoi0COQ4rhuWry6yFg46j4+WJINNX8zb13DiyIR0VS80
	vp+I5hYfT8E8J7Mxm+CrmmWkRrDtvf853zi0omgG12gvK2b2ScD5ss53xzXdaQul
	pHzIAlN0HKmTV0Xoqu5FMrBNSk8FbuqQxGCrtSEru5mbzx8lidGePHcDO7OB/vlH
	1ki+LBLKqgB6M454wEnwGhktRm6UCqtgfkU6jr/BBAyEBvLiKnRwLW+DM6pDgANX
	xDkSHA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0kaj36p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Feb 2025 14:30:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 519EUM2r022796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 9 Feb 2025 14:30:22 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 9 Feb 2025 06:30:17 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Date: Sun, 9 Feb 2025 22:29:39 +0800
Subject: [PATCH net-next v3 05/14] net: ethernet: qualcomm: Initialize PPE
 queue management for IPQ9574
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250209-qcom_ipq_ppe-v3-5-453ea18d3271@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739111388; l=12236;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=pEmll+esWWtp1bpfs2x8cZ3Tdw9UjtDCWRxu/pcViC4=;
 b=lL5KLkNrNfPouIkjMk9ZqJKwcSrAEiIL/VuXmwAqx8yyIS5n7IcBkAXNiznO1g7Y/OJqbh3m+
 /aIErcDITH0Apad59WqDwcSeapTzCisJa7xEumjqLlkzRdyHroUdmxo
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -2LXmoSOFL6Ncgn3lMFFy6yS_RpHsLMa
X-Proofpoint-ORIG-GUID: -2LXmoSOFL6Ncgn3lMFFy6yS_RpHsLMa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-09_06,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502090129

QM (queue management) configurations decide the length of PPE
queues and the queue depth for these queues which are used to
drop packets in events of congestion.

There are two types of PPE queues - unicast queues (0-255) and
multicast queues (256-299). These queue types are used to forward
different types of traffic, and are configured with different
lengths.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 177 ++++++++++++++++++++++++-
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   |  85 ++++++++++++
 2 files changed, 261 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index 18e9544a4e37..d55e99656271 100644
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
 /* Assign the share buffer number 1550 to group 0 by default. */
 static const int ipq9574_ppe_bm_group_config = 1550;
 
@@ -102,6 +125,33 @@ static const struct ppe_bm_port_config ipq9574_ppe_bm_port_config[] = {
 	},
 };
 
+/* Default QM group settings for IPQ9754. */
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
@@ -189,7 +239,132 @@ static int ppe_config_bm(struct ppe_device *ppe_dev)
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
index b00f77ec45fe..6eac3ab8e58b 100644
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
 	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_BM_PORT_FC_W1_DYNAMIC)
 #define PPE_BM_PORT_FC_SET_PRE_ALLOC(tbl_cfg, value)	\
 	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_BM_PORT_FC_W1_PRE_ALLOC)
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
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_AC_UNICAST_QUEUE_CFG_W0_EN)
+#define PPE_AC_UNICAST_QUEUE_SET_GRP_ID(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_AC_UNICAST_QUEUE_CFG_W0_GRP_ID)
+#define PPE_AC_UNICAST_QUEUE_SET_PRE_LIMIT(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_AC_UNICAST_QUEUE_CFG_W0_PRE_LIMIT)
+#define PPE_AC_UNICAST_QUEUE_SET_DYNAMIC(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_AC_UNICAST_QUEUE_CFG_W0_DYNAMIC)
+#define PPE_AC_UNICAST_QUEUE_SET_WEIGHT(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_AC_UNICAST_QUEUE_CFG_W0_WEIGHT)
+#define PPE_AC_UNICAST_QUEUE_SET_THRESHOLD(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_AC_UNICAST_QUEUE_CFG_W0_THRESHOLD)
+#define PPE_AC_UNICAST_QUEUE_SET_GRN_RESUME(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)(tbl_cfg) + 0x3, value, PPE_AC_UNICAST_QUEUE_CFG_W3_GRN_RESUME)
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
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_AC_MULTICAST_QUEUE_CFG_W0_EN)
+#define PPE_AC_MULTICAST_QUEUE_SET_GRN_GRP_ID(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_AC_MULTICAST_QUEUE_CFG_W0_GRP_ID)
+#define PPE_AC_MULTICAST_QUEUE_SET_GRN_PRE_LIMIT(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_AC_MULTICAST_QUEUE_CFG_W0_PRE_LIMIT)
+#define PPE_AC_MULTICAST_QUEUE_SET_GRN_THRESHOLD(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_AC_MULTICAST_QUEUE_CFG_W0_THRESHOLD)
+#define PPE_AC_MULTICAST_QUEUE_SET_GRN_RESUME(tbl_cfg, value)	\
+	u32p_replace_bits((u32 *)(tbl_cfg) + 0x2, value, PPE_AC_MULTICAST_QUEUE_CFG_W2_RESUME)
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
+	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_AC_GRP_W1_BUF_LIMIT)
+
+/* Table addresses for per-queue enqueue setting. */
+#define PPE_ENQ_OPR_TBL_ADDR			0x85c000
+#define PPE_ENQ_OPR_TBL_ENTRIES			300
+#define PPE_ENQ_OPR_TBL_INC			0x10
+#define PPE_ENQ_OPR_TBL_ENQ_DISABLE		BIT(0)
 #endif

-- 
2.34.1


