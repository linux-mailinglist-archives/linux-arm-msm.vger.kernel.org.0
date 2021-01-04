Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA612E918D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 09:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbhADINQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 03:13:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbhADINP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 03:13:15 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6222C0617BA
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 00:12:04 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id n25so18623802pgb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 00:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uOArHEk74zxp/6R3wPGuqn1ZRRiW7s9F52OXIpe5TrE=;
        b=FivOHfrboOpdeFtFAuYKXJVPL2wZyskFjtEDu8GWnsIjVE6dSwfH03r+nk+7Xtoa6F
         6ZwclVjWES1UGDfajr7p08X6qcizFw+Ib0P8DHA3Taou3RMa58vj3+UPBpusFZJ+Lw5n
         7zINpXJR/eyDjNjt9lC59pndDtNM5eAXNbmwh9qsGV/80jgmFH83kYY8QW4LSUstrLuR
         nadTGVt2/D/pT0lrkGrAOGLWBSWCQ1kjAseIGkZhLpFudivTwyyFNgTXXa6fmHQDtUSa
         JdRNnUTkCwe97d07XW/NvJZzo97/F5YKnAJuwpfpUyrRIpS9ExiMRldfwIyTRrpuZSqw
         CsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uOArHEk74zxp/6R3wPGuqn1ZRRiW7s9F52OXIpe5TrE=;
        b=kC3mFjzhKBB51zyLn8OoOB4AI4IdQKHjpIgC+CsdTG58ywtcL+wQVjU+l9jGlKnCHE
         RSPPlnXFoJZJac817dvq6I6iEEicqIzAqb1lS59RQYC3iHIXFg9Xs4UvSfXxlY/N1vGo
         DywFHs46hbzsf63oeOJNXWy1ralaMwA91/IatJsefu4vTV4LDtyB1woAgz4Rx+TN9T/R
         G1LYnVxvikqOJ4ElHA2CmFI0gJiU+mkbl+7daqPAE5DRU3ORbStzAE7i2P9b3BfbE7yk
         C58YkoUxQ7PF+F5P2w0SJbttf34rushbHojYtZopUEqxlBFWKG18xQ9wmwnndA7Mi0hY
         qdCQ==
X-Gm-Message-State: AOAM530xwaXlj79PSpEUfQgA/2cSc5zQuyaSpwDKtia5575BEEto4AeN
        oj7Ls0zyquEXgbzYEEvZdifF
X-Google-Smtp-Source: ABdhPJxE3BqIJsJ8naQa/DIb8BS95/0zYLM4AFPVp6E3ZKDMwBqc7aVLk3bBVyovMIoie2bt7o/XUA==
X-Received: by 2002:a63:5924:: with SMTP id n36mr58899261pgb.9.1609747924240;
        Mon, 04 Jan 2021 00:12:04 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.160])
        by smtp.gmail.com with ESMTPSA id n7sm55051339pfn.141.2021.01.04.00.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 00:12:03 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 5/5] clk: qcom: Add SDX55 APCS clock controller support
Date:   Mon,  4 Jan 2021 13:41:25 +0530
Message-Id: <20210104081125.147300-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210104081125.147300-1-manivannan.sadhasivam@linaro.org>
References: <20210104081125.147300-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a driver for the SDX55 APCS clock controller. It is part of the APCS
hardware block, which among other things implements also a combined mux
and half integer divider functionality. The APCS clock controller has 3
parent clocks:

1. Board XO
2. Fixed rate GPLL0
3. A7 PLL

The source and the divider can be set both at the same time.

This is required for enabling CPU frequency scaling on SDX55-based
platforms.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/qcom/Kconfig      |   9 ++
 drivers/clk/qcom/Makefile     |   1 +
 drivers/clk/qcom/apcs-sdx55.c | 149 ++++++++++++++++++++++++++++++++++
 3 files changed, 159 insertions(+)
 create mode 100644 drivers/clk/qcom/apcs-sdx55.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d6f4aee4427a..2c67fdfae913 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -45,6 +45,15 @@ config QCOM_CLK_APCS_MSM8916
 	  Say Y if you want to support CPU frequency scaling on devices
 	  such as msm8916.
 
+config QCOM_CLK_APCS_SDX55
+	tristate "SDX55 APCS Clock Controller"
+	depends on QCOM_APCS_IPC || COMPILE_TEST
+	help
+	  Support for the APCS Clock Controller on SDX55 platform. The
+	  APCS is managing the mux and divider which feeds the CPUs.
+	  Say Y if you want to support CPU frequency scaling on devices
+	  such as SDX55.
+
 config QCOM_CLK_APCC_MSM8996
 	tristate "MSM8996 CPU Clock Controller"
 	select QCOM_KRYO_L2_ACCESSORS
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index e7e0ac382176..a9271f40916c 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_MSM_MMCC_8998) += mmcc-msm8998.o
 obj-$(CONFIG_QCOM_A53PLL) += a53-pll.o
 obj-$(CONFIG_QCOM_A7PLL) += a7-pll.o
 obj-$(CONFIG_QCOM_CLK_APCS_MSM8916) += apcs-msm8916.o
+obj-$(CONFIG_QCOM_CLK_APCS_SDX55) += apcs-sdx55.o
 obj-$(CONFIG_QCOM_CLK_APCC_MSM8996) += clk-cpu-8996.o
 obj-$(CONFIG_QCOM_CLK_RPM) += clk-rpm.o
 obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
diff --git a/drivers/clk/qcom/apcs-sdx55.c b/drivers/clk/qcom/apcs-sdx55.c
new file mode 100644
index 000000000000..14413c957d83
--- /dev/null
+++ b/drivers/clk/qcom/apcs-sdx55.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Qualcomm SDX55 APCS clock controller driver
+ *
+ * Copyright (c) 2020, Linaro Limited
+ * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/cpu.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#include "clk-regmap.h"
+#include "clk-regmap-mux-div.h"
+#include "common.h"
+
+static const u32 apcs_mux_clk_parent_map[] = { 0, 1, 5 };
+
+static const struct clk_parent_data pdata[] = {
+	{ .fw_name = "ref", .name = "bi_tcxo", },
+	{ .fw_name = "aux", .name = "gpll0", },
+	{ .fw_name = "pll", .name = "a7pll", },
+};
+
+/*
+ * We use the notifier function for switching to a temporary safe configuration
+ * (mux and divider), while the A7 PLL is reconfigured.
+ */
+static int a7cc_notifier_cb(struct notifier_block *nb, unsigned long event,
+			    void *data)
+{
+	int ret = 0;
+	struct clk_regmap_mux_div *md = container_of(nb,
+						     struct clk_regmap_mux_div,
+						     clk_nb);
+	if (event == PRE_RATE_CHANGE)
+		/* set the mux and divider to safe frequency (400mhz) */
+		ret = mux_div_set_src_div(md, 1, 2);
+
+	return notifier_from_errno(ret);
+}
+
+static int qcom_apcs_sdx55_clk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device *parent = dev->parent;
+	struct device *cpu_dev;
+	struct clk_regmap_mux_div *a7cc;
+	struct regmap *regmap;
+	struct clk_init_data init = { };
+	int ret = -ENODEV;
+
+	regmap = dev_get_regmap(parent, NULL);
+	if (!regmap) {
+		dev_err(dev, "Failed to get parent regmap: %d\n", ret);
+		return ret;
+	}
+
+	a7cc = devm_kzalloc(dev, sizeof(*a7cc), GFP_KERNEL);
+	if (!a7cc)
+		return -ENOMEM;
+
+	init.name = "a7mux";
+	init.parent_data = pdata;
+	init.num_parents = ARRAY_SIZE(pdata);
+	init.ops = &clk_regmap_mux_div_ops;
+
+	a7cc->clkr.hw.init = &init;
+	a7cc->clkr.regmap = regmap;
+	a7cc->reg_offset = 0x8;
+	a7cc->hid_width = 5;
+	a7cc->hid_shift = 0;
+	a7cc->src_width = 3;
+	a7cc->src_shift = 8;
+	a7cc->parent_map = apcs_mux_clk_parent_map;
+
+	a7cc->pclk = devm_clk_get(parent, "pll");
+	if (IS_ERR(a7cc->pclk)) {
+		ret = PTR_ERR(a7cc->pclk);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get PLL clk: %d\n", ret);
+		return ret;
+	}
+
+	a7cc->clk_nb.notifier_call = a7cc_notifier_cb;
+	ret = clk_notifier_register(a7cc->pclk, &a7cc->clk_nb);
+	if (ret) {
+		dev_err(dev, "Failed to register clock notifier: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_clk_register_regmap(dev, &a7cc->clkr);
+	if (ret) {
+		dev_err(dev, "Failed to register regmap clock: %d\n", ret);
+		goto err;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					  &a7cc->clkr.hw);
+	if (ret) {
+		dev_err(dev, "Failed to add clock provider: %d\n", ret);
+		goto err;
+	}
+
+	platform_set_drvdata(pdev, a7cc);
+
+	/*
+	 * Attach the power domain to cpudev. There seems to be no better place
+	 * to do this, so do it here.
+	 */
+	cpu_dev = get_cpu_device(0);
+	dev_pm_domain_attach(cpu_dev, true);
+
+	return 0;
+
+err:
+	clk_notifier_unregister(a7cc->pclk, &a7cc->clk_nb);
+	return ret;
+}
+
+static int qcom_apcs_sdx55_clk_remove(struct platform_device *pdev)
+{
+	struct device *cpu_dev = get_cpu_device(0);
+	struct clk_regmap_mux_div *a7cc = platform_get_drvdata(pdev);
+
+	clk_notifier_unregister(a7cc->pclk, &a7cc->clk_nb);
+	dev_pm_domain_detach(cpu_dev, true);
+
+	return 0;
+}
+
+static struct platform_driver qcom_apcs_sdx55_clk_driver = {
+	.probe = qcom_apcs_sdx55_clk_probe,
+	.remove = qcom_apcs_sdx55_clk_remove,
+	.driver = {
+		.name = "qcom-sdx55-acps-clk",
+	},
+};
+module_platform_driver(qcom_apcs_sdx55_clk_driver);
+
+MODULE_AUTHOR("Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Qualcomm SDX55 APCS clock driver");
-- 
2.25.1

