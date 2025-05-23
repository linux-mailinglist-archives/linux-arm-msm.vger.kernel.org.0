Return-Path: <linux-arm-msm+bounces-59191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1DCAC1F7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 11:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8382188FC8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 09:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28FF226CF5;
	Fri, 23 May 2025 09:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iB9EGfOl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983BF22423A;
	Fri, 23 May 2025 09:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747991530; cv=none; b=U5cp4+N+mv6n6Csx6xjy9ES4zBLxskd+4uXUWKF2T9QqDUEo/wdfgB9aXuFpk1sVf18vYr5M2HoBiKNvwoloPsstx5B1+B6RmYqBSSWlFXEdMd9pXaPM51hhSKqLX17DFY9jXI0Z5fd9cdidJydu8hiUptc1zFizgJLE+FQJ7cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747991530; c=relaxed/simple;
	bh=44ui6r67zCLy3VdQnSKlC/YRZu34lYRGC6qo8VzDHSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Duw7C+5a9CQ3O2iy3INHrZuxhdParWNtoGIL/1dI2l8zcvEGFvNAdhq5znZVHuJqkziV9X2M8Uu5odIZEa5mReeQtAjZgxV5NZYcOx7eSSWTDIOsLZ1msUYhImK6C8HEC9fVh3WjVGAj6ZEscOmAzcM1jG1QDOXcwiWsss/wAp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iB9EGfOl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N5aRqN027699;
	Fri, 23 May 2025 09:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kVnD+QB8CWcuXdADLeN4LUwe+WTB8F/kiIOpzpVrVOk=; b=iB9EGfOlFIZoxZ4S
	k9DKcLR3URTsr673WyHjZ63WT2cLVGpxaJpUEyzInnTvzjmLMOQqYpF7DRnEKw3+
	AE99tyxVJajQ38NWYgL1z++chDyPZjAUWIFIMeJNwRwTMR/G7SZ6uPa0qV8yh11m
	6MVa04r8q4j9LXnby/lU2mO7NrbMhiVs2jrUmaF5GweOPt9ldJlyDGCFx9LpGLTj
	IHZ8kPqU95fn3QHVaq+MYvmbZIXgwN2IYh7lGrafA3l4JAkCaPSpKLtIS0fRe7UF
	aCCbSwrSb1s1KxwP9ZCP++n6GY6Jvuk2iYb7VJIMh9hVmJXqFwJ/e+uQ9JBdtql2
	Ht+biA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9hbap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 09:11:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54N9BoaW007259
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 09:11:50 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 23 May 2025 02:11:47 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Fri, 23 May 2025 17:11:00 +0800
Subject: [PATCH v7 2/2] coresight: add coresight Trace Network On Chip
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250523-trace-noc-v7-2-d65edbab2997@quicinc.com>
References: <20250523-trace-noc-v7-0-d65edbab2997@quicinc.com>
In-Reply-To: <20250523-trace-noc-v7-0-d65edbab2997@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747991500; l=10921;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=44ui6r67zCLy3VdQnSKlC/YRZu34lYRGC6qo8VzDHSo=;
 b=9ttiOl7i+iPyqd5F3BuWLQyrb1hO0ppoB+JYA7o/+rO3gRLZHqACm1OKqetmR7Dj2sqbCRHIn
 80+kkVipHvhDt2W0rJzIHaB35RWykAWMda0iwrPzcMgin1qrjR9EsQ3
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hmu_eyByQftsEqEPFIhg43redK_aFLOS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA4MCBTYWx0ZWRfX7Lx9aujTBphO
 JtbOxwhYxXZhOvbiqJSm8axeAqN75eGMYvMK5lC8QALx1RKT7sLgyDpq/AY7UoffOQt2wZDdBPb
 0CCKxpYjVKMIQj02S5IELWO1i6b/WBh69lB6v7A9gZlb2vYc2S5vrpd0sJXQMNuh7/apz+zGW1U
 duclqBmQ2VJl+aHPZglru+fnEWPOcTlL/RY1j26tSFY+tea+AtwuJmciWZyt1tUfJAJXz+w2J+y
 ORjk28BOama4vqL9OITJkzf10kT0OV4/3lDX0leDA3WHmbOfg2mYPL5TnR2fhBPLpZqB8yBY8NE
 XjwI4IccWNNWW3ds6BfmY9iOIbXEvjV0qq2nlxjbtDkF4cgMj+aVdpPZYAwp2UBIX9DHFewhm9S
 eoEXSrs3GgNxxIraCT/G1o1tCmHVeQrqw+F1/t/eahrHIq/eO9YxAyMmBQGG7HfKXoDWMyZX
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=68303bd8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=Ivem3Sv-anQyGEoyHh8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hmu_eyByQftsEqEPFIhg43redK_aFLOS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230080

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
|                   |          |              |   Aggregator  TNOC  |
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
 drivers/hwtracing/coresight/coresight-tnoc.c | 216 +++++++++++++++++++++++++++
 3 files changed, 230 insertions(+)

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
index 0000000000000000000000000000000000000000..d130361fb1fc634181ae98499766ce015af9d22b
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -0,0 +1,216 @@
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
+#include "coresight-trace-id.h"
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
+#define TRACE_NOC_SYNC_INTERVAL	0xFFFF
+
+/*
+ * struct trace_noc_drvdata - specifics associated to a trace noc component
+ * @base:      memory mapped base address for this component.
+ * @dev:       device node for trace_noc_drvdata.
+ * @csdev:     component vitals needed by the framework.
+ * @spinlock:  serialize enable/disable operation.
+ * @atid:      id for the trace packet.
+ */
+struct trace_noc_drvdata {
+	void __iomem		*base;
+	struct device		*dev;
+	struct coresight_device	*csdev;
+	spinlock_t		spinlock;
+	u32			atid;
+};
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
+	/* Set the data word count between 'SYNC' packets */
+	writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
+
+	/* Set the Control register:
+	 * - Set the FLAG packets to 'FLAG' packets
+	 * - Set the FREQ packets to 'FREQ_TS' packets
+	 * - Enable generation of output ATB traffic
+	 */
+
+	val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
+
+	val &= ~TRACE_NOC_CTRL_FLAGTYPE;
+	val |= TRACE_NOC_CTRL_FREQTYPE;
+	val |= TRACE_NOC_CTRL_PORTEN;
+
+	writel(val, drvdata->base + TRACE_NOC_CTRL);
+}
+
+static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
+			    struct coresight_connection *outport)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	scoped_guard(spinlock, &drvdata->spinlock) {
+		if (csdev->refcnt == 0)
+			trace_noc_enable_hw(drvdata);
+
+		csdev->refcnt++;
+	}
+
+	dev_dbg(drvdata->dev, "Trace NOC is enabled\n");
+	return 0;
+}
+
+static void trace_noc_disable(struct coresight_device *csdev, struct coresight_connection *inport,
+			      struct coresight_connection *outport)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	scoped_guard(spinlock, &drvdata->spinlock) {
+		if (--csdev->refcnt == 0)
+			writel(0x0, drvdata->base + TRACE_NOC_CTRL);
+	}
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
+	if (IS_ERR(drvdata->csdev)) {
+		coresight_trace_id_put_system_id(drvdata->atid);
+		return PTR_ERR(drvdata->csdev);
+	}
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
+		.mask   = 0x00ffff00,
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

-- 
2.34.1


