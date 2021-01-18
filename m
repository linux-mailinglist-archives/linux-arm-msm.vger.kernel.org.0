Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6137E2F9886
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 05:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732096AbhARENk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jan 2021 23:13:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731152AbhARENi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jan 2021 23:13:38 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D654C06179F
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 20:12:47 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id i63so2357649pfg.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 20:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RmLbr7qUzl1MTnqQWZhlIJBHXutyuDgrinxDo9CCubY=;
        b=Lt0obleqpybMZAIrPC2n9Vajsw7PqlBVg+XhnXMAFYHLYcPjZTN5OFNb9SC8DCwvA5
         goM5s8urSo83hZYu058rAFKWybuHpHX9plMpPUANQ+G+Fnyn7srjF5dsnQCgyIhRsS/R
         7evN9ZWKzvWWfwyUTFj/Xlu+LRCU2bqEF4Q8TEdlkvAy83VdRmvrj5VLVToxDIIgAuEF
         52NEbaHspwxTSGzTh6qdJ5Sugp2EVXPHCvFoIcsMzslHTfYuPGnO8vdylTZdvpSCF7tu
         Rz64RuS0gXM9F+tXH8Nqhz3/4heS2me4spyzEt4D+HKYJirIqloh3T8vg9nfnNaB4H9u
         I4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RmLbr7qUzl1MTnqQWZhlIJBHXutyuDgrinxDo9CCubY=;
        b=KoKArlpSux3h6EM3BsUcj/rvPPTFFMidZLOBnMtLtIRUJenjCSaypXayJ1ShnjF4Ln
         07XIPtNrAZKgV2wPfoz59wiiNSf8iGInPCDAJkeF3LOmWBLKqdPHJAWP/vor2n3rR9zk
         asWmLdqGuEjQDurak5SB90j6EnuTwxvzMpyz9m6PIgiYY3nsRo70YsXy9y13mlLyKVvT
         RZMnAx1FZGIvS9O1xdV10qWL8GpJFuOElSSC/TMguPR0KS4bRTVKaYkYoA+12DhjpwWi
         JWgVmAy6R1PeVKci6L5c63wsnJIY4bDdwpyaWauJPkemAXjDrC5GEWXE3L/UPNX6ZK9/
         71mw==
X-Gm-Message-State: AOAM530aDsf1tkJ/Z/SrUX96lPjKXSLxr4siShVz3WeRP3bmGqZY+C2u
        J/FrLr+t2f7QOchVt6DzIqil
X-Google-Smtp-Source: ABdhPJyzMz/9WCKbybYtoh/9zmy6Zh47DU0GQKf5yyd/8y2O7AHeo+HZ5GNW/YE0emM3XyD+McFBqw==
X-Received: by 2002:a63:e246:: with SMTP id y6mr24036307pgj.412.1610943167148;
        Sun, 17 Jan 2021 20:12:47 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.182])
        by smtp.gmail.com with ESMTPSA id h15sm6727319pja.4.2021.01.17.20.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 20:12:46 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 5/5] clk: qcom: Add SDX55 APCS clock controller support
Date:   Mon, 18 Jan 2021 09:41:56 +0530
Message-Id: <20210118041156.50016-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org>
References: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org>
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
index d6f4aee4427a..ac43b715bff6 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -54,6 +54,15 @@ config QCOM_CLK_APCC_MSM8996
 	  Say Y if you want to support CPU clock scaling using CPUfreq
 	  drivers for dynamic power management.
 
+config QCOM_CLK_APCS_SDX55
+	tristate "SDX55 APCS Clock Controller"
+	depends on QCOM_APCS_IPC || COMPILE_TEST
+	help
+	  Support for the APCS Clock Controller on SDX55 platform. The
+	  APCS is managing the mux and divider which feeds the CPUs.
+	  Say Y if you want to support CPU frequency scaling on devices
+	  such as SDX55.
+
 config QCOM_CLK_RPM
 	tristate "RPM based Clock Controller"
 	depends on MFD_QCOM_RPM
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index e7e0ac382176..4de926da4b15 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -47,6 +47,7 @@ obj-$(CONFIG_QCOM_A53PLL) += a53-pll.o
 obj-$(CONFIG_QCOM_A7PLL) += a7-pll.o
 obj-$(CONFIG_QCOM_CLK_APCS_MSM8916) += apcs-msm8916.o
 obj-$(CONFIG_QCOM_CLK_APCC_MSM8996) += clk-cpu-8996.o
+obj-$(CONFIG_QCOM_CLK_APCS_SDX55) += apcs-sdx55.o
 obj-$(CONFIG_QCOM_CLK_RPM) += clk-rpm.o
 obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
 obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
diff --git a/drivers/clk/qcom/apcs-sdx55.c b/drivers/clk/qcom/apcs-sdx55.c
new file mode 100644
index 000000000000..e111e124cb7a
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
+
+static const u32 apcs_mux_clk_parent_map[] = { 0, 1, 5 };
+
+static const struct clk_parent_data pdata[] = {
+	{ .fw_name = "ref" },
+	{ .fw_name = "aux" },
+	{ .fw_name = "pll" },
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
+	int ret;
+
+	regmap = dev_get_regmap(parent, NULL);
+	if (!regmap) {
+		dev_err_probe(dev, ret, "Failed to get parent regmap\n");
+		return -ENODEV;
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
+			dev_err_probe(dev, ret, "Failed to get PLL clk\n");
+		return ret;
+	}
+
+	a7cc->clk_nb.notifier_call = a7cc_notifier_cb;
+	ret = clk_notifier_register(a7cc->pclk, &a7cc->clk_nb);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to register clock notifier\n");
+		return ret;
+	}
+
+	ret = devm_clk_register_regmap(dev, &a7cc->clkr);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to register regmap clock\n");
+		goto err;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					  &a7cc->clkr.hw);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to add clock provider\n");
+		goto err;
+	}
+
+	platform_set_drvdata(pdev, a7cc);
+
+	/*
+	 * Attach the power domain to cpudev. Since there is no dedicated driver
+	 * for CPUs and the SDX55 platform lacks hardware specific CPUFreq
+	 * driver, there seems to be no better place to do this. So do it here!
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

