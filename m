Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73E2538C575
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 13:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234020AbhEULMx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 07:12:53 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:17726 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234012AbhEULMw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 07:12:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621595490; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0eE0dN8rvaU0CdilRRHCzdeNvJY+8iA9LcRdHoEcCt4=; b=iUwdkGYKSwNg4mqB7qy3pw76BAeJJlXZuam0JrQ2CY7bT9cJ2WN5jJT+aQGJd3BE3nEOcqOU
 OA9BwGY9xu7sxsJydjqqa41ONE6JwJrUa682NV6g7xwjxQAtSV/agLtJkbrHSz3omMPxb5VK
 KOVpOxNssOQIZrQ/HoqM/ic+xe8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60a7954c60c53c8c9d483256 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 21 May 2021 11:11:08
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1B71BC4323A; Fri, 21 May 2021 11:11:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.87.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 57C33C4338A;
        Fri, 21 May 2021 11:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 57C33C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v7 2/5] soc: qcom: Add SoC sleep stats driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
References: <1617704857-19620-1-git-send-email-mkshah@codeaurora.org>
 <1617704857-19620-3-git-send-email-mkshah@codeaurora.org>
 <20210412234317.GE1538589@yoga>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <cd54214e-8c60-8f92-3c0b-f7367f1bd42e@codeaurora.org>
Date:   Fri, 21 May 2021 16:40:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210412234317.GE1538589@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 4/13/2021 5:13 AM, Bjorn Andersson wrote:
> On Tue 06 Apr 05:27 CDT 2021, Maulik Shah wrote:
>
>> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>>
>> Let's add a driver to read the stats from remote processor and
>> export to debugfs.
>>
>> The driver creates "qcom_sleep_stats" directory in debugfs and
>> adds files for various low power mode available. Below is sample
>> output with command
>>
>> cat /sys/kernel/debug/qcom_sleep_stats/ddr
>> count = 0
>> Last Entered At = 0
>> Last Exited At = 0
>> Accumulated Duration = 0
>>
>> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> [mkshah: add subsystem sleep stats, create one file for each stat]
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Thanks for picking this up again Maulik, I hope we can get it merged
> soon.
Sure, i addressed the comments in v8.
>
>> ---
>>   drivers/soc/qcom/Kconfig           |  10 ++
>>   drivers/soc/qcom/Makefile          |   1 +
>>   drivers/soc/qcom/soc_sleep_stats.c | 281 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 292 insertions(+)
>>   create mode 100644 drivers/soc/qcom/soc_sleep_stats.c
>>
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index 79b568f..e80b63a 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -190,6 +190,16 @@ config QCOM_SOCINFO
>>   	 Say yes here to support the Qualcomm socinfo driver, providing
>>   	 information about the SoC to user space.
>>   
>> +config QCOM_SOC_SLEEP_STATS
>> +	tristate "Qualcomm Technologies, Inc. (QTI) SoC sleep stats driver"
>> +	depends on ARCH_QCOM && DEBUG_FS || COMPILE_TEST
>> +	depends on QCOM_SMEM
>> +	help
>> +	  Qualcomm Technologies, Inc. (QTI) SoC sleep stats driver to read
>> +	  the shared memory exported by the remote processor related to
>> +	  various SoC level low power modes statistics and export to debugfs
>> +	  interface.
>> +
>>   config QCOM_WCNSS_CTRL
>>   	tristate "Qualcomm WCNSS control driver"
>>   	depends on ARCH_QCOM || COMPILE_TEST
>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> index ad675a6..5f30d74 100644
>> --- a/drivers/soc/qcom/Makefile
>> +++ b/drivers/soc/qcom/Makefile
>> @@ -20,6 +20,7 @@ obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
>>   obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
>>   obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
>>   obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo.o
>> +obj-$(CONFIG_QCOM_SOC_SLEEP_STATS)	+= soc_sleep_stats.o
>>   obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
>>   obj-$(CONFIG_QCOM_APR) += apr.o
>>   obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
>> diff --git a/drivers/soc/qcom/soc_sleep_stats.c b/drivers/soc/qcom/soc_sleep_stats.c
>> new file mode 100644
>> index 0000000..6dfc239
>> --- /dev/null
>> +++ b/drivers/soc/qcom/soc_sleep_stats.c
>> @@ -0,0 +1,281 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2011-2021, The Linux Foundation. All rights reserved.
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
>> +#define STAT_TYPE_ADDR		0x0
>> +#define COUNT_ADDR		0x4
>> +#define LAST_ENTERED_AT_ADDR	0x8
>> +#define LAST_EXITED_AT_ADDR	0x10
>> +#define ACCUMULATED_ADDR	0x18
>> +#define CLIENT_VOTES_ADDR	0x1c
> These aren't "addresses", they are offsets, and they are actually just
> offset_of() on
Renamed them as _OFFSET instead of _ADDR.
>
>> +
>> +#define STAT_OFFSET(record_no, type) (((record_no)*(sizeof(struct sleep_stats))) + (type))
>> +#define APPENDED_STAT_OFFSET(record_no) ((record_no)*(sizeof(struct appended_stats)))
>> +
>> +#ifndef readq
>> +#define readq(a) ({			\
>> +	u64 val = readl((a) + 4);	\
>> +	val <<= 32;			\
>> +	val |=  readl((a));		\
>> +	val;				\
>> +})
> I don't like this macro, can you please write it as a static inline,
> with a comment that the operation is not expected to be atomic?
With below comment to use memcpy_fromio(), this macro will not be needed.
>
>> +#endif
>> +
>> +struct subsystem_data {
>> +	const char *name;
>> +	u32 smem_item;
>> +	u32 pid;
>> +};
>> +
>> +static const struct subsystem_data subsystems[] = {
>> +	{ "modem", 605, 1 },
>> +	{ "wpss", 605, 13 },
>> +	{ "adsp", 606, 2 },
>> +	{ "cdsp", 607, 5 },
>> +	{ "slpi", 608, 3 },
>> +	{ "gpu", 609, 0 },
>> +	{ "display", 610, 0 },
>> +	{ "adsp_island", 613, 2 },
>> +	{ "slpi_island", 613, 3 },
>> +};
>> +
>> +struct stats_config {
>> +	u32 offset_addr;
>> +	u32 num_records;
> Neither of these must be 32-bit, so please use int...or size_t instead.
Changed the type to size_t for both.
>
>> +	bool appended_stats_avail;
>> +};
>> +
>> +struct stats_prv_data {
> I don't see any "public" data, so how about just dropping "prv_"?
dropped.
>
>> +	bool appended_stats_avail;
>> +	void __iomem *reg;
> Call this "base" instead.
updated.
>
>> +};
>> +
>> +struct sleep_stats {
>> +	u32 stat_type;
>> +	u32 count;
>> +	u64 last_entered_at;
>> +	u64 last_exited_at;
>> +	u64 accumulated;
>> +};
>> +
>> +struct appended_stats {
>> +	u32 client_votes;
>> +	u32 reserved[3];
>> +};
>> +
>> +static void print_sleep_stats(struct seq_file *s, const struct sleep_stats *stat)
> I would like all these functions to have a qcom_ prefix, to help me when
> using cscope.
Updated all functions with qcom_ prefixes in v8.
>
>> +{
>> +	u64 accumulated = stat->accumulated;
>> +	/*
>> +	 * If a subsystem is in sleep when reading the sleep stats adjust
>> +	 * the accumulated sleep duration to show actual sleep time.
>> +	 */
>> +	if (stat->last_entered_at > stat->last_exited_at)
>> +		accumulated += arch_timer_read_counter()
>> +			       - stat->last_entered_at;
> Unwrap this line, please.
Done.
>
>> +
>> +	seq_printf(s, "Count = %u\n", stat->count);
> I think the format "Count: %u\n" would be more in line with other files.
Updated in v8.
>
>> +	seq_printf(s, "Last Entered At = %llu\n", stat->last_entered_at);
>> +	seq_printf(s, "Last Exited At = %llu\n", stat->last_exited_at);
>> +	seq_printf(s, "Accumulated Duration = %llu\n", accumulated);
>> +}
>> +
>> +static int subsystem_sleep_stats_show(struct seq_file *s, void *d)
>> +{
>> +	struct subsystem_data *subsystem = s->private;
>> +	struct sleep_stats *stat;
>> +
>> +	/*
>> +	 * Saving this pointer during probe may not help in cases like
>> +	 * subsystem restart, besides not every subsystem is a remote processor
>> +	 * for example gpu for which we can get start and stop notification.
>> +	 *
>> +	 * Lookup smem pointer each time to keep it simple.
> These items are allocated on the first boot of the subsystem, so
> acquiring and saving the pointer during probe wouldn't work. As such
> you can simplify this comment to just say that:
>
> 	/* Items are allocated lazily, so lookup pointer each time */
Modified the comment as per above.
>> +	 */
>> +	stat = qcom_smem_get(subsystem->pid, subsystem->smem_item, NULL);
>> +	if (IS_ERR(stat))
>> +		return PTR_ERR(stat);
>> +
>> +	print_sleep_stats(s, stat);
>> +
>> +	return 0;
>> +}
>> +
>> +static int soc_sleep_stats_show(struct seq_file *s, void *d)
>> +{
>> +	struct stats_prv_data *prv_data = s->private;
>> +	void __iomem *reg = prv_data->reg;
>> +	struct sleep_stats stat;
>> +
>> +	stat.count = readl(reg + COUNT_ADDR);
>> +	stat.last_entered_at = readq(reg + LAST_ENTERED_AT_ADDR);
>> +	stat.last_exited_at = readq(reg + LAST_EXITED_AT_ADDR);
>> +	stat.accumulated = readq(reg + ACCUMULATED_ADDR);
> Can't you just use memcpy_fromio(&stat, reg, sizeof(stat)) ?
>
> Naturally you'd need to define the endianess of the members, but that's
> even better.
Thanks updated to use memcpy_fromio().
>
>> +
>> +	print_sleep_stats(s, &stat);
>> +
>> +	if (prv_data->appended_stats_avail) {
>> +		struct appended_stats app_stat;
>> +
>> +		app_stat.client_votes = readl(reg + CLIENT_VOTES_ADDR);
> If you did something like
> 		memcpy_fromio(&app_stat, reg + CLIENT_VOTES_ADDR);
>
> then this would make sense, in this form a simple u32 on the stack would
> do.
Updated to use memcpy_fromio().
>
>
> Also I don't think "app" is a good abbreviation for "appended", why
> don't you name this "client_votes" (or just "votes")?
Renamed.
>
>> +		seq_printf(s, "Client_votes = %#x\n", app_stat.client_votes);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +DEFINE_SHOW_ATTRIBUTE(soc_sleep_stats);
>> +DEFINE_SHOW_ATTRIBUTE(subsystem_sleep_stats);
>> +
>> +static struct dentry *
>> +soc_sleep_stats_create_debugfs_entries(void __iomem *reg,
>> +				       struct stats_prv_data *prv_data,
>> +				       u32 num_records)
>> +{
>> +	struct dentry *root;
>> +	struct sleep_stats *stat;
>> +	char stat_type[sizeof(u32)] = {0};
>> +	u32 offset, type;
>> +	int i, j;
>> +
>> +	root = debugfs_create_dir("qcom_sleep_stats", NULL);
>> +
>> +	for (i = 0; i < num_records; i++) {
>> +		offset = STAT_OFFSET(i, STAT_TYPE_ADDR);
> It's not really the offset for the STAT_TYPE you're looking for, it's
> the beginning of the i'th struct sleep_stats...
>
>> +
>> +		if (prv_data[i].appended_stats_avail)
>> +			offset += APPENDED_STAT_OFFSET(i);
> And while this gets you the right result, if you consider offset to be
> "the offset of the i'th struct sleep_stats" above, then this operation
> is odd in my view...
>
> I think that you should drop the STAT_OFFSET() and
> APPENDED_STAT_OFFSET() and do something along the lines of:
>
> 	offset = 0;
> 	for (i = 0; i < num_records; i++) {
> 		prv_data[i].reg = reg + offset;
> 		...
>
> 		offset += sizeof(struct sleep_stats);
> 		if (prv_data[i].appended_stats_avail)
> 			offset += sizeof(struct appended_stats);
> 	}
Thanks, this is much clean. updated in v8.
>
>> +
>> +		prv_data[i].reg = reg + offset;
>> +
>> +		/*
>> +		 * Read the low power mode name and create debugfs file for it.
>> +		 * The names read could be of below,
>> +		 * (may change depending on low power mode supported).
>> +		 * For rpmh-sleep-stats: "aosd", "cxsd" and "ddr".
>> +		 * For rpm-sleep-stats: "vmin" and "vlow".
>> +		 */
>> +		type = readl(prv_data[i].reg);
>> +		for (j = 0; j < sizeof(u32); j++) {
>> +			stat_type[j] = type & 0xff;
>> +			type = type >> 8;
>> +		}
>> +		strim(stat_type);
> If, per your examples above, stat_type is "aosd" then all sizeof(u32)
> bytes of the string will be in use, strim() will go off the array to
> find a NUL and possibly adjust whatever lies past stat_type on the
> stack..
>
>> +		debugfs_create_file(stat_type, 0400, root,
> Further more, this would rely on that NUL somewhere down the stack.
>
> So you need a "+ 1" on the stat_type length.
Added +1 in stat_type length.
>
>> +				    &prv_data[i],
>> +				    &soc_sleep_stats_fops);
>> +	}
>> +
>> +	for (i = 0; i < ARRAY_SIZE(subsystems); i++) {
>> +		stat = qcom_smem_get(subsystems[i].pid, subsystems[i].smem_item,
>> +				     NULL);
> 80 char is just a guideline anyways, leave this unwrapped.
Updated in v8.
>
>> +		if (IS_ERR(stat))
>> +			continue;
>> +
>> +		debugfs_create_file(subsystems[i].name, 0400, root,
>> +				    (void *)&subsystems[i],
>> +				    &subsystem_sleep_stats_fops);
>> +	}
>> +
>> +	return root;
>> +}
>> +
>> +static int soc_sleep_stats_probe(struct platform_device *pdev)
>> +{
>> +	struct resource *res;
>> +	void __iomem *reg;
>> +	void __iomem *offset_addr;
>> +	phys_addr_t stats_base;
>> +	resource_size_t stats_size;
>> +	struct dentry *root;
>> +	const struct stats_config *config;
>> +	struct stats_prv_data *prv_data;
>> +	int i;
>> +
>> +	config = device_get_match_data(&pdev->dev);
>> +	if (!config)
>> +		return -ENODEV;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!res)
>> +		return PTR_ERR(res);
>> +
>> +	offset_addr = ioremap(res->start + config->offset_addr, sizeof(u32));
>> +	if (IS_ERR(offset_addr))
>> +		return PTR_ERR(offset_addr);
>> +
>> +	stats_base = res->start | readl_relaxed(offset_addr);
>> +	stats_size = resource_size(res);
>> +	iounmap(offset_addr);
>> +
>> +	reg = devm_ioremap(&pdev->dev, stats_base, stats_size);
>> +	if (!reg)
>> +		return -ENOMEM;
>> +
>> +	prv_data = devm_kcalloc(&pdev->dev, config->num_records,
>> +				sizeof(*prv_data), GFP_KERNEL);
>> +	if (!prv_data)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < config->num_records; i++)
>> +		prv_data[i].appended_stats_avail = config->appended_stats_avail;
>> +
>> +	root = soc_sleep_stats_create_debugfs_entries(reg, prv_data,
>> +						      config->num_records);
> debugfs_create_dir() here in probe instead and split the two halfs of
> soc_sleep_stats_create_debugfs_entries() into their own function.
splitted in two separate functions.
> And please make up a shorter name for this.
updated to shorter name.
>
>> +	platform_set_drvdata(pdev, root);
>> +
>> +	return 0;
>> +}
>> +
>> +static int soc_sleep_stats_remove(struct platform_device *pdev)
>> +{
>> +	struct dentry *root = platform_get_drvdata(pdev);
>> +
>> +	debugfs_remove_recursive(root);
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
>> +	{ .compatible = "qcom,rpm-sleep-stats", .data = &rpm_data },
>> +	{ .compatible = "qcom,rpmh-sleep-stats", .data = &rpmh_data },
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
>> +MODULE_SOFTDEP("pre: smem");
> I believe this should be "qcom_smem",
the module has smem.ko file so "smem" looks proper.
>   but given that you call
> qcom_smem_get() in your code you have a hard dependency in place
> already. So, can you help me understand what use this softdep provide?

If both smem and soc_sleep_stats are compiled as DLKMs, this is to make 
sure smem module was loaded first by keeping pre soft dependency.

Thanks,
Maulik

>
> Regards,
> Bjorn

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

