Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75797422D5C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 18:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235876AbhJEQIX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 12:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234850AbhJEQIX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 12:08:23 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B31FBC061749
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 09:06:32 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id i26-20020a4ad09a000000b002a9d58c24f5so6563696oor.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 09:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HNCR1J5Ok9P6uIqZ13evC15Pk+RaZVa8qzf0iQdxZGQ=;
        b=L0cOCRNH9CAgp0ZXaUys4uqt8yduyzEz9jItxNB/IPr9qVEfR9wZdPokxWaszeDcYP
         JENLkglGao+l14MNVdR2HPJ2fuX2kUq8nAF9GOwYUXXkel8I/eTPwz5LozhTpBOrXlhV
         AkuxxOKETsbn122XllKWWrup7VvcPx4OHb5brazX6ovOsZ+6dZbzlZf5JKf/nG88dWRG
         AGa3F6uYRpLz1Q9SNoaJkw6yUNdqWFqo2hkd8noN5yYRPB5ygzbsQv4Rq/t011oBAsge
         bRy7WUekVELdamv7vQkAbo6WPh7wXeV1gGcAqpFeevelgHRqowwe6S58o4WaySamMlL0
         R/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HNCR1J5Ok9P6uIqZ13evC15Pk+RaZVa8qzf0iQdxZGQ=;
        b=5FxtNpxUoTKL4dZEKQ6obFIy8460FeHqxnFyM2TMztMcS430VAT/YT31m3OI9XMyDn
         U5kQuOM64//zmSOnpY+3hfZseqCassATFTIiTkrB63S/1wQ6Tlr1S6Xcr8C3gaFkS8k6
         vNDHrEvU84e309a3NONSg8/1K1PogjRM1ILNqhqQ+aDc5/XhCKtDnhodMyx2rML6Z292
         cv5uUW1r66i9dRiYt20A5AcaCpTWUc0go2jQEANS/Sv8OHoQvF8duT2msuCWaqfZF/gh
         ZCnf/cDqrv4WZOSHwYvIq+ogEz574791PIc1b4dDm72SpD4WxPh+mWes67RJtB6SUSRo
         zwmg==
X-Gm-Message-State: AOAM530VnMAXoEtg8i/cvaUQlmy3QcaUap3/jvXhE/aoM0ht8D6XtBKq
        jNTAP+xW+mH/+MpkLJQyWHWwMA==
X-Google-Smtp-Source: ABdhPJyHJ05Ff1XRCdal81vi7yjpPU8cH4FwD8m7sb6pgfMicO4O15nK2AMEeMdWAToHPhHvbK5I8w==
X-Received: by 2002:a4a:d385:: with SMTP id i5mr13970074oos.4.1633449991332;
        Tue, 05 Oct 2021 09:06:31 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id h5sm3547616oti.58.2021.10.05.09.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 09:06:30 -0700 (PDT)
Date:   Tue, 5 Oct 2021 09:08:12 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH v10 2/5] soc: qcom: Add SoC sleep stats driver
Message-ID: <YVx4bFN05OPLll6u@ripper>
References: <1633425065-7927-1-git-send-email-mkshah@codeaurora.org>
 <1633425065-7927-3-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633425065-7927-3-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 05 Oct 02:11 PDT 2021, Maulik Shah wrote:

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

What's the minimal effort needed to get any of these values to become
non-zero, on any of the upstream boards?

> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> [mkshah: add subsystem sleep stats, create one file for each stat]
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/soc/qcom/Kconfig            |  10 ++
>  drivers/soc/qcom/Makefile           |   1 +
>  drivers/soc/qcom/qcom_sleep_stats.c | 240 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 251 insertions(+)
>  create mode 100644 drivers/soc/qcom/qcom_sleep_stats.c
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index abfef20..ad45f59 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -182,6 +182,16 @@ config QCOM_SMSM
>  	  Say yes here to support the Qualcomm Shared Memory State Machine.
>  	  The state machine is represented by bits in shared memory.
>  
> +config QCOM_SLEEP_STATS
> +	tristate "Qualcomm Technologies, Inc. (QTI) Sleep stats driver"
> +	depends on ARCH_QCOM && DEBUG_FS || COMPILE_TEST

Is this equivalent to (QCOM && DBGFS) || COMPILE_TEST or
QCOM && (DBGFS || COMPILE_TEST) ?

The prior seems like what we want.


I think the rest looks good now.

Thanks,
Bjorn

> +	depends on QCOM_SMEM
> +	help
> +	  Qualcomm Technologies, Inc. (QTI) Sleep stats driver to read
> +	  the shared memory exported by the remote processor related to
> +	  various SoC level low power modes statistics and export to debugfs
> +	  interface.
> +
>  config QCOM_SOCINFO
>  	tristate "Qualcomm socinfo driver"
>  	depends on QCOM_SMEM
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index 24514c7..ad84f7b 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_QCOM_SMEM) +=	smem.o
>  obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
>  obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
>  obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
> +obj-$(CONFIG_QCOM_SLEEP_STATS)	+= qcom_sleep_stats.o
>  obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo.o
>  obj-$(CONFIG_QCOM_SPM)		+= spm.o
>  obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
> diff --git a/drivers/soc/qcom/qcom_sleep_stats.c b/drivers/soc/qcom/qcom_sleep_stats.c
> new file mode 100644
> index 0000000..c85e19b
> --- /dev/null
> +++ b/drivers/soc/qcom/qcom_sleep_stats.c
> @@ -0,0 +1,240 @@
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
> +	size_t stats_offset;
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
> +	u32 offset = 0, type;
> +	int i, j;
> +
> +	for (i = 0; i < config->num_records; i++) {
> +		d[i].base = reg + offset + config->stats_offset;
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
> +	const struct sleep_stats *stat;
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
> +static int qcom_sleep_stats_probe(struct platform_device *pdev)
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
> +	root = debugfs_create_dir("qcom_sleep_stats", NULL);
> +
> +	qcom_create_subsystem_stat_files(root);
> +	qcom_create_soc_sleep_stat_files(root, reg, d, config);
> +
> +	platform_set_drvdata(pdev, root);
> +
> +	return 0;
> +}
> +
> +static int qcom_sleep_stats_remove(struct platform_device *pdev)
> +{
> +	struct dentry *root = platform_get_drvdata(pdev);
> +
> +	debugfs_remove_recursive(root);
> +
> +	return 0;
> +}
> +
> +static const struct stats_config rpm_data = {
> +	.stats_offset = 0x2e8,
> +	.num_records = 2,
> +	.appended_stats_avail = true,
> +};
> +
> +static const struct stats_config rpmh_data = {
> +	.stats_offset = 0x48,
> +	.num_records = 3,
> +	.appended_stats_avail = false,
> +};
> +
> +static const struct of_device_id qcom_sleep_stats_table[] = {
> +	{ .compatible = "qcom,rpm-sleep-stats", .data = &rpm_data },
> +	{ .compatible = "qcom,rpmh-sleep-stats", .data = &rpmh_data },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, qcom_sleep_stats_table);
> +
> +static struct platform_driver qcom_sleep_stats = {
> +	.probe = qcom_sleep_stats_probe,
> +	.remove = qcom_sleep_stats_remove,
> +	.driver = {
> +		.name = "qcom_sleep_stats",
> +		.of_match_table = qcom_sleep_stats_table,
> +	},
> +};
> +module_platform_driver(qcom_sleep_stats);
> +
> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. (QTI) Sleep Stats driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
