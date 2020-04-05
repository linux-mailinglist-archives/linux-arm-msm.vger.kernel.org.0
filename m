Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF7EA19EADB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2020 13:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgDELa0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Apr 2020 07:30:26 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:5756 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726626AbgDELaJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Apr 2020 07:30:09 -0400
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 05 Apr 2020 04:30:07 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg02-sd.qualcomm.com with ESMTP; 05 Apr 2020 04:30:03 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id 8112621641; Sun,  5 Apr 2020 17:00:02 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaprak@codeaurora.org
Subject: [PATCH V2 3/8] clk: qcom: Add A53 PLL support for ipq6018 devices
Date:   Sun,  5 Apr 2020 16:59:20 +0530
Message-Id: <1586086165-19426-4-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586086165-19426-1-git-send-email-sivaprak@codeaurora.org>
References: <1586086165-19426-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The CPUs on Qualcomm IPQ6018 platform is primarily clocked by A53 PLL.
This patch adds support for the A53 PLL on IPQ6018 devices which can
support CPU frequencies above 1Ghz.

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
 drivers/clk/qcom/a53-pll.c | 136 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 111 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index 45cfc57..a95351c 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -11,11 +11,40 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 
 #include "clk-pll.h"
 #include "clk-regmap.h"
+#include "clk-alpha-pll.h"
 
-static const struct pll_freq_tbl a53pll_freq[] = {
+struct a53_alpha_pll {
+	struct alpha_pll_config *pll_config;
+	struct clk_alpha_pll *pll;
+};
+
+union a53pll {
+	struct clk_pll *pll;
+	struct a53_alpha_pll alpha_pll;
+};
+
+struct a53pll_data {
+#define PLL_IS_ALPHA BIT(0)
+	u8 flags;
+	union a53pll a53pll;
+};
+
+static const u8 ipq_pll_offsets[] = {
+	[PLL_OFF_L_VAL] = 0x08,
+	[PLL_OFF_ALPHA_VAL] = 0x10,
+	[PLL_OFF_USER_CTL] = 0x18,
+	[PLL_OFF_CONFIG_CTL] = 0x20,
+	[PLL_OFF_CONFIG_CTL_U] = 0x24,
+	[PLL_OFF_STATUS] = 0x28,
+	[PLL_OFF_TEST_CTL] = 0x30,
+	[PLL_OFF_TEST_CTL_U] = 0x34,
+};
+
+static const struct pll_freq_tbl msm8996_a53pll_freq[] = {
 	{  998400000, 52, 0x0, 0x1, 0 },
 	{ 1094400000, 57, 0x0, 0x1, 0 },
 	{ 1152000000, 62, 0x0, 0x1, 0 },
@@ -26,6 +55,64 @@ static const struct pll_freq_tbl a53pll_freq[] = {
 	{ }
 };
 
+static struct clk_pll msm8996_pll = {
+	.mode_reg = 0x0,
+	.l_reg = 0x04,
+	.m_reg = 0x08,
+	.n_reg = 0x0c,
+	.config_reg = 0x14,
+	.status_reg = 0x1c,
+	.status_bit = 16,
+	.freq_tbl = msm8996_a53pll_freq,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "a53pll",
+		.flags = CLK_IS_CRITICAL,
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "xo",
+			.name = "xo",
+		},
+		.num_parents = 1,
+		.ops = &clk_pll_sr2_ops,
+	},
+};
+
+static struct clk_alpha_pll ipq6018_pll = {
+	.offset = 0x0,
+	.regs = ipq_pll_offsets,
+	.flags = SUPPORTS_DYNAMIC_UPDATE,
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "a53pll",
+			.flags = CLK_IS_CRITICAL,
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_huayra_ops,
+		},
+	},
+};
+
+static struct alpha_pll_config ipq6018_pll_config = {
+	.l = 0x37,
+	.config_ctl_val = 0x04141200,
+	.config_ctl_hi_val = 0x0,
+	.early_output_mask = BIT(3),
+	.main_output_mask = BIT(0),
+};
+
+static struct a53pll_data msm8996pll_data = {
+	.a53pll.pll = &msm8996_pll,
+};
+
+static struct a53pll_data ipq6018pll_data = {
+	.flags = PLL_IS_ALPHA,
+	.a53pll.alpha_pll.pll = &ipq6018_pll,
+	.a53pll.alpha_pll.pll_config = &ipq6018_pll_config,
+};
+
 static const struct regmap_config a53pll_regmap_config = {
 	.reg_bits		= 32,
 	.reg_stride		= 4,
@@ -39,14 +126,16 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
 	struct resource *res;
-	struct clk_pll *pll;
+	const struct a53pll_data *pll_data;
+	struct clk_regmap *clkr;
 	void __iomem *base;
-	struct clk_init_data init = { };
 	int ret;
 
-	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
-	if (!pll)
-		return -ENOMEM;
+	pll_data = of_device_get_match_data(dev);
+	if (!pll_data) {
+		dev_err(dev, "failed to get platform data\n");
+		return -ENODEV;
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(dev, res);
@@ -57,30 +146,26 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	pll->l_reg = 0x04;
-	pll->m_reg = 0x08;
-	pll->n_reg = 0x0c;
-	pll->config_reg = 0x14;
-	pll->mode_reg = 0x00;
-	pll->status_reg = 0x1c;
-	pll->status_bit = 16;
-	pll->freq_tbl = a53pll_freq;
-
-	init.name = "a53pll";
-	init.parent_names = (const char *[]){ "xo" };
-	init.num_parents = 1;
-	init.ops = &clk_pll_sr2_ops;
-	init.flags = CLK_IS_CRITICAL;
-	pll->clkr.hw.init = &init;
-
-	ret = devm_clk_register_regmap(dev, &pll->clkr);
+	if (pll_data->flags & PLL_IS_ALPHA) {
+		struct clk_alpha_pll *alpha_pll =
+			pll_data->a53pll.alpha_pll.pll;
+		struct alpha_pll_config *alpha_pll_config =
+			pll_data->a53pll.alpha_pll.pll_config;
+
+		clk_alpha_pll_configure(alpha_pll, regmap, alpha_pll_config);
+		clkr = &pll_data->a53pll.alpha_pll.pll->clkr;
+	} else {
+		clkr = &pll_data->a53pll.pll->clkr;
+	}
+
+	ret = devm_clk_register_regmap(dev, clkr);
 	if (ret) {
 		dev_err(dev, "failed to register regmap clock: %d\n", ret);
 		return ret;
 	}
 
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
-					  &pll->clkr.hw);
+					  &clkr->hw);
 	if (ret) {
 		dev_err(dev, "failed to add clock provider: %d\n", ret);
 		return ret;
@@ -90,7 +175,8 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_a53pll_match_table[] = {
-	{ .compatible = "qcom,msm8916-a53pll" },
+	{ .compatible = "qcom,msm8916-a53pll", .data = &msm8996pll_data},
+	{ .compatible = "qcom,ipq6018-a53pll", .data = &ipq6018pll_data},
 	{ }
 };
 
-- 
2.7.4

