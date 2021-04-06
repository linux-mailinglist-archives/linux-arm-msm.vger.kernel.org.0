Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9FC3354D06
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 08:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbhDFGlZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 02:41:25 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:10714 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232385AbhDFGlZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 02:41:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617691277; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=F0R4IB6Sf+VbR+QO561MdaG7Ps8yOTbTYNZFjG57xlY=; b=fknRkJrA1dD+vTsWEQu23jWlqttSA/B5MbQD5oMF/C6DwSs7yM4mRXcl47UtV5Ezxy+plcVW
 VuWSBF0WxJUZcO65pMMze3sdjxxXEXAvvrL8x+x4spIMeLu81OR74IKwKmRxG2rNAaCjSjkM
 T2PDin0fce2LeeE6yuRkGwJIOaA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 606c027dc06dd10a2ddd54e7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Apr 2021 06:41:01
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E5394C43462; Tue,  6 Apr 2021 06:41:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.71.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DF7C4C433C6;
        Tue,  6 Apr 2021 06:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DF7C4C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v6 2/4] soc: qcom: Add SoC sleep stats driver
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>
References: <1612448508-9179-1-git-send-email-mkshah@codeaurora.org>
 <1612448508-9179-3-git-send-email-mkshah@codeaurora.org>
 <161283134463.76967.4872263092725341078@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <ecf8a8f6-b1ea-5973-1f9c-08be3992fc2e@codeaurora.org>
Date:   Tue, 6 Apr 2021 12:10:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <161283134463.76967.4872263092725341078@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 2/9/2021 6:12 AM, Stephen Boyd wrote:
> Quoting Maulik Shah (2021-02-04 06:21:46)
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
> The ddr subsystem isn't listed below in subsystems though. Can the
> example be updated to reflect what is supported? Or can we gain the ddr
> subsystem?

I have added comment in the driver on how we get the "ddr" subsystem in v7.

>
>> count = 0
>> Last Entered At = 0
>> Last Exited At = 0
>> Accumulated Duration = 0
>>
>> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> [mkshah: add subsystem sleep stats, create one file for each stat]
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>   drivers/soc/qcom/Kconfig           |  10 ++
>>   drivers/soc/qcom/Makefile          |   1 +
>>   drivers/soc/qcom/soc_sleep_stats.c | 258 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 269 insertions(+)
>>   create mode 100644 drivers/soc/qcom/soc_sleep_stats.c
>>
>> diff --git a/drivers/soc/qcom/soc_sleep_stats.c b/drivers/soc/qcom/soc_sleep_stats.c
>> new file mode 100644
>> index 0000000..66df638
>> --- /dev/null
>> +++ b/drivers/soc/qcom/soc_sleep_stats.c
>> @@ -0,0 +1,258 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2011-2021, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/debugfs.h>
> Any chance to get off of debugfs and expose this in sysfs instead?

The V1 series was using sysfs (/sys/power/) path to display the stats 
which was later moved to debugfs.

any reason to expose in sysfs again? the informantion in stats driver is 
largely for debug purpose only.

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
>> +#define STAT_TYPE_ADDR         0x0
>> +#define COUNT_ADDR             0x4
>> +#define LAST_ENTERED_AT_ADDR   0x8
>> +#define LAST_EXITED_AT_ADDR    0x10
>> +#define ACCUMULATED_ADDR       0x18
>> +#define CLIENT_VOTES_ADDR      0x1c
>> +
>> +#define STAT_OFFSET(record_no, type) (((record_no)*(sizeof(struct sleep_stats))) + (type))
>> +#define APPENDED_STAT_OFFSET(record_no) ((record_no)*(sizeof(struct appended_stats)))
>> +
>> +struct subsystem_data {
>> +       const char *name;
>> +       u32 smem_item;
>> +       u32 pid;
>> +};
>> +
>> +static const struct subsystem_data subsystems[] = {
>> +       { "modem", 605, 1 },
>> +       { "adsp", 606, 2 },
>> +       { "cdsp", 607, 5 },
>> +       { "slpi", 608, 3 },
>> +       { "gpu", 609, 0 },
>> +       { "display", 610, 0 },
>> +       { "adsp_island", 613, 2 },
>> +       { "slpi_island", 613, 3 },
>> +};
>> +
>> +struct stats_config {
>> +       u32 offset_addr;
>> +       u32 num_records;
> size_t?
u32 will be smaller/num_records will not exceed more than 3 as of now.
>
>> +       bool appended_stats_avail;
>> +};
>> +
>> +struct stats_prv_data {
>> +       bool appended_stats_avail;
>> +       void __iomem *reg;
>> +};
>> +
>> +struct sleep_stats {
>> +       u32 stat_type;
>> +       u32 count;
>> +       u64 last_entered_at;
>> +       u64 last_exited_at;
>> +       u64 accumulated;
>> +};
>> +
>> +struct appended_stats {
>> +       u32 client_votes;
>> +       u32 reserved[3];
>> +};
>> +
>> +static void print_sleep_stats(struct seq_file *s, const struct sleep_stats *stat)
>> +{
>> +       u64 accumulated = stat->accumulated;
>> +       /*
>> +        * If a subsystem is in sleep when reading the sleep stats adjust
>> +        * the accumulated sleep duration to show actual sleep time.
>> +        */
>> +       if (stat->last_entered_at > stat->last_exited_at)
>> +               accumulated += arch_timer_read_counter()
>> +                              - stat->last_entered_at;
>> +
>> +       seq_printf(s, "Count = %u\n", stat->count);
>> +       seq_printf(s, "Last Entered At = %llu\n", stat->last_entered_at);
>> +       seq_printf(s, "Last Exited At = %llu\n", stat->last_exited_at);
>> +       seq_printf(s, "Accumulated Duration = %llu\n", accumulated);
>> +}
>> +
>> +static int subsystem_sleep_stats_show(struct seq_file *s, void *d)
>> +{
>> +       struct subsystem_data *subsystem = s->private;
>> +       struct sleep_stats *stat;
>> +
>> +       /*
>> +        * Saving this pointer during probe may not help in cases like
>> +        * subsystem restart, beside not each subsystem is a remote processor
> s/beside/besides/
> s/each/every/
Fixed in v7.
>
>> +        * for e.g display for which we can get start and stop notification
> for example
> s/notification/notification./
Fixed in v7.
>
>> +        *
>> +        * Lookup smem pointer each time to keep it simple.
>> +        */
>> +       stat = qcom_smem_get(subsystem->pid, subsystem->smem_item, NULL);
>> +       if (IS_ERR(stat))
>> +               return PTR_ERR(stat);
>> +
>> +       print_sleep_stats(s, stat);
>> +
>> +       return 0;
>> +}
>> +
>> +static int soc_sleep_stats_show(struct seq_file *s, void *d)
>> +{
>> +       struct stats_prv_data *prv_data = s->private;
>> +       void __iomem *reg = prv_data->reg;
>> +       struct sleep_stats stat;
>> +
>> +       stat.count = readl(reg + COUNT_ADDR);
>> +       stat.last_entered_at = readq(reg + LAST_ENTERED_AT_ADDR);
>> +       stat.last_exited_at = readq(reg + LAST_EXITED_AT_ADDR);
>> +       stat.accumulated = readq(reg + ACCUMULATED_ADDR);
>> +
>> +       print_sleep_stats(s, &stat);
>> +
>> +       if (prv_data->appended_stats_avail) {
>> +               struct appended_stats app_stat;
>> +
>> +               app_stat.client_votes = readl(reg + CLIENT_VOTES_ADDR);
>> +               seq_printf(s, "Client_votes = %#x\n", app_stat.client_votes);
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +DEFINE_SHOW_ATTRIBUTE(soc_sleep_stats);
>> +DEFINE_SHOW_ATTRIBUTE(subsystem_sleep_stats);
>> +
>> +static struct dentry *create_debugfs_entries(void __iomem *reg,
> Can this be soc_sleep_stats_*()? Or inlined at the call site?
> create_debugfs_entries() is too generic.
Renamed with soc_sleep_stats_*() in v7.
>
>> +                                            struct stats_prv_data *prv_data,
>> +                                            u32 num_records)
>> +{
>> +       struct dentry *root;
>> +       struct sleep_stats *stat;
>> +       char stat_type[sizeof(u32)] = {0};
>> +       u32 offset, type;
>> +       int i;
>> +
>> +       root = debugfs_create_dir("qcom_sleep_stats", NULL);
>> +
>> +       for (i = 0; i < num_records; i++) {
>> +               offset = STAT_OFFSET(i, STAT_TYPE_ADDR);
>> +
>> +               if (prv_data[i].appended_stats_avail)
>> +                       offset += APPENDED_STAT_OFFSET(i);
>> +
>> +               prv_data[i].reg = reg + offset;
>> +
>> +               type = readl(prv_data[i].reg);
>> +               memcpy_fromio(stat_type, &type, sizeof(u32));
> type isn't an __iomem pointer though. Did you compile this with sparse?
> Use 'make C=2'
>
> Also, this is really bad design. The mmio register contains a physical
> address of where to read from? It's not an offset from the register or
> something like that? If an IOMMU is rewriting physical addresses this
> driver is screwed and will try to map some other physical address that
> could be completely different based on what the IOMMU decides that
> IPA maps to physically.

dropped use of memcpy_fromio() in v7, instead using local loop to figure 
out the low power mode name.

>
>> +               strim(stat_type);
>> +               debugfs_create_file(stat_type, 0400, root,
>> +                                   &prv_data[i],
>> +                                   &soc_sleep_stats_fops);
>> +       }
>> +
>> +       for (i = 0; i < ARRAY_SIZE(subsystems); i++) {
>> +               stat = qcom_smem_get(subsystems[i].pid, subsystems[i].smem_item,
>> +                                    NULL);
>> +               if (IS_ERR(stat))
>> +                       continue;
>> +
>> +               debugfs_create_file(subsystems[i].name, 0400, root,
>> +                                   (void *)&subsystems[i],
> cast to void shouldn't be needed. Please drop it.

This seems required, without cast, gcc gives below error

./include/linux/debugfs.h:69:16: note: expected ‘void *’ but argument is 
of type ‘const struct subsystem_data *’

>
>> +                                   &subsystem_sleep_stats_fops);
>> +       }
>> +
>> +       return root;
>> +}
>> +
>> +static int soc_sleep_stats_probe(struct platform_device *pdev)
>> +{
>> +       struct resource *res;
>> +       void __iomem *reg;
>> +       void __iomem *offset_addr;
>> +       phys_addr_t stats_base;
>> +       resource_size_t stats_size;
>> +       struct dentry *root;
>> +       const struct stats_config *config;
>> +       struct stats_prv_data *prv_data;
>> +       int i;
>> +
>> +       config = device_get_match_data(&pdev->dev);
>> +       if (!config)
>> +               return -ENODEV;
>> +
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       if (!res)
>> +               return PTR_ERR(res);
>> +
>> +       offset_addr = ioremap(res->start + config->offset_addr, sizeof(u32));
>> +       if (IS_ERR(offset_addr))
>> +               return PTR_ERR(offset_addr);
>> +
>> +       stats_base = res->start | readl_relaxed(offset_addr);
>> +       stats_size = resource_size(res);
>> +       iounmap(offset_addr);
>> +
>> +       reg = devm_ioremap(&pdev->dev, stats_base, stats_size);
>> +       if (!reg)
>> +               return -ENOMEM;
>> +
>> +       prv_data = devm_kcalloc(&pdev->dev, config->num_records,
>> +                               sizeof(struct stats_prv_data), GFP_KERNEL);
> sizeof(*prv_data) please so we don't have to think about the type
> matching the pointer storage.

Updated in v7.

Thanks,
Maulik
>
>> +       if (!prv_data)
>> +               return -ENOMEM;
>> +
>> +       for (i = 0; i < config->num_records; i++)
>> +               prv_data[i].appended_stats_avail = config->appended_stats_avail;
>> +
>> +       root = create_debugfs_entries(reg, prv_data, config->num_records);
>> +       platform_set_drvdata(pdev, root);
>> +
>> +       return 0;
>> +}
>> +
>> +static int soc_sleep_stats_remove(struct platform_device *pdev)
>> +{
>> +       struct dentry *root = platform_get_drvdata(pdev);
>> +
>> +       debugfs_remove_recursive(root);
>> +
>> +       return 0;
>> +}
>> +

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

