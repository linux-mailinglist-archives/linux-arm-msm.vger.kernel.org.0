Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA7731BA558
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2020 15:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727881AbgD0NsX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 09:48:23 -0400
Received: from foss.arm.com ([217.140.110.172]:35770 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727056AbgD0NsW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 09:48:22 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EB9D31B;
        Mon, 27 Apr 2020 06:48:21 -0700 (PDT)
Received: from [10.37.12.144] (unknown [10.37.12.144])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28FE63F305;
        Mon, 27 Apr 2020 06:48:19 -0700 (PDT)
Subject: Re: [PATCH] coresight: dynamic-replicator: Fix handling of multiple
 connections
To:     mike.leach@linaro.org
Cc:     saiprakash.ranjan@codeaurora.org, mathieu.poirier@linaro.org,
        swboyd@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20200426143725.18116-1-saiprakash.ranjan@codeaurora.org>
 <cf5852e9-c3c1-3d31-46f0-0370719947ab@arm.com>
 <CAJ9a7VgF3-Hdc7KSw9gVBeXSDHNguhqVhp60oK2XhCtr3DhDqg@mail.gmail.com>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <84918e7d-c933-3fa1-a61e-0615d4b3cf2c@arm.com>
Date:   Mon, 27 Apr 2020 14:53:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ9a7VgF3-Hdc7KSw9gVBeXSDHNguhqVhp60oK2XhCtr3DhDqg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/27/2020 10:45 AM, Mike Leach wrote:
> HI,
> 
> On Mon, 27 Apr 2020 at 10:15, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>> On 04/26/2020 03:37 PM, Sai Prakash Ranjan wrote:
>>> Since commit 30af4fb619e5 ("coresight: dynamic-replicator:
>>> Handle multiple connections"), we do not make sure that
>>> the other port is disabled when the dynamic replicator is
>>> enabled. This is seen to cause the CPU hardlockup atleast
>>> on SC7180 SoC with the following topology when enabling ETM
>>> with ETR as the sink via sysfs. Since there is no trace id
>>> logic in coresight yet to make use of multiple sinks in
>>> parallel for different trace sessions, disable the other
>>> port when one port is turned on.
>>>
>>>          etm0_out
>>>          |
>>>      apss_funnel_in0
>>>             |
>>>     apss_merge_funnel_in
>>>             |
>>>         funnel1_in4
>>>          |
>>>      merge_funnel_in1
>>>          |
>>>       swao_funnel_in
>>>             |
>>>           etf_in
>>>          |
>>>     swao_replicator_in
>>>             |
>>>      replicator_in
>>>          |
>>>           etr_in
>>>
>>>     Kernel panic - not syncing: Watchdog detected hard LOCKUP on cpu 0
>>>     CPU: 7 PID: 0 Comm: swapper/7 Tainted: G S  B             5.4.25 #100
>>>     Hardware name: Qualcomm Technologies, Inc. SC7180 IDP (DT)
>>>     Call trace:
>>>      dump_backtrace+0x0/0x188
>>>      show_stack+0x20/0x2c
>>>      dump_stack+0xdc/0x144
>>>      panic+0x168/0x370
>>>      arch_seccomp_spec_mitigate+0x0/0x14
>>>      watchdog_timer_fn+0x68/0x290
>>>      __hrtimer_run_queues+0x264/0x498
>>>      hrtimer_interrupt+0xf0/0x22c
>>>      arch_timer_handler_phys+0x40/0x50
>>>      handle_percpu_devid_irq+0x8c/0x158
>>>      __handle_domain_irq+0x84/0xc4
>>>      gic_handle_irq+0x100/0x1c4
>>>      el1_irq+0xbc/0x180
>>>      arch_cpu_idle+0x3c/0x5c
>>>      default_idle_call+0x1c/0x38
>>>      do_idle+0x100/0x280
>>>      cpu_startup_entry+0x24/0x28
>>>      secondary_start_kernel+0x15c/0x170
>>>     SMP: stopping secondary CPUs
>>>
>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>> Tested-by: Stephen Boyd <swboyd@chromium.org>


>>
>> This is not sufficient. You must prevent another session trying to
>> enable the other port of the replicator as this could silently fail
>> the "on-going" session. Not ideal. Fail the attempt to enable a port
>> if the other port is active. You could track this in software and
>> fail early.
>>
>> Suzuki
> 
> While I have no issue in principle with not enabling a path to a sink
> that is not in use - indeed in some cases attaching to unused sinks
> can cause back-pressure that slows throughput (cf TPIU) - I am
> concerned that this modification is masking an underlying issue with
> the platform in question.
> 
> Should we decide to enable the diversion of different IDs to different
> sinks or allow different sessions go to different sinks, then this has
> potential to fail on the SC7180 SoC - and it will be difficult in
> future to associate a problem with this discussion.

Mike,

I think thats a good point.
Sai, please could we narrow down this to the real problem and may be
work around it for the "device" ? Do we know which sink is causing the
back pressure ? We could then push the "work around" to the replicator
it is connected to.

Suzuki
