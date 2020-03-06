Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50C6D17B6C5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 07:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgCFGgA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 01:36:00 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:26173 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725869AbgCFGf7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 01:35:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583476558; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To:
 Subject: From: Sender; bh=TX5Q1qwp1ImiOknSWRjl8dcs2jxtruVWMM+Clr4EaYg=;
 b=pJb2oCj7ZBN8JYVIIkmvau5jomC207SUsdybxc140WejzbAAg9qUF5tZzO2BQh+B9/HKo4TQ
 A/MIKgOCBizGcdb4rmjD1VOW4E9CvDwvjGcOGePzoNEyKta01dC9rR8ooXo2BBctKJ/hzDWq
 VO4l5/7i8lE+OFHAva80MPxfzaI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e61ef40.7f80aa4e6e68-smtp-out-n04;
 Fri, 06 Mar 2020 06:35:44 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0A534C4479C; Fri,  6 Mar 2020 06:35:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DB8AFC43383;
        Fri,  6 Mar 2020 06:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DB8AFC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH v2 2/4] soc: qcom: Add SoC sleep stats driver
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>
References: <1582274986-17490-1-git-send-email-mkshah@codeaurora.org>
 <1582274986-17490-3-git-send-email-mkshah@codeaurora.org>
 <158292423432.4688.6964200779843496200@swboyd.mtv.corp.google.com>
Message-ID: <e32f880e-977b-f4a8-0125-523f60fa352c@codeaurora.org>
Date:   Fri, 6 Mar 2020 12:05:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158292423432.4688.6964200779843496200@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/29/2020 2:40 AM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-02-21 00:49:44)
>> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>>
>> Lets's add a driver to read the the stats from remote processor
> Let's
Done.
>> and export to debugfs.
>>
>> The driver creates "soc_sleep_stats" directory in debugfs and adds
>> files for various low power mode available. Below is sample output
>> with command
>>
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
>>  drivers/soc/qcom/Kconfig           |  10 ++
>>  drivers/soc/qcom/Makefile          |   1 +
>>  drivers/soc/qcom/soc_sleep_stats.c | 279 +++++++++++++++++++++++++++++++++++++
>>  3 files changed, 290 insertions(+)
>>  create mode 100644 drivers/soc/qcom/soc_sleep_stats.c
>>
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index d0a73e7..4d36654 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -185,6 +185,16 @@ config QCOM_SOCINFO
>>          Say yes here to support the Qualcomm socinfo driver, providing
>>          information about the SoC to user space.
>>  
>> +config QCOM_SOC_SLEEP_STATS
>> +       tristate "Qualcomm Technologies, Inc. (QTI) SoC sleep stats driver"
>> +       depends on ARCH_QCOM
> Can you add || COMPILE_TEST?
Done.
>> +       depends on DEBUG_FS
>> +       help
>> +         Qualcomm Technologies, Inc. (QTI) SoC sleep stats driver to read
>> +         the shared memory exported by the remote processor related to
>> +         various SoC level low power modes statistics and export to debugfs
>> +         interface.
>> +
>>  config QCOM_WCNSS_CTRL
>>         tristate "Qualcomm WCNSS control driver"
>>         depends on ARCH_QCOM || COMPILE_TEST
>> diff --git a/drivers/soc/qcom/soc_sleep_stats.c b/drivers/soc/qcom/soc_sleep_stats.c
>> new file mode 100644
>> index 00000000..bf38bb5
>> --- /dev/null
>> +++ b/drivers/soc/qcom/soc_sleep_stats.c
>> @@ -0,0 +1,279 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2011-2020, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
>> +#include <linux/uaccess.h>
> Why?
will remove.
>> +#include <linux/debugfs.h>
>> +#include <linux/seq_file.h>
>> +#include <linux/stddef.h>
> Why?
stddef.h was included for offsetof() usage.
from below comments removed offsetof usage in entire driver and also this header.
>> +
>> +#include <linux/soc/qcom/smem.h>
>> +#include <clocksource/arm_arch_timer.h>
>> +
>> +#define NAME_LENGTH    5
>> +
>> +enum subsystem_item_id {
>> +       MODEM = 605,
>> +       ADSP,
>> +       CDSP,
>> +       SLPI,
>> +       GPU,
>> +       DISPLAY,
>> +};
>> +
>> +enum subsystem_pid {
>> +       PID_APSS = 0,
>> +       PID_MODEM = 1,
>> +       PID_ADSP = 2,
>> +       PID_SLPI = 3,
>> +       PID_CDSP = 5,
>> +       PID_GPU = PID_APSS,
>> +       PID_DISPLAY = PID_APSS,
> I still don't understand this enums. Why not make them a #define set
> with known values?
Done.
>> +};
>> +
>> +struct subsystem_data {
>> +       char *name;
> Can it be const char *?
Done.
>> +       enum subsystem_item_id item_id;
>> +       enum subsystem_pid pid;
>> +};
>> +
>> +static struct subsystem_data subsystems[] = {
>> +       { "modem", MODEM, PID_MODEM },
>> +       { "adsp", ADSP, PID_ADSP },
>> +       { "cdsp", CDSP, PID_CDSP },
>> +       { "slpi", SLPI, PID_SLPI },
>> +       { "gpu", GPU, PID_GPU },
>> +       { "display", DISPLAY, PID_DISPLAY },
>> +};
>> +
>> +struct stats_config {
>> +       u32 offset_addr;
> Looks ok but probably can just be unsigned int?
Done.
>> +       u32 num_records;
> Why not size_t? Is 32-bit width important?
32-bit width not important.
>> +       bool appended_stats_avail;
>> +};
>> +
>> +static const struct stats_config *config;
> This shouldn't be necessary. Can the config be passed into the debugfs
> file ops private data?

No we are already passing address in debugfs file ops private data from where to start reading stats.

will require to keep this global.

>> +
>> +struct soc_sleep_stats_data {
> This struct is only used in probe. Why not just make probe have more
> local variables?
This is allocated in probe only

struct soc_sleep_stats_data *drv;
however we pass drv->reg + offset and drv->root in debugfs_create_file, these are used during show to indicate
from where to start reading stats. also during remove,
it currently only uses drv->root member to clean up debugfs, but lets pass entire drv, if there is need to undo something else in future.
>> +       phys_addr_t stats_base;
>> +       resource_size_t stats_size;
>> +       void __iomem *reg;
>> +       struct dentry *root;
>> +};
>> +
>> +struct entry {
>> +       __le32 stat_type;
>> +       __le32 count;
>> +       __le64 last_entered_at;
>> +       __le64 last_exited_at;
>> +       __le64 accumulated;
> These should just be u32 and u64.
Done.
>> +};
>> +
>> +struct appended_entry {
>> +       __le32 client_votes;
>> +       __le32 reserved[3];
>> +};
> Same, just u32.
Done.
>> +
>> +static u64 get_time_in_sec(u64 counter)
>> +{
>> +       do_div(counter, arch_timer_get_rate());
> I don't think arch_timer_get_rate() is exported as a symbol. Why we need
> to convert this to time? Is the counter not sufficient to understand
> that so many ticks have passed since it entered and exited?

Thanks, yes it is not exported. i think we can display without converting to seconds.

if the need arises to display in seconds, we can add below locally

#define ARCH_TIMER_FREQ 19200000

and then do_div with this value as done in v1.

>> +
>> +       return counter;
>> +}
>> +
>> +static void print_sleep_stats(struct seq_file *s, struct entry *e)
>> +{
>> +       e->last_entered_at = get_time_in_sec(e->last_entered_at);
>> +       e->last_exited_at = get_time_in_sec(e->last_exited_at);
>> +       e->accumulated = get_time_in_sec(e->accumulated);
>> +
>> +       seq_printf(s, "count = %u\n", e->count);
>> +       seq_printf(s, "Last Entered At = %llu\n", e->last_entered_at);
>> +       seq_printf(s, "Last Exited At = %llu\n", e->last_exited_at);
>> +       seq_printf(s, "Accumulated Duration = %llu\n", e->accumulated);
> Why is count not capitalized but everything else is?
Done.
>> +}
>> +
>> +static int subsystem_sleep_stats_show(struct seq_file *s, void *d)
>> +{
>> +       struct subsystem_data *subsystem = s->private;
>> +       struct entry *e;
>> +
>> +       e = qcom_smem_get(subsystem->pid, subsystem->item_id, NULL);
> Do we need to look this up each time we read the stats? Why can't we get
> this once in probe or when we create the debugfs file?
Yes, we need to look up each time in shared memory for latest values.
>> +       if (IS_ERR(e))
>> +               return PTR_ERR(e);
>> +
>> +       /*
>> +        * If a subsystem is in sleep when reading the sleep stats adjust
>> +        * the accumulated sleep duration to show actual sleep time.
>> +        */
>> +       if (e->last_entered_at > e->last_exited_at)
>> +               e->accumulated += (arch_timer_read_counter()
>> +                                  - e->last_entered_at);
>> +
>> +       print_sleep_stats(s, e);
>> +
>> +       return 0;
>> +}
>> +
>> +static int soc_sleep_stats_show(struct seq_file *s, void *d)
>> +{
>> +       void __iomem *reg = s->private;
>> +       uint32_t offset;
>> +       struct entry e;
>> +
>> +       offset = offsetof(struct entry, count);
>> +       e.count = le32_to_cpu(readl_relaxed(reg + offset));
> readl APIs already do endian conversions.
Done.
>> +
>> +       offset = offsetof(struct entry, last_entered_at);
>> +       e.last_entered_at = le64_to_cpu(readq_relaxed(reg + offset));
>> +
>> +       offset = offsetof(struct entry, last_exited_at);
>> +       e.last_exited_at = le64_to_cpu(readq_relaxed(reg + offset));
>> +
>> +       offset = offsetof(struct entry, accumulated);
>> +       e.accumulated = le64_to_cpu(readq_relaxed(reg + offset));
>> +
>> +       print_sleep_stats(s, &e);
>> +
>> +       if (config->appended_stats_avail) {
>> +               struct appended_entry ae;
>> +
>> +               offset = offsetof(struct appended_entry, client_votes) +
>> +                        sizeof(struct entry);
>> +               ae.client_votes = le32_to_cpu(readl_relaxed(reg + offset));
>> +               seq_printf(s, "Client_votes = 0x%x\n", ae.client_votes);
> Use %#x to avoid having to add 0x prefix. Also, can we replace '=' with
> ':' so that readability is a bit nicer?
Done.
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +DEFINE_SHOW_ATTRIBUTE(soc_sleep_stats);
>> +DEFINE_SHOW_ATTRIBUTE(subsystem_sleep_stats);
>> +
>> +static const struct stats_config rpm_data = {
>> +       .offset_addr = 0x14,
>> +       .num_records = 2,
>> +       .appended_stats_avail = true,
>> +};
>> +
>> +static const struct stats_config rpmh_data = {
>> +       .offset_addr = 0x4,
>> +       .num_records = 3,
>> +       .appended_stats_avail = false,
>> +};
>> +
>> +static const struct of_device_id soc_sleep_stats_table[] = {
>> +       { .compatible = "qcom,rpm-sleep-stats", .data = &rpm_data},
>> +       { .compatible = "qcom,rpmh-sleep-stats", .data = &rpmh_data},
>> +       { },
> Please drop comma after sentinel. It makes a compiler error appear if
> anything comes after.
Done.
>> +};
> Move this table next to the driver structure please.
Done.
>> +
>> +static int create_debugfs_entries(struct soc_sleep_stats_data *drv)
>> +{
>> +       struct entry *e;
>> +       char stat_type[NAME_LENGTH] = {0};
> Is it a string? Otherwise, seems pretty useless to initialize this to 0
> on the stack.
yes its string.
>> +       uint32_t offset, type;
> Just use u32 instead of uint32_t in any kernel code.
Done
>> +       int i;
>> +
>> +       drv->root = debugfs_create_dir("soc_sleep_stats", NULL);
>> +       if (IS_ERR_OR_NULL(drv->root))
>> +               return PTR_ERR(drv->root);
> This is wrong. Debugfs checks have generally been removed because it's
> not a problem if debugfs fails. When it fails, drv->root will be NULL
> and any debugfs_create() function will ignore it. Since this driver
> depends on DEBUGFS being enabled, -ENODEV won't be returned as an error
> pointer.
Done.
>> +
>> +       for (i = 0; i < config->num_records; i++) {
>> +               offset = offsetof(struct entry, stat_type) +
>> +                        (i * sizeof(struct entry));
> This offset of stuff is sort of complicated. I'd prefer to treat it like
> how we treat most registers with #defines and base + #define sort of
> logic. That is easier to read. It also let's us decide to completely
> reorder struct members and not have to worry that the struct doesn't
> match how memory is laid out. 

 Reordering members should not be done.  qcom_smem_get() API returns
 pointer to "struct entry" type and will need keep order of members as it is.

> Instead we have macros that define the
> offset from some base __iomem pointer.
 
 Okay, i removed offsetof usage from entire driver and using #define
 now.
>> +
>> +               if (config->appended_stats_avail)
>> +                       offset += i * sizeof(struct appended_entry);
>> +
>> +               type = le32_to_cpu(readl_relaxed(drv->reg + offset));
>> +               memcpy(stat_type, &type, sizeof(uint32_t));
>> +               debugfs_create_file(stat_type, 0444, drv->root,
>> +                                   drv->reg + offset,
>> +                                   &soc_sleep_stats_fops);
>> +       }
>> +
>> +       for (i = 0; i < ARRAY_SIZE(subsystems); i++) {
>> +               e = qcom_smem_get(subsystems[i].pid, subsystems[i].item_id,
>> +                                 NULL);
>> +
>> +               if (IS_ERR(e))
>> +                       continue;
>> +
>> +               debugfs_create_file(subsystems[i].name, 0444, drv->root,
>> +                                   &subsystems[i],
>> +                                   &subsystem_sleep_stats_fops);
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int soc_sleep_stats_probe(struct platform_device *pdev)
>> +{
>> +       struct soc_sleep_stats_data *drv;
>> +       struct resource *res;
>> +       void __iomem *offset_addr;
>> +
>> +       drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
>> +       if (!drv)
>> +               return -ENOMEM;
>> +
>> +       config = of_device_get_match_data(&pdev->dev);
> Use device_get_match_data() to make this be less DT specific.
Done.
>> +       if (!config)
>> +               return -ENODEV;
>> +
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       if (!res)
>> +               return PTR_ERR(res);
>> +
>> +       offset_addr = ioremap_nocache(res->start + config->offset_addr,
> Why do we need ioremap_nocache()? Can ioremap() work?
Will update it to use devm_ioremap().
>> +                                     sizeof(u32));
>> +       if (IS_ERR(offset_addr))
>> +               return PTR_ERR(offset_addr);
>> +
>> +       drv->stats_base = res->start | readl_relaxed(offset_addr);
> Why | vs. +?

This is how final address need to be formed.

 Thanks,
 Maulik

>> +       drv->stats_size = resource_size(res);
>> +       iounmap(offset_addr);
>> +
>> +       drv->reg = devm_ioremap(&pdev->dev, drv->stats_base, drv->stats_size);
>> +       if (!drv->reg)
>> +               return -ENOMEM;
>> +
>> +       if (create_debugfs_entries(drv))
>> +               return -ENODEV;
>> +
>> +       platform_set_drvdata(pdev, drv);
>> +
>> +       return 0;
>> +}

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
