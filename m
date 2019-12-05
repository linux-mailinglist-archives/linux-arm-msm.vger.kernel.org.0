Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2433F114122
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2019 14:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729048AbfLENBg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Dec 2019 08:01:36 -0500
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187]:56826
        "EHLO a27-187.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729099AbfLENBg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Dec 2019 08:01:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575550894;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=Qi8Ws3dJYpg8dYth9Lt99rfE6RWNu/B+qSfD+IOQ/M8=;
        b=fsYN4aJVKclmwsUhraIGr1B7FwnaSUq9GlOLu8iBijpeu816jcuTvr7RubKpwzF8
        /PyMz3dtrHpM5CF8OfqRsErHznSqhR8HpGWgCC5VJmEn0rzkr2ns8eVOy8CBLLxJ4nW
        NNWhxH68lkphaz1VdbNThXGKF8Bly0ymEbm+hFAo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575550894;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=Qi8Ws3dJYpg8dYth9Lt99rfE6RWNu/B+qSfD+IOQ/M8=;
        b=AUJbB7wF5Y/zbYOrsyEVcvuUCG6XhJfnj2R+jzgVvyUh6bnDQpHlSTVef5Lfsamb
        gnd6X927dUGkIibQAS1t9itvvMeC9bPsGkhianlOYPaOnjapjazdVGwvgUX4mcdUaPc
        xhf7WuF/QTx8rVHd0YvHloeNWOY5fKk5afLjJVHY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8A804C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=gkohli@codeaurora.org
Subject: Re: [PATCH v0] irqchip/gic-v3: Avoid check of lpi configuration for
 non existent cpu
To:     Marc Zyngier <maz@kernel.org>
Cc:     tglx@linutronix.de, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <1575543357-31892-1-git-send-email-gkohli@codeaurora.org>
 <60f61282c1b1e512ca6ce638b6dfca09@www.loen.fr>
From:   Gaurav Kohli <gkohli@codeaurora.org>
Message-ID: <0101016ed626c22f-170ea43c-0db3-40aa-b360-21db453b391b-000000@us-west-2.amazonses.com>
Date:   Thu, 5 Dec 2019 13:01:34 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <60f61282c1b1e512ca6ce638b6dfca09@www.loen.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.12.05-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/5/2019 6:17 PM, Marc Zyngier wrote:
> Hi Gaurav,
> 
> On 2019-12-05 10:55, Gaurav Kohli wrote:
>> As per GIC specification, we can configure gic for more no of cpus
>> then the available cpus in the soc, But this can cause mem abort
>> while iterating lpi region for non existent cpu as we don't map
> 
> Which LPI region? We're talking about RDs, right... Or does LPI mean
> something other than GIC LPIs for you?
> 

Yes RDs only.
>> redistrubutor region for non-existent cpu.
>>
>> To avoid this issue, put one more check of valid mpidr.
> 
> Sorry, but I'm not sure I grasp your problem. Let me try and rephrase it:
> 
> - Your GIC is configured for (let's say) 8 CPUs, and your SoC has only 4.
Yes, suppose gic is configured for 8 cpus but soc has only 4 cpus. Then 
in this case gic_iterate will iterate till it get TYPER_LAST.

But as gic is configured for 8, So last bit sets in eight redistributor 
regions only.
> 
> - As part of the probing, the driver iterates on the RD regions and 
> explodes
>    because something isn't mapped?
> 
> That'd be a grave bug, but I believe the issue is somewhere else.

There are 4 cpus present, that's why we have mapped 4 redistributor 
only, but during probe below function keeps iterating and give mem abort 
for 5th cpu.

static void gic_update_vlpi_properties(void)
{
         gic_iterate_rdists(__gic_update_vlpi_properties);

}

We can solve this problem by mapping all eight redistributor in dt, but 
ideally code should also able to handle this and we can avoid mappin?
>
>>
>> Signed-off-by: Gaurav Kohli <gkohli@codeaurora.org>
>>
>> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
>> index 1edc993..adc9186 100644
>> --- a/drivers/irqchip/irq-gic-v3.c
>> +++ b/drivers/irqchip/irq-gic-v3.c
>> @@ -766,6 +766,7 @@ static int gic_iterate_rdists(int (*fn)(struct
>> redist_region *, void __iomem *))
>>  {
>>      int ret = -ENODEV;
>>      int i;
>> +    int cpu = 0;
>>
>>      for (i = 0; i < gic_data.nr_redist_regions; i++) {
>>          void __iomem *ptr = gic_data.redist_regions[i].redist_base;
>> @@ -780,6 +781,7 @@ static int gic_iterate_rdists(int (*fn)(struct
>> redist_region *, void __iomem *))
>>          }
>>
>>          do {
>> +            cpu++;
>>              typer = gic_read_typer(ptr + GICR_TYPER);
>>              ret = fn(gic_data.redist_regions + i, ptr);
>>              if (!ret)
>> @@ -795,7 +797,8 @@ static int gic_iterate_rdists(int (*fn)(struct
>> redist_region *, void __iomem *))
>>                  if (typer & GICR_TYPER_VLPIS)
>>                      ptr += SZ_64K * 2; /* Skip VLPI_base + reserved 
>> page */
>>              }
>> -        } while (!(typer & GICR_TYPER_LAST));
>> +        } while (!(typer & GICR_TYPER_LAST) &&
>> +                    cpu_logical_map(cpu) != INVALID_HWID);
>>      }
>>
>>      return ret ? -ENODEV : 0;
> 
> This makes little sense. A redistributor region contains a bunch of RDs,
> each of which maps onto a given CPU. We iterate on the RDs, and not on the
> CPUs, as it is the RD that tells us which CPU it is affine with, not the
> other way around.
> 
> If a RD is for some reason unavailable, then it shouldn't be described in
> the firmware the first place. If you end-up exposing RD regions that do
> not have the last RD having GICR_TYPER.Last set, then your SoC is broken,
> and this needs yet another quirk.
> 
>          M.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center,
Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
