Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0231F42358F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 03:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237173AbhJFBml (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 21:42:41 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:12433 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237234AbhJFBmk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 21:42:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633484449; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=gKc8UBzWBnu5NoWp5EuXhlx8DnpxTw4TSDasUwh0oc8=; b=dn/VSHTzqhcUojg41j99sfQtCioL0ccQEx0TN/Dh7U6i20PD7OYqo0P/jPV4UIdi+zk38+M1
 /mzhka1bc8ood5RrTFIxSBZXlvf5+Pfo1VzTN+Q4hsW1/lgkWSK+Brb0Tk99uLhek8IMmbjC
 UKJW07889a9FXIUP3oTOka91ay4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 615cfe97b8ab9916b39cdbb1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 06 Oct 2021 01:40:39
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CFF82C43619; Wed,  6 Oct 2021 01:40:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3628CC4338F;
        Wed,  6 Oct 2021 01:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3628CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH 3/3] clk: qcom: Add lpass clock controller driver for SC7280
Date:   Wed,  6 Oct 2021 07:10:16 +0530
Message-Id: <1633484416-27852-3-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633484416-27852-1-git-send-email-tdas@codeaurora.org>
References: <1633484416-27852-1-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the lpass clock controller found on SC7280 based devices.
This would allow lpass peripheral loader drivers to control the clocks to
bring the subsystem out of reset.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/Kconfig          |   8 ++
 drivers/clk/qcom/Makefile         |   1 +
 drivers/clk/qcom/lpasscc-sc7280.c | 216 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 225 insertions(+)
 create mode 100644 drivers/clk/qcom/lpasscc-sc7280.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index f9c36a1..622cde4 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -401,6 +401,14 @@ config SC_GPUCC_7280
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.

+config SC_LPASSCC_7280
+	tristate "SC7280 Low Power Audio Subsystem (LPASS) Clock Controller"
+	select SC_GCC_7280
+	help
+	  Support for the LPASS clock controller on SC7280 devices.
+	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
+	  controller to reset the LPASS subsystem.
+
 config SC_LPASS_CORECC_7180
 	tristate "SC7180 LPASS Core Clock Controller"
 	select SC_GCC_7180
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 9825ef8..8b9b01e 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -65,6 +65,7 @@ obj-$(CONFIG_SC_GCC_7280) += gcc-sc7280.o
 obj-$(CONFIG_SC_GCC_8180X) += gcc-sc8180x.o
 obj-$(CONFIG_SC_GPUCC_7180) += gpucc-sc7180.o
 obj-$(CONFIG_SC_GPUCC_7280) += gpucc-sc7280.o
+obj-$(CONFIG_SC_LPASSCC_7280) += lpasscc-sc7280.o
 obj-$(CONFIG_SC_LPASS_CORECC_7180) += lpasscorecc-sc7180.o
 obj-$(CONFIG_SC_MSS_7180) += mss-sc7180.o
 obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
diff --git a/drivers/clk/qcom/lpasscc-sc7280.c b/drivers/clk/qcom/lpasscc-sc7280.c
new file mode 100644
index 0000000..89f1ad6
--- /dev/null
+++ b/drivers/clk/qcom/lpasscc-sc7280.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,lpass-sc7280.h>
+
+#include "clk-regmap.h"
+#include "clk-branch.h"
+#include "common.h"
+
+static struct clk_branch lpass_q6ss_ahbm_clk = {
+	.halt_reg = 0x1c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_q6ss_ahbm_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_q6ss_ahbs_clk = {
+	.halt_reg = 0x20,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x20,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_q6ss_ahbs_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_top_cc_lpi_q6_axim_hs_clk = {
+	.halt_reg = 0x0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_top_cc_lpi_q6_axim_hs_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_qdsp6ss_core_clk = {
+	.halt_reg = 0x20,
+	/* CLK_OFF would not toggle until LPASS is out of reset */
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x20,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_qdsp6ss_core_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_qdsp6ss_xo_clk = {
+	.halt_reg = 0x38,
+	/* CLK_OFF would not toggle until LPASS is out of reset */
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x38,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_qdsp6ss_xo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_qdsp6ss_sleep_clk = {
+	.halt_reg = 0x3c,
+	/* CLK_OFF would not toggle until LPASS is out of reset */
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x3c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_qdsp6ss_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct regmap_config lpass_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.fast_io	= true,
+};
+
+static struct clk_regmap *lpass_cc_sc7280_clocks[] = {
+	[LPASS_Q6SS_AHBM_CLK] = &lpass_q6ss_ahbm_clk.clkr,
+	[LPASS_Q6SS_AHBS_CLK] = &lpass_q6ss_ahbs_clk.clkr,
+};
+
+static const struct qcom_cc_desc lpass_cc_sc7280_desc = {
+	.config = &lpass_regmap_config,
+	.clks = lpass_cc_sc7280_clocks,
+	.num_clks = ARRAY_SIZE(lpass_cc_sc7280_clocks),
+};
+
+static struct clk_regmap *lpass_cc_top_sc7280_clocks[] = {
+	[LPASS_TOP_CC_LPI_Q6_AXIM_HS_CLK] =
+				&lpass_top_cc_lpi_q6_axim_hs_clk.clkr,
+};
+
+static const struct qcom_cc_desc lpass_cc_top_sc7280_desc = {
+	.config = &lpass_regmap_config,
+	.clks = lpass_cc_top_sc7280_clocks,
+	.num_clks = ARRAY_SIZE(lpass_cc_top_sc7280_clocks),
+};
+
+static struct clk_regmap *lpass_qdsp6ss_sc7280_clocks[] = {
+	[LPASS_QDSP6SS_XO_CLK] = &lpass_qdsp6ss_xo_clk.clkr,
+	[LPASS_QDSP6SS_SLEEP_CLK] = &lpass_qdsp6ss_sleep_clk.clkr,
+	[LPASS_QDSP6SS_CORE_CLK] = &lpass_qdsp6ss_core_clk.clkr,
+};
+
+static const struct qcom_cc_desc lpass_qdsp6ss_sc7280_desc = {
+	.config = &lpass_regmap_config,
+	.clks = lpass_qdsp6ss_sc7280_clocks,
+	.num_clks = ARRAY_SIZE(lpass_qdsp6ss_sc7280_clocks),
+};
+
+static int lpass_cc_sc7280_probe(struct platform_device *pdev)
+{
+	const struct qcom_cc_desc *desc;
+	int ret;
+
+	pm_runtime_enable(&pdev->dev);
+	ret = pm_clk_create(&pdev->dev);
+	if (ret)
+		goto disable_pm_runtime;
+
+	ret = pm_clk_add(&pdev->dev, "iface");
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to acquire iface clock\n");
+		goto destroy_pm_clk;
+	}
+
+	lpass_regmap_config.name = "qdsp6ss";
+	desc = &lpass_qdsp6ss_sc7280_desc;
+
+	ret = qcom_cc_probe_by_index(pdev, 0, desc);
+	if (ret)
+		goto destroy_pm_clk;
+
+	lpass_regmap_config.name = "top_cc";
+	desc = &lpass_cc_top_sc7280_desc;
+
+	ret = qcom_cc_probe_by_index(pdev, 1, desc);
+	if (ret)
+		goto destroy_pm_clk;
+
+	lpass_regmap_config.name = "cc";
+	desc = &lpass_cc_sc7280_desc;
+
+	ret = qcom_cc_probe_by_index(pdev, 2, desc);
+	if (ret)
+		goto destroy_pm_clk;
+
+	return 0;
+
+destroy_pm_clk:
+	pm_clk_destroy(&pdev->dev);
+
+disable_pm_runtime:
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static const struct of_device_id lpass_cc_sc7280_match_table[] = {
+	{ .compatible = "qcom,sc7280-lpasscc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpass_cc_sc7280_match_table);
+
+static struct platform_driver lpass_cc_sc7280_driver = {
+	.probe		= lpass_cc_sc7280_probe,
+	.driver		= {
+		.name	= "sc7280-lpasscc",
+		.of_match_table = lpass_cc_sc7280_match_table,
+	},
+};
+
+static int __init lpass_cc_sc7280_init(void)
+{
+	return platform_driver_register(&lpass_cc_sc7280_driver);
+}
+subsys_initcall(lpass_cc_sc7280_init);
+
+static void __exit lpass_cc_sc7280_exit(void)
+{
+	platform_driver_unregister(&lpass_cc_sc7280_driver);
+}
+module_exit(lpass_cc_sc7280_exit);
+
+MODULE_DESCRIPTION("QTI LPASS_CC SC7280 Driver");
+MODULE_LICENSE("GPL v2");
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

