Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5EE92DF63B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Dec 2020 18:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgLTRAR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Dec 2020 12:00:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727732AbgLTRAP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Dec 2020 12:00:15 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146FCC0611CC
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Dec 2020 08:58:58 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id o13so18096310lfr.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Dec 2020 08:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GUFVATxRkWvu0gEzdpRSOE+JhDsO5FwGMVAPQMGoQeY=;
        b=kbnaAZ9GPhtz7qeIsEI8wxPt1gYiSfhGOdfZZEmuWrlovCPn8z9ArzWpsMnisTZOIj
         3RT0Sj5F4r0F6BhPDuVf7khJZknn17sTsH5xz+IWwk5VTF9wAdh8qqhJsSx22QLeCUnr
         jXNr6uHjcxNmnCTK+0xDXpsIKHrixSNv27Cdf1/malT7Fa6aHQVBLxObJp1TTwYve7go
         MbISSxnqDfb23U4V6cV1z4cur01B8YVU1hHLbTXd0CBcB4kHQPUOh0+h6l2ycJ8fGWFu
         SeabDAbyTDgBCWju8wMSRwqkSyYuhvbrSupeQ9r5aRui0aeYnnH7umdSUHED76AGfVYB
         oLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GUFVATxRkWvu0gEzdpRSOE+JhDsO5FwGMVAPQMGoQeY=;
        b=Qx1pqF3ZQjGWQRvRkQ/exOxj3Z7qjT/mYrTXS9AMd1CHaZW+LvFJyWv4ZSXpL2XT82
         c/yEQ84zbqRyHUtlYy1SgxbptOoJIVA+AjydTAGOgty6DQr5c1NgHkLrTfP6aiE2mnyq
         wW9RV/NLijO7B4p3RPANv4bvwnsQGa1OJPCnXN+1WUxO4MUIFluLtgBYeDqY1U+you/t
         zk8u7BgJEmOcJ1/zy+k4fxgkCbmLtIl/Bvz94T/AGjfjsLO+EvPwjrjXrV4TajIYDw3n
         KH2EZEE80cXRvMJjrxadwbdCoVmJevI2/uHRkIgMXCXwa+615l7p/jE+2ADSHvNCXKrI
         kvMg==
X-Gm-Message-State: AOAM533RS2uM53i4mtfnA58UJO369Eps9rmcqbHe3KXAXwYfT/WV78k3
        E8TPQSmusrvkNQebr/ZAzJt2g8xrC0lIjQ==
X-Google-Smtp-Source: ABdhPJz2WLqvaEQdIOrZ+X8S1+62U+a4ExHCxzgsncxgrupn1ppbZp4yYrK/ZCWVQuwr7SOdChU9Ig==
X-Received: by 2002:ac2:43a4:: with SMTP id t4mr5243852lfl.197.1608483536532;
        Sun, 20 Dec 2020 08:58:56 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.15])
        by smtp.gmail.com with ESMTPSA id t30sm1696638lft.266.2020.12.20.08.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 08:58:55 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] mfd: qca639x: add support for QCA639x powerup sequence
Date:   Sun, 20 Dec 2020 19:58:43 +0300
Message-Id: <20201220165845.3712599-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201220165845.3712599-1-dmitry.baryshkov@linaro.org>
References: <20201220165845.3712599-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm QCA639x is a family of WiFi + Bluetooth SoCs, with BT part
being controlled through the UART and WiFi being present on PCIe
bus. Both blocks share common power sources. So add mfd device driver
handling power sequencing of QCA6390/1.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/mfd/Kconfig        |  12 +++
 drivers/mfd/Makefile       |   1 +
 drivers/mfd/qcom-qca639x.c | 168 +++++++++++++++++++++++++++++++++++++
 3 files changed, 181 insertions(+)
 create mode 100644 drivers/mfd/qcom-qca639x.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index bdfce7b15621..2fd6b9770ad0 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1036,6 +1036,18 @@ config MFD_PM8XXX
 	  Say M here if you want to include support for PM8xxx chips as a
 	  module. This will build a module called "pm8xxx-core".
 
+config MFD_QCOM_QCA639X
+	tristate "Qualcomm QCA639x WiFi/Bluetooth module support"
+	depends on REGULATOR && PM_GENERIC_DOMAINS
+	help
+	  If you say yes to this option, support will be included for Qualcomm
+	  QCA639x family of WiFi and Bluetooth SoCs. Note, this driver supports
+	  only power control for this SoC, you still have to enable individual
+	  Bluetooth and WiFi drivers.
+
+	  Say M here if you want to include support for QCA639x chips as a
+	  module. This will build a module called "qcom-qca639x".
+
 config MFD_QCOM_RPM
 	tristate "Qualcomm Resource Power Manager (RPM)"
 	depends on ARCH_QCOM && OF
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 14fdb188af02..da5747508faf 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -202,6 +202,7 @@ obj-$(CONFIG_MFD_SI476X_CORE)	+= si476x-core.o
 obj-$(CONFIG_MFD_CS5535)	+= cs5535-mfd.o
 obj-$(CONFIG_MFD_OMAP_USB_HOST)	+= omap-usb-host.o omap-usb-tll.o
 obj-$(CONFIG_MFD_PM8XXX) 	+= qcom-pm8xxx.o ssbi.o
+obj-$(CONFIG_MFD_QCOM_QCA639X)	+= qcom-qca639x.o
 obj-$(CONFIG_MFD_QCOM_RPM)	+= qcom_rpm.o
 obj-$(CONFIG_MFD_SPMI_PMIC)	+= qcom-spmi-pmic.o
 obj-$(CONFIG_TPS65911_COMPARATOR)	+= tps65911-comparator.o
diff --git a/drivers/mfd/qcom-qca639x.c b/drivers/mfd/qcom-qca639x.c
new file mode 100644
index 000000000000..1ecc2e2e5bfd
--- /dev/null
+++ b/drivers/mfd/qcom-qca639x.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, Linaro Limited
+ */
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/devinfo.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+#define MAX_NUM_REGULATORS	8
+
+static struct vreg {
+	const char *name;
+	unsigned int load_uA;
+} vregs[MAX_NUM_REGULATORS] = {
+	/* 2.0 V */
+	{ "vddpcie2", 15000 },
+	{ "vddrfa3", 400000 },
+
+	/* 0.95 V */
+	{ "vddaon", 100000 },
+	{ "vddpmu", 1250000 },
+	{ "vddrfa1", 200000 },
+
+	/* 1.35 V */
+	{ "vddrfa2", 400000 },
+	{ "vddpcie1", 35000 },
+
+	/* 1.8 V */
+	{ "vddio", 20000 },
+};
+
+struct qca639x_data {
+	struct regulator_bulk_data regulators[MAX_NUM_REGULATORS];
+	size_t num_vregs;
+	struct device *dev;
+	struct pinctrl_state *active_state;
+	struct generic_pm_domain pd;
+};
+
+#define domain_to_data(domain) container_of(domain, struct qca639x_data, pd)
+
+static int qca639x_power_on(struct generic_pm_domain *domain)
+{
+	struct qca639x_data *data = domain_to_data(domain);
+	int ret;
+
+	dev_warn(&domain->dev, "DUMMY POWER ON\n");
+
+	ret = regulator_bulk_enable(data->num_vregs, data->regulators);
+	if (ret) {
+		dev_err(data->dev, "Failed to enable regulators");
+		return ret;
+	}
+
+	/* Wait for 1ms before toggling enable pins. */
+	usleep_range(1000, 2000);
+
+	ret = pinctrl_select_state(data->dev->pins->p, data->active_state);
+	if (ret) {
+		dev_err(data->dev, "Failed to select active state");
+		return ret;
+	}
+
+	/* Wait for all power levels to stabilize */
+	usleep_range(6000, 7000);
+
+	return 0;
+}
+
+static int qca639x_power_off(struct generic_pm_domain *domain)
+{
+	struct qca639x_data *data = domain_to_data(domain);
+
+	dev_warn(&domain->dev, "DUMMY POWER OFF\n");
+
+	pinctrl_select_default_state(data->dev);
+	regulator_bulk_disable(data->num_vregs, data->regulators);
+
+	return 0;
+}
+
+static int qca639x_probe(struct platform_device *pdev)
+{
+	struct qca639x_data *data;
+	struct device *dev = &pdev->dev;
+	int i, ret;
+
+	if (!dev->pins || IS_ERR_OR_NULL(dev->pins->default_state))
+		return -EINVAL;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = dev;
+	data->num_vregs = ARRAY_SIZE(vregs);
+
+	data->active_state = pinctrl_lookup_state(dev->pins->p, "active");
+	if (IS_ERR(data->active_state)) {
+		ret = PTR_ERR(data->active_state);
+		dev_err(dev, "Failed to get active_state: %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < data->num_vregs; i++)
+		data->regulators[i].supply = vregs[i].name;
+	ret = devm_regulator_bulk_get(dev, data->num_vregs, data->regulators);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < data->num_vregs; i++) {
+		ret = regulator_set_load(data->regulators[i].consumer, vregs[i].load_uA);
+		if (ret)
+			return ret;
+	}
+
+	data->pd.name = dev_name(dev);
+	data->pd.power_on = qca639x_power_on;
+	data->pd.power_off = qca639x_power_off;
+
+	ret = pm_genpd_init(&data->pd, NULL, true);
+	if (ret < 0)
+		return ret;
+
+	ret = of_genpd_add_provider_simple(dev->of_node, &data->pd);
+	if (ret < 0) {
+		pm_genpd_remove(&data->pd);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, data);
+
+	return 0;
+}
+
+static int qca639x_remove(struct platform_device *pdev)
+{
+	struct qca639x_data *data = platform_get_drvdata(pdev);
+
+	pm_genpd_remove(&data->pd);
+
+	return 0;
+}
+
+static const struct of_device_id qca639x_of_match[] = {
+	{ .compatible = "qcom,qca639x" },
+};
+
+static struct platform_driver qca639x_driver = {
+	.probe = qca639x_probe,
+	.remove = qca639x_remove,
+	.driver = {
+		.name = "qca639x",
+		.of_match_table = qca639x_of_match,
+	},
+};
+
+module_platform_driver(qca639x_driver);
+MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
+MODULE_DESCRIPTION("Power control for Qualcomm QCA639x BT/WiFi chip");
+MODULE_LICENSE("GPL v2");
-- 
2.29.2

