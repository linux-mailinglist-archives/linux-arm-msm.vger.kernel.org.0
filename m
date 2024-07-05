Return-Path: <linux-arm-msm+bounces-25338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B26F392847B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 11:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B32E28628F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 09:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8377E1494A8;
	Fri,  5 Jul 2024 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iZ040iaW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D2E1494A5;
	Fri,  5 Jul 2024 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720170102; cv=none; b=oKf1qpRbaUeCWr4LGKdOfSfMaXj+lFsH0jTwxL7QaJWX+dASKiH5DfJiUcWWmdxEkCqdq20M4hDlxwvfsU3h2PI4X41m7TGoYQNf8TRtJU49dLv9fn3S41obz1G2hBqPs+RltXkcRZz2/k00zVz1tIW+uQQ5fFiRQhQAG1SX5uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720170102; c=relaxed/simple;
	bh=HDKWu8GpL13gBgzu0GuJRkhR+f4jcpl/i5zzWg5pse0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S3Wi/DqAwljW1TabOqIy32VfBCm9AvrDQ1WK5cFQCO98HOm6tc8hdcjNmnAnZfGt8CtvUiV99kbZMAxulu+IT8wI3yikhWskCrIRHUMYONsXIEwZYPdZ4KiMhzAfvgoXwhAwke7vY4q8e+5/IBMQs3liKh0I3E+RYR0ZSsz27eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iZ040iaW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4651DM9M005835;
	Fri, 5 Jul 2024 09:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d5AP3lmxM8tUTeT43DQAfv0gZDTnoJGo2RiyJyI2Iu4=; b=iZ040iaWHhGQty9L
	xAT1KtkEi5SVnREKKbgs1Gxoav0CgLF8fp5Lfjw3dPlb05SllhVR629IMH7bQvYN
	6hOKcFCeCp9aYYbO0hZODcFNf4So+4geymmUMrucEVpG5qu1Hf6YuuZnVVO0Eki4
	miSB7maY5uc6xvQt/9d0xIAJyZc0dZgGIt0kKym1BbMtq3sVaG2yrjKIA8ffxHbx
	Bg8rzO5KtGAHTzm+As1oraoJMUug7faOxEAMMPCQq/JBWVXI8I4C4grwNN3w9tI5
	IqrYcCnJbOKgPY54klk1zQwkyhwVZAdRy/TXIY2s2aR3odzw9YHdy4XgrCugVzxR
	9S1fhA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4050cydp36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 09:01:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46591PHZ002768
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jul 2024 09:01:25 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 5 Jul 2024 02:01:20 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        James Clark <james.clark@arm.com>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        "Tao
 Zhang" <quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Song
 Chai" <quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2 3/4] Coresight: Add Coresight Control Unit driver
Date: Fri, 5 Jul 2024 17:00:48 +0800
Message-ID: <20240705090049.1656986-4-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
References: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
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
X-Proofpoint-GUID: EwiRMf6LzYG2O_9pcCzF9VOtqr-RIv0I
X-Proofpoint-ORIG-GUID: EwiRMf6LzYG2O_9pcCzF9VOtqr-RIv0I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_05,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 mlxscore=0 impostorscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407050067

The Coresight Control Unit hosts miscellaneous configuration registers
which control various features related to TMC ETR sink.

Based on the trace ID, which is programmed in the related CCU ATID register
of a specific ETR, trace data with that trace ID gets into the ETR buffer,
while other trace data gets dropped.

Enabling source device sets one bit of the ATID register based on source
device's trace ID.
Disabling source device resets the bit according to the source device's trace ID.

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/Kconfig         |   6 +
 drivers/hwtracing/coresight/Makefile        |   1 +
 drivers/hwtracing/coresight/coresight-ccu.c | 290 ++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ccu.h |  18 ++
 4 files changed, 315 insertions(+)
 create mode 100644 drivers/hwtracing/coresight/coresight-ccu.c
 create mode 100644 drivers/hwtracing/coresight/coresight-ccu.h

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 06f0a7594169..a36934daa505 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -133,6 +133,12 @@ config CORESIGHT_STM
 	  To compile this driver as a module, choose M here: the
 	  module will be called coresight-stm.
 
+config CORESIGHT_CCU
+	tristate "CoreSight Control Unit driver"
+	help
+	  This driver provides support for CoreSight Control Unit block
+	  that hosts miscellaneous configuration registers.
+
 config CORESIGHT_CPU_DEBUG
 	tristate "CoreSight CPU Debug driver"
 	depends on ARM || ARM64
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 4ba478211b31..a668cdba926f 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 		   coresight-cti-sysfs.o
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
+obj-$(CONFIG_CORESIGHT_CCU) += coresight-ccu.o
diff --git a/drivers/hwtracing/coresight/coresight-ccu.c b/drivers/hwtracing/coresight/coresight-ccu.c
new file mode 100644
index 000000000000..30faf87b1a28
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-ccu.c
@@ -0,0 +1,290 @@
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
+#include <linux/coresight-stm.h>
+
+#include "coresight-ccu.h"
+#include "coresight-priv.h"
+#include "coresight-tmc.h"
+#include "coresight-trace-id.h"
+
+DEFINE_CORESIGHT_DEVLIST(ccu_devs, "ccu");
+
+#define ccu_writel(drvdata, val, offset)	__raw_writel((val), drvdata->base + offset)
+#define ccu_readl(drvdata, offset)		__raw_readl(drvdata->base + offset)
+
+/* The Coresight Control Unit uses four ATID registers to control the data filter function based
+ * on the trace ID for each TMC ETR sink. The length of each ATID register is 32 bits. Therefore,
+ * the ETR has a related field in CCU that is 128 bits long. Each trace ID is represented by one bit in that filed.
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
+#define CCU_ATID_REG_OFFSET(traceid, atid_offset) \
+		((traceid / 32) * 4 + atid_offset)
+
+#define CCU_ATID_REG_BIT(traceid)	(traceid % 32)
+#define CCU_ATID_REG_SIZE		0x10
+
+/*
+ * __ccu_set_etr_traceid: Set bit in the ATID register based on trace ID when enable is true.
+ * Reset the bit of the ATID register based on trace ID when enable is false.
+ *
+ * @csdev:	coresight_device struct related to the device
+ * @traceid:	trace ID of the source tracer.
+ * @enable:	True for set bit and false for reset bit.
+ *
+ * Returns 0 indicates success. Non-zero result means failure.
+ */
+static int __ccu_set_etr_traceid(struct coresight_device *csdev,
+			uint32_t traceid, bool enable)
+{
+	uint32_t atid_offset = 0;
+	struct ccu_drvdata *drvdata;
+	unsigned long flags;
+	uint32_t reg_offset;
+	int bit;
+	uint32_t val;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+	if (IS_ERR_OR_NULL(drvdata))
+		return -EINVAL;
+
+	atid_offset = drvdata->atid_offset;
+	if (((traceid < 0) && (traceid >= CORESIGHT_TRACE_IDS_MAX)) || atid_offset <= 0)
+		return -EINVAL;
+
+	spin_lock_irqsave(&drvdata->spin_lock, flags);
+	CS_UNLOCK(drvdata->base);
+
+	reg_offset = CCU_ATID_REG_OFFSET(traceid, atid_offset);
+	bit = CCU_ATID_REG_BIT(traceid);
+	if (reg_offset - atid_offset >= CCU_ATID_REG_SIZE
+		|| bit >= CORESIGHT_TRACE_IDS_MAX) {
+		CS_LOCK(drvdata);
+		spin_unlock_irqrestore(&drvdata->spin_lock, flags);
+		return -EINVAL;
+	}
+
+	val = ccu_readl(drvdata, reg_offset);
+	if (enable)
+		val = val | BIT(bit);
+	else
+		val = val & ~BIT(bit);
+	ccu_writel(drvdata, val, reg_offset);
+
+	CS_LOCK(drvdata->base);
+	spin_unlock_irqrestore(&drvdata->spin_lock, flags);
+	return 0;
+}
+
+/*
+ * ccu_set_atid_offset: Retrieve the offset of the CCU ATID register and store it in the driver data of ETR.
+ *
+ * Returns 0 indicates success. If the result is less than zero, it means
+ * failure.
+ */
+static int __ccu_set_atid_offset(struct device_node *helper_node, struct coresight_device *helper, int port)
+{
+	int atid_offset = 0;
+	struct device_node *node = helper_node;
+	struct device_node *child_node = NULL;
+	struct fwnode_handle *child_fwnode = NULL;
+	struct ccu_drvdata *drvdata;
+
+	if (!helper_node || !helper)
+		return -EINVAL;
+
+	drvdata = dev_get_drvdata(helper->dev.parent);
+	if (IS_ERR_OR_NULL(drvdata))
+		return -EINVAL;
+
+	child_node = of_get_child_by_name(node, "in-ports");
+	if (!child_node)
+		return -EINVAL;
+
+	child_fwnode = fwnode_graph_get_endpoint_by_id(&child_node->fwnode, port, 0, 0);
+	if (!child_fwnode)
+		return -EINVAL;
+
+	fwnode_property_read_u32(child_fwnode, "qcom,ccu-atid-offset", &atid_offset);
+	drvdata->atid_offset = atid_offset;
+	dev_dbg(&helper->dev, "atid_offset:0x%x\n", atid_offset);
+
+	return 0;
+}
+
+static int ccu_set_atid_offset(struct coresight_device *sink, struct coresight_device *helper)
+{
+	int port, i, ret = 0;
+	struct device_node *node;
+
+	for (i = 0; i < sink->pdata->nr_outconns; ++i) {
+		if (sink->pdata->out_conns[i]->dest_dev) {
+			port = sink->pdata->out_conns[i]->dest_port;
+			node = sink->pdata->out_conns[i]->dest_fwnode->dev->of_node;
+			ret = __ccu_set_atid_offset(node, helper, port);
+			return ret;
+		}
+	}
+
+	return -EINVAL;
+}
+
+/*
+ * ccu_set_etr_traceid: Retrieve the ATID offset and trace ID.
+ *
+ * Returns 0 indicates success. None-zero result means failure.
+ */
+static int ccu_set_etr_traceid(struct coresight_device *csdev, struct cs_sink_data *sink_data, bool enable)
+{
+	if ((sink_data->traceid < 0) || (csdev == NULL) || (sink_data->sink == NULL)) {
+		dev_dbg(&csdev->dev, "Invalid parameters\n");
+		return -EINVAL;
+	}
+
+	if (ccu_set_atid_offset(sink_data->sink, csdev))
+		return -EINVAL;
+
+	dev_dbg(&csdev->dev, "traceid is %d\n", sink_data->traceid);
+
+	return __ccu_set_etr_traceid(csdev, sink_data->traceid, enable);
+}
+
+static int ccu_enable(struct coresight_device *csdev, enum cs_mode mode,
+		       void *data)
+{
+	int ret = 0;
+	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
+
+	ret = ccu_set_etr_traceid(csdev, sink_data, true);
+	if (ret)
+		dev_dbg(&csdev->dev,"enable data filter failed\n");
+
+	return 0;
+}
+
+static int ccu_disable(struct coresight_device *csdev, void *data)
+{
+	int ret = 0;
+	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
+
+	ret = ccu_set_etr_traceid(csdev, sink_data, false);
+	if (ret)
+		dev_dbg(&csdev->dev,"disable data filter failed\n");
+
+	return 0;
+}
+
+static const struct coresight_ops_helper ccu_helper_ops = {
+	.enable = ccu_enable,
+	.disable = ccu_disable,
+};
+
+static const struct coresight_ops ccu_ops = {
+	.helper_ops = &ccu_helper_ops,
+};
+
+static int ccu_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct coresight_platform_data *pdata;
+	struct ccu_drvdata *drvdata;
+	struct coresight_desc desc = { 0 };
+	struct resource *res;
+
+	desc.name = coresight_alloc_device_name(&ccu_devs, dev);
+	if (!desc.name)
+		return -ENOMEM;
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+	pdev->dev.platform_data = pdata;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+	drvdata->dev = &pdev->dev;
+	drvdata->atid_offset = 0;
+	platform_set_drvdata(pdev, drvdata);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ccu-base");
+	if (!res)
+		return -ENODEV;
+	drvdata->pbase = res->start;
+
+	drvdata->base = devm_ioremap(dev, res->start, resource_size(res));
+	if (!drvdata->base)
+		return -ENOMEM;
+
+	desc.type = CORESIGHT_DEV_TYPE_HELPER;
+	desc.pdata = pdev->dev.platform_data;
+	desc.dev = &pdev->dev;
+	desc.ops = &ccu_ops;
+
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev))
+		return PTR_ERR(drvdata->csdev);
+
+	dev_dbg(dev, "CCU initialized: %s\n", desc.name);
+	return 0;
+}
+
+static void ccu_remove(struct platform_device *pdev)
+{
+	struct ccu_drvdata *drvdata = platform_get_drvdata(pdev);
+
+	coresight_unregister(drvdata->csdev);
+}
+
+static const struct of_device_id ccu_match[] = {
+	{.compatible = "qcom,coresight-ccu"},
+	{}
+};
+
+static struct platform_driver ccu_driver = {
+	.probe          = ccu_probe,
+	.remove         = ccu_remove,
+	.driver         = {
+		.name   = "coresight-ccu",
+		.of_match_table = ccu_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init ccu_init(void)
+{
+	return platform_driver_register(&ccu_driver);
+}
+module_init(ccu_init);
+
+static void __exit ccu_exit(void)
+{
+	platform_driver_unregister(&ccu_driver);
+}
+module_exit(ccu_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("CoreSight Control Unit driver");
diff --git a/drivers/hwtracing/coresight/coresight-ccu.h b/drivers/hwtracing/coresight/coresight-ccu.h
new file mode 100644
index 000000000000..d2895d288c88
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-ccu.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _CORESIGHT_CCU_H
+#define _CORESIGHT_CCU_H
+
+struct ccu_drvdata {
+	void __iomem		*base;
+	phys_addr_t		pbase;
+	struct device		*dev;
+	struct coresight_device	*csdev;
+	spinlock_t		spin_lock;
+	uint32_t		atid_offset;
+};
+
+#endif
-- 
2.34.1


