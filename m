Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F00429616A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 17:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2901104AbgJVPGX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 11:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2901103AbgJVPGX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 11:06:23 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A593CC0613CE;
        Thu, 22 Oct 2020 08:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=qOlWPg0bC1NWd34FmUCHzoVruWTwluBkXAwb9GIDaWs=; b=SbTY4rX1WvslbubYBPa9ihCpd/
        qtCx5W8pkT2O6U1dDXpb3yA6FKGPjNvZAq7Avs8cpVrDlt7cfSPIiAz3EMr2lCU4UWCAMPsPt4Fx2
        0F0V2V830Fykt3zjSzDt2TcmRB4F2Opsy9tf/aw8AcpKhKH206VrrOKBARdBmUy60zuMuDuoPpJIa
        Vm/vNDob23cO+CP29rrwRFcuwrUshhq4XgwSJapNsfaGHKTHj+yrBs80JBTyjHDezaeC7XDe9RSv9
        vmMPJgIiY7mC3SbE6ad2TPYnRmBDbYlLc3lQ24YWGYk5K36Srm81bDkKPotH23IKMA7ndda3zZ2wj
        Guz1aPZw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kVcAP-0004Kr-Bo; Thu, 22 Oct 2020 15:06:13 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A4C0D3011C6;
        Thu, 22 Oct 2020 17:06:09 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 725A9203D0827; Thu, 22 Oct 2020 17:06:09 +0200 (CEST)
Date:   Thu, 22 Oct 2020 17:06:09 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Suzuki Poulose <suzuki.poulose@arm.com>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
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
Message-ID: <20201022150609.GI2611@hirez.programming.kicks-ass.net>
References: <cover.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <aa6e571156d6e26e54da0bb3015ba474e4a08da0.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <20201022113214.GD2611@hirez.programming.kicks-ass.net>
 <e7d236f7-61c2-731d-571b-839e0e545563@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7d236f7-61c2-731d-571b-839e0e545563@arm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 22, 2020 at 02:30:21PM +0100, Suzuki Poulose wrote:
> On 10/22/20 12:32 PM, Peter Zijlstra wrote:
> > On Thu, Oct 22, 2020 at 04:27:52PM +0530, Sai Prakash Ranjan wrote:
> > 
> > > Looking at the ETR and other places in the kernel, ETF and the
> > > ETB are the only places trying to dereference the task(owner)
> > > in tmc_enable_etf_sink_perf() which is also called from the
> > > sched_in path as in the call trace.
> > 
> > > @@ -391,6 +392,10 @@ static void *tmc_alloc_etf_buffer(struct coresight_device *csdev,
> > >   {
> > >   	int node;
> > >   	struct cs_buffers *buf;
> > > +	struct task_struct *task = READ_ONCE(event->owner);
> > > +
> > > +	if (!task || is_kernel_event(event))
> > > +		return NULL;
> > 
> > 
> > This is *wrong*... why do you care about who owns the events?
> > 
> 
> This is due to the special case of the CoreSight configuration, where
> a "sink" (where the trace data is captured) is shared by multiple Trace
> units. So, we could share the "sink" for multiple trace units if they
> are tracing the events that belong to the same "perf" session. (The
> userspace tool could decode the trace data based on the TraceID
> in the trace packets). Is there a better way to do this ?

I thought we added sink identification through perf_event_attr::config2
?
