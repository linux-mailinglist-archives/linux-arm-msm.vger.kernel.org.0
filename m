Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC38E100DFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 22:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfKRVn3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 16:43:29 -0500
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:43230
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726647AbfKRVn2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 16:43:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574113407;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=3Lb8qDQ90tHns22LmpZEI/RMyyAPK7/2uhtC5ycKKpQ=;
        b=FGKmtZmQ/KXyQ1De4T2UfJw5eO6grH8SEHHrRKHe3aCvOi8R1RkVX0jYot3eP8qE
        DxLq0RmnvpgoCex7uKfwuly9QXW13YkzHGWd5QSl+qIDSDulh8VneBU+xtUSVRQ/Q6/
        vKWzo5NZmfjqpEaNp+PdV4HTf1EnXrxTBeIhs2fE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574113407;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=3Lb8qDQ90tHns22LmpZEI/RMyyAPK7/2uhtC5ycKKpQ=;
        b=PKp35qrjboe942NYzV/NB1ANc3z4Dtfu83LOmn4th7Ery72e/GN1YlDjTKHlNlWI
        xdUxKemvo+OuyfEoUSIgof6oIiWDbn/3JOPzuNWGpC5XGo12il7p9+gDYq3yb/kH686
        iILuSHiNgLVIHbsZlONogq5Hh1tu+u/WDj5EedNI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A78EAC58C16
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, jhugo@codeaurora.org,
        robh+dt@kernel.org, jonathan@marek.ca
Cc:     ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 04/16] remoteproc: mss: q6v5-mss: Add modem support on SC7180
Date:   Mon, 18 Nov 2019 21:43:27 +0000
Message-ID: <0101016e807871f1-a3b23bd8-ce4a-4a20-8041-85524eed1681-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.11.18-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the out of reset sequence support for modem sub-system on SC7180
SoCs. It is closer to the modem sub-system found on SDM845 SoCs. It
requires access to an additional halt nav register to put the modem
back into reset.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 179 ++++++++++++++++++++++++++++-
 1 file changed, 175 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 06a57db3238db..b01ed02d9cc02 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -68,6 +68,9 @@
 #define AXI_HALTREQ_REG			0x0
 #define AXI_HALTACK_REG			0x4
 #define AXI_IDLE_REG			0x8
+#define NAV_AXI_HALTREQ_BIT		BIT(0)
+#define NAV_AXI_HALTACK_BIT		BIT(1)
+#define NAV_AXI_IDLE_BIT		BIT(2)
 
 #define HALT_ACK_TIMEOUT_MS		100
 
@@ -106,9 +109,11 @@
 #define QDSP6SS_BHS_STATUS		0x0C4
 
 /* QDSP6v65 parameters */
+#define QDSP6SS_CORE_CBCR		0x20
 #define QDSP6SS_SLEEP                   0x3C
 #define QDSP6SS_BOOT_CORE_START         0x400
 #define QDSP6SS_BOOT_CMD                0x404
+#define QDSP6SS_BOOT_STATUS		0x408
 #define SLEEP_CHECK_MAX_LOOPS           200
 #define BOOT_FSM_TIMEOUT                10000
 
@@ -136,6 +141,7 @@ struct rproc_hexagon_res {
 	int version;
 	bool need_mem_protection;
 	bool has_alt_reset;
+	bool has_halt_nav;
 };
 
 struct q6v5 {
@@ -146,9 +152,14 @@ struct q6v5 {
 	void __iomem *rmb_base;
 
 	struct regmap *halt_map;
+	struct regmap *halt_nav_map;
+	struct regmap *conn_map;
+
 	u32 halt_q6;
 	u32 halt_modem;
 	u32 halt_nc;
+	u32 halt_nav;
+	u32 conn_box;
 
 	struct reset_control *mss_restart;
 	struct reset_control *pdc_reset;
@@ -192,6 +203,7 @@ struct q6v5 {
 	struct qcom_sysmon *sysmon;
 	bool need_mem_protection;
 	bool has_alt_reset;
+	bool has_halt_nav;
 	int mpss_perm;
 	int mba_perm;
 	const char *hexagon_mdt_image;
@@ -203,6 +215,7 @@ enum {
 	MSS_MSM8974,
 	MSS_MSM8996,
 	MSS_MSM8998,
+	MSS_SC7180,
 	MSS_SDM845,
 };
 
@@ -401,6 +414,18 @@ static int q6v5_reset_assert(struct q6v5 *qproc)
 		reset_control_assert(qproc->pdc_reset);
 		ret = reset_control_reset(qproc->mss_restart);
 		reset_control_deassert(qproc->pdc_reset);
+	} else if (qproc->has_halt_nav) {
+		reset_control_assert(qproc->pdc_reset);
+		/* SWAR using conn_box_spare0 register for pipeline glitch */
+		regmap_update_bits(qproc->conn_map, qproc->conn_box,
+				   BIT(0), BIT(0));
+		regmap_update_bits(qproc->halt_nav_map, qproc->halt_nav,
+				   NAV_AXI_HALTREQ_BIT, 0);
+		reset_control_assert(qproc->mss_restart);
+		reset_control_deassert(qproc->pdc_reset);
+		regmap_update_bits(qproc->conn_map, qproc->conn_box,
+				   BIT(0), 0);
+		ret = reset_control_deassert(qproc->mss_restart);
 	} else {
 		ret = reset_control_assert(qproc->mss_restart);
 	}
@@ -418,6 +443,8 @@ static int q6v5_reset_deassert(struct q6v5 *qproc)
 		ret = reset_control_reset(qproc->mss_restart);
 		writel(0, qproc->rmb_base + RMB_MBA_ALT_RESET);
 		reset_control_deassert(qproc->pdc_reset);
+	} else if (qproc->has_halt_nav) {
+		ret = reset_control_reset(qproc->mss_restart);
 	} else {
 		ret = reset_control_deassert(qproc->mss_restart);
 	}
@@ -477,7 +504,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 	int ret;
 	int i;
 
-	if (qproc->version == MSS_SDM845) {
+	if (qproc->version == MSS_SDM845 || qproc->version == MSS_SC7180) {
 		val = readl(qproc->reg_base + QDSP6SS_SLEEP);
 		val |= 0x1;
 		writel(val, qproc->reg_base + QDSP6SS_SLEEP);
@@ -490,13 +517,36 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 			return -ETIMEDOUT;
 		}
 
+		if (qproc->version == MSS_SC7180) {
+			val = readl(qproc->reg_base + QDSP6SS_XO_CBCR);
+			val |= 0x1;
+			writel(val, qproc->reg_base + QDSP6SS_XO_CBCR);
+
+			ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_XO_CBCR,
+						 val, !(val & BIT(31)), 1,
+						 SLEEP_CHECK_MAX_LOOPS);
+			if (ret) {
+				dev_err(qproc->dev, "QDSP6SS Xo clock timed out\n");
+				return -ETIMEDOUT;
+			}
+
+			val = readl(qproc->reg_base + QDSP6SS_CORE_CBCR);
+			val |= 0x1;
+			writel(val, qproc->reg_base + QDSP6SS_CORE_CBCR);
+		}
+
 		/* De-assert QDSP6 stop core */
 		writel(1, qproc->reg_base + QDSP6SS_BOOT_CORE_START);
 		/* Trigger boot FSM */
 		writel(1, qproc->reg_base + QDSP6SS_BOOT_CMD);
 
-		ret = readl_poll_timeout(qproc->rmb_base + RMB_MBA_MSS_STATUS,
-				val, (val & BIT(0)) != 0, 10, BOOT_FSM_TIMEOUT);
+		if (qproc->version == MSS_SC7180)
+			ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_BOOT_STATUS,
+						 val, (val & BIT(0)) != 0, 1, SLEEP_CHECK_MAX_LOOPS);
+		else
+			ret = readl_poll_timeout(qproc->rmb_base + RMB_MBA_MSS_STATUS,
+						 val, (val & BIT(0)) != 0, 10, BOOT_FSM_TIMEOUT);
+
 		if (ret) {
 			dev_err(qproc->dev, "Boot FSM failed to complete.\n");
 			/* Reset the modem so that boot FSM is in reset state */
@@ -693,6 +743,38 @@ static void q6v5proc_halt_axi_port(struct q6v5 *qproc,
 	regmap_write(halt_map, offset + AXI_HALTREQ_REG, 0);
 }
 
+static void q6v5proc_halt_nav_axi_port(struct q6v5 *qproc,
+				       struct regmap *halt_map,
+				       u32 offset)
+{
+	unsigned long timeout;
+	unsigned int val;
+	int ret;
+
+	/* Check if we're already idle */
+	ret = regmap_read(halt_map, offset, &val);
+	if (!ret && (val & NAV_AXI_IDLE_BIT))
+		return;
+
+	/* Assert halt request */
+	regmap_update_bits(halt_map, offset, NAV_AXI_HALTREQ_BIT,
+			   NAV_AXI_HALTREQ_BIT);
+
+	/* Wait for halt ack*/
+	timeout = jiffies + msecs_to_jiffies(HALT_ACK_TIMEOUT_MS);
+	for (;;) {
+		ret = regmap_read(halt_map, offset, &val);
+		if (ret || (val & NAV_AXI_HALTACK_BIT) || time_after(jiffies, timeout))
+			break;
+
+		msleep(5);
+	}
+
+	ret = regmap_read(halt_map, offset, &val);
+	if (ret || !(val & NAV_AXI_IDLE_BIT))
+		dev_err(qproc->dev, "port failed halt\n");
+}
+
 static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 {
 	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
@@ -855,6 +937,9 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 halt_axi_ports:
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
+	if (qproc->has_halt_nav)
+		q6v5proc_halt_nav_axi_port(qproc, qproc->halt_nav_map,
+					   qproc->halt_nav);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
 
 reclaim_mba:
@@ -902,6 +987,9 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
 
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
+	if (qproc->has_halt_nav)
+		q6v5proc_halt_nav_axi_port(qproc, qproc->halt_nav_map,
+					   qproc->halt_nav);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
 	if (qproc->version == MSS_MSM8996) {
 		/*
@@ -1279,6 +1367,47 @@ static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
 	qproc->halt_modem = args.args[1];
 	qproc->halt_nc = args.args[2];
 
+	if (qproc->has_halt_nav) {
+		struct platform_device *nav_pdev;
+
+		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
+						       "qcom,halt-nav-regs",
+						       1, 0, &args);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to parse halt-nav-regs\n");
+			return -EINVAL;
+		}
+
+		nav_pdev = of_find_device_by_node(args.np);
+		of_node_put(args.np);
+		if (!nav_pdev) {
+			dev_err(&pdev->dev, "failed to get mss clock device\n");
+			return -EPROBE_DEFER;
+		}
+
+		qproc->halt_nav_map = dev_get_regmap(&nav_pdev->dev, NULL);
+		if (!qproc->halt_nav_map) {
+			dev_err(&pdev->dev, "failed to get map from device\n");
+			return -EINVAL;
+		}
+		qproc->halt_nav = args.args[0];
+
+		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
+						       "qcom,halt-nav-regs",
+						       1, 1, &args);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to parse halt-nav-regs\n");
+			return -EINVAL;
+		}
+
+		qproc->conn_map = syscon_node_to_regmap(args.np);
+		of_node_put(args.np);
+		if (IS_ERR(qproc->conn_map))
+			return PTR_ERR(qproc->conn_map);
+
+		qproc->conn_box = args.args[0];
+	}
+
 	return 0;
 }
 
@@ -1353,7 +1482,7 @@ static int q6v5_init_reset(struct q6v5 *qproc)
 		return PTR_ERR(qproc->mss_restart);
 	}
 
-	if (qproc->has_alt_reset) {
+	if (qproc->has_alt_reset || qproc->has_halt_nav) {
 		qproc->pdc_reset = devm_reset_control_get_exclusive(qproc->dev,
 								    "pdc_reset");
 		if (IS_ERR(qproc->pdc_reset)) {
@@ -1452,6 +1581,7 @@ static int q6v5_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, qproc);
 
+	qproc->has_halt_nav = desc->has_halt_nav;
 	ret = q6v5_init_mem(qproc, pdev);
 	if (ret)
 		goto free_rproc;
@@ -1575,6 +1705,41 @@ static int q6v5_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct rproc_hexagon_res sc7180_mss = {
+	.hexagon_mba_image = "mba.mbn",
+	.proxy_clk_names = (char*[]){
+		"xo",
+		NULL
+	},
+	.reset_clk_names = (char*[]){
+		"iface",
+		"bus",
+		"snoc_axi",
+		NULL
+	},
+	.active_clk_names = (char*[]){
+		"mnoc_axi",
+		"nav",
+		"mss_nav",
+		"mss_crypto",
+		NULL
+	},
+	.active_pd_names = (char*[]){
+		"load_state",
+		NULL
+	},
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"mss",
+		NULL
+	},
+	.need_mem_protection = true,
+	.has_alt_reset = false,
+	.has_halt_nav = true,
+	.version = MSS_SC7180,
+};
+
 static const struct rproc_hexagon_res sdm845_mss = {
 	.hexagon_mba_image = "mba.mbn",
 	.proxy_clk_names = (char*[]){
@@ -1606,6 +1771,7 @@ static const struct rproc_hexagon_res sdm845_mss = {
 	},
 	.need_mem_protection = true,
 	.has_alt_reset = true,
+	.has_halt_nav = false,
 	.version = MSS_SDM845,
 };
 
@@ -1632,6 +1798,7 @@ static const struct rproc_hexagon_res msm8998_mss = {
 	},
 	.need_mem_protection = true,
 	.has_alt_reset = false,
+	.has_halt_nav = false,
 	.version = MSS_MSM8998,
 };
 
@@ -1661,6 +1828,7 @@ static const struct rproc_hexagon_res msm8996_mss = {
 	},
 	.need_mem_protection = true,
 	.has_alt_reset = false,
+	.has_halt_nav = false,
 	.version = MSS_MSM8996,
 };
 
@@ -1693,6 +1861,7 @@ static const struct rproc_hexagon_res msm8916_mss = {
 	},
 	.need_mem_protection = false,
 	.has_alt_reset = false,
+	.has_halt_nav = false,
 	.version = MSS_MSM8916,
 };
 
@@ -1733,6 +1902,7 @@ static const struct rproc_hexagon_res msm8974_mss = {
 	},
 	.need_mem_protection = false,
 	.has_alt_reset = false,
+	.has_halt_nav = false,
 	.version = MSS_MSM8974,
 };
 
@@ -1742,6 +1912,7 @@ static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
 	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},
 	{ .compatible = "qcom,msm8998-mss-pil", .data = &msm8998_mss},
+	{ .compatible = "qcom,sc7180-mss-pil", .data = &sc7180_mss},
 	{ .compatible = "qcom,sdm845-mss-pil", .data = &sdm845_mss},
 	{ },
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

