Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7F1D42F488
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 15:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236490AbhJOOAZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 10:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240190AbhJOOAZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 10:00:25 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D42BBC061762
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 06:58:18 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 66so8674413pgc.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 06:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PNgm3gMI3Ep9D4rFCI/hsA9SGMGN6z0WLmivLOAL39o=;
        b=yF3lHpqnG1sE/5eoK0IlnC6fbAUmqqI/splDJ6RaMATN6PRaCN4xGT0RUPzUuRaaNy
         gUQglo97AG7qSHq2SRSaSJ1o1QFLVCozx4BnSdFohJGv7fibLMTypV88kLg3I5yXdvDD
         xUUZFuSbgRxB5jw630d4NXdlcKHp27HYFsJcBLb6TcOhE0whsJdq9wU/Pl6bSAUkMqDR
         QTAXCdBUUe3LMnpqqY2vr7azWMrqG51DXkADO9igl6zOS4WLh8ssEYBQkmaPn7Z9jXbP
         6mONz+Wr2j+Ien4gDSzdJGiOOAzH5N3LBkjpdnfD7P7rnVUsIL4eW/9F3eRlU6The8hv
         Slfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PNgm3gMI3Ep9D4rFCI/hsA9SGMGN6z0WLmivLOAL39o=;
        b=DVvM0VC9mVQnJLHjU3SZCXUrSKlZsqXNjLh13Bs6YjT1COe3QNDokVEc2wbqEB1Ht+
         Yao/P60FThnrH+w9hDykNhBf/hSC9khJlnSLsNEJ965OfaTiDorP9qMCFfpzNhqWhkwy
         z367GUXyhAi+D8p80BvqHAlA6rUtQ2vSnm5ZcC+ShY6JUcSe3tVg7HMB/zmbOj7LLitq
         NywvFO5lluh5YkYVYBkcSTKuQ//Z8XNRl+MguwDN/udSQ8Om+u5J85xVRru+jobdBQOm
         n+mR8NDJG1R0Axwhiz27iRfnZ76bboFqUrALGfo+JergWPVXAV8u2GfmWpT7c4qrrlJw
         SlTg==
X-Gm-Message-State: AOAM532XnQqhU2IkK25CDpOWiISmkeIVoW3T9WN9xwaHZoHbpbXKw4Dm
        Ki8X3P8JYzNuNO0mWsURaSJ8hw==
X-Google-Smtp-Source: ABdhPJyfo3wcGRo/7QoimDEVmeHCR8iYLEnkwWeXT1P0NvflthKJa0RDr4FMPz07pYRdnzotxxGsYw==
X-Received: by 2002:a63:6c02:: with SMTP id h2mr9184031pgc.173.1634306298168;
        Fri, 15 Oct 2021 06:58:18 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id k22sm5002958pfi.149.2021.10.15.06.58.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Oct 2021 06:58:17 -0700 (PDT)
Date:   Fri, 15 Oct 2021 21:58:10 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, linux@roeck-us.net, rnayak@codeaurora.org,
        lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH v12 2/5] soc: qcom: Add Sleep stats driver
Message-ID: <20211015135809.GB7231@dragon>
References: <1634107104-22197-1-git-send-email-mkshah@codeaurora.org>
 <1634107104-22197-3-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1634107104-22197-3-git-send-email-mkshah@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mahesh,

Thanks for the work!

While I tested it good on SDM660 and MSM8939, I have a question
regarding 'vlow' mode below. 

On Wed, Oct 13, 2021 at 12:08:21PM +0530, Maulik Shah wrote:
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
>  drivers/soc/qcom/Kconfig      |  10 ++
>  drivers/soc/qcom/Makefile     |   1 +
>  drivers/soc/qcom/qcom_stats.c | 277 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 288 insertions(+)
>  create mode 100644 drivers/soc/qcom/qcom_stats.c
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index abfef20..3cf3a6b 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -199,6 +199,16 @@ config QCOM_SPM
>  	  to manage cores, L2 low power modes and to configure the internal
>  	  Adaptive Voltage Scaler parameters, where supported.
>  
> +config QCOM_STATS
> +	tristate "Qualcomm Technologies, Inc. (QTI) Sleep stats driver"
> +	depends on (ARCH_QCOM && DEBUG_FS) || COMPILE_TEST
> +	depends on QCOM_SMEM
> +	help
> +	  Qualcomm Technologies, Inc. (QTI) Sleep stats driver to read
> +	  the shared memory exported by the remote processor related to
> +	  various SoC level low power modes statistics and export to debugfs
> +	  interface.
> +
>  config QCOM_WCNSS_CTRL
>  	tristate "Qualcomm WCNSS control driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index 24514c7..70d5de6 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -21,6 +21,7 @@ obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
>  obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
>  obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo.o
>  obj-$(CONFIG_QCOM_SPM)		+= spm.o
> +obj-$(CONFIG_QCOM_STATS)	+= qcom_stats.o
>  obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
>  obj-$(CONFIG_QCOM_APR) += apr.o
>  obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
> new file mode 100644
> index 0000000..817505b
> --- /dev/null
> +++ b/drivers/soc/qcom/qcom_stats.c
> @@ -0,0 +1,277 @@
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
> +#define RPM_DYNAMIC_ADDR	0x14
> +#define RPM_DYNAMIC_ADDR_MASK	0xFFFF
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
> +	size_t stats_offset;
> +	size_t num_records;
> +	bool appended_stats_avail;
> +	bool dynamic_offset;
> +	bool subsystem_stats_in_smem;
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
> +		return -EIO;
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
> +					     struct stats_data *d,
> +					     const struct stats_config *config)
> +{
> +	char stat_type[sizeof(u32) + 1] = {0};
> +	size_t stats_offset = config->stats_offset;
> +	u32 offset = 0, type;
> +	int i, j;
> +
> +	/*
> +	 * On RPM targets, stats offset location is dynamic and changes from target
> +	 * to target and sometimes from build to build for same target.
> +	 *
> +	 * In such cases the dynamic address is present at 0x14 offset from base
> +	 * address in devicetree. The last 16bits indicates the stats_offset.
> +	 */
> +	if (config->dynamic_offset) {
> +		stats_offset = readl(reg + RPM_DYNAMIC_ADDR);
> +		stats_offset &= RPM_DYNAMIC_ADDR_MASK;
> +	}
> +
> +	for (i = 0; i < config->num_records; i++) {
> +		d[i].base = reg + offset + stats_offset;
> +
> +		/*
> +		 * Read the low power mode name and create debugfs file for it.
> +		 * The names read could be of below,
> +		 * (may change depending on low power mode supported).
> +		 * For rpmh-sleep-stats: "aosd", "cxsd" and "ddr".
> +		 * For rpm-sleep-stats: "vmin" and "vlow".

It reports 'vmin' and 'xosd' on MSM8939, 'vmin' and 'vlow' on SDM660.
I know that 'vmin' is VDD Minimization mode, and 'xosd' is XO Shutdown
mode.  But I'm not sure about 'vlow' mode.  Could you share some
information regarding what this low power mode is, and how it differs
from 'vmin' and 'xosd'?

Also I guess XO Shutdown mode is still available on SoCs that report
'vlow' instead of 'xosd', just like SDM660.  Is there any way we can
still check the stats of XO Shutdown mode on these SoCs?  Thanks!

Shawn

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
> +static void qcom_create_subsystem_stat_files(struct dentry *root,
> +					     const struct stats_config *config)
> +{
> +	const struct sleep_stats *stat;
> +	int i;
> +
> +	if (!config->subsystem_stats_in_smem)
> +		return;
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
> +static int qcom_stats_probe(struct platform_device *pdev)
> +{
> +	void __iomem *reg;
> +	struct dentry *root;
> +	const struct stats_config *config;
> +	struct stats_data *d;
> +	int i;
> +
> +	config = device_get_match_data(&pdev->dev);
> +	if (!config)
> +		return -ENODEV;
> +
> +	reg = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	if (IS_ERR(reg))
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
> +	root = debugfs_create_dir("qcom_stats", NULL);
> +
> +	qcom_create_subsystem_stat_files(root, config);
> +	qcom_create_soc_sleep_stat_files(root, reg, d, config);
> +
> +	platform_set_drvdata(pdev, root);
> +
> +	return 0;
> +}
> +
> +static int qcom_stats_remove(struct platform_device *pdev)
> +{
> +	struct dentry *root = platform_get_drvdata(pdev);
> +
> +	debugfs_remove_recursive(root);
> +
> +	return 0;
> +}
> +
> +static const struct stats_config rpm_data = {
> +	.stats_offset = 0,
> +	.num_records = 2,
> +	.appended_stats_avail = true,
> +	.dynamic_offset = true,
> +	.subsystem_stats_in_smem = false,
> +};
> +
> +static const struct stats_config rpmh_data = {
> +	.stats_offset = 0x48,
> +	.num_records = 3,
> +	.appended_stats_avail = false,
> +	.dynamic_offset = false,
> +	.subsystem_stats_in_smem = true,
> +};
> +
> +static const struct of_device_id qcom_stats_table[] = {
> +	{ .compatible = "qcom,rpm-stats", .data = &rpm_data },
> +	{ .compatible = "qcom,rpmh-stats", .data = &rpmh_data },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, qcom_stats_table);
> +
> +static struct platform_driver qcom_stats = {
> +	.probe = qcom_stats_probe,
> +	.remove = qcom_stats_remove,
> +	.driver = {
> +		.name = "qcom_stats",
> +		.of_match_table = qcom_stats_table,
> +	},
> +};
> +
> +static int __init qcom_stats_init(void)
> +{
> +	return platform_driver_register(&qcom_stats);
> +}
> +late_initcall(qcom_stats_init);
> +
> +static void __exit qcom_stats_exit(void)
> +{
> +	platform_driver_unregister(&qcom_stats);
> +}
> +module_exit(qcom_stats_exit)
> +
> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. (QTI) Stats driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
