Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00E8817CC84
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2020 07:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgCGGmg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Mar 2020 01:42:36 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:52322 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgCGGmg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Mar 2020 01:42:36 -0500
Received: by mail-pj1-f68.google.com with SMTP id lt1so2006540pjb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2020 22:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/oNNdSDz+Pu4FiOerExxR8iu12rNNYCi6usitjqg83c=;
        b=UuTdjqdbhx9PbvHwYr0rs7dgG++/N0OIUmeq8lchjBthL6vid+j9KWo6DobA1oxrCs
         fPMYHjDJJHjSiDeJo3C/SFrFEPv5mcelF4rZ1q0YupnvEjsBQ3jTuFFqR4Zt/NsaueRT
         YOafu6/ViwcGcg4aBOJv0zqFTnqz1/Xi1DTIIrh3KhvWIr0jT0Rr1XfawR61xCziKLKX
         jBE5t+JcvOgl5WxdMpFxtp2iGAD6T8vXeWbQlBzMaZvLjMpY3DcGhDwiGxEUtU5K3VKm
         0y0YI8zi8RQNUfcswIGe7ugAH733unldDqS5il0Q1kf9Od6ql+yPKkWgBn4iAN9izE67
         W6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/oNNdSDz+Pu4FiOerExxR8iu12rNNYCi6usitjqg83c=;
        b=Qyrg+ZhI/FfyNiSViQzuhIJAKbfXpKHvD985xwSxSbsCaF/5zjvQ+02RAaC5aygt4H
         jINUESX3sBXyOleOJ/q0B4Zc5tuZPo8jCVMmxJKP+h6kSGc1l+eQI1q6AUf48/jIQ2YE
         2QT3QUQw3al+V3jJ53BuDZ+SHyLFKu6b4AOzrFo4tFzIhC3Z9w4dIxncUu5dUN6MFwHf
         VKreE384oju5XXBscLx7T1+59E9iji6z6OaSIfVtwTxVEgiDn3d70Egb9rwCPz3yZeVN
         Aogebk6LKJI+wUNo2spjRyeeQmb5dO7Xi8739OY/YGN7yh/pSj/d5HCbNEZHj+mFIdjU
         sRzg==
X-Gm-Message-State: ANhLgQ0E8fuy6+3CC0XWcPyCWt7xEk+HWfRqvX+cNQJ0v/a0NUS7e8k6
        dTwasiMqhZUfvTbOHULxzPg79A==
X-Google-Smtp-Source: ADFU+vuYJtzy3cvtBce+DdcftYGdRBLhQiVZK0zYnnyzVXqyA2ADTFkGnLyOKqRj6wuSU1Y4Cj+zBg==
X-Received: by 2002:a17:90b:3581:: with SMTP id mm1mr7179289pjb.169.1583563354802;
        Fri, 06 Mar 2020 22:42:34 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id ay10sm11467319pjb.37.2020.03.06.22.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 22:42:34 -0800 (PST)
Date:   Fri, 6 Mar 2020 22:42:31 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>
Subject: Re: [PATCH v3 2/4] soc: qcom: Add SoC sleep stats driver
Message-ID: <20200307064231.GF1094083@builder>
References: <1583479412-18320-1-git-send-email-mkshah@codeaurora.org>
 <1583479412-18320-3-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583479412-18320-3-git-send-email-mkshah@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 05 Mar 23:23 PST 2020, Maulik Shah wrote:

> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> 
> Let's add a driver to read the the stats from remote processor
> and export to debugfs.
> 
> The driver creates "soc_sleep_stats" directory in debugfs and adds
> files for various low power mode available. Below is sample output
> with command
> 

Given that this doesn't provide some generic stats for SoCs, how about
naming the whole thing qcom_sleep_stats instead?

> cat /sys/kernel/debug/soc_sleep_stats/ddr
> count = 0
> Last Entered At = 0
> Last Exited At = 0
> Accumulated Duration = 0
> 
> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Please include a changelog here.

>  drivers/soc/qcom/Kconfig           |   9 ++
>  drivers/soc/qcom/Makefile          |   1 +
>  drivers/soc/qcom/soc_sleep_stats.c | 248 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 258 insertions(+)
>  create mode 100644 drivers/soc/qcom/soc_sleep_stats.c
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index d0a73e7..08bc0df3 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -185,6 +185,15 @@ config QCOM_SOCINFO
>  	 Say yes here to support the Qualcomm socinfo driver, providing
>  	 information about the SoC to user space.
>  
> +config QCOM_SOC_SLEEP_STATS
> +	tristate "Qualcomm Technologies, Inc. (QTI) SoC sleep stats driver"
> +	depends on ARCH_QCOM && DEBUG_FS || COMPILE_TEST
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
> index 9fb35c8..e6bd052 100644
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
> index 00000000..79a14d2
> --- /dev/null
> +++ b/drivers/soc/qcom/soc_sleep_stats.c
> @@ -0,0 +1,248 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2011-2020, The Linux Foundation. All rights reserved.
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
> +#define MODEM_ITEM_ID		605
> +#define ADSP_ITEM_ID		606
> +#define CDSP_ITEM_ID		607
> +#define SLPI_ITEM_ID		608
> +#define GPU_ITEM_ID		609
> +#define DISPLAY_ITEM_ID		610

I don't think these defines adds any value, just plug in the numbers in
the table directly.

> +
> +#define PID_APSS		0
> +#define PID_MODEM		1
> +#define PID_ADSP		2
> +#define PID_SLPI		3
> +#define PID_CDSP		5

Ditto.

> +
> +#define NAME_LENGTH		5

As I suggested below, this isn't 5 - it's sizeof(u32) + 1, and as such
it doesn't add value to carry it as a define that doesn't fit on the
same screen when reading the code below.

> +
> +#define STAT_TYPE_ADDR		0x0
> +#define COUNT_ADDR		0x4
> +#define LAST_ENTERED_AT_ADDR	0x8
> +#define LAST_EXITED_AT_ADDR	0x10
> +#define ACCUMULATED_ADDR	0x18
> +#define CLIENT_VOTES_ADDR	0x1c
> +
> +struct subsystem_data {
> +	const char *name;
> +	u32 item_id;

"smem_item"

> +	u32 pid;
> +};
> +
> +static struct subsystem_data subsystems[] = {
> +	{ "modem", MODEM_ITEM_ID, PID_MODEM },
> +	{ "adsp", ADSP_ITEM_ID, PID_ADSP },
> +	{ "cdsp", CDSP_ITEM_ID, PID_CDSP },
> +	{ "slpi", SLPI_ITEM_ID, PID_SLPI },
> +	{ "gpu", GPU_ITEM_ID, PID_APSS },
> +	{ "display", DISPLAY_ITEM_ID, PID_APSS },
> +};
> +
> +struct stats_config {
> +	unsigned int offset_addr;
> +	unsigned int num_records;
> +	bool appended_stats_avail;
> +};
> +
> +static const struct stats_config *config;

Add this to soc_sleep_stats_data and pass that as s->private instead of
just the reg, to avoid the global variable.

> +
> +struct soc_sleep_stats_data {
> +	phys_addr_t stats_base;

This can be a local variable in soc_sleep_stats_probe()

> +	resource_size_t stats_size;

Ditto.

> +	void __iomem *reg;
> +	struct dentry *root;
> +};
> +
> +struct entry {

Can you please give this struct a slightly less generic name?

> +	u32 stat_type;
> +	u32 count;
> +	u64 last_entered_at;
> +	u64 last_exited_at;
> +	u64 accumulated;
> +};
> +
> +struct appended_entry {
> +	u32 client_votes;
> +	u32 reserved[3];
> +};
> +
> +static void print_sleep_stats(struct seq_file *s, struct entry *e)
> +{
> +	seq_printf(s, "Count = %u\n", e->count);
> +	seq_printf(s, "Last Entered At = %llu\n", e->last_entered_at);
> +	seq_printf(s, "Last Exited At = %llu\n", e->last_exited_at);
> +	seq_printf(s, "Accumulated Duration = %llu\n", e->accumulated);
> +}
> +
> +static int subsystem_sleep_stats_show(struct seq_file *s, void *d)
> +{
> +	struct subsystem_data *subsystem = s->private;
> +	struct entry *e;
> +
> +	e = qcom_smem_get(subsystem->pid, subsystem->item_id, NULL);
> +	if (IS_ERR(e))
> +		return PTR_ERR(e);
> +
> +	/*
> +	 * If a subsystem is in sleep when reading the sleep stats adjust
> +	 * the accumulated sleep duration to show actual sleep time.
> +	 */
> +	if (e->last_entered_at > e->last_exited_at)
> +		e->accumulated += (arch_timer_read_counter()
> +				   - e->last_entered_at);

How is this supposed to work? "e" is a pointer to the actual data in
smem, so every time "subsystem_sleep_stats" is shown we'll add the delta
since last_entered_at to a persistent variable?

Won't this make the "accumulated" value depend on the number of times
you have read the data?

I'm guessing that you're actually looking for:

	accumulated + now() - last_entered_at

In which case, making a stack-local copy of the data in e and then doing
this addition should provide the result you're looking for.

> +
> +	print_sleep_stats(s, e);
> +
> +	return 0;
> +}
> +
> +static int soc_sleep_stats_show(struct seq_file *s, void *d)
> +{
> +	void __iomem *reg = s->private;
> +	struct entry e;
> +
> +	e.count = readl_relaxed(reg + COUNT_ADDR);

No need to "_relax" these reads.

> +	e.last_entered_at = readq_relaxed(reg + LAST_ENTERED_AT_ADDR);
> +	e.last_exited_at = readq_relaxed(reg + LAST_EXITED_AT_ADDR);
> +	e.accumulated = readq_relaxed(reg + ACCUMULATED_ADDR);
> +
> +	print_sleep_stats(s, &e);
> +
> +	if (config->appended_stats_avail) {
> +		struct appended_entry ae;
> +
> +		ae.client_votes = readl_relaxed(reg + CLIENT_VOTES_ADDR);
> +		seq_printf(s, "Client_votes = %#x\n", ae.client_votes);
> +	}
> +
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(soc_sleep_stats);
> +DEFINE_SHOW_ATTRIBUTE(subsystem_sleep_stats);
> +
> +static void create_debugfs_entries(struct soc_sleep_stats_data *drv)
> +{
> +	struct entry *e;
> +	char stat_type[NAME_LENGTH] = {0};

NAME_LENGTH is sizeof(u32) + 1 and will never change, so I think the use
of a define only serves to obfuscate things.

> +	u32 offset, type;
> +	int i;
> +
> +	drv->root = debugfs_create_dir("soc_sleep_stats", NULL);
> +
> +	for (i = 0; i < config->num_records; i++) {
> +		offset = STAT_TYPE_ADDR + (i * sizeof(struct entry));
> +
> +		if (config->appended_stats_avail)
> +			offset += i * sizeof(struct appended_entry);
> +
> +		type = le32_to_cpu(readl_relaxed(drv->reg + offset));

readl_relaxed() is already CPU endian, so this isn't right.


And please drop the "_relaxed".

> +		memcpy(stat_type, &type, sizeof(u32));
> +		debugfs_create_file(stat_type, 0444, drv->root,
> +				    drv->reg + offset,
> +				    &soc_sleep_stats_fops);
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(subsystems); i++) {
> +		e = qcom_smem_get(subsystems[i].pid, subsystems[i].item_id,
> +				  NULL);

Feel free to ignore the 80-char "limit", and drop the empty line before
the check below.

> +
> +		if (IS_ERR(e))
> +			continue;
> +
> +		debugfs_create_file(subsystems[i].name, 0444, drv->root,
> +				    &subsystems[i],
> +				    &subsystem_sleep_stats_fops);
> +	}
> +}
> +
> +static int soc_sleep_stats_probe(struct platform_device *pdev)
> +{
> +	struct soc_sleep_stats_data *drv;
> +	struct resource *res;
> +	void __iomem *offset_addr;
> +
> +	drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
> +	if (!drv)
> +		return -ENOMEM;
> +
> +	config = device_get_match_data(&pdev->dev);
> +	if (!config)
> +		return -ENODEV;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return PTR_ERR(res);
> +
> +	offset_addr = devm_ioremap(&pdev->dev,
> +				   res->start + config->offset_addr,
> +				   sizeof(u32));

No need to devm this.

> +	if (IS_ERR(offset_addr))
> +		return PTR_ERR(offset_addr);
> +
> +	drv->stats_base = res->start | readl_relaxed(offset_addr);
> +	drv->stats_size = resource_size(res);

As stated above, these can be local variables...

> +	devm_iounmap(&pdev->dev, offset_addr);
> +
> +	drv->reg = devm_ioremap(&pdev->dev, drv->stats_base, drv->stats_size);
> +	if (!drv->reg)
> +		return -ENOMEM;
> +
> +	create_debugfs_entries(drv);
> +	platform_set_drvdata(pdev, drv);
> +
> +	return 0;
> +}
> +
> +static int soc_sleep_stats_remove(struct platform_device *pdev)
> +{
> +	struct soc_sleep_stats_data *drv = platform_get_drvdata(pdev);
> +
> +	debugfs_remove_recursive(drv->root);
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
> +static const struct of_device_id soc_sleep_stats_table[] = {
> +	{ .compatible = "qcom,rpm-sleep-stats", .data = &rpm_data},
> +	{ .compatible = "qcom,rpmh-sleep-stats", .data = &rpmh_data},

Please add an extra space between data and '}' in these two.

Thanks,
Bjorn

> +	{ }
> +};
> +
> +static struct platform_driver soc_sleep_stats_driver = {
> +	.probe = soc_sleep_stats_probe,
> +	.remove = soc_sleep_stats_remove,
> +	.driver = {
> +		.name = "soc_sleep_stats",
> +		.of_match_table = soc_sleep_stats_table,
> +	},
> +};
> +module_platform_driver(soc_sleep_stats_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. (QTI) SoC Sleep Stats driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
