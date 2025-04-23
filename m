Return-Path: <linux-arm-msm+bounces-55034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AC0A97F20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 08:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 304E8189687E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 06:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC663266F0A;
	Wed, 23 Apr 2025 06:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R+ChhBaH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF37266EF1
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745389623; cv=none; b=QaSY2hg+6AkEGjvkp0afrhoRv8Vlf3XXfhcFMr7Fnnyjp1Ducg3N4gxVbPGEMmDeukG29/LzUZJ+EPN0TijfhyhP+3E3ou9PgR2Lw/n1d6C0uMBnHJ3438S8eveZwj3ksTEibpY8PJow/DYKZpF0mKo7GjWJyfEhONeQapD8vvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745389623; c=relaxed/simple;
	bh=W7hJbZ59AzRVWX3XHumSsVykSYZ6JLY83LQVVYhYF+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=MRMkqPdSM39jxk2SPw19SvpWhx7I8p96meQuc2bj9B60wosWkb+mf+rIR8s2fLqMPtTLSLGtENvv+64d0vzL8sWyCCJCyDbsnRStkYGzRxyBZS4mzO8VUArTtvaf/He51C/7tGI/PQ0GV74jbpoE5IqWUKdVrTj7Tj9Pz6AV1HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R+ChhBaH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0ioKB021819
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OzrLJbPeOfFTUCyjduDbEAXp5q6zJCSt0WBHaYDffmo=; b=R+ChhBaH8ZIDviNC
	jBNSIWDsTxdWLL0L2G6S5ylaCdqWDbHwhP1fXcjKSIvHDd6PxHuvT6QofbXUI7am
	5ZgHOL8am08BKq7JTsZuOx3oIL8Qa/MlXML3uBuAjuyISoeG8nAduGYkGC94wcri
	Oiu8CguMzKHKfW+FCWSmHkF/UIuBaL0/YxscvLdCsjvj8HMbfislrNRBBeEIYAPv
	+rWyTcTGH4NZh5JgL3LlrAi61MDuWdPAgDANY+6oL9WO+Ww6aUfPDEmLVWVZnHUv
	7/cHakfOlE/RDC0utCZQZnsN9o5MuJaPpUCCcdEDazX7A/IEssWpgSivjPnTU7BU
	sW0rzQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh21338-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:27:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N6R04Q008465
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:27:00 GMT
Received: from ap-cloud-sh02-lnx.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 23:26:59 -0700
From: Songwei Chai <quic_songchai@quicinc.com>
Date: Wed, 23 Apr 2025 14:26:46 +0800
Subject: [PATCH v4 2/7] coresight: Add coresight TGU driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250423-tgu_patch-v4-2-92bbca66c766@quicinc.com>
References: <20250423-tgu_patch-v4-0-92bbca66c766@quicinc.com>
In-Reply-To: <20250423-tgu_patch-v4-0-92bbca66c766@quicinc.com>
To: <quic_songchai@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745389616; l=9892;
 i=quic_songchai@quicinc.com; s=20250423; h=from:subject:message-id;
 bh=W7hJbZ59AzRVWX3XHumSsVykSYZ6JLY83LQVVYhYF+I=;
 b=c+iORWRBBzWlorccDG/RZ0EjQCo/iKwpxyNKA/E6eb3pDqQBSogtLaZ24JKYfKt10L1DCmJcM
 dEokd0KEtHUAyutr7+zBU2P2eWsWqzHWZwcLv2xODb2GgqWe0RNSI3X
X-Developer-Key: i=quic_songchai@quicinc.com; a=ed25519;
 pk=uPEL8tAga6UMzd+eo6u4Mmg7ctrdZe8b/sjFJqJYEHA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=68088834 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=IFpLgFX1vqQvfj110ZEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: gkmHOZHnR-rpHG-XhtqK4GjbK0L9jWa7
X-Proofpoint-ORIG-GUID: gkmHOZHnR-rpHG-XhtqK4GjbK0L9jWa7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0MiBTYWx0ZWRfX0Ljados59VS8 NKyEkizB0qSUhByMhF41axS+UnwoZv82fxa0QPQlIEcjSJVLR1AzFcIaF6xj2OiOSAObWz5ym1q F73GYdUmdaGywiodNzCuf77VwzcVGFE9XXTtP1kOtxCW5hwpD+pUO10WywOR5TWfeCta4GU/nfg
 XXoCJ4qyL2uG0RhjRzVACa82MIGFjD2BXfSV1AtLVhUZLNI25YQzxq5RwMYU6t/hENz6IvYJTpN HLQyMxqtpyIrJhX4DtenEP9iuCluGNSP7HI2SggW4S1/ALCmL/venxlS+LYTxqBTzlOXGmWxp/H s3mFh7LYWVG7ivBw8T39zxiDRR/hRl9G3Z5PAlDRjGK5uUn2GpnfgGOeFqCgFf1y8FLQCltpIu+
 CPzEdPuejCATar3nP8YxhQCt8MMs3JFOiJ1u+9N5o4cQQjJId/elvOD3iHuunyVsT9njceAJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230042

Add driver to support Coresight device TGU (Trigger Generation Unit).
TGU is a Data Engine which can be utilized to sense a plurality of
signals and create a trigger into the CTI or generate interrupts to
processors. Add probe/enable/disable functions for tgu.

Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tgu    |   9 +
 drivers/hwtracing/coresight/Kconfig                |  11 ++
 drivers/hwtracing/coresight/Makefile               |   1 +
 drivers/hwtracing/coresight/coresight-tgu.c        | 213 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tgu.h        |  37 ++++
 5 files changed, 271 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
new file mode 100644
index 0000000000000000000000000000000000000000..741bc9fd9df50744930f92d271470506080c5acd
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/coresight/devices/<tgu-name>/enable_tgu
+Date:		February 2025
+KernelVersion	6.15
+Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
+Description:
+		(RW) Set/Get the enable/disable status of TGU
+		Accepts only one of the 2 values -  0 or 1.
+		0 : disable TGU.
+		1 : enable TGU.
diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index ecd7086a5b83e86b6bc8ea039d6d26a628334ed3..f284cef80d2f3c42adaac1da2b25982491162c4b 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -259,4 +259,15 @@ config CORESIGHT_DUMMY
 
 	  To compile this driver as a module, choose M here: the module will be
 	  called coresight-dummy.
+
+config CORESIGHT_TGU
+	tristate "CoreSight Trigger Generation Unit driver"
+	help
+	  This driver provides support for Trigger Generation Unit that is
+	  used to detect patterns or sequences on a given set of signals.
+	  TGU is used to monitor a particular bus within a given region to
+	  detect illegal transaction sequences or slave responses. It is also
+	  used to monitor a data stream to detect protocol violations and to
+	  provide a trigger point for centering data around a specific event
+	  within the trace data buffer.
 endif
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 8e62c3150aebd1e82b445fafc97a0a9b44397b0e..b24c8491bb1fc45e716c91559ec095dc58463490 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -51,5 +51,6 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 		   coresight-cti-sysfs.o
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
+obj-$(CONFIG_CORESIGHT_TGU) += coresight-tgu.o
 obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
 coresight-ctcu-y := coresight-ctcu-core.o
diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
new file mode 100644
index 0000000000000000000000000000000000000000..a1a02602f7b36cecd2458aa2c2714a6bfdf2e294
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tgu.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/amba/bus.h>
+#include <linux/coresight.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#include "coresight-priv.h"
+#include "coresight-tgu.h"
+
+DEFINE_CORESIGHT_DEVLIST(tgu_devs, "tgu");
+
+static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+{
+	CS_UNLOCK(drvdata->base);
+	/* Enable TGU to program the triggers */
+	tgu_writel(drvdata, 1, TGU_CONTROL);
+	CS_LOCK(drvdata->base);
+}
+
+static int tgu_enable(struct coresight_device *csdev, enum cs_mode mode,
+		      void *data)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	spin_lock(&drvdata->spinlock);
+
+	if (drvdata->enable) {
+		spin_unlock(&drvdata->spinlock);
+		return -EBUSY;
+	}
+	tgu_write_all_hw_regs(drvdata);
+	drvdata->enable = true;
+
+	spin_unlock(&drvdata->spinlock);
+	return 0;
+}
+
+static int tgu_disable(struct coresight_device *csdev, void *data)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	spin_lock(&drvdata->spinlock);
+	if (drvdata->enable) {
+		CS_UNLOCK(drvdata->base);
+		tgu_writel(drvdata, 0, TGU_CONTROL);
+		CS_LOCK(drvdata->base);
+
+		drvdata->enable = false;
+	}
+	spin_unlock(&drvdata->spinlock);
+	return 0;
+}
+
+static ssize_t enable_tgu_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	bool enabled;
+
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	spin_lock(&drvdata->spinlock);
+	enabled = drvdata->enable;
+	spin_unlock(&drvdata->spinlock);
+
+	return sysfs_emit(buf, "%d\n", enabled);
+}
+
+/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
+static ssize_t enable_tgu_store(struct device *dev,
+				struct device_attribute *attr, const char *buf,
+				size_t size)
+{
+	int ret = 0;
+	unsigned long val;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val) {
+		ret = pm_runtime_resume_and_get(dev->parent);
+		if (ret)
+			return ret;
+		ret = tgu_enable(drvdata->csdev, CS_MODE_SYSFS, NULL);
+		if (ret)
+			pm_runtime_put(dev->parent);
+	} else {
+		ret = tgu_disable(drvdata->csdev, NULL);
+		pm_runtime_put(dev->parent);
+	}
+
+	if (ret)
+		return ret;
+	return size;
+}
+static DEVICE_ATTR_RW(enable_tgu);
+
+static const struct coresight_ops_helper tgu_helper_ops = {
+	.enable = tgu_enable,
+	.disable = tgu_disable,
+};
+
+static const struct coresight_ops tgu_ops = {
+	.helper_ops = &tgu_helper_ops,
+};
+
+static struct attribute *tgu_common_attrs[] = {
+	&dev_attr_enable_tgu.attr,
+	NULL,
+};
+
+static const struct attribute_group tgu_common_grp = {
+	.attrs = tgu_common_attrs,
+	{ NULL },
+};
+
+static const struct attribute_group *tgu_attr_groups[] = {
+	&tgu_common_grp,
+	NULL,
+};
+
+static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	int ret = 0;
+	struct device *dev = &adev->dev;
+	struct coresight_desc desc = { 0 };
+	struct coresight_platform_data *pdata;
+	struct tgu_drvdata *drvdata;
+
+	desc.name = coresight_alloc_device_name(&tgu_devs, dev);
+	if (!desc.name)
+		return -ENOMEM;
+
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+
+	adev->dev.platform_data = pdata;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->dev = &adev->dev;
+	dev_set_drvdata(dev, drvdata);
+
+	drvdata->base = devm_ioremap_resource(dev, &adev->res);
+	if (!drvdata->base)
+		return -ENOMEM;
+
+	spin_lock_init(&drvdata->spinlock);
+
+	drvdata->enable = false;
+	desc.type = CORESIGHT_DEV_TYPE_HELPER;
+	desc.pdata = adev->dev.platform_data;
+	desc.dev = &adev->dev;
+	desc.ops = &tgu_ops;
+	desc.groups = tgu_attr_groups;
+
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev)) {
+		ret = PTR_ERR(drvdata->csdev);
+		goto err;
+	}
+
+	pm_runtime_put(&adev->dev);
+	return 0;
+err:
+	pm_runtime_put(&adev->dev);
+	return ret;
+}
+
+static void tgu_remove(struct amba_device *adev)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(&adev->dev);
+
+	coresight_unregister(drvdata->csdev);
+}
+
+static const struct amba_id tgu_ids[] = {
+	{
+		.id = 0x000f0e00,
+		.mask = 0x000fffff,
+		.data = "TGU",
+	},
+	{ 0, 0, NULL },
+};
+
+MODULE_DEVICE_TABLE(amba, tgu_ids);
+
+static struct amba_driver tgu_driver = {
+	.drv = {
+		.name = "coresight-tgu",
+		.suppress_bind_attrs = true,
+	},
+	.probe = tgu_probe,
+	.remove = tgu_remove,
+	.id_table = tgu_ids,
+};
+
+module_amba_driver(tgu_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("CoreSight TGU driver");
diff --git a/drivers/hwtracing/coresight/coresight-tgu.h b/drivers/hwtracing/coresight/coresight-tgu.h
new file mode 100644
index 0000000000000000000000000000000000000000..6c849a2f78faf2c8fd54fe830e6fbaea41ff1ca8
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tgu.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _CORESIGHT_TGU_H
+#define _CORESIGHT_TGU_H
+
+/* Register addresses */
+#define TGU_CONTROL 0x0000
+
+/* Register read/write */
+#define tgu_writel(drvdata, val, off) __raw_writel((val), drvdata->base + off)
+#define tgu_readl(drvdata, off) __raw_readl(drvdata->base + off)
+
+/**
+ * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit)
+ * @base: Memory-mapped base address of the TGU device
+ * @dev: Pointer to the associated device structure
+ * @csdev: Pointer to the associated coresight device
+ * @spinlock: Spinlock for handling concurrent access
+ * @enable: Flag indicating whether the TGU device is enabled
+ *
+ * This structure defines the data associated with a TGU device,
+ * including its base address, device pointers, clock, spinlock for
+ * synchronization, trigger data pointers, maximum limits for various
+ * trigger-related parameters, and enable status.
+ */
+struct tgu_drvdata {
+	void __iomem *base;
+	struct device *dev;
+	struct coresight_device *csdev;
+	spinlock_t spinlock;
+	bool enable;
+};
+
+#endif

-- 
2.34.1


