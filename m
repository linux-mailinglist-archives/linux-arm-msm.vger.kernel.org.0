Return-Path: <linux-arm-msm+bounces-4698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 896F9812B1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 10:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 238E32826D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 09:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63AB92577B;
	Thu, 14 Dec 2023 09:07:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7A676A6;
	Thu, 14 Dec 2023 01:07:06 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A12FAC15;
	Thu, 14 Dec 2023 01:07:51 -0800 (PST)
Received: from [10.57.85.242] (unknown [10.57.85.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D9263F762;
	Thu, 14 Dec 2023 01:07:01 -0800 (PST)
Message-ID: <54f3b98c-1f7d-4205-9e3c-a4a19ad3d941@arm.com>
Date: Thu, 14 Dec 2023 09:08:04 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] cpufreq: Add a cpufreq pressure feedback for the
 scheduler
Content-Language: en-US
To: Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: catalin.marinas@arm.com, will@kernel.org, sudeep.holla@arm.com,
 rafael@kernel.org, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, bristot@redhat.com,
 vschneid@redhat.com, rui.zhang@intel.com, mhiramat@kernel.org,
 daniel.lezcano@linaro.org, amit.kachhap@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
References: <20231212142730.998913-1-vincent.guittot@linaro.org>
 <20231212142730.998913-2-vincent.guittot@linaro.org>
 <20231214054307.axl33gagxacidjbn@vireshk-i7>
 <CAKfTPtDam5eQO1DHxALsCaU53Rtawbfrvswy+z2unnV_eXeVLA@mail.gmail.com>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <CAKfTPtDam5eQO1DHxALsCaU53Rtawbfrvswy+z2unnV_eXeVLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/14/23 07:57, Vincent Guittot wrote:
> On Thu, 14 Dec 2023 at 06:43, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>
>> On 12-12-23, 15:27, Vincent Guittot wrote:
>>> @@ -2618,6 +2663,9 @@ static int cpufreq_set_policy(struct cpufreq_policy *policy,
>>>        policy->max = __resolve_freq(policy, policy->max, CPUFREQ_RELATION_H);
>>>        trace_cpu_frequency_limits(policy);
>>>
>>> +     cpus = policy->related_cpus;
>>> +     cpufreq_update_pressure(cpus, policy->max);
>>> +
>>>        policy->cached_target_freq = UINT_MAX;
>>
>> One more question, why are you doing this from cpufreq_set_policy ? If
>> due to cpufreq cooling or from userspace, we end up limiting the
>> maximum possible frequency, will this routine always get called ?
> 
> Yes, any update of a FREQ_QOS_MAX ends up calling cpufreq_set_policy()
> to update the policy->max
> 

Agree, cpufreq sysfs scaling_max_freq is also important to handle
in this new design. Currently we don't reflect that as reduced CPU
capacity in the scheduler. There was discussion when I proposed to feed
that CPU frequency reduction into thermal_pressure [1].

The same applies for the DTPM which is missing currently the proper
impact to the CPU reduced capacity in the scheduler.

IMHO any limit set into FREQ_QOS_MAX should be visible in this
new design of capacity reduction signaling.

[1] https://lore.kernel.org/lkml/20220930094821.31665-2-lukasz.luba@arm.com/

