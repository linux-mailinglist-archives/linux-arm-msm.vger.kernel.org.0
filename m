Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6A6746E9BD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 15:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238416AbhLIOUJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 09:20:09 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:35093 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232469AbhLIOUJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 09:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1639059396; x=1670595396;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=unlVFsoSQVSZPikNssDXIU2j8djbo7gwDJPyYQ16bYU=;
  b=q0DBTpM72YGRmhKJMVjP8gXixENqEN+Y6M3EkzdXx+ecYb/hWZZLQm/7
   7OprH7XGvYc/YMqwdmMX3SFqjQXRPZh+2JFE90mJM8aU64HkWAF02h511
   LRh2P5mrppt8+xicDNIcelMJmnYuijkdKcfKXd5NAr4sQzGLOieDu9v1k
   Q=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 09 Dec 2021 06:16:35 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2021 06:16:35 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 9 Dec 2021 06:16:34 -0800
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 9 Dec 2021 06:16:31 -0800
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
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2 2/9] Coresight: Add coresight TPDM source driver
Date:   Thu, 9 Dec 2021 22:15:36 +0800
Message-ID: <20211209141543.21314-3-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211209141543.21314-1-quic_jinlmao@quicinc.com>
References: <20211209141543.21314-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
 MAINTAINERS                                  |   8 +
 drivers/hwtracing/coresight/Kconfig          |  13 ++
 drivers/hwtracing/coresight/Makefile         |   1 +
 drivers/hwtracing/coresight/coresight-core.c |   3 +-
 drivers/hwtracing/coresight/coresight-tpdm.c | 152 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpdm.h |  31 ++++
 include/linux/coresight.h                    |   1 +
 7 files changed, 208 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-tpdm.c
 create mode 100644 drivers/hwtracing/coresight/coresight-tpdm.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a2345ce8521..59f39b3194f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15560,6 +15560,14 @@ L:	netdev@vger.kernel.org
 S:	Supported
 F:	drivers/net/ipa/
 
+QCOM CORESIGHT COMPONENTS DRIVER
+M:	Tao Zhang <quic_taozha@quicinc.com>
+M:	Jinlong Mao <quic_jinlmao@quicinc.com>
+M:	Mathieu Poirier <mathieu.poirier@linaro.org>
+M:	Suzuki K Poulose <suzuki.poulose@arm.com>
+S:	Maintained
+F:	drivers/hwtracing/coresight/coresight-tpdm.c
+
 QEMU MACHINE EMULATOR AND VIRTUALIZER SUPPORT
 M:	Gabriel Somlo <somlo@cmu.edu>
 M:	"Michael S. Tsirkin" <mst@redhat.com>
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
index cc6b6cabf85f..a7f1a6f09cfb 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1071,7 +1071,8 @@ static int coresight_validate_source(struct coresight_device *csdev,
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
index 000000000000..f494cef4fb24
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/amba/bus.h>
+#include <linux/bitmap.h>
+#include <linux/coresight.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/fs.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include "coresight-priv.h"
+#include "coresight-tpdm.h"
+
+DEFINE_CORESIGHT_DEVLIST(tpdm_devs, "tpdm");
+
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
+	static int traceid = TPDM_TRACE_ID_START;
+
+	drvdata->traceid = traceid++;
+}
+
+static int tpdm_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct coresight_platform_data *pdata;
+	struct tpdm_drvdata *drvdata;
+	struct coresight_desc desc = { 0 };
+
+	desc.name = coresight_alloc_device_name(&tpdm_devs, dev);
+	if (!desc.name)
+		return -ENOMEM;
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+	adev->dev.platform_data = pdata;
+
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
+
+	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
+	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_SYS;
+	desc.ops = &tpdm_cs_ops;
+	desc.pdata = adev->dev.platform_data;
+	desc.dev = &adev->dev;
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev))
+		return PTR_ERR(drvdata->csdev);
+
+	tpdm_init_default_data(drvdata);
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
index 000000000000..980ae90ff1c8
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _CORESIGHT_CORESIGHT_TPDM_H
+#define _CORESIGHT_CORESIGHT_TPDM_H
+
+/* Default value of the traceid */
+#define TPDM_TRACE_ID_START 128
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

