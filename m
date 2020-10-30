Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720562A0BA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 17:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgJ3QsK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 12:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgJ3QsK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 12:48:10 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12671C0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 09:48:10 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 133so5770558pfx.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 09:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wSEWtbWhI0R9DkaPMhQMnTY3fTZkSIH21v7K93YzkH0=;
        b=Pm5tPmOc2OXH3sg4QefPKFbCjKyDB5HJQGUHoeXG8betextZWa+omrfutWN2ZTC6To
         yXk3FJwR6pPlp0Ahzni1BTypMk/mPyp6C9XdLzTWzNOMvZDjYx8Xn9pPIWt5f+aVbim0
         gBcPOD6nj/Mnv8eDSYqGxd/MljUe2pO3KQnEIEcCpwbMlVMMK98pQRDTOtgqqMEwZrdT
         ZBR8qBaZWd+xggES0t7YY32orHHlz3MRtipXNBvn7V2Z/rFuJZpL794+JNYFuLJ78mwF
         jIHY2HDSvbf7/sKPdyqYBYVMpdlpPbgnu9ADbesY46YMUPmeCLN/opGyZYKILuuDwOxQ
         ds6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wSEWtbWhI0R9DkaPMhQMnTY3fTZkSIH21v7K93YzkH0=;
        b=FWKoARRayaoCENoDPWeggXr7jvieOmqOLqjzaBM1zFDnmPUaY3FgwEZCbPR0WHcuuw
         ACTSikF5liWi5eXvu3khYVmBtBSTY//ZjB1kTnZnuGPLMBLrKWHFh+iZMMZ+0WXQGCC2
         P0B+1S+Lc+xh9sPibaE1JbOKwbgf8DnbXWTsB1bxzH/uvhTIDqPh7v5/2KfTgOXW9a94
         yxgwFFxBm2Qp0Fir0vAF+dwDg4YiVHuUBv14DgD/uZLRkp7ffG8zp0f72SZkFaodYk+e
         OnGQfDu+uQ0n3OixjHnpNUHvY7ZyuM5lYsDo9210xKSmoYXy8uXI0qTrMuQBlDYZV2OL
         Hpxw==
X-Gm-Message-State: AOAM533iHu7kcYLtqrdsQ9smb/rU67JYSe989576bmtnbsLc+D4Eq8hB
        ngL2oP/+Vol5+g/Hi3QPX4coNw==
X-Google-Smtp-Source: ABdhPJwkbDqYTl7565CUkmpVtzCXGeHcVFB0EoSWg4z5M/YK/EXCpJP2KveoN6LQKcrhGIYvYlsnUA==
X-Received: by 2002:a63:74c:: with SMTP id 73mr2932647pgh.68.1604076489528;
        Fri, 30 Oct 2020 09:48:09 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id g16sm2727949pju.5.2020.10.30.09.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 09:48:08 -0700 (PDT)
Date:   Fri, 30 Oct 2020 10:48:06 -0600
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
Message-ID: <20201030164806.GB1301231@xps15>
References: <174e6461-4d46-cb65-c094-c06ee3b21568@arm.com>
 <20201023094115.GR2611@hirez.programming.kicks-ass.net>
 <bd8c136d-9dfa-a760-31f9-eb8d6698aced@arm.com>
 <20201023105431.GM2594@hirez.programming.kicks-ass.net>
 <2457de8f-8bc3-b350-fdc7-61276da31ce6@arm.com>
 <20201023131628.GY2628@hirez.programming.kicks-ass.net>
 <728fd89c-78f2-0c5c-0443-c91c62b02f0e@arm.com>
 <20201023134416.GA2628@hirez.programming.kicks-ass.net>
 <20201023203729.GA819775@xps15>
 <70e3a508af119be481c8f0a0acf0a44d@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70e3a508af119be481c8f0a0acf0a44d@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 30, 2020 at 01:29:56PM +0530, Sai Prakash Ranjan wrote:
> Hello guys,
> 
> On 2020-10-24 02:07, Mathieu Poirier wrote:
> > On Fri, Oct 23, 2020 at 03:44:16PM +0200, Peter Zijlstra wrote:
> > > On Fri, Oct 23, 2020 at 02:29:54PM +0100, Suzuki Poulose wrote:
> > > > On 10/23/20 2:16 PM, Peter Zijlstra wrote:
> > > > > On Fri, Oct 23, 2020 at 01:56:47PM +0100, Suzuki Poulose wrote:
> > > 
> > > > > > That way another session could use the same sink if it is free. i.e
> > > > > >
> > > > > > perf record -e cs_etm/@sink0/u --per-thread app1
> > > > > >
> > > > > > and
> > > > > >
> > > > > > perf record -e cs_etm/@sink0/u --per-thread app2
> > > > > >
> > > > > > both can work as long as the sink is not used by the other session.
> > > > >
> > > > > Like said above, if sink is shared between CPUs, that's going to be a
> > > > > trainwreck :/ Why do you want that?
> > > >
> > > > That ship has sailed. That is how the current generation of systems are,
> > > > unfortunately. But as I said, this is changing and there are guidelines
> > > > in place to avoid these kind of topologies. With the future
> > > > technologies, this will be completely gone.
> > > 
> > > I understand that the hardware is like that, but why do you want to
> > > support this insanity in software?
> > > 
> > > If you only allow a single sink user (group) at the same time, your
> > > problem goes away. Simply disallow the above scenario, do not allow
> > > concurrent sink users if sinks are shared like this.
> > > 
> > > Have the perf-record of app2 above fail because the sink is in-user
> > > already.
> > 
> > I agree with you that --per-thread scenarios are easy to deal with, but
> > to
> > support cpu-wide scenarios events must share a sink (because there is
> > one event
> > per CPU).  CPU-wide support can't be removed because it has been around
> > for close to a couple of years and heavily used. I also think using the
> > pid of
> > the process that created the events, i.e perf, is a good idea.  We just
> > need to
> > agree on how to gain access to it.
> > 
> > In Sai's patch you objected to the following:
> > 
> > > +     struct task_struct *task = READ_ONCE(event->owner);
> > > +
> > > +     if (!task || is_kernel_event(event))
> > 
> > Would it be better to use task_nr_pid(current) instead of event->owner?
> > The end
> > result will be exactly the same.  There is also no need to check the
> > validity of
> > @current since it is a user process.
> > 
> 
> We have devices deployed where these crashes are seen consistently,
> so for some immediate relief, could we atleast get some fix in this
> cycle without major design overhaul which would likely take more time.
> Perhaps my first patch [1] without any check for owner or
> I can post a new version as Suzuki suggested [2] dropping the export
> of is_kernel_event(). Then we can always work on top of it based on the
> conclusion of this discussion, we will atleast not have the systems
> crash in the meantime, thoughts?

For the time being I think [1], exactly the way it is, is a reasonable way
forward.

Regards,
Mathieu

> 
> [1] https://lore.kernel.org/patchwork/patch/1318098/
> [2]
> https://lore.kernel.org/lkml/fa6cdf34-88a0-1050-b9ea-556d0a9438cb@arm.com/
> 
> Thanks,
> Sai
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
