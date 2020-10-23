Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9078529707E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 15:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S374473AbgJWN35 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 09:29:57 -0400
Received: from foss.arm.com ([217.140.110.172]:52682 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S374233AbgJWN35 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 09:29:57 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8939D142F;
        Fri, 23 Oct 2020 06:29:56 -0700 (PDT)
Received: from [10.57.13.45] (unknown [10.57.13.45])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 542D13F66B;
        Fri, 23 Oct 2020 06:29:54 -0700 (PDT)
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
References: <e7d236f7-61c2-731d-571b-839e0e545563@arm.com>
 <20201022150609.GI2611@hirez.programming.kicks-ass.net>
 <788706f2-0670-b7b6-a153-3ec6f16e0f2e@arm.com>
 <20201022212033.GA646497@xps15>
 <20201023073905.GM2611@hirez.programming.kicks-ass.net>
 <174e6461-4d46-cb65-c094-c06ee3b21568@arm.com>
 <20201023094115.GR2611@hirez.programming.kicks-ass.net>
 <bd8c136d-9dfa-a760-31f9-eb8d6698aced@arm.com>
 <20201023105431.GM2594@hirez.programming.kicks-ass.net>
 <2457de8f-8bc3-b350-fdc7-61276da31ce6@arm.com>
 <20201023131628.GY2628@hirez.programming.kicks-ass.net>
From:   Suzuki Poulose <suzuki.poulose@arm.com>
Message-ID: <728fd89c-78f2-0c5c-0443-c91c62b02f0e@arm.com>
Date:   Fri, 23 Oct 2020 14:29:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201023131628.GY2628@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/23/20 2:16 PM, Peter Zijlstra wrote:
> On Fri, Oct 23, 2020 at 01:56:47PM +0100, Suzuki Poulose wrote:
>> On 10/23/20 11:54 AM, Peter Zijlstra wrote:
> 
>>> I think I'm more confused now :-/
>>>
>>> Where do we use ->owner after event creation? The moment you create your
>>> eventN you create the link to sink0. That link either succeeds (same
>>> 'cookie') or fails.
>>
>> The event->sink link is established at creation. At event::add(), we
>> check the sink is free (i.e, it is inactive) or is used by an event
>> of the same session (this is where the owner field *was* required. But
>> this is not needed anymore, as we cache the "owner" read pid in the
>> handle->rb->aux_priv for each event and this is compared against the
>> pid from the handle currently driving the hardware)
> 
> *groan*.. that's going to be a mess with sinks that are shared between
> CPUs :/
> 
>>> I'm also not seeing why exactly we need ->owner in the first place.
>>>
>>> Suppose we make the sink0 device return -EBUSY on open() when it is
>>> active. Then a perf session can open the sink0 device, create perf
>>> events and attach them to the sink0 device using
>>> perf_event_attr::config2. The events will attach to sink0 and increment
>>> its usage count, such that any further open() will fail.
>>
>> Thats where we are diverging. The sink device doesn't have any fops. It
>> is all managed by the coresight driver transparent to the perf tool. All
>> the perf tool does is, specifying which sink to use (btw, we now have
>> automatic sink selection support which gets rid of this, and uses
>> the best possible sink e.g, in case of per-CPU sinks).
> 
> per-CPU sinks sounds a lot better.
> 
> I'm really not convinced it makes sense to do what you do with shared
> sinks though. You'll loose random parts of the execution trace because
> of what the other CPUs do.

The ETM trace protocol has in built TraceID to distinguish the packets
and thus we could decode the trace streams from the shared buffer.
[ But, we don't have buffer overflow interrupts (I am keeping the lid 
closed on that can, for the sake of keeping sanity ;-) ), and thus
any shared session could easily loose data unless we tune the AUX
buffer size to a really large buffer ].

> 
> Full exclusive sink access is far more deterministic.
> 
>>> Once the events are created, the perf tool close()s the sink0 device,
>>> which is now will in-use by the events. No other events can be attached
>>> to it.
>>>
>>> Or are you doing the event->sink mapping every time you do: pmu::add()?
>>> That sounds insane.
>>
>> Sink is already mapped at event create. But yes, the refcount on the
>> sink is managed at start/stop. Thats when we need to make sure that the
>> event being scheduled belongs to the same owner as the one already
>> driving the sink.
> 
> pmu::add() I might hope, because pmu::start() is not allowed to fail.
> 

Right. If we can't get the sink, we simply truncate the buffer.

>> That way another session could use the same sink if it is free. i.e
>>
>> perf record -e cs_etm/@sink0/u --per-thread app1
>>
>> and
>>
>> perf record -e cs_etm/@sink0/u --per-thread app2
>>
>> both can work as long as the sink is not used by the other session.
> 
> Like said above, if sink is shared between CPUs, that's going to be a
> trainwreck :/ Why do you want that?

That ship has sailed. That is how the current generation of systems are,
unfortunately. But as I said, this is changing and there are guidelines
in place to avoid these kind of topologies. With the future
technologies, this will be completely gone.

> 
> And once you have per-CPU sinks like mentioned above, the whole problem
> goes away.

True, until then, this is the best we could do.

Suzuki



