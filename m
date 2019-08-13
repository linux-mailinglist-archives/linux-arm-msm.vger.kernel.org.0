Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B76FC8B9A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2019 15:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728970AbfHMNKM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Aug 2019 09:10:12 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44104 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728941AbfHMNKL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Aug 2019 09:10:11 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id F297A60E7A; Tue, 13 Aug 2019 13:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565701810;
        bh=spviT9Jg9zeKifEoOnjd5ABd27NfvOpCRln3gE4zq9I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C072rqsGlzvsf5hykeTTIMzKnuscIIWUCd9HUfYLs8IJLh077ovQoGr+ZvDfGkfD9
         gKaKWt+EeNHi3WN0ziDb0gTYeZ2eOmaBU+zVwweie5j50ZNNQJKOxtI/k8vHKOymqU
         6U+ykaKrHysV00FGvacu2dxF/ifC6jLHLc4cVHDg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 97DE360DAA;
        Tue, 13 Aug 2019 13:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565701806;
        bh=spviT9Jg9zeKifEoOnjd5ABd27NfvOpCRln3gE4zq9I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kBlu2Kf7L8CCFsf2UM4B/52PzJhDVZVuOxsUgJDH2X0qWxhEVgqPLTLs7JJEwqTAH
         XQCKbczH9IidpLcmKt8jaIQ3lSuxM83X76KNEkgQzYxUAU7wbwE1c0ZSxFDBLUqjvC
         +Tw/trWeVZbvhXjEAJGSKPRshG4AYLccvdQFovso=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 97DE360DAA
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     sboyd@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-soc@vger.kernel.org, andy.gross@linaro.org,
        linux-remoteproc@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: [v2 2/2] clk: qcom: Add Q6SSTOP clock controller for QCS404
Date:   Tue, 13 Aug 2019 18:39:46 +0530
Message-Id: <20190813130946.16448-3-govinds@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813130946.16448-1-govinds@codeaurora.org>
References: <20190813130946.16448-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the Q6SSTOP clock control used on qcs404
based devices. This would allow wcss remoteproc driver to
control the required WCSS Q6SSTOP clock/reset controls to
bring the subsystem out of reset and shutdown the WCSS Q6DSP.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/clk/qcom/Kconfig                      |   8 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/q6sstop-qcs404.c             | 223 ++++++++++++++++++
 .../dt-bindings/clock/qcom,q6sstopcc-qcs404.h |  18 ++
 4 files changed, 250 insertions(+)
 create mode 100644 drivers/clk/qcom/q6sstop-qcs404.c
 create mode 100644 include/dt-bindings/clock/qcom,q6sstopcc-qcs404.h

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e1ff83cc361e..1b3c87a97521 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -250,6 +250,14 @@ config QCS_TURING_404
 	  Support for the Turing Clock Controller on QCS404, provides clocks
 	  and resets for the Turing subsystem.
 
+config QCS_Q6SSTOP_404
+	tristate "QCS404 Q6SSTOP Clock Controller"
+	select QCS_GCC_404
+	help
+	  Support for the Q6SSTOP clock controller on QCS404 devices.
+	  Say Y if you want to use the Q6SSTOP branch clocks of the WCSS clock
+	  controller to reset the Q6SSTOP subsystem.
+
 config SDM_GCC_845
 	tristate "SDM845 Global Clock Controller"
 	select QCOM_GDSC
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index f0768fb1f037..086c053e0e03 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -43,6 +43,7 @@ obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
 obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
 obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
 obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
+obj-$(CONFIG_QCS_Q6SSTOP_404) += q6sstop-qcs404.o
 obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
 obj-$(CONFIG_SDM_DISPCC_845) += dispcc-sdm845.o
 obj-$(CONFIG_SDM_GCC_660) += gcc-sdm660.o
diff --git a/drivers/clk/qcom/q6sstop-qcs404.c b/drivers/clk/qcom/q6sstop-qcs404.c
new file mode 100644
index 000000000000..b0f54a4c9365
--- /dev/null
+++ b/drivers/clk/qcom/q6sstop-qcs404.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,q6sstopcc-qcs404.h>
+
+#include "clk-regmap.h"
+#include "clk-branch.h"
+#include "common.h"
+#include "reset.h"
+
+static struct clk_branch lcc_ahbfabric_cbc_clk = {
+	.halt_reg = 0x1b004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1b004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lcc_ahbfabric_cbc_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lcc_q6ss_ahbs_cbc_clk = {
+	.halt_reg = 0x22000,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x22000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lcc_q6ss_ahbs_cbc_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lcc_q6ss_tcm_slave_cbc_clk = {
+	.halt_reg = 0x1c000,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x1c000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lcc_q6ss_tcm_slave_cbc_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lcc_q6ss_ahbm_cbc_clk = {
+	.halt_reg = 0x22004,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x22004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lcc_q6ss_ahbm_cbc_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lcc_q6ss_axim_cbc_clk = {
+	.halt_reg = 0x1c004,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x1c004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lcc_q6ss_axim_cbc_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lcc_q6ss_bcr_sleep_clk = {
+	.halt_reg = 0x6004,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x6004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lcc_q6ss_bcr_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+/* TCSR clock */
+static struct clk_branch tcsr_lcc_csr_cbcr_clk = {
+	.halt_reg = 0x8008,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x8008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "tcsr_lcc_csr_cbcr_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct regmap_config q6sstop_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.fast_io	= true,
+};
+
+static struct clk_regmap *q6sstop_qcs404_clocks[] = {
+	[LCC_AHBFABRIC_CBC_CLK] = &lcc_ahbfabric_cbc_clk.clkr,
+	[LCC_Q6SS_AHBS_CBC_CLK] = &lcc_q6ss_ahbs_cbc_clk.clkr,
+	[LCC_Q6SS_TCM_SLAVE_CBC_CLK] = &lcc_q6ss_tcm_slave_cbc_clk.clkr,
+	[LCC_Q6SS_AHBM_CBC_CLK] = &lcc_q6ss_ahbm_cbc_clk.clkr,
+	[LCC_Q6SS_AXIM_CBC_CLK] = &lcc_q6ss_axim_cbc_clk.clkr,
+	[LCC_Q6SS_BCR_SLEEP_CLK] = &lcc_q6ss_bcr_sleep_clk.clkr,
+};
+
+static const struct qcom_reset_map q6sstop_qcs404_resets[] = {
+	[Q6SSTOP_BCR_RESET] = { 0x6000 },
+};
+
+static const struct qcom_cc_desc q6sstop_qcs404_desc = {
+	.config = &q6sstop_regmap_config,
+	.clks = q6sstop_qcs404_clocks,
+	.num_clks = ARRAY_SIZE(q6sstop_qcs404_clocks),
+	.resets = q6sstop_qcs404_resets,
+	.num_resets = ARRAY_SIZE(q6sstop_qcs404_resets),
+};
+
+static struct clk_regmap *tcsr_qcs404_clocks[] = {
+	[TCSR_Q6SS_LCC_CBCR_CLK] = &tcsr_lcc_csr_cbcr_clk.clkr,
+};
+
+static const struct qcom_cc_desc tcsr_qcs404_desc = {
+	.config = &q6sstop_regmap_config,
+	.clks = tcsr_qcs404_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_qcs404_clocks),
+};
+
+static const struct of_device_id q6sstopcc_qcs404_match_table[] = {
+	{ .compatible = "qcom,qcs404-q6sstopcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, q6sstopcc_qcs404_match_table);
+
+static int q6sstopcc_qcs404_probe(struct platform_device *pdev)
+{
+	const struct qcom_cc_desc *desc;
+	int ret;
+
+	pm_runtime_enable(&pdev->dev);
+	ret = pm_clk_create(&pdev->dev);
+	if (ret)
+		goto disable_pm_runtime;
+
+	ret = pm_clk_add(&pdev->dev, NULL);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to acquire iface clock\n");
+		goto destroy_pm_clk;
+	}
+
+	q6sstop_regmap_config.name = "q6sstop_tcsr";
+	desc = &tcsr_qcs404_desc;
+
+	ret = qcom_cc_probe_by_index(pdev, 1, desc);
+	if (ret)
+		goto destroy_pm_clk;
+
+	q6sstop_regmap_config.name = "q6sstop_cc";
+	desc = &q6sstop_qcs404_desc;
+
+	ret = qcom_cc_probe_by_index(pdev, 0, desc);
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
+static int q6sstopcc_qcs404_remove(struct platform_device *pdev)
+{
+	pm_clk_destroy(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops q6sstopcc_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static struct platform_driver q6sstopcc_qcs404_driver = {
+	.probe		= q6sstopcc_qcs404_probe,
+	.remove		= q6sstopcc_qcs404_remove,
+	.driver		= {
+		.name	= "qcs404-q6sstopcc",
+		.of_match_table = q6sstopcc_qcs404_match_table,
+		.pm = &q6sstopcc_pm_ops,
+	},
+};
+
+module_platform_driver(q6sstopcc_qcs404_driver);
+
+MODULE_DESCRIPTION("QTI QCS404 Q6SSTOP Clock Controller Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/dt-bindings/clock/qcom,q6sstopcc-qcs404.h b/include/dt-bindings/clock/qcom,q6sstopcc-qcs404.h
new file mode 100644
index 000000000000..c6f5290f0914
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,q6sstopcc-qcs404.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_Q6SSTOP_QCS404_H
+#define _DT_BINDINGS_CLK_Q6SSTOP_QCS404_H
+
+#define LCC_AHBFABRIC_CBC_CLK			0
+#define LCC_Q6SS_AHBS_CBC_CLK			1
+#define LCC_Q6SS_TCM_SLAVE_CBC_CLK		2
+#define LCC_Q6SS_AHBM_CBC_CLK			3
+#define LCC_Q6SS_AXIM_CBC_CLK			4
+#define LCC_Q6SS_BCR_SLEEP_CLK			5
+#define TCSR_Q6SS_LCC_CBCR_CLK			6
+
+#define Q6SSTOP_BCR_RESET			1
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

