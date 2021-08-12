Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2289E3EA1D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 11:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234093AbhHLJSq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 05:18:46 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:20876 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235954AbhHLJSp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 05:18:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628759901; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=pf9qlGCYLgP7q13sUOhEyb3wxcVhVGD2t4et5bvkFb0=; b=SEjmRMLUK5HKkTdFF2icWP1y1WS9BEtTabxsFB1scIYWxn0zN2sFLFnBtCEPYXG6Qr0O9PYy
 gVsvSV5XfIgLdcL2EitOzFaW/1SXGP/3U5l58XjhBhdmYbXoKTqM9BkBiZowThqAWzacs/7v
 tvfrCjey4qbi7G++6NtxJCb/c3c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6114e75691487ad520d0a6e2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 12 Aug 2021 09:18:14
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D49C1C43144; Thu, 12 Aug 2021 09:18:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A2687C43460;
        Thu, 12 Aug 2021 09:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A2687C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 1/3] soc: qcom: Add download mode support
Date:   Thu, 12 Aug 2021 14:47:40 +0530
Message-Id: <8282b67c332fdda1f5768578a91bff5a9975df05.1628757036.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1628757036.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1628757036.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for download mode on QTI platforms with SDI
(System Debug Image) enabled firmware. SDI checks for
the download mode cookies set by the kernel to decide on
whether to enter download mode or not. Additionally, SDI
needs to be disabled in case of normal reboot to prevent
entering download mode for every reboot and is enabled for
for crash reboots such as kernel panic and other crashes
such as watchdog bite/NOC errors handled by other entities
like secure world.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 MAINTAINERS                      |   7 ++
 drivers/soc/qcom/Kconfig         |  10 ++
 drivers/soc/qcom/Makefile        |   1 +
 drivers/soc/qcom/download_mode.c | 152 +++++++++++++++++++++++++++++++
 4 files changed, 170 insertions(+)
 create mode 100644 drivers/soc/qcom/download_mode.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a61f4f3b78a9..e51226f11bce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15327,6 +15327,13 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	drivers/crypto/qce/
 
+QUALCOMM DOWNLOAD MODE DRIVER
+M:	Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/msm/qcom,dload-mode.yaml
+F:	drivers/soc/qcom/download_mode.c
+
 QUALCOMM EMAC GIGABIT ETHERNET DRIVER
 M:	Timur Tabi <timur@kernel.org>
 L:	netdev@vger.kernel.org
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 79b568f82a1c..dc41fcfc4ac8 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -42,6 +42,16 @@ config QCOM_CPR
 	  To compile this driver as a module, choose M here: the module will
 	  be called qcom-cpr
 
+config QCOM_DLOAD_MODE
+	tristate "QCOM Download Mode support"
+	depends on ARCH_QCOM || COMPILE_TEST
+	help
+	  Say Y here to enable support for download mode on QTI platforms.
+
+	  Download mode driver configures the download mode cookies and SDI
+	  (System Debug Image) required to collect ramdump for post-mortem
+	  debug on Qualcomm Technologies, Inc. platforms.
+
 config QCOM_GENI_SE
 	tristate "QCOM GENI Serial Engine Driver"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index ad675a6593d0..674520c9828e 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_QCOM_AOSS_QMP) +=	qcom_aoss.o
 obj-$(CONFIG_QCOM_GENI_SE) +=	qcom-geni-se.o
 obj-$(CONFIG_QCOM_COMMAND_DB) += cmd-db.o
 obj-$(CONFIG_QCOM_CPR)		+= cpr.o
+obj-$(CONFIG_QCOM_DLOAD_MODE)	+= download_mode.o
 obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
 obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
 obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
diff --git a/drivers/soc/qcom/download_mode.c b/drivers/soc/qcom/download_mode.c
new file mode 100644
index 000000000000..519fdbe8669b
--- /dev/null
+++ b/drivers/soc/qcom/download_mode.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/of_address.h>
+#include <linux/panic_notifier.h>
+#include <linux/reboot.h>
+#include <linux/slab.h>
+
+#define DLOAD_MODE_COOKIE1	0xe47b337d
+#define DLOAD_MODE_COOKIE2	0xce14091a
+
+struct qcom_dload_mode {
+	void __iomem *dload_mode;
+	void __iomem *sdi_disable;
+	bool in_panic;
+};
+
+static struct qcom_dload_mode *dmode;
+
+static int dload_mode_reboot_notifier(struct notifier_block *self,
+			       unsigned long v, void *p)
+{
+	/*
+	 * Don't enter download mode for normal reboot, so clear the
+	 * download mode cookie and disable SDI.
+	 */
+	if (!dmode->in_panic) {
+		writel(0, dmode->dload_mode);
+		writel(1, dmode->sdi_disable);
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int dload_mode_panic_notifier(struct notifier_block *self,
+			       unsigned long v, void *p)
+{
+	dmode->in_panic = true;
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block dload_mode_reboot_nb = {
+	.notifier_call = dload_mode_reboot_notifier,
+};
+
+static struct notifier_block dload_mode_panic_nb = {
+	.notifier_call = dload_mode_panic_notifier,
+};
+
+static void qcom_unset_dload_mode(void)
+{
+	writel(0, dmode->dload_mode);
+	writel(0, dmode->dload_mode + sizeof(u32));
+}
+
+static void qcom_set_dload_mode(void)
+{
+	writel(DLOAD_MODE_COOKIE1, dmode->dload_mode);
+	writel(DLOAD_MODE_COOKIE2, dmode->dload_mode + sizeof(u32));
+}
+
+static int __init qcom_dload_mode_init(void)
+{
+	struct resource imem, sdi_base;
+	struct of_phandle_args args;
+	struct device_node *np;
+	int ret;
+
+	dmode = kzalloc(sizeof(*dmode), GFP_KERNEL);
+	if (!dmode)
+		return -ENOMEM;
+
+	np = of_find_compatible_node(NULL, NULL, "qcom,dload-mode");
+	if (!np)
+		return -ENOENT;
+
+	ret = of_address_to_resource(np, 0, &imem);
+	if (ret < 0)
+		return ret;
+
+	ret = of_parse_phandle_with_fixed_args(np,
+					       "qcom,sdi-disable-regs",
+					       2, 0, &args);
+	of_node_put(np);
+	if (ret < 0) {
+		pr_err("Failed to parse sdi-disable-regs\n");
+		return -EINVAL;
+	}
+
+	ret = of_address_to_resource(args.np, 0, &sdi_base);
+	of_node_put(args.np);
+	if (ret < 0)
+		return ret;
+
+	dmode->dload_mode = ioremap(imem.start, resource_size(&imem));
+	if (!dmode->dload_mode) {
+		pr_err("Failed to map download mode region\n");
+		return -ENOMEM;
+	}
+
+	dmode->sdi_disable = ioremap(sdi_base.start + args.args[0], args.args[1]);
+	if (!dmode->sdi_disable) {
+		pr_err("Failed to map sdi disable region\n");
+		return -ENOMEM;
+	}
+
+	ret = atomic_notifier_chain_register(&panic_notifier_list,
+					     &dload_mode_panic_nb);
+	if (ret) {
+		pr_err("Failed to register panic notifier: %d\n", ret);
+		return ret;
+	}
+
+	ret = register_reboot_notifier(&dload_mode_reboot_nb);
+	if (ret) {
+		pr_err("Failed to register reboot notifier: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Set the download mode cookies here so that after this point on
+	 * any crash handled either by kernel or other crashes such as
+	 * watchdog bite handled by other entities like secure world,
+	 * download mode is entered.
+	 */
+	qcom_set_dload_mode();
+
+	return 0;
+}
+device_initcall(qcom_dload_mode_init);
+
+static void __exit qcom_dload_mode_exit(void)
+{
+	qcom_unset_dload_mode();
+	unregister_reboot_notifier(&dload_mode_reboot_nb);
+	atomic_notifier_chain_unregister(&panic_notifier_list,
+					 &dload_mode_panic_nb);
+	iounmap(dmode->sdi_disable);
+	iounmap(dmode->dload_mode);
+	kfree(dmode);
+	dmode = NULL;
+}
+module_exit(qcom_dload_mode_exit);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Download Mode driver");
+MODULE_LICENSE("GPL v2");
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

