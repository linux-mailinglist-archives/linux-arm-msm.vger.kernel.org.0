Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C80091CDD12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 16:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729743AbgEKOZu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 10:25:50 -0400
Received: from foss.arm.com ([217.140.110.172]:33376 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbgEKOZu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 10:25:50 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D6FCD6E;
        Mon, 11 May 2020 07:25:50 -0700 (PDT)
Received: from [10.37.12.116] (unknown [10.37.12.116])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3AF93F68F;
        Mon, 11 May 2020 07:25:40 -0700 (PDT)
Subject: Re: [PATCH] coresight: dynamic-replicator: Fix handling of multiple
 connections
To:     saiprakash.ranjan@codeaurora.org, mike.leach@linaro.org
Cc:     mathieu.poirier@linaro.org, swboyd@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk
References: <20200426143725.18116-1-saiprakash.ranjan@codeaurora.org>
 <cf5852e9-c3c1-3d31-46f0-0370719947ab@arm.com>
 <CAJ9a7VgF3-Hdc7KSw9gVBeXSDHNguhqVhp60oK2XhCtr3DhDqg@mail.gmail.com>
 <84918e7d-c933-3fa1-a61e-0615d4b3cf2c@arm.com>
 <668ea1283a6dd6b34e701972f6f71034@codeaurora.org>
 <5b0f5d77c4eec22d8048bb0ffa078345@codeaurora.org>
 <759d47de-2101-39cf-2f1c-cfefebebd548@arm.com>
 <7d343e96cf0701d91152fd14c2fdec42@codeaurora.org>
 <CAJ9a7VgEiX19ukjwakNHBHDeZJ05f5Z7pAYG9iEnpXCuuDfBqg@mail.gmail.com>
 <a4bba03d41a2b0145b3c6c19d48698eb@codeaurora.org>
 <CAJ9a7Vj4eyv1n=RxuqfV=pdBN3SDG+ShYS5J4s40KJtqOnR7vw@mail.gmail.com>
 <ae0fe2050be01cc1403c7d53a0da8cb8@codeaurora.org>
 <b8c1cc35846d425a1677c73fddf5874d@codeaurora.org>
 <eee1b9a90266eed9a9c75401f0679777@codeaurora.org>
 <CAJ9a7Vjd0XG+rAvHptAAjGtE6xRhYsPaOSC_Bf9B-w-FZFu_Qw@mail.gmail.com>
 <47f6d51bfad0a0bf1553e101e6a2c8c9@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <37b3749e-2363-0877-c318-9c334a5d1881@arm.com>
Date:   Mon, 11 May 2020 15:30:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <47f6d51bfad0a0bf1553e101e6a2c8c9@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/11/2020 03:16 PM, Sai Prakash Ranjan wrote:
> Hi Mike,
> 
> On 2020-05-11 16:44, Mike Leach wrote:
> [...]
> 
>>>
>>> I checked with the debug team and there is a limitation with
>>> the replicator(swao_replicator) in the AOSS group where it
>>> loses the idfilter register context when the clock is disabled.
>>> This is not just in SC7180 SoC but also reported on some latest
>>> upcoming QCOM SoCs as well and will need to be taken care in
>>> order to enable coresight on these chipsets.
>>>
>>> Here's what's happening -  After the replicator is initialized,
>>> the clock is disabled in amba_pm_runtime_suspend() as a part of
>>> pm runtime workqueue with the assumption that there will be no
>>> loss of context after the replicator is initialized. But it doesn't
>>> hold good with the replicators with these unfortunate limitation
>>> and the idfilter register context is lost.
>>>
>>> [    5.889406] amba_pm_runtime_suspend devname=6b06000.replicator ret=0
>>> [    5.914516] Workqueue: pm pm_runtime_work
>>> [    5.918648] Call trace:
>>> [    5.921185]  dump_backtrace+0x0/0x1d0
>>> [    5.924958]  show_stack+0x2c/0x38
>>> [    5.928382]  dump_stack+0xc0/0x104
>>> [    5.931896]  amba_pm_runtime_suspend+0xd8/0xe0
>>> [    5.936469]  __rpm_callback+0xe0/0x140
>>> [    5.940332]  rpm_callback+0x38/0x98
>>> [    5.943926]  rpm_suspend+0xec/0x618
>>> [    5.947522]  rpm_idle+0x5c/0x3f8
>>> [    5.950851]  pm_runtime_work+0xa8/0xc0
>>> [    5.954718]  process_one_work+0x1f8/0x4c0
>>> [    5.958848]  worker_thread+0x50/0x468
>>> [    5.962623]  kthread+0x12c/0x158
>>> [    5.965957]  ret_from_fork+0x10/0x1c
>>>
>>> This is a platform/SoC specific replicator issue, so we can either
>>> introduce some DT property for replicators to identify which replicator
>>> has this limitation, check in replicator_enable() and reset the
>>> registers
>>> or have something like below diff to check the idfilter registers in
>>> replicator_enable() and then reset with clear comment specifying it’s
>>> the
>>> hardware limitation on some QCOM SoCs. Please let me know your thoughts
>>> on
>>> this?
>>>
> 
> Sorry for hurrying up and sending the patch - 
> https://lore.kernel.org/patchwork/patch/1239923/.
> I will send v2 based on further feedbacks here or there.
> 
>>
>> 1) does this replicator part have a unique ID that differs from the
>> standard ARM designed replicators?
>> If so perhaps link the modification into this. (even if the part no in
>> PIDR0/1 is the same the UCI should be different for a different
>> implementation)
>>
> 
> pid=0x2bb909 for both replicators. So part number is same.
> UCI will be different for different implementation(QCOM maybe different 
> from ARM),
> but will it be different for different replicators under the same 
> impl(i.e., on QCOM).

May be use PIDR4.DES_2 to match the Implementor and apply the work
around for all QCOM replicators ?

To me that sounds the best option.

Suzuki
