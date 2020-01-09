Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86ED8136249
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2020 22:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbgAIVMr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jan 2020 16:12:47 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:56333 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728377AbgAIVMr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jan 2020 16:12:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578604367; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=JNgRjcmChvZ4QnFlDb23tcn/T8NnCfPfNYWt6YVHykE=; b=wHiGAHrpe7txP9FhermI4+CSrQ8DyQoU0revOvTUm9koTXb6vpcQeAM2WSE3Z6f0wEM3Jkc3
 YTg2Z/OTJ038eGvjOgGbKye8cKr6UqXBpp0LpPo0c6s8pVBrlN+EgxeJaXkqbjnYYwhTA0ip
 D10nyVCCMgYF2rdZDVaq26xO1DM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e17974b.7f6b78572298-smtp-out-n03;
 Thu, 09 Jan 2020 21:12:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 96DF9C447A5; Thu,  9 Jan 2020 21:12:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8F6B6C433CB;
        Thu,  9 Jan 2020 21:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8F6B6C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     robh+dt@kernel.org, georgi.djakov@linaro.org, evgreen@chromium.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        daidavid1@codeaurora.org, saravanak@google.com,
        viresh.kumar@linaro.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 2/4] interconnect: qcom: Add OSM L3 interconnect provider support
Date:   Fri, 10 Jan 2020 02:42:13 +0530
Message-Id: <20200109211215.18930-3-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20200109211215.18930-1-sibis@codeaurora.org>
References: <20200109211215.18930-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On some Qualcomm SoCs, Operating State Manager (OSM) controls the
resources of scaling L3 caches. Add a driver to handle bandwidth
requests to OSM L3 from CPU on SDM845 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/interconnect/qcom/Kconfig  |   7 +
 drivers/interconnect/qcom/Makefile |   2 +
 drivers/interconnect/qcom/osm-l3.c | 267 +++++++++++++++++++++++++++++
 3 files changed, 276 insertions(+)
 create mode 100644 drivers/interconnect/qcom/osm-l3.c

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index a9bbbdf7400f9..b94d28e7bf700 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -14,6 +14,13 @@ config INTERCONNECT_QCOM_MSM8974
 	 This is a driver for the Qualcomm Network-on-Chip on msm8974-based
 	 platforms.
 
+config INTERCONNECT_QCOM_OSM_L3
+	tristate "Qualcomm OSM L3 interconnect driver"
+	depends on INTERCONNECT_QCOM || COMPILE_TEST
+	help
+	  Say y here to support the Operating State Manager (OSM) interconnect
+	  driver which controls the scaling of L3 caches on Qualcomm SoCs.
+
 config INTERCONNECT_QCOM_QCS404
 	tristate "Qualcomm QCS404 interconnect driver"
 	depends on INTERCONNECT_QCOM
diff --git a/drivers/interconnect/qcom/Makefile b/drivers/interconnect/qcom/Makefile
index 55ec3c5c89dbd..89fecbd1257c7 100644
--- a/drivers/interconnect/qcom/Makefile
+++ b/drivers/interconnect/qcom/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
+icc-osm-l3-objs				:= osm-l3.o
 qnoc-msm8974-objs			:= msm8974.o
 qnoc-qcs404-objs			:= qcs404.o
 qnoc-sc7180-objs			:= sc7180.o
@@ -12,6 +13,7 @@ icc-smd-rpm-objs			:= smd-rpm.o
 obj-$(CONFIG_INTERCONNECT_QCOM_BCM_VOTER) += icc-bcm-voter.o
 obj-$(CONFIG_INTERCONNECT_QCOM_MSM8916) += qnoc-msm8916.o
 obj-$(CONFIG_INTERCONNECT_QCOM_MSM8974) += qnoc-msm8974.o
+obj-$(CONFIG_INTERCONNECT_QCOM_OSM_L3) += icc-osm-l3.o
 obj-$(CONFIG_INTERCONNECT_QCOM_QCS404) += qnoc-qcs404.o
 obj-$(CONFIG_INTERCONNECT_QCOM_RPMH) += icc-rpmh.o
 obj-$(CONFIG_INTERCONNECT_QCOM_SC7180) += qnoc-sc7180.o
diff --git a/drivers/interconnect/qcom/osm-l3.c b/drivers/interconnect/qcom/osm-l3.c
new file mode 100644
index 0000000000000..7fde53c70081e
--- /dev/null
+++ b/drivers/interconnect/qcom/osm-l3.c
@@ -0,0 +1,267 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ *
+ */
+
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/interconnect-provider.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#define LUT_MAX_ENTRIES			40U
+#define LUT_SRC				GENMASK(31, 30)
+#define LUT_L_VAL			GENMASK(7, 0)
+#define LUT_ROW_SIZE			32
+#define CLK_HW_DIV			2
+
+/* Register offsets */
+#define REG_ENABLE			0x0
+#define REG_FREQ_LUT			0x110
+#define REG_PERF_STATE			0x920
+
+#define OSM_L3_MAX_LINKS		1
+#define SDM845_MAX_RSC_NODES		130
+
+#define to_qcom_provider(_provider) \
+	container_of(_provider, struct qcom_osm_l3_icc_provider, provider)
+
+enum {
+	SDM845_MASTER_OSM_L3_APPS = SDM845_MAX_RSC_NODES + 1,
+	SDM845_SLAVE_OSM_L3,
+};
+
+struct qcom_osm_l3_icc_provider {
+	void __iomem *base;
+	unsigned int max_state;
+	unsigned long lut_tables[LUT_MAX_ENTRIES];
+	struct icc_provider provider;
+};
+
+/**
+ * struct qcom_icc_node - Qualcomm specific interconnect nodes
+ * @name: the node name used in debugfs
+ * @links: an array of nodes where we can go next while traversing
+ * @id: a unique node identifier
+ * @num_links: the total number of @links
+ * @buswidth: width of the interconnect between a node and the bus
+ */
+struct qcom_icc_node {
+	const char *name;
+	u16 links[OSM_L3_MAX_LINKS];
+	u16 id;
+	u16 num_links;
+	u16 buswidth;
+};
+
+struct qcom_icc_desc {
+	struct qcom_icc_node **nodes;
+	size_t num_nodes;
+};
+
+#define DEFINE_QNODE(_name, _id, _buswidth, ...)			\
+		static struct qcom_icc_node _name = {			\
+		.name = #_name,						\
+		.id = _id,						\
+		.buswidth = _buswidth,					\
+		.num_links = ARRAY_SIZE(((int[]){ __VA_ARGS__ })),	\
+		.links = { __VA_ARGS__ },				\
+	}
+
+DEFINE_QNODE(sdm845_osm_apps_l3, SDM845_MASTER_OSM_L3_APPS, 16, SDM845_SLAVE_OSM_L3);
+DEFINE_QNODE(sdm845_osm_l3, SDM845_SLAVE_OSM_L3, 16);
+
+static struct qcom_icc_node *sdm845_osm_l3_nodes[] = {
+	[MASTER_OSM_L3_APPS] = &sdm845_osm_apps_l3,
+	[SLAVE_OSM_L3] = &sdm845_osm_l3,
+};
+
+static struct qcom_icc_desc sdm845_icc_osm_l3 = {
+	.nodes = sdm845_osm_l3_nodes,
+	.num_nodes = ARRAY_SIZE(sdm845_osm_l3_nodes),
+};
+
+static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
+{
+	struct qcom_osm_l3_icc_provider *qp;
+	struct icc_provider *provider;
+	struct qcom_icc_node *qn;
+	struct icc_node *n;
+	unsigned int index;
+	u32 agg_peak = 0;
+	u32 agg_avg = 0;
+	u64 rate;
+
+	qn = src->data;
+	provider = src->provider;
+	qp = to_qcom_provider(provider);
+
+	list_for_each_entry(n, &provider->nodes, node_list)
+		provider->aggregate(n, 0, n->avg_bw, n->peak_bw,
+				    &agg_avg, &agg_peak);
+
+	rate = max(agg_avg, agg_peak);
+	rate = icc_units_to_bps(rate);
+	do_div(rate, qn->buswidth);
+
+	for (index = 0; index < qp->max_state - 1; index++) {
+		if (qp->lut_tables[index] >= rate)
+			break;
+	}
+
+	writel_relaxed(index, qp->base + REG_PERF_STATE);
+
+	return 0;
+}
+
+static int qcom_osm_l3_remove(struct platform_device *pdev)
+{
+	struct qcom_osm_l3_icc_provider *qp = platform_get_drvdata(pdev);
+
+	icc_nodes_remove(&qp->provider);
+	return icc_provider_del(&qp->provider);
+}
+
+static int qcom_osm_l3_probe(struct platform_device *pdev)
+{
+	u32 info, src, lval, i, prev_freq = 0, freq;
+	static unsigned long hw_rate, xo_rate;
+	struct qcom_osm_l3_icc_provider *qp;
+	const struct qcom_icc_desc *desc;
+	struct icc_onecell_data *data;
+	struct icc_provider *provider;
+	struct qcom_icc_node **qnodes;
+	struct icc_node *node;
+	size_t num_nodes;
+	struct clk *clk;
+	int ret;
+
+	clk = clk_get(&pdev->dev, "xo");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	xo_rate = clk_get_rate(clk);
+	clk_put(clk);
+
+	clk = clk_get(&pdev->dev, "alternate");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	hw_rate = clk_get_rate(clk) / CLK_HW_DIV;
+	clk_put(clk);
+
+	qp = devm_kzalloc(&pdev->dev, sizeof(*qp), GFP_KERNEL);
+	if (!qp)
+		return -ENOMEM;
+
+	qp->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(qp->base))
+		return PTR_ERR(qp->base);
+
+	/* HW should be in enabled state to proceed */
+	if (!(readl_relaxed(qp->base + REG_ENABLE) & 0x1)) {
+		dev_err(&pdev->dev, "error hardware not enabled\n");
+		return -ENODEV;
+	}
+
+	for (i = 0; i < LUT_MAX_ENTRIES; i++) {
+		info = readl_relaxed(qp->base + REG_FREQ_LUT +
+				     i * LUT_ROW_SIZE);
+		src = FIELD_GET(LUT_SRC, info);
+		lval = FIELD_GET(LUT_L_VAL, info);
+		if (src)
+			freq = xo_rate * lval;
+		else
+			freq = hw_rate;
+
+		/* Two of the same frequencies signify end of table */
+		if (i > 0 && prev_freq == freq)
+			break;
+
+		dev_dbg(&pdev->dev, "index=%d freq=%d\n", i, freq);
+
+		qp->lut_tables[i] = freq;
+		prev_freq = freq;
+	}
+	qp->max_state = i;
+
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
+	qnodes = desc->nodes;
+	num_nodes = desc->num_nodes;
+
+	data = devm_kcalloc(&pdev->dev, num_nodes, sizeof(*node), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	provider = &qp->provider;
+	provider->dev = &pdev->dev;
+	provider->set = qcom_icc_set;
+	provider->aggregate = icc_std_aggregate;
+	provider->xlate = of_icc_xlate_onecell;
+	INIT_LIST_HEAD(&provider->nodes);
+	provider->data = data;
+
+	ret = icc_provider_add(provider);
+	if (ret) {
+		dev_err(&pdev->dev, "error adding interconnect provider\n");
+		return ret;
+	}
+
+	for (i = 0; i < num_nodes; i++) {
+		size_t j;
+
+		node = icc_node_create(qnodes[i]->id);
+		if (IS_ERR(node)) {
+			ret = PTR_ERR(node);
+			goto err;
+		}
+
+		node->name = qnodes[i]->name;
+		node->data = qnodes[i];
+		icc_node_add(node, provider);
+
+		dev_dbg(&pdev->dev, "registered node %p %s %d\n", node,
+			qnodes[i]->name, node->id);
+
+		for (j = 0; j < qnodes[i]->num_links; j++)
+			icc_link_create(node, qnodes[i]->links[j]);
+
+		data->nodes[i] = node;
+	}
+	data->num_nodes = num_nodes;
+
+	platform_set_drvdata(pdev, qp);
+
+	return ret;
+err:
+	qcom_osm_l3_remove(pdev);
+	return ret;
+}
+
+static const struct of_device_id osm_l3_of_match[] = {
+	{ .compatible = "qcom,sdm845-osm-l3", .data = &sdm845_icc_osm_l3 },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, osm_l3_of_match);
+
+static struct platform_driver osm_l3_driver = {
+	.probe = qcom_osm_l3_probe,
+	.remove = qcom_osm_l3_remove,
+	.driver = {
+		.name = "osm-l3",
+		.of_match_table = osm_l3_of_match,
+	},
+};
+module_platform_driver(osm_l3_driver);
+
+MODULE_DESCRIPTION("Qualcomm OSM L3 interconnect driver");
+MODULE_LICENSE("GPL v2");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
