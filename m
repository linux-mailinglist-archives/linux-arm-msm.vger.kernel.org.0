Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DCF4296A64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 09:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S375718AbgJWHj0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 03:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S375710AbgJWHjZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 03:39:25 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6128C0613CE;
        Fri, 23 Oct 2020 00:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=RXNgU3L9RTsqVTDZZkFay4Z6bQp0YxTtqnGNIWT18iA=; b=NHEaYBPpV812q/mi9oSzKLZJIb
        QJuGCecPTZLH6PR2aYdRQojMukbFrpIVXLhpdfHqQN6KSXkM2gmECc0EjKU8hMXeeDi6CkhzknUM3
        ZN0k/zQtof+u7l5pP9zds+/Oq3jVYdtJJctX6B1BqI8HuBJaDrPVpVTFgnjKEBSaqlhuzed+xbSvd
        uZSrhBqerCDSHn1UgWljK7CcWh3hUp7Np4RefJrQFqBuMmOmFCXM5dFMfPY4fgKazyavW8dfhZJ60
        TJuR1qzlLWDcTBfwbyD2sXmBlmH3Fyczv5PPozizGwAyVYDz+Ah/uh6ubGXP6VlaaSmpldFsjRhLW
        Wqd5Xr6g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kVrfG-0000sp-ME; Fri, 23 Oct 2020 07:39:07 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 85AB9304D2B;
        Fri, 23 Oct 2020 09:39:05 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 6D6FF203D09CB; Fri, 23 Oct 2020 09:39:05 +0200 (CEST)
Date:   Fri, 23 Oct 2020 09:39:05 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
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
Message-ID: <20201023073905.GM2611@hirez.programming.kicks-ass.net>
References: <cover.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <aa6e571156d6e26e54da0bb3015ba474e4a08da0.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <20201022113214.GD2611@hirez.programming.kicks-ass.net>
 <e7d236f7-61c2-731d-571b-839e0e545563@arm.com>
 <20201022150609.GI2611@hirez.programming.kicks-ass.net>
 <788706f2-0670-b7b6-a153-3ec6f16e0f2e@arm.com>
 <20201022212033.GA646497@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201022212033.GA646497@xps15>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 22, 2020 at 03:20:33PM -0600, Mathieu Poirier wrote:
> Suzuki's depiction of the usecase is accurate.  Using the pid of the process
> that created the events comes out of a discussion you and I had in the common
> area by the Intel booth at ELC in Edinburgh in the fall of 2018.  At the time I
> exposed the problem of having multiple events sharing the same HW resources and
> you advised to proceed this way.

Bah, I was afraid of that. I desperately tried to find correspondence on
it, but alas, verbal crap doesn't end up in the Sent folder :-/

> That being said it is plausible that I did not expressed myself clearly enough
> for you to understand the full extend of the problem.  If that is the case we
> are more than willing to revisit that solution.  Do you see a better option than
> what has currently been implemented?

Moo... that really could've done with a comment I suppose.

So then I don't understand the !->owner issue, that only happens when
the task dies, which cannot be concurrent with event creation. Are you
somehow accessing ->owner later?

As for the kernel events.. why do you care about the actual task_struct
* in there? I see you're using it to grab the task-pid, but how is that
useful?
