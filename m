Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C87BA4015EC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 07:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238957AbhIFF3e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 01:29:34 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:10009 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238866AbhIFF3e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 01:29:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630906110; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=sM8vR8XSq6QKEBHdJMbuSgpSkjgphpiwvxayDfnj8Rk=; b=vI0nwgL2If9J7lcUZS8ltWSk3uq6PpEWK70pzrzcryablsiCGoq2UMWKTahvzieUKFmsZyEA
 sOud6MOQPl2QBucLhoKZgb9FK0kv+aTPPqEdUrAMOSQct5MohV88r4B+JsU6g6nA8GNAO+VT
 OTVf3pRp01SmGBVVm4h31PPTvbU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6135a6fdcd680e896974b9d7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 06 Sep 2021 05:28:29
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D42D7C4360D; Mon,  6 Sep 2021 05:28:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4686CC4360D;
        Mon,  6 Sep 2021 05:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4686CC4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v9 2/5] soc: qcom: Add SoC sleep stats driver
Date:   Mon,  6 Sep 2021 10:58:00 +0530
Message-Id: <1630906083-32194-3-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630906083-32194-1-git-send-email-mkshah@codeaurora.org>
References: <1630906083-32194-1-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Mahesh Sivasubramanian <msivasub@codeaurora.org>

Let's add a driver to read the stats from remote processor and
export to debugfs.

The driver creates "qcom_sleep_stats" directory in debugfs and
adds files for various low power mode available. Below is sample
output with command

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
 drivers/soc/qcom/Kconfig           |  10 ++
 drivers/soc/qcom/Makefile          |   1 +
 drivers/soc/qcom/soc_sleep_stats.c | 241 +++++++++++++++++++++++++++++++++++++
 3 files changed, 252 insertions(+)
 create mode 100644 drivers/soc/qcom/soc_sleep_stats.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 79b568f..e80b63a 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -190,6 +190,16 @@ config QCOM_SOCINFO
 	 Say yes here to support the Qualcomm socinfo driver, providing
 	 information about the SoC to user space.
 
+config QCOM_SOC_SLEEP_STATS
+	tristate "Qualcomm Technologies, Inc. (QTI) SoC sleep stats driver"
+	depends on ARCH_QCOM && DEBUG_FS || COMPILE_TEST
+	depends on QCOM_SMEM
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
index ad675a6..5f30d74 100644
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
index 0000000..db28dd2
--- /dev/null
+++ b/drivers/soc/qcom/soc_sleep_stats.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2011-2021, The Linux Foundation. All rights reserved.
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
+#define STAT_TYPE_OFFSET	0x0
+#define COUNT_OFFSET		0x4
+#define LAST_ENTERED_AT_OFFSET	0x8
+#define LAST_EXITED_AT_OFFSET	0x10
+#define ACCUMULATED_OFFSET	0x18
+#define CLIENT_VOTES_OFFSET	0x1c
+
+struct subsystem_data {
+	const char *name;
+	u32 smem_item;
+	u32 pid;
+};
+
+static const struct subsystem_data subsystems[] = {
+	{ "modem", 605, 1 },
+	{ "wpss", 605, 13 },
+	{ "adsp", 606, 2 },
+	{ "cdsp", 607, 5 },
+	{ "slpi", 608, 3 },
+	{ "gpu", 609, 0 },
+	{ "display", 610, 0 },
+	{ "adsp_island", 613, 2 },
+	{ "slpi_island", 613, 3 },
+};
+
+struct stats_config {
+	size_t offset_addr;
+	size_t num_records;
+	bool appended_stats_avail;
+};
+
+struct stats_data {
+	bool appended_stats_avail;
+	void __iomem *base;
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
+static void qcom_print_stats(struct seq_file *s, const struct sleep_stats *stat)
+{
+	u64 accumulated = stat->accumulated;
+	/*
+	 * If a subsystem is in sleep when reading the sleep stats adjust
+	 * the accumulated sleep duration to show actual sleep time.
+	 */
+	if (stat->last_entered_at > stat->last_exited_at)
+		accumulated += arch_timer_read_counter() - stat->last_entered_at;
+
+	seq_printf(s, "Count: %u\n", stat->count);
+	seq_printf(s, "Last Entered At: %llu\n", stat->last_entered_at);
+	seq_printf(s, "Last Exited At: %llu\n", stat->last_exited_at);
+	seq_printf(s, "Accumulated Duration: %llu\n", accumulated);
+}
+
+static int qcom_subsystem_sleep_stats_show(struct seq_file *s, void *unused)
+{
+	struct subsystem_data *subsystem = s->private;
+	struct sleep_stats *stat;
+
+	/* Items are allocated lazily, so lookup pointer each time */
+	stat = qcom_smem_get(subsystem->pid, subsystem->smem_item, NULL);
+	if (IS_ERR(stat))
+		return -EIO;
+
+	qcom_print_stats(s, stat);
+
+	return 0;
+}
+
+static int qcom_soc_sleep_stats_show(struct seq_file *s, void *unused)
+{
+	struct stats_data *d = s->private;
+	void __iomem *reg = d->base;
+	struct sleep_stats stat;
+
+	memcpy_fromio(&stat, reg, sizeof(stat));
+	qcom_print_stats(s, &stat);
+
+	if (d->appended_stats_avail) {
+		struct appended_stats votes;
+
+		memcpy_fromio(&votes, reg + CLIENT_VOTES_OFFSET, sizeof(votes));
+		seq_printf(s, "Client Votes: %#x\n", votes.client_votes);
+	}
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(qcom_soc_sleep_stats);
+DEFINE_SHOW_ATTRIBUTE(qcom_subsystem_sleep_stats);
+
+static void qcom_create_soc_sleep_stat_files(struct dentry *root, void __iomem *reg,
+					     struct stats_data *d, u32 num_records)
+{
+	char stat_type[sizeof(u32) + 1] = {0};
+	u32 offset = 0, type;
+	int i, j;
+
+	for (i = 0; i < num_records; i++) {
+		d[i].base = reg + offset;
+
+		/*
+		 * Read the low power mode name and create debugfs file for it.
+		 * The names read could be of below,
+		 * (may change depending on low power mode supported).
+		 * For rpmh-sleep-stats: "aosd", "cxsd" and "ddr".
+		 * For rpm-sleep-stats: "vmin" and "vlow".
+		 */
+		type = readl(d[i].base);
+		for (j = 0; j < sizeof(u32); j++) {
+			stat_type[j] = type & 0xff;
+			type = type >> 8;
+		}
+		strim(stat_type);
+		debugfs_create_file(stat_type, 0400, root, &d[i],
+				    &qcom_soc_sleep_stats_fops);
+
+		offset += sizeof(struct sleep_stats);
+		if (d[i].appended_stats_avail)
+			offset += sizeof(struct appended_stats);
+	}
+}
+
+static void qcom_create_subsystem_stat_files(struct dentry *root)
+{
+	const struct sleep_stats *stat;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(subsystems); i++) {
+		stat = qcom_smem_get(subsystems[i].pid, subsystems[i].smem_item, NULL);
+		if (IS_ERR(stat))
+			continue;
+
+		debugfs_create_file(subsystems[i].name, 0400, root, (void *)&subsystems[i],
+				    &qcom_subsystem_sleep_stats_fops);
+	}
+}
+
+static int qcom_soc_sleep_stats_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	void __iomem *reg;
+	struct dentry *root;
+	const struct stats_config *config;
+	struct stats_data *d;
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
+	reg = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (!reg)
+		return -ENOMEM;
+
+	d = devm_kcalloc(&pdev->dev, config->num_records,
+			 sizeof(*d), GFP_KERNEL);
+	if (!d)
+		return -ENOMEM;
+
+	for (i = 0; i < config->num_records; i++)
+		d[i].appended_stats_avail = config->appended_stats_avail;
+
+	root = debugfs_create_dir("qcom_sleep_stats", NULL);
+
+	qcom_create_subsystem_stat_files(root);
+	qcom_create_soc_sleep_stat_files(root, reg, d, config->num_records);
+
+	platform_set_drvdata(pdev, root);
+
+	return 0;
+}
+
+static int qcom_soc_sleep_stats_remove(struct platform_device *pdev)
+{
+	struct dentry *root = platform_get_drvdata(pdev);
+
+	debugfs_remove_recursive(root);
+
+	return 0;
+}
+
+static const struct stats_config rpm_data = {
+	.num_records = 2,
+	.appended_stats_avail = true,
+};
+
+static const struct stats_config rpmh_data = {
+	.num_records = 3,
+	.appended_stats_avail = false,
+};
+
+static const struct of_device_id qcom_soc_sleep_stats_table[] = {
+	{ .compatible = "qcom,rpm-sleep-stats", .data = &rpm_data },
+	{ .compatible = "qcom,rpmh-sleep-stats", .data = &rpmh_data },
+	{ }
+};
+
+static struct platform_driver soc_sleep_stats = {
+	.probe = qcom_soc_sleep_stats_probe,
+	.remove = qcom_soc_sleep_stats_remove,
+	.driver = {
+		.name = "soc_sleep_stats",
+		.of_match_table = qcom_soc_sleep_stats_table,
+	},
+};
+module_platform_driver(soc_sleep_stats);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. (QTI) SoC Sleep Stats driver");
+MODULE_LICENSE("GPL v2");
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

