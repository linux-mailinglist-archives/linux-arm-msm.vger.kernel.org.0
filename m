Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD362114DB9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2019 09:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbfLFIpE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Dec 2019 03:45:04 -0500
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186]:38748
        "EHLO a27-186.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726088AbfLFIpE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Dec 2019 03:45:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575621903;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=XX2Qv/pDDSpq0MxzImXnpuNW4d3j9qxMv6fqhgnMWaM=;
        b=A1x9BawtTJaxbqNXvDsdHmdeURQHwCBm6PEG7+HemibRj111my5Mbfx7ctfq4im6
        ubY6doGyvJbsM7U9sEGd0fjMwG0D5Cj/4W+1Jbm9Wly/DuwDgdCHDBvtnZAUV8xByS5
        6PvwwzYh/WnxajNM6RBP58bP0+0EiX9t1ythIAYs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575621903;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=XX2Qv/pDDSpq0MxzImXnpuNW4d3j9qxMv6fqhgnMWaM=;
        b=bllD4dpFKByTz6tAqe0Y0xJvgN2b++1/qwe8IjuTOt9sJFv+JO66bzKij42k43Fx
        ecBphyZzJ/jPs5sFiBVJCEf3QhDJnUF/pcaliqpGUDQv/3uQIp1XRusHTdDc56AFtxa
        jUVVM0xIgaKKnvTgr7qWx9Ie3GRVTPj5/k1EEbKQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3CD02C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=gkohli@codeaurora.org
Subject: Re: [PATCH v0] irqchip/gic-v3: Avoid check of lpi configuration for
 non existent cpu
To:     Marc Zyngier <maz@kernel.org>
Cc:     tglx@linutronix.de, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <1575543357-31892-1-git-send-email-gkohli@codeaurora.org>
 <60f61282c1b1e512ca6ce638b6dfca09@www.loen.fr>
 <209f30c6-c03a-daeb-1f01-e03c489f41d8@codeaurora.org>
 <18011d088d5202339048ac5e3c224bb5@www.loen.fr>
From:   Gaurav Kohli <gkohli@codeaurora.org>
Message-ID: <0101016eda62405c-0df52650-b61f-4ad6-a1df-2eed055e1984-000000@us-west-2.amazonses.com>
Date:   Fri, 6 Dec 2019 08:45:03 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <18011d088d5202339048ac5e3c224bb5@www.loen.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.12.06-54.240.27.186
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/5/2019 6:48 PM, Marc Zyngier wrote:
> On 2019-12-05 13:01, Gaurav Kohli wrote:
>> On 12/5/2019 6:17 PM, Marc Zyngier wrote:
>>> Hi Gaurav,
>>> On 2019-12-05 10:55, Gaurav Kohli wrote:
>>>> As per GIC specification, we can configure gic for more no of cpus
>>>> then the available cpus in the soc, But this can cause mem abort
>>>> while iterating lpi region for non existent cpu as we don't map
>>> Which LPI region? We're talking about RDs, right... Or does LPI mean
>>> something other than GIC LPIs for you?
>>>
>>
>> Yes RDs only.
>>>> redistrubutor region for non-existent cpu.
>>>>
>>>> To avoid this issue, put one more check of valid mpidr.
>>> Sorry, but I'm not sure I grasp your problem. Let me try and rephrase 
>>> it:
>>> - Your GIC is configured for (let's say) 8 CPUs, and your SoC has 
>>> only 4.
>> Yes, suppose gic is configured for 8 cpus but soc has only 4 cpus.
>> Then in this case gic_iterate will iterate till it get TYPER_LAST.
> 
> And that's what is expected from the architecture.
> 
>>
>> But as gic is configured for 8, So last bit sets in eight
>> redistributor regions only.
>>> - As part of the probing, the driver iterates on the RD regions and 
>>> explodes
>>>    because something isn't mapped?
>>> That'd be a grave bug, but I believe the issue is somewhere else.
>>
>> There are 4 cpus present, that's why we have mapped 4 redistributor
>> only, but during probe below function keeps iterating and give mem
>> abort for 5th cpu.
>>
>> static void gic_update_vlpi_properties(void)
>> {
>>         gic_iterate_rdists(__gic_update_vlpi_properties);
>>
>> }
>>
>> We can solve this problem by mapping all eight redistributor in dt,
>> but ideally code should also able to handle this and we can avoid
>> mappin?
> 
> The whole point of DT is to describe the HW, all the HW, nothing but
> the HW. This is what is expected by both the architecture and Linux.
> 
> So you have the solution already. Don't lie to the kernel, and everything
> will be fine.
> 
>          M.

HI Marc,

Thanks for detailed explanation, Yes we have mapped all 8 distributors 
now to resolve.
But my main concern is that last 4 redistributor is not connected to 
core, as core is not present.
And as per gic driver it seems we are only
iterating and populating per cpu rd pointer.

So that would be fine correct, seems nothing wrong in this kind of 
configuration?

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center,
Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
