Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2636396768
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 19:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbhEaRuG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 13:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232394AbhEaRti (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 13:49:38 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A428C061265
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 10:30:17 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id d25-20020a0568300459b02902f886f7dd43so11694972otc.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 10:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8KsEmSoTxPR5lAcpNylV7WiHyog3+QbUtiWAOzs2J6o=;
        b=XANaeynU2bWgS6Bu3afvpp8n5XWi6zIObbzxo9zOyFTEMTmt9dPljDe2u36fWqOL0V
         PZqXtyWY4o6xHQ04EbfADNAeBKm2mC2brgwcbm1Drox5fkTM2HAPyVNsEklIunHmBACR
         lR10DWYLGrlxTPW1mPonp9EOs1KAXJrXaUqGV5SI4au7Y21U7QHcf++RBh6CaIUhkhew
         BYX8aiV7HvOrrEJPnt7mTddU/XZJ9Oy49MMJCiAC3x+fQhF0b7E/vlh0ihN0w/jtSFjS
         Ei/U6sVk0KPVQK/XXjiMAwB8kAPhhQH8uLVyo+jlmeUNen/M7GtOSZFeA+33WYImkkIA
         2ABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8KsEmSoTxPR5lAcpNylV7WiHyog3+QbUtiWAOzs2J6o=;
        b=uAlxDC7N/z2fg/Ejn/zZEPQnFUgcBq9vmGZGizdGI2NH16RXDAtGoG9Mh5CZ+CkstS
         HQlJZHGePkkXzABrDoz638IWvHaSqAqt2C867fEzyHFQV9Kf8IK1Sl7ayN0KcMjSmHtP
         v2ZjnMPMwqlagvTr/yeJw65lGfRErjVC59UD40zdgYKyiPI+nVOKoF3d2TI8fj5Y1jQx
         vTiXu1BWlaJPBJAqZddxGbTa2hpIaha2GFTHi3xSOb++91bo/EWbb53ehsc+1c3vk3O6
         D41qLXm7fZkPYJy1o3bgDJxIqTZdeJwiSvbouINggKQuOkAzeHGz6crgOujP3JWLWqb+
         0gPg==
X-Gm-Message-State: AOAM5312Eoa98SV0UzMqsyuRDaNO4uyDqgw3G4iLj4SC9OsC3dScqGn3
        Tqvt8m8MOB/JbFMBPAg2kAVpnA==
X-Google-Smtp-Source: ABdhPJwI2TDsBCYqb8h2Vc4Hvufn0919dXCSkdzOMmaxnHFaz3UTwc0rqrDHsDGdQiceFxRvuvoijg==
X-Received: by 2002:a9d:6c81:: with SMTP id c1mr2757412otr.316.1622482216074;
        Mon, 31 May 2021 10:30:16 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t26sm3242405otc.23.2021.05.31.10.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 10:30:15 -0700 (PDT)
Date:   Mon, 31 May 2021 12:30:13 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH v8 2/5] soc: qcom: Add SoC sleep stats driver
Message-ID: <YLUdJa4jawdBjPRy@builder.lan>
References: <1621596371-26482-1-git-send-email-mkshah@codeaurora.org>
 <1621596371-26482-3-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621596371-26482-3-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 21 May 06:26 CDT 2021, Maulik Shah wrote:

> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> 
> Let's add a driver to read the stats from remote processor and
> export to debugfs.
> 
> The driver creates "qcom_sleep_stats" directory in debugfs and
> adds files for various low power mode available. Below is sample
> output with command
> 
> cat /sys/kernel/debug/qcom_sleep_stats/ddr
> count = 0
> Last Entered At = 0
> Last Exited At = 0
> Accumulated Duration = 0
> 
> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> [mkshah: add subsystem sleep stats, create one file for each stat]
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/soc/qcom/Kconfig           |  10 ++
>  drivers/soc/qcom/Makefile          |   1 +
>  drivers/soc/qcom/soc_sleep_stats.c | 255 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 266 insertions(+)
>  create mode 100644 drivers/soc/qcom/soc_sleep_stats.c
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 79b568f..e80b63a 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -190,6 +190,16 @@ config QCOM_SOCINFO
>  	 Say yes here to support the Qualcomm socinfo driver, providing
>  	 information about the SoC to user space.
>  
> +config QCOM_SOC_SLEEP_STATS
> +	tristate "Qualcomm Technologies, Inc. (QTI) SoC sleep stats driver"
> +	depends on ARCH_QCOM && DEBUG_FS || COMPILE_TEST
> +	depends on QCOM_SMEM
> +	help
> +	  Qualcomm Technologies, Inc. (QTI) SoC sleep stats driver to read
> +	  the shared memory exported by the remote processor related to
> +	  various SoC level low power modes statistics and export to debugfs
> +	  interface.
> +
>  config QCOM_WCNSS_CTRL
>  	tristate "Qualcomm WCNSS control driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index ad675a6..5f30d74 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
>  obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
>  obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
>  obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo.o
> +obj-$(CONFIG_QCOM_SOC_SLEEP_STATS)	+= soc_sleep_stats.o
>  obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
>  obj-$(CONFIG_QCOM_APR) += apr.o
>  obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
> diff --git a/drivers/soc/qcom/soc_sleep_stats.c b/drivers/soc/qcom/soc_sleep_stats.c
> new file mode 100644
> index 0000000..a8396f9
> --- /dev/null
> +++ b/drivers/soc/qcom/soc_sleep_stats.c
> @@ -0,0 +1,255 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2011-2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/seq_file.h>
> +
> +#include <linux/soc/qcom/smem.h>
> +#include <clocksource/arm_arch_timer.h>
> +
> +#define STAT_TYPE_OFFSET	0x0
> +#define COUNT_OFFSET		0x4
> +#define LAST_ENTERED_AT_OFFSET	0x8
> +#define LAST_EXITED_AT_OFFSET	0x10
> +#define ACCUMULATED_OFFSET	0x18
> +#define CLIENT_VOTES_OFFSET	0x1c
> +
> +struct subsystem_data {
> +	const char *name;
> +	u32 smem_item;
> +	u32 pid;
> +};
> +
> +static const struct subsystem_data subsystems[] = {
> +	{ "modem", 605, 1 },
> +	{ "wpss", 605, 13 },
> +	{ "adsp", 606, 2 },
> +	{ "cdsp", 607, 5 },
> +	{ "slpi", 608, 3 },
> +	{ "gpu", 609, 0 },
> +	{ "display", 610, 0 },
> +	{ "adsp_island", 613, 2 },
> +	{ "slpi_island", 613, 3 },
> +};
> +
> +struct stats_config {
> +	size_t offset_addr;
> +	size_t num_records;
> +	bool appended_stats_avail;
> +};
> +
> +struct stats_data {
> +	bool appended_stats_avail;
> +	void __iomem *base;
> +};
> +
> +struct sleep_stats {
> +	u32 stat_type;
> +	u32 count;
> +	u64 last_entered_at;
> +	u64 last_exited_at;
> +	u64 accumulated;
> +};
> +
> +struct appended_stats {
> +	u32 client_votes;
> +	u32 reserved[3];
> +};
> +
> +static void qcom_print_stats(struct seq_file *s, const struct sleep_stats *stat)
> +{
> +	u64 accumulated = stat->accumulated;
> +	/*
> +	 * If a subsystem is in sleep when reading the sleep stats adjust
> +	 * the accumulated sleep duration to show actual sleep time.
> +	 */
> +	if (stat->last_entered_at > stat->last_exited_at)
> +		accumulated += arch_timer_read_counter() - stat->last_entered_at;
> +
> +	seq_printf(s, "Count: %u\n", stat->count);
> +	seq_printf(s, "Last Entered At: %llu\n", stat->last_entered_at);
> +	seq_printf(s, "Last Exited At: %llu\n", stat->last_exited_at);
> +	seq_printf(s, "Accumulated Duration: %llu\n", accumulated);
> +}
> +
> +static int qcom_subsystem_sleep_stats_show(struct seq_file *s, void *unused)
> +{
> +	struct subsystem_data *subsystem = s->private;
> +	struct sleep_stats *stat;
> +
> +	/* Items are allocated lazily, so lookup pointer each time */
> +	stat = qcom_smem_get(subsystem->pid, subsystem->smem_item, NULL);
> +	if (IS_ERR(stat))
> +		return PTR_ERR(stat);
> +
> +	qcom_print_stats(s, stat);
> +
> +	return 0;
> +}
> +
> +static int qcom_soc_sleep_stats_show(struct seq_file *s, void *unused)
> +{
> +	struct stats_data *d = s->private;
> +	void __iomem *reg = d->base;
> +	struct sleep_stats stat;
> +
> +	memcpy_fromio(&stat, reg, sizeof(stat));
> +	qcom_print_stats(s, &stat);
> +
> +	if (d->appended_stats_avail) {
> +		struct appended_stats votes;
> +
> +		memcpy_fromio(&votes, reg + CLIENT_VOTES_OFFSET, sizeof(votes));
> +		seq_printf(s, "Client Votes: %#x\n", votes.client_votes);
> +	}
> +
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(qcom_soc_sleep_stats);
> +DEFINE_SHOW_ATTRIBUTE(qcom_subsystem_sleep_stats);
> +
> +static void qcom_create_soc_sleep_stat_files(struct dentry *root, void __iomem *reg,
> +					     struct stats_data *d, u32 num_records)
> +{
> +	char stat_type[sizeof(u32) + 1] = {0};
> +	u32 offset = 0, type;
> +	int i, j;
> +
> +	for (i = 0; i < num_records; i++) {
> +		d[i].base = reg + offset;
> +
> +		/*
> +		 * Read the low power mode name and create debugfs file for it.
> +		 * The names read could be of below,
> +		 * (may change depending on low power mode supported).
> +		 * For rpmh-sleep-stats: "aosd", "cxsd" and "ddr".
> +		 * For rpm-sleep-stats: "vmin" and "vlow".
> +		 */
> +		type = readl(d[i].base);
> +		for (j = 0; j < sizeof(u32); j++) {
> +			stat_type[j] = type & 0xff;
> +			type = type >> 8;
> +		}
> +		strim(stat_type);
> +		debugfs_create_file(stat_type, 0400, root, &d[i],
> +				    &qcom_soc_sleep_stats_fops);
> +
> +		offset += sizeof(struct sleep_stats);
> +		if (d[i].appended_stats_avail)
> +			offset += sizeof(struct appended_stats);
> +	}
> +}
> +
> +static void qcom_create_subsystem_stat_files(struct dentry *root)
> +{
> +	struct sleep_stats *stat;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(subsystems); i++) {
> +		stat = qcom_smem_get(subsystems[i].pid, subsystems[i].smem_item, NULL);
> +		if (IS_ERR(stat))
> +			continue;
> +
> +		debugfs_create_file(subsystems[i].name, 0400, root, (void *)&subsystems[i],
> +				    &qcom_subsystem_sleep_stats_fops);
> +	}
> +}
> +
> +static int qcom_soc_sleep_stats_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	void __iomem *reg;
> +	void __iomem *offset_addr;
> +	phys_addr_t stats_base;
> +	resource_size_t stats_size;
> +	struct dentry *root;
> +	const struct stats_config *config;
> +	struct stats_data *d;
> +	int i;
> +
> +	config = device_get_match_data(&pdev->dev);
> +	if (!config)
> +		return -ENODEV;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return PTR_ERR(res);
> +
> +	offset_addr = ioremap(res->start + config->offset_addr, sizeof(u32));
> +	if (IS_ERR(offset_addr))
> +		return PTR_ERR(offset_addr);
> +
> +	stats_base = res->start | readl_relaxed(offset_addr);
> +	stats_size = resource_size(res);
> +	iounmap(offset_addr);
> +
> +	reg = devm_ioremap(&pdev->dev, stats_base, stats_size);
> +	if (!reg)
> +		return -ENOMEM;
> +
> +	d = devm_kcalloc(&pdev->dev, config->num_records,
> +			 sizeof(*d), GFP_KERNEL);
> +	if (!d)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < config->num_records; i++)
> +		d[i].appended_stats_avail = config->appended_stats_avail;
> +
> +	root = debugfs_create_dir("qcom_sleep_stats", NULL);
> +
> +	qcom_create_subsystem_stat_files(root);
> +	qcom_create_soc_sleep_stat_files(root, reg, d, config->num_records);
> +
> +	platform_set_drvdata(pdev, root);
> +
> +	return 0;
> +}
> +
> +static int qcom_soc_sleep_stats_remove(struct platform_device *pdev)
> +{
> +	struct dentry *root = platform_get_drvdata(pdev);
> +
> +	debugfs_remove_recursive(root);
> +
> +	return 0;
> +}
> +
> +static const struct stats_config rpm_data = {
> +	.offset_addr = 0x14,
> +	.num_records = 2,
> +	.appended_stats_avail = true,
> +};
> +
> +static const struct stats_config rpmh_data = {
> +	.offset_addr = 0x4,
> +	.num_records = 3,
> +	.appended_stats_avail = false,
> +};
> +
> +static const struct of_device_id qcom_soc_sleep_stats_table[] = {
> +	{ .compatible = "qcom,rpm-sleep-stats", .data = &rpm_data },
> +	{ .compatible = "qcom,rpmh-sleep-stats", .data = &rpmh_data },
> +	{ }
> +};
> +
> +static struct platform_driver soc_sleep_stats_driver = {
> +	.probe = qcom_soc_sleep_stats_probe,
> +	.remove = qcom_soc_sleep_stats_remove,
> +	.driver = {
> +		.name = "soc_sleep_stats",
> +		.of_match_table = qcom_soc_sleep_stats_table,
> +	},
> +};
> +module_platform_driver(soc_sleep_stats_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. (QTI) SoC Sleep Stats driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_SOFTDEP("pre: smem");

I still think the qcom_smem_* function calls results in a harder
dependency than this softdep.

Regards,
Bjorn
