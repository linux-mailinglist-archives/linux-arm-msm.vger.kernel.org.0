Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B75F4297851
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 22:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756218AbgJWUhe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 16:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756136AbgJWUhd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 16:37:33 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC613C0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 13:37:33 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id b19so1604641pld.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 13:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CGGzYJFzvaAClgoRLNesvAoSeLjys7jFkN1Zjf9m1Mg=;
        b=YQ+zi25/jTA5S0YJD+eHWDE4qmiYDzQKrABHi4pdtuJsUIeyaRHwjp5l1TrhwJQyGt
         CJ8iMpPENPDlPNsAjIFBhS2wa0pK9Dt30CifMlddAjdoNOAV8OZQfFG4ZMY47Tb+3XyJ
         pR9Zz6mLi39wlcO/FSWM6qT9eXxzZ6DuF/gMqua1qjRi9reky7ZHkW+KM3VXy5oZwcX5
         gdKkthNHczliC1MZKI/uUSkP6QHBsxMVHjQIFHEZNGsr8bXI3tgxMh8LzgGvX6j1PgDq
         PDsr5cSlaJDlSDwwodCMYo5RTHEgYjzOt91miZwg02NAQKkkEQc1Xb92LjFOpiUF2O2a
         OPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CGGzYJFzvaAClgoRLNesvAoSeLjys7jFkN1Zjf9m1Mg=;
        b=Q3qgunzz4UBMKJ0lFyTtc6Xk8h+er90MlaC3T7OUBRl5Dv4rN2oeAPT175WZ78OC98
         dCmfznP3cYlM9PwD+wRPOto4cpO5nHtZ1w0/SkDUkR/UD38p2jILep01Uw49m4dLPLYR
         u0fF3oqVhDFP8gG3LOyVJEhtCn2yDYTKt2Rk3zB5x8rmLKN8vPckXoBCia62g3tIND3M
         CepT1w+JG0e15oL+91ZT1E5quB8dkraozYGw2Womo0d2TNikOZ8dZLLqRcH12QeVS8c9
         t3vCItBjI5sgZuaNVH6GwKpzTwErk0EMTulS37UCxe7HxlfhgamGgzdT/TrofPSpoS4g
         gqKw==
X-Gm-Message-State: AOAM533b6B2MH0fJpkl7k9gGdjO0q+0guioNwTDa062utmLqJW+hLwCX
        dR5IARkzOXYNFeKg5mkloTCrHQ==
X-Google-Smtp-Source: ABdhPJwuZEiGe28KTMKDAU/MsHgXJUs+YHE+Shscfvekf1Trif4cZAlWPZevIE9oKRHF7mHoEUnvEw==
X-Received: by 2002:a17:902:ba96:b029:d5:f36b:44af with SMTP id k22-20020a170902ba96b02900d5f36b44afmr654523pls.51.1603485453114;
        Fri, 23 Oct 2020 13:37:33 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id q4sm2874788pgj.44.2020.10.23.13.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 13:37:31 -0700 (PDT)
Date:   Fri, 23 Oct 2020 14:37:29 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Suzuki Poulose <suzuki.poulose@arm.com>,
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
Message-ID: <20201023203729.GA819775@xps15>
References: <20201022212033.GA646497@xps15>
 <20201023073905.GM2611@hirez.programming.kicks-ass.net>
 <174e6461-4d46-cb65-c094-c06ee3b21568@arm.com>
 <20201023094115.GR2611@hirez.programming.kicks-ass.net>
 <bd8c136d-9dfa-a760-31f9-eb8d6698aced@arm.com>
 <20201023105431.GM2594@hirez.programming.kicks-ass.net>
 <2457de8f-8bc3-b350-fdc7-61276da31ce6@arm.com>
 <20201023131628.GY2628@hirez.programming.kicks-ass.net>
 <728fd89c-78f2-0c5c-0443-c91c62b02f0e@arm.com>
 <20201023134416.GA2628@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201023134416.GA2628@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 23, 2020 at 03:44:16PM +0200, Peter Zijlstra wrote:
> On Fri, Oct 23, 2020 at 02:29:54PM +0100, Suzuki Poulose wrote:
> > On 10/23/20 2:16 PM, Peter Zijlstra wrote:
> > > On Fri, Oct 23, 2020 at 01:56:47PM +0100, Suzuki Poulose wrote:
> 
> > > > That way another session could use the same sink if it is free. i.e
> > > > 
> > > > perf record -e cs_etm/@sink0/u --per-thread app1
> > > > 
> > > > and
> > > > 
> > > > perf record -e cs_etm/@sink0/u --per-thread app2
> > > > 
> > > > both can work as long as the sink is not used by the other session.
> > > 
> > > Like said above, if sink is shared between CPUs, that's going to be a
> > > trainwreck :/ Why do you want that?
> > 
> > That ship has sailed. That is how the current generation of systems are,
> > unfortunately. But as I said, this is changing and there are guidelines
> > in place to avoid these kind of topologies. With the future
> > technologies, this will be completely gone.
> 
> I understand that the hardware is like that, but why do you want to
> support this insanity in software?
> 
> If you only allow a single sink user (group) at the same time, your
> problem goes away. Simply disallow the above scenario, do not allow
> concurrent sink users if sinks are shared like this.
> 
> Have the perf-record of app2 above fail because the sink is in-user
> already.

I agree with you that --per-thread scenarios are easy to deal with, but to
support cpu-wide scenarios events must share a sink (because there is one event
per CPU).  CPU-wide support can't be removed because it has been around
for close to a couple of years and heavily used. I also think using the pid of
the process that created the events, i.e perf, is a good idea.  We just need to
agree on how to gain access to it.

In Sai's patch you objected to the following:

> +     struct task_struct *task = READ_ONCE(event->owner);
> +
> +     if (!task || is_kernel_event(event))

Would it be better to use task_nr_pid(current) instead of event->owner?  The end
result will be exactly the same.  There is also no need to check the validity of
@current since it is a user process.

Thanks,
Mathieu 

[1]. https://elixir.bootlin.com/linux/latest/source/kernel/events/core.c#L6170

> 
> Only if the hardware has per-CPU sinks can you allow this.
