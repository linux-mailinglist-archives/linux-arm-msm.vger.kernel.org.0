Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFF2E12B10C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 05:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbfL0EnX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Dec 2019 23:43:23 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:29961 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727092AbfL0EnX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Dec 2019 23:43:23 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577421802; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=+w4VPgvzKOWeJumf2aQXm/Y5ytGG/fU0eKdAUYPJ/sQ=; b=H7FPuGxFC4BUSRDXwPKJTkYnRJ+wVTS6L5pUKQYWjn6GgNwpWnt6uOMnjWtem567lSPyKYFB
 CLe2Bpj8Tznj8ZiS8VzriU3QLRm4xLzyjlZAdgcK5NFrdrmerJ0704X50/6mB7wLLIOxeC2M
 oWQ/kDFCuZHkC/IosK20EZoHKOo=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e058be9.7f6fbf6bbb20-smtp-out-n02;
 Fri, 27 Dec 2019 04:43:21 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BCD56C447A6; Fri, 27 Dec 2019 04:43:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CEA40C4479F;
        Fri, 27 Dec 2019 04:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CEA40C4479F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 3/3] clk: qcom: Add modem clock controller driver for SC7180
Date:   Fri, 27 Dec 2019 10:12:40 +0530
Message-Id: <1577421760-1174-4-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577421760-1174-1-git-send-email-tdas@codeaurora.org>
References: <1577421760-1174-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the modem clock controller found on SC7180
based devices. This would allow modem drivers to probe and
control their clocks.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/Kconfig      |  9 +++++
 drivers/clk/qcom/Makefile     |  1 +
 drivers/clk/qcom/gcc-sc7180.c | 70 ++++++++++++++++++++++++++++++++
 drivers/clk/qcom/mss-sc7180.c | 94 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 174 insertions(+)
 create mode 100644 drivers/clk/qcom/mss-sc7180.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 3b33ef1..5d4b6e5 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -245,6 +245,15 @@ config SC_GCC_7180
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  I2C, USB, UFS, SDCC, etc.

+config SC_MSS_7180
+	tristate "SC7180 MSS Clock Controller"
+	select SC_GCC_7180
+	help
+	  Support for the MSS clock controller on Qualcomm Technologies, Inc
+	  SC7180 devices.
+	  Say Y if you want to use the MSS branch clocks of the MSS clock
+	  controller to reset the MSS subsystem.
+
 config SDM_CAMCC_845
 	tristate "SDM845 Camera Clock Controller"
 	select SDM_GCC_845
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index d899661..0e66bc6 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
 obj-$(CONFIG_QCS_Q6SSTOP_404) += q6sstop-qcs404.o
 obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
 obj-$(CONFIG_SC_GCC_7180) += gcc-sc7180.o
+obj-$(CONFIG_SC_MSS_7180) += mss-sc7180.o
 obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
 obj-$(CONFIG_SDM_DISPCC_845) += dispcc-sdm845.o
 obj-$(CONFIG_SDM_GCC_660) += gcc-sdm660.o
diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index 38424e6..7b3a705 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -2165,6 +2165,71 @@ static struct clk_branch gcc_video_xo_clk = {
 	},
 };

+static struct clk_branch gcc_mss_cfg_ahb_clk = {
+	.halt_reg = 0x8a000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8a000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_cfg_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_mfab_axis_clk = {
+	.halt_reg = 0x8a004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8a004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_mfab_axis_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_nav_axi_clk = {
+	.halt_reg = 0x8a00c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8a00c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_nav_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_snoc_axi_clk = {
+	.halt_reg = 0x8a150,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8a150,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_snoc_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_q6_memnoc_axi_clk = {
+	.halt_reg = 0x8a154,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8a154,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_q6_memnoc_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct gdsc ufs_phy_gdsc = {
 	.gdscr = 0x77004,
 	.pd = {
@@ -2334,6 +2399,11 @@ static struct clk_regmap *gcc_sc7180_clocks[] = {
 	[GPLL7] = &gpll7.clkr,
 	[GPLL4] = &gpll4.clkr,
 	[GPLL1] = &gpll1.clkr,
+	[GCC_MSS_CFG_AHB_CBCR] = &gcc_mss_cfg_ahb_clk.clkr,
+	[GCC_MSS_MFAB_AXIS_CBCR] = &gcc_mss_mfab_axis_clk.clkr,
+	[GCC_MSS_NAV_AXI_CBCR] = &gcc_mss_nav_axi_clk.clkr,
+	[GCC_MSS_Q6_MEMNOC_AXI_CBCR] = &gcc_mss_q6_memnoc_axi_clk.clkr,
+	[GCC_MSS_SNOC_AXI_CBCR] = &gcc_mss_snoc_axi_clk.clkr,
 };

 static const struct qcom_reset_map gcc_sc7180_resets[] = {
diff --git a/drivers/clk/qcom/mss-sc7180.c b/drivers/clk/qcom/mss-sc7180.c
new file mode 100644
index 0000000..24c38dc
--- /dev/null
+++ b/drivers/clk/qcom/mss-sc7180.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,mss-sc7180.h>
+
+#include "clk-regmap.h"
+#include "clk-branch.h"
+#include "common.h"
+
+static struct clk_branch mss_axi_nav_clk = {
+	.halt_reg = 0xbc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xbc,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "mss_axi_nav_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mss_axi_crypto_clk = {
+	.halt_reg = 0xcc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xcc,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "mss_axi_crypto_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct regmap_config mss_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.fast_io	= true,
+};
+
+static struct clk_regmap *mss_sc7180_clocks[] = {
+	[MSS_AXI_CRYPTO_CLK] = &mss_axi_crypto_clk.clkr,
+	[MSS_AXI_NAV_CLK] = &mss_axi_nav_clk.clkr,
+};
+
+static const struct qcom_cc_desc mss_sc7180_desc = {
+	.config = &mss_regmap_config,
+	.clks = mss_sc7180_clocks,
+	.num_clks = ARRAY_SIZE(mss_sc7180_clocks),
+};
+
+static int mss_sc7180_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &mss_sc7180_desc);
+}
+
+static const struct of_device_id mss_sc7180_match_table[] = {
+	{ .compatible = "qcom,sc7180-mss" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mss_sc7180_match_table);
+
+static struct platform_driver mss_sc7180_driver = {
+	.probe		= mss_sc7180_probe,
+	.driver		= {
+		.name		= "sc7180-mss",
+		.of_match_table = mss_sc7180_match_table,
+	},
+};
+
+static int __init mss_sc7180_init(void)
+{
+	return platform_driver_register(&mss_sc7180_driver);
+}
+subsys_initcall(mss_sc7180_init);
+
+static void __exit mss_sc7180_exit(void)
+{
+	platform_driver_unregister(&mss_sc7180_driver);
+}
+module_exit(mss_sc7180_exit);
+
+MODULE_DESCRIPTION("QTI MSS SC7180 Driver");
+MODULE_LICENSE("GPL v2");
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
