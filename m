Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B626E297026
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 15:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464414AbgJWNQn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 09:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S464413AbgJWNQm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 09:16:42 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B56DC0613CE;
        Fri, 23 Oct 2020 06:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=f2ugiX9dLGJTsb+7jg1YhjwKk+hw5A7t8TuQNw8y1QM=; b=tj/Dxpvg8n2uDQE1cje//2o+Iu
        MNEVnQcmTtOQ5MaoLhl7va1Ej3ULpOfdbyH9aWpYE+9zvIoLMLWc4OFykJOBsg/jlMTuES6ddHIK4
        5pc+Yvwlkx85bAe3Dto7W06h+40KZ3T79LU+YN0s86aPM8Z1JemtW6oWcqRl87AP9SGWP7gSXJqRN
        8j4EX7rFI4R4Kubd3OWZyChO2T/t+UdzWHYR3gSJwzhtXld5X3Ecgj4BHzfMjVUqFhVLouJlji5fu
        jx+JB9loeiEp9dMxOVuCQUcntaMZq7LdUHu+FRMEjskNGkjpKOP/f53dYNH+bPpodjpcIAZ2MQbCd
        UHDNJjPg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kVwvn-0005SV-5u; Fri, 23 Oct 2020 13:16:31 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 57F46302753;
        Fri, 23 Oct 2020 15:16:28 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 44FD32B6778C0; Fri, 23 Oct 2020 15:16:28 +0200 (CEST)
Date:   Fri, 23 Oct 2020 15:16:28 +0200
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
Message-ID: <20201023131628.GY2628@hirez.programming.kicks-ass.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2457de8f-8bc3-b350-fdc7-61276da31ce6@arm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 23, 2020 at 01:56:47PM +0100, Suzuki Poulose wrote:
> On 10/23/20 11:54 AM, Peter Zijlstra wrote:

> > I think I'm more confused now :-/
> > 
> > Where do we use ->owner after event creation? The moment you create your
> > eventN you create the link to sink0. That link either succeeds (same
> > 'cookie') or fails.
> 
> The event->sink link is established at creation. At event::add(), we
> check the sink is free (i.e, it is inactive) or is used by an event
> of the same session (this is where the owner field *was* required. But
> this is not needed anymore, as we cache the "owner" read pid in the
> handle->rb->aux_priv for each event and this is compared against the
> pid from the handle currently driving the hardware)

*groan*.. that's going to be a mess with sinks that are shared between
CPUs :/

> > I'm also not seeing why exactly we need ->owner in the first place.
> > 
> > Suppose we make the sink0 device return -EBUSY on open() when it is
> > active. Then a perf session can open the sink0 device, create perf
> > events and attach them to the sink0 device using
> > perf_event_attr::config2. The events will attach to sink0 and increment
> > its usage count, such that any further open() will fail.
> 
> Thats where we are diverging. The sink device doesn't have any fops. It
> is all managed by the coresight driver transparent to the perf tool. All
> the perf tool does is, specifying which sink to use (btw, we now have
> automatic sink selection support which gets rid of this, and uses
> the best possible sink e.g, in case of per-CPU sinks).

per-CPU sinks sounds a lot better.

I'm really not convinced it makes sense to do what you do with shared
sinks though. You'll loose random parts of the execution trace because
of what the other CPUs do.

Full exclusive sink access is far more deterministic.

> > Once the events are created, the perf tool close()s the sink0 device,
> > which is now will in-use by the events. No other events can be attached
> > to it.
> > 
> > Or are you doing the event->sink mapping every time you do: pmu::add()?
> > That sounds insane.
> 
> Sink is already mapped at event create. But yes, the refcount on the
> sink is managed at start/stop. Thats when we need to make sure that the
> event being scheduled belongs to the same owner as the one already
> driving the sink.

pmu::add() I might hope, because pmu::start() is not allowed to fail.

> That way another session could use the same sink if it is free. i.e
> 
> perf record -e cs_etm/@sink0/u --per-thread app1
> 
> and
> 
> perf record -e cs_etm/@sink0/u --per-thread app2
> 
> both can work as long as the sink is not used by the other session.

Like said above, if sink is shared between CPUs, that's going to be a
trainwreck :/ Why do you want that?

And once you have per-CPU sinks like mentioned above, the whole problem
goes away.
