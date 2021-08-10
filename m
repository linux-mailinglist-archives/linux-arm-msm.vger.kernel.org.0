Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B44323E5330
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 08:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237704AbhHJGBO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 02:01:14 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:40142 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237460AbhHJGBN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 02:01:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628575251; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=cYkF9ywcx5ZEtyyLfMT6ebb3xW6jeZHfkfbiC1Mm0Ug=; b=cF/eN66V976zIkYZ1PJgJpeQlCsCOfytJy1ykp6DKqjOwrxSjBOm1DZY8WCVIBdbss17lGNq
 88uEdhHgvnmTR3nVs6yQ3ongCT7D2hu07pgpalfLy27arptekdt4CoY3wrA/+M71HK0cD65J
 NaBv/oWDD490zXSMxtu4w8h9dUg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6112160766ff1079042d8dc7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 06:00:39
 GMT
Sender: okukatla=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ACA52C433D3; Tue, 10 Aug 2021 06:00:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from okukatla1-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: okukatla)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3EDC3C433D3;
        Tue, 10 Aug 2021 06:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3EDC3C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=okukatla@codeaurora.org
From:   Odelu Kukatla <okukatla@codeaurora.org>
To:     georgi.djakov@linaro.org, bjorn.andersson@linaro.org,
        evgreen@google.com, Andy Gross <agross@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     sboyd@kernel.org, mdtipton@codeaurora.org, sibis@codeaurora.org,
        saravanak@google.com, okukatla@codeaurora.org,
        seansw@qti.qualcomm.com, elder@linaro.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: [v5 2/3] interconnect: qcom: Add EPSS L3 support on SC7280
Date:   Tue, 10 Aug 2021 11:29:55 +0530
Message-Id: <1628575196-19975-3-git-send-email-okukatla@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628575196-19975-1-git-send-email-okukatla@codeaurora.org>
References: <1628575196-19975-1-git-send-email-okukatla@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Epoch Subsystem (EPSS) L3 interconnect provider support on
SC7280 SoCs.

Signed-off-by: Odelu Kukatla <okukatla@codeaurora.org>
---
 drivers/interconnect/qcom/osm-l3.c | 140 +++++++++++++++++++++++++++++++------
 drivers/interconnect/qcom/sc7280.h |  10 +++
 2 files changed, 127 insertions(+), 23 deletions(-)

diff --git a/drivers/interconnect/qcom/osm-l3.c b/drivers/interconnect/qcom/osm-l3.c
index c7af143..9042d31 100644
--- a/drivers/interconnect/qcom/osm-l3.c
+++ b/drivers/interconnect/qcom/osm-l3.c
@@ -9,12 +9,14 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 
 #include "sc7180.h"
+#include "sc7280.h"
 #include "sc8180x.h"
 #include "sdm845.h"
 #include "sm8150.h"
@@ -33,17 +35,33 @@
 
 /* EPSS Register offsets */
 #define EPSS_LUT_ROW_SIZE		4
+#define EPSS_REG_L3_VOTE		0x90
 #define EPSS_REG_FREQ_LUT		0x100
 #define EPSS_REG_PERF_STATE		0x320
+#define EPSS_CORE_OFFSET		0x4
+#define EPSS_L3_VOTE_REG(base, cpu)\
+			(((base) + EPSS_REG_L3_VOTE) +\
+			((cpu) * EPSS_CORE_OFFSET))
 
-#define OSM_L3_MAX_LINKS		1
+#define L3_DOMAIN_CNT		4
+#define L3_MAX_LINKS		9
 
 #define to_osm_l3_provider(_provider) \
 	container_of(_provider, struct qcom_osm_l3_icc_provider, provider)
 
+/**
+ * @domain_base: an array of base address for each clock domain
+ * @max_state: max supported frequency level
+ * @per_core_dcvs: flag used to indicate whether the frequency scaling
+ * for each core is enabled
+ * @reg_perf_state: requested frequency level
+ * @lut_tables: an array of supported frequency levels
+ * @provider: interconnect provider of this node
+ */
 struct qcom_osm_l3_icc_provider {
-	void __iomem *base;
+	void __iomem *domain_base[L3_DOMAIN_CNT];
 	unsigned int max_state;
+	bool per_core_dcvs;
 	unsigned int reg_perf_state;
 	unsigned long lut_tables[LUT_MAX_ENTRIES];
 	struct icc_provider provider;
@@ -56,32 +74,44 @@ struct qcom_osm_l3_icc_provider {
  * @id: a unique node identifier
  * @num_links: the total number of @links
  * @buswidth: width of the interconnect between a node and the bus
+ * @domain: clock domain of the cpu node
+ * @cpu: cpu instance within its clock domain
  */
 struct qcom_osm_l3_node {
 	const char *name;
-	u16 links[OSM_L3_MAX_LINKS];
+	u16 links[L3_MAX_LINKS];
 	u16 id;
 	u16 num_links;
 	u16 buswidth;
+	u8 domain;
+	u8 cpu;
 };
 
 struct qcom_osm_l3_desc {
 	const struct qcom_osm_l3_node **nodes;
 	size_t num_nodes;
+	bool per_core_dcvs;
 	unsigned int lut_row_size;
 	unsigned int reg_freq_lut;
 	unsigned int reg_perf_state;
 };
 
-#define DEFINE_QNODE(_name, _id, _buswidth, ...)			\
-	static const struct qcom_osm_l3_node _name = {			\
+#define __DEFINE_QNODE(_name, _id, _buswidth, _domain, _cpu, ...)	\
+	static const struct qcom_icc_node _name = {			\
 		.name = #_name,						\
 		.id = _id,						\
 		.buswidth = _buswidth,					\
+		.domain = _domain,					\
+		.cpu = _cpu,						\
 		.num_links = ARRAY_SIZE(((int[]){ __VA_ARGS__ })),	\
 		.links = { __VA_ARGS__ },				\
 	}
 
+#define DEFINE_QNODE(_name, _id, _buswidth, ...)		\
+		__DEFINE_QNODE(_name, _id, _buswidth, 0, 0, __VA_ARGS__ )
+#define DEFINE_DCVS_QNODE(_name, _id, _buswidth, _domain, _cpu, ...)		\
+		__DEFINE_QNODE(_name, _id, _buswidth, _domain, _cpu, __VA_ARGS__ )
+
 DEFINE_QNODE(sdm845_osm_apps_l3, SDM845_MASTER_OSM_L3_APPS, 16, SDM845_SLAVE_OSM_L3);
 DEFINE_QNODE(sdm845_osm_l3, SDM845_SLAVE_OSM_L3, 16);
 
@@ -162,26 +192,80 @@ static const struct qcom_osm_l3_desc sm8250_icc_epss_l3 = {
 	.reg_perf_state = EPSS_REG_PERF_STATE,
 };
 
-static int qcom_osm_l3_set(struct icc_node *src, struct icc_node *dst)
+DEFINE_DCVS_QNODE(sc7280_epss_apps_l3, SC7280_MASTER_EPSS_L3_APPS, 32, 0, 0,
+					SC7280_SLAVE_EPSS_L3_SHARED, SC7280_SLAVE_EPSS_L3_CPU0,
+					SC7280_SLAVE_EPSS_L3_CPU1, SC7280_SLAVE_EPSS_L3_CPU2,
+					SC7280_SLAVE_EPSS_L3_CPU3, SC7280_SLAVE_EPSS_L3_CPU4,
+					SC7280_SLAVE_EPSS_L3_CPU5, SC7280_SLAVE_EPSS_L3_CPU6,
+					SC7280_SLAVE_EPSS_L3_CPU7);
+DEFINE_DCVS_QNODE(sc7280_epss_l3_shared, SC7280_SLAVE_EPSS_L3_SHARED, 32, 0, 0);
+DEFINE_DCVS_QNODE(sc7280_epss_l3_cpu0, SC7280_SLAVE_EPSS_L3_CPU0, 32, 1, 0);
+DEFINE_DCVS_QNODE(sc7280_epss_l3_cpu1, SC7280_SLAVE_EPSS_L3_CPU1, 32, 1, 1);
+DEFINE_DCVS_QNODE(sc7280_epss_l3_cpu2, SC7280_SLAVE_EPSS_L3_CPU2, 32, 1, 2);
+DEFINE_DCVS_QNODE(sc7280_epss_l3_cpu3, SC7280_SLAVE_EPSS_L3_CPU3, 32, 1, 3);
+DEFINE_DCVS_QNODE(sc7280_epss_l3_cpu4, SC7280_SLAVE_EPSS_L3_CPU4, 32, 2, 0);
+DEFINE_DCVS_QNODE(sc7280_epss_l3_cpu5, SC7280_SLAVE_EPSS_L3_CPU5, 32, 2, 1);
+DEFINE_DCVS_QNODE(sc7280_epss_l3_cpu6, SC7280_SLAVE_EPSS_L3_CPU6, 32, 2, 2);
+DEFINE_DCVS_QNODE(sc7280_epss_l3_cpu7, SC7280_SLAVE_EPSS_L3_CPU7, 32, 3, 0);
+
+static const struct qcom_icc_node *sc7280_epss_l3_nodes[] = {
+	[MASTER_EPSS_L3_APPS] = &sc7280_epss_apps_l3,
+	[SLAVE_EPSS_L3_SHARED] = &sc7280_epss_l3_shared,
+	[SLAVE_EPSS_L3_CPU0] = &sc7280_epss_l3_cpu0,
+	[SLAVE_EPSS_L3_CPU1] = &sc7280_epss_l3_cpu1,
+	[SLAVE_EPSS_L3_CPU2] = &sc7280_epss_l3_cpu2,
+	[SLAVE_EPSS_L3_CPU3] = &sc7280_epss_l3_cpu3,
+	[SLAVE_EPSS_L3_CPU4] = &sc7280_epss_l3_cpu4,
+	[SLAVE_EPSS_L3_CPU5] = &sc7280_epss_l3_cpu5,
+	[SLAVE_EPSS_L3_CPU6] = &sc7280_epss_l3_cpu6,
+	[SLAVE_EPSS_L3_CPU7] = &sc7280_epss_l3_cpu7,
+};
+
+static const struct qcom_icc_desc sc7280_icc_epss_l3 = {
+	.nodes = sc7280_epss_l3_nodes,
+	.num_nodes = ARRAY_SIZE(sc7280_epss_l3_nodes),
+	.per_core_dcvs = true,
+	.lut_row_size = EPSS_LUT_ROW_SIZE,
+	.reg_freq_lut = EPSS_REG_FREQ_LUT,
+	.reg_perf_state = EPSS_REG_PERF_STATE,
+};
+
+static u32 qcom_osm_l3_aggregate_peak(struct icc_node *src, struct icc_node *dst)
 {
-	struct qcom_osm_l3_icc_provider *qp;
-	struct icc_provider *provider;
-	const struct qcom_osm_l3_node *qn;
 	struct icc_node *n;
-	unsigned int index;
 	u32 agg_peak = 0;
 	u32 agg_avg = 0;
-	u64 rate;
+	struct qcom_osm_l3_icc_provider *qp;
+	struct icc_provider *provider;
 
-	qn = src->data;
 	provider = src->provider;
 	qp = to_osm_l3_provider(provider);
 
+	/* Skip aggregation when per core l3 scaling is enabled */
+	if (qp->per_core_dcvs)
+		return dst->peak_bw;
+
 	list_for_each_entry(n, &provider->nodes, node_list)
-		provider->aggregate(n, 0, n->avg_bw, n->peak_bw,
-				    &agg_avg, &agg_peak);
+		provider->aggregate(n, 0, n->avg_bw, n->peak_bw, &agg_avg, &agg_peak);
+
+	agg_peak = max(agg_avg, agg_peak);
+
+	return agg_peak;
+}
+
+static int qcom_osm_l3_set(struct icc_node *src, struct icc_node *dst)
+{
+	struct qcom_osm_l3_icc_provider *qp;
+	struct icc_provider *provider;
+	const struct qcom_icc_node *qn;
+	unsigned int index;
+	u64 rate;
 
-	rate = max(agg_avg, agg_peak);
+	qn = dst->data;
+	provider = src->provider;
+	qp = to_qcom_provider(provider);
+
+	rate = qcom_osm_l3_aggregate_peak(src, dst);
 	rate = icc_units_to_bps(rate);
 	do_div(rate, qn->buswidth);
 
@@ -190,7 +274,10 @@ static int qcom_osm_l3_set(struct icc_node *src, struct icc_node *dst)
 			break;
 	}
 
-	writel_relaxed(index, qp->base + qp->reg_perf_state);
+	if (qp->per_core_dcvs)
+		writel_relaxed(index, EPSS_L3_VOTE_REG(qp->domain_base[qn->domain], qn->cpu));
+	else
+		writel_relaxed(index, qp->domain_base[qn->domain] + qp->reg_perf_state);
 
 	return 0;
 }
@@ -205,7 +292,7 @@ static int qcom_osm_l3_remove(struct platform_device *pdev)
 
 static int qcom_osm_l3_probe(struct platform_device *pdev)
 {
-	u32 info, src, lval, i, prev_freq = 0, freq;
+	u32 info, src, lval, i = 0, prev_freq = 0, freq;
 	static unsigned long hw_rate, xo_rate;
 	struct qcom_osm_l3_icc_provider *qp;
 	const struct qcom_osm_l3_desc *desc;
@@ -215,7 +302,7 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
 	struct icc_node *node;
 	size_t num_nodes;
 	struct clk *clk;
-	int ret;
+	int ret, nr_domain_bases = 0;
 
 	clk = clk_get(&pdev->dev, "xo");
 	if (IS_ERR(clk))
@@ -235,12 +322,17 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
 	if (!qp)
 		return -ENOMEM;
 
-	qp->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(qp->base))
-		return PTR_ERR(qp->base);
+	while (of_get_address(pdev->dev.of_node, i++, NULL, NULL))
+		nr_domain_bases++;
+
+	for (i = 0; i < nr_domain_bases ; i++) {
+		qp->domain_base[i] = devm_platform_ioremap_resource(pdev, i);
+		if (IS_ERR(qp->domain_base[i]))
+			return PTR_ERR(qp->domain_base[i]);
+	}
 
 	/* HW should be in enabled state to proceed */
-	if (!(readl_relaxed(qp->base + REG_ENABLE) & 0x1)) {
+	if (!(readl_relaxed(qp->domain_base[0] + REG_ENABLE) & 0x1)) {
 		dev_err(&pdev->dev, "error hardware not enabled\n");
 		return -ENODEV;
 	}
@@ -252,7 +344,7 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
 	qp->reg_perf_state = desc->reg_perf_state;
 
 	for (i = 0; i < LUT_MAX_ENTRIES; i++) {
-		info = readl_relaxed(qp->base + desc->reg_freq_lut +
+		info = readl_relaxed(qp->domain_base[0] + desc->reg_freq_lut +
 				     i * desc->lut_row_size);
 		src = FIELD_GET(LUT_SRC, info);
 		lval = FIELD_GET(LUT_L_VAL, info);
@@ -271,6 +363,7 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
 		prev_freq = freq;
 	}
 	qp->max_state = i;
+	qp->per_core_dcvs = desc->per_core_dcvs;
 
 	qnodes = desc->nodes;
 	num_nodes = desc->num_nodes;
@@ -326,6 +419,7 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
 
 static const struct of_device_id osm_l3_of_match[] = {
 	{ .compatible = "qcom,sc7180-osm-l3", .data = &sc7180_icc_osm_l3 },
+	{ .compatible = "qcom,sc7280-epss-l3", .data = &sc7280_icc_epss_l3 },
 	{ .compatible = "qcom,sdm845-osm-l3", .data = &sdm845_icc_osm_l3 },
 	{ .compatible = "qcom,sm8150-osm-l3", .data = &sm8150_icc_osm_l3 },
 	{ .compatible = "qcom,sc8180x-osm-l3", .data = &sc8180x_icc_osm_l3 },
diff --git a/drivers/interconnect/qcom/sc7280.h b/drivers/interconnect/qcom/sc7280.h
index 175e400..5df7600 100644
--- a/drivers/interconnect/qcom/sc7280.h
+++ b/drivers/interconnect/qcom/sc7280.h
@@ -150,5 +150,15 @@
 #define SC7280_SLAVE_PCIE_1			139
 #define SC7280_SLAVE_QDSS_STM			140
 #define SC7280_SLAVE_TCU			141
+#define SC7280_MASTER_EPSS_L3_APPS			142
+#define SC7280_SLAVE_EPSS_L3_SHARED			143
+#define SC7280_SLAVE_EPSS_L3_CPU0			144
+#define SC7280_SLAVE_EPSS_L3_CPU1			145
+#define SC7280_SLAVE_EPSS_L3_CPU2			146
+#define SC7280_SLAVE_EPSS_L3_CPU3			147
+#define SC7280_SLAVE_EPSS_L3_CPU4			148
+#define SC7280_SLAVE_EPSS_L3_CPU5			149
+#define SC7280_SLAVE_EPSS_L3_CPU6			150
+#define SC7280_SLAVE_EPSS_L3_CPU7			151
 
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

