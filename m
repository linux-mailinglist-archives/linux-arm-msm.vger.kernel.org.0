Return-Path: <linux-arm-msm+bounces-53961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2F8A85727
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 10:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 266684C4F8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 08:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC99B2980AD;
	Fri, 11 Apr 2025 08:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I5ZuB4E0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48A22980A7;
	Fri, 11 Apr 2025 08:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744361925; cv=none; b=UZXEqrxBq60bDV3Es68lrqfY7nWLj8iK83qtcqRf4ze+sg1SiBNJvldgD8bfbW6YvysItdFdE6Wwwc6CkbWqqNQezL7Vkw5CN0zf2UYRLOaoRgcWzbdD3mXY8cYGJshwi9QJCauEjjFVFmhVs7bBTKQ5RcoszmN43iEoIbAc7Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744361925; c=relaxed/simple;
	bh=UNjRYCXQ8qKR6bSuUCvh/gTpL3SzBm2P2PDNpLUQaf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AuxQqu/sEH0MlkmRZyTmJUu7zjb7bvKMaw3b8w+U/xwC6n+P5zL0yoRN8xnZ4kbrk9Q9jWPIAL1xgaDxDCw8vPR7aB19izdkGxZ2zKsjeClK+C1evSA42y/0zkoJKQb3+BaRo+DNha8Vg3QXuFNN3Wqrb6DFrlcTXDqt5W3Vhjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I5ZuB4E0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B4tQLP018607;
	Fri, 11 Apr 2025 08:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+MuQaQb1kIjk/T1YlTlQfZIFM6u/aesoucWAPpvU0Q=; b=I5ZuB4E0O3PVpH7B
	nYSWdHrS/tZxOydxXxG5w7f5rBfejawNzywzjMpcKEJm9J7YKOCQY4VMLFrsLj+n
	LQSizYKnzph8N6v0sqTQ3tPf3ys4CGDYnGMwczP373BS8jnCTA5tIOUlh3NmhunL
	flT7gc64EOtnISZ9+TBei/DeLHNxNS9wRbEZxEFTR/2HteDHupy5OTShwYMuv1IE
	fD+VqRkzKbXxhxtrBun9Xtvh4FPeRPfHE9PcNJ3PJ316puZbN/yi4UzGXPd3oMrQ
	XxBVWynSi+XhK3EmhIUJhBorW4DyGhZpAJf2On/KiqoNrkmZRPPa0/R4HLhRezYL
	ggxItQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgt0kg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 08:58:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53B8wUiM005917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 08:58:30 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Apr 2025 01:58:26 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Fri, 11 Apr 2025 16:57:53 +0800
Subject: [PATCH v3 2/2] coresight: add coresight Trace Network On Chip
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250411-trace-noc-v3-2-1f19ddf7699b@quicinc.com>
References: <20250411-trace-noc-v3-0-1f19ddf7699b@quicinc.com>
In-Reply-To: <20250411-trace-noc-v3-0-1f19ddf7699b@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Yuanfang Zhang
	<quic_yuanfang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744361899; l=11341;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=UNjRYCXQ8qKR6bSuUCvh/gTpL3SzBm2P2PDNpLUQaf0=;
 b=pv83AHYoGNUtdsyid24M9nbRFxoLOo1L1J8mgmAOQbFz5/sQ80A7Z7is2tgaEJ1LS1g3vd+RM
 QinYuhPFtBYBS3DzUQpOdxRxoegz+nZsI8+q9BO/hYDJ5oa3A+xDKKL
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f8d9b7 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=kfjrt-ETKUMyBX4eaP0A:9 a=QEXdDO2ut3YA:10
 a=RVmHIydaz68A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8OpCGyOo_H4zS5miOpKbVJdhB7REALwi
X-Proofpoint-GUID: 8OpCGyOo_H4zS5miOpKbVJdhB7REALwi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110049

Add a driver to support Coresight device Trace Network On Chip (TNOC),
which is an integration hierarchy integrating functionalities of TPDA
and funnels. It aggregates the trace and transports to coresight trace
bus.

Compared to current configuration, it has the following advantages:
1. Reduce wires between subsystems.
2. Continue cleaning the infrastructure.
3. Reduce Data overhead by transporting raw data from source to target.

  +------------------------+                +-------------------------+
  | Video Subsystem        |                |Video Subsystem          |
  |       +-------------+  |                |       +------------+    |
  |       | Video TPDM  |  |                |       | Video TPDM |    |
  |       +-------------+  |                |       +------------+    |
  |            |           |                |              |          |
  |            v           |                |              v          |
  |   +---------------+    |                |        +-----------+    |
  |   | Video funnel  |    |                |        |Video TNOC |    |
  |   +---------------+    |                |        +-----------+    |
  +------------|-----------+                +------------|------------+
               |                                         |
               v-----+                                   |
+--------------------|---------+                         |
|  Multimedia        v         |                         |
|  Subsystem   +--------+      |                         |
|              |  TPDA  |      |                         v
|              +----|---+      |              +---------------------+
|                   |          |              |   Aggoregator TNOC  |
|                   |          |              +----------|----------+
|                   +--        |                         |
|                     |        |                         |
|                     |        |                         |
|              +------v-----+  |                         |
|              |  Funnel    |  |                         |
|              +------------+  |                         |
+----------------|-------------+                         |
                 |                                       |
                 v                                       v
      +--------------------+                    +------------------+
      |   Coresight Sink   |                    |  Coresight Sink  |
      +--------------------+                    +------------------+

       Current Configuration                            TNOC

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 drivers/hwtracing/coresight/Kconfig          |  13 ++
 drivers/hwtracing/coresight/Makefile         |   1 +
 drivers/hwtracing/coresight/coresight-tnoc.c | 186 +++++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.h |  34 +++++
 4 files changed, 234 insertions(+)

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index ecd7086a5b83e86b6bc8ea039d6d26a628334ed3..f20600d58f38568f8178f69d3f678c2df2cbca7e 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -259,4 +259,17 @@ config CORESIGHT_DUMMY
 
 	  To compile this driver as a module, choose M here: the module will be
 	  called coresight-dummy.
+
+config CORESIGHT_TNOC
+	tristate "Coresight Trace Network On Chip driver"
+	help
+	  This driver provides support for Trace Network On Chip (TNOC) component.
+	  TNOC is an interconnect used to collect traces from various subsystems
+	  and transport to a coresight trace sink. It sits in the different
+	  tiles of SOC and aggregates the trace local to the tile and transports
+	  it another tile or to coresight trace sink eventually.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called coresight-tnoc.
+
 endif
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 8e62c3150aebd1e82b445fafc97a0a9b44397b0e..880e9ed6bfe9c711492c6a2cd972751f56dd8010 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_CORESIGHT_SINK_TPIU) += coresight-tpiu.o
 obj-$(CONFIG_CORESIGHT_SINK_ETBV10) += coresight-etb10.o
 obj-$(CONFIG_CORESIGHT_LINKS_AND_SINKS) += coresight-funnel.o \
 					   coresight-replicator.o
+obj-$(CONFIG_CORESIGHT_TNOC) += coresight-tnoc.o
 obj-$(CONFIG_CORESIGHT_SOURCE_ETM3X) += coresight-etm3x.o
 coresight-etm3x-y := coresight-etm3x-core.o coresight-etm-cp14.o \
 		     coresight-etm3x-sysfs.o
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
new file mode 100644
index 0000000000000000000000000000000000000000..2ec4ead892f0166a3e84f777679c0f73f5da0e83
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+ #include <linux/amba/bus.h>
+ #include <linux/coresight.h>
+ #include <linux/device.h>
+ #include <linux/io.h>
+ #include <linux/kernel.h>
+ #include <linux/module.h>
+ #include <linux/of.h>
+ #include <linux/platform_device.h>
+
+#include "coresight-priv.h"
+#include "coresight-tnoc.h"
+#include "coresight-trace-id.h"
+
+DEFINE_CORESIGHT_DEVLIST(trace_noc_devs, "traceNoc");
+
+static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
+{
+	u32 val;
+
+	/* Set ATID */
+	writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
+
+	/* Config sync CR */
+	writel_relaxed(TRACE_NOC_SYN_VAL, drvdata->base + TRACE_NOC_SYNCR);
+
+	/* Set Ctrl register */
+	val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
+
+	val = val & ~TRACE_NOC_CTRL_FLAGTYPE;
+	val = val | TRACE_NOC_CTRL_FREQTYPE;
+	val = val | TRACE_NOC_CTRL_PORTEN;
+
+	writel(val, drvdata->base + TRACE_NOC_CTRL);
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
+	dev_dbg(drvdata->dev, "Trace NOC is enabled\n");
+	return 0;
+}
+
+static void trace_noc_disable_hw(struct trace_noc_drvdata *drvdata)
+{
+	writel(0x0, drvdata->base + TRACE_NOC_CTRL);
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
+	dev_dbg(drvdata->dev, "Trace NOC is disabled\n");
+}
+
+static int trace_noc_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
+			__maybe_unused struct coresight_device *sink)
+{
+	struct trace_noc_drvdata *drvdata;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	return drvdata->atid;
+}
+
+static const struct coresight_ops_link trace_noc_link_ops = {
+	.enable		= trace_noc_enable,
+	.disable	= trace_noc_disable,
+};
+
+static const struct coresight_ops trace_noc_cs_ops = {
+	.trace_id	= trace_noc_id,
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
index 0000000000000000000000000000000000000000..1291a153412c1c92be530cffe25fb56c2fca0395
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tnoc.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define TRACE_NOC_CTRL      0x008
+#define TRACE_NOC_XLD       0x010
+#define TRACE_NOC_FREQVAL   0x018
+#define TRACE_NOC_SYNCR     0x020
+
+/* Enable generation of output ATB traffic.*/
+#define TRACE_NOC_CTRL_PORTEN   BIT(0)
+/* Sets the type of issued ATB FLAG packets.*/
+#define TRACE_NOC_CTRL_FLAGTYPE BIT(7)
+/* Sets the type of issued ATB FREQ packet*/
+#define TRACE_NOC_CTRL_FREQTYPE BIT(8)
+
+#define TRACE_NOC_SYN_VAL	0xFFFF
+
+/*
+ * struct trace_noc_drvdata - specifics associated to a trace noc component
+ * @base:	memory mapped base address for this component.
+ * @dev:	device node for trace_noc_drvdata.
+ * @csdev:	component vitals needed by the framework.
+ * @spinlock:	only one at a time pls.
+ * @atid:	id for the trace packet.
+ */
+struct trace_noc_drvdata {
+	void __iomem		*base;
+	struct device		*dev;
+	struct coresight_device	*csdev;
+	spinlock_t		spinlock; /* lock for the drvdata. */
+	u32			atid;
+};

-- 
2.34.1


