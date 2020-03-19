Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1B718BABE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 16:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgCSPOW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 11:14:22 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:28769 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727102AbgCSPOV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 11:14:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584630860; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=RD+/O5KlM+R4dR4iSsoQGkJictni/jXTud2P5fG4jbI=; b=kMGXIId36Op1MEDx5PdUfg85e+ilXUOjIdvRQeieV0sBHEJTS31bqjDdHQRyQQTjBMThJiDh
 z+1rkh4y2MgK1dYmeK6j4lu5Nd5Hej7F+JGWV1i+R4QkIvOdpG6ZAyAxaa4akDARMAB3k5Dg
 Qg4ESsD99nTir2qeXVIoIXQTuhw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e738c44.7f6e5421b180-smtp-out-n01;
 Thu, 19 Mar 2020 15:14:12 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 37E54C433BA; Thu, 19 Mar 2020 15:14:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.2] (unknown [183.83.137.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 897CCC433D2;
        Thu, 19 Mar 2020 15:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 897CCC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v5 2/4] soc: qcom: Add SoC sleep stats driver
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>
References: <1584505758-21037-1-git-send-email-mkshah@codeaurora.org>
 <1584505758-21037-3-git-send-email-mkshah@codeaurora.org>
 <158457754092.152100.9555786468515303757@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <6a3aebf8-72dd-a1d6-bf0c-aad6204cb6c7@codeaurora.org>
Date:   Thu, 19 Mar 2020 20:44:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <158457754092.152100.9555786468515303757@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/19/2020 5:55 AM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-03-17 21:29:16)
>> diff --git a/drivers/soc/qcom/soc_sleep_stats.c b/drivers/soc/qcom/soc_sleep_stats.c
>> new file mode 100644
>> index 0000000..0db7c3d
>> --- /dev/null
>> +++ b/drivers/soc/qcom/soc_sleep_stats.c
>> @@ -0,0 +1,244 @@
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
>> +#define STAT_TYPE_ADDR         0x0
>> +#define COUNT_ADDR             0x4
>> +#define LAST_ENTERED_AT_ADDR   0x8
>> +#define LAST_EXITED_AT_ADDR    0x10
>> +#define ACCUMULATED_ADDR       0x18
>> +#define CLIENT_VOTES_ADDR      0x1c
>> +
>> +struct subsystem_data {
>> +       const char *name;
>> +       u32 smem_item;
>> +       u32 pid;
>> +};
>> +
>> +static struct subsystem_data subsystems[] = {
> This can be const.
we are passing each element of this in debugfs_create_file as (void * data)
making this const is saying error passing const as void *.
>> +       { "modem", 605, 1 },
>> +       { "adsp", 606, 2 },
>> +       { "cdsp", 607, 5 },
>> +       { "slpi", 608, 3 },
>> +       { "gpu", 609, 0 },
>> +       { "display", 610, 0 },
>> +};
>> +
>> +struct stats_config {
>> +       unsigned int offset_addr;
>> +       unsigned int num_records;
>> +       bool appended_stats_avail;
>> +};
>> +
>> +struct stats_prv_data {
>> +       const struct stats_config *config;
> Can we have 'bool has_appended_stats' here instead?
any reason to move? this is per compatible config where rpm based target have appended stats available.
>
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
>> +static void print_sleep_stats(struct seq_file *s, struct sleep_stats *stat)
> Make stat const please.
Sure,  i will address this.
>
>> +{
>> +       u64 accumulated = stat->accumulated;
>> +       /*
>> +        * If a subsystem is in sleep when reading the sleep stats adjust
>> +        * the accumulated sleep duration to show actual sleep time.
>> +        */
>> +       if (stat->last_entered_at > stat->last_exited_at)
>> +               accumulated += arch_timer_read_counter()
> This assumes that arch_timer_read_counter() is returning the physical
> counter? Is accumulated duration useful for anything? I don't like that
> we're relying on the arch timer code to return a certain counter value
> that may or may not be the same as what is written into smem.

we are not comparing it with what is written into smem. The idea here is to adjust the accumulated sleep length to reflect close/real value.

When a subsystem goes to sleep, it updates entry time and then stays in sleep.
Exit time and accumulated duration is updated when subsystem comes out of low power mode.

Now if Subsystem updated entry time and went in sleep, while printing accumulated duration
will keep giving older value.

If read it at interval of say every 10 seconds, if subsystem never comes out during this.
Even after 10 seconds, it gives older accumulated duration, while we want to get
printed as close to real value. so its updated here.

Now when it comes out of sleep, it always prints value given from subsystem.

>
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
>> +       stat = qcom_smem_get(subsystem->pid, subsystem->smem_item, NULL);
> We already get this during probe in create_debugfs_entries() (which is
> too generic of a name by the way). 
I will update the name.
> Why can't we stash that pointer away
> so that it comes through the 'd' parameter to this function?
i think you are missing a subsystem restart case, in that pointer may be updated to new value.
so we can not just save it and re-use it every time, we don't know when subsystem restart happens and we now need new pointer.
>
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
> Ok I see. The same stat info is in SMEM and also in some IO memory
> location? So we have to read one from an iomem region and one from smem?
Yes.
> Please make subsystem_sleep_stats_show() take a 'struct
> smem_sleep_stats' through 'd' that has the __le32 and __le64 markings
> and then do the byte swaps into a stack local struct sleep_stats that
> print_sleep_stats() can use.

Let me check this, i don't see every user of qcom_smem_get() doing byte swaps.

passing this through 'd' may not be required even if we want to do endian conversion.

'd' is alreaedy occupied to pass the subsystem_data structure item.

>
>> +
>> +       if (prv_data->config->appended_stats_avail) {
>> +               struct appended_stats app_stat;
> Just use a u32 for this. The struct is not useful here.
Okay. i will address this.
>
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
>> +                                            struct stats_prv_data *prv_data)
> I'd prefer this was just inlined into probe.
I would like to keep it same way.
>
>> +{
>> +       struct dentry *root;
>> +       struct sleep_stats *stat;
>> +       char stat_type[sizeof(u32) + 1] = {0};
>> +       u32 offset, type;
>> +       int i;
>> +
>> +       root = debugfs_create_dir("qcom_sleep_stats", NULL);
>> +
>> +       for (i = 0; i < prv_data[0].config->num_records; i++) {
> Pass config as another argument instead of attaching it to prv_data
> please.
Okay i will address this.
>
>> +               offset = STAT_TYPE_ADDR + (i * sizeof(struct sleep_stats));
>> +
>> +               if (prv_data[0].config->appended_stats_avail)
>> +                       offset += i * sizeof(struct appended_stats);
> I was imagining a macro like, SLEEP_STATn(i, has_appended) that did all the
> math to figure out the offset.
Okay i will update driver to use macro.
>
>> +
>> +               prv_data[i].reg = reg + offset;
>> +
>> +               type = readl(prv_data[i].reg);
>> +               memcpy(stat_type, &type, sizeof(u32));
> Is it a 4-byte ascii register that may or may not be NUL terminated? We
> should use __raw_readl() then so we don't do an endian swap. Using
> memcpy_fromio() does this all for you.

memcpy_fromio() seems not copying properly with u32 or u32+1 size.  seems it need align to 8 byte.

so when i pass u64 size it seems working fine. i will change this to use memcpy_fromio with sizeof(u64).

>
>> +               debugfs_create_file(stat_type, 0444, root,
> Maybe just 0400? Not sure why everyone in the world needs to read this.
Okay i will address this.
>
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
>> +               debugfs_create_file(subsystems[i].name, 0444, root,
>> +                                   &subsystems[i],
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
> I still don't get it, but whatever. I highly doubt the lower bits are
> anything besides 0 so a logical OR vs addition is not different.
its different and need to do logical OR.
>
>> +       stats_size = resource_size(res);
>> +       iounmap(offset_addr);
>> +
>> +       reg = devm_ioremap(&pdev->dev, stats_base, stats_size);
>> +       if (!reg)
>> +               return -ENOMEM;
>> +
>> +       prv_data = devm_kzalloc(&pdev->dev, config->num_records *
>> +                               sizeof(struct stats_prv_data), GFP_KERNEL);
> We have devm_kcalloc() for array allocations.
Okay i will address this.
>
>> +       if (!prv_data)
>> +               return -ENOMEM;
>> +
>> +       for (i = 0; i < config->num_records; i++)
>> +               prv_data[i].config = config;
>> +
>> +       root = create_debugfs_entries(reg, prv_data);
>> +       platform_set_drvdata(pdev, root);
>> +
>> +       return 0;
>> +}

Thanks,

Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
