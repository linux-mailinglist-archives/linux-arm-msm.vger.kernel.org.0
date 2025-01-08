Return-Path: <linux-arm-msm+bounces-44397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62197A05D93
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 083DA167C73
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CB6201028;
	Wed,  8 Jan 2025 13:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pTgh4OZa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95E21FCF44;
	Wed,  8 Jan 2025 13:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736344167; cv=none; b=olCL1HvOFHaK33kzd4SoTFMLeeYAW5gakGE16FPS/b+FYuwuZsDRXE/YRlPg1ZXkIHUdIsEoUcMsifLsAHlekKdtUUHfewume7WsxbDX6kNhPsdeR8RK/oMBmkbttUGOzIpuJOXvAVEqwgsAbEghCmWL1sWdZpGalN6G+45y+Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736344167; c=relaxed/simple;
	bh=SmMR76gKRqk7H1K3X/jdc1knG7XQz1rKQRJyOnhscbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=spwxOpm7WyWAG2N3NrIB07GMgwB7mPQAayhDQN07GrAx1GwSUzCuwr7sFmaY6MsUIgzaxh+t3sctjQaxdVZf8Jc/hnS79OMNXt0Epkcx1VEExr/JFZ39nTGX6AEkKIbngeKHLs9XtA+3CeYVBUibgL/CH1m0/BWH45oCeHjPLm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pTgh4OZa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508BkVHs007662;
	Wed, 8 Jan 2025 13:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5paUqlZGdFVkZ3W09aSnLd7L4jph9QMldWq1WvAkIvs=; b=pTgh4OZaK2j5IPrL
	20zUYqvf8w3ggCzoQb1DrC7yNn41lHhCdoReSOiiowpJRicTwGcWvpjjqW5vsrc2
	SfNoPSqMoQ+O8WRjn7M8PG0NcQzQFrN/ljU9CUVB6KNbt1Wy/4+FKyfr90EzHC9T
	3wyuGy3o+sqEGgVcorTuYiC1ZwE+Q/dgGWbLNxdg27gpaIFDe6K4jOUB14HYpIOj
	cJ8edkzPJ/mRbqfLid1lVxZGKtU233Pok6fjDsLFpkDazNDkAReIURMujBXXvxXJ
	ek+7XjzUfRm+zE41ydwAhh8nYssAQ0lmx0uUlRd0Yopv7Q9xjpIVoBZ7PoZtZaWJ
	sLAKKw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441pgnrnmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 13:49:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508Dn6ZZ017343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 13:49:06 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 05:48:59 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Date: Wed, 8 Jan 2025 21:47:20 +0800
Subject: [PATCH net-next v2 13/14] net: ethernet: qualcomm: Add PPE debugfs
 support for PPE counters
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-qcom_ipq_ppe-v2-13-7394dbda7199@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736344057; l=29970;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=SmMR76gKRqk7H1K3X/jdc1knG7XQz1rKQRJyOnhscbk=;
 b=apxeEBR5nK69eKn1hBPxol/2pNmE+G4e8gmIGpKqdpEaX8QYkDAdQ+zMjaL7lzVazGOHbQTsg
 aPMu1tEUdYNBXxIFUfJ3KB3WG4r8FTKvgrvShJW2mtrYL/LxLbVhp/R
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KQ20PRShhln_f5jP3DIy1x_NdOh2IvRi
X-Proofpoint-ORIG-GUID: KQ20PRShhln_f5jP3DIy1x_NdOh2IvRi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501080115

The PPE hardware packet counters are made available through
the debugfs entry "/sys/kernel/debug/ppe/packet_counters".

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/ethernet/qualcomm/ppe/Makefile      |   2 +-
 drivers/net/ethernet/qualcomm/ppe/ppe.c         |  11 +
 drivers/net/ethernet/qualcomm/ppe/ppe.h         |   3 +
 drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c | 692 ++++++++++++++++++++++++
 drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.h |  16 +
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h    | 102 ++++
 6 files changed, 825 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/Makefile b/drivers/net/ethernet/qualcomm/ppe/Makefile
index 410a7bb54cfe..9e60b2400c16 100644
--- a/drivers/net/ethernet/qualcomm/ppe/Makefile
+++ b/drivers/net/ethernet/qualcomm/ppe/Makefile
@@ -4,4 +4,4 @@
 #
 
 obj-$(CONFIG_QCOM_PPE) += qcom-ppe.o
-qcom-ppe-objs := ppe.o ppe_config.o
+qcom-ppe-objs := ppe.o ppe_config.o ppe_debugfs.o
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe.c b/drivers/net/ethernet/qualcomm/ppe/ppe.c
index e8aa4eabaa7f..70fdaf4b4375 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe.c
@@ -16,6 +16,7 @@
 
 #include "ppe.h"
 #include "ppe_config.h"
+#include "ppe_debugfs.h"
 
 #define PPE_PORT_MAX		8
 #define PPE_CLK_RATE		353000000
@@ -199,11 +200,20 @@ static int qcom_ppe_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "PPE HW config failed\n");
 
+	ppe_debugfs_setup(ppe_dev);
 	platform_set_drvdata(pdev, ppe_dev);
 
 	return 0;
 }
 
+static void qcom_ppe_remove(struct platform_device *pdev)
+{
+	struct ppe_device *ppe_dev;
+
+	ppe_dev = platform_get_drvdata(pdev);
+	ppe_debugfs_teardown(ppe_dev);
+}
+
 static const struct of_device_id qcom_ppe_of_match[] = {
 	{ .compatible = "qcom,ipq9574-ppe" },
 	{},
@@ -216,6 +226,7 @@ static struct platform_driver qcom_ppe_driver = {
 		.of_match_table = qcom_ppe_of_match,
 	},
 	.probe	= qcom_ppe_probe,
+	.remove = qcom_ppe_remove,
 };
 module_platform_driver(qcom_ppe_driver);
 
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe.h b/drivers/net/ethernet/qualcomm/ppe/ppe.h
index cc6767b7c2b8..e9a208b77459 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe.h
@@ -11,6 +11,7 @@
 
 struct device;
 struct regmap;
+struct dentry;
 
 /**
  * struct ppe_device - PPE device private data.
@@ -18,6 +19,7 @@ struct regmap;
  * @regmap: PPE register map.
  * @clk_rate: PPE clock rate.
  * @num_ports: Number of PPE ports.
+ * @debugfs_root: Debugfs root entry.
  * @num_icc_paths: Number of interconnect paths.
  * @icc_paths: Interconnect path array.
  *
@@ -30,6 +32,7 @@ struct ppe_device {
 	struct regmap *regmap;
 	unsigned long clk_rate;
 	unsigned int num_ports;
+	struct dentry *debugfs_root;
 	unsigned int num_icc_paths;
 	struct icc_bulk_data icc_paths[] __counted_by(num_icc_paths);
 };
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c b/drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c
new file mode 100644
index 000000000000..6ae05aefe966
--- /dev/null
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c
@@ -0,0 +1,692 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/* PPE debugfs routines for display of PPE counters useful for debug. */
+
+#include <linux/bitfield.h>
+#include <linux/debugfs.h>
+#include <linux/regmap.h>
+#include <linux/seq_file.h>
+
+#include "ppe.h"
+#include "ppe_config.h"
+#include "ppe_debugfs.h"
+#include "ppe_regs.h"
+
+#define PPE_PKT_CNT_TBL_SIZE				3
+#define PPE_DROP_PKT_CNT_TBL_SIZE			5
+
+#define PPE_W0_PKT_CNT					GENMASK(31, 0)
+#define PPE_W2_DROP_PKT_CNT_LOW				GENMASK(31, 8)
+#define PPE_W3_DROP_PKT_CNT_HIGH			GENMASK(7, 0)
+
+#define PPE_GET_PKT_CNT(tbl_cnt)			\
+	u32_get_bits(*((u32 *)(tbl_cnt)), PPE_W0_PKT_CNT)
+#define PPE_GET_DROP_PKT_CNT_LOW(tbl_cnt)		\
+	u32_get_bits(*((u32 *)(tbl_cnt) + 0x2), PPE_W2_DROP_PKT_CNT_LOW)
+#define PPE_GET_DROP_PKT_CNT_HIGH(tbl_cnt)		\
+	u32_get_bits(*((u32 *)(tbl_cnt) + 0x3), PPE_W3_DROP_PKT_CNT_HIGH)
+
+#define PRINT_COUNTER_PREFIX(desc, cnt_type)		\
+	seq_printf(seq, "%-16s %16s", desc, cnt_type)
+
+#define PRINT_CPU_CODE_COUNTER(cnt, code)		\
+	seq_printf(seq, "%10u(cpucode:%d)", cnt, code)
+
+#define PRINT_DROP_CODE_COUNTER(cnt, port, code)	\
+	seq_printf(seq, "%10u(port=%d),dropcode:%d", cnt, port, code)
+
+#define PRINT_SINGLE_COUNTER(tag, cnt, str, index)			\
+do {									\
+	if (!((tag) % 4))							\
+		seq_printf(seq, "\n%-16s %16s", "", "");		\
+	seq_printf(seq, "%10u(%s=%04d)", cnt, str, index);		\
+} while (0)
+
+#define PRINT_TWO_COUNTERS(tag, cnt0, cnt1, str, index)			\
+do {									\
+	if (!((tag) % 4))							\
+		seq_printf(seq, "\n%-16s %16s", "", "");		\
+	seq_printf(seq, "%10u/%u(%s=%04d)", cnt0, cnt1, str, index);	\
+} while (0)
+
+/**
+ * enum ppe_cnt_size_type - PPE counter size type
+ * @PPE_PKT_CNT_SIZE_1WORD: Counter size with single register
+ * @PPE_PKT_CNT_SIZE_3WORD: Counter size with table of 3 words
+ * @PPE_PKT_CNT_SIZE_5WORD: Counter size with table of 5 words
+ *
+ * PPE takes the different register size to record the packet counters.
+ * It uses single register, or register table with 3 words or 5 words.
+ * The counter with table size 5 words also records the drop counter.
+ * There are also some other counter types occupying sizes less than 32
+ * bits, which is not covered by this enumeration type.
+ */
+enum ppe_cnt_size_type {
+	PPE_PKT_CNT_SIZE_1WORD,
+	PPE_PKT_CNT_SIZE_3WORD,
+	PPE_PKT_CNT_SIZE_5WORD,
+};
+
+static int ppe_pkt_cnt_get(struct ppe_device *ppe_dev, u32 reg,
+			   enum ppe_cnt_size_type cnt_type,
+			   u32 *cnt, u32 *drop_cnt)
+{
+	u32 drop_pkt_cnt[PPE_DROP_PKT_CNT_TBL_SIZE];
+	u32 pkt_cnt[PPE_PKT_CNT_TBL_SIZE];
+	u32 value;
+	int ret;
+
+	switch (cnt_type) {
+	case PPE_PKT_CNT_SIZE_1WORD:
+		ret = regmap_read(ppe_dev->regmap, reg, &value);
+		if (ret)
+			return ret;
+
+		*cnt = value;
+		break;
+	case PPE_PKT_CNT_SIZE_3WORD:
+		ret = regmap_bulk_read(ppe_dev->regmap, reg,
+				       pkt_cnt, ARRAY_SIZE(pkt_cnt));
+		if (ret)
+			return ret;
+
+		*cnt = PPE_GET_PKT_CNT(pkt_cnt);
+		break;
+	case PPE_PKT_CNT_SIZE_5WORD:
+		ret = regmap_bulk_read(ppe_dev->regmap, reg,
+				       drop_pkt_cnt, ARRAY_SIZE(drop_pkt_cnt));
+		if (ret)
+			return ret;
+
+		*cnt = PPE_GET_PKT_CNT(drop_pkt_cnt);
+
+		/* Drop counter with low 24 bits. */
+		value  = PPE_GET_DROP_PKT_CNT_LOW(drop_pkt_cnt);
+		*drop_cnt = FIELD_PREP(GENMASK(23, 0), value);
+
+		/* Drop counter with high 8 bits. */
+		value  = PPE_GET_DROP_PKT_CNT_HIGH(drop_pkt_cnt);
+		*drop_cnt |= FIELD_PREP(GENMASK(31, 24), value);
+		break;
+	}
+
+	return 0;
+}
+
+static void ppe_tbl_pkt_cnt_clear(struct ppe_device *ppe_dev, u32 reg,
+				  enum ppe_cnt_size_type cnt_type)
+{
+	u32 drop_pkt_cnt[PPE_DROP_PKT_CNT_TBL_SIZE] = {};
+	u32 pkt_cnt[PPE_PKT_CNT_TBL_SIZE] = {};
+
+	switch (cnt_type) {
+	case PPE_PKT_CNT_SIZE_1WORD:
+		regmap_write(ppe_dev->regmap, reg, 0);
+		break;
+	case PPE_PKT_CNT_SIZE_3WORD:
+		regmap_bulk_write(ppe_dev->regmap, reg,
+				  pkt_cnt, ARRAY_SIZE(pkt_cnt));
+		break;
+	case PPE_PKT_CNT_SIZE_5WORD:
+		regmap_bulk_write(ppe_dev->regmap, reg,
+				  drop_pkt_cnt, ARRAY_SIZE(drop_pkt_cnt));
+		break;
+	}
+}
+
+/* The number of packets dropped because of no buffer available, no PPE
+ * buffer assigned to these packets.
+ */
+static void ppe_port_rx_drop_counter_get(struct ppe_device *ppe_dev,
+					 struct seq_file *seq)
+{
+	int ret, i, tag = 0;
+	u32 reg, drop_cnt;
+
+	PRINT_COUNTER_PREFIX("PRX_DROP_CNT", "SILENT_DROP:");
+	for (i = 0; i < PPE_DROP_CNT_TBL_ENTRIES; i++) {
+		reg = PPE_DROP_CNT_TBL_ADDR + i * PPE_DROP_CNT_TBL_INC;
+		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_1WORD,
+				      &drop_cnt, NULL);
+		if (ret) {
+			seq_printf(seq, "ERROR %d\n", ret);
+			return;
+		}
+
+		if (drop_cnt > 0) {
+			tag++;
+			PRINT_SINGLE_COUNTER(tag, drop_cnt, "port", i);
+		}
+	}
+
+	seq_putc(seq, '\n');
+}
+
+/* The number of packets dropped because hardware buffers were available
+ * only partially for the packet.
+ */
+static void ppe_port_rx_bm_drop_counter_get(struct ppe_device *ppe_dev,
+					    struct seq_file *seq)
+{
+	u32 reg, pkt_cnt = 0;
+	int ret, i, tag = 0;
+
+	PRINT_COUNTER_PREFIX("PRX_BM_DROP_CNT", "OVERFLOW_DROP:");
+	for (i = 0; i < PPE_DROP_STAT_TBL_ENTRIES; i++) {
+		reg = PPE_DROP_STAT_TBL_ADDR + PPE_DROP_STAT_TBL_INC * i;
+
+		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD,
+				      &pkt_cnt, NULL);
+		if (ret) {
+			seq_printf(seq, "ERROR %d\n", ret);
+			return;
+		}
+
+		if (pkt_cnt > 0) {
+			tag++;
+			PRINT_SINGLE_COUNTER(tag, pkt_cnt, "port", i);
+		}
+	}
+
+	seq_putc(seq, '\n');
+}
+
+/* The number of currently occupied buffers, that can't be flushed. */
+static void ppe_port_rx_bm_port_counter_get(struct ppe_device *ppe_dev,
+					    struct seq_file *seq)
+{
+	int used_cnt, react_cnt;
+	int ret, i, tag = 0;
+	u32 reg, val;
+
+	PRINT_COUNTER_PREFIX("PRX_BM_PORT_CNT", "USED/REACT:");
+	for (i = 0; i < PPE_BM_USED_CNT_TBL_ENTRIES; i++) {
+		reg = PPE_BM_USED_CNT_TBL_ADDR + i * PPE_BM_USED_CNT_TBL_INC;
+		ret = regmap_read(ppe_dev->regmap, reg, &val);
+		if (ret) {
+			seq_printf(seq, "ERROR %d\n", ret);
+			return;
+		}
+
+		/* The number of PPE buffers used for caching the received
+		 * packets before the pause frame sent.
+		 */
+		used_cnt = FIELD_GET(PPE_BM_USED_CNT_VAL, val);
+
+		reg = PPE_BM_REACT_CNT_TBL_ADDR + i * PPE_BM_REACT_CNT_TBL_INC;
+		ret = regmap_read(ppe_dev->regmap, reg, &val);
+		if (ret) {
+			seq_printf(seq, "ERROR %d\n", ret);
+			return;
+		}
+
+		/* The number of PPE buffers used for caching the received
+		 * packets after pause frame sent out.
+		 */
+		react_cnt = FIELD_GET(PPE_BM_REACT_CNT_VAL, val);
+
+		if (used_cnt > 0 || react_cnt > 0) {
+			tag++;
+			PRINT_TWO_COUNTERS(tag, used_cnt, react_cnt, "port", i);
+		}
+	}
+
+	seq_putc(seq, '\n');
+}
+
+/* The number of packets processed by the ingress parser module of PPE. */
+static void ppe_parse_pkt_counter_get(struct ppe_device *ppe_dev,
+				      struct seq_file *seq)
+{
+	u32 reg, cnt, tunnel_cnt;
+	int i, ret, tag = 0;
+
+	PRINT_COUNTER_PREFIX("IPR_PKT_CNT", "TPRX/IPRX:");
+	for (i = 0; i < PPE_IPR_PKT_CNT_TBL_ENTRIES; i++) {
+		reg = PPE_TPR_PKT_CNT_TBL_ADDR + i * PPE_TPR_PKT_CNT_TBL_INC;
+		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_1WORD,
+				      &tunnel_cnt, NULL);
+		if (ret) {
+			seq_printf(seq, "ERROR %d\n", ret);
+			return;
+		}
+
+		reg = PPE_IPR_PKT_CNT_TBL_ADDR + i * PPE_IPR_PKT_CNT_TBL_INC;
+		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_1WORD,
+				      &cnt, NULL);
+		if (ret) {
+			seq_printf(seq, "ERROR %d\n", ret);
+			return;
+		}
+
+		if (tunnel_cnt > 0 || cnt > 0) {
+			tag++;
+			PRINT_TWO_COUNTERS(tag, tunnel_cnt, cnt, "port", i);
+		}
+	}
+
+	seq_putc(seq, '\n');
+}
+
+/* The number of packets received or dropped on the ingress direction. */
+static void ppe_port_rx_counter_get(struct ppe_device *ppe_dev,
+				    struct seq_file *seq)
+{
+	u32 reg, pkt_cnt, drop_cnt;
+	int ret, i, tag = 0;
+
+	PRINT_COUNTER_PREFIX("PORT_RX_CNT", "RX/RX_DROP:");
+	for (i = 0; i < PPE_PHY_PORT_RX_CNT_TBL_ENTRIES; i++) {
+		reg = PPE_PHY_PORT_RX_CNT_TBL_ADDR + PPE_PHY_PORT_RX_CNT_TBL_INC * i;
+		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_5WORD,
+				      &pkt_cnt, &drop_cnt);
+		if (ret) {
+			seq_printf(seq, "ERROR %d\n", ret);
+			return;
+		}
+
+		if (pkt_cnt > 0) {
+			tag++;
+			PRINT_TWO_COUNTERS(tag, pkt_cnt, drop_cnt, "port", i);
+		}
+	}
+
+	seq_putc(seq, '\n');
+}
+
+/* The number of packets received or dropped by the port. */
+static void ppe_vp_rx_counter_get(struct ppe_device *ppe_dev,
+				  struct seq_file *seq)
+{
+	u32 reg, pkt_cnt, drop_cnt;
+	int ret, i, tag = 0;
+
+	PRINT_COUNTER_PREFIX("VPORT_RX_CNT", "RX/RX_DROP:");
+	for (i = 0; i < PPE_PORT_RX_CNT_TBL_ENTRIES; i++) {
+		reg = PPE_PORT_RX_CNT_TBL_ADDR + PPE_PORT_RX_CNT_TBL_INC * i;
+		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_5WORD,
+				      &pkt_cnt, &drop_cnt);
+		if (ret) {
+			seq_printf(seq, "ERROR %d\n", ret);
+			return;
+		}
+
+		if (pkt_cnt > 0) {
+			tag++;
+			PRINT_TWO_COUNTERS(tag, pkt_cnt, drop_cnt, "port", i);
+		}
+	}
+
+	seq_putc(seq, '\n');
+}
+
+/* The number of packets received or dropped by layer 2 processing. */
+static void ppe_pre_l2_counter_get(struct ppe_device *ppe_dev,
+				   struct seq_file *seq)
+{
+	u32 reg, pkt_cnt, drop_cnt;
+	int ret, i, tag = 0;
+
+	PRINT_COUNTER_PREFIX("PRE_L2_CNT", "RX/RX_DROP:");
+	for (i = 0; i < PPE_PRE_L2_CNT_TBL_ENTRIES; i++) {
+		reg = PPE_PRE_L2_CNT_TBL_ADDR + PPE_PRE_L2_CNT_TBL_INC * i;
+		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_5WORD,
+				      &pkt_cnt, &drop_cnt);
+		if (ret) {
+			seq_printf(seq, "ERROR %d\n", ret);
+			return;
+		}
+
+		if (pkt_cnt > 0) {
+			tag++;
+			PRINT_TWO_COUNTERS(tag, pkt_cnt, drop_cnt, "vsi", i);
+		}
+	}
+
+	seq_putc(seq, '\n');
+}
+
+/* The number of VLAN packets received by PPE. */
+static void ppe_vlan_counter_get(struct ppe_device *ppe_dev,
+				 struct seq_file *seq)
+{
+	u32 reg, pkt_cnt = 0;
+	int ret, i, tag = 0;
+
+	PRINT_COUNTER_PREFIX("VLAN_CNT", "RX:");
+	for (i = 0; i < PPE_VLAN_CNT_TBL_ENTRIES; i++) {
+		reg = PPE_VLAN_CNT_TBL_ADDR + PPE_VLAN_CNT_TBL_INC * i;
+
+		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD,
+				      &pkt_cnt, NULL);
+		if (ret) {
+			seq_printf(seq, "ERROR %d\n", ret);
+			return;
+		}
+
+		if (pkt_cnt > 0) {
+			tag++;
+			PRINT_SINGLE_COUNTER(tag, pkt_cnt, "vsi", i);
+		}
+	}
+
+	seq_putc(seq, '\n');
+}
+
+/* The number of packets handed to CPU by PPE. */
+static void ppe_cpu_code_counter_get(struct ppe_device *ppe_dev,
+				     struct seq_file *seq)
+{
+	u32 reg, pkt_cnt = 0;
+	int ret, i;
+
+	PRINT_COUNTER_PREFIX("CPU_CODE_CNT", "CODE:");
+	for (i = 0; i < PPE_DROP_CPU_CNT_TBL_ENTRIES; i++) {
+		reg = PPE_DROP_CPU_CNT_TBL_ADDR + PPE_DROP_CPU_CNT_TBL_INC * i;
+
+		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD,
+				      &pkt_cnt, NULL);
+		if (ret) {
+			seq_printf(seq, "ERROR %d\n", ret);
+			return;
+		}
+
+		if (!pkt_cnt)
+			continue;
+
+		/* There are 256 CPU codes saved in the first 256 entries
+		 * of register table, and 128 drop codes for each PPE port
+		 * (0-7), the total entries is 256 + 8 * 128.
+		 */
+		if (i < 256)
+			PRINT_CPU_CODE_COUNTER(pkt_cnt, i);
+		else
+			PRINT_DROP_CODE_COUNTER(pkt_cnt, (i - 256) % 8,
+						(i - 256) / 8);
+		seq_putc(seq, '\n');
+		PRINT_COUNTER_PREFIX("", "");
+	}
+
+	seq_putc(seq, '\n');
+}
+
+/* The number of packets forwarded by VLAN on the egress direction. */
+static void ppe_eg_vsi_counter_get(struct ppe_device *ppe_dev,
+				   struct seq_file *seq)
+{
+	u32 reg, pkt_cnt = 0;
+	int ret, i, tag = 0;
+
+	PRINT_COUNTER_PREFIX("EG_VSI_CNT", "TX:");
+	for (i = 0; i < PPE_EG_VSI_COUNTER_TBL_ENTRIES; i++) {
+		reg = PPE_EG_VSI_COUNTER_TBL_ADDR + PPE_EG_VSI_COUNTER_TBL_INC * i;
+
+		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD,
+				      &pkt_cnt, NULL);
+		if (ret) {
+			seq_printf(seq, "ERROR %d\n", ret);
+			return;
+		}
+
+		if (pkt_cnt > 0) {
+			tag++;
+			PRINT_SINGLE_COUNTER(tag, pkt_cnt, "vsi", i);
+		}
+	}
+
+	seq_putc(seq, '\n');
+}
+
+/* The number of packets trasmitted or dropped by port. */
+static void ppe_vp_tx_counter_get(struct ppe_device *ppe_dev,
+				  struct seq_file *seq)
+{
+	u32 reg, pkt_cnt = 0, drop_cnt = 0;
+	int ret, i, tag = 0;
+
+	PRINT_COUNTER_PREFIX("VPORT_TX_CNT", "TX/TX_DROP:");
+	for (i = 0; i < PPE_VPORT_TX_COUNTER_TBL_ENTRIES; i++) {
+		reg = PPE_VPORT_TX_COUNTER_TBL_ADDR + PPE_VPORT_TX_COUNTER_TBL_INC * i;
+		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD,
+				      &pkt_cnt, NULL);
+		if (ret) {
+			seq_printf(seq, "ERROR %d\n", ret);
+			return;
+		}
+
+		reg = PPE_VPORT_TX_DROP_CNT_TBL_ADDR + PPE_VPORT_TX_DROP_CNT_TBL_INC * i;
+		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD,
+				      &drop_cnt, NULL);
+		if (ret) {
+			seq_printf(seq, "ERROR %d\n", ret);
+			return;
+		}
+
+		if (pkt_cnt > 0 || drop_cnt > 0) {
+			tag++;
+			PRINT_TWO_COUNTERS(tag, pkt_cnt, drop_cnt, "port", i);
+		}
+	}
+
+	seq_putc(seq, '\n');
+}
+
+/* The number of packets trasmitted or dropped on the egress direction. */
+static void ppe_port_tx_counter_get(struct ppe_device *ppe_dev,
+				    struct seq_file *seq)
+{
+	u32 reg, pkt_cnt = 0, drop_cnt = 0;
+	int ret, i, tag = 0;
+
+	PRINT_COUNTER_PREFIX("PORT_TX_CNT", "TX/TX_DROP:");
+	for (i = 0; i < PPE_PORT_TX_COUNTER_TBL_ENTRIES; i++) {
+		reg = PPE_PORT_TX_COUNTER_TBL_ADDR + PPE_PORT_TX_COUNTER_TBL_INC * i;
+		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD,
+				      &pkt_cnt, NULL);
+		if (ret) {
+			seq_printf(seq, "ERROR %d\n", ret);
+			return;
+		}
+
+		reg = PPE_PORT_TX_DROP_CNT_TBL_ADDR + PPE_PORT_TX_DROP_CNT_TBL_INC * i;
+		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD,
+				      &drop_cnt, NULL);
+		if (ret) {
+			seq_printf(seq, "ERROR %d\n", ret);
+			return;
+		}
+
+		if (pkt_cnt > 0 || drop_cnt > 0) {
+			tag++;
+			PRINT_TWO_COUNTERS(tag, pkt_cnt, drop_cnt, "port", i);
+		}
+	}
+
+	seq_putc(seq, '\n');
+}
+
+/* The number of packets transmitted or pending by the PPE queue. */
+static void ppe_queue_tx_counter_get(struct ppe_device *ppe_dev,
+				     struct seq_file *seq)
+{
+	u32 reg, val, pkt_cnt = 0, pend_cnt = 0;
+	int ret, i, tag = 0;
+
+	PRINT_COUNTER_PREFIX("QUEUE_TX_CNT", "TX/PEND:");
+	for (i = 0; i < PPE_QUEUE_TX_COUNTER_TBL_ENTRIES; i++) {
+		reg = PPE_QUEUE_TX_COUNTER_TBL_ADDR + PPE_QUEUE_TX_COUNTER_TBL_INC * i;
+		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD,
+				      &pkt_cnt, NULL);
+		if (ret) {
+			seq_printf(seq, "ERROR %d\n", ret);
+			return;
+		}
+
+		if (i < PPE_AC_UNICAST_QUEUE_CFG_TBL_ENTRIES) {
+			reg = PPE_AC_UNICAST_QUEUE_CNT_TBL_ADDR +
+			      PPE_AC_UNICAST_QUEUE_CNT_TBL_INC * i;
+			ret = regmap_read(ppe_dev->regmap, reg, &val);
+			if (ret) {
+				seq_printf(seq, "ERROR %d\n", ret);
+				return;
+			}
+
+			pend_cnt = FIELD_GET(PPE_AC_UNICAST_QUEUE_CNT_TBL_PEND_CNT, val);
+		} else {
+			reg = PPE_AC_MULTICAST_QUEUE_CNT_TBL_ADDR +
+			      PPE_AC_MULTICAST_QUEUE_CNT_TBL_INC *
+			      (i - PPE_AC_UNICAST_QUEUE_CFG_TBL_ENTRIES);
+			ret = regmap_read(ppe_dev->regmap, reg, &val);
+			if (ret) {
+				seq_printf(seq, "ERROR %d\n", ret);
+				return;
+			}
+
+			pend_cnt = FIELD_GET(PPE_AC_MULTICAST_QUEUE_CNT_TBL_PEND_CNT, val);
+		}
+
+		if (pkt_cnt > 0 || pend_cnt > 0) {
+			tag++;
+			PRINT_TWO_COUNTERS(tag, pkt_cnt, pend_cnt, "queue", i);
+		}
+	}
+
+	seq_putc(seq, '\n');
+}
+
+/* Display the various packet counters of PPE. */
+static int ppe_packet_counter_show(struct seq_file *seq, void *v)
+{
+	struct ppe_device *ppe_dev = seq->private;
+
+	ppe_port_rx_drop_counter_get(ppe_dev, seq);
+	ppe_port_rx_bm_drop_counter_get(ppe_dev, seq);
+	ppe_port_rx_bm_port_counter_get(ppe_dev, seq);
+	ppe_parse_pkt_counter_get(ppe_dev, seq);
+	ppe_port_rx_counter_get(ppe_dev, seq);
+	ppe_vp_rx_counter_get(ppe_dev, seq);
+	ppe_pre_l2_counter_get(ppe_dev, seq);
+	ppe_vlan_counter_get(ppe_dev, seq);
+	ppe_cpu_code_counter_get(ppe_dev, seq);
+	ppe_eg_vsi_counter_get(ppe_dev, seq);
+	ppe_vp_tx_counter_get(ppe_dev, seq);
+	ppe_port_tx_counter_get(ppe_dev, seq);
+	ppe_queue_tx_counter_get(ppe_dev, seq);
+
+	return 0;
+}
+
+static int ppe_packet_counter_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, ppe_packet_counter_show, inode->i_private);
+}
+
+static ssize_t ppe_packet_counter_clear(struct file *file,
+					const char __user *buf,
+					size_t count, loff_t *pos)
+{
+	struct ppe_device *ppe_dev = file_inode(file)->i_private;
+	u32 reg;
+	int i;
+
+	for (i = 0; i < PPE_DROP_CNT_TBL_ENTRIES; i++) {
+		reg = PPE_DROP_CNT_TBL_ADDR + i * PPE_DROP_CNT_TBL_INC;
+		ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_1WORD);
+	}
+
+	for (i = 0; i < PPE_DROP_STAT_TBL_ENTRIES; i++) {
+		reg = PPE_DROP_STAT_TBL_ADDR + PPE_DROP_STAT_TBL_INC * i;
+		ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD);
+	}
+
+	for (i = 0; i < PPE_IPR_PKT_CNT_TBL_ENTRIES; i++) {
+		reg = PPE_IPR_PKT_CNT_TBL_ADDR + i * PPE_IPR_PKT_CNT_TBL_INC;
+		ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_1WORD);
+
+		reg = PPE_TPR_PKT_CNT_TBL_ADDR + i * PPE_TPR_PKT_CNT_TBL_INC;
+		ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_1WORD);
+	}
+
+	for (i = 0; i < PPE_VLAN_CNT_TBL_ENTRIES; i++) {
+		reg = PPE_VLAN_CNT_TBL_ADDR + PPE_VLAN_CNT_TBL_INC * i;
+		ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD);
+	}
+
+	for (i = 0; i < PPE_PRE_L2_CNT_TBL_ENTRIES; i++) {
+		reg = PPE_PRE_L2_CNT_TBL_ADDR + PPE_PRE_L2_CNT_TBL_INC * i;
+		ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_5WORD);
+	}
+
+	for (i = 0; i < PPE_PORT_TX_COUNTER_TBL_ENTRIES; i++) {
+		reg = PPE_PORT_TX_DROP_CNT_TBL_ADDR + PPE_PORT_TX_DROP_CNT_TBL_INC * i;
+		ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD);
+
+		reg = PPE_PORT_TX_COUNTER_TBL_ADDR + PPE_PORT_TX_COUNTER_TBL_INC * i;
+		ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD);
+	}
+
+	for (i = 0; i < PPE_EG_VSI_COUNTER_TBL_ENTRIES; i++) {
+		reg = PPE_EG_VSI_COUNTER_TBL_ADDR + PPE_EG_VSI_COUNTER_TBL_INC * i;
+		ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD);
+	}
+
+	for (i = 0; i < PPE_VPORT_TX_COUNTER_TBL_ENTRIES; i++) {
+		reg = PPE_VPORT_TX_COUNTER_TBL_ADDR + PPE_VPORT_TX_COUNTER_TBL_INC * i;
+		ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD);
+
+		reg = PPE_VPORT_TX_DROP_CNT_TBL_ADDR + PPE_VPORT_TX_DROP_CNT_TBL_INC * i;
+		ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD);
+	}
+
+	for (i = 0; i < PPE_QUEUE_TX_COUNTER_TBL_ENTRIES; i++) {
+		reg = PPE_QUEUE_TX_COUNTER_TBL_ADDR + PPE_QUEUE_TX_COUNTER_TBL_INC * i;
+		ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD);
+	}
+
+	ppe_tbl_pkt_cnt_clear(ppe_dev, PPE_EPE_DBG_IN_CNT_ADDR, PPE_PKT_CNT_SIZE_1WORD);
+	ppe_tbl_pkt_cnt_clear(ppe_dev, PPE_EPE_DBG_OUT_CNT_ADDR, PPE_PKT_CNT_SIZE_1WORD);
+
+	for (i = 0; i < PPE_DROP_CPU_CNT_TBL_ENTRIES; i++) {
+		reg = PPE_DROP_CPU_CNT_TBL_ADDR + PPE_DROP_CPU_CNT_TBL_INC * i;
+		ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD);
+	}
+
+	for (i = 0; i < PPE_PORT_RX_CNT_TBL_ENTRIES; i++) {
+		reg = PPE_PORT_RX_CNT_TBL_ADDR + PPE_PORT_RX_CNT_TBL_INC * i;
+		ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_5WORD);
+	}
+
+	for (i = 0; i < PPE_PHY_PORT_RX_CNT_TBL_ENTRIES; i++) {
+		reg = PPE_PHY_PORT_RX_CNT_TBL_ADDR + PPE_PHY_PORT_RX_CNT_TBL_INC * i;
+		ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_5WORD);
+	}
+
+	return count;
+}
+
+static const struct file_operations ppe_debugfs_packet_counter_fops = {
+	.owner   = THIS_MODULE,
+	.open    = ppe_packet_counter_open,
+	.read    = seq_read,
+	.llseek  = seq_lseek,
+	.release = single_release,
+	.write   = ppe_packet_counter_clear,
+};
+
+void ppe_debugfs_setup(struct ppe_device *ppe_dev)
+{
+	ppe_dev->debugfs_root = debugfs_create_dir("ppe", NULL);
+	debugfs_create_file("packet_counters", 0444,
+			    ppe_dev->debugfs_root,
+			    ppe_dev,
+			    &ppe_debugfs_packet_counter_fops);
+}
+
+void ppe_debugfs_teardown(struct ppe_device *ppe_dev)
+{
+	debugfs_remove_recursive(ppe_dev->debugfs_root);
+	ppe_dev->debugfs_root = NULL;
+}
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.h b/drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.h
new file mode 100644
index 000000000000..ba0a5b3af583
--- /dev/null
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/* PPE debugfs counters setup. */
+
+#ifndef __PPE_DEBUGFS_H__
+#define __PPE_DEBUGFS_H__
+
+#include "ppe.h"
+
+void ppe_debugfs_setup(struct ppe_device *ppe_dev);
+void ppe_debugfs_teardown(struct ppe_device *ppe_dev);
+
+#endif
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
index f23fafa35766..a9f3a2bc4861 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
@@ -16,6 +16,39 @@
 #define PPE_BM_SCH_CTRL_SCH_OFFSET		GENMASK(14, 8)
 #define PPE_BM_SCH_CTRL_SCH_EN			BIT(31)
 
+/* PPE drop counters. */
+#define PPE_DROP_CNT_TBL_ADDR			0xb024
+#define PPE_DROP_CNT_TBL_ENTRIES		8
+#define PPE_DROP_CNT_TBL_INC			4
+
+/* BM port drop counters. */
+#define PPE_DROP_STAT_TBL_ADDR			0xe000
+#define PPE_DROP_STAT_TBL_ENTRIES		30
+#define PPE_DROP_STAT_TBL_INC			0x10
+
+#define PPE_EPE_DBG_IN_CNT_ADDR			0x26054
+#define PPE_EPE_DBG_OUT_CNT_ADDR		0x26070
+
+/* Egress VLAN counters. */
+#define PPE_EG_VSI_COUNTER_TBL_ADDR		0x41000
+#define PPE_EG_VSI_COUNTER_TBL_ENTRIES		64
+#define PPE_EG_VSI_COUNTER_TBL_INC		0x10
+
+/* Port TX counters. */
+#define PPE_PORT_TX_COUNTER_TBL_ADDR		0x45000
+#define PPE_PORT_TX_COUNTER_TBL_ENTRIES		8
+#define PPE_PORT_TX_COUNTER_TBL_INC		0x10
+
+/* Virtual port TX counters. */
+#define PPE_VPORT_TX_COUNTER_TBL_ADDR		0x47000
+#define PPE_VPORT_TX_COUNTER_TBL_ENTRIES	256
+#define PPE_VPORT_TX_COUNTER_TBL_INC		0x10
+
+/* Queue counters. */
+#define PPE_QUEUE_TX_COUNTER_TBL_ADDR		0x4a000
+#define PPE_QUEUE_TX_COUNTER_TBL_ENTRIES	300
+#define PPE_QUEUE_TX_COUNTER_TBL_INC		0x10
+
 /* RSS settings are to calculate the random RSS hash value generated during
  * packet receive to ARM cores. This hash is then used to generate the queue
  * offset used to determine the queue used to transmit the packet to ARM cores.
@@ -213,6 +246,51 @@
 #define PPE_L2_PORT_SET_DST_INFO(tbl_cfg, value)		\
 	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_L2_VP_PORT_W0_DST_INFO)
 
+/* Port RX and RX drop counters. */
+#define PPE_PORT_RX_CNT_TBL_ADDR		0x150000
+#define PPE_PORT_RX_CNT_TBL_ENTRIES		256
+#define PPE_PORT_RX_CNT_TBL_INC			0x20
+
+/* Physical port RX and RX drop counters. */
+#define PPE_PHY_PORT_RX_CNT_TBL_ADDR		0x156000
+#define PPE_PHY_PORT_RX_CNT_TBL_ENTRIES		8
+#define PPE_PHY_PORT_RX_CNT_TBL_INC		0x20
+
+/* Counters for the packet to CPU port. */
+#define PPE_DROP_CPU_CNT_TBL_ADDR		0x160000
+#define PPE_DROP_CPU_CNT_TBL_ENTRIES		1280
+#define PPE_DROP_CPU_CNT_TBL_INC		0x10
+
+/* VLAN counters. */
+#define PPE_VLAN_CNT_TBL_ADDR			0x178000
+#define PPE_VLAN_CNT_TBL_ENTRIES		64
+#define PPE_VLAN_CNT_TBL_INC			0x10
+
+/* PPE L2 counters. */
+#define PPE_PRE_L2_CNT_TBL_ADDR			0x17c000
+#define PPE_PRE_L2_CNT_TBL_ENTRIES		64
+#define PPE_PRE_L2_CNT_TBL_INC			0x20
+
+/* Port TX drop counters. */
+#define PPE_PORT_TX_DROP_CNT_TBL_ADDR		0x17d000
+#define PPE_PORT_TX_DROP_CNT_TBL_ENTRIES	8
+#define PPE_PORT_TX_DROP_CNT_TBL_INC		0x10
+
+/* Virtual port TX counters. */
+#define PPE_VPORT_TX_DROP_CNT_TBL_ADDR		0x17e000
+#define PPE_VPORT_TX_DROP_CNT_TBL_ENTRIES	256
+#define PPE_VPORT_TX_DROP_CNT_TBL_INC		0x10
+
+/* Counters for the tunnel packet. */
+#define PPE_TPR_PKT_CNT_TBL_ADDR		0x1d0080
+#define PPE_TPR_PKT_CNT_TBL_ENTRIES		8
+#define PPE_TPR_PKT_CNT_TBL_INC			4
+
+/* Counters for the all packet received. */
+#define PPE_IPR_PKT_CNT_TBL_ADDR		0x1e0080
+#define PPE_IPR_PKT_CNT_TBL_ENTRIES		8
+#define PPE_IPR_PKT_CNT_TBL_INC			4
+
 /* PPE service code configuration for the tunnel packet. */
 #define PPE_TL_SERVICE_TBL_ADDR			0x306000
 #define PPE_TL_SERVICE_TBL_ENTRIES		256
@@ -325,6 +403,18 @@
 #define PPE_BM_PORT_GROUP_ID_INC		0x4
 #define PPE_BM_PORT_GROUP_ID_SHARED_GROUP_ID	GENMASK(1, 0)
 
+/* Counters for PPE buffers used for packets cached. */
+#define PPE_BM_USED_CNT_TBL_ADDR		0x6001c0
+#define PPE_BM_USED_CNT_TBL_ENTRIES		15
+#define PPE_BM_USED_CNT_TBL_INC			0x4
+#define PPE_BM_USED_CNT_VAL			GENMASK(10, 0)
+
+/* Counters for PPE buffers used for packets received after pause frame sent. */
+#define PPE_BM_REACT_CNT_TBL_ADDR		0x600240
+#define PPE_BM_REACT_CNT_TBL_ENTRIES		15
+#define PPE_BM_REACT_CNT_TBL_INC		0x4
+#define PPE_BM_REACT_CNT_VAL			GENMASK(8, 0)
+
 #define PPE_BM_SHARED_GROUP_CFG_ADDR		0x600290
 #define PPE_BM_SHARED_GROUP_CFG_ENTRIES		4
 #define PPE_BM_SHARED_GROUP_CFG_INC		0x4
@@ -449,6 +539,18 @@
 #define PPE_AC_GRP_SET_BUF_LIMIT(tbl_cfg, value)	\
 	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value, PPE_AC_GRP_W1_BUF_LIMIT)
 
+/* Counters for packets handled by unicast queues (0-255). */
+#define PPE_AC_UNICAST_QUEUE_CNT_TBL_ADDR	0x84e000
+#define PPE_AC_UNICAST_QUEUE_CNT_TBL_ENTRIES	256
+#define PPE_AC_UNICAST_QUEUE_CNT_TBL_INC	0x10
+#define PPE_AC_UNICAST_QUEUE_CNT_TBL_PEND_CNT	GENMASK(12, 0)
+
+/* Counters for packets handled by multicast queues (256-299). */
+#define PPE_AC_MULTICAST_QUEUE_CNT_TBL_ADDR	0x852000
+#define PPE_AC_MULTICAST_QUEUE_CNT_TBL_ENTRIES	44
+#define PPE_AC_MULTICAST_QUEUE_CNT_TBL_INC	0x10
+#define PPE_AC_MULTICAST_QUEUE_CNT_TBL_PEND_CNT	GENMASK(12, 0)
+
 /* Table addresses for per-queue enqueue setting. */
 #define PPE_ENQ_OPR_TBL_ADDR			0x85c000
 #define PPE_ENQ_OPR_TBL_ENTRIES			300

-- 
2.34.1


