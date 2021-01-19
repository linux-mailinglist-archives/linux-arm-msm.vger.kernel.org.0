Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6972FBA32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jan 2021 15:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390836AbhASOqE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jan 2021 09:46:04 -0500
Received: from foss.arm.com ([217.140.110.172]:49554 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404298AbhASKet (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jan 2021 05:34:49 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F3381042;
        Tue, 19 Jan 2021 02:34:03 -0800 (PST)
Received: from [10.57.40.145] (unknown [10.57.40.145])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F05033F66E;
        Tue, 19 Jan 2021 02:33:59 -0800 (PST)
Subject: Re: [PATCH] coresight: etm4x: Add config to exclude kernel mode
 tracing
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Al Grant <Al.Grant@arm.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>,
        Denis Nikitin <denik@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, leo.yan@linaro.org,
        mnissler@google.com, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20201015124522.1876-1-saiprakash.ranjan@codeaurora.org>
 <20201015160257.GA1450102@xps15>
 <dd400fd7017a5d92b55880cf28378267@codeaurora.org>
 <20210118202354.GC464579@xps15>
 <32216e9fa5c9ffb9df1123792d40eafb@codeaurora.org>
 <DB7PR08MB3355E85C72492D4766F0BEFC86A30@DB7PR08MB3355.eurprd08.prod.outlook.com>
 <03b893801841f732a25072b4e62f8e0b@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <de2487eb-ddb9-589a-8093-fae31235c884@arm.com>
Date:   Tue, 19 Jan 2021 10:33:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <03b893801841f732a25072b4e62f8e0b@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/19/21 9:51 AM, Sai Prakash Ranjan wrote:
> Hi Al,
> 
> On 2021-01-19 14:06, Al Grant wrote:
>> Hi Sai,
>>
>>> From: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
>>> Hi Mathieu,
>>>
>>> On 2021-01-19 01:53, Mathieu Poirier wrote:
>>> > On Fri, Jan 15, 2021 at 11:16:24AM +0530, Sai Prakash Ranjan wrote:
>>> >> Hello Mathieu, Suzuki
>>> >>
>>> >> On 2020-10-15 21:32, Mathieu Poirier wrote:
>>> >> > On Thu, Oct 15, 2020 at 06:15:22PM +0530, Sai Prakash Ranjan wrote:
>>> >> > > On production systems with ETMs enabled, it is preferred to
>>> >> > > exclude kernel mode(NS EL1) tracing for security concerns and
>>> >> > > support only userspace(NS EL0) tracing. So provide an option via
>>> >> > > kconfig to exclude kernel mode tracing if it is required.
>>> >> > > This config is disabled by default and would not affect the
>>> >> > > current configuration which has both kernel and userspace tracing
>>> >> > > enabled by default.
>>> >> > >
>>> >> >
>>> >> > One requires root access (or be part of a special trace group) to
>>> >> > be able to use the cs_etm PMU.  With this kind of elevated access
>>> >> > restricting tracing at EL1 provides little in terms of security.
>>> >> >
>>> >>
>>> >> Apart from the VM usecase discussed, I am told there are other
>>> >> security concerns here regarding need to exclude kernel mode tracing
>>> >> even for the privileged users/root. One such case being the ability
>>> >> to analyze cryptographic code execution since ETMs can record all
>>> >> branch instructions including timestamps in the kernel and there may
>>> >> be other cases as well which I may not be aware of and hence have
>>> >> added Denis and Mattias. Please let us know if you have any questions
>>> >> further regarding this not being a security concern.
>>> >
>>> > Even if we were to apply this patch there are many ways to compromise
>>> > a system or get the kernel to reveal important information using the
>>> > perf subsystem.  I would perfer to tackle the problem at that level
>>> > rather than concentrating on coresight.
>>> >
>>>
>>> Sorry but I did not understand your point. We are talking about the capabilities
>>> of coresight etm tracing which has the instruction level tracing and a lot more.
>>> Perf subsystem is just the framework used for it.
>>> In other words, its not the perf subsystem which does instruction level tracing,
>>> its the coresight etm. Why the perf subsystem should be modified to lockdown
>>> kernel mode? If we were to let perf handle all the trace filtering for different
>>> exception levels, then why do we need the register settings in coresight etm
>>> driver to filter out NS EL* tracing? And more importantly, how do you suppose
>>> we handle sysfs mode of coresight tracing with perf subsystem?
>>
>> You both have good points. Mathieu is right that this is not a CoreSight
>> issue specifically, it is a matter of kernel security policy, and other hardware
>> tracing mechanisms ought to be within its scope. There should be a general
>> "anti kernel exfiltration" config that applies to all mechanisms within
>> its scope, and we'd definitely expect that to include Intel PT as well as ETM.
>>
> 
> I agree with this part where there should be a generic config for all
> hardware tracing families(atleast for Intel PT and ARM Coresight),
> Suzuki suggested that as well. I am under the impression that Mathieu
> didn't like adding such a config and wanted perf subsystem to handle
> it since initial discussion was around whether root compromise meant
> everything is lost already and such a kconfig would not help, but
> Mattias already gave some good examples where that is not true.
> 
>> A kernel config that forced exclude_kernel on all perf events would deal with
>> ETM and PT in one place, but miss the sysfs interface to ETM.
>>
>> On the other hand, doing it in the ETM drivers would cover the perf and sysfs
>> interfaces to ETM, but would miss Intel PT.
>>
>> So I think what is needed is a general config option that is both implemented
>> in perf (excluding all kernel tracing events) and by any drivers that provide
>> an alternative interface to hardware tracing events.
>>
> 
> I am good with this approach, once Mathieu confirms, I can add a kernel
> wide kconfig as Suzuki suggested earlier and make ETM{3,4}x as the
> initial users. Someone more familiar with Intel PTs can then make use
> of this kconfig.

Instead of adding the support for individual drivers, you could handle this
in the generic perf layer. e.g, Fail perf_event create with an attribute
which allows kernel tracing ?

if (!attr.exclude_kernel)
	return -EINVAL;

Or even exclude the kernel silently always.

This could also be limited to PMUs with PERF_PMU_CAP_ITRACE, if you
want to limit this to PMUs that instruction level tracing.

Suzuki
