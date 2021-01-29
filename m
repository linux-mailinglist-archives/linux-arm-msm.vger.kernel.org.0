Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86348308D72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Jan 2021 20:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232777AbhA2Tbr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Jan 2021 14:31:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232727AbhA2Tbr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Jan 2021 14:31:47 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 385E6C061573;
        Fri, 29 Jan 2021 11:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=G0ZiICELnT572thIosI7PE9Z9AIMFdeffhjU4wBEDBY=; b=OyXMh3h1KojvKpIaBonPsRaADj
        U1WWm4Oe0hpYyzRABWpLKhPKZEgMcECjhaDNHpw4atnSSIQLAQxyzffI+xXw3Rw33flpjbLegX3CA
        7Ew/NW2/dABBCR8pD9VQGZzvuMA8SVwdyqRdWoiSSbXE8ZLJnOA02GCJ8UCBELRCaa61EAKAHxayg
        fQlQVP5Io49ywTs6zGMy4aCOEUlpA3dhrAkN3CeR+0bYimZnDQoBzBdGUNwgJ6kgbBpq6jlux6RBh
        V6imSC1SuQDsX3eGheI9WqcJMHpdPxT1cnFuxdgm50qjeRqabAESbsKtYE/m38wmNx8cUEVjpv2Co
        cn/ns9eQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l5ZTg-00AE7B-Da; Fri, 29 Jan 2021 19:30:49 +0000
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
