Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B47543526CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 09:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234211AbhDBHCl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 03:02:41 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:11205 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234173AbhDBHCk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 03:02:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617346960; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ZUIpeuwwIF+5AU1ymS6s0cdr+WEMIC827X1Ml9ZmXZ4=; b=Hxxt84qNeyiHaM7HL8u2gX3SDsHkZI9nMT0NbCC2fRZbnQaOZd6qEp5WNJiWVGkXLP61PJhn
 eHZxrBGyeAy40K1MDmMOFd5zvez9mL+xfGFMjkd7IvUmt/0AmUXnaS9SZuYcNh14ZM2R31P2
 1+/3orb0V5NsHorFuYrAqp86LlY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6066c1819a9ff96d95ebec3d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 02 Apr 2021 07:02:25
 GMT
Sender: manafm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CC22DC433ED; Fri,  2 Apr 2021 07:02:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: manafm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 26077C43462;
        Fri,  2 Apr 2021 07:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 26077C43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=manafm@codeaurora.org
From:   Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Meethalavalappu Pallikunhi <manafm@codeaurora.org>,
        Ram Chandrasekar <rkumbako@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>
Subject: [RFC PATCH 2/2] drivers: soc: qcom: Add SDPM clock monitor driver
Date:   Fri,  2 Apr 2021 12:29:07 +0530
Message-Id: <1617346747-8611-3-git-send-email-manafm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617346747-8611-1-git-send-email-manafm@codeaurora.org>
References: <1617346747-8611-1-git-send-email-manafm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SDPM clock monitor driver, which will register for clock rate
change notification and write the clock rate into SDPM CSR register.

Signed-off-by: Ram Chandrasekar <rkumbako@codeaurora.org>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
---
 drivers/soc/qcom/Kconfig            |   8 ++
 drivers/soc/qcom/Makefile           |   1 +
 drivers/soc/qcom/sdpm_clk_monitor.c | 217 ++++++++++++++++++++++++++++++++++++
 3 files changed, 226 insertions(+)
 create mode 100644 drivers/soc/qcom/sdpm_clk_monitor.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 9464ff4..1f04d69 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -237,4 +237,12 @@ config QCOM_APR
 	  used by audio driver to configure QDSP6
 	  ASM, ADM and AFE modules.
 
+config QCOM_SDPM_CLOCK_MONITOR
+	tristate "Qualcomm SDPM Clock Monitor"
+	depends on COMMON_CLK
+	help
+	    This enables the Qualcomm SDPM Clock Monitor. This driver can register
+	    for different clock rate change notifications and write the clock
+	    rate into the SDPM CSR register. This driver will receive the clock
+	    list and the CSR details from devicetree.
 endmenu
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index d658a10..4eef767 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -29,3 +29,4 @@ obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
 obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=	kryo-l2-accessors.o
 obj-$(CONFIG_QCOM_LLCC_PERFMON) += llcc_perfmon.o
 obj-$(CONFIG_QCOM_MEMORY_DUMP_V2) += memory_dump_v2.o
+obj-$(CONFIG_QCOM_SDPM_CLOCK_MONITOR) += sdpm_clk_monitor.o
diff --git a/drivers/soc/qcom/sdpm_clk_monitor.c b/drivers/soc/qcom/sdpm_clk_monitor.c
new file mode 100644
index 00000000..1aee119
--- /dev/null
+++ b/drivers/soc/qcom/sdpm_clk_monitor.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#define pr_fmt(fmt) "%s " fmt, KBUILD_MODNAME
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define SDPM_DRIVER		"sdpm-clk-monitor"
+#define CSR_MAX_VAL		7
+#define CSR_OFFSET		0xF00
+#define FREQ_HZ_TO_MHZ(f)	DIV_ROUND_UP((f), 1000000)
+#define SDPM_CSR_OFFSET(id)	(CSR_OFFSET + (id * 4))
+
+struct sdpm_clk_instance;
+struct sdpm_clk_data {
+	struct list_head		sdpm_node;
+	struct notifier_block		clk_rate_nb;
+	struct clk			*clk;
+	const char			*clock_name;
+	uint32_t			csr_id;
+	struct sdpm_clk_instance	*sdpm_inst;
+};
+
+struct sdpm_clk_instance {
+	struct device			*dev;
+	void __iomem			*regmap;
+	struct list_head		sdpm_instances;
+};
+
+static void sdpm_csr_write(struct sdpm_clk_data *sdpm_data,
+				unsigned long clk_rate)
+{
+	struct sdpm_clk_instance *sdpm_inst = sdpm_data->sdpm_inst;
+
+	writel_relaxed(clk_rate, sdpm_inst->regmap +
+			SDPM_CSR_OFFSET(sdpm_data->csr_id));
+	dev_dbg(sdpm_inst->dev, "clock:%s offset:0x%x frequency:%u\n",
+			sdpm_data->clock_name,
+			SDPM_CSR_OFFSET(sdpm_data->csr_id),
+			clk_rate);
+}
+
+static int sdpm_clock_notifier(struct notifier_block *nb,
+					unsigned long event, void *data)
+{
+	struct clk_notifier_data *ndata = data;
+	struct sdpm_clk_data *sdpm_data = container_of(nb,
+				struct sdpm_clk_data, clk_rate_nb);
+
+	dev_dbg(sdpm_data->sdpm_inst->dev, "clock:%s event:%lu\n",
+			sdpm_data->clock_name, event);
+	switch (event) {
+	case PRE_RATE_CHANGE:
+		if (ndata->new_rate > ndata->old_rate)
+			sdpm_csr_write(sdpm_data,
+					FREQ_HZ_TO_MHZ(ndata->new_rate));
+		return NOTIFY_DONE;
+	case POST_RATE_CHANGE:
+		if (ndata->new_rate < ndata->old_rate)
+			sdpm_csr_write(sdpm_data,
+					FREQ_HZ_TO_MHZ(ndata->new_rate));
+		return NOTIFY_DONE;
+	case ABORT_RATE_CHANGE:
+		if (ndata->new_rate > ndata->old_rate)
+			sdpm_csr_write(sdpm_data,
+					FREQ_HZ_TO_MHZ(ndata->old_rate));
+		return NOTIFY_DONE;
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+static int sdpm_clk_device_remove(struct platform_device *pdev)
+{
+	struct sdpm_clk_instance *sdpm_inst =
+		(struct sdpm_clk_instance *)dev_get_drvdata(&pdev->dev);
+	struct sdpm_clk_data *sdpm_data = NULL, *next = NULL;
+
+	list_for_each_entry_safe(sdpm_data, next,
+			&sdpm_inst->sdpm_instances, sdpm_node) {
+		clk_notifier_unregister(sdpm_data->clk,
+					&sdpm_data->clk_rate_nb);
+		list_del(&sdpm_data->sdpm_node);
+	}
+
+	return 0;
+}
+
+static int sdpm_clk_device_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *dev_node = dev->of_node;
+	int ret = 0, idx = 0, clk_ct = 0, csr = 0, csr_ct = 0;
+	struct sdpm_clk_instance *sdpm_inst = NULL;
+	struct sdpm_clk_data *sdpm_data = NULL;
+	struct resource *res;
+
+	sdpm_inst = devm_kzalloc(dev, sizeof(*sdpm_inst), GFP_KERNEL);
+	if (!sdpm_inst)
+		return -ENOMEM;
+	sdpm_inst->dev = dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "Couldn't get MEM resource\n");
+		return -EINVAL;
+	}
+	dev_dbg(dev, "sdpm@0x%x size:%d\n", res->start,
+			resource_size(res));
+	dev_set_drvdata(dev, sdpm_inst);
+
+	sdpm_inst->regmap = devm_ioremap_resource(dev, res);
+	if (!sdpm_inst->regmap) {
+		dev_err(dev, "Couldn't get regmap\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_count_strings(dev_node, "clock-names");
+	if (ret <= 0) {
+		dev_err(dev, "Couldn't get clock names. %d\n", ret);
+		return ret;
+	}
+	clk_ct = ret;
+	ret = of_property_count_u32_elems(dev_node, "csr-id");
+	if (ret <= 0) {
+		dev_err(dev, "Couldn't get csr ID array. %d\n", ret);
+		return ret;
+	}
+	csr_ct = ret;
+
+	if (csr_ct != clk_ct) {
+		dev_err(dev, "Invalid csr:%d and clk:%d count.\n", csr_ct,
+				clk_ct);
+		return -EINVAL;
+	}
+
+	INIT_LIST_HEAD(&sdpm_inst->sdpm_instances);
+
+	for (idx = 0; idx < clk_ct; idx++) {
+
+		sdpm_data = devm_kzalloc(dev, sizeof(*sdpm_data), GFP_KERNEL);
+		if (!sdpm_data) {
+			ret = -ENOMEM;
+			goto clk_err_exit;
+		}
+
+		ret = of_property_read_string_index(dev_node, "clock-names",
+				idx, &sdpm_data->clock_name);
+		if (ret < 0) {
+			dev_err(dev, "Couldn't get clk name index:%d. %d\n",
+					idx, ret);
+			goto clk_err_exit;
+		}
+
+		sdpm_data->clk = devm_clk_get(dev, sdpm_data->clock_name);
+		if (IS_ERR(sdpm_data->clk)) {
+			ret = PTR_ERR(sdpm_data->clk);
+			goto clk_err_exit;
+		}
+
+		ret = of_property_read_u32_index(dev_node, "csr-id", idx, &csr);
+		if (ret < 0) {
+			dev_err(dev, "Couldn't get CSR for index:%d. %d\n",
+					idx, ret);
+			goto clk_err_exit;
+		}
+
+		if (ret > CSR_MAX_VAL) {
+			dev_err(dev, "Invalid CSR %d\n", csr);
+			ret = -EINVAL;
+			goto clk_err_exit;
+		}
+
+		dev_dbg(dev, "SDPM clock:%s csr:%d initialized\n",
+				sdpm_data->clock_name, csr);
+		sdpm_data->csr_id = csr;
+		sdpm_data->sdpm_inst = sdpm_inst;
+		sdpm_data->clk_rate_nb.notifier_call = sdpm_clock_notifier;
+		sdpm_csr_write(sdpm_data,
+			FREQ_HZ_TO_MHZ(clk_get_rate(sdpm_data->clk)));
+		clk_notifier_register(sdpm_data->clk, &sdpm_data->clk_rate_nb);
+		list_add(&sdpm_data->sdpm_node, &sdpm_inst->sdpm_instances);
+	}
+
+	return 0;
+
+clk_err_exit:
+	sdpm_clk_device_remove(pdev);
+
+	return ret;
+}
+
+static const struct of_device_id sdpm_clk_device_match[] = {
+	{.compatible = "qcom,sdpm"},
+	{}
+};
+
+static struct platform_driver sdpm_clk_device_driver = {
+	.probe          = sdpm_clk_device_probe,
+	.remove         = sdpm_clk_device_remove,
+	.driver         = {
+		.name   = SDPM_DRIVER,
+		.of_match_table = sdpm_clk_device_match,
+	},
+};
+module_platform_driver(sdpm_clk_device_driver);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. SDPM Clock Monitor Driver");
+MODULE_LICENSE("GPL v2");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

