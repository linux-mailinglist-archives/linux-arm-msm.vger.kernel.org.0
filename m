Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F34295D63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 13:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897291AbgJVLcZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 07:32:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2897289AbgJVLcZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 07:32:25 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A27D3C0613CE;
        Thu, 22 Oct 2020 04:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=H93ZL99+6WZCe8jHCr+h/wqqN11hUYMAzdxBzDI+Dbw=; b=bk7Yp65UlUI6KKE0OKLKl4eUea
        J5lLLVZmo57VrWKstXTbgO3+ReDHxzFw6F/uSiQTAumbww9DnzUNDsogqYdvLO9LPZmhf00HQwCcM
        4BeSujd9Vhb+PUGgl6nj3/r/AvvsqOtqlJMA2AtbvZfQ9z3jAfsRzjyWcuxT7q9lD0VfN/89uMwuC
        nD9iCpV+q5eBlrIFXppZ1OYAlYU0X+ecw5OrEG7/FhIZPk93hrZu1C2QnSG61/OKwT6yyUECuguo9
        1xU4CgacwiUKd3Fu5WFbnJshLkQvzlrUerSWBDkomAwF52yjnGv85rL1w3R9lqBXgJdxl1SdRY2IA
        VPxzjaXA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kVYpL-0006Fc-Nt; Thu, 22 Oct 2020 11:32:15 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 26722302753;
        Thu, 22 Oct 2020 13:32:14 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 15E6B203D0810; Thu, 22 Oct 2020 13:32:14 +0200 (CEST)
Date:   Thu, 22 Oct 2020 13:32:14 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
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
Message-ID: <20201022113214.GD2611@hirez.programming.kicks-ass.net>
References: <cover.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <aa6e571156d6e26e54da0bb3015ba474e4a08da0.1603363729.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa6e571156d6e26e54da0bb3015ba474e4a08da0.1603363729.git.saiprakash.ranjan@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 22, 2020 at 04:27:52PM +0530, Sai Prakash Ranjan wrote:

> Looking at the ETR and other places in the kernel, ETF and the
> ETB are the only places trying to dereference the task(owner)
> in tmc_enable_etf_sink_perf() which is also called from the
> sched_in path as in the call trace.

> @@ -391,6 +392,10 @@ static void *tmc_alloc_etf_buffer(struct coresight_device *csdev,
>  {
>  	int node;
>  	struct cs_buffers *buf;
> +	struct task_struct *task = READ_ONCE(event->owner);
> +
> +	if (!task || is_kernel_event(event))
> +		return NULL;


This is *wrong*... why do you care about who owns the events?

