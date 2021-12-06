Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AABC46910B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Dec 2021 08:58:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238724AbhLFICG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 03:02:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238701AbhLFICF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 03:02:05 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14551C061359
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Dec 2021 23:58:37 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id p18-20020a17090ad31200b001a78bb52876so10152176pju.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Dec 2021 23:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=e4wbC/c+PlTgP+0hMVrwFXZ/CJ/XYwQSDd31EyjFYk0=;
        b=WllFIXQfo2bieyKRMAA1nDev7SeV8S+Kxbjiv0kQoahgYc3TFZLsrisDi5/OwdaVHE
         TWyh5thCE+0UfvYZ8rTHurEgNxZlwK/yhXwJ+pQxTrwfpuLXeJO1t1UOTs9A3w0Arlcw
         XrUxEQh5tSz6Fm0h3RlFmC+Z/IAputVaRmKNyRURkvwDTA3jjwXxpM6fmmtAliWCjuTR
         pHRz2681To0z/oKp3PXnMpd98iH2TcrP9e2pre0wd0170DW+Vw8CiFTP8Q7XOYu7eNyK
         5N9nJKjUoxvVtsmLyGuAkvLCff87rQgN1teb2c8b+chDLJqKlblHfOsEtMntqG7KBDqw
         70aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=e4wbC/c+PlTgP+0hMVrwFXZ/CJ/XYwQSDd31EyjFYk0=;
        b=4VkXYxAPACf8PkbtwYhQ6CFDRIZhiILCsY0SMosBNv9SENwCU8HaXOejVmqYTOHy4L
         hWjG7dwN13pMSOdLGq+7yLP6ukSASlada3f3wYWshkGMHPO4LcxiTVb4kEERBR3VzeFa
         6zd7IhsgTYImVN7ivyu9lkBf0pfhxS6+111drBJiszTUOMKo1DV2dY0xKQWPPsYW3DZD
         QabbF/IR0RaJC33d6tN9JfAbkfrrOXWFkEWH2eBmq/HUMQFi2p3Ii9hYVou3eVwSKl2k
         PGbIjs7/kHEeggpnxp8TH0SCq5+hgM1H+/et+LG0gY2Q6axrvDBlCmUHtWcuxiO7z5fK
         RGQg==
X-Gm-Message-State: AOAM531QLtHgOGq/rxjWlXoSSHK0f4A3a8Rt2Vk7AieUorljp5zWv1QD
        5YAdttkyQdfY/14MW4pgZ1kiyA==
X-Google-Smtp-Source: ABdhPJykO/eSjdWzNzqJk8Su8RXLedgSX908PNGeV37qdbNicKMPbXOAhKLvw0xCWQEl/2nvfG05HA==
X-Received: by 2002:a17:90a:fd8c:: with SMTP id cx12mr35242869pjb.11.1638777516596;
        Sun, 05 Dec 2021 23:58:36 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id p15sm11794476pfo.143.2021.12.05.23.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 23:58:36 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Georgi Djakov <djakov@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 2/6] interconnect: icc-rpm: Define ICC device type
Date:   Mon,  6 Dec 2021 15:58:04 +0800
Message-Id: <20211206075808.18124-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211206075808.18124-1-shawn.guo@linaro.org>
References: <20211206075808.18124-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver currently uses .is_bimc_node to distinguish device type BIMC
from NOC.  Define type for bus/noc devices like what downstream[1] does
to make support for more types easier.

[1] https://source.codeaurora.org/quic/la/kernel/msm-4.19/tree/drivers/soc/qcom/msm_bus/msm_bus_core.h?h=kernel.lnx.4.19.r22-rel#n46

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.c |  4 ++--
 drivers/interconnect/qcom/icc-rpm.h | 11 ++++++++---
 drivers/interconnect/qcom/msm8916.c |  4 +++-
 drivers/interconnect/qcom/msm8939.c |  5 ++++-
 drivers/interconnect/qcom/sdm660.c  |  7 ++++++-
 5 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index 35888721a690..264a9399fb28 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -163,7 +163,7 @@ static int qcom_icc_qos_set(struct icc_node *node, u64 sum_bw)
 
 	dev_dbg(node->provider->dev, "Setting QoS for %s\n", qn->name);
 
-	if (qp->is_bimc_node)
+	if (qp->type == QCOM_ICC_BIMC)
 		return qcom_icc_set_bimc_qos(node, sum_bw);
 
 	return qcom_icc_set_noc_qos(node, sum_bw);
@@ -307,7 +307,7 @@ int qnoc_probe(struct platform_device *pdev)
 		qp->bus_clks[i].id = cds[i];
 	qp->num_clks = cd_num;
 
-	qp->is_bimc_node = desc->is_bimc_node;
+	qp->type = desc->type;
 	qp->qos_offset = desc->qos_offset;
 
 	if (desc->regmap_cfg) {
diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index f5744de4da19..d8e77ce7fe06 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -12,19 +12,24 @@
 #define to_qcom_provider(_provider) \
 	container_of(_provider, struct qcom_icc_provider, provider)
 
+enum qcom_icc_type {
+	QCOM_ICC_NOC,
+	QCOM_ICC_BIMC,
+};
+
 /**
  * struct qcom_icc_provider - Qualcomm specific interconnect provider
  * @provider: generic interconnect provider
  * @bus_clks: the clk_bulk_data table of bus clocks
  * @num_clks: the total number of clk_bulk_data entries
- * @is_bimc_node: indicates whether to use bimc specific setting
+ * @type: the ICC provider type
  * @qos_offset: offset to QoS registers
  * @regmap: regmap for QoS registers read/write access
  */
 struct qcom_icc_provider {
 	struct icc_provider provider;
 	int num_clks;
-	bool is_bimc_node;
+	enum qcom_icc_type type;
 	struct regmap *regmap;
 	unsigned int qos_offset;
 	struct clk_bulk_data bus_clks[];
@@ -77,7 +82,7 @@ struct qcom_icc_desc {
 	size_t num_nodes;
 	const char * const *clocks;
 	size_t num_clocks;
-	bool is_bimc_node;
+	enum qcom_icc_type type;
 	const struct regmap_config *regmap_cfg;
 	unsigned int qos_offset;
 };
diff --git a/drivers/interconnect/qcom/msm8916.c b/drivers/interconnect/qcom/msm8916.c
index e3c995b11357..2f397a7c3322 100644
--- a/drivers/interconnect/qcom/msm8916.c
+++ b/drivers/interconnect/qcom/msm8916.c
@@ -1229,6 +1229,7 @@ static const struct regmap_config msm8916_snoc_regmap_config = {
 };
 
 static struct qcom_icc_desc msm8916_snoc = {
+	.type = QCOM_ICC_NOC,
 	.nodes = msm8916_snoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8916_snoc_nodes),
 	.regmap_cfg = &msm8916_snoc_regmap_config,
@@ -1256,9 +1257,9 @@ static const struct regmap_config msm8916_bimc_regmap_config = {
 };
 
 static struct qcom_icc_desc msm8916_bimc = {
+	.type = QCOM_ICC_BIMC,
 	.nodes = msm8916_bimc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8916_bimc_nodes),
-	.is_bimc_node = true,
 	.regmap_cfg = &msm8916_bimc_regmap_config,
 	.qos_offset = 0x8000,
 };
@@ -1325,6 +1326,7 @@ static const struct regmap_config msm8916_pcnoc_regmap_config = {
 };
 
 static struct qcom_icc_desc msm8916_pcnoc = {
+	.type = QCOM_ICC_NOC,
 	.nodes = msm8916_pcnoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8916_pcnoc_nodes),
 	.regmap_cfg = &msm8916_pcnoc_regmap_config,
diff --git a/drivers/interconnect/qcom/msm8939.c b/drivers/interconnect/qcom/msm8939.c
index 16272a477bd8..d188f3636e4c 100644
--- a/drivers/interconnect/qcom/msm8939.c
+++ b/drivers/interconnect/qcom/msm8939.c
@@ -1282,6 +1282,7 @@ static const struct regmap_config msm8939_snoc_regmap_config = {
 };
 
 static struct qcom_icc_desc msm8939_snoc = {
+	.type = QCOM_ICC_NOC,
 	.nodes = msm8939_snoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_snoc_nodes),
 	.regmap_cfg = &msm8939_snoc_regmap_config,
@@ -1309,6 +1310,7 @@ static const struct regmap_config msm8939_snoc_mm_regmap_config = {
 };
 
 static struct qcom_icc_desc msm8939_snoc_mm = {
+	.type = QCOM_ICC_NOC,
 	.nodes = msm8939_snoc_mm_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_snoc_mm_nodes),
 	.regmap_cfg = &msm8939_snoc_mm_regmap_config,
@@ -1336,9 +1338,9 @@ static const struct regmap_config msm8939_bimc_regmap_config = {
 };
 
 static struct qcom_icc_desc msm8939_bimc = {
+	.type = QCOM_ICC_BIMC,
 	.nodes = msm8939_bimc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_bimc_nodes),
-	.is_bimc_node = true,
 	.regmap_cfg = &msm8939_bimc_regmap_config,
 	.qos_offset = 0x8000,
 };
@@ -1407,6 +1409,7 @@ static const struct regmap_config msm8939_pcnoc_regmap_config = {
 };
 
 static struct qcom_icc_desc msm8939_pcnoc = {
+	.type = QCOM_ICC_NOC,
 	.nodes = msm8939_pcnoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_pcnoc_nodes),
 	.regmap_cfg = &msm8939_pcnoc_regmap_config,
diff --git a/drivers/interconnect/qcom/sdm660.c b/drivers/interconnect/qcom/sdm660.c
index 471bb88f8828..274a7139fe1a 100644
--- a/drivers/interconnect/qcom/sdm660.c
+++ b/drivers/interconnect/qcom/sdm660.c
@@ -1513,6 +1513,7 @@ static const struct regmap_config sdm660_a2noc_regmap_config = {
 };
 
 static struct qcom_icc_desc sdm660_a2noc = {
+	.type = QCOM_ICC_NOC,
 	.nodes = sdm660_a2noc_nodes,
 	.num_nodes = ARRAY_SIZE(sdm660_a2noc_nodes),
 	.clocks = bus_a2noc_clocks,
@@ -1540,9 +1541,9 @@ static const struct regmap_config sdm660_bimc_regmap_config = {
 };
 
 static struct qcom_icc_desc sdm660_bimc = {
+	.type = QCOM_ICC_BIMC,
 	.nodes = sdm660_bimc_nodes,
 	.num_nodes = ARRAY_SIZE(sdm660_bimc_nodes),
-	.is_bimc_node = true,
 	.regmap_cfg = &sdm660_bimc_regmap_config,
 };
 
@@ -1594,6 +1595,7 @@ static const struct regmap_config sdm660_cnoc_regmap_config = {
 };
 
 static struct qcom_icc_desc sdm660_cnoc = {
+	.type = QCOM_ICC_NOC,
 	.nodes = sdm660_cnoc_nodes,
 	.num_nodes = ARRAY_SIZE(sdm660_cnoc_nodes),
 	.regmap_cfg = &sdm660_cnoc_regmap_config,
@@ -1614,6 +1616,7 @@ static const struct regmap_config sdm660_gnoc_regmap_config = {
 };
 
 static struct qcom_icc_desc sdm660_gnoc = {
+	.type = QCOM_ICC_NOC,
 	.nodes = sdm660_gnoc_nodes,
 	.num_nodes = ARRAY_SIZE(sdm660_gnoc_nodes),
 	.regmap_cfg = &sdm660_gnoc_regmap_config,
@@ -1653,6 +1656,7 @@ static const struct regmap_config sdm660_mnoc_regmap_config = {
 };
 
 static struct qcom_icc_desc sdm660_mnoc = {
+	.type = QCOM_ICC_NOC,
 	.nodes = sdm660_mnoc_nodes,
 	.num_nodes = ARRAY_SIZE(sdm660_mnoc_nodes),
 	.clocks = bus_mm_clocks,
@@ -1689,6 +1693,7 @@ static const struct regmap_config sdm660_snoc_regmap_config = {
 };
 
 static struct qcom_icc_desc sdm660_snoc = {
+	.type = QCOM_ICC_NOC,
 	.nodes = sdm660_snoc_nodes,
 	.num_nodes = ARRAY_SIZE(sdm660_snoc_nodes),
 	.regmap_cfg = &sdm660_snoc_regmap_config,
-- 
2.17.1

