Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08D7317DE12
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 11:58:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgCIK6i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 06:58:38 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:44913 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725962AbgCIK6h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 06:58:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583751517; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=y3pSSJwrNTZv3ksJblN8+UJSTAdIUAyK4nDHvPq8xyY=; b=n6GyHTP1qM3iaJgyZPXlwMOwtvNtsd1zfJQTN3y6xEkik49SkXC+sLRTEBZGgVu/o2TdO1n6
 F3ByZSW/F9DiTXmfMwgnOL2SlZTJmOF4svs+ZzK+/rNvWIKghuDzFKCOrig8zfsFviO/uSgG
 9SnL9YCXeHhmeO77io+0C7k6t9E=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e66215a.7fb602e8f308-smtp-out-n01;
 Mon, 09 Mar 2020 10:58:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 97723C43636; Mon,  9 Mar 2020 10:58:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B66B1C433CB;
        Mon,  9 Mar 2020 10:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B66B1C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v3 2/4] soc: qcom: Add SoC sleep stats driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>
References: <1583479412-18320-1-git-send-email-mkshah@codeaurora.org>
 <1583479412-18320-3-git-send-email-mkshah@codeaurora.org>
 <20200307064231.GF1094083@builder>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <e1133bcd-b1fe-98b3-3a28-c12d07ff8ebc@codeaurora.org>
Date:   Mon, 9 Mar 2020 16:28:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200307064231.GF1094083@builder>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/7/2020 12:12 PM, Bjorn Andersson wrote:
> On Thu 05 Mar 23:23 PST 2020, Maulik Shah wrote:
>
>> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>>
>> Let's add a driver to read the the stats from remote processor
>> and export to debugfs.
>>
>> The driver creates "soc_sleep_stats" directory in debugfs and adds
>> files for various low power mode available. Below is sample output
>> with command
>>
> Given that this doesn't provide some generic stats for SoCs, how about
> naming the whole thing qcom_sleep_stats instead?
Done. Updated to create "qcom_sleep_stats" directory.
>> cat /sys/kernel/debug/soc_sleep_stats/ddr
>> count = 0
>> Last Entered At = 0
>> Last Exited At = 0
>> Accumulated Duration = 0
>>
>> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
> Please include a changelog here.
Done.
>
>>  drivers/soc/qcom/Kconfig           |   9 ++
>>  drivers/soc/qcom/Makefile          |   1 +
>>  drivers/soc/qcom/soc_sleep_stats.c | 248 +++++++++++++++++++++++++++++++++++++
>>  3 files changed, 258 insertions(+)
>>  create mode 100644 drivers/soc/qcom/soc_sleep_stats.c
>>
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index d0a73e7..08bc0df3 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -185,6 +185,15 @@ config QCOM_SOCINFO
>>  	 Say yes here to support the Qualcomm socinfo driver, providing
>>  	 information about the SoC to user space.
>>  
>> +config QCOM_SOC_SLEEP_STATS
>> +	tristate "Qualcomm Technologies, Inc. (QTI) SoC sleep stats driver"
>> +	depends on ARCH_QCOM && DEBUG_FS || COMPILE_TEST
>> +	help
>> +	  Qualcomm Technologies, Inc. (QTI) SoC sleep stats driver to read
>> +	  the shared memory exported by the remote processor related to
>> +	  various SoC level low power modes statistics and export to debugfs
>> +	  interface.
>> +
>>  config QCOM_WCNSS_CTRL
>>  	tristate "Qualcomm WCNSS control driver"
>>  	depends on ARCH_QCOM || COMPILE_TEST
>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> index 9fb35c8..e6bd052 100644
>> --- a/drivers/soc/qcom/Makefile
>> +++ b/drivers/soc/qcom/Makefile
>> @@ -20,6 +20,7 @@ obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
>>  obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
>>  obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
>>  obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo.o
>> +obj-$(CONFIG_QCOM_SOC_SLEEP_STATS)	+= soc_sleep_stats.o
>>  obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
>>  obj-$(CONFIG_QCOM_APR) += apr.o
>>  obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
>> diff --git a/drivers/soc/qcom/soc_sleep_stats.c b/drivers/soc/qcom/soc_sleep_stats.c
>> new file mode 100644
>> index 00000000..79a14d2
>> --- /dev/null
>> +++ b/drivers/soc/qcom/soc_sleep_stats.c
>> @@ -0,0 +1,248 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2011-2020, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/debugfs.h>
>> +#include <linux/device.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/seq_file.h>
>> +
>> +#include <linux/soc/qcom/smem.h>
>> +#include <clocksource/arm_arch_timer.h>
>> +
>> +#define MODEM_ITEM_ID		605
>> +#define ADSP_ITEM_ID		606
>> +#define CDSP_ITEM_ID		607
>> +#define SLPI_ITEM_ID		608
>> +#define GPU_ITEM_ID		609
>> +#define DISPLAY_ITEM_ID		610
> I don't think these defines adds any value, just plug in the numbers in
> the table directly.
>
>> +
>> +#define PID_APSS		0
>> +#define PID_MODEM		1
>> +#define PID_ADSP		2
>> +#define PID_SLPI		3
>> +#define PID_CDSP		5
> Ditto.
Done.
>
>> +
>> +#define NAME_LENGTH		5
> As I suggested below, this isn't 5 - it's sizeof(u32) + 1, and as such
> it doesn't add value to carry it as a define that doesn't fit on the
> same screen when reading the code below.
Done.
>> +
>> +#define STAT_TYPE_ADDR		0x0
>> +#define COUNT_ADDR		0x4
>> +#define LAST_ENTERED_AT_ADDR	0x8
>> +#define LAST_EXITED_AT_ADDR	0x10
>> +#define ACCUMULATED_ADDR	0x18
>> +#define CLIENT_VOTES_ADDR	0x1c
>> +
>> +struct subsystem_data {
>> +	const char *name;
>> +	u32 item_id;
> "smem_item"
Done.
>> +	u32 pid;
>> +};
>> +
>> +static struct subsystem_data subsystems[] = {
>> +	{ "modem", MODEM_ITEM_ID, PID_MODEM },
>> +	{ "adsp", ADSP_ITEM_ID, PID_ADSP },
>> +	{ "cdsp", CDSP_ITEM_ID, PID_CDSP },
>> +	{ "slpi", SLPI_ITEM_ID, PID_SLPI },
>> +	{ "gpu", GPU_ITEM_ID, PID_APSS },
>> +	{ "display", DISPLAY_ITEM_ID, PID_APSS },
>> +};
>> +
>> +struct stats_config {
>> +	unsigned int offset_addr;
>> +	unsigned int num_records;
>> +	bool appended_stats_avail;
>> +};
>> +
>> +static const struct stats_config *config;
> Add this to soc_sleep_stats_data and pass that as s->private instead of
> just the reg, to avoid the global variable.

No, this is required to keep global. we are not passing just reg as s->private,
we are passing "reg + offset" which differs for each stat.

>> +
>> +struct soc_sleep_stats_data {
>> +	phys_addr_t stats_base;
> This can be a local variable in soc_sleep_stats_probe()
>
>> +	resource_size_t stats_size;
> Ditto.
Done.
>
>> +	void __iomem *reg;
>> +	struct dentry *root;
>> +};
>> +
>> +struct entry {
> Can you please give this struct a slightly less generic name?
Done.
>
>> +	u32 stat_type;
>> +	u32 count;
>> +	u64 last_entered_at;
>> +	u64 last_exited_at;
>> +	u64 accumulated;
>> +};
>> +
>> +struct appended_entry {
>> +	u32 client_votes;
>> +	u32 reserved[3];
>> +};
>> +
>> +static void print_sleep_stats(struct seq_file *s, struct entry *e)
>> +{
>> +	seq_printf(s, "Count = %u\n", e->count);
>> +	seq_printf(s, "Last Entered At = %llu\n", e->last_entered_at);
>> +	seq_printf(s, "Last Exited At = %llu\n", e->last_exited_at);
>> +	seq_printf(s, "Accumulated Duration = %llu\n", e->accumulated);
>> +}
>> +
>> +static int subsystem_sleep_stats_show(struct seq_file *s, void *d)
>> +{
>> +	struct subsystem_data *subsystem = s->private;
>> +	struct entry *e;
>> +
>> +	e = qcom_smem_get(subsystem->pid, subsystem->item_id, NULL);
>> +	if (IS_ERR(e))
>> +		return PTR_ERR(e);
>> +
>> +	/*
>> +	 * If a subsystem is in sleep when reading the sleep stats adjust
>> +	 * the accumulated sleep duration to show actual sleep time.
>> +	 */
>> +	if (e->last_entered_at > e->last_exited_at)
>> +		e->accumulated += (arch_timer_read_counter()
>> +				   - e->last_entered_at);
> How is this supposed to work? "e" is a pointer to the actual data in
> smem, so every time "subsystem_sleep_stats" is shown we'll add the delta
> since last_entered_at to a persistent variable?
>
> Won't this make the "accumulated" value depend on the number of times
> you have read the data?
>
> I'm guessing that you're actually looking for:
>
> 	accumulated + now() - last_entered_at
>
> In which case, making a stack-local copy of the data in e and then doing
> this addition should provide the result you're looking for.
Although accumulated will updated again when subsystem updates this entry.
it will be impacted when subsystem is in sleep and repeated read is done for the stats.

Thanks for pointing this. Done.
>
>> +
>> +	print_sleep_stats(s, e);
>> +
>> +	return 0;
>> +}
>> +
>> +static int soc_sleep_stats_show(struct seq_file *s, void *d)
>> +{
>> +	void __iomem *reg = s->private;
>> +	struct entry e;
>> +
>> +	e.count = readl_relaxed(reg + COUNT_ADDR);
> No need to "_relax" these reads.
Done.
>
>> +	e.last_entered_at = readq_relaxed(reg + LAST_ENTERED_AT_ADDR);
>> +	e.last_exited_at = readq_relaxed(reg + LAST_EXITED_AT_ADDR);
>> +	e.accumulated = readq_relaxed(reg + ACCUMULATED_ADDR);
>> +
>> +	print_sleep_stats(s, &e);
>> +
>> +	if (config->appended_stats_avail) {
>> +		struct appended_entry ae;
>> +
>> +		ae.client_votes = readl_relaxed(reg + CLIENT_VOTES_ADDR);
>> +		seq_printf(s, "Client_votes = %#x\n", ae.client_votes);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +DEFINE_SHOW_ATTRIBUTE(soc_sleep_stats);
>> +DEFINE_SHOW_ATTRIBUTE(subsystem_sleep_stats);
>> +
>> +static void create_debugfs_entries(struct soc_sleep_stats_data *drv)
>> +{
>> +	struct entry *e;
>> +	char stat_type[NAME_LENGTH] = {0};
> NAME_LENGTH is sizeof(u32) + 1 and will never change, so I think the use
> of a define only serves to obfuscate things.
Done.
>> +	u32 offset, type;
>> +	int i;
>> +
>> +	drv->root = debugfs_create_dir("soc_sleep_stats", NULL);
>> +
>> +	for (i = 0; i < config->num_records; i++) {
>> +		offset = STAT_TYPE_ADDR + (i * sizeof(struct entry));
>> +
>> +		if (config->appended_stats_avail)
>> +			offset += i * sizeof(struct appended_entry);
>> +
>> +		type = le32_to_cpu(readl_relaxed(drv->reg + offset));
> readl_relaxed() is already CPU endian, so this isn't right.
>
>
> And please drop the "_relaxed".
Done.
>
>> +		memcpy(stat_type, &type, sizeof(u32));
>> +		debugfs_create_file(stat_type, 0444, drv->root,
>> +				    drv->reg + offset,
>> +				    &soc_sleep_stats_fops);
>> +	}
>> +
>> +	for (i = 0; i < ARRAY_SIZE(subsystems); i++) {
>> +		e = qcom_smem_get(subsystems[i].pid, subsystems[i].item_id,
>> +				  NULL);
> Feel free to ignore the 80-char "limit", and drop the empty line before
> the check below.
Done.
>> +
>> +		if (IS_ERR(e))
>> +			continue;
>> +
>> +		debugfs_create_file(subsystems[i].name, 0444, drv->root,
>> +				    &subsystems[i],
>> +				    &subsystem_sleep_stats_fops);
>> +	}
>> +}
>> +
>> +static int soc_sleep_stats_probe(struct platform_device *pdev)
>> +{
>> +	struct soc_sleep_stats_data *drv;
>> +	struct resource *res;
>> +	void __iomem *offset_addr;
>> +
>> +	drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
>> +	if (!drv)
>> +		return -ENOMEM;
>> +
>> +	config = device_get_match_data(&pdev->dev);
>> +	if (!config)
>> +		return -ENODEV;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!res)
>> +		return PTR_ERR(res);
>> +
>> +	offset_addr = devm_ioremap(&pdev->dev,
>> +				   res->start + config->offset_addr,
>> +				   sizeof(u32));
> No need to devm this.
Done.
>
>> +	if (IS_ERR(offset_addr))
>> +		return PTR_ERR(offset_addr);
>> +
>> +	drv->stats_base = res->start | readl_relaxed(offset_addr);
>> +	drv->stats_size = resource_size(res);
> As stated above, these can be local variables...
Done.
>
>> +	devm_iounmap(&pdev->dev, offset_addr);
>> +
>> +	drv->reg = devm_ioremap(&pdev->dev, drv->stats_base, drv->stats_size);
>> +	if (!drv->reg)
>> +		return -ENOMEM;
>> +
>> +	create_debugfs_entries(drv);
>> +	platform_set_drvdata(pdev, drv);
>> +
>> +	return 0;
>> +}
>> +
>> +static int soc_sleep_stats_remove(struct platform_device *pdev)
>> +{
>> +	struct soc_sleep_stats_data *drv = platform_get_drvdata(pdev);
>> +
>> +	debugfs_remove_recursive(drv->root);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct stats_config rpm_data = {
>> +	.offset_addr = 0x14,
>> +	.num_records = 2,
>> +	.appended_stats_avail = true,
>> +};
>> +
>> +static const struct stats_config rpmh_data = {
>> +	.offset_addr = 0x4,
>> +	.num_records = 3,
>> +	.appended_stats_avail = false,
>> +};
>> +
>> +static const struct of_device_id soc_sleep_stats_table[] = {
>> +	{ .compatible = "qcom,rpm-sleep-stats", .data = &rpm_data},
>> +	{ .compatible = "qcom,rpmh-sleep-stats", .data = &rpmh_data},
> Please add an extra space between data and '}' in these two.
>
> Thanks,
> Bjorn

Done.

Thanks,
Maulik

>
>> +	{ }
>> +};
>> +
>> +static struct platform_driver soc_sleep_stats_driver = {
>> +	.probe = soc_sleep_stats_probe,
>> +	.remove = soc_sleep_stats_remove,
>> +	.driver = {
>> +		.name = "soc_sleep_stats",
>> +		.of_match_table = soc_sleep_stats_table,
>> +	},
>> +};
>> +module_platform_driver(soc_sleep_stats_driver);
>> +
>> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. (QTI) SoC Sleep Stats driver");
>> +MODULE_LICENSE("GPL v2");
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
