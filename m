Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D09296D13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 12:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S462524AbgJWKyo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 06:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S462523AbgJWKyo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 06:54:44 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2705C0613CE;
        Fri, 23 Oct 2020 03:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=aJ2ByrTz/AMs3NHTvzyxOkdZXXigLDWsKyC5gK/mghE=; b=U/xrkLpLQXSROUc3tnTgxLEv8G
        VedqqQjaEaatkmePJAIomik608rvm7HAorDzu3+GSIecqopf2Qz44l/wuacIPhj4nKiok+N+ucA4d
        AMKyMeXOX18lmMovGMl0rHcl67eiO8296N5+uKZz8ZJYeNT0WQeh6dhFqB88cncRN7bk8WATh/mto
        cJgLehclyJP49dIxF2NtCsre9I+o6jAV+VeZkRQcAQQPCrGh5qEzVeY1Unu59XUgqJyLJh26rxb3A
        37+xezEY1u5bqLu7eO8ryS5cfvc/RXveg6/hXXrGSqpH8riUY5PqNYQ9guluJVog2e5gnJoW3TE7K
        c2nhUSuw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kVuiP-0005Vy-5l; Fri, 23 Oct 2020 10:54:33 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id BDF78304D28;
        Fri, 23 Oct 2020 12:54:31 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id A4DEE203D09CC; Fri, 23 Oct 2020 12:54:31 +0200 (CEST)
Date:   Fri, 23 Oct 2020 12:54:31 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Suzuki Poulose <suzuki.poulose@arm.com>
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
Subject: Re: [PATCHv2 2/4] coresight: tmc-etf: Fix NULL ptr dereference in
 tmc_enable_etf_sink_perf()
Message-ID: <20201023105431.GM2594@hirez.programming.kicks-ass.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd8c136d-9dfa-a760-31f9-eb8d6698aced@arm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 23, 2020 at 11:34:32AM +0100, Suzuki Poulose wrote:
> On 10/23/20 10:41 AM, Peter Zijlstra wrote:
> > On Fri, Oct 23, 2020 at 09:49:53AM +0100, Suzuki Poulose wrote:
> > > On 10/23/20 8:39 AM, Peter Zijlstra wrote:
> > 
> > > > So then I don't understand the !->owner issue, that only happens when
> > > > the task dies, which cannot be concurrent with event creation. Are you
> > > 
> > > Part of the patch from Sai, fixes this by avoiding the dereferencing
> > > after event creation (by caching it). But the kernel events needs
> > > fixing.
> > 
> > I'm fundamentally failing here. Creating a link to the sink is strictly
> > event-creation time. Why would you ever need it again later? Later you
> > already have the sink setup.
> > 
> 
> Sorry for the lack of clarity here, and you are not alone unless you
> have drowned in the CoreSight topologies ;-)
> 
> Typically current generation of systems have the following topology :
> 
> CPU0
>  etm0   \
>          \  ________
>          /          \
> CPU1    /            \
>   etm1                \
>                        \
>                        /-------  sink0
> CPU2                  /
>   etm2  \            /
>          \ ________ /
>          /
> CPU3    /
>   etm3
> 
> 
> i.e, Multiple ETMs share a sink. [for the sake of simplicity, I have
> used one sink. Even though there could be potential sinks (of different
> types), none of them are private to the ETMs. So, in a nutshell, a sink
> can be reached by multiple ETMs. ]
> 
> Now, for a session :
> 
> perf record -e cs_etm/sinkid=sink0/u workload
> 
> We create an event per CPU (say eventN, which are scheduled based on the
> threads that could execute on the CPU. At this point we have finalized
> the sink0, and have allocated necessary buffer for the sink0.
> 
> Now, when the threads are scheduled on the CPUs, we start the
> appropriate events for the CPUs.
> 
> e.g,
>  CPU0 sched -> workload:0 - > etm0->event0_start -> Turns all
> the components upto sink0, starting the trace collection in the buffer.
> 
> Now, if another CPU, CPU1 starts tracing event1 for workload:1 thread,
> it will eventually try to turn ON the sink0.Since sink0 is already
> active tracing event0, we could allow this to go through and collect
> the trace in the *same hardware buffer* (which can be demuxed from the
> single AUX record using the TraceID in the packets). Please note that
> we do double buffering and hardware buffer is copied only when the sink0
> is stopped (see below).
> 
> But, if the event scheduled on CPU1 doesn't belong to the above session, but
> belongs to different perf session
>  (say, perf record -e  cs_etm/sinkid=sink0/u benchmark),
> 
> we can't allow this to succeed and mix the trace data in to that of workload
> and thus fail the operation.
> 
> In a nutshell, since the sinks are shared, we start the sink on the
> first event and keeps sharing the sink buffer with any event that
> belongs to the same session (using refcounts). The sink is only released
> for other sessions, when there are no more events in the session tracing
> on any of the ETMs.
> 
> I know this is fundamentally a topology issue, but that is not something
> we can fix. But the situation is changing and we are starting to see
> systems with per-CPU sinks.
> 
> Hope this helps.

I think I'm more confused now :-/

Where do we use ->owner after event creation? The moment you create your
eventN you create the link to sink0. That link either succeeds (same
'cookie') or fails.

If it fails, event creation fails, the end.

On success, we have the sink pointer in our event and we never ever need
to look at ->owner ever again.

I'm also not seeing why exactly we need ->owner in the first place.

Suppose we make the sink0 device return -EBUSY on open() when it is
active. Then a perf session can open the sink0 device, create perf
events and attach them to the sink0 device using
perf_event_attr::config2. The events will attach to sink0 and increment
its usage count, such that any further open() will fail.

Once the events are created, the perf tool close()s the sink0 device,
which is now will in-use by the events. No other events can be attached
to it.

Or are you doing the event->sink mapping every time you do: pmu::add()?
That sounds insane.
