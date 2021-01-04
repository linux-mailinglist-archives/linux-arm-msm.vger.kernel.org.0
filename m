Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70E012E918C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 09:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbhADINQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 03:13:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbhADINP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 03:13:15 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E30AC0617AA
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 00:11:59 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id g15so18593231pgu.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 00:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9oCBXEeItNyLdmXrVsfC7b3QROxgUzyHxaMFoVN3rtU=;
        b=hDEUNdAPJAtX++LhX22u+wNGUejjDE3QtoLzFGtKdF7HXXIxaXhOLHsrhp03rg5V/n
         +IDIrrysw1k0ISM1TcTAJnTjp2xYV0krvwNYP+t7BR3o0KKzjJSqe3AJ/LWGIHAaJ2n7
         boFOf0AvtZ3SQ2IY57IzUfM2k+Ve9sHwuaY9hDhB+abS5UHLpJtMnVew150/1chRYl4a
         3qKWDVcwOcV6/4x6Px3+BS/DDZ26XSLZLN1LxJwo9D8I0LNIvVc0+jpCOfLQonbW4ycx
         H18QB+NVqwx2N98Pkyq21hLHOKkVInAcux1eKarBboNmtBjyQjFlpjJCXvPcHBv+lEA4
         Nejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9oCBXEeItNyLdmXrVsfC7b3QROxgUzyHxaMFoVN3rtU=;
        b=FFZybstuIvjYpSjbr6YNoNiW454tRk/KZCYm44SEVToi0GwLL5E9iK/NK5evCizFin
         4IOR0Zyl1fZeZjA8ki4j0YKX4atjtrC7SVqbskAYtJPld6C4phmhooKcHLDTfSA2L2Bi
         UuDCUphbEGjObxxaAfFWXhMCH7eOp5pMmktgCgLk1+j0Gh8NVYcCpc+eGg0ZuyHwiVN7
         lRqlCD0uBebiPn6YAfi4M7+TpMJgm19wdRxvgiYfA1Jfpccotta+uLgHpmcFvlCNnWYK
         0nbYVyn9hKmF54n/Dzr3rS7/kWbHPsa71S735YrS9kF3XN4bUGurth2dWhQs6yaw2gSd
         OfrA==
X-Gm-Message-State: AOAM530I0pnir3+klogONQYW6W8svfaQn4zmqUZLFx/UwvgyWz9q1qh9
        xCjmuKpDrrnddcMhLS1iW8By
X-Google-Smtp-Source: ABdhPJwUHjiqIxuEhe8OSMHowC/PaOq86NbHf8v11huUtIh61+qm9ixhKtBb4F3zIAoAq8gyXSad7Q==
X-Received: by 2002:a62:87c9:0:b029:1a5:9d56:7e24 with SMTP id i192-20020a6287c90000b02901a59d567e24mr64204861pfe.56.1609747918870;
        Mon, 04 Jan 2021 00:11:58 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.160])
        by smtp.gmail.com with ESMTPSA id n7sm55051339pfn.141.2021.01.04.00.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 00:11:58 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 4/5] clk: qcom: Add A7 PLL support
Date:   Mon,  4 Jan 2021 13:41:24 +0530
Message-Id: <20210104081125.147300-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210104081125.147300-1-manivannan.sadhasivam@linaro.org>
References: <20210104081125.147300-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for PLL found in Qualcomm SDX55 platforms which is used to
provide clock to the Cortex A7 CPU via a mux. This PLL can provide high
frequency clock to the CPU above 1GHz as compared to the other sources
like GPLL0.

In this driver, the power domain is attached to the cpudev. This is
required for CPUFreq functionality and there seems to be no better place
to do other than this driver (no dedicated CPUFreq driver).

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/qcom/Kconfig  |   8 +++
 drivers/clk/qcom/Makefile |   1 +
 drivers/clk/qcom/a7-pll.c | 100 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 109 insertions(+)
 create mode 100644 drivers/clk/qcom/a7-pll.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d32bb12cd8d0..d6f4aee4427a 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -28,6 +28,14 @@ config QCOM_A53PLL
 	  Say Y if you want to support higher CPU frequencies on MSM8916
 	  devices.
 
+config QCOM_A7PLL
+	tristate "SDX55 A7 PLL"
+	help
+	  Support for the A7 PLL on SDX55 devices. It provides the CPU with
+	  frequencies above 1GHz.
+	  Say Y if you want to support higher CPU frequencies on SDX55
+	  devices.
+
 config QCOM_CLK_APCS_MSM8916
 	tristate "MSM8916 APCS Clock Controller"
 	depends on QCOM_APCS_IPC || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 9e5e0e3cb7b4..e7e0ac382176 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_MSM_MMCC_8974) += mmcc-msm8974.o
 obj-$(CONFIG_MSM_MMCC_8996) += mmcc-msm8996.o
 obj-$(CONFIG_MSM_MMCC_8998) += mmcc-msm8998.o
 obj-$(CONFIG_QCOM_A53PLL) += a53-pll.o
+obj-$(CONFIG_QCOM_A7PLL) += a7-pll.o
 obj-$(CONFIG_QCOM_CLK_APCS_MSM8916) += apcs-msm8916.o
 obj-$(CONFIG_QCOM_CLK_APCC_MSM8996) += clk-cpu-8996.o
 obj-$(CONFIG_QCOM_CLK_RPM) += clk-rpm.o
diff --git a/drivers/clk/qcom/a7-pll.c b/drivers/clk/qcom/a7-pll.c
new file mode 100644
index 000000000000..e171d3caf2cf
--- /dev/null
+++ b/drivers/clk/qcom/a7-pll.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Qualcomm A7 PLL driver
+ *
+ * Copyright (c) 2020, Linaro Limited
+ * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "clk-alpha-pll.h"
+
+#define LUCID_PLL_OFF_L_VAL 0x04
+
+static const struct pll_vco lucid_vco[] = {
+	{ 249600000, 2000000000, 0 },
+};
+
+static struct clk_alpha_pll a7pll = {
+	.offset = 0x100,
+	.vco_table = lucid_vco,
+	.num_vco = ARRAY_SIZE(lucid_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "a7pll",
+			.parent_data =  &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_ops,
+		},
+	},
+};
+
+static const struct alpha_pll_config a7pll_config = {
+	.l = 0x39,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x2261,
+	.config_ctl_hi1_val = 0x029A699C,
+	.user_ctl_val = 0x1,
+	.user_ctl_hi_val = 0x805,
+};
+
+static const struct regmap_config a7pll_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= 0x1000,
+	.fast_io		= true,
+};
+
+static int qcom_a7pll_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	void __iomem *base;
+	u32 l_val;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(dev, base, &a7pll_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/* Configure PLL only if the l_val is zero */
+	regmap_read(regmap, a7pll.offset + LUCID_PLL_OFF_L_VAL, &l_val);
+	if (!l_val)
+		clk_lucid_pll_configure(&a7pll, regmap, &a7pll_config);
+
+	ret = devm_clk_register_regmap(dev, &a7pll.clkr);
+	if (ret)
+		return ret;
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					   &a7pll.clkr.hw);
+}
+
+static const struct of_device_id qcom_a7pll_match_table[] = {
+	{ .compatible = "qcom,sdx55-a7pll" },
+	{ }
+};
+
+static struct platform_driver qcom_a7pll_driver = {
+	.probe = qcom_a7pll_probe,
+	.driver = {
+		.name = "qcom-a7pll",
+		.of_match_table = qcom_a7pll_match_table,
+	},
+};
+module_platform_driver(qcom_a7pll_driver);
+
+MODULE_DESCRIPTION("Qualcomm A7 PLL Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

