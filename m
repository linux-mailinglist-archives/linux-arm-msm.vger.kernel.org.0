Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F35296FBF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 14:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464113AbgJWM4w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 08:56:52 -0400
Received: from foss.arm.com ([217.140.110.172]:51958 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S464052AbgJWM4w (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 08:56:52 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 607361FB;
        Fri, 23 Oct 2020 05:56:51 -0700 (PDT)
Received: from [10.57.13.45] (unknown [10.57.13.45])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDB7B3F66B;
        Fri, 23 Oct 2020 05:56:47 -0700 (PDT)
Subject: Re: [PATCHv2 2/4] coresight: tmc-etf: Fix NULL ptr dereference in
 tmc_enable_etf_sink_perf()
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Mike Leach <mike.leach@linaro.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <aa6e571156d6e26e54da0bb3015ba474e4a08da0.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <20201022113214.GD2611@hirez.programming.kicks-ass.net>
 <e7d236f7-61c2-731d-571b-839e0e545563@arm.com>
 <20201022150609.GI2611@hirez.programming.kicks-ass.net>
 <788706f2-0670-b7b6-a153-3ec6f16e0f2e@arm.com>
 <20201022212033.GA646497@xps15>
 <20201023073905.GM2611@hirez.programming.kicks-ass.net>
 <174e6461-4d46-cb65-c094-c06ee3b21568@arm.com>
 <20201023094115.GR2611@hirez.programming.kicks-ass.net>
 <bd8c136d-9dfa-a760-31f9-eb8d6698aced@arm.com>
 <20201023105431.GM2594@hirez.programming.kicks-ass.net>
From:   Suzuki Poulose <suzuki.poulose@arm.com>
Message-ID: <2457de8f-8bc3-b350-fdc7-61276da31ce6@arm.com>
Date:   Fri, 23 Oct 2020 13:56:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201023105431.GM2594@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/23/20 11:54 AM, Peter Zijlstra wrote:
> On Fri, Oct 23, 2020 at 11:34:32AM +0100, Suzuki Poulose wrote:
>> On 10/23/20 10:41 AM, Peter Zijlstra wrote:
>>> On Fri, Oct 23, 2020 at 09:49:53AM +0100, Suzuki Poulose wrote:
>>>> On 10/23/20 8:39 AM, Peter Zijlstra wrote:
>>>
>>>>> So then I don't understand the !->owner issue, that only happens when
>>>>> the task dies, which cannot be concurrent with event creation. Are you
>>>>
>>>> Part of the patch from Sai, fixes this by avoiding the dereferencing
>>>> after event creation (by caching it). But the kernel events needs
>>>> fixing.
>>>
>>> I'm fundamentally failing here. Creating a link to the sink is strictly
>>> event-creation time. Why would you ever need it again later? Later you
>>> already have the sink setup.
>>>
>>
>> Sorry for the lack of clarity here, and you are not alone unless you
>> have drowned in the CoreSight topologies ;-)
>>
>> Typically current generation of systems have the following topology :
>>
>> CPU0
>>   etm0   \
>>           \  ________
>>           /          \
>> CPU1    /            \
>>    etm1                \
>>                         \
>>                         /-------  sink0
>> CPU2                  /
>>    etm2  \            /
>>           \ ________ /
>>           /
>> CPU3    /
>>    etm3
>>
>>
>> i.e, Multiple ETMs share a sink. [for the sake of simplicity, I have
>> used one sink. Even though there could be potential sinks (of different
>> types), none of them are private to the ETMs. So, in a nutshell, a sink
>> can be reached by multiple ETMs. ]
>>
>> Now, for a session :
>>
>> perf record -e cs_etm/sinkid=sink0/u workload
>>
>> We create an event per CPU (say eventN, which are scheduled based on the
>> threads that could execute on the CPU. At this point we have finalized
>> the sink0, and have allocated necessary buffer for the sink0.
>>
>> Now, when the threads are scheduled on the CPUs, we start the
>> appropriate events for the CPUs.
>>
>> e.g,
>>   CPU0 sched -> workload:0 - > etm0->event0_start -> Turns all
>> the components upto sink0, starting the trace collection in the buffer.
>>
>> Now, if another CPU, CPU1 starts tracing event1 for workload:1 thread,
>> it will eventually try to turn ON the sink0.Since sink0 is already
>> active tracing event0, we could allow this to go through and collect
>> the trace in the *same hardware buffer* (which can be demuxed from the
>> single AUX record using the TraceID in the packets). Please note that
>> we do double buffering and hardware buffer is copied only when the sink0
>> is stopped (see below).
>>
>> But, if the event scheduled on CPU1 doesn't belong to the above session, but
>> belongs to different perf session
>>   (say, perf record -e  cs_etm/sinkid=sink0/u benchmark),
>>
>> we can't allow this to succeed and mix the trace data in to that of workload
>> and thus fail the operation.
>>
>> In a nutshell, since the sinks are shared, we start the sink on the
>> first event and keeps sharing the sink buffer with any event that
>> belongs to the same session (using refcounts). The sink is only released
>> for other sessions, when there are no more events in the session tracing
>> on any of the ETMs.
>>
>> I know this is fundamentally a topology issue, but that is not something
>> we can fix. But the situation is changing and we are starting to see
>> systems with per-CPU sinks.
>>
>> Hope this helps.
> 
> I think I'm more confused now :-/
> 
> Where do we use ->owner after event creation? The moment you create your
> eventN you create the link to sink0. That link either succeeds (same
> 'cookie') or fails.

The event->sink link is established at creation. At event::add(), we
check the sink is free (i.e, it is inactive) or is used by an event
of the same session (this is where the owner field *was* required. But
this is not needed anymore, as we cache the "owner" read pid in the 
handle->rb->aux_priv for each event and this is compared against the
pid from the handle currently driving the hardware)


> 
> If it fails, event creation fails, the end.
> 

> On success, we have the sink pointer in our event and we never ever need
> to look at ->owner ever again.

Correct, we don't need it after the event creation "one part of the 
patch" as explained above.

> 
> I'm also not seeing why exactly we need ->owner in the first place.
> 
> Suppose we make the sink0 device return -EBUSY on open() when it is
> active. Then a perf session can open the sink0 device, create perf
> events and attach them to the sink0 device using
> perf_event_attr::config2. The events will attach to sink0 and increment
> its usage count, such that any further open() will fail.

Thats where we are diverging. The sink device doesn't have any fops. It
is all managed by the coresight driver transparent to the perf tool. All
the perf tool does is, specifying which sink to use (btw, we now have
automatic sink selection support which gets rid of this, and uses
the best possible sink e.g, in case of per-CPU sinks).

> 
> Once the events are created, the perf tool close()s the sink0 device,
> which is now will in-use by the events. No other events can be attached
> to it.
> 
> Or are you doing the event->sink mapping every time you do: pmu::add()?
> That sounds insane.

Sink is already mapped at event create. But yes, the refcount on the
sink is managed at start/stop. Thats when we need to make sure that the
event being scheduled belongs to the same owner as the one already
driving the sink.

That way another session could use the same sink if it is free. i.e

perf record -e cs_etm/@sink0/u --per-thread app1

and

perf record -e cs_etm/@sink0/u --per-thread app2

both can work as long as the sink is not used by the other session.

Suzuki

