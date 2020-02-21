Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 574511678C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2020 09:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388890AbgBUIum (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Feb 2020 03:50:42 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:34683 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730280AbgBUIum (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Feb 2020 03:50:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582275041; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=3VYTb1slpATpqvNH0CfEc4mmFEs+V2CjaCKPhCsnhuM=; b=XBkdJLg5kZVkEv4pujH4nfCT9eG5FsgEMe1HUuxUiJFk9cc1FiKTEk/xAcBInHJ1s8B4h0Xe
 wHl5YcRu1iNCkbY1+QHAXRcx3invyKpz7PbuNY6SHRTBboLw3KSWxEDB/YJ39qzbd9VH6Eye
 IhkE+7WITB07WuZ1saPt5vygeOY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4f99d9.7f5b24b82ea0-smtp-out-n03;
 Fri, 21 Feb 2020 08:50:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3A4C1C447A4; Fri, 21 Feb 2020 08:50:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 28D27C4479D;
        Fri, 21 Feb 2020 08:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 28D27C4479D
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
Subject: [PATCH v2 2/4] soc: qcom: Add SoC sleep stats driver
Date:   Fri, 21 Feb 2020 14:19:44 +0530
Message-Id: <1582274986-17490-3-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582274986-17490-1-git-send-email-mkshah@codeaurora.org>
References: <1582274986-17490-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Mahesh Sivasubramanian <msivasub@codeaurora.org>

Lets's add a driver to read the the stats from remote processor
and export to debugfs.

The driver creates "soc_sleep_stats" directory in debugfs and adds
files for various low power mode available. Below is sample output
with command

cat /sys/kernel/debug/soc_sleep_stats/ddr
count = 0
Last Entered At = 0
Last Exited At = 0
Accumulated Duration = 0

Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/soc/qcom/Kconfig           |  10 ++
 drivers/soc/qcom/Makefile          |   1 +
 drivers/soc/qcom/soc_sleep_stats.c | 279 +++++++++++++++++++++++++++++++++++++
 3 files changed, 290 insertions(+)
 create mode 100644 drivers/soc/qcom/soc_sleep_stats.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index d0a73e7..4d36654 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -185,6 +185,16 @@ config QCOM_SOCINFO
 	 Say yes here to support the Qualcomm socinfo driver, providing
 	 information about the SoC to user space.
 
+config QCOM_SOC_SLEEP_STATS
+	tristate "Qualcomm Technologies, Inc. (QTI) SoC sleep stats driver"
+	depends on ARCH_QCOM
+	depends on DEBUG_FS
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
index 00000000..bf38bb5
--- /dev/null
+++ b/drivers/soc/qcom/soc_sleep_stats.c
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2011-2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/stddef.h>
+
+#include <linux/soc/qcom/smem.h>
+#include <clocksource/arm_arch_timer.h>
+
+#define NAME_LENGTH	5
+
+enum subsystem_item_id {
+	MODEM = 605,
+	ADSP,
+	CDSP,
+	SLPI,
+	GPU,
+	DISPLAY,
+};
+
+enum subsystem_pid {
+	PID_APSS = 0,
+	PID_MODEM = 1,
+	PID_ADSP = 2,
+	PID_SLPI = 3,
+	PID_CDSP = 5,
+	PID_GPU = PID_APSS,
+	PID_DISPLAY = PID_APSS,
+};
+
+struct subsystem_data {
+	char *name;
+	enum subsystem_item_id item_id;
+	enum subsystem_pid pid;
+};
+
+static struct subsystem_data subsystems[] = {
+	{ "modem", MODEM, PID_MODEM },
+	{ "adsp", ADSP, PID_ADSP },
+	{ "cdsp", CDSP, PID_CDSP },
+	{ "slpi", SLPI, PID_SLPI },
+	{ "gpu", GPU, PID_GPU },
+	{ "display", DISPLAY, PID_DISPLAY },
+};
+
+struct stats_config {
+	u32 offset_addr;
+	u32 num_records;
+	bool appended_stats_avail;
+};
+
+static const struct stats_config *config;
+
+struct soc_sleep_stats_data {
+	phys_addr_t stats_base;
+	resource_size_t stats_size;
+	void __iomem *reg;
+	struct dentry *root;
+};
+
+struct entry {
+	__le32 stat_type;
+	__le32 count;
+	__le64 last_entered_at;
+	__le64 last_exited_at;
+	__le64 accumulated;
+};
+
+struct appended_entry {
+	__le32 client_votes;
+	__le32 reserved[3];
+};
+
+static u64 get_time_in_sec(u64 counter)
+{
+	do_div(counter, arch_timer_get_rate());
+
+	return counter;
+}
+
+static void print_sleep_stats(struct seq_file *s, struct entry *e)
+{
+	e->last_entered_at = get_time_in_sec(e->last_entered_at);
+	e->last_exited_at = get_time_in_sec(e->last_exited_at);
+	e->accumulated = get_time_in_sec(e->accumulated);
+
+	seq_printf(s, "count = %u\n", e->count);
+	seq_printf(s, "Last Entered At = %llu\n", e->last_entered_at);
+	seq_printf(s, "Last Exited At = %llu\n", e->last_exited_at);
+	seq_printf(s, "Accumulated Duration = %llu\n", e->accumulated);
+}
+
+static int subsystem_sleep_stats_show(struct seq_file *s, void *d)
+{
+	struct subsystem_data *subsystem = s->private;
+	struct entry *e;
+
+	e = qcom_smem_get(subsystem->pid, subsystem->item_id, NULL);
+	if (IS_ERR(e))
+		return PTR_ERR(e);
+
+	/*
+	 * If a subsystem is in sleep when reading the sleep stats adjust
+	 * the accumulated sleep duration to show actual sleep time.
+	 */
+	if (e->last_entered_at > e->last_exited_at)
+		e->accumulated += (arch_timer_read_counter()
+				   - e->last_entered_at);
+
+	print_sleep_stats(s, e);
+
+	return 0;
+}
+
+static int soc_sleep_stats_show(struct seq_file *s, void *d)
+{
+	void __iomem *reg = s->private;
+	uint32_t offset;
+	struct entry e;
+
+	offset = offsetof(struct entry, count);
+	e.count = le32_to_cpu(readl_relaxed(reg + offset));
+
+	offset = offsetof(struct entry, last_entered_at);
+	e.last_entered_at = le64_to_cpu(readq_relaxed(reg + offset));
+
+	offset = offsetof(struct entry, last_exited_at);
+	e.last_exited_at = le64_to_cpu(readq_relaxed(reg + offset));
+
+	offset = offsetof(struct entry, accumulated);
+	e.accumulated = le64_to_cpu(readq_relaxed(reg + offset));
+
+	print_sleep_stats(s, &e);
+
+	if (config->appended_stats_avail) {
+		struct appended_entry ae;
+
+		offset = offsetof(struct appended_entry, client_votes) +
+			 sizeof(struct entry);
+		ae.client_votes = le32_to_cpu(readl_relaxed(reg + offset));
+		seq_printf(s, "Client_votes = 0x%x\n", ae.client_votes);
+	}
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(soc_sleep_stats);
+DEFINE_SHOW_ATTRIBUTE(subsystem_sleep_stats);
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
+	{ .compatible = "qcom,rpm-sleep-stats", .data = &rpm_data},
+	{ .compatible = "qcom,rpmh-sleep-stats", .data = &rpmh_data},
+	{ },
+};
+
+static int create_debugfs_entries(struct soc_sleep_stats_data *drv)
+{
+	struct entry *e;
+	char stat_type[NAME_LENGTH] = {0};
+	uint32_t offset, type;
+	int i;
+
+	drv->root = debugfs_create_dir("soc_sleep_stats", NULL);
+	if (IS_ERR_OR_NULL(drv->root))
+		return PTR_ERR(drv->root);
+
+	for (i = 0; i < config->num_records; i++) {
+		offset = offsetof(struct entry, stat_type) +
+			 (i * sizeof(struct entry));
+
+		if (config->appended_stats_avail)
+			offset += i * sizeof(struct appended_entry);
+
+		type = le32_to_cpu(readl_relaxed(drv->reg + offset));
+		memcpy(stat_type, &type, sizeof(uint32_t));
+		debugfs_create_file(stat_type, 0444, drv->root,
+				    drv->reg + offset,
+				    &soc_sleep_stats_fops);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(subsystems); i++) {
+		e = qcom_smem_get(subsystems[i].pid, subsystems[i].item_id,
+				  NULL);
+
+		if (IS_ERR(e))
+			continue;
+
+		debugfs_create_file(subsystems[i].name, 0444, drv->root,
+				    &subsystems[i],
+				    &subsystem_sleep_stats_fops);
+	}
+
+	return 0;
+}
+
+static int soc_sleep_stats_probe(struct platform_device *pdev)
+{
+	struct soc_sleep_stats_data *drv;
+	struct resource *res;
+	void __iomem *offset_addr;
+
+	drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
+	if (!drv)
+		return -ENOMEM;
+
+	config = of_device_get_match_data(&pdev->dev);
+	if (!config)
+		return -ENODEV;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return PTR_ERR(res);
+
+	offset_addr = ioremap_nocache(res->start + config->offset_addr,
+				      sizeof(u32));
+	if (IS_ERR(offset_addr))
+		return PTR_ERR(offset_addr);
+
+	drv->stats_base = res->start | readl_relaxed(offset_addr);
+	drv->stats_size = resource_size(res);
+	iounmap(offset_addr);
+
+	drv->reg = devm_ioremap(&pdev->dev, drv->stats_base, drv->stats_size);
+	if (!drv->reg)
+		return -ENOMEM;
+
+	if (create_debugfs_entries(drv))
+		return -ENODEV;
+
+	platform_set_drvdata(pdev, drv);
+
+	return 0;
+}
+
+static int soc_sleep_stats_remove(struct platform_device *pdev)
+{
+	struct soc_sleep_stats_data *drv = platform_get_drvdata(pdev);
+
+	debugfs_remove_recursive(drv->root);
+
+	return 0;
+}
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
