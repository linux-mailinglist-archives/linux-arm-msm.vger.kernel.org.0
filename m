Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B694AF062
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 12:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbiBIL6F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 06:58:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbiBIL5j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 06:57:39 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D7A4E00FA78;
        Wed,  9 Feb 2022 02:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644404262; x=1675940262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=MWgXX7Z9WKbKYF4Y7jSG/Cbt0vE0gIe+I/RckD3M2SA=;
  b=mvriYGXgBQfJMPi/tZto1ApQMZasc0iWVe2DUlzAWZgVA9s7ZWUsIDYT
   fSq9+BGHA2CadLfzJdJo9n5suWwL843k+5XY7w/GkOkFPTWXZJsZEPKY0
   7AF7zs1HqKzWGnltXO16lat333zhB3lB33tCsg0gJG0joP4V9y7oRVrKd
   Y=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Feb 2022 02:57:42 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 02:57:41 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 9 Feb 2022 02:57:41 -0800
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 9 Feb 2022 02:57:37 -0800
From:   Mao Jinlong <quic_jinlmao@quicinc.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC:     Mao Jinlong <quic_jinlmao@quicinc.com>,
        Mike Leach <mike.leach@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Hao Zhang <quic_hazha@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v3 03/10] Coresight: Add coresight TPDM source driver
Date:   Wed, 9 Feb 2022 18:56:59 +0800
Message-ID: <20220209105706.18852-4-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220209105706.18852-1-quic_jinlmao@quicinc.com>
References: <20220209105706.18852-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add driver to support Coresight device TPDM (Trace, Profiling and
Diagnostics Monitor). TPDM is a monitor to collect data from
different datasets. This change is to add probe/enable/disable
functions for tpdm source.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 drivers/hwtracing/coresight/Kconfig          |  13 ++
 drivers/hwtracing/coresight/Makefile         |   1 +
 drivers/hwtracing/coresight/coresight-core.c |   3 +-
 drivers/hwtracing/coresight/coresight-tpdm.c | 159 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpdm.h |  28 ++++
 include/linux/coresight.h                    |   1 +
 6 files changed, 204 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-tpdm.c
 create mode 100644 drivers/hwtracing/coresight/coresight-tpdm.h

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 514a9b8086e3..5c506a1cd08f 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -201,4 +201,17 @@ config CORESIGHT_TRBE
 
 	  To compile this driver as a module, choose M here: the module will be
 	  called coresight-trbe.
+
+config CORESIGHT_TPDM
+	tristate "CoreSight Trace, Profiling & Diagnostics Monitor driver"
+	select CORESIGHT_LINKS_AND_SINKS
+	help
+	  This driver provides support for configuring monitor. Monitors are
+	  primarily responsible for data set collection and support the
+	  ability to collect any permutation of data set types. Monitors are
+	  also responsible for interaction with system cross triggering.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called coresight-tpdm.
+
 endif
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index b6c4a48140ec..e7392a0dddeb 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -25,5 +25,6 @@ obj-$(CONFIG_CORESIGHT_CPU_DEBUG) += coresight-cpu-debug.o
 obj-$(CONFIG_CORESIGHT_CATU) += coresight-catu.o
 obj-$(CONFIG_CORESIGHT_CTI) += coresight-cti.o
 obj-$(CONFIG_CORESIGHT_TRBE) += coresight-trbe.o
+obj-$(CONFIG_CORESIGHT_TPDM) += coresight-tpdm.o
 coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 		   coresight-cti-sysfs.o
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6cb55c3f41d5..b56826d9a2b3 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1117,7 +1117,8 @@ static int coresight_validate_source(struct coresight_device *csdev,
 	}
 
 	if (subtype != CORESIGHT_DEV_SUBTYPE_SOURCE_PROC &&
-	    subtype != CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE) {
+	    subtype != CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE &&
+	    subtype != CORESIGHT_DEV_SUBTYPE_SOURCE_SYS) {
 		dev_err(&csdev->dev, "wrong device subtype in %s\n", function);
 		return -EINVAL;
 	}
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
new file mode 100644
index 000000000000..51b8b17e6a80
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/amba/bus.h>
+#include <linux/bitmap.h>
+#include <linux/coresight.h>
+#include <linux/coresight-pmu.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/fs.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#include "coresight-priv.h"
+#include "coresight-tpdm.h"
+
+DEFINE_CORESIGHT_DEVLIST(tpdm_devs, "tpdm");
+
+/* TPDM enable operations */
+static int tpdm_enable(struct coresight_device *csdev,
+		       struct perf_event *event, u32 mode)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	mutex_lock(&drvdata->lock);
+	if (drvdata->enable) {
+		mutex_unlock(&drvdata->lock);
+		return -EBUSY;
+	}
+
+	drvdata->enable = true;
+	mutex_unlock(&drvdata->lock);
+
+	dev_info(drvdata->dev, "TPDM tracing enabled\n");
+	return 0;
+}
+
+/* TPDM disable operations */
+static void tpdm_disable(struct coresight_device *csdev,
+			 struct perf_event *event)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	mutex_lock(&drvdata->lock);
+	if (!drvdata->enable) {
+		mutex_unlock(&drvdata->lock);
+		return;
+	}
+
+	drvdata->enable = false;
+	mutex_unlock(&drvdata->lock);
+
+	dev_info(drvdata->dev, "TPDM tracing disabled\n");
+}
+
+static int tpdm_trace_id(struct coresight_device *csdev)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	return drvdata->traceid;
+}
+
+static const struct coresight_ops_source tpdm_source_ops = {
+	.trace_id	= tpdm_trace_id,
+	.enable		= tpdm_enable,
+	.disable	= tpdm_disable,
+};
+
+static const struct coresight_ops tpdm_cs_ops = {
+	.source_ops	= &tpdm_source_ops,
+};
+
+static void tpdm_init_default_data(struct tpdm_drvdata *drvdata)
+{
+	drvdata->traceid = coresight_get_system_trace_id();
+}
+
+static int tpdm_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct coresight_platform_data *pdata;
+	struct tpdm_drvdata *drvdata;
+	struct coresight_desc desc = { 0 };
+
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+	adev->dev.platform_data = pdata;
+
+	/* driver data*/
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+	drvdata->dev = &adev->dev;
+	dev_set_drvdata(dev, drvdata);
+
+	drvdata->base = devm_ioremap_resource(dev, &adev->res);
+	if (!drvdata->base)
+		return -ENOMEM;
+
+	mutex_init(&drvdata->lock);
+	tpdm_init_default_data(drvdata);
+
+	/* Set up coresight component description */
+	desc.name = coresight_alloc_device_name(&tpdm_devs, dev);
+	if (!desc.name)
+		return -ENOMEM;
+	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
+	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_SYS;
+	desc.ops = &tpdm_cs_ops;
+	desc.pdata = adev->dev.platform_data;
+	desc.dev = &adev->dev;
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev))
+		return PTR_ERR(drvdata->csdev);
+
+	/* Decrease pm refcount when probe is done.*/
+	pm_runtime_put(&adev->dev);
+
+	return 0;
+}
+
+static void __exit tpdm_remove(struct amba_device *adev)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(&adev->dev);
+
+	coresight_unregister(drvdata->csdev);
+}
+
+/*
+ * Different TPDM has different periph id.
+ * The difference is 0-7 bits' value. So ignore 0-7 bits.
+ */
+static struct amba_id tpdm_ids[] = {
+	{
+		.id = 0x000f0e00,
+		.mask = 0x000fff00,
+	},
+	{ 0, 0},
+};
+
+static struct amba_driver tpdm_driver = {
+	.drv = {
+		.name   = "coresight-tpdm",
+		.owner	= THIS_MODULE,
+		.suppress_bind_attrs = true,
+	},
+	.probe          = tpdm_probe,
+	.id_table	= tpdm_ids,
+};
+
+module_amba_driver(tpdm_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Trace, Profiling & Diagnostic Monitor driver");
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
new file mode 100644
index 000000000000..2effbabf349b
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _CORESIGHT_CORESIGHT_TPDM_H
+#define _CORESIGHT_CORESIGHT_TPDM_H
+
+/**
+ * struct tpdm_drvdata - specifics associated to an TPDM component
+ * @base:       memory mapped base address for this component.
+ * @dev:        The device entity associated to this component.
+ * @csdev:      component vitals needed by the framework.
+ * @lock:       lock for the enable value.
+ * @enable:     enable status of the component.
+ * @traceid:    value of the current ID for this component.
+ */
+
+struct tpdm_drvdata {
+	void __iomem		*base;
+	struct device		*dev;
+	struct coresight_device	*csdev;
+	struct mutex		lock;
+	bool			enable;
+	int			traceid;
+};
+
+#endif  /* _CORESIGHT_CORESIGHT_TPDM_H */
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 93a2922b7653..e48d463be63b 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -65,6 +65,7 @@ enum coresight_dev_subtype_source {
 	CORESIGHT_DEV_SUBTYPE_SOURCE_PROC,
 	CORESIGHT_DEV_SUBTYPE_SOURCE_BUS,
 	CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE,
+	CORESIGHT_DEV_SUBTYPE_SOURCE_SYS,
 };
 
 enum coresight_dev_subtype_helper {
-- 
2.17.1

