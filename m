Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3DF8454A45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 16:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232506AbhKQPuG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 10:50:06 -0500
Received: from foss.arm.com ([217.140.110.172]:59394 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229644AbhKQPuF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 10:50:05 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A2261FB;
        Wed, 17 Nov 2021 07:47:07 -0800 (PST)
Received: from [10.57.24.78] (unknown [10.57.24.78])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62F7D3F5A1;
        Wed, 17 Nov 2021 07:47:05 -0800 (PST)
Subject: Re: [PATCH] base: arch_topology: Use policy->max to calculate
 freq_factor
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Thara Gopinath <thara.gopinath@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20211115201010.68567-1-thara.gopinath@linaro.org>
 <CAJZ5v0gezoJZVH69Y7fDwa-uLhE0PaqFrzM=0bequxpE_749zg@mail.gmail.com>
 <8f7397e3-4e92-c84d-9168-087967f4d683@arm.com>
 <CAJZ5v0iRDtr5yae5UndwU2SmVL4cak=BN0irVGbgNzQiS8K3mA@mail.gmail.com>
 <7f077790-da4c-35b8-0eea-cbdc630f9d2a@arm.com>
 <CAJZ5v0gtkQYfeEELLrNjRQmywkxrtqzVZp1Kb-f9JPsqEckevw@mail.gmail.com>
From:   Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <04a9a7e5-30c3-3a65-de19-ce2319d68260@arm.com>
Date:   Wed, 17 Nov 2021 15:47:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gtkQYfeEELLrNjRQmywkxrtqzVZp1Kb-f9JPsqEckevw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/17/21 3:17 PM, Rafael J. Wysocki wrote:
> On Wed, Nov 17, 2021 at 4:08 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
>>
>>
>>
>> On 11/17/21 12:49 PM, Rafael J. Wysocki wrote:
>>> On Wed, Nov 17, 2021 at 11:46 AM Lukasz Luba <lukasz.luba@arm.com> wrote:
>>>>
>>>> Hi Rafael,
>>>>
>>>> On 11/16/21 7:05 PM, Rafael J. Wysocki wrote:
>>>>> On Mon, Nov 15, 2021 at 9:10 PM Thara Gopinath
>>>>> <thara.gopinath@linaro.org> wrote:
>>>>>>
>>>>>> cpuinfo.max_freq can reflect boost frequency if enabled during boot.  Since
>>>>>> we don't consider boost frequencies while calculating cpu capacities, use
>>>>>> policy->max to populate the freq_factor during boot up.
>>>>>
>>>>> I'm not sure about this.  schedutil uses cpuinfo.max_freq as the max frequency.
>>>>
>>>> Agree it's tricky how we treat the boost frequencies and also combine
>>>> them with thermal pressure.
>>>> We probably would have consider these design bits:
>>>> 1. Should thermal pressure include boost frequency?
>>>
>>> Well, I guess so.
>>>
>>> Running at a boost frequency certainly increases thermal pressure.
>>>
>>>> 2. Should max capacity 1024 be a boost frequency so scheduler
>>>>       would see it explicitly?
>>>
>>> That's what it is now if cpuinfo.max_freq is a boost frequency.
>>>
>>>> - if no, then schedutil could still request boost freq thanks to
>>>>      map_util_perf() where we add 25% to the util and then
>>>>      map_util_freq() would return a boost freq when util was > 1024
>>>>
>>>>
>>>> I can see in schedutil only one place when cpuinfo.max_freq is used:
>>>> get_next_freq(). If the value stored in there is a boost,
>>>> then don't we get a higher freq value for the same util?
>>>
>>> Yes. we do, which basically is my point.
>>>
>>> The schedutil's response is proportional to cpuinfo.max_freq and that
>>> needs to be taken into account for the results to be consistent.
>>>
>>
>> This boost thing wasn't an issue for us, because we didn't have
>> platforms which come with it (till recently). I've checked that you have
>> quite a few CPUs which support huge boost freq, e.g. 5GHz vs. 3.6GHz
>> nominal max freq [1]. Am I reading this correctly as kernel boost freq?
> 
> That actually depends on the driver.
> 
> For instance, intel_pstate can be run with turbo (== boost) enabled or
> disabled.  If turbo is enabled, cpuinfo.max_freq is the max turbo
> frequency.
> 
> In acpi_cpufreq things are sort of weird, because the highest bin in
> there is a turbo frequency, but not the max one and it is used to
> enable the entire turbo range.  The driver sets cpuinfo.max_freq to
> this one if boost is enabled IIRC.
> 
>> Do you represent this 5GHz as 1024 capacity?
> 
> Yes (but see above).
> 
>>   From this schedutil get_next_freq() I would guess yes.
>>
>> I cannot find if you use thermal pressure, could you help me with this,
>> please?
> 
> It is not used on x86 AFAICS.
> 

Thank you Rafael for all these information. We will have to re-visit
many places on our platform and how this boost should work. It looks
for the first glance that its a full-time task for one of our
team members. We would have to organize this investigation
internally to get better understanding of all affected places.

While this patch change is easy, since the policy->max should
contain the nominal max freq at this setup time (which is what
we want for calculating capacity), the schedutil usage of
cpuinfo.max_freq is not easy to judge and solve. Currently,
on our platforms we stick to the design where nominal max freq
is 1024 capacity, but I don't know if that would hold for long...
