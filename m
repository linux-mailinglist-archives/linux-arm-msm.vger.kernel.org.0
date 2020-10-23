Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D113B296CEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 12:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S462267AbgJWKeh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 06:34:37 -0400
Received: from foss.arm.com ([217.140.110.172]:48872 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S462260AbgJWKeh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 06:34:37 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25102113E;
        Fri, 23 Oct 2020 03:34:37 -0700 (PDT)
Received: from [10.57.13.45] (unknown [10.57.13.45])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73AF63F66E;
        Fri, 23 Oct 2020 03:34:33 -0700 (PDT)
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
References: <cover.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <aa6e571156d6e26e54da0bb3015ba474e4a08da0.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <20201022113214.GD2611@hirez.programming.kicks-ass.net>
 <e7d236f7-61c2-731d-571b-839e0e545563@arm.com>
 <20201022150609.GI2611@hirez.programming.kicks-ass.net>
 <788706f2-0670-b7b6-a153-3ec6f16e0f2e@arm.com>
 <20201022212033.GA646497@xps15>
 <20201023073905.GM2611@hirez.programming.kicks-ass.net>
 <174e6461-4d46-cb65-c094-c06ee3b21568@arm.com>
 <20201023094115.GR2611@hirez.programming.kicks-ass.net>
From:   Suzuki Poulose <suzuki.poulose@arm.com>
Message-ID: <bd8c136d-9dfa-a760-31f9-eb8d6698aced@arm.com>
Date:   Fri, 23 Oct 2020 11:34:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201023094115.GR2611@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/23/20 10:41 AM, Peter Zijlstra wrote:
> On Fri, Oct 23, 2020 at 09:49:53AM +0100, Suzuki Poulose wrote:
>> On 10/23/20 8:39 AM, Peter Zijlstra wrote:
> 
>>> So then I don't understand the !->owner issue, that only happens when
>>> the task dies, which cannot be concurrent with event creation. Are you
>>
>> Part of the patch from Sai, fixes this by avoiding the dereferencing
>> after event creation (by caching it). But the kernel events needs
>> fixing.
> 
> I'm fundamentally failing here. Creating a link to the sink is strictly
> event-creation time. Why would you ever need it again later? Later you
> already have the sink setup.
> 

Sorry for the lack of clarity here, and you are not alone unless you
have drowned in the CoreSight topologies ;-)

Typically current generation of systems have the following topology :

CPU0
  etm0   \
          \  ________
          /          \
CPU1    /            \
   etm1                \
                        \
                        /-------  sink0
CPU2                  /
   etm2  \            /
          \ ________ /
          /
CPU3    /
   etm3


i.e, Multiple ETMs share a sink. [for the sake of simplicity, I have
used one sink. Even though there could be potential sinks (of different
types), none of them are private to the ETMs. So, in a nutshell, a sink
can be reached by multiple ETMs. ]

Now, for a session :

perf record -e cs_etm/sinkid=sink0/u workload

We create an event per CPU (say eventN, which are scheduled based on the
threads that could execute on the CPU. At this point we have finalized
the sink0, and have allocated necessary buffer for the sink0.

Now, when the threads are scheduled on the CPUs, we start the
appropriate events for the CPUs.

e.g,
  CPU0 sched -> workload:0 - > etm0->event0_start -> Turns all
the components upto sink0, starting the trace collection in the buffer.

Now, if another CPU, CPU1 starts tracing event1 for workload:1 thread,
it will eventually try to turn ON the sink0.Since sink0 is already
active tracing event0, we could allow this to go through and collect
the trace in the *same hardware buffer* (which can be demuxed from the 
single AUX record using the TraceID in the packets). Please note that
we do double buffering and hardware buffer is copied only when the sink0
is stopped (see below).

But, if the event scheduled on CPU1 doesn't belong to the above session, 
but belongs to different perf session
  (say, perf record -e  cs_etm/sinkid=sink0/u benchmark),

we can't allow this to succeed and mix the trace data in to that of 
workload and thus fail the operation.

In a nutshell, since the sinks are shared, we start the sink on the
first event and keeps sharing the sink buffer with any event that
belongs to the same session (using refcounts). The sink is only released
for other sessions, when there are no more events in the session tracing
on any of the ETMs.

I know this is fundamentally a topology issue, but that is not something
we can fix. But the situation is changing and we are starting to see
systems with per-CPU sinks.

Hope this helps.

Suzuki
