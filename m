Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6B96282F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 15:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236288AbiKNOmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 09:42:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236951AbiKNOl1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 09:41:27 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14B62CC83;
        Mon, 14 Nov 2022 06:41:26 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AEEJBnx013867;
        Mon, 14 Nov 2022 14:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=pnlQmzf4m5QwteeGEsTVi9r1flh6hwfRusNWgpXzmNQ=;
 b=Pe9RYcuXV8SAlu9FhvKP+iL/7hj21WGbtQn4Djgi1IcSLrwtnLYpWTpVV74fBM3oowOU
 hXGa+e2aEpEP0pTjXq4mP5J1llWkGKfY4oJ8A1xmSi2vCP/ToE5YjsDuUc+67Rzwt5Bv
 h350nInCO0L6a01x829GsilXPZzI9gnv1qwllKyHJslzQO01dGdFuFOqaLWhdFywZDbw
 bZaA0KPHu10i5VCIyRgDho/mLi2FI9gI+5ZhdwXYDoVddnFhoDGyqH+aKXtutUy5BJRX
 +A2IYKG6h8fpWxFOnw0JLuo7srbVP6YgYVY3xG8z31I3bJPgQptxsacWx91DCoC05Kyk rw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kug3hh88u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 14 Nov 2022 14:41:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AEEfGv8006772
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 14 Nov 2022 14:41:16 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 14 Nov 2022 06:41:12 -0800
From:   Mao Jinlong <quic_jinlmao@quicinc.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>
CC:     Mao Jinlong <quic_jinlmao@quicinc.com>,
        Leo Yan <leo.yan@linaro.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Hao Zhang <quic_hazha@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v15 6/8] Coresight: Add TPDA link driver
Date:   Mon, 14 Nov 2022 22:40:25 +0800
Message-ID: <20221114144027.14365-7-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221114144027.14365-1-quic_jinlmao@quicinc.com>
References: <20221114144027.14365-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: S5GUhy34OWILixsfhr6zaajFGll38o9A
X-Proofpoint-ORIG-GUID: S5GUhy34OWILixsfhr6zaajFGll38o9A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_12,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211140104
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

TPDA(Trace, Profiling and Diagnostics Aggregator) is
to provide packetization, funneling and timestamping of
TPDM data. Multiple monitors are connected to different
input ports of TPDA.This change is to add tpda
enable/disable/probe functions for coresight tpda driver.

 - - - -         - - - -        - - - -
| TPDM 0|      | TPDM 1 |     | TPDM 2|
 - - - -         - - - -        - - - -
    |               |             |
    |_ _ _ _ _ _    |     _ _ _ _ |
                |   |    |
                |   |    |
           ------------------
          |        TPDA      |
           ------------------

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 drivers/hwtracing/coresight/Kconfig          |  11 +
 drivers/hwtracing/coresight/Makefile         |   1 +
 drivers/hwtracing/coresight/coresight-tpda.c | 211 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h |  35 +++
 4 files changed, 258 insertions(+)
 create mode 100644 drivers/hwtracing/coresight/coresight-tpda.c
 create mode 100644 drivers/hwtracing/coresight/coresight-tpda.h

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 82811db1a5cf..f580f1a94f96 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -205,6 +205,7 @@ config CORESIGHT_TRBE
 config CORESIGHT_TPDM
 	tristate "CoreSight Trace, Profiling & Diagnostics Monitor driver"
 	select CORESIGHT_LINKS_AND_SINKS
+	select CORESIGHT_TPDA
 	help
 	  This driver provides support for configuring monitor. Monitors are
 	  primarily responsible for data set collection and support the
@@ -213,4 +214,14 @@ config CORESIGHT_TPDM
 	  To compile this driver as a module, choose M here: the module will be
 	  called coresight-tpdm.
 
+config CORESIGHT_TPDA
+	tristate "CoreSight Trace, Profiling & Diagnostics Aggregator driver"
+	help
+	  This driver provides support for configuring aggregator. This is
+	  primarily useful for pulling the data sets from one or more
+	  attached monitors and pushing the resultant data out. Multiple
+	  monitors are connected on different input ports of TPDA.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called coresight-tpda.
 endif
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 6bb9b1746bc7..1712d82e7260 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -26,5 +26,6 @@ obj-$(CONFIG_CORESIGHT_CATU) += coresight-catu.o
 obj-$(CONFIG_CORESIGHT_CTI) += coresight-cti.o
 obj-$(CONFIG_CORESIGHT_TRBE) += coresight-trbe.o
 obj-$(CONFIG_CORESIGHT_TPDM) += coresight-tpdm.o
+obj-$(CONFIG_CORESIGHT_TPDA) += coresight-tpda.o
 coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 		   coresight-cti-sysfs.o
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
new file mode 100644
index 000000000000..7e4c28733419
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/amba/bus.h>
+#include <linux/bitfield.h>
+#include <linux/coresight.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/fs.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include "coresight-priv.h"
+#include "coresight-tpda.h"
+#include "coresight-trace-id.h"
+
+DEFINE_CORESIGHT_DEVLIST(tpda_devs, "tpda");
+
+/* Settings pre enabling port control register */
+static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
+{
+	u32 val;
+
+	val = readl_relaxed(drvdata->base + TPDA_CR);
+	val &= ~TPDA_CR_ATID;
+	val |= FIELD_PREP(TPDA_CR_ATID, drvdata->atid);
+	writel_relaxed(val, drvdata->base + TPDA_CR);
+}
+
+static void tpda_enable_port(struct tpda_drvdata *drvdata, int port)
+{
+	u32 val;
+
+	val = readl_relaxed(drvdata->base + TPDA_Pn_CR(port));
+	/* Enable the port */
+	val |= TPDA_Pn_CR_ENA;
+	writel_relaxed(val, drvdata->base + TPDA_Pn_CR(port));
+}
+
+static void __tpda_enable(struct tpda_drvdata *drvdata, int port)
+{
+	CS_UNLOCK(drvdata->base);
+
+	if (!drvdata->csdev->enable)
+		tpda_enable_pre_port(drvdata);
+
+	tpda_enable_port(drvdata, port);
+
+	CS_LOCK(drvdata->base);
+}
+
+static int tpda_enable(struct coresight_device *csdev, int inport, int outport)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	spin_lock(&drvdata->spinlock);
+	if (atomic_read(&csdev->refcnt[inport]) == 0)
+		__tpda_enable(drvdata, inport);
+
+	atomic_inc(&csdev->refcnt[inport]);
+	spin_unlock(&drvdata->spinlock);
+
+	dev_dbg(drvdata->dev, "TPDA inport %d enabled.\n", inport);
+	return 0;
+}
+
+static void __tpda_disable(struct tpda_drvdata *drvdata, int port)
+{
+	u32 val;
+
+	CS_UNLOCK(drvdata->base);
+
+	val = readl_relaxed(drvdata->base + TPDA_Pn_CR(port));
+	val &= ~TPDA_Pn_CR_ENA;
+	writel_relaxed(val, drvdata->base + TPDA_Pn_CR(port));
+
+	CS_LOCK(drvdata->base);
+}
+
+static void tpda_disable(struct coresight_device *csdev, int inport,
+			   int outport)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	spin_lock(&drvdata->spinlock);
+	if (atomic_dec_return(&csdev->refcnt[inport]) == 0)
+		__tpda_disable(drvdata, inport);
+
+	spin_unlock(&drvdata->spinlock);
+
+	dev_dbg(drvdata->dev, "TPDA inport %d disabled\n", inport);
+}
+
+static const struct coresight_ops_link tpda_link_ops = {
+	.enable		= tpda_enable,
+	.disable	= tpda_disable,
+};
+
+static const struct coresight_ops tpda_cs_ops = {
+	.link_ops	= &tpda_link_ops,
+};
+
+static int tpda_init_default_data(struct tpda_drvdata *drvdata)
+{
+	int atid;
+	/*
+	 * TPDA must has a unique atid. This atid can uniquely
+	 * identify the TPDM trace source connected to the TPDA.
+	 * The TPDMs which are connected to same TPDA share the
+	 * same trace-id. When TPDA does packetization, different
+	 * port will have unique channel number for decoding.
+	 */
+	atid = coresight_trace_id_get_system_id();
+	if (atid < 0)
+		return atid;
+
+	drvdata->atid = atid;
+	return 0;
+}
+
+static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	int ret;
+	struct device *dev = &adev->dev;
+	struct coresight_platform_data *pdata;
+	struct tpda_drvdata *drvdata;
+	struct coresight_desc desc = { 0 };
+	void __iomem *base;
+
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+	adev->dev.platform_data = pdata;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->dev = &adev->dev;
+	dev_set_drvdata(dev, drvdata);
+
+	base = devm_ioremap_resource(dev, &adev->res);
+	if (!base)
+		return -ENOMEM;
+	drvdata->base = base;
+
+	spin_lock_init(&drvdata->spinlock);
+
+	ret = tpda_init_default_data(drvdata);
+	if (ret)
+		return ret;
+
+	desc.name = coresight_alloc_device_name(&tpda_devs, dev);
+	if (!desc.name)
+		return -ENOMEM;
+	desc.type = CORESIGHT_DEV_TYPE_LINK;
+	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
+	desc.ops = &tpda_cs_ops;
+	desc.pdata = adev->dev.platform_data;
+	desc.dev = &adev->dev;
+	desc.access = CSDEV_ACCESS_IOMEM(base);
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev))
+		return PTR_ERR(drvdata->csdev);
+
+	pm_runtime_put(&adev->dev);
+
+	dev_dbg(drvdata->dev, "TPDA initialized\n");
+	return 0;
+}
+
+static void __exit tpda_remove(struct amba_device *adev)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(&adev->dev);
+
+	coresight_trace_id_put_system_id(drvdata->atid);
+	coresight_unregister(drvdata->csdev);
+}
+
+/*
+ * Different TPDA has different periph id.
+ * The difference is 0-7 bits' value. So ignore 0-7 bits.
+ */
+static struct amba_id tpda_ids[] = {
+	{
+		.id     = 0x000f0f00,
+		.mask   = 0x000fff00,
+	},
+	{ 0, 0},
+};
+
+static struct amba_driver tpda_driver = {
+	.drv = {
+		.name   = "coresight-tpda",
+		.owner	= THIS_MODULE,
+		.suppress_bind_attrs = true,
+	},
+	.probe          = tpda_probe,
+	.remove		= tpda_remove,
+	.id_table	= tpda_ids,
+};
+
+module_amba_driver(tpda_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Trace, Profiling & Diagnostic Aggregator driver");
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
new file mode 100644
index 000000000000..4beb33263c96
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _CORESIGHT_CORESIGHT_TPDA_H
+#define _CORESIGHT_CORESIGHT_TPDA_H
+
+#define TPDA_CR			(0x000)
+#define TPDA_Pn_CR(n)		(0x004 + (n * 4))
+/* Aggregator port enable bit */
+#define TPDA_Pn_CR_ENA		BIT(0)
+
+#define TPDA_MAX_INPORTS	32
+
+/* Bits 6 ~ 12 is for atid value */
+#define TPDA_CR_ATID		GENMASK(12, 6)
+
+/**
+ * struct tpda_drvdata - specifics associated to an TPDA component
+ * @base:       memory mapped base address for this component.
+ * @dev:        The device entity associated to this component.
+ * @csdev:      component vitals needed by the framework.
+ * @spinlock:   lock for the drvdata value.
+ * @enable:     enable status of the component.
+ */
+struct tpda_drvdata {
+	void __iomem		*base;
+	struct device		*dev;
+	struct coresight_device	*csdev;
+	spinlock_t		spinlock;
+	u8			atid;
+};
+
+#endif  /* _CORESIGHT_CORESIGHT_TPDA_H */
-- 
2.17.1

