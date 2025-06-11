Return-Path: <linux-arm-msm+bounces-60944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4C0AD524F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 12:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF1171883196
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 10:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BDCD2690CB;
	Wed, 11 Jun 2025 10:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bT661YHZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341DA282FA;
	Wed, 11 Jun 2025 10:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638602; cv=none; b=RMr/VnpzY899loaDCLuCo67uzETlrhIsv46iaSAZNdbJI05vMbx1Gi6BYnjKCgUFvZycZVEayp2ndel87L9eYW4xJwWmisjzHd48dCE84g77eiLHdfso1AzENshgCy/u0X1U9IQs38TAREpEoGDW9D+lqiG9B9WWm78xYQOzPAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638602; c=relaxed/simple;
	bh=0YjYh4pQ7DGNWTssTa6kMCXvLHpaTE+ZXVD0b7RTqTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AtyDv60BKIhguWoy85Hnq9R2GpcE+fVRfMp85wNgTiV4hLmafAQ0fKkFSyYvd8H6iMS2cyGopO5JEZnWTcneGeey+J7uwV4a8E8wfKNy+Jx1tajzL6A4IMWYf45LEYj7VjiavKoYJL8rvYHOOe2EkIRUosU7k3ddxRjfh5ZCEI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bT661YHZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DD0t029236;
	Wed, 11 Jun 2025 10:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	76kTfNbzTWTwTeo8IcvvYU6TMJiBE6QVDAJnFuxK3jE=; b=bT661YHZk/iTImsW
	kl9RHv6Hz8faCciuxluYUdwryftMbkHiT65PhVWAMKRmxuJuBUFJm3Zi5av45/nW
	0H3medRShiyEOjq8EV2oDa82AO64wiW9AqC12dN4QGj3OyZQTC3DdcaBphSiXFtu
	bfFVLda7RImqwpn3CvzkZzxknjrtGX7rLWJ33wYhIbVnrOnERQ4mk5Te4LhOiuek
	kFBjDAg94MY0q/rHO9/MuKbnKP6qjZvcHbWgDRgWNSldr/jLpYIZMhv3vBM+fygG
	pZQzhanpgvNRgsSJ//JueYv0ZI77wser9p4Y1oVPEE09U4U9EgD/g9LEZ47H1poU
	bsTo0g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6cktj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 10:43:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55BAh6kB019718
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 10:43:06 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Jun 2025 03:43:03 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Wed, 11 Jun 2025 18:42:22 +0800
Subject: [PATCH v10 2/2] coresight: add coresight Trace Network On Chip
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250611-trace-noc-v10-2-a83b5c63da34@quicinc.com>
References: <20250611-trace-noc-v10-0-a83b5c63da34@quicinc.com>
In-Reply-To: <20250611-trace-noc-v10-0-a83b5c63da34@quicinc.com>
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
	<quic_yuanfang@quicinc.com>, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749638575; l=11620;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=0YjYh4pQ7DGNWTssTa6kMCXvLHpaTE+ZXVD0b7RTqTE=;
 b=RlWmO9seXnQKe3nXmuEXyusV7a0ivcbJ4WTWJzVw/ReRSV9QoHtGlOLWzcTXXKbCOoGDxBbu3
 cGab0t/XT2jADGKwkudKxZW/zbBllpXU/wrY/MMUBKcqV+rsTjIfo+U
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5MSBTYWx0ZWRfXy3OqIkOVPKBb
 6ywa4Ohqs3uDfVQE+/q+X4fJRhXE4Xz1wA3ctKPrs1MYfr1P3R0tKL3oDhsmvq3A1+3Dwc6TV8K
 lleJhYtdgoDfbm+T9LWU5v+qCHZ7lP67pgEXvSnS/p/KwLpf+uwkDSLfWfDgu1NMW5HUDYH+CFj
 zDVjGhKqfhUivZxHAPvSlVMdlxutz87r0dLJ88x6moSjZVbBPFRaY4jURftiRCoGYmVAUwZwjum
 ff6skhfZPKu5uTEH0azNGpyVvp7sf9kNIJSWk7toHWFMOeW0z1tZLigCFULSOahNSpqq9judpay
 rs1gvHyYGvIef8IxD+Fv9kbMNp0fWzl24ZkJdgoR18spvW6eJyObNzRm4s5R+e9H7prVz30Lvd5
 1fVAwpps/V6eerFbLYZT/XUIOwUM2ytHQj1bnIorW39UHlMDpH7wTy3eN2c8COvsMD0Ps0aH
X-Proofpoint-GUID: Hvk2pt-sb4vv1j8Y9cluBSjQT-Rc_a0d
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=68495dbb cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=7CQSdrXTAAAA:8
 a=COk6AnOGAAAA:8 a=kfjrt-ETKUMyBX4eaP0A:9 a=QEXdDO2ut3YA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Hvk2pt-sb4vv1j8Y9cluBSjQT-Rc_a0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110091

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

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 drivers/hwtracing/coresight/Kconfig          |  12 ++
 drivers/hwtracing/coresight/Makefile         |   1 +
 drivers/hwtracing/coresight/coresight-tnoc.c | 242 +++++++++++++++++++++++++++
 3 files changed, 255 insertions(+)

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index f064e3d172b3d630515bb3a11450e883a6b5b4bf..6a4239ebb582e95f0ebe8e9c8738a726f27f60a1 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -268,4 +268,16 @@ config CORESIGHT_KUNIT_TESTS
 	    Enable Coresight unit tests. Only useful for development and not
 	    intended for production.
 
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
index 4e7cc3c5bf994d4066adc3b6c203edd19e88a823..ab16d06783a572ea1308dfb3a30c96df9e5ffdb7 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_CORESIGHT_SINK_TPIU) += coresight-tpiu.o
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


