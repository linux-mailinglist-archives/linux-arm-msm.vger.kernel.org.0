Return-Path: <linux-arm-msm+bounces-60930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB865AD4F39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 11:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD1354605E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 09:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B553C2566D2;
	Wed, 11 Jun 2025 09:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CZdxCNQK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E74254AE1;
	Wed, 11 Jun 2025 09:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632458; cv=none; b=Z3CmOe1Ct+dvaaymz5GREAXkY4Dzy8MSH04AvaJq4z13MiQjHF0DGKT/pcDhjmROzx64qDg1CRnR/PJnDxF6b2+RNTFTzM9UxPyGVXOVRUgXDdOKWti43TrgydXeUxFUBpYvGxMr9fVBnFEriiLchYPI/ImMe/hHf0i1CTw3FsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632458; c=relaxed/simple;
	bh=qGwNpH1nPkISzIrrF4+7NRMSzT4lX5oedrD5TFv4OCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=E4+Yxm4GVdectE4qHINUYd3kc5dyHBb4kiyzMM0k6T3d8wIoSo6PIpwHvo6Io2wCSJ/+B6MAVcR35zl5a+ZVRpmiVsFS/eexoPA+FRo57FWw9PW69O/kzM5pEsLc6jWzJTJ8dj5yTzqewl8/W6U41weDZoYq/4z8Lg+RyQfyPoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CZdxCNQK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B7qJhE010618;
	Wed, 11 Jun 2025 09:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/sEVYGPHMgstVe1vXwTRq2xATk23fiqrBWRAQJs1Y/k=; b=CZdxCNQKkhkQwP2Z
	hWWLIMzjFJYEIoDv4JBa/hJQg/p9t0Ey8EcrL79sFcijhWRmGOt6DGcpVNfpK7OG
	r2gswY0boSiKX1BSTATrU0Yhw0iKlHH7UaKaWz2vu4pbFzVCHVO6AepYzE5BRqoN
	GUjbzLpNX3SKif5LPIKDGIkFLVPO64bhDjMWkVII8ANpcayBhlMnJ/VdL8af9Vfd
	QXGQi/IhXfSq2QES3LC6LEzDLbokCVzdfXvIeRq879xp8w5qi2t5T+qScHlsk0R8
	iTQ/MJnWB9glRgU5TnCi9waw6mPnRjkC78eiP67mjpQ72ykgeeV36b6g50tJvx1p
	olNPfg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d124c10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 09:00:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55B90epU016919
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 09:00:40 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Jun 2025 02:00:37 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Wed, 11 Jun 2025 16:59:47 +0800
Subject: [PATCH v9 2/2] coresight: add coresight Trace Network On Chip
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250611-trace-noc-v9-2-4322d4cf8f4b@quicinc.com>
References: <20250611-trace-noc-v9-0-4322d4cf8f4b@quicinc.com>
In-Reply-To: <20250611-trace-noc-v9-0-4322d4cf8f4b@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749632429; l=11577;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=qGwNpH1nPkISzIrrF4+7NRMSzT4lX5oedrD5TFv4OCI=;
 b=epNGQHbx6WzzLXfaZIIVz98bz8gnt6NcB1hY424vdf7yyLT1M+0vQiovUG6pI9qDHpImo+xB2
 vxNJblpHPovBkpy7CgNBOA7G3hTrJcnbkDHEg8pfIwRs5880coIsN8Z
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 59eTzBpy_49KRZTP3cVPEL7sA5KhSB0K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA3NyBTYWx0ZWRfX26lJwmI/pOGP
 OcrE1EpPE2C2grQVWdVIo2fakaSMwWO8RshGPAF8UWB6i/lnqgzu25gOXm3ff0o6MRV1n4/wssr
 J7yyvWDN4vwB0QCkS5aT1vHJNXETjqmv8LYGNBYhu59hGqYITNXMgDHbYXxbIzS6NBeol0XnkKk
 Z68Jhle5zqPUS3GWW25YKxQqip9OkYj1GgCi/Ijo5mTYf4DkQdgfHufyZvf+ZaG7RwXF0H9We7s
 NDs0gatYjnk+jf85eW+7iI7NWNRJBdVOrDZOaXLERdm/nC9R9r2lEvNM6WXZ08R9QLdWtsNBRUi
 /TKrn0g6/zoASb1HEzwbrGDE3ViOj9wmXfZ+EN7lF4ysdVFYgRiyr9Grb7LQirwqMagDtlZslI6
 jpRxHjuWFAt735WewkCQP/g4WcHGI4N1BzvrkAtpK4JPw/aFQvRwcp5xfIumreF6hdMvJnq4
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=684945b9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=kfjrt-ETKUMyBX4eaP0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 59eTzBpy_49KRZTP3cVPEL7sA5KhSB0K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_03,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110077

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
 drivers/hwtracing/coresight/coresight-tnoc.c | 242 +++++++++++++++++++++++++++
 3 files changed, 256 insertions(+)

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
index 0000000000000000000000000000000000000000..ac0b165f8742aaa8b6f6ed81d75eb75a81a85e39
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -0,0 +1,242 @@
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
+static ssize_t traceid_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	unsigned long val;
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	val = drvdata->atid;
+	return sprintf(buf, "%#lx\n", val);
+}
+static DEVICE_ATTR_RO(traceid);
+
+static struct attribute *coresight_tnoc_attrs[] = {
+	&dev_attr_traceid.attr,
+	NULL,
+};
+
+static const struct attribute_group coresight_tnoc_group = {
+	.attrs = coresight_tnoc_attrs,
+};
+
+static const struct attribute_group *coresight_tnoc_groups[] = {
+	&coresight_tnoc_group,
+	NULL,
+};
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
+	desc.groups = coresight_tnoc_groups;
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


