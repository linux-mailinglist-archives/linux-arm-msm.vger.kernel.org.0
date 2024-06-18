Return-Path: <linux-arm-msm+bounces-22973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A029A90C5DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 12:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEEFFB219EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 10:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E2B15B969;
	Tue, 18 Jun 2024 07:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AgNVyXZq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63641E863;
	Tue, 18 Jun 2024 07:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718695713; cv=none; b=qynmvbbnpZH3fHC301sMC1PZUwKgF+nvQqaiPVLvKAT/NqOnlpsszRU9Q6gbWIBmQPxTDWI1fGKRCvB+l/zG6r4AdV57z7mH/QYQgSU9FJpSZGSvvT1EkNo9PgapUVNNXRHxPkRHco/6jwkbVOqTA6FklfbdqZhwI/gvyx98PRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718695713; c=relaxed/simple;
	bh=NNr4BsVXsg62i5EkUdKeJ41BaSbdIToXMqWqbnjJdOU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fseTymR8GqGJ87g1JIy6+13yEbvA2ccNt0SRx8geoulx4SSzT+2sxKY3quARsVpUcvzX4+RC1FxROVZKwFtldh8BKIeZmlbmuGKmKuWsCIgF/sd+phpm4jJRLTaob0PJKn2hkRbEEMqAsJpG7iD7adzxgsmGi24UTw7yT+rbgfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AgNVyXZq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I2IFSx001348;
	Tue, 18 Jun 2024 07:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	42t4m1UtKLJD0Iz6xLxSqMT+vL+w7axocT8rOsKshs4=; b=AgNVyXZqCZRAomPu
	ikZgIPTDl8UNaXvZ+Jtgdbqc86FJrmA8YLFvOBV9h5rIZkUvNF4/uqLBR/UAZdQD
	yaa48SZHEYbVneMPrYowlq9oP20bJJAO8vgvvDwGSSDEPbjkaQ1W74PccuActeyX
	uE+NhFLkiWJ1YaUwJLuHIi/fucYhT8XeG9SIXQOTYYzdo1coyRgj7/VDGyIyT9Q/
	27abvxyL4SEmhm84b++u0Y97KXuJPf1k9TDR3j8vp3K9eWlRrsMSg1tQj3OCBhCn
	j0BGMoT3dnYOVu/UcHCS3XM7Djc2gVcgomw8ZApwV8a4JxpK/6qsc+rzVzZNSlEE
	DGisdQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yu1b0rhg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 07:28:12 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45I7SC79024597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 07:28:12 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Jun 2024 00:28:04 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Song Chai
	<quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <andersson@kernel.org>,
        <quic_yijiyang@quicinc.com>, <quic_yuanjiey@quicinc.com>,
        <quic_liuxin@quicinc.com>, <quic_yanzl@quicinc.com>,
        <quic_xinlon@quicinc.com>, <quic_xueqnie@quicinc.com>,
        <quic_sijiwu@quicinc.com>
Subject: [PATCH v1 2/3] coresight: Add coresight slave register driver to support data filter function in sysfs mode
Date: Tue, 18 Jun 2024 15:27:25 +0800
Message-ID: <20240618072726.3767974-3-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618072726.3767974-1-quic_jiegan@quicinc.com>
References: <20240618072726.3767974-1-quic_jiegan@quicinc.com>
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
X-Proofpoint-GUID: 3T5OYp4ylUXQbdpFEGHyGIUEnV2xtvsy
X-Proofpoint-ORIG-GUID: 3T5OYp4ylUXQbdpFEGHyGIUEnV2xtvsy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406180054

The Coresight Slave register hosts miscellaneous configuration registers
which control various features related to TMC ETR sink.

Based on the trace ID, which is programmed in the related CSR ATID register
of a specific ETR, trace data with that trace ID gets into the ETR buffer,
while other trace data gets dropped.

Retrieving the trace ID from the source device and storing it in the
driver data of the related ETR is beneficial when CSR programs the ATID register,
as it allows CSR to conveniently access the driver data associated with the ETR.

Enable session only sets one bit of the ATID register at a time.
Disable session resets all bits of the ATID register in every single call.

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/Kconfig           |   6 +
 drivers/hwtracing/coresight/Makefile          |   1 +
 drivers/hwtracing/coresight/coresight-core.c  |   6 +-
 drivers/hwtracing/coresight/coresight-csr.c   | 315 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-csr.h   |  24 ++
 .../coresight/coresight-etm4x-core.c          |   1 +
 drivers/hwtracing/coresight/coresight-stm.c   |  50 ---
 drivers/hwtracing/coresight/coresight-sysfs.c |  45 ++-
 .../hwtracing/coresight/coresight-tmc-core.c  |   1 +
 drivers/hwtracing/coresight/coresight-tmc.h   |   2 +
 include/linux/coresight-stm.h                 |  44 +++
 11 files changed, 441 insertions(+), 54 deletions(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-csr.c
 create mode 100644 drivers/hwtracing/coresight/coresight-csr.h

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 06f0a7594169..8556c0bcd18e 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -133,6 +133,12 @@ config CORESIGHT_STM
 	  To compile this driver as a module, choose M here: the
 	  module will be called coresight-stm.
 
+config CORESIGHT_CSR
+	tristate "CoreSight Slave Register driver"
+	help
+	  This driver provides support for CoreSight Slave Register block
+	  that hosts miscellaneous configuration registers.
+
 config CORESIGHT_CPU_DEBUG
 	tristate "CoreSight CPU Debug driver"
 	depends on ARM || ARM64
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 4ba478211b31..4919374c51c5 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 		   coresight-cti-sysfs.o
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
+obj-$(CONFIG_CORESIGHT_CSR) += coresight-csr.o
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 9fc6f6b863e0..b038afcddd03 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -297,9 +297,9 @@ static int coresight_enable_helper(struct coresight_device *csdev,
 	return helper_ops(csdev)->enable(csdev, mode, data);
 }
 
-static void coresight_disable_helper(struct coresight_device *csdev)
+static void coresight_disable_helper(struct coresight_device *csdev, struct coresight_device *parent_data)
 {
-	helper_ops(csdev)->disable(csdev, NULL);
+	helper_ops(csdev)->disable(csdev, parent_data);
 }
 
 static void coresight_disable_helpers(struct coresight_device *csdev)
@@ -310,7 +310,7 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
 	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
 		helper = csdev->pdata->out_conns[i]->dest_dev;
 		if (helper && coresight_is_helper(helper))
-			coresight_disable_helper(helper);
+			coresight_disable_helper(helper, csdev);
 	}
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-csr.c b/drivers/hwtracing/coresight/coresight-csr.c
new file mode 100644
index 000000000000..b557aee9ab1e
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-csr.c
@@ -0,0 +1,315 @@
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
+#include "coresight-csr.h"
+#include "coresight-etm4x.h"
+#include "coresight-priv.h"
+#include "coresight-tmc.h"
+#include "coresight-trace-id.h"
+#include "coresight-tpda.h"
+
+#define TPDA_KEY	"tpda"
+
+DEFINE_CORESIGHT_DEVLIST(csr_devs, "csr");
+
+#define csr_writel(drvdata, val, offset)	__raw_writel((val), drvdata->base + offset)
+#define csr_readl(drvdata, offset)		__raw_readl(drvdata->base + offset)
+
+/* The Coresight Slave Register uses four ATID registers to control the data filter function based
+ * on the trace ID for each TMC ETR sink. The length of each ATID register is 32 bits. Therefore,
+ * the ETR has a related field in CSR that is 128 bits long. Each trace ID is represented by one bit in that filed.
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
+#define CSR_ATID_REG_OFFSET(traceid, atid_offset) \
+		((traceid / 32) * 4 + atid_offset)
+
+#define CSR_ATID_REG_BIT(traceid)	(traceid % 32)
+#define CSR_ATID_REG_SIZE		0x10
+
+/*
+ * __csr_set_etr_traceid: Set bit in the ATID register based on trace id when enable is ture.
+ * Reset all bits of the ATID register when enable is false.
+ *
+ * Returns 0 indicates success. Non-zero result means failure.
+ */
+static int __csr_set_etr_traceid(struct coresight_device *csdev,
+			uint32_t atid_offset, uint32_t traceid,
+			bool enable)
+{
+	struct csr_drvdata *drvdata;
+	unsigned long flags;
+	uint32_t reg_offset;
+	int bit;
+	uint32_t val;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+	if (IS_ERR_OR_NULL(drvdata))
+		return -EINVAL;
+
+	if (((traceid < 0) && (traceid >= CORESIGHT_TRACE_IDS_MAX)) || atid_offset <= 0)
+		return -EINVAL;
+
+	spin_lock_irqsave(&drvdata->spin_lock, flags);
+	CS_UNLOCK(drvdata->base);
+
+	reg_offset = CSR_ATID_REG_OFFSET(traceid, atid_offset);
+	bit = CSR_ATID_REG_BIT(traceid);
+	if (reg_offset - atid_offset >= CSR_ATID_REG_SIZE
+		|| bit >= CORESIGHT_TRACE_IDS_MAX) {
+		CS_LOCK(drvdata);
+		spin_unlock_irqrestore(&drvdata->spin_lock, flags);
+		return -EINVAL;
+	}
+
+	val = csr_readl(drvdata, reg_offset);
+	if (enable)
+		val = val | BIT(bit);
+	else
+		val = 0;
+	csr_writel(drvdata, val, reg_offset);
+
+	CS_LOCK(drvdata->base);
+	spin_unlock_irqrestore(&drvdata->spin_lock, flags);
+	return 0;
+}
+
+/*
+ * of_get_csr_atid_offset: Get the offset of the CSR ATID register for the sink device.
+ *
+ * Returns the csr atid offset. If the result is less than zero, it means
+ * failure.
+ */
+static int of_get_csr_atid_offset(struct coresight_device *csdev,
+				u32 *atid_offset)
+{
+	return of_property_read_u32(csdev->dev.parent->of_node,
+					"qcom,csr-atid-offset", atid_offset);
+}
+
+/*
+ * csr_set_etr_traceid: Get atid_offset and traceid from TMC ETR's driver data.
+ *
+ * Returns 0 indicates success. None-zero result means failure.
+ */
+static int csr_set_etr_traceid(struct coresight_device *csdev, struct coresight_device *sink, bool enable)
+{
+	int atid_offset, traceid;
+	struct tmc_drvdata *etr_drvdata;
+
+	if (!sink)
+		return -EINVAL;
+
+	etr_drvdata = dev_get_drvdata(sink->dev.parent);
+	traceid = etr_drvdata->traceid;
+
+	if (of_get_csr_atid_offset(sink, &atid_offset))
+		return -EINVAL;
+
+	return __csr_set_etr_traceid(csdev, atid_offset, traceid, enable);
+}
+
+/** csr_is_tpda_device - Check the current device whether it is a TPDA device or not.
+ *  @csdev:	the device structure for current device.
+ *
+ * Find the traceid of the TPDA device has already fully met the requirement because every
+ * TPDM device is connected to the TPDA device.
+ */
+static bool csr_is_tpda_device(struct coresight_device *csdev)
+{
+	if (strnstr(dev_name(&csdev->dev), TPDA_KEY, strlen(dev_name(&csdev->dev))))
+		return true;
+
+	return false;
+}
+
+/** csr_get_traceid - Get trace id from the source that is enabling.
+ *  @csdev:	the device structure.
+ *
+ * Get STM&ETM device's traceid from its driver data.
+ * Get TPDM device's traceid from the TPDA device that is connected to the TPDM device.
+ *
+ * Returns traceid value if found.
+ * Returns 0 indicates failure.
+ */
+int csr_get_traceid(struct coresight_device *csdev)
+{
+	int i, trace_id = 0;
+	u32 type, subtype;
+	struct etmv4_drvdata *etmv4_drvdata = NULL;
+	struct stm_drvdata *stm_drvdata = NULL;
+	struct tpda_drvdata *tpda_drvdata = NULL;
+
+	type = csdev->type;
+	subtype = csdev->subtype.source_subtype;
+
+	if ((type == CORESIGHT_DEV_TYPE_SOURCE) && (subtype == CORESIGHT_DEV_SUBTYPE_SOURCE_PROC)) {
+		etmv4_drvdata = dev_get_drvdata(csdev->dev.parent);
+		trace_id = etmv4_drvdata->trcid;
+		return trace_id;
+
+	} else if ((type == CORESIGHT_DEV_TYPE_SOURCE) && subtype == CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE) {
+		stm_drvdata = dev_get_drvdata(csdev->dev.parent);
+		trace_id = stm_drvdata->traceid;
+		return trace_id;
+
+	} else if (csr_is_tpda_device(csdev)) {
+		tpda_drvdata = dev_get_drvdata(csdev->dev.parent);
+		trace_id = tpda_drvdata->atid;
+		return trace_id;
+	}
+
+	for (i = 0; i < csdev->pdata->nr_outconns; i++) {
+		struct coresight_device *child_dev;
+
+		child_dev = csdev->pdata->out_conns[i]->dest_dev;
+		if (child_dev)
+			trace_id = csr_get_traceid(child_dev);
+		if (trace_id)
+			return trace_id;
+	}
+
+	return trace_id;
+}
+EXPORT_SYMBOL_GPL(csr_get_traceid);
+
+static int csr_enable(struct coresight_device *csdev, enum cs_mode mode,
+		       void *data)
+{
+	int ret = 0;
+	struct coresight_device *sink_csdev = (struct coresight_device *)data;
+
+	ret = csr_set_etr_traceid(csdev, sink_csdev, true);
+	if (ret)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int csr_disable(struct coresight_device *csdev, void *data)
+{
+	int ret = 0;
+	struct coresight_device *sink_csdev = (struct coresight_device *)data;
+
+	ret = csr_set_etr_traceid(csdev, sink_csdev, false);
+	if (ret)
+		return -EINVAL;
+
+	return 0;
+}
+
+static const struct coresight_ops_helper csr_helper_ops = {
+	.enable = csr_enable,
+	.disable = csr_disable,
+};
+
+static const struct coresight_ops csr_ops = {
+	.helper_ops = &csr_helper_ops,
+};
+
+static int csr_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct coresight_platform_data *pdata;
+	struct csr_drvdata *drvdata;
+	struct coresight_desc desc = { 0 };
+	struct resource *res;
+
+	desc.name = coresight_alloc_device_name(&csr_devs, dev);
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
+	platform_set_drvdata(pdev, drvdata);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "csr-base");
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
+	desc.ops = &csr_ops;
+
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev))
+		return PTR_ERR(drvdata->csdev);
+
+	dev_dbg(dev, "CSR initialized: %s\n", desc.name);
+	return 0;
+}
+
+static int csr_remove(struct platform_device *pdev)
+{
+	struct csr_drvdata *drvdata = platform_get_drvdata(pdev);
+
+	coresight_unregister(drvdata->csdev);
+	return 0;
+}
+
+static const struct of_device_id csr_match[] = {
+	{.compatible = "qcom,coresight-csr"},
+	{}
+};
+
+static struct platform_driver csr_driver = {
+	.probe          = csr_probe,
+	.remove         = csr_remove,
+	.driver         = {
+		.name   = "coresight-csr",
+		.of_match_table = csr_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init csr_init(void)
+{
+	return platform_driver_register(&csr_driver);
+}
+module_init(csr_init);
+
+static void __exit csr_exit(void)
+{
+	platform_driver_unregister(&csr_driver);
+}
+module_exit(csr_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("CoreSight Slave Register driver");
diff --git a/drivers/hwtracing/coresight/coresight-csr.h b/drivers/hwtracing/coresight/coresight-csr.h
new file mode 100644
index 000000000000..a34403e00e67
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-csr.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _CORESIGHT_CSR_H
+#define _CORESIGHT_CSR_H
+
+struct csr_drvdata {
+	void __iomem		*base;
+	phys_addr_t		pbase;
+	struct device		*dev;
+	struct coresight_device	*csdev;
+	spinlock_t		spin_lock;
+	uint32_t		atid_offset;
+};
+
+#if IS_ENABLED(CONFIG_CORESIGHT_CSR)
+int csr_get_traceid(struct coresight_device *csdev);
+#else
+static inline int csr_get_traceid(struct coresight_device *csdev)
+				{return -EINVAL; }
+#endif
+#endif
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index bf01f01964cf..b583632a3f4f 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2090,6 +2090,7 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 		return ret;
 	}
 
+	etm4_read_alloc_trace_id(drvdata);
 	etmdrvdata[drvdata->cpu] = drvdata;
 
 	dev_info(&drvdata->csdev->dev, "CPU%d: %s v%d.%d initialized\n",
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 117dbb484543..b4f2c4b8571f 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -20,7 +20,6 @@
 #include <linux/amba/bus.h>
 #include <linux/bitmap.h>
 #include <linux/clk.h>
-#include <linux/coresight.h>
 #include <linux/coresight-stm.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
@@ -28,7 +27,6 @@
 #include <linux/of_address.h>
 #include <linux/perf_event.h>
 #include <linux/pm_runtime.h>
-#include <linux/stm.h>
 #include <linux/platform_device.h>
 
 #include "coresight-priv.h"
@@ -98,56 +96,8 @@ module_param_named(
 	boot_nr_channel, boot_nr_channel, int, S_IRUGO
 );
 
-/*
- * struct channel_space - central management entity for extended ports
- * @base:		memory mapped base address where channels start.
- * @phys:		physical base address of channel region.
- * @guaraneed:		is the channel delivery guaranteed.
- */
-struct channel_space {
-	void __iomem		*base;
-	phys_addr_t		phys;
-	unsigned long		*guaranteed;
-};
-
 DEFINE_CORESIGHT_DEVLIST(stm_devs, "stm");
 
-/**
- * struct stm_drvdata - specifics associated to an STM component
- * @base:		memory mapped base address for this component.
- * @atclk:		optional clock for the core parts of the STM.
- * @pclk:		APB clock if present, otherwise NULL
- * @csdev:		component vitals needed by the framework.
- * @spinlock:		only one at a time pls.
- * @chs:		the channels accociated to this STM.
- * @stm:		structure associated to the generic STM interface.
- * @traceid:		value of the current ID for this component.
- * @write_bytes:	Maximus bytes this STM can write at a time.
- * @stmsper:		settings for register STMSPER.
- * @stmspscr:		settings for register STMSPSCR.
- * @numsp:		the total number of stimulus port support by this STM.
- * @stmheer:		settings for register STMHEER.
- * @stmheter:		settings for register STMHETER.
- * @stmhebsr:		settings for register STMHEBSR.
- */
-struct stm_drvdata {
-	void __iomem		*base;
-	struct clk		*atclk;
-	struct clk		*pclk;
-	struct coresight_device	*csdev;
-	spinlock_t		spinlock;
-	struct channel_space	chs;
-	struct stm_data		stm;
-	u8			traceid;
-	u32			write_bytes;
-	u32			stmsper;
-	u32			stmspscr;
-	u32			numsp;
-	u32			stmheer;
-	u32			stmheter;
-	u32			stmhebsr;
-};
-
 static void stm_hwevent_enable_hw(struct stm_drvdata *drvdata)
 {
 	CS_UNLOCK(drvdata->base);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index f9444e2cb1d9..876074bfd0a0 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -8,7 +8,9 @@
 #include <linux/idr.h>
 #include <linux/kernel.h>
 
+#include "coresight-csr.h"
 #include "coresight-priv.h"
+#include "coresight-tmc.h"
 
 /*
  * Use IDR to map the hash of the source's device name
@@ -162,6 +164,43 @@ static int coresight_validate_source_sysfs(struct coresight_device *csdev,
 	return 0;
 }
 
+/** coresight_set_traceid_to_etr_sysfs: Store the traceid value in the TMC ETR device's driver data.
+ *  @csdev:	the device structure.
+ *
+ * Find the actived sink and store the traceid that obtained from the source device if the sink device is a TMC ETR device.
+ *
+ * Returns 0 indicates success. Non-zero result means failure.
+ */
+static int coresight_set_traceid_to_etr_sysfs(struct coresight_device *csdev)
+{
+	int ret = 0;
+	int trace_id = 0;
+	struct coresight_device *sink = NULL;
+	struct tmc_drvdata *drvdata = NULL;
+
+	ret = coresight_validate_source_sysfs(csdev, __func__);
+	if (ret)
+		return -EINVAL;
+
+	sink = coresight_find_activated_sysfs_sink(csdev);
+	if (!sink)
+		return -EINVAL;
+
+	drvdata = dev_get_drvdata(sink->dev.parent);
+
+	if (drvdata->config_type == TMC_CONFIG_TYPE_ETR) {
+		trace_id = csr_get_traceid(csdev);
+		if (!trace_id)
+			return -EINVAL;
+
+		drvdata->traceid = trace_id;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 int coresight_enable_sysfs(struct coresight_device *csdev)
 {
 	int cpu, ret = 0;
@@ -208,7 +247,11 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 		goto out;
 	}
 
-	ret = coresight_enable_path(path, CS_MODE_SYSFS, NULL);
+	ret = coresight_set_traceid_to_etr_sysfs(csdev);
+	if (ret)
+		dev_dbg(&csdev->dev, "Set traceid to ETR failed\n");
+
+	ret = coresight_enable_path(path, CS_MODE_SYSFS, sink);
 	if (ret)
 		goto err_path;
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 4f11a739ae4d..1a9c0e34bd14 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -502,6 +502,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	/* This device is not associated with a session */
 	drvdata->pid = -1;
 	drvdata->etr_mode = ETR_MODE_AUTO;
+	drvdata->traceid = 0;
 
 	if (drvdata->config_type == TMC_CONFIG_TYPE_ETR) {
 		drvdata->size = tmc_etr_get_default_buffer_size(dev);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index c77763b49de0..f5d2d25915e6 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -188,6 +188,7 @@ struct etr_buf {
  * @idr_mutex:	Access serialisation for idr.
  * @sysfs_buf:	SYSFS buffer for ETR.
  * @perf_buf:	PERF buffer for ETR.
+ * @traceid:    Store the trace id collects from trace source for ETR.
  */
 struct tmc_drvdata {
 	struct clk		*pclk;
@@ -213,6 +214,7 @@ struct tmc_drvdata {
 	struct mutex		idr_mutex;
 	struct etr_buf		*sysfs_buf;
 	struct etr_buf		*perf_buf;
+	u32			traceid;
 };
 
 struct etr_buf_operations {
diff --git a/include/linux/coresight-stm.h b/include/linux/coresight-stm.h
index 74714b59f9d2..6f7e0b6cc43c 100644
--- a/include/linux/coresight-stm.h
+++ b/include/linux/coresight-stm.h
@@ -3,5 +3,49 @@
 #define __LINUX_CORESIGHT_STM_H_
 
 #include <uapi/linux/coresight-stm.h>
+#include <linux/coresight.h>
+#include <linux/stm.h>
+
+struct channel_space {
+	void __iomem            *base;
+	phys_addr_t             phys;
+	unsigned long           *guaranteed;
+};
+
+/**
+ * struct stm_drvdata - specifics associated to an STM component
+ * @base:		memory mapped base address for this component.
+ * @atclk:		optional clock for the core parts of the STM.
+ * @pclk:		APB clock if present, otherwise NULL
+ * @csdev:		component vitals needed by the framework.
+ * @spinlock:		only one at a time pls.
+ * @chs:		the channels accociated to this STM.
+ * @stm:		structure associated to the generic STM interface.
+ * @traceid:		value of the current ID for this component.
+ * @write_bytes:	Maximus bytes this STM can write at a time.
+ * @stmsper:		settings for register STMSPER.
+ * @stmspscr:		settings for register STMSPSCR.
+ * @numsp:		the total number of stimulus port support by this STM.
+ * @stmheer:		settings for register STMHEER.
+ * @stmheter:		settings for register STMHETER.
+ * @stmhebsr:		settings for register STMHEBSR.
+ */
+struct stm_drvdata {
+	void __iomem		*base;
+	struct clk		*atclk;
+	struct clk		*pclk;
+	struct coresight_device	*csdev;
+	spinlock_t		spinlock;
+	struct channel_space	chs;
+	struct stm_data		stm;
+	u8			traceid;
+	u32			write_bytes;
+	u32			stmsper;
+	u32			stmspscr;
+	u32			numsp;
+	u32			stmheer;
+	u32			stmheter;
+	u32			stmhebsr;
+};
 
 #endif
-- 
2.34.1


