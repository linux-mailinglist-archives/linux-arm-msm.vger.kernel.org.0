Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46FAB424123
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 17:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbhJFPVC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 11:21:02 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:41165 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbhJFPU6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 11:20:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633533545; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=oHtTVevHi44RkGFCNyrdLDSZl/mrttTrhh1/LvmxaKg=; b=irLKD9WPmO7AJ8KfN77yKNKv94LCV9p6Xr6n7Sl0lWbNcK8Ln1IN1lC/KnIZYXVHZN0F43zj
 oW6UrsTIzpkbhp9nqBaoMxHva/3MD5pEtomAOGc79mDo/KeC6dIjvtMkBlw75feXp4o2e1az
 J0+Acd0KHx3+5To3dM6GN3LUf5s=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 615dbe5a30ce13d2b43253d5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 06 Oct 2021 15:18:50
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9731BC4360C; Wed,  6 Oct 2021 15:18:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.85.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B1396C4338F;
        Wed,  6 Oct 2021 15:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org B1396C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v10 2/5] soc: qcom: Add SoC sleep stats driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
References: <1633425065-7927-1-git-send-email-mkshah@codeaurora.org>
 <1633425065-7927-3-git-send-email-mkshah@codeaurora.org>
 <YVx4bFN05OPLll6u@ripper>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <d63173d7-4885-4e9d-6b44-77a88d7a71b7@codeaurora.org>
Date:   Wed, 6 Oct 2021 20:48:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YVx4bFN05OPLll6u@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 10/5/2021 9:38 PM, Bjorn Andersson wrote:
> On Tue 05 Oct 02:11 PDT 2021, Maulik Shah wrote:
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
> 
> What's the minimal effort needed to get any of these values to become
> non-zero, on any of the upstream boards?

on SC7180/SC7280 ADSP stats should show up non-zero values after boot 
up. The SoC level stats will become non-zero when device is enters into
deepeest low power mode (cxsd) which also can be checked on sc7280.

For the stats read from AOP sram, The low power mode name like 'ddr', 
'cxsd' or 'aosd' is also read from stats area so in a way its correctly
map to respective addresses.

> 
>> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> [mkshah: add subsystem sleep stats, create one file for each stat]
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>   drivers/soc/qcom/Kconfig            |  10 ++
>>   drivers/soc/qcom/Makefile           |   1 +
>>   drivers/soc/qcom/qcom_sleep_stats.c | 240 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 251 insertions(+)
>>   create mode 100644 drivers/soc/qcom/qcom_sleep_stats.c
>>
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index abfef20..ad45f59 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -182,6 +182,16 @@ config QCOM_SMSM
>>   	  Say yes here to support the Qualcomm Shared Memory State Machine.
>>   	  The state machine is represented by bits in shared memory.
>>   
>> +config QCOM_SLEEP_STATS
>> +	tristate "Qualcomm Technologies, Inc. (QTI) Sleep stats driver"
>> +	depends on ARCH_QCOM && DEBUG_FS || COMPILE_TEST
> 
> Is this equivalent to (QCOM && DBGFS) || COMPILE_TEST or
> QCOM && (DBGFS || COMPILE_TEST) ?
> 
> The prior seems like what we want.
> 
> 
> I think the rest looks good now.
> 
> Thanks,
> Bjorn

Updated in v11 to mention (QCOM && DBGFS) || COMPILE_TEST.

Thanks,
Maulik

> 
>> +	depends on QCOM_SMEM
>> +	help
>> +	  Qualcomm Technologies, Inc. (QTI) Sleep stats driver to read
>> +	  the shared memory exported by the remote processor related to
>> +	  various SoC level low power modes statistics and export to debugfs
>> +	  interface.
>> +
>>   config QCOM_SOCINFO
>>   	tristate "Qualcomm socinfo driver"
>>   	depends on QCOM_SMEM
>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> index 24514c7..ad84f7b 100644
>> --- a/drivers/soc/qcom/Makefile
>> +++ b/drivers/soc/qcom/Makefile
>> @@ -19,6 +19,7 @@ obj-$(CONFIG_QCOM_SMEM) +=	smem.o
>>   obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
>>   obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
>>   obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
>> +obj-$(CONFIG_QCOM_SLEEP_STATS)	+= qcom_sleep_stats.o
>>   obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo.o
>>   obj-$(CONFIG_QCOM_SPM)		+= spm.o
>>   obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
>> diff --git a/drivers/soc/qcom/qcom_sleep_stats.c b/drivers/soc/qcom/qcom_sleep_stats.c
>> new file mode 100644
>> index 0000000..c85e19b
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qcom_sleep_stats.c
>> @@ -0,0 +1,240 @@
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
>> +#define STAT_TYPE_OFFSET	0x0
>> +#define COUNT_OFFSET		0x4
>> +#define LAST_ENTERED_AT_OFFSET	0x8
>> +#define LAST_EXITED_AT_OFFSET	0x10
>> +#define ACCUMULATED_OFFSET	0x18
>> +#define CLIENT_VOTES_OFFSET	0x1c
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
>> +	size_t stats_offset;
>> +	size_t num_records;
>> +	bool appended_stats_avail;
>> +};
>> +
>> +struct stats_data {
>> +	bool appended_stats_avail;
>> +	void __iomem *base;
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
>> +static void qcom_print_stats(struct seq_file *s, const struct sleep_stats *stat)
>> +{
>> +	u64 accumulated = stat->accumulated;
>> +	/*
>> +	 * If a subsystem is in sleep when reading the sleep stats adjust
>> +	 * the accumulated sleep duration to show actual sleep time.
>> +	 */
>> +	if (stat->last_entered_at > stat->last_exited_at)
>> +		accumulated += arch_timer_read_counter() - stat->last_entered_at;
>> +
>> +	seq_printf(s, "Count: %u\n", stat->count);
>> +	seq_printf(s, "Last Entered At: %llu\n", stat->last_entered_at);
>> +	seq_printf(s, "Last Exited At: %llu\n", stat->last_exited_at);
>> +	seq_printf(s, "Accumulated Duration: %llu\n", accumulated);
>> +}
>> +
>> +static int qcom_subsystem_sleep_stats_show(struct seq_file *s, void *unused)
>> +{
>> +	struct subsystem_data *subsystem = s->private;
>> +	struct sleep_stats *stat;
>> +
>> +	/* Items are allocated lazily, so lookup pointer each time */
>> +	stat = qcom_smem_get(subsystem->pid, subsystem->smem_item, NULL);
>> +	if (IS_ERR(stat))
>> +		return -EIO;
>> +
>> +	qcom_print_stats(s, stat);
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_soc_sleep_stats_show(struct seq_file *s, void *unused)
>> +{
>> +	struct stats_data *d = s->private;
>> +	void __iomem *reg = d->base;
>> +	struct sleep_stats stat;
>> +
>> +	memcpy_fromio(&stat, reg, sizeof(stat));
>> +	qcom_print_stats(s, &stat);
>> +
>> +	if (d->appended_stats_avail) {
>> +		struct appended_stats votes;
>> +
>> +		memcpy_fromio(&votes, reg + CLIENT_VOTES_OFFSET, sizeof(votes));
>> +		seq_printf(s, "Client Votes: %#x\n", votes.client_votes);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +DEFINE_SHOW_ATTRIBUTE(qcom_soc_sleep_stats);
>> +DEFINE_SHOW_ATTRIBUTE(qcom_subsystem_sleep_stats);
>> +
>> +static void qcom_create_soc_sleep_stat_files(struct dentry *root, void __iomem *reg,
>> +					     struct stats_data *d,
>> +					     const struct stats_config *config)
>> +{
>> +	char stat_type[sizeof(u32) + 1] = {0};
>> +	u32 offset = 0, type;
>> +	int i, j;
>> +
>> +	for (i = 0; i < config->num_records; i++) {
>> +		d[i].base = reg + offset + config->stats_offset;
>> +
>> +		/*
>> +		 * Read the low power mode name and create debugfs file for it.
>> +		 * The names read could be of below,
>> +		 * (may change depending on low power mode supported).
>> +		 * For rpmh-sleep-stats: "aosd", "cxsd" and "ddr".
>> +		 * For rpm-sleep-stats: "vmin" and "vlow".
>> +		 */
>> +		type = readl(d[i].base);
>> +		for (j = 0; j < sizeof(u32); j++) {
>> +			stat_type[j] = type & 0xff;
>> +			type = type >> 8;
>> +		}
>> +		strim(stat_type);
>> +		debugfs_create_file(stat_type, 0400, root, &d[i],
>> +				    &qcom_soc_sleep_stats_fops);
>> +
>> +		offset += sizeof(struct sleep_stats);
>> +		if (d[i].appended_stats_avail)
>> +			offset += sizeof(struct appended_stats);
>> +	}
>> +}
>> +
>> +static void qcom_create_subsystem_stat_files(struct dentry *root)
>> +{
>> +	const struct sleep_stats *stat;
>> +	int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(subsystems); i++) {
>> +		stat = qcom_smem_get(subsystems[i].pid, subsystems[i].smem_item, NULL);
>> +		if (IS_ERR(stat))
>> +			continue;
>> +
>> +		debugfs_create_file(subsystems[i].name, 0400, root, (void *)&subsystems[i],
>> +				    &qcom_subsystem_sleep_stats_fops);
>> +	}
>> +}
>> +
>> +static int qcom_sleep_stats_probe(struct platform_device *pdev)
>> +{
>> +	void __iomem *reg;
>> +	struct dentry *root;
>> +	const struct stats_config *config;
>> +	struct stats_data *d;
>> +	int i;
>> +
>> +	config = device_get_match_data(&pdev->dev);
>> +	if (!config)
>> +		return -ENODEV;
>> +
>> +	reg = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
>> +	if (IS_ERR(reg))
>> +		return -ENOMEM;
>> +
>> +	d = devm_kcalloc(&pdev->dev, config->num_records,
>> +			 sizeof(*d), GFP_KERNEL);
>> +	if (!d)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < config->num_records; i++)
>> +		d[i].appended_stats_avail = config->appended_stats_avail;
>> +
>> +	root = debugfs_create_dir("qcom_sleep_stats", NULL);
>> +
>> +	qcom_create_subsystem_stat_files(root);
>> +	qcom_create_soc_sleep_stat_files(root, reg, d, config);
>> +
>> +	platform_set_drvdata(pdev, root);
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_sleep_stats_remove(struct platform_device *pdev)
>> +{
>> +	struct dentry *root = platform_get_drvdata(pdev);
>> +
>> +	debugfs_remove_recursive(root);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct stats_config rpm_data = {
>> +	.stats_offset = 0x2e8,
>> +	.num_records = 2,
>> +	.appended_stats_avail = true,
>> +};
>> +
>> +static const struct stats_config rpmh_data = {
>> +	.stats_offset = 0x48,
>> +	.num_records = 3,
>> +	.appended_stats_avail = false,
>> +};
>> +
>> +static const struct of_device_id qcom_sleep_stats_table[] = {
>> +	{ .compatible = "qcom,rpm-sleep-stats", .data = &rpm_data },
>> +	{ .compatible = "qcom,rpmh-sleep-stats", .data = &rpmh_data },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, qcom_sleep_stats_table);
>> +
>> +static struct platform_driver qcom_sleep_stats = {
>> +	.probe = qcom_sleep_stats_probe,
>> +	.remove = qcom_sleep_stats_remove,
>> +	.driver = {
>> +		.name = "qcom_sleep_stats",
>> +		.of_match_table = qcom_sleep_stats_table,
>> +	},
>> +};
>> +module_platform_driver(qcom_sleep_stats);
>> +
>> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. (QTI) Sleep Stats driver");
>> +MODULE_LICENSE("GPL v2");
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of Code Aurora Forum, hosted by The Linux Foundation
