Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A46CB5437E5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 17:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244818AbiFHPrx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 11:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244739AbiFHPrw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 11:47:52 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141633D1D1;
        Wed,  8 Jun 2022 08:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654703265; x=1686239265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=t9qYbf+TMB5v7JyqckM9jJ4Yq+ny7tXEXhdFLtRSSnQ=;
  b=Bdc10RoPZ79N3Ixpq+O15/NysrvwSEejdBLD02n6nOKEyqHl1xU4rjUH
   Rl82zd4YCXNLeNaEUNxa3arBlYU56H49BkQ1i35iC24PBoNHX1MWE9EwP
   4HUmkKyFfx/Tek9QOcfMqbTQScGytqZLXvITJvPow2N9wzpHZ24McwTX8
   A=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Jun 2022 08:47:44 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2022 08:47:43 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 8 Jun 2022 08:47:43 -0700
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 8 Jun 2022 08:47:39 -0700
From:   Mao Jinlong <quic_jinlmao@quicinc.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>
CC:     Mao Jinlong <quic_jinlmao@quicinc.com>,
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
        <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v8 02/10] Coresight: Add coresight TPDM source driver
Date:   Wed, 8 Jun 2022 23:46:57 +0800
Message-ID: <20220608154705.40322-3-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220608154705.40322-1-quic_jinlmao@quicinc.com>
References: <20220608154705.40322-1-quic_jinlmao@quicinc.com>
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
 drivers/hwtracing/coresight/Kconfig          |  12 ++
 drivers/hwtracing/coresight/Makefile         |   1 +
 drivers/hwtracing/coresight/coresight-core.c |   5 +-
 drivers/hwtracing/coresight/coresight-tpdm.c | 149 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpdm.h |  26 ++++
 include/linux/coresight.h                    |   1 +
 6 files changed, 193 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-tpdm.c
 create mode 100644 drivers/hwtracing/coresight/coresight-tpdm.h

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 514a9b8086e3..b2b72a35e416 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -201,4 +201,16 @@ config CORESIGHT_TRBE
 
 	  To compile this driver as a module, choose M here: the module will be
 	  called coresight-trbe.
+
+config CORESIGHT_TPDM
+	tristate "CoreSight Trace, Profiling & Diagnostics Monitor driver"
+	select CORESIGHT_LINKS_AND_SINKS
+	help
+	  This driver provides support for configuring monitor. Monitors are
+	  primarily responsible for data set collection and support the
+	  ability to collect any permutation of data set types.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called coresight-tpdm.
+
 endif
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 329a0c704b87..6bb9b1746bc7 100644
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
index 23ab16dd9b5d..1d2b5b84bb5d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1047,7 +1047,8 @@ static int coresight_validate_source(struct coresight_device *csdev,
 	}
 
 	if (subtype != CORESIGHT_DEV_SUBTYPE_SOURCE_PROC &&
-	    subtype != CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE) {
+	    subtype != CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE &&
+	    subtype != CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS) {
 		dev_err(&csdev->dev, "wrong device subtype in %s\n", function);
 		return -EINVAL;
 	}
@@ -1116,6 +1117,7 @@ int coresight_enable(struct coresight_device *csdev)
 		per_cpu(tracer_path, cpu) = path;
 		break;
 	case CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE:
+	case CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS:
 		/*
 		 * Use the hash of source's device name as ID
 		 * and map the ID to the pointer of the path.
@@ -1165,6 +1167,7 @@ void coresight_disable(struct coresight_device *csdev)
 		per_cpu(tracer_path, cpu) = NULL;
 		break;
 	case CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE:
+	case CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS:
 		hash = hashlen_hash(hashlen_string(NULL, dev_name(&csdev->dev)));
 		/* Find the path by the hash. */
 		path = idr_find(&path_idr, hash);
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
new file mode 100644
index 000000000000..eb8998affa90
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -0,0 +1,149 @@
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
+	spin_lock(&drvdata->spinlock);
+	if (drvdata->enable) {
+		spin_unlock(&drvdata->spinlock);
+		return -EBUSY;
+	}
+
+	drvdata->enable = true;
+	spin_unlock(&drvdata->spinlock);
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
+	spin_lock(&drvdata->spinlock);
+	if (!drvdata->enable) {
+		spin_unlock(&drvdata->spinlock);
+		return;
+	}
+
+	drvdata->enable = false;
+	spin_unlock(&drvdata->spinlock);
+
+	dev_info(drvdata->dev, "TPDM tracing disabled\n");
+}
+
+static const struct coresight_ops_source tpdm_source_ops = {
+	.enable		= tpdm_enable,
+	.disable	= tpdm_disable,
+};
+
+static const struct coresight_ops tpdm_cs_ops = {
+	.source_ops	= &tpdm_source_ops,
+};
+
+static int tpdm_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	void __iomem *base;
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
+	base = devm_ioremap_resource(dev, &adev->res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	drvdata->base = base;
+
+	/* Set up coresight component description */
+	desc.name = coresight_alloc_device_name(&tpdm_devs, dev);
+	if (!desc.name)
+		return -ENOMEM;
+	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
+	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS;
+	desc.ops = &tpdm_cs_ops;
+	desc.pdata = adev->dev.platform_data;
+	desc.dev = &adev->dev;
+	desc.access = CSDEV_ACCESS_IOMEM(base);
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev))
+		return PTR_ERR(drvdata->csdev);
+
+	spin_lock_init(&drvdata->spinlock);
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
+	.remove		= tpdm_remove,
+};
+
+module_amba_driver(tpdm_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Trace, Profiling & Diagnostic Monitor driver");
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
new file mode 100644
index 000000000000..c87b982d963e
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -0,0 +1,26 @@
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
+ * @spinlock:   lock for the drvdata value.
+ * @enable:     enable status of the component.
+ */
+
+struct tpdm_drvdata {
+	void __iomem		*base;
+	struct device		*dev;
+	struct coresight_device	*csdev;
+	spinlock_t		spinlock;
+	bool			enable;
+};
+
+#endif  /* _CORESIGHT_CORESIGHT_TPDM_H */
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 247147c11231..738b66f4cc35 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -61,6 +61,7 @@ enum coresight_dev_subtype_source {
 	CORESIGHT_DEV_SUBTYPE_SOURCE_PROC,
 	CORESIGHT_DEV_SUBTYPE_SOURCE_BUS,
 	CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE,
+	CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS,
 };
 
 enum coresight_dev_subtype_helper {
-- 
2.17.1

