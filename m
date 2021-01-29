Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 681F530FA75
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 19:01:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238462AbhBDRr7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 12:47:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238441AbhBDRYb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 12:24:31 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C17F7C061788;
        Thu,  4 Feb 2021 09:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=G0ZiICELnT572thIosI7PE9Z9AIMFdeffhjU4wBEDBY=; b=gJyvre1gVVhhTmYNgtikqMop7M
        +b2jf1Lqy6+f5iFyWm7l6rq28y5FooyO291w45noJ4N/I2JqGkiSl4DL8uSMoWozMt81NG0tkqFAu
        Ex1OW8Zx9HVrFP/xDhT0vHQeEpPVtkyH9cJrmbrPykSiHuYF5aqej0+wK8GUkynfOgPicSMhAzSAJ
        4U8uaTq+D4336lyNp1b8qjXB7fLSSe4kkUDuPp0pQzCZWxGnXF5DeVxuy9WsogXMX+gpQuYQkZWr+
        NXNVVXB4vcdlj75jnPvQxQZbURI3wRqjqAqCTZ3H9elPwyZwrwExoN6pa4krPlcSv7j94lbYWvqcI
        KYTHDS8w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l7iLz-0001q3-8h; Thu, 04 Feb 2021 17:23:39 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id BC5D1981210; Fri, 29 Jan 2021 20:30:40 +0100 (CET)
Date:   Fri, 29 Jan 2021 20:30:40 +0100
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
        Namhyung Kim <namhyung@kernel.org>,
        Leo Yan <leo.yan@linaro.org>, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>,
        Denis Nikitin <denik@chromium.org>,
        Mattias Nissler <mnissler@chromium.org>,
        Al Grant <al.grant@arm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] perf/core: Add support to exclude kernel mode
 instruction tracing
Message-ID: <20210129193040.GJ8912@worktop.programming.kicks-ass.net>
References: <cover.1611909025.git.saiprakash.ranjan@codeaurora.org>
 <89c7ff59d887a0360434e607bd625393ec3190e5.1611909025.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89c7ff59d887a0360434e607bd625393ec3190e5.1611909025.git.saiprakash.ranjan@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jan 30, 2021 at 12:35:10AM +0530, Sai Prakash Ranjan wrote:

> Here the idea is to protect such important information from all users
> including root users since root privileges does not have to mean full
> control over the kernel [1] and root compromise does not have to be
> the end of the world.

And yet, your thing lacks:

> +config EXCLUDE_KERNEL_HW_ITRACE
> +	bool "Exclude kernel mode hardware assisted instruction tracing"
> +	depends on PERF_EVENTS
	depends on SECURITY_LOCKDOWN

or whatever the appropriate symbol is.

> +	help
> +	  Exclude kernel mode instruction tracing by hardware tracing
> +	  family such as ARM Coresight ETM, Intel PT and so on.
> +
> +	  This option allows to disable kernel mode instruction tracing
> +	  offered by hardware assisted tracing for all users(including root)
> +	  especially for production systems where only userspace tracing might
> +	  be preferred for security reasons.

Also, colour me unconvinced, pretty much all kernel level PMU usage
can be employed to side-channel / infer crypto keys, why focus on
ITRACE over others?
