Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFEDF1894EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 05:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbgCREaE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 00:30:04 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:27244 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726954AbgCREaE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 00:30:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584505803; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=AECvhB+kRcIe8vUk8HnC0DDsfQRBGXopgCz4CDlxpGI=; b=cSPwZO5Sbd4Xq4jKCqkd4Z/ilntZr7HEII+9c9VBn65IY32RpsF6jtLg5HxCYL2ZFOGSbsER
 0wSpsjg0lrRhzswY59lGs6se9QNxdF8aOlE6fD2BbmNV0+D9Y/eFtO9LqUMrzmxC9qBh7dao
 J0YW+SoF7JKTJmBerC6aLej/UCs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e71a3c1.7fd52782aed8-smtp-out-n03;
 Wed, 18 Mar 2020 04:29:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 16A8FC432C2; Wed, 18 Mar 2020 04:29:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F17E7C433D2;
        Wed, 18 Mar 2020 04:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F17E7C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v5 2/4] soc: qcom: Add SoC sleep stats driver
Date:   Wed, 18 Mar 2020 09:59:16 +0530
Message-Id: <1584505758-21037-3-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584505758-21037-1-git-send-email-mkshah@codeaurora.org>
References: <1584505758-21037-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Mahesh Sivasubramanian <msivasub@codeaurora.org>

Let's add a driver to read the the stats from remote processor
and export to debugfs.

The driver creates "qcom_sleep_stats" directory in debugfs and adds
files for various low power mode available. Below is sample output
with command

cat /sys/kernel/debug/qcom_sleep_stats/ddr
count = 0
Last Entered At = 0
Last Exited At = 0
Accumulated Duration = 0

Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
[mkshah: add subsystem sleep stats, create one file for each stat]
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/soc/qcom/Kconfig           |   9 ++
 drivers/soc/qcom/Makefile          |   1 +
 drivers/soc/qcom/soc_sleep_stats.c | 244 +++++++++++++++++++++++++++++++++++++
 3 files changed, 254 insertions(+)
 create mode 100644 drivers/soc/qcom/soc_sleep_stats.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index d0a73e7..08bc0df3 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -185,6 +185,15 @@ config QCOM_SOCINFO
 	 Say yes here to support the Qualcomm socinfo driver, providing
 	 information about the SoC to user space.
 
+config QCOM_SOC_SLEEP_STATS
+	tristate "Qualcomm Technologies, Inc. (QTI) SoC sleep stats driver"
+	depends on ARCH_QCOM && DEBUG_FS || COMPILE_TEST
+	help
+	  Qualcomm Technologies, Inc. (QTI) SoC sleep stats driver to read
+	  the shared memory exported by the remote processor related to
+	  various SoC level low power modes statistics and export to debugfs
+	  interface.
+
 config QCOM_WCNSS_CTRL
 	tristate "Qualcomm WCNSS control driver"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 9fb35c8..e6bd052 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
 obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
 obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
 obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo.o
+obj-$(CONFIG_QCOM_SOC_SLEEP_STATS)	+= soc_sleep_stats.o
 obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
 obj-$(CONFIG_QCOM_APR) += apr.o
 obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
diff --git a/drivers/soc/qcom/soc_sleep_stats.c b/drivers/soc/qcom/soc_sleep_stats.c
new file mode 100644
index 0000000..0db7c3d
--- /dev/null
+++ b/drivers/soc/qcom/soc_sleep_stats.c
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2011-2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+
+#include <linux/soc/qcom/smem.h>
+#include <clocksource/arm_arch_timer.h>
+
+#define STAT_TYPE_ADDR		0x0
+#define COUNT_ADDR		0x4
+#define LAST_ENTERED_AT_ADDR	0x8
+#define LAST_EXITED_AT_ADDR	0x10
+#define ACCUMULATED_ADDR	0x18
+#define CLIENT_VOTES_ADDR	0x1c
+
+struct subsystem_data {
+	const char *name;
+	u32 smem_item;
+	u32 pid;
+};
+
+static struct subsystem_data subsystems[] = {
+	{ "modem", 605, 1 },
+	{ "adsp", 606, 2 },
+	{ "cdsp", 607, 5 },
+	{ "slpi", 608, 3 },
+	{ "gpu", 609, 0 },
+	{ "display", 610, 0 },
+};
+
+struct stats_config {
+	unsigned int offset_addr;
+	unsigned int num_records;
+	bool appended_stats_avail;
+};
+
+struct stats_prv_data {
+	const struct stats_config *config;
+	void __iomem *reg;
+};
+
+struct sleep_stats {
+	u32 stat_type;
+	u32 count;
+	u64 last_entered_at;
+	u64 last_exited_at;
+	u64 accumulated;
+};
+
+struct appended_stats {
+	u32 client_votes;
+	u32 reserved[3];
+};
+
+static void print_sleep_stats(struct seq_file *s, struct sleep_stats *stat)
+{
+	u64 accumulated = stat->accumulated;
+	/*
+	 * If a subsystem is in sleep when reading the sleep stats adjust
+	 * the accumulated sleep duration to show actual sleep time.
+	 */
+	if (stat->last_entered_at > stat->last_exited_at)
+		accumulated += arch_timer_read_counter()
+			       - stat->last_entered_at;
+
+	seq_printf(s, "Count = %u\n", stat->count);
+	seq_printf(s, "Last Entered At = %llu\n", stat->last_entered_at);
+	seq_printf(s, "Last Exited At = %llu\n", stat->last_exited_at);
+	seq_printf(s, "Accumulated Duration = %llu\n", accumulated);
+}
+
+static int subsystem_sleep_stats_show(struct seq_file *s, void *d)
+{
+	struct subsystem_data *subsystem = s->private;
+	struct sleep_stats *stat;
+
+	stat = qcom_smem_get(subsystem->pid, subsystem->smem_item, NULL);
+	if (IS_ERR(stat))
+		return PTR_ERR(stat);
+
+	print_sleep_stats(s, stat);
+
+	return 0;
+}
+
+static int soc_sleep_stats_show(struct seq_file *s, void *d)
+{
+	struct stats_prv_data *prv_data = s->private;
+	void __iomem *reg = prv_data->reg;
+	struct sleep_stats stat;
+
+	stat.count = readl(reg + COUNT_ADDR);
+	stat.last_entered_at = readq(reg + LAST_ENTERED_AT_ADDR);
+	stat.last_exited_at = readq(reg + LAST_EXITED_AT_ADDR);
+	stat.accumulated = readq(reg + ACCUMULATED_ADDR);
+
+	print_sleep_stats(s, &stat);
+
+	if (prv_data->config->appended_stats_avail) {
+		struct appended_stats app_stat;
+
+		app_stat.client_votes = readl(reg + CLIENT_VOTES_ADDR);
+		seq_printf(s, "Client_votes = %#x\n", app_stat.client_votes);
+	}
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(soc_sleep_stats);
+DEFINE_SHOW_ATTRIBUTE(subsystem_sleep_stats);
+
+static struct dentry *create_debugfs_entries(void __iomem *reg,
+					     struct stats_prv_data *prv_data)
+{
+	struct dentry *root;
+	struct sleep_stats *stat;
+	char stat_type[sizeof(u32) + 1] = {0};
+	u32 offset, type;
+	int i;
+
+	root = debugfs_create_dir("qcom_sleep_stats", NULL);
+
+	for (i = 0; i < prv_data[0].config->num_records; i++) {
+		offset = STAT_TYPE_ADDR + (i * sizeof(struct sleep_stats));
+
+		if (prv_data[0].config->appended_stats_avail)
+			offset += i * sizeof(struct appended_stats);
+
+		prv_data[i].reg = reg + offset;
+
+		type = readl(prv_data[i].reg);
+		memcpy(stat_type, &type, sizeof(u32));
+		debugfs_create_file(stat_type, 0444, root,
+				    &prv_data[i],
+				    &soc_sleep_stats_fops);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(subsystems); i++) {
+		stat = qcom_smem_get(subsystems[i].pid, subsystems[i].smem_item,
+				     NULL);
+		if (IS_ERR(stat))
+			continue;
+
+		debugfs_create_file(subsystems[i].name, 0444, root,
+				    &subsystems[i],
+				    &subsystem_sleep_stats_fops);
+	}
+
+	return root;
+}
+
+static int soc_sleep_stats_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	void __iomem *reg;
+	void __iomem *offset_addr;
+	phys_addr_t stats_base;
+	resource_size_t stats_size;
+	struct dentry *root;
+	const struct stats_config *config;
+	struct stats_prv_data *prv_data;
+	int i;
+
+	config = device_get_match_data(&pdev->dev);
+	if (!config)
+		return -ENODEV;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return PTR_ERR(res);
+
+	offset_addr = ioremap(res->start + config->offset_addr, sizeof(u32));
+	if (IS_ERR(offset_addr))
+		return PTR_ERR(offset_addr);
+
+	stats_base = res->start | readl_relaxed(offset_addr);
+	stats_size = resource_size(res);
+	iounmap(offset_addr);
+
+	reg = devm_ioremap(&pdev->dev, stats_base, stats_size);
+	if (!reg)
+		return -ENOMEM;
+
+	prv_data = devm_kzalloc(&pdev->dev, config->num_records *
+				sizeof(struct stats_prv_data), GFP_KERNEL);
+	if (!prv_data)
+		return -ENOMEM;
+
+	for (i = 0; i < config->num_records; i++)
+		prv_data[i].config = config;
+
+	root = create_debugfs_entries(reg, prv_data);
+	platform_set_drvdata(pdev, root);
+
+	return 0;
+}
+
+static int soc_sleep_stats_remove(struct platform_device *pdev)
+{
+	struct dentry *root = platform_get_drvdata(pdev);
+
+	debugfs_remove_recursive(root);
+
+	return 0;
+}
+
+static const struct stats_config rpm_data = {
+	.offset_addr = 0x14,
+	.num_records = 2,
+	.appended_stats_avail = true,
+};
+
+static const struct stats_config rpmh_data = {
+	.offset_addr = 0x4,
+	.num_records = 3,
+	.appended_stats_avail = false,
+};
+
+static const struct of_device_id soc_sleep_stats_table[] = {
+	{ .compatible = "qcom,rpm-sleep-stats", .data = &rpm_data },
+	{ .compatible = "qcom,rpmh-sleep-stats", .data = &rpmh_data },
+	{ }
+};
+
+static struct platform_driver soc_sleep_stats_driver = {
+	.probe = soc_sleep_stats_probe,
+	.remove = soc_sleep_stats_remove,
+	.driver = {
+		.name = "soc_sleep_stats",
+		.of_match_table = soc_sleep_stats_table,
+	},
+};
+module_platform_driver(soc_sleep_stats_driver);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. (QTI) SoC Sleep Stats driver");
+MODULE_LICENSE("GPL v2");
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
