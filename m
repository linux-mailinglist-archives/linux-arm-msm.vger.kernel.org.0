Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24CA665FDD5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 10:26:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbjAFJ02 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 04:26:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234720AbjAFJZg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 04:25:36 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C48B175D0C;
        Fri,  6 Jan 2023 01:22:05 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3067neWV027608;
        Fri, 6 Jan 2023 09:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=gTO+3qYyyLjQEReYfkP7ey53hq7JGWYfn6TYCFBTsI8=;
 b=XLwWdSObmc7MqgZLoXH2jvsm+ODSe85Y79zDH7oGu/aoI59IrQ0hAh84WMd7TLAMth3j
 ucp2X1+CLavJrufYE//zW18+gkwVscgaYG9ZwxcLajO8CTxPbA0buEbgQ97w5ZMpMkbI
 F4+5S2RS2hEJnMEIzNnoSebmwdIyW1LtEBc4mr2a72IwVoruGBIYBElZEpGF0nOz32Tc
 Q87JF76m5DSgVZj47iy1nEcE1HOPEJJnuGdngTKOk1FzdfGmtBgRq7Iq0BWrfmdPcLQj
 Z6YGVvjlScfx5OOFNkvNXtdXU6pm+Iu/H4lo7vpzXEdaHOyQsrIR4c2GIbRtgkRctz9l 9g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mx57e1err-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 06 Jan 2023 09:21:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3069LaHg022757
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 6 Jan 2023 09:21:36 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 6 Jan 2023 01:21:35 -0800
From:   Mao Jinlong <quic_jinlmao@quicinc.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Mao Jinlong <quic_jinlmao@quicinc.com>,
        Leo Yan <leo.yan@linaro.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Hao Zhang <quic_hazha@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v16 2/8] Coresight: Add coresight TPDM source driver
Date:   Fri, 6 Jan 2023 01:21:13 -0800
Message-ID: <20230106092119.20449-3-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106092119.20449-1-quic_jinlmao@quicinc.com>
References: <20230106092119.20449-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2OG7TLWwQoLpFo282wA5VS5Yxd49WJk6
X-Proofpoint-ORIG-GUID: 2OG7TLWwQoLpFo282wA5VS5Yxd49WJk6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_05,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301060073
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
index 45c1eb5dfcb7..82811db1a5cf 100644
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
index 5eb013f49a0d..a798008ac56e 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1061,7 +1061,8 @@ static int coresight_validate_source(struct coresight_device *csdev,
 	}
 
 	if (subtype != CORESIGHT_DEV_SUBTYPE_SOURCE_PROC &&
-	    subtype != CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE) {
+	    subtype != CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE &&
+	    subtype != CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS) {
 		dev_err(&csdev->dev, "wrong device subtype in %s\n", function);
 		return -EINVAL;
 	}
@@ -1130,6 +1131,7 @@ int coresight_enable(struct coresight_device *csdev)
 		per_cpu(tracer_path, cpu) = path;
 		break;
 	case CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE:
+	case CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS:
 		/*
 		 * Use the hash of source's device name as ID
 		 * and map the ID to the pointer of the path.
@@ -1179,6 +1181,7 @@ void coresight_disable(struct coresight_device *csdev)
 		per_cpu(tracer_path, cpu) = NULL;
 		break;
 	case CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE:
+	case CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS:
 		hash = hashlen_hash(hashlen_string(NULL, dev_name(&csdev->dev)));
 		/* Find the path by the hash. */
 		path = idr_find(&path_idr, hash);
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
new file mode 100644
index 000000000000..95dbf4badfd2
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
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
+	dev_dbg(drvdata->dev, "TPDM tracing enabled\n");
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
+	dev_dbg(drvdata->dev, "TPDM tracing disabled\n");
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
index 000000000000..2ec8a6810771
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
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
index e241eb88dfb9..f19a47b9bb5a 100644
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
2.39.0

