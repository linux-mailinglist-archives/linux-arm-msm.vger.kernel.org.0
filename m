Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 009E3296010
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 15:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbgJVNe0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 09:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgJVNe0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 09:34:26 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6130AC0613CE;
        Thu, 22 Oct 2020 06:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Qxyx+8WuGLMGwiLrpDGgc0hdt6eMPydpMviwqwPoqUg=; b=Fl0AdssbEzOpX7eS1DBwN93QE8
        p64WFhpy6pR2iDC/1zS2vumFyDI6RIdwMJQjVXA+shrhJxMMnWhUOl6wIsCwXIaRjW+9RJs4xJMyr
        G+8PV/UJmCWoYpGpSv9PuIzwKE4CWHeoJRKcuKa0OrrPz9yUUYS1z+G683m7XJIwyATTWg45KDnt6
        aZyHcDhdA+2gBMfsU4Fz3kBZrguUBPzEAKmO7F79i7c8JdPu2lmk3ZzYaRehdq6OMkr3Cr5PK0zDD
        KqsA00IE1Yayi3Wu5VbzZxVKf690ofgUJgrdVXefr60yxRrvn0xSmxqekMx2x7kogGQsfY865vvb6
        i3Q6YTpw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kVajS-000189-2G; Thu, 22 Oct 2020 13:34:18 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 699363011C6;
        Thu, 22 Oct 2020 15:34:14 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 60603203CC499; Thu, 22 Oct 2020 15:34:14 +0200 (CEST)
Date:   Thu, 22 Oct 2020 15:34:14 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-kernel@vger.kernel.org,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Jiri Olsa <jolsa@redhat.com>,
        linux-arm-kernel@lists.infradead.org,
        Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCHv2 2/4] coresight: tmc-etf: Fix NULL ptr dereference in
 tmc_enable_etf_sink_perf()
Message-ID: <20201022133414.GH2611@hirez.programming.kicks-ass.net>
References: <cover.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <aa6e571156d6e26e54da0bb3015ba474e4a08da0.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <20201022113214.GD2611@hirez.programming.kicks-ass.net>
 <a6eadc723ae52396a655c61b9f8d4eef@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6eadc723ae52396a655c61b9f8d4eef@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 22, 2020 at 06:19:37PM +0530, Sai Prakash Ranjan wrote:
> On 2020-10-22 17:02, Peter Zijlstra wrote:
> > On Thu, Oct 22, 2020 at 04:27:52PM +0530, Sai Prakash Ranjan wrote:
> > 
> > > Looking at the ETR and other places in the kernel, ETF and the
> > > ETB are the only places trying to dereference the task(owner)
> > > in tmc_enable_etf_sink_perf() which is also called from the
> > > sched_in path as in the call trace.
> > 
> > > @@ -391,6 +392,10 @@ static void *tmc_alloc_etf_buffer(struct
> > > coresight_device *csdev,
> > >  {
> > >  	int node;
> > >  	struct cs_buffers *buf;
> > > +	struct task_struct *task = READ_ONCE(event->owner);
> > > +
> > > +	if (!task || is_kernel_event(event))
> > > +		return NULL;
> > 
> > 
> > This is *wrong*... why do you care about who owns the events?
> > 
> 
> The original issue was the owner being NULL and causing
> a NULL pointer dereference. I did ask some time back
> if it is valid for the owner to be NULL [1] and should
> probably be handled in events core?

No, what I asked is why do you care about ->owner to begin with? That
seems wrong. A driver should not touch ->owner _at_all_.
