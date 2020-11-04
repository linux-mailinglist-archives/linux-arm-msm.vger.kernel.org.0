Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C13C02A6B59
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Nov 2020 18:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731897AbgKDRDl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 12:03:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731607AbgKDRDk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 12:03:40 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED891C0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2020 09:03:38 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id 62so9809827pgg.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2020 09:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cMu7ftuJKYWofdDf+mw7KOC/o+bzARuC9bdbjIr2veY=;
        b=kIBCBW3l5LWCuLMq9XBIuuGqIIdYwn6PYTcQ1exPNdySkR2xoelVFIaBHnUZ9KoSem
         jYPmc4SdHgZDzMmlmpNcbJO+2aOcixon7EzVQfu1Qqdmv/PZn2tRj+IWyWGjACD0GWGp
         9mfhbvZI0/yUhFKn/eS4uf0RUj1GhYWw7X+nM3QUajXkVyPIHl5ojpW07kM709dLhHtw
         DWwiCKzmk59qXjFwP3alt5h3WD11dgrtSyzsZ1G+Ddx++fQw8cZ+2Vy04TWX1h0ms0pd
         gP3SNFSMmD0W7dhnMDUJWDsC9km6r43JrS+Sl+QWgtX68ciUCevjSIbzqYIMfGT7D6dE
         JnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cMu7ftuJKYWofdDf+mw7KOC/o+bzARuC9bdbjIr2veY=;
        b=S0UXYY15N/rjZpg2SJTZEzf6Ewna+2aXy/SKB7EyU1i4Yh81cQfuLEQF6//OjVPQTQ
         /tAwnmbjsD9i/nHIUCknPvXYwkax8tcLNwujzF+uZmUCIoIE+sbRDqy8uza9gnTjP0C5
         yxCCt4jefJY28X0tslJNcvpPf8Sb1eiUKQwkLtdwKdQ0G0RwZn8ChRqFnOofYHug+Dxx
         OxNBAAZJX4O3C90DNe9F9lsONiOsyChPBOOUeuiFhlyHr25ye64k4WaL9MMdPsUbeEKX
         4MCGwLCXXKqbmEakuXrgTgHDC7GjTNfgXtWFpCxoAmBp0qpLSwfdjPKeKAAbp1ni1RLH
         oUGA==
X-Gm-Message-State: AOAM531ZjGXvE3pw3sBdE3+pW6gQ/01g2sLdE2qC9BjBc5+I5pnDMYHL
        Q9HgodxquI2919EEVH2NCZDK1Q==
X-Google-Smtp-Source: ABdhPJzzT3/ryOHyRUm9RNGwSYrm4NGLAOBXZVt3aH0Z/RdpUipHDPneULJNKdYZhn7JaOeU8xIWUQ==
X-Received: by 2002:a17:90a:b94a:: with SMTP id f10mr5148918pjw.164.1604509418496;
        Wed, 04 Nov 2020 09:03:38 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id z22sm3056775pfa.220.2020.11.04.09.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 09:03:37 -0800 (PST)
Date:   Wed, 4 Nov 2020 10:03:35 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Suzuki Poulose <suzuki.poulose@arm.com>,
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
Message-ID: <20201104170335.GA2892592@xps15>
References: <bd8c136d-9dfa-a760-31f9-eb8d6698aced@arm.com>
 <20201023105431.GM2594@hirez.programming.kicks-ass.net>
 <2457de8f-8bc3-b350-fdc7-61276da31ce6@arm.com>
 <20201023131628.GY2628@hirez.programming.kicks-ass.net>
 <728fd89c-78f2-0c5c-0443-c91c62b02f0e@arm.com>
 <20201023134416.GA2628@hirez.programming.kicks-ass.net>
 <20201023203729.GA819775@xps15>
 <70e3a508af119be481c8f0a0acf0a44d@codeaurora.org>
 <20201030164806.GB1301231@xps15>
 <85c285361ce1c71b1a8274493aab9ca7@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85c285361ce1c71b1a8274493aab9ca7@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 30, 2020 at 10:56:09PM +0530, Sai Prakash Ranjan wrote:
> Hi Mathieu,
> 
> On 2020-10-30 22:18, Mathieu Poirier wrote:
> > On Fri, Oct 30, 2020 at 01:29:56PM +0530, Sai Prakash Ranjan wrote:
> > > Hello guys,
> > > 
> > > On 2020-10-24 02:07, Mathieu Poirier wrote:
> > > > On Fri, Oct 23, 2020 at 03:44:16PM +0200, Peter Zijlstra wrote:
> > > > > On Fri, Oct 23, 2020 at 02:29:54PM +0100, Suzuki Poulose wrote:
> > > > > > On 10/23/20 2:16 PM, Peter Zijlstra wrote:
> > > > > > > On Fri, Oct 23, 2020 at 01:56:47PM +0100, Suzuki Poulose wrote:
> > > > >
> > > > > > > > That way another session could use the same sink if it is free. i.e
> > > > > > > >
> > > > > > > > perf record -e cs_etm/@sink0/u --per-thread app1
> > > > > > > >
> > > > > > > > and
> > > > > > > >
> > > > > > > > perf record -e cs_etm/@sink0/u --per-thread app2
> > > > > > > >
> > > > > > > > both can work as long as the sink is not used by the other session.
> > > > > > >
> > > > > > > Like said above, if sink is shared between CPUs, that's going to be a
> > > > > > > trainwreck :/ Why do you want that?
> > > > > >
> > > > > > That ship has sailed. That is how the current generation of systems are,
> > > > > > unfortunately. But as I said, this is changing and there are guidelines
> > > > > > in place to avoid these kind of topologies. With the future
> > > > > > technologies, this will be completely gone.
> > > > >
> > > > > I understand that the hardware is like that, but why do you want to
> > > > > support this insanity in software?
> > > > >
> > > > > If you only allow a single sink user (group) at the same time, your
> > > > > problem goes away. Simply disallow the above scenario, do not allow
> > > > > concurrent sink users if sinks are shared like this.
> > > > >
> > > > > Have the perf-record of app2 above fail because the sink is in-user
> > > > > already.
> > > >
> > > > I agree with you that --per-thread scenarios are easy to deal with, but
> > > > to
> > > > support cpu-wide scenarios events must share a sink (because there is
> > > > one event
> > > > per CPU).  CPU-wide support can't be removed because it has been around
> > > > for close to a couple of years and heavily used. I also think using the
> > > > pid of
> > > > the process that created the events, i.e perf, is a good idea.  We just
> > > > need to
> > > > agree on how to gain access to it.
> > > >
> > > > In Sai's patch you objected to the following:
> > > >
> > > > > +     struct task_struct *task = READ_ONCE(event->owner);
> > > > > +
> > > > > +     if (!task || is_kernel_event(event))
> > > >
> > > > Would it be better to use task_nr_pid(current) instead of event->owner?
> > > > The end
> > > > result will be exactly the same.  There is also no need to check the
> > > > validity of
> > > > @current since it is a user process.
> > > >
> > > 
> > > We have devices deployed where these crashes are seen consistently,
> > > so for some immediate relief, could we atleast get some fix in this
> > > cycle without major design overhaul which would likely take more time.
> > > Perhaps my first patch [1] without any check for owner or
> > > I can post a new version as Suzuki suggested [2] dropping the export
> > > of is_kernel_event(). Then we can always work on top of it based on
> > > the
> > > conclusion of this discussion, we will atleast not have the systems
> > > crash in the meantime, thoughts?
> > 
> > For the time being I think [1], exactly the way it is, is a reasonable
> > way
> > forward.
> > 
> 
> Sure, I just checked now and [1] still applies neatly on top of coresight
> next branch.
> 
> [1] https://lore.kernel.org/patchwork/patch/1318098/

I have applied both patches that were part of the set.

> 
> Thanks,
> Sai
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
