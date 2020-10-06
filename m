Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8DDD2849F8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Oct 2020 12:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbgJFKBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Oct 2020 06:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgJFKB3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Oct 2020 06:01:29 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA9E3C061755;
        Tue,  6 Oct 2020 03:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=jVUYwgAhzl/IB96UJ0GcYwP2PTHlxrRCBvA19WBBrDE=; b=Xff+UJKvs/QJRrsUsNx0VBIo1N
        4v4fkCMKAOzHwLPhUKQuhEbrSsqzvpbb3+qvoSkBDfSpZWFffLfAnq1HatBUbIxY4CSj+ezd78jmM
        3Zv8+q0YDai8iexr1AQIktAMMorWertMpqwSDtlZmKFZzCAfn2TINw/FnBGJerZ0KaTmYEaJLY1ND
        tHRFDK18QEXI4fLkB91y73OsYfVcEM4C3bmyZdjGNLHGSQTeBElu9wHuSXQ2p5M9hqiy6RAAfEwxG
        DCoS2SpMW8w9DN+EiGmmpPVg3ah1uBBqcuB1drUS2Dog5ai+9uRMZXfFCJBXghfov2ujXr95aYBDG
        8wVsIRhg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kPjmW-0005BD-Ud; Tue, 06 Oct 2020 10:01:17 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E33C53019CE;
        Tue,  6 Oct 2020 12:01:13 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id B6350203C8BE2; Tue,  6 Oct 2020 12:01:13 +0200 (CEST)
Date:   Tue, 6 Oct 2020 12:01:13 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Rob Clark <robdclark@gmail.com>, Qais Yousef <qais.yousef@arm.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Tejun Heo <tj@kernel.org>, Tim Murray <timmurray@google.com>,
        Rob Clark <robdclark@chromium.org>,
        open list <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
Message-ID: <20201006100113.GP2628@hirez.programming.kicks-ass.net>
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <20201002110105.e56qrvzoqfioi4hs@e107158-lin.cambridge.arm.com>
 <CAF6AEGvWMvZuy7CcGhzUSbwGtEkrNkzWHu_BN1cbdBJdZtvevA@mail.gmail.com>
 <20201005150024.mchfdtd62rlkuh4s@e107158-lin.cambridge.arm.com>
 <CAF6AEGs7NmCPyLdg+gg5jTTe-wgi2myRQ80tum6odv6tLLQ0DQ@mail.gmail.com>
 <20201006090859.GW438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201006090859.GW438822@phenom.ffwll.local>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 06, 2020 at 11:08:59AM +0200, Daniel Vetter wrote:
> vblank work needs to preempt commit work.
> 
> Right now we don't have any driver requiring this, but if we e.g. roll out
> the gamma table update for i915, then this _has_ to happen in the vblank
> period.
> 
> Whereas the commit work can happen in there, but it can also be delayed a
> bit (until the vblank worker has finished) we will not miss any additional
> deadline due to that.
> 
> So that's why we have 2 levels. I'm not even sure you can model that with
> SCHED_DEADLINE, since essentially we need a few usec of cpu time very
> vblank (16ms normally), but thos few usec _must_ be scheduled within a
> very specific time slot or we're toast. And that vblank period is only
> 1-2ms usually.

Depends a bit on what the hardware gets us. If for example we're
provided an interrupt on vblank start, then that could wake a DEADLINE
job with (given your numbers above):

 .sched_period = 16ms,
 .sched_deadline = 1-2ms,
 .sched_runtime = 1-2ms,

The effective utilization of that task would be: 1-2/16.

> deadline has the upshot that it compose much better than SCHED_FIFO:
> Everyone just drops their deadline requirements onto the scheduler,
> scheduler makes sure it's all obeyed (or rejects your request).
> 
> The trouble is we'd need to know how long a commit takes, worst case, on a
> given platform. And for that you need to measure stuff, and we kinda can't
> spend a few minutes at boot-up going through the combinatorial maze of
> atomic commits to make sure we have it all.
> 
> So I think in practice letting userspace set the right rt priority/mode is
> the only way to go here :-/

Or you can have it adjust it's expected runtime as the system runs
(always keeping a little extra room over what you measure to make sure).

Given you have period > deadline, you can simply start with runtime =
deadline and adjust downwards during use (carefully).


