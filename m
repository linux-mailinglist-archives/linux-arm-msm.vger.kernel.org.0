Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0AB30A8F7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Feb 2021 14:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231750AbhBANmf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Feb 2021 08:42:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231308AbhBANmd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Feb 2021 08:42:33 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C235C061573;
        Mon,  1 Feb 2021 05:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=bU766lYCXPgOdHHgx/QYfVKqikbkYZZcWgGhL3Pb1pE=; b=o5dzoXGjMNCKadF6L6XQEABvMM
        vPZMGfD2U4PeWVkwI7Gmh2s1Y+yEMC4BO889J/d6NzzAnOMaBMpHAARXn4HGuOxcwCGWAVlTfqy/x
        2ZZE+1XisVt8Y6qiWJvRNtV7FRv+dX8cfrJBqg1hlrmY3Nbj1Hir9uRsThfJPCSzAs+VoUadXvh/3
        Xj5XlSP2Ga01nuyPokdLmQxW+FpiP5nv21/Utfba96pB7BL7FWSgtjH39sY/dYxatpOTJRX0P9/kK
        uSW/sp+VQktT0fMBRQo2XrTS0L+NxWqgNI9HEVWSrPOQU02DHr7ONWgD3NPWdrxIMDRQ28lKWtqMK
        lSQfjwFA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l6ZSQ-00Dpfr-4B; Mon, 01 Feb 2021 13:41:34 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3E47F3003D8;
        Mon,  1 Feb 2021 14:41:33 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 21B3C20C8E303; Mon,  1 Feb 2021 14:41:33 +0100 (CET)
Date:   Mon, 1 Feb 2021 14:41:33 +0100
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
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jannh@google.com
Subject: Re: [PATCH 1/4] perf/core: Add support to exclude kernel mode
 instruction tracing
Message-ID: <YBgFDXgX57y5XzOn@hirez.programming.kicks-ass.net>
References: <cover.1611909025.git.saiprakash.ranjan@codeaurora.org>
 <89c7ff59d887a0360434e607bd625393ec3190e5.1611909025.git.saiprakash.ranjan@codeaurora.org>
 <20210129193040.GJ8912@worktop.programming.kicks-ass.net>
 <3c96026b544c2244e57b46119427b8a0@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c96026b544c2244e57b46119427b8a0@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 01, 2021 at 01:11:04PM +0530, Sai Prakash Ranjan wrote:

> Ok I suppose you mean CONFIG_SECURITY_LOCKDOWN_LSM? But I don't see
> how this new config has to depend on that? This can work independently
> whether complete lockdown is enforced or not since it applies to only
> hardware instruction tracing. Ideally this depends on several hardware
> tracing configs such as ETMs and others but we don't need them because
> we are already exposing PERF_PMU_CAP_ITRACE check in the events core.

If you don't have lockdown, root pretty much owns the kernel, or am I
missing something?

> be used for some speculative execution based attacks. Which other
> kernel level PMUs can be used to get a full branch trace that is not
> locked down? If there is one, then this should probably be applied to
> it as well.

Just the regular counters. The information isn't as accurate, but given
enough goes you can infer plenty.

Just like all the SMT size-channel attacks.

Sure, PT and friends make it even easier, but I don't see a fundamental
distinction.
