Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 349D72970D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 15:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750019AbgJWNod (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 09:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750018AbgJWNoc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 09:44:32 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7453C0613CE;
        Fri, 23 Oct 2020 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=627oe94ZLeKyjbn+qyvUY++lrQo5+wHp1qVKRnwOyEA=; b=tAeBy66w9joU2PrbRcza5JTXle
        OQ1GNbtKm1kuwALnI3n5XGE48bmTbzeIUI3woO3q/FJzb5CMWMcPWAr2mw4nh/tkvhoTmvRMse5M5
        398H/FWTpl07yUabCgpJ3R43gitI0mK0dEzUUNo/vAl9B5F0hjZPr9XWXtd9ythKH1x4j8HnmvTpV
        XxR/NkHFLrB/KjBpbKKGC7ui/GCLc9dXVwMVVqGcz9iaJ2qK02ANhTToLcwLuLZskBzmufSxPUTRY
        H17rSXqWnece4UGf2Oj722qSORrug+kLR5xQI9znH+pwqIUVHki8yvnZtkFe6g3jq+X4sGqr+jcQ2
        dmRyGHmA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kVxMh-0007Dn-0M; Fri, 23 Oct 2020 13:44:19 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CF997304D28;
        Fri, 23 Oct 2020 15:44:16 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id B819D23268BA4; Fri, 23 Oct 2020 15:44:16 +0200 (CEST)
Date:   Fri, 23 Oct 2020 15:44:16 +0200
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
Message-ID: <20201023134416.GA2628@hirez.programming.kicks-ass.net>
References: <788706f2-0670-b7b6-a153-3ec6f16e0f2e@arm.com>
 <20201022212033.GA646497@xps15>
 <20201023073905.GM2611@hirez.programming.kicks-ass.net>
 <174e6461-4d46-cb65-c094-c06ee3b21568@arm.com>
 <20201023094115.GR2611@hirez.programming.kicks-ass.net>
 <bd8c136d-9dfa-a760-31f9-eb8d6698aced@arm.com>
 <20201023105431.GM2594@hirez.programming.kicks-ass.net>
 <2457de8f-8bc3-b350-fdc7-61276da31ce6@arm.com>
 <20201023131628.GY2628@hirez.programming.kicks-ass.net>
 <728fd89c-78f2-0c5c-0443-c91c62b02f0e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <728fd89c-78f2-0c5c-0443-c91c62b02f0e@arm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 23, 2020 at 02:29:54PM +0100, Suzuki Poulose wrote:
> On 10/23/20 2:16 PM, Peter Zijlstra wrote:
> > On Fri, Oct 23, 2020 at 01:56:47PM +0100, Suzuki Poulose wrote:

> > > That way another session could use the same sink if it is free. i.e
> > > 
> > > perf record -e cs_etm/@sink0/u --per-thread app1
> > > 
> > > and
> > > 
> > > perf record -e cs_etm/@sink0/u --per-thread app2
> > > 
> > > both can work as long as the sink is not used by the other session.
> > 
> > Like said above, if sink is shared between CPUs, that's going to be a
> > trainwreck :/ Why do you want that?
> 
> That ship has sailed. That is how the current generation of systems are,
> unfortunately. But as I said, this is changing and there are guidelines
> in place to avoid these kind of topologies. With the future
> technologies, this will be completely gone.

I understand that the hardware is like that, but why do you want to
support this insanity in software?

If you only allow a single sink user (group) at the same time, your
problem goes away. Simply disallow the above scenario, do not allow
concurrent sink users if sinks are shared like this.

Have the perf-record of app2 above fail because the sink is in-user
already.

Only if the hardware has per-CPU sinks can you allow this.
