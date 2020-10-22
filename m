Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A2D296673
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 23:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S372239AbgJVVUh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 17:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S372217AbgJVVUg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 17:20:36 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88EEBC0613CE
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 14:20:36 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id f19so2021173pfj.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 14:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YsUSHc5bYUNmuFMA3WRkMmx4GDjXmb6yOh7O9xZbDRc=;
        b=N/0AvT8+Hmb3Rp8IZcUtW/xq7QBs+gg8I6Im+7uExqg6EoLb9sXgBZz51+CZ+qnUuh
         SBx7rgrojGMMIHQoHOr/JSqOuFR35YDeN14XDliCDF1gmzKsxxor3D8TtwnO43MDPC3L
         CitQN82Mgy21Xnf1OAs2eG/ca46bJrn/G+FZFpfdhEhmZeLLBGNYI7z77kJTWcUthBRO
         Kk3lUArNhh5snSxjzXB2p10AvB+shf/2Uk2zAiCQDT+lB0BhYAX7x4T8RBuZ9X8Pse+3
         VXgbuUmLljtDtL/KxQc23w1wka+dptL4JtJPQP4cXFKa2oImmbpxw01grfDWRrQXPkl8
         0huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YsUSHc5bYUNmuFMA3WRkMmx4GDjXmb6yOh7O9xZbDRc=;
        b=HIdxQW+NzL4q4tLnHjvQnAqOhdp+93ZmUl/SavMeBeMNu9iQvTaf0Vkfmtpmy1Zz4w
         fR0QY/2PmPzezWCxS6n59riVqkiFbSjTSFcBkgX3uIRjSqzhaLi8k+wmNEGWkAyusoSE
         /vjJAVPUZ9sauddUNSaEWIeDK/YM8zXbKjbqTMnoJifFVn4ENBeP3gn9VGrBxITsSxLe
         fo4U3UxjBpaPLSeJ2lHzZ+vIdpm6fu/JqRXsFK2xV/y8QP6HtS3lY/JypMPqtYPkGff2
         QvSdyTpvmepbemqJEWSSYrB6IUeUN6ucTbZKYB9+1MHL6pkMtsRolL4gdOi0AeDPEBQW
         FTsg==
X-Gm-Message-State: AOAM531wdftVBaASMPzJxC7DFaJqUDftHxHFaYNhn7SwFh475jAUNXPD
        lkURI6shYvHa3FxBIbO8pabwYw==
X-Google-Smtp-Source: ABdhPJz+Cp9vygopwE/M6gjCd4Vr2adBC00b2KaBAjRV6HQipRCfUo6ON+X5DoToZl8Q4eAKTSdMMg==
X-Received: by 2002:a17:90a:f504:: with SMTP id cs4mr3832476pjb.134.1603401636089;
        Thu, 22 Oct 2020 14:20:36 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j23sm3154622pgm.76.2020.10.22.14.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 14:20:35 -0700 (PDT)
Date:   Thu, 22 Oct 2020 15:20:33 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suzuki Poulose <suzuki.poulose@arm.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <20201022212033.GA646497@xps15>
References: <cover.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <aa6e571156d6e26e54da0bb3015ba474e4a08da0.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <20201022113214.GD2611@hirez.programming.kicks-ass.net>
 <e7d236f7-61c2-731d-571b-839e0e545563@arm.com>
 <20201022150609.GI2611@hirez.programming.kicks-ass.net>
 <788706f2-0670-b7b6-a153-3ec6f16e0f2e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <788706f2-0670-b7b6-a153-3ec6f16e0f2e@arm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Peter,

On Thu, Oct 22, 2020 at 04:32:36PM +0100, Suzuki Poulose wrote:
> On 10/22/20 4:06 PM, Peter Zijlstra wrote:
> > On Thu, Oct 22, 2020 at 02:30:21PM +0100, Suzuki Poulose wrote:
> > > On 10/22/20 12:32 PM, Peter Zijlstra wrote:
> > > > On Thu, Oct 22, 2020 at 04:27:52PM +0530, Sai Prakash Ranjan wrote:
> > > > 
> > > > > Looking at the ETR and other places in the kernel, ETF and the
> > > > > ETB are the only places trying to dereference the task(owner)
> > > > > in tmc_enable_etf_sink_perf() which is also called from the
> > > > > sched_in path as in the call trace.
> > > > 
> > > > > @@ -391,6 +392,10 @@ static void *tmc_alloc_etf_buffer(struct coresight_device *csdev,
> > > > >    {
> > > > >    	int node;
> > > > >    	struct cs_buffers *buf;
> > > > > +	struct task_struct *task = READ_ONCE(event->owner);
> > > > > +
> > > > > +	if (!task || is_kernel_event(event))
> > > > > +		return NULL;
> > > > 
> > > > 
> > > > This is *wrong*... why do you care about who owns the events?
> > > > 
> > > 
> > > This is due to the special case of the CoreSight configuration, where
> > > a "sink" (where the trace data is captured) is shared by multiple Trace
> > > units. So, we could share the "sink" for multiple trace units if they
> > > are tracing the events that belong to the same "perf" session. (The
> > > userspace tool could decode the trace data based on the TraceID
> > > in the trace packets). Is there a better way to do this ?
> > 
> > I thought we added sink identification through perf_event_attr::config2
> > ?
> > 
> 
> Correct. attr:config2 identifies the "sink" for the collection. But,
> that doesn't solve the problem we have here. If two separate perf
> sessions use the "same sink", we don't want to mix the
> trace data into the same sink for events from different sessions.
> 
> Thus, we need a way to check if a new event starting the tracing on
> an ETM belongs to the same session as the one already pumping the trace
> into the sink.

Suzuki's depiction of the usecase is accurate.  Using the pid of the process
that created the events comes out of a discussion you and I had in the common
area by the Intel booth at ELC in Edinburgh in the fall of 2018.  At the time I
exposed the problem of having multiple events sharing the same HW resources and
you advised to proceed this way.

That being said it is plausible that I did not expressed myself clearly enough
for you to understand the full extend of the problem.  If that is the case we
are more than willing to revisit that solution.  Do you see a better option than
what has currently been implemented?

Many thanks,
Mathieu

> 
> We use event->owner pid for this check and thats where we encountered
> a NULL event->owner. Looking at the code further, we identified that
> kernel events could also trigger this issue.
> 
> Suzuki
