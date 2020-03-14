Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAFCE18584F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2020 03:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgCOCCs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Mar 2020 22:02:48 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:55503 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727532AbgCOCCs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Mar 2020 22:02:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584237768; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=jonzZp63L40u3yfPOPtIkP2E/IYQDyZzE0IebztJjEc=; b=IMrScLk4Y0Crd+xs+FgjwZ6ekZt+i6+BP3rTYLfWbLjv1AGdglym9XTuEvavEultTLkoLxU3
 SIvul7AYgryZme4oUkF6lSBIZOJwaDgFLjY5do4vZZn5EsHtnURzXUMoEVRacM3WncwKCDs7
 LLnH4K8l4maot1dtyo42X6C0bDk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6d24ea.7f90155e8ae8-smtp-out-n01;
 Sat, 14 Mar 2020 18:39:38 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C1996C433D2; Sat, 14 Mar 2020 18:39:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 38668C43636;
        Sat, 14 Mar 2020 18:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 38668C43636
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
Subject: [PATCH v6 3/3] clk: qcom: Add modem clock controller driver for SC7180
Date:   Sun, 15 Mar 2020 00:09:07 +0530
Message-Id: <1584211147-5570-4-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584211147-5570-1-git-send-email-tdas@codeaurora.org>
References: <1584211147-5570-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the modem clock controller found on SC7180
based devices. This would allow modem drivers to probe and
control their clocks.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/Kconfig      |   9 +++
 drivers/clk/qcom/Makefile     |   1 +
 drivers/clk/qcom/mss-sc7180.c | 143 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 153 insertions(+)
 create mode 100644 drivers/clk/qcom/mss-sc7180.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 15cdcdc..4225f86 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -280,6 +280,15 @@ config SC_GPUCC_7180
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.

+config SC_MSS_7180
+	tristate "SC7180 Modem Clock Controller"
+	select SC_GCC_7180
+	help
+	  Support for the Modem Subsystem clock controller on Qualcomm
+	  Technologies, Inc on SC7180 devices.
+	  Say Y if you want to use the Modem branch clocks of the Modem
+	  subsystem clock controller to reset the MSS subsystem.
+
 config SC_VIDEOCC_7180
 	tristate "SC7180 Video Clock Controller"
 	select SC_GCC_7180
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 656a87e..9135592 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -50,6 +50,7 @@ obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
 obj-$(CONFIG_SC_DISPCC_7180) += dispcc-sc7180.o
 obj-$(CONFIG_SC_GCC_7180) += gcc-sc7180.o
 obj-$(CONFIG_SC_GPUCC_7180) += gpucc-sc7180.o
+obj-$(CONFIG_SC_MSS_7180) += mss-sc7180.o
 obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
 obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
 obj-$(CONFIG_SDM_DISPCC_845) += dispcc-sdm845.o
diff --git a/drivers/clk/qcom/mss-sc7180.c b/drivers/clk/qcom/mss-sc7180.c
new file mode 100644
index 0000000..673fa1a
--- /dev/null
+++ b/drivers/clk/qcom/mss-sc7180.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,mss-sc7180.h>
+
+#include "clk-regmap.h"
+#include "clk-branch.h"
+#include "common.h"
+
+static struct clk_branch mss_axi_nav_clk = {
+	.halt_reg = 0x20bc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "mss_axi_nav_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "gcc_mss_nav_axi",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch mss_axi_crypto_clk = {
+	.halt_reg = 0x20cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "mss_axi_crypto_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "gcc_mss_mfab_axis",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static const struct regmap_config mss_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.fast_io	= true,
+	.max_register	= 0x41aa0cc,
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
+	int ret;
+
+	pm_runtime_enable(&pdev->dev);
+	ret = pm_clk_create(&pdev->dev);
+	if (ret)
+		goto disable_pm_runtime;
+
+	ret = pm_clk_add(&pdev->dev, "cfg_ahb");
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to acquire iface clock\n");
+		goto destroy_pm_clk;
+	}
+
+	ret = qcom_cc_probe(pdev, &mss_sc7180_desc);
+	if (ret < 0)
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
+static int mss_sc7180_remove(struct platform_device *pdev)
+{
+	pm_clk_destroy(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops mss_sc7180_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static const struct of_device_id mss_sc7180_match_table[] = {
+	{ .compatible = "qcom,sc7180-mss" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mss_sc7180_match_table);
+
+static struct platform_driver mss_sc7180_driver = {
+	.probe		= mss_sc7180_probe,
+	.remove		= mss_sc7180_remove,
+	.driver		= {
+		.name		= "sc7180-mss",
+		.of_match_table = mss_sc7180_match_table,
+		.pm = &mss_sc7180_pm_ops,
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
