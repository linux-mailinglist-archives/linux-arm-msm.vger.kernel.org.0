Return-Path: <linux-arm-msm+bounces-49964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 296B5A4B6C3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 04:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A81E818874AB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 03:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9631DE2DE;
	Mon,  3 Mar 2025 03:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BzbsX36m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB111D79A0;
	Mon,  3 Mar 2025 03:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740972787; cv=none; b=MucZ6I2TOuXRxPoP96TOkh9Mmw5B1EyLulnb0HuJQ51W9+U1iHJeKcrbPtoHUMLnA0gDFKdM30+0XVWvVQ1XG/eEw1Kc3tv6SSa0Y1zYrS+wvYBn9N1Lpp7LGuRe7L6D4hlC0B2e4ujodxAqlNFlsdqOzpOKbivzXDkUeZ2tIk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740972787; c=relaxed/simple;
	bh=piwV5oASFSNJn4oHDvj/IgqXntqe+pC1KucaNQLPF2A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OrrAxq2LdnzF2SHuJginVtYq7DXdCMiR6WX3oHhRnNB1nK01oMCUaRU4XpaZaxu/Z0Mj8qqqyudEH2GUton6EQNSPp8hkEnS157mthDuv6ufoTCdmJSvVlgl18qfYIobf7paZOWu0PRcmI2y/H9BD3kW+TmUbr7witD2+KeAg6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BzbsX36m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 522Nv8Vo021685;
	Mon, 3 Mar 2025 03:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kuBJB7XxvG4MqTPTWAvI7cMjrzfrgqemSm2LA+axgaM=; b=BzbsX36mZVqJ3V3u
	27C4F8Y+lmFWDxDLj0N12R2jbfw0V1ru4HbSe3QjHWhhAycw/vIKBvCxQmrLN3gR
	19ES/h3WRymCb3M2k5AWDTTz5ozBsmGydXFKnb523I0PWdSnQ2cs8+Xe63Hgtob6
	5gNhnPKDJ4q3pAHnX+8X56ixy6UleUP6u3Z8rKH/O/STdXWWIakN27AJ7HxNohKl
	P9iGnUlDyr3+ZYKwkN9aZ4Jkhk1/Zb4O3LtwjheFuRlnYu+lzHQEr16QGWhN6m6U
	AbT05mmZ1/qNGGds1R5c/kT3ahDN9CYnwV02iVNVBKfcuqx3o5pf5wBwNbdlwmMi
	1sDomQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t993cfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 03:30:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5233Un4M032540
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Mar 2025 03:30:49 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 2 Mar 2025 19:30:43 -0800
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
        Konrad Dybcio <konradybcio@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v15 09/10] Coresight: Add Coresight TMC Control Unit driver
Date: Mon, 3 Mar 2025 11:29:30 +0800
Message-ID: <20250303032931.2500935-10-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 1XoISDcMXbNyipkQ4qCXo4WT0HoWUBZU
X-Proofpoint-GUID: 1XoISDcMXbNyipkQ4qCXo4WT0HoWUBZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_01,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030024

The Coresight TMC Control Unit hosts miscellaneous configuration registers
which control various features related to TMC ETR sink.

Based on the trace ID, which is programmed in the related CTCU ATID
register of a specific ETR, trace data with that trace ID gets into
the ETR buffer, while other trace data gets dropped.

Enabling source device sets one bit of the ATID register based on
source device's trace ID.
Disabling source device resets the bit according to the source
device's trace ID.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/Kconfig           |  12 +
 drivers/hwtracing/coresight/Makefile          |   2 +
 .../hwtracing/coresight/coresight-ctcu-core.c | 326 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu.h  |  39 +++
 include/linux/coresight.h                     |   3 +-
 5 files changed, 381 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-core.c
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 06f0a7594169..ecd7086a5b83 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -133,6 +133,18 @@ config CORESIGHT_STM
 	  To compile this driver as a module, choose M here: the
 	  module will be called coresight-stm.
 
+config CORESIGHT_CTCU
+	tristate "CoreSight TMC Control Unit driver"
+	depends on CORESIGHT_LINK_AND_SINK_TMC
+	help
+	  This driver provides support for CoreSight TMC Control Unit
+	  that hosts miscellaneous configuration registers. This is
+	  primarily used for controlling the behaviors of the TMC
+	  ETR device.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called coresight-ctcu.
+
 config CORESIGHT_CPU_DEBUG
 	tristate "CoreSight CPU Debug driver"
 	depends on ARM || ARM64
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 46ce7f39d05f..8e62c3150aeb 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -51,3 +51,5 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 		   coresight-cti-sysfs.o
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
+obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
+coresight-ctcu-y := coresight-ctcu-core.o
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
new file mode 100644
index 000000000000..da35d8b4d579
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -0,0 +1,326 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
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
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+#include "coresight-ctcu.h"
+#include "coresight-priv.h"
+
+DEFINE_CORESIGHT_DEVLIST(ctcu_devs, "ctcu");
+
+#define ctcu_writel(drvdata, val, offset)	__raw_writel((val), drvdata->base + offset)
+#define ctcu_readl(drvdata, offset)		__raw_readl(drvdata->base + offset)
+
+/*
+ * The TMC Coresight Control Unit utilizes four ATID registers to control the data
+ * filter function based on the trace ID for each TMC ETR sink. The length of each
+ * ATID register is 32 bits. Therefore, an ETR device has a 128-bit long field
+ * in CTCU. Each trace ID is represented by one bit in that filed.
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
+ */
+#define CTCU_ATID_REG_OFFSET(traceid, atid_offset) \
+		((traceid / 32) * 4 + atid_offset)
+
+#define CTCU_ATID_REG_BIT(traceid)	(traceid % 32)
+#define CTCU_ATID_REG_SIZE		0x10
+#define CTCU_ETR0_ATID0			0xf8
+#define CTCU_ETR1_ATID0			0x108
+
+static const struct ctcu_etr_config sa8775p_etr_cfgs[] = {
+	{
+		.atid_offset	= CTCU_ETR0_ATID0,
+		.port_num	= 0,
+	},
+	{
+		.atid_offset	= CTCU_ETR1_ATID0,
+		.port_num	= 1,
+	},
+};
+
+static const struct ctcu_config sa8775p_cfgs = {
+	.etr_cfgs	= sa8775p_etr_cfgs,
+	.num_etr_config	= ARRAY_SIZE(sa8775p_etr_cfgs),
+};
+
+static void ctcu_program_atid_register(struct ctcu_drvdata *drvdata, u32 reg_offset,
+				       u8 bit, bool enable)
+{
+	u32 val;
+
+	CS_UNLOCK(drvdata->base);
+	val = ctcu_readl(drvdata, reg_offset);
+	if (enable)
+		val |= BIT(bit);
+	else
+		val &= ~BIT(bit);
+
+	ctcu_writel(drvdata, val, reg_offset);
+	CS_LOCK(drvdata->base);
+}
+
+/*
+ * __ctcu_set_etr_traceid: Set bit in the ATID register based on trace ID when enable is true.
+ * Reset the bit of the ATID register based on trace ID when enable is false.
+ *
+ * @csdev:	coresight_device of CTCU.
+ * @traceid:	trace ID of the source tracer.
+ * @port_num:	port number connected to TMC ETR sink.
+ * @enable:	True for set bit and false for reset bit.
+ *
+ * Returns 0 indicates success. Non-zero result means failure.
+ */
+static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, int port_num,
+				  bool enable)
+{
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	u32 atid_offset, reg_offset;
+	u8 refcnt, bit;
+
+	atid_offset = drvdata->atid_offset[port_num];
+	if (atid_offset == 0)
+		return -EINVAL;
+
+	bit = CTCU_ATID_REG_BIT(traceid);
+	reg_offset = CTCU_ATID_REG_OFFSET(traceid, atid_offset);
+	if (reg_offset - atid_offset > CTCU_ATID_REG_SIZE)
+		return -EINVAL;
+
+	guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
+	refcnt = drvdata->traceid_refcnt[port_num][traceid];
+	/* Only program the atid register when the refcnt value is 1 or 0 */
+	if ((enable && !refcnt++) || (!enable && !--refcnt))
+		ctcu_program_atid_register(drvdata, reg_offset, bit, enable);
+
+	drvdata->traceid_refcnt[port_num][traceid] = refcnt;
+
+	return 0;
+}
+
+/*
+ * Searching the sink device from helper's view in case there are multiple helper devices
+ * connected to the sink device.
+ */
+static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
+{
+	struct coresight_platform_data *pdata = helper->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (pdata->in_conns[i]->src_dev == sink)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+
+static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
+				bool enable)
+{
+	struct coresight_device *sink = coresight_get_sink(path);
+	u8 traceid = path->trace_id;
+	int port_num;
+
+	if ((sink == NULL) || !IS_VALID_CS_TRACE_ID(traceid)) {
+		dev_err(&csdev->dev, "Invalid sink device or trace ID\n");
+		return -EINVAL;
+	}
+
+	port_num = ctcu_get_active_port(sink, csdev);
+	if (port_num < 0)
+		return -EINVAL;
+
+	dev_dbg(&csdev->dev, "traceid is %d\n", traceid);
+
+	return __ctcu_set_etr_traceid(csdev, traceid, port_num, enable);
+}
+
+static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode, void *data)
+{
+	struct coresight_path *path = (struct coresight_path *)data;
+
+	return ctcu_set_etr_traceid(csdev, path, true);
+}
+
+static int ctcu_disable(struct coresight_device *csdev, void *data)
+{
+	struct coresight_path *path = (struct coresight_path *)data;
+
+	return ctcu_set_etr_traceid(csdev, path, false);
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
+	const struct ctcu_etr_config *etr_cfg;
+	struct coresight_platform_data *pdata;
+	struct coresight_desc desc = { 0 };
+	struct device *dev = &pdev->dev;
+	const struct ctcu_config *cfgs;
+	struct ctcu_drvdata *drvdata;
+	void __iomem *base;
+	int i;
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
+		if (cfgs->num_etr_config <= ETR_MAX_NUM) {
+			for (i = 0; i < cfgs->num_etr_config; i++) {
+				etr_cfg = &cfgs->etr_cfgs[i];
+				drvdata->atid_offset[i] = etr_cfg->atid_offset;
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
+	desc.access = CSDEV_ACCESS_IOMEM(base);
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
+}
+
+static int ctcu_platform_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = ctcu_probe(pdev);
+	pm_runtime_put(&pdev->dev);
+	if (ret)
+		pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static void ctcu_platform_remove(struct platform_device *pdev)
+{
+	struct ctcu_drvdata *drvdata = platform_get_drvdata(pdev);
+
+	if (WARN_ON(!drvdata))
+		return;
+
+	ctcu_remove(pdev);
+	pm_runtime_disable(&pdev->dev);
+	if (!IS_ERR_OR_NULL(drvdata->apb_clk))
+		clk_put(drvdata->apb_clk);
+}
+
+#ifdef CONFIG_PM
+static int ctcu_runtime_suspend(struct device *dev)
+{
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev);
+
+	if (drvdata && !IS_ERR_OR_NULL(drvdata->apb_clk))
+		clk_disable_unprepare(drvdata->apb_clk);
+
+	return 0;
+}
+
+static int ctcu_runtime_resume(struct device *dev)
+{
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev);
+
+	if (drvdata && !IS_ERR_OR_NULL(drvdata->apb_clk))
+		clk_prepare_enable(drvdata->apb_clk);
+
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops ctcu_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(ctcu_runtime_suspend, ctcu_runtime_resume, NULL)
+};
+
+static const struct of_device_id ctcu_match[] = {
+	{.compatible = "qcom,sa8775p-ctcu", .data = &sa8775p_cfgs},
+	{}
+};
+
+static struct platform_driver ctcu_driver = {
+	.probe          = ctcu_platform_probe,
+	.remove         = ctcu_platform_remove,
+	.driver         = {
+		.name   = "coresight-ctcu",
+		.of_match_table = ctcu_match,
+		.pm	= &ctcu_dev_pm_ops,
+		.suppress_bind_attrs = true,
+	},
+};
+module_platform_driver(ctcu_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("CoreSight TMC Control Unit driver");
diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
new file mode 100644
index 000000000000..11201e8266ff
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-ctcu.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _CORESIGHT_CTCU_H
+#define _CORESIGHT_CTCU_H
+#include "coresight-trace-id.h"
+
+/* Maximum number of supported ETR devices for a single CTCU. */
+#define ETR_MAX_NUM 	2
+
+/**
+ * struct ctcu_etr_config
+ * @atid_offset:	offset to the ATID0 Register.
+ * @port_num:		in-port number of CTCU device that connected to ETR.
+ */
+struct ctcu_etr_config {
+	const u32 atid_offset;
+	const u32 port_num;
+};
+
+struct ctcu_config {
+	const struct ctcu_etr_config *etr_cfgs;
+	int num_etr_config;
+};
+
+struct ctcu_drvdata {
+	void __iomem		*base;
+	struct clk		*apb_clk;
+	struct device		*dev;
+	struct coresight_device	*csdev;
+	raw_spinlock_t		spin_lock;
+	u32			atid_offset[ETR_MAX_NUM];
+	/* refcnt for each traceid of each sink */
+	u8			traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
+};
+
+#endif
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index c7b17672df50..78b670d71e98 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -71,7 +71,8 @@ enum coresight_dev_subtype_source {
 
 enum coresight_dev_subtype_helper {
 	CORESIGHT_DEV_SUBTYPE_HELPER_CATU,
-	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI
+	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI,
+	CORESIGHT_DEV_SUBTYPE_HELPER_CTCU,
 };
 
 /**
-- 
2.34.1


