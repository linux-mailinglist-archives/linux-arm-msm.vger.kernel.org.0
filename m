Return-Path: <linux-arm-msm+bounces-29691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA40961B7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 03:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5CB71F24805
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 01:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607E5335BA;
	Wed, 28 Aug 2024 01:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Euz2pOsw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0A0288D1;
	Wed, 28 Aug 2024 01:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724808493; cv=none; b=Q90Mpads1MGdUjcuP+5ddBInVqsHch90R1qCeIt3sA5Jf5ww0JLUQGiDJEdUq5TdByYKpq2iZyildNlwHhNsGAh4cszsyqp0gcDh2JCo8A5iB8Z3BWrX0TI5TdsGt/dM4RIFuwEUop2sE8+64V/ZhWaEW90hcooR2thBuuhz5D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724808493; c=relaxed/simple;
	bh=zGgBmQWbNpALuN0wVp75/rI/0Mj0dANl4fitHBXUj68=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ue7Bm0uInXBb5AhMOrna6upNm/VJmUsFHEq20XpLXByO4A/D4FAspXf4JHGLig12fDJ/pZbz5/rMXNqgeSWby8JIXfX0cVZenrMi81iM+GSZxtHck2GYLd1Xb9cyc1/MCxtrKLqfCtNimQbEGlyfuxjBPovgVxCnMU3zyJEhfzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Euz2pOsw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLZsrE007450;
	Wed, 28 Aug 2024 01:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8696fy4vlMwY0gAsSyFdqvhBE7SMUwofwED0Dm7hcMQ=; b=Euz2pOswzINxw19O
	S2pjea7BJa69FfbofsxWcCn/1bJy75EME0hQIt+7Sr8HKGKfXDJ/HzIOpL5E2jBf
	cBYvIC8193LtKrEe0Qu+Qh5BQLBDumFVxtiNW9CMDdHRsITNN2eQWKEkiQNgtCe5
	hwOI8VTIYUqyZlChc6Z+y0yqJzNaeK9rrHf7/FPU4/LzyBwHYcQ4RgDyiOQI6fnB
	MIMZefj2Ra8rQHFJxqhg3Y7Laz8YCrx3XHtWDhvImUaOnJrygd6O4uva03OZw8Ks
	ydNzHwMgEBLyYFyNggBuK59WhswRnKU2pR5DI0Vw2ui0F+D6aHlXIvBr8wdCb6AJ
	QG861Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puv8be5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 01:27:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S1Rsp0014947
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 01:27:54 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 18:27:48 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        Song Chai <quic_songchai@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v4 4/5] Coresight: Add Coresight TMC Control Unit driver
Date: Wed, 28 Aug 2024 09:27:05 +0800
Message-ID: <20240828012706.543605-5-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828012706.543605-1-quic_jiegan@quicinc.com>
References: <20240828012706.543605-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aqxVAc5Yc6h_M6TkvO4FAiIwggNOagxT
X-Proofpoint-GUID: aqxVAc5Yc6h_M6TkvO4FAiIwggNOagxT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_12,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280009

The Coresight TMC Control Unit hosts miscellaneous configuration registers
which control various features related to TMC ETR sink.

Based on the trace ID, which is programmed in the related CTCU ATID
register of a specific ETR, trace data with that trace ID gets into
the ETR buffer, while other trace data gets dropped.

Enabling source device sets one bit of the ATID register based on
source device's trace ID.
Disabling source device resets the bit according to the source
device's trace ID.

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/Kconfig          |   8 +
 drivers/hwtracing/coresight/Makefile         |   1 +
 drivers/hwtracing/coresight/coresight-ctcu.c | 292 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu.h |  21 ++
 include/linux/coresight.h                    |   3 +-
 5 files changed, 324 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 06f0a7594169..152eab0b9b2a 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -133,6 +133,14 @@ config CORESIGHT_STM
 	  To compile this driver as a module, choose M here: the
 	  module will be called coresight-stm.
 
+config CORESIGHT_CTCU
+	tristate "CoreSight TMC Control Unit driver"
+	help
+	  This driver provides support for CoreSight TMC Control Unit
+	  that hosts miscellaneous configuration registers. This is
+	  primarily used for controlling the behaviors of the TMC
+	  ETR device.
+
 config CORESIGHT_CPU_DEBUG
 	tristate "CoreSight CPU Debug driver"
 	depends on ARM || ARM64
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 4ba478211b31..1b7869910a12 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 		   coresight-cti-sysfs.o
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
+obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
diff --git a/drivers/hwtracing/coresight/coresight-ctcu.c b/drivers/hwtracing/coresight/coresight-ctcu.c
new file mode 100644
index 000000000000..e3a8259a2412
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-ctcu.c
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/clk.h>
+#include <linux/coresight.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "coresight-ctcu.h"
+#include "coresight-priv.h"
+#include "coresight-trace-id.h"
+
+DEFINE_CORESIGHT_DEVLIST(ctcu_devs, "ctcu");
+
+#define ctcu_writel(drvdata, val, offset)	__raw_writel((val), drvdata->base + offset)
+#define ctcu_readl(drvdata, offset)		__raw_readl(drvdata->base + offset)
+
+/* The TMC Coresight Control Unit uses four ATID registers to control the data filter function based
+ * on the trace ID for each TMC ETR sink. The length of each ATID register is 32 bits. Therefore,
+ * the ETR has a related field in CTCU that is 128 bits long. Each trace ID is represented by one
+ * bit in that filed.
+ * e.g. ETR0ATID0 layout, set bit 5 for traceid 5
+ *                                           bit5
+ * ------------------------------------------------------
+ * |   |28|   |24|   |20|   |16|   |12|   |8|  1|4|   |0|
+ * ------------------------------------------------------
+ *
+ * e.g. ETR0:
+ * 127                     0 from ATID_offset for ETR0ATID0
+ * -------------------------
+ * |ATID3|ATID2|ATID1|ATID0|
+ *
+ */
+#define CTCU_ATID_REG_OFFSET(traceid, atid_offset) \
+		((traceid / 32) * 4 + atid_offset)
+
+#define CTCU_ATID_REG_BIT(traceid)	(traceid % 32)
+#define CTCU_ATID_REG_SIZE		0x10
+
+struct ctcu_atid_config {
+	const int atid_offset;
+	const int port_num;
+};
+
+struct ctcu_config {
+	const struct ctcu_atid_config *atid_config;
+	int num_atid_config;
+};
+
+static const struct ctcu_atid_config sa8775p_atid_cfgs[] = {
+	{0xf8,  0},
+	{0x108, 1},
+};
+
+static const struct ctcu_config sa8775p_cfgs = {
+	.atid_config		= sa8775p_atid_cfgs,
+	.num_atid_config	= ARRAY_SIZE(sa8775p_atid_cfgs),
+};
+
+/*
+ * __ctcu_set_etr_traceid: Set bit in the ATID register based on trace ID when enable is true.
+ * Reset the bit of the ATID register based on trace ID when enable is false.
+ *
+ * @csdev:	coresight_device struct related to the device
+ * @traceid:	trace ID of the source tracer.
+ * @enable:	True for set bit and false for reset bit.
+ *
+ * Returns 0 indicates success. Non-zero result means failure.
+ */
+static int __ctcu_set_etr_traceid(struct coresight_device *csdev,
+				  u8 traceid,
+				  int port_num,
+				  bool enable)
+{
+	uint32_t atid_offset;
+	struct ctcu_drvdata *drvdata;
+	unsigned long flags;
+	uint32_t reg_offset;
+	int bit;
+	uint32_t val;
+
+	if (!IS_VALID_CS_TRACE_ID(traceid) || port_num < 0)
+		return -EINVAL;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+	if (IS_ERR_OR_NULL(drvdata))
+		return -EINVAL;
+
+	atid_offset = drvdata->atid_offset[port_num];
+	if (atid_offset == 0)
+		return -EINVAL;
+
+	spin_lock_irqsave(&drvdata->spin_lock, flags);
+	CS_UNLOCK(drvdata->base);
+
+	reg_offset = CTCU_ATID_REG_OFFSET(traceid, atid_offset);
+	bit = CTCU_ATID_REG_BIT(traceid);
+	if (reg_offset - atid_offset >= CTCU_ATID_REG_SIZE ||
+	    bit >= CORESIGHT_TRACE_IDS_MAX) {
+		CS_LOCK(drvdata);
+		spin_unlock_irqrestore(&drvdata->spin_lock, flags);
+		return -EINVAL;
+	}
+
+	val = ctcu_readl(drvdata, reg_offset);
+	if (enable)
+		val = val | BIT(bit);
+	else
+		val = val & ~BIT(bit);
+	ctcu_writel(drvdata, val, reg_offset);
+
+	CS_LOCK(drvdata->base);
+	spin_unlock_irqrestore(&drvdata->spin_lock, flags);
+
+	return 0;
+}
+
+static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
+{
+	int port, i;
+
+	for (i = 0; i < sink->pdata->nr_outconns; ++i) {
+		if (sink->pdata->out_conns[i]->dest_dev) {
+			port = sink->pdata->out_conns[i]->dest_port;
+			return port;
+		}
+	}
+
+	return -EINVAL;
+}
+
+/*
+ * ctcu_set_etr_traceid: Retrieve the ATID offset and trace ID.
+ *
+ * Returns 0 indicates success. None-zero result means failure.
+ */
+static int ctcu_set_etr_traceid(struct coresight_device *csdev,
+				struct cs_sink_data *sink_data,
+				bool enable)
+{
+	int port_num;
+
+	if (!IS_VALID_CS_TRACE_ID(sink_data->traceid) ||
+	    (csdev == NULL) ||
+	    (sink_data->sink == NULL)) {
+		dev_dbg(&csdev->dev, "Invalid parameters\n");
+		return -EINVAL;
+	}
+
+	port_num = ctcu_get_active_port(sink_data->sink, csdev);
+	if (port_num < 0)
+		return -EINVAL;
+
+	dev_dbg(&csdev->dev, "traceid is %d\n", sink_data->traceid);
+
+	return __ctcu_set_etr_traceid(csdev, sink_data->traceid, port_num, enable);
+}
+
+static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
+		       void *data)
+{
+	int ret = 0;
+	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
+
+	ret = ctcu_set_etr_traceid(csdev, sink_data, true);
+	if (ret)
+		dev_dbg(&csdev->dev, "enable data filter failed\n");
+
+	return 0;
+}
+
+static int ctcu_disable(struct coresight_device *csdev, void *data)
+{
+	int ret = 0;
+	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
+
+	ret = ctcu_set_etr_traceid(csdev, sink_data, false);
+	if (ret)
+		dev_dbg(&csdev->dev, "disable data filter failed\n");
+
+	return 0;
+}
+
+static const struct coresight_ops_helper ctcu_helper_ops = {
+	.enable = ctcu_enable,
+	.disable = ctcu_disable,
+};
+
+static const struct coresight_ops ctcu_ops = {
+	.helper_ops = &ctcu_helper_ops,
+};
+
+static int ctcu_probe(struct platform_device *pdev)
+{
+	int i;
+	void __iomem *base;
+	struct device *dev = &pdev->dev;
+	struct coresight_platform_data *pdata;
+	struct ctcu_drvdata *drvdata;
+	struct coresight_desc desc = { 0 };
+	const struct ctcu_config *cfgs;
+	const struct ctcu_atid_config *atid_cfg;
+
+	desc.name = coresight_alloc_device_name(&ctcu_devs, dev);
+	if (!desc.name)
+		return -ENOMEM;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+	dev->platform_data = pdata;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (!base)
+		return -ENOMEM;
+
+	drvdata->apb_clk = coresight_get_enable_apb_pclk(dev);
+	if (IS_ERR(drvdata->apb_clk))
+		return -ENODEV;
+
+	cfgs = of_device_get_match_data(dev);
+	if (cfgs) {
+		if (cfgs->num_atid_config <= ATID_MAX_NUM) {
+			for (i = 0; i < cfgs->num_atid_config; i++) {
+				atid_cfg = &cfgs->atid_config[i];
+				drvdata->atid_offset[i] = atid_cfg->atid_offset;
+			}
+		}
+	}
+
+	drvdata->base = base;
+	drvdata->dev = dev;
+	platform_set_drvdata(pdev, drvdata);
+
+	desc.type = CORESIGHT_DEV_TYPE_HELPER;
+	desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU;
+	desc.pdata = pdata;
+	desc.dev = dev;
+	desc.ops = &ctcu_ops;
+
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev)) {
+		if (!IS_ERR_OR_NULL(drvdata->apb_clk))
+			clk_put(drvdata->apb_clk);
+
+		return PTR_ERR(drvdata->csdev);
+	}
+
+	return 0;
+}
+
+static void ctcu_remove(struct platform_device *pdev)
+{
+	struct ctcu_drvdata *drvdata = platform_get_drvdata(pdev);
+
+	coresight_unregister(drvdata->csdev);
+	if (!IS_ERR_OR_NULL(drvdata->apb_clk))
+		clk_put(drvdata->apb_clk);
+}
+
+static const struct of_device_id ctcu_match[] = {
+	{.compatible = "qcom,sa8775p-ctcu", .data = &sa8775p_cfgs},
+	{}
+};
+
+static struct platform_driver ctcu_driver = {
+	.probe          = ctcu_probe,
+	.remove         = ctcu_remove,
+	.driver         = {
+		.name   = "coresight-ctcu",
+		.of_match_table = ctcu_match,
+		.suppress_bind_attrs = true,
+	},
+};
+module_platform_driver(ctcu_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("CoreSight TMC Control Unit driver");
diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
new file mode 100644
index 000000000000..ce5c9661623a
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-ctcu.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _CORESIGHT_CTCU_H
+#define _CORESIGHT_CTCU_H
+
+#define ATID_MAX_NUM 5
+
+struct ctcu_drvdata {
+	void __iomem		*base;
+	struct clk		*apb_clk;
+	phys_addr_t		pbase;
+	struct device		*dev;
+	struct coresight_device	*csdev;
+	spinlock_t		spin_lock;
+	uint32_t		atid_offset[ATID_MAX_NUM];
+};
+
+#endif
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 22b977908f4f..d92530b3fa57 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -71,7 +71,8 @@ enum coresight_dev_subtype_source {
 
 enum coresight_dev_subtype_helper {
 	CORESIGHT_DEV_SUBTYPE_HELPER_CATU,
-	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI
+	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI,
+	CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
 };
 
 /**
-- 
2.34.1


