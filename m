Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EAB2670DF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 00:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjAQXtk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 18:49:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjAQXtZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 18:49:25 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FBDB5AB49
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 14:58:29 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id ud5so79094959ejc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 14:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIQad+x4siansYRAnSbkhDyfhHTKHzFx8R9RG/AozD4=;
        b=LdE3KrgbYW9pRybb5A3yvqqbxjSbc4JwBl11SUQvWUcAgIX+fFJXv9zyILSVot1wSk
         0bsFquU7FyIQfW4yn6tJRybz/8a1KMe5DYfRq+88IYssdh8t/QkzmUpdUgZkpjDVGget
         hSoxER/XNtL4mpb40MdQvz6S8BCDKc+ZbQdtZVCvh8ym5xifwRoAsQ1NAmkPaVi4BnE6
         ORW6XA/Dwcpg0guvntcBbrNzuiayeBNQ6v5h6JqbPPonlDd0+teNQnYi9K4RDQCHFqS3
         BDGGYi2DngpZ6K8M4qpLVQW7TLF/Hsf41HOZlvsD/gIMPk7cMgQdV2h+UihVzyx2KD2A
         SC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIQad+x4siansYRAnSbkhDyfhHTKHzFx8R9RG/AozD4=;
        b=ErWJfQ2ToRvRgiWhBPPr13vsaTVen8/Arz2mJbBfuhCRnNkvjF5ZrAHwvwlEEKmEet
         cWFjNlQW6PNW+sD3ZsrIUVpSpLKTvqV4IKHAuGwKkZQmb6mhtv4bhOAASVIqXbKYPcSZ
         x68u8JP9333/xNj7NIJ8jjjTMxA3ltpNbk425yMAigXbp/RS7JmcoAEBqVDltsZg1dME
         weOgk8fg5QPVBbJB9b0GUcvUB/wBUp6g0m20/cuaBNyiO5cQKSRn2YQN9RKkHxqRaVHi
         u4ldB5XaeKxTWDGUn6cTHazM0cB2WJ3XYDFeGIUYBwpVZcMDc/jt/+PGWzIkgvALUKxN
         5qow==
X-Gm-Message-State: AFqh2kr5Cth+FoCM+T6WzcQTlVLTPiMcEOkrkbbOzlbzW3Xv81O2aL8U
        hLN0uknCOtDOSTsZVkAlC0nUUA==
X-Google-Smtp-Source: AMrXdXvMTBIuGNMi3fBBopfq35BJBgoDR6eaaFiAA2xEeOTcTwIkXTbHKTjDg6am0US1G/4c664c3w==
X-Received: by 2002:a17:906:d8a8:b0:84b:b481:6188 with SMTP id qc8-20020a170906d8a800b0084bb4816188mr692693ejb.64.1673996308356;
        Tue, 17 Jan 2023 14:58:28 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709061be100b0086f40238403sm3919762ejg.223.2023.01.17.14.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:58:28 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v2 2/7] clk: qcom: add msm8996 Core Bus Framework (CBF) support
Date:   Wed, 18 Jan 2023 00:58:19 +0200
Message-Id: <20230117225824.1552604-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
References: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add CBF clock driver as a part of MSM8996 CPU clocks. Significantly
based on AngeloGioacchino del Regno's work at [1].

The CBF is an interconnect between two CPU clusters, setting it up
properly is required for booting the MSM8996 with all four cores
enabled.

[1] https://github.com/sonyxperiadev/kernel/blob/aosp/LE.UM.2.3.2.r1.4/drivers/clk/qcom/clk-cpu-8996.c

Co-developed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/Makefile       |   2 +-
 drivers/clk/qcom/clk-cbf-8996.c | 317 ++++++++++++++++++++++++++++++++
 2 files changed, 318 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/qcom/clk-cbf-8996.c

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 98523c48c541..639d3edf9385 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -52,7 +52,7 @@ obj-$(CONFIG_MSM_MMCC_8998) += mmcc-msm8998.o
 obj-$(CONFIG_QCOM_A53PLL) += a53-pll.o
 obj-$(CONFIG_QCOM_A7PLL) += a7-pll.o
 obj-$(CONFIG_QCOM_CLK_APCS_MSM8916) += apcs-msm8916.o
-obj-$(CONFIG_QCOM_CLK_APCC_MSM8996) += apcs-msm8996.o clk-cpu-8996.o
+obj-$(CONFIG_QCOM_CLK_APCC_MSM8996) += apcs-msm8996.o clk-cpu-8996.o clk-cbf-8996.o
 obj-$(CONFIG_QCOM_CLK_APCS_SDX55) += apcs-sdx55.o
 obj-$(CONFIG_QCOM_CLK_RPM) += clk-rpm.o
 obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
new file mode 100644
index 000000000000..9cde0e660228
--- /dev/null
+++ b/drivers/clk/qcom/clk-cbf-8996.c
@@ -0,0 +1,317 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022, 2023 Linaro Ltd.
+ */
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-regmap.h"
+
+/* Need to match the order of clocks in DT binding */
+enum {
+	DT_XO,
+	DT_APCS_AUX,
+};
+
+enum {
+	CBF_XO_INDEX,
+	CBF_PLL_INDEX,
+	CBF_DIV_INDEX,
+	CBF_APCS_AUX_INDEX,
+};
+
+#define DIV_THRESHOLD		600000000
+
+#define CBF_MUX_OFFSET		0x18
+#define CBF_MUX_PARENT_MASK		GENMASK(1, 0)
+#define CBF_MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK GENMASK(5, 4)
+#define CBF_MUX_AUTO_CLK_SEL_ALWAYS_ON_GPLL0_SEL \
+	FIELD_PREP(CBF_MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK, 0x03)
+#define CBF_MUX_AUTO_CLK_SEL_BIT	BIT(6)
+
+#define CBF_PLL_OFFSET 0xf000
+
+static const u8 cbf_pll_regs[PLL_OFF_MAX_REGS] = {
+	[PLL_OFF_L_VAL] = 0x08,
+	[PLL_OFF_ALPHA_VAL] = 0x10,
+	[PLL_OFF_USER_CTL] = 0x18,
+	[PLL_OFF_CONFIG_CTL] = 0x20,
+	[PLL_OFF_CONFIG_CTL_U] = 0x24,
+	[PLL_OFF_TEST_CTL] = 0x30,
+	[PLL_OFF_TEST_CTL_U] = 0x34,
+	[PLL_OFF_STATUS] = 0x28,
+};
+
+static const struct alpha_pll_config cbfpll_config = {
+	.l = 72,
+	.config_ctl_val = 0x200d4828,
+	.config_ctl_hi_val = 0x006,
+	.test_ctl_val = 0x1c000000,
+	.test_ctl_hi_val = 0x00004000,
+	.pre_div_mask = BIT(12),
+	.post_div_mask = 0x3 << 8,
+	.post_div_val = 0x1 << 8,
+	.main_output_mask = BIT(0),
+	.early_output_mask = BIT(3),
+};
+
+static struct clk_alpha_pll cbf_pll = {
+	.offset = CBF_PLL_OFFSET,
+	.regs = cbf_pll_regs,
+	.flags = SUPPORTS_DYNAMIC_UPDATE | SUPPORTS_FSM_MODE,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cbf_pll",
+		.parent_data = (const struct clk_parent_data[]) {
+			{ .index = DT_XO, },
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_hwfsm_ops,
+	},
+};
+
+static struct clk_fixed_factor cbf_pll_postdiv = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "cbf_pll_postdiv",
+		.parent_hws = (const struct clk_hw*[]){
+			&cbf_pll.clkr.hw
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct clk_parent_data cbf_mux_parent_data[] = {
+	{ .index = DT_XO },
+	{ .hw = &cbf_pll.clkr.hw },
+	{ .hw = &cbf_pll_postdiv.hw },
+	{ .index = DT_APCS_AUX },
+};
+
+struct clk_cbf_8996_mux {
+	u32 reg;
+	struct notifier_block nb;
+	struct clk_regmap clkr;
+};
+
+static struct clk_cbf_8996_mux *to_clk_cbf_8996_mux(struct clk_regmap *clkr)
+{
+	return container_of(clkr, struct clk_cbf_8996_mux, clkr);
+}
+
+static int cbf_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
+			       void *data);
+
+static u8 clk_cbf_8996_mux_get_parent(struct clk_hw *hw)
+{
+	struct clk_regmap *clkr = to_clk_regmap(hw);
+	struct clk_cbf_8996_mux *mux = to_clk_cbf_8996_mux(clkr);
+	u32 val;
+
+	regmap_read(clkr->regmap, mux->reg, &val);
+
+	return FIELD_GET(CBF_MUX_PARENT_MASK, val);
+}
+
+static int clk_cbf_8996_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_regmap *clkr = to_clk_regmap(hw);
+	struct clk_cbf_8996_mux *mux = to_clk_cbf_8996_mux(clkr);
+	u32 val;
+
+	val = FIELD_PREP(CBF_MUX_PARENT_MASK, index);
+
+	return regmap_update_bits(clkr->regmap, mux->reg, CBF_MUX_PARENT_MASK, val);
+}
+
+static int clk_cbf_8996_mux_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
+{
+	struct clk_hw *parent;
+
+	if (req->rate < (DIV_THRESHOLD / 2))
+		return -EINVAL;
+
+	if (req->rate < DIV_THRESHOLD)
+		parent = clk_hw_get_parent_by_index(hw, CBF_DIV_INDEX);
+	else
+		parent = clk_hw_get_parent_by_index(hw, CBF_PLL_INDEX);
+
+	if (!parent)
+		return -EINVAL;
+
+	req->best_parent_rate = clk_hw_round_rate(parent, req->rate);
+	req->best_parent_hw = parent;
+
+	return 0;
+}
+
+static const struct clk_ops clk_cbf_8996_mux_ops = {
+	.set_parent = clk_cbf_8996_mux_set_parent,
+	.get_parent = clk_cbf_8996_mux_get_parent,
+	.determine_rate = clk_cbf_8996_mux_determine_rate,
+};
+
+static struct clk_cbf_8996_mux cbf_mux = {
+	.reg = CBF_MUX_OFFSET,
+	.nb.notifier_call = cbf_clk_notifier_cb,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "cbf_mux",
+		.parent_data = cbf_mux_parent_data,
+		.num_parents = ARRAY_SIZE(cbf_mux_parent_data),
+		.ops = &clk_cbf_8996_mux_ops,
+		/* CPU clock is critical and should never be gated */
+		.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+	},
+};
+
+static int cbf_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
+			       void *data)
+{
+	struct clk_notifier_data *cnd = data;
+	int ret;
+
+	switch (event) {
+	case PRE_RATE_CHANGE:
+		/*
+		 * Avoid overvolting. clk_core_set_rate_nolock() walks from top
+		 * to bottom, so it will change the rate of the PLL before
+		 * chaging the parent of PMUX. This can result in pmux getting
+		 * clocked twice the expected rate.
+		 *
+		 * Manually switch to PLL/2 here.
+		 */
+		if (cnd->old_rate > DIV_THRESHOLD &&
+		    cnd->new_rate < DIV_THRESHOLD)
+			clk_cbf_8996_mux_set_parent(&cbf_mux.clkr.hw, CBF_DIV_INDEX);
+		break;
+	case ABORT_RATE_CHANGE:
+		/* Revert manual change */
+		if (cnd->new_rate < DIV_THRESHOLD &&
+		    cnd->old_rate > DIV_THRESHOLD)
+			clk_cbf_8996_mux_set_parent(&cbf_mux.clkr.hw, CBF_PLL_INDEX);
+		break;
+	default:
+		ret = 0;
+		break;
+	}
+
+	return notifier_from_errno(ret);
+};
+
+static struct clk_hw *cbf_msm8996_hw_clks[] = {
+	&cbf_pll_postdiv.hw,
+};
+
+static struct clk_regmap *cbf_msm8996_clks[] = {
+	&cbf_pll.clkr,
+	&cbf_mux.clkr,
+};
+
+static const struct regmap_config cbf_msm8996_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= 0x10000,
+	.fast_io		= true,
+	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
+};
+
+static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
+{
+	void __iomem *base;
+	struct regmap *regmap;
+	struct device *dev = &pdev->dev;
+	int i, ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(dev, base, &cbf_msm8996_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/* Select GPLL0 for 300MHz for the CBF clock */
+	regmap_write(regmap, CBF_MUX_OFFSET, 0x3);
+
+	/* Ensure write goes through before PLLs are reconfigured */
+	udelay(5);
+
+	/* Set the auto clock sel always-on source to GPLL0/2 (300MHz) */
+	regmap_update_bits(regmap, CBF_MUX_OFFSET,
+			   CBF_MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK,
+			   CBF_MUX_AUTO_CLK_SEL_ALWAYS_ON_GPLL0_SEL);
+
+	clk_alpha_pll_configure(&cbf_pll, regmap, &cbfpll_config);
+
+	/* Wait for PLL(s) to lock */
+	udelay(50);
+
+	/* Enable auto clock selection for CBF */
+	regmap_update_bits(regmap, CBF_MUX_OFFSET,
+			   CBF_MUX_AUTO_CLK_SEL_BIT,
+			   CBF_MUX_AUTO_CLK_SEL_BIT);
+
+	/* Ensure write goes through before muxes are switched */
+	udelay(5);
+
+	/* Switch CBF to use the primary PLL */
+	regmap_update_bits(regmap, CBF_MUX_OFFSET, CBF_MUX_PARENT_MASK, 0x1);
+
+	for (i = 0; i < ARRAY_SIZE(cbf_msm8996_hw_clks); i++) {
+		ret = devm_clk_hw_register(dev, cbf_msm8996_hw_clks[i]);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(cbf_msm8996_clks); i++) {
+		ret = devm_clk_register_regmap(dev, cbf_msm8996_clks[i]);
+		if (ret)
+			return ret;
+	}
+
+	ret = devm_clk_notifier_register(dev, cbf_mux.clkr.hw.clk, &cbf_mux.nb);
+	if (ret)
+		return ret;
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &cbf_mux.clkr.hw);
+}
+
+static const struct of_device_id qcom_msm8996_cbf_match_table[] = {
+	{ .compatible = "qcom,msm8996-cbf" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, qcom_msm8996_cbf_match_table);
+
+static struct platform_driver qcom_msm8996_cbf_driver = {
+	.probe = qcom_msm8996_cbf_probe,
+	.driver = {
+		.name = "qcom-msm8996-cbf",
+		.of_match_table = qcom_msm8996_cbf_match_table,
+	},
+};
+
+/* Register early enough to fix the clock to be used for other cores */
+static int __init qcom_msm8996_cbf_init(void)
+{
+	return platform_driver_register(&qcom_msm8996_cbf_driver);
+}
+postcore_initcall(qcom_msm8996_cbf_init);
+
+static void __exit qcom_msm8996_cbf_exit(void)
+{
+	platform_driver_unregister(&qcom_msm8996_cbf_driver);
+}
+module_exit(qcom_msm8996_cbf_exit);
+
+MODULE_DESCRIPTION("QCOM MSM8996 CPU Bus Fabric Clock Driver");
+MODULE_LICENSE("GPL");
-- 
2.39.0

