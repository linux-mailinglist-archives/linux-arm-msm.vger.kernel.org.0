Return-Path: <linux-arm-msm+bounces-48816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F3FA3ED7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 08:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88ED317EFBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 07:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A144A201012;
	Fri, 21 Feb 2025 07:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GJ9GH6DW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9581FF603;
	Fri, 21 Feb 2025 07:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740123681; cv=none; b=Dpd84f5EtQNstRpWmOUaqjbrS2qE5VK7MT1i8wMRkczp2rwcRlkBAA4+4J367pCxnJJ5e6QRpIDyzEQC20YKry5OprlWSlqYfVmINzG41kqKqccTubq4uaOAKFAoZVPkBU3WfJm02q9hCCYZ8JNGOxjhCTZ/AQ7v0iy8ixhy7pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740123681; c=relaxed/simple;
	bh=g52m5IvG8gp3U3z1mHKbBv/3s1N15QOP2Ld1DtqPUDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=S6hCxtBw+Yf7g9YVbZith5N+tIO5J8exdUI9cfGXXLTq7A9PF2Ik7uoOtdAQjWF5gV4gFCb9+ofAAQpKTvRINWpwd602sfiPHs0Vzvn7UNPksih3/OXQTR8kEsB4qoV61SqwFK7GC3ae7Fa5Bto1aunk3E+Q8213yDUjl33mH/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GJ9GH6DW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L65s0g020493;
	Fri, 21 Feb 2025 07:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jclyazN7JySejOOMEchTNnl54bsEgPWLtB8PyLcYJsk=; b=GJ9GH6DWLMTXLGpD
	4HB2zRAZ6n65IdGS/2aJ6jHyYlU3j9D6vo3ZXYSc1jkPz8IMnvMKkmlEmxx9DqT/
	IX5EBjXp//gE2gcS08rvcUXAi9egiOUkHR/+OLeCAK6IU9hmtW8y/ff3bXI/lY+Q
	O5cL8JfOAxoVoSyK6zP7JAzLI3NtVfTtpWyHD9B88iQvhU7bzMOJhawPt3VNWpwV
	bzsMnTOL059LNkObf7trz0Y3zDZlzEVInvaYdYyNZAF3kuR7ZQZjzCzTzBfDFe4Y
	hOJ9eyrUaq3iR+wdOFaj+HHzMbzZrWg+e+pKebmXEMul1FOHbHhjlCYaUGZuqiS0
	aRAowQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x06t3mmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 07:41:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L7fAT3023834
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 07:41:10 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 23:41:04 -0800
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Fri, 21 Feb 2025 15:40:29 +0800
Subject: [PATCH 2/5] coresight: add coresight Trace NOC driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250221-trace-noc-driver-v1-2-0a23fc643217@quicinc.com>
References: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
In-Reply-To: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740123657; l=9473;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=g52m5IvG8gp3U3z1mHKbBv/3s1N15QOP2Ld1DtqPUDQ=;
 b=N2iv/icTkowNxxmB52q8wJBb30vaPb/EyMX7YLQl137QpZsM7fJJHPNgvG7mpiGqomf+JfuOc
 IHzgNzuK9whCAsvCTT/QmFTDOmYDJjxfNzkz6sretkw1WJ2RhGunSa+
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DaSibeCbOTNpAihWEPFE4J6P44wQ00y-
X-Proofpoint-GUID: DaSibeCbOTNpAihWEPFE4J6P44wQ00y-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210056

Add driver to support Coresight device Trace NOC(Network On Chip).
Trace NOC is an integration hierarchy which is a replacement of
Dragonlink configuration. It brings together debug components like
TPDA, funnel and interconnect Trace Noc.

It sits in the different subsystem of SOC and aggregates the trace
and transports to QDSS trace bus.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 drivers/hwtracing/coresight/Kconfig          |  10 ++
 drivers/hwtracing/coresight/Makefile         |   1 +
 drivers/hwtracing/coresight/coresight-tnoc.c | 191 +++++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.h |  53 ++++++++
 4 files changed, 255 insertions(+)

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 06f0a7594169c5f03ca5f893b7debd294587de78..712b2469e37610e6fc5f15cedb2535bf570f99aa 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -247,4 +247,14 @@ config CORESIGHT_DUMMY
 
 	  To compile this driver as a module, choose M here: the module will be
 	  called coresight-dummy.
+
+config CORESIGHT_TNOC
+	tristate "Coresight Trace Noc driver"
+	help
+	  This driver provides support for Trace NoC component.
+	  Trace NoC is a interconnect that is used to collect trace from
+	  various subsystems and transport it QDSS trace sink.It sits in
+	  the different tiles of SOC and aggregates the trace local to the
+	  tile and transports it another tile or to QDSS trace sink eventually.
+
 endif
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 4ba478211b318ea5305f9f98dda40a041759f09f..ab1cff8f027495fabe3872d52f8c0877e39f0ea8 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 		   coresight-cti-sysfs.o
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
+obj-$(CONFIG_CORESIGHT_TNOC) += coresight-tnoc.o
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
new file mode 100644
index 0000000000000000000000000000000000000000..11b9a7fd1efdc9fff7c1e9666bda14acb41786cb
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/amba/bus.h>
+#include <linux/io.h>
+#include <linux/coresight.h>
+#include <linux/of.h>
+
+#include "coresight-priv.h"
+#include "coresight-tnoc.h"
+#include "coresight-trace-id.h"
+
+static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
+{
+	u32 val;
+
+	/* Set ATID */
+	writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
+
+	/* Config sync CR */
+	writel_relaxed(0xffff, drvdata->base + TRACE_NOC_SYNCR);
+
+	/* Set frequency value */
+	writel_relaxed(drvdata->freq_req_val, drvdata->base + TRACE_NOC_FREQVAL);
+
+	/* Set Ctrl register */
+	val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
+
+	if (drvdata->flag_type == FLAG_TS)
+		val = val | TRACE_NOC_CTRL_FLAGTYPE;
+	else
+		val = val & ~TRACE_NOC_CTRL_FLAGTYPE;
+
+	if (drvdata->freq_type == FREQ_TS)
+		val = val | TRACE_NOC_CTRL_FREQTYPE;
+	else
+		val = val & ~TRACE_NOC_CTRL_FREQTYPE;
+
+	val = val | TRACE_NOC_CTRL_PORTEN;
+	writel_relaxed(val, drvdata->base + TRACE_NOC_CTRL);
+
+	dev_dbg(drvdata->dev, "Trace NOC is enabled\n");
+}
+
+static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
+			    struct coresight_connection *outport)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	spin_lock(&drvdata->spinlock);
+	if (csdev->refcnt == 0)
+		trace_noc_enable_hw(drvdata);
+
+	csdev->refcnt++;
+	spin_unlock(&drvdata->spinlock);
+
+	return 0;
+}
+
+static void trace_noc_disable_hw(struct trace_noc_drvdata *drvdata)
+{
+	writel_relaxed(0x0, drvdata->base + TRACE_NOC_CTRL);
+	dev_dbg(drvdata->dev, "Trace NOC is disabled\n");
+}
+
+static void trace_noc_disable(struct coresight_device *csdev, struct coresight_connection *inport,
+			      struct coresight_connection *outport)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	spin_lock(&drvdata->spinlock);
+	if (--csdev->refcnt == 0)
+		trace_noc_disable_hw(drvdata);
+
+	spin_unlock(&drvdata->spinlock);
+	dev_info(drvdata->dev, "Trace NOC is disabled\n");
+}
+
+static const struct coresight_ops_link trace_noc_link_ops = {
+	.enable		= trace_noc_enable,
+	.disable	= trace_noc_disable,
+};
+
+static const struct coresight_ops trace_noc_cs_ops = {
+	.link_ops	= &trace_noc_link_ops,
+};
+
+static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
+{
+	int atid;
+
+	atid = coresight_trace_id_get_system_id();
+	if (atid < 0)
+		return atid;
+
+	drvdata->atid = atid;
+
+	drvdata->freq_type = FREQ_TS;
+	drvdata->flag_type = FLAG;
+	drvdata->freq_req_val = 0;
+
+	return 0;
+}
+
+static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct coresight_platform_data *pdata;
+	struct trace_noc_drvdata *drvdata;
+	struct coresight_desc desc = { 0 };
+	int ret;
+
+	desc.name = coresight_alloc_device_name(&trace_noc_devs, dev);
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
+	ret = trace_noc_init_default_data(drvdata);
+	if (ret)
+		return ret;
+
+	desc.ops = &trace_noc_cs_ops;
+	desc.type = CORESIGHT_DEV_TYPE_LINK;
+	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
+	desc.pdata = adev->dev.platform_data;
+	desc.dev = &adev->dev;
+	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev))
+		return PTR_ERR(drvdata->csdev);
+
+	pm_runtime_put(&adev->dev);
+
+	dev_dbg(drvdata->dev, "Trace Noc initialized\n");
+	return 0;
+}
+
+static void trace_noc_remove(struct amba_device *adev)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
+
+	coresight_trace_id_put_system_id(drvdata->atid);
+	coresight_unregister(drvdata->csdev);
+}
+
+static struct amba_id trace_noc_ids[] = {
+	{
+		.id     = 0x000f0c00,
+		.mask   = 0x000fff00,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(amba, trace_noc_ids);
+
+static struct amba_driver trace_noc_driver = {
+	.drv = {
+		.name   = "coresight-trace-noc",
+		.owner	= THIS_MODULE,
+		.suppress_bind_attrs = true,
+	},
+	.probe          = trace_noc_probe,
+	.remove		= trace_noc_remove,
+	.id_table	= trace_noc_ids,
+};
+
+module_amba_driver(trace_noc_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Trace NOC driver");
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.h b/drivers/hwtracing/coresight/coresight-tnoc.h
new file mode 100644
index 0000000000000000000000000000000000000000..b6bd1ef659897d8e0994c5e8514e8cbdd16eebd8
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tnoc.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define TRACE_NOC_CTRL	0x008
+#define TRACE_NOC_XLD	0x010
+#define TRACE_NOC_FREQVAL	0x018
+#define TRACE_NOC_SYNCR	0x020
+
+/* Enable generation of output ATB traffic.*/
+#define TRACE_NOC_CTRL_PORTEN	BIT(0)
+/* Writing 1 to issue a FREQ or FREQ_TS packet*/
+#define TRACE_NOC_CTRL_FREQTSREQ	BIT(5)
+/* Sets the type of issued ATB FLAG packets. 0: 'FLAG' packets; 1: 'FLAG_TS' packets.*/
+#define TRACE_NOC_CTRL_FLAGTYPE		BIT(7)
+/* sets the type of issued ATB FREQ packets. 0: 'FREQ' packets; 1: 'FREQ_TS' packets.*/
+#define TRACE_NOC_CTRL_FREQTYPE		BIT(8)
+DEFINE_CORESIGHT_DEVLIST(trace_noc_devs, "traceNoc");
+
+/**
+ * struct trace_noc_drvdata - specifics associated to a trace noc component
+ * @base:	memory mapped base address for this component.
+ * @dev:	device node for trace_noc_drvdata.
+ * @csdev:	component vitals needed by the framework.
+ * @spinlock:	only one at a time pls.
+ * @atid:	id for the trace packet.
+ * @freqtype:	0: 'FREQ' packets; 1: 'FREQ_TS' packets.
+ * @flagtype:	0: 'FLAG' packets; 1: 'FLAG_TS' packets.
+ * @freq_req_val:	 set frequency values carried by 'FREQ' and 'FREQ_TS' packets.
+ */
+struct trace_noc_drvdata {
+	void __iomem		*base;
+	struct device		*dev;
+	struct coresight_device	*csdev;
+	spinlock_t		spinlock; /* lock for the drvdata. */
+	u32			atid;
+	u32			freq_type;
+	u32			flag_type;
+	u32			freq_req_val;
+};
+
+/* freq type */
+enum freq_type {
+	FREQ,
+	FREQ_TS,
+};
+
+/* flag type */
+enum flag_type {
+	FLAG,
+	FLAG_TS,
+};

-- 
2.34.1


