Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5FDB296C43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 11:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S461606AbgJWJl0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 05:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S461592AbgJWJl0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 05:41:26 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E58C0613CE;
        Fri, 23 Oct 2020 02:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=71opRXk+CVt0coUz0FPhVzMU7R20E+INO+PfC/78r9s=; b=LCt7s0vsBWeNbFSqkiV4Hp8kGZ
        QtaThUO+HSqDN+ZhLsve9PrO3O/pZgUFRBq8PQ/XdJBL9ax2EJiDMn7njL7HpM//UfsWstDCOMq0d
        d4GUW8h92cGdr+DjhPnGjt+vOiNDKDigpj81EOphkW1mai1r56dek13logIPV8FMvFOTBOY0ELhWI
        BYeFSx3/GwueGQH+MQ8vJVHUk62MQIOjwYgn9Q9WGb/Ii5qjRt0DILOyii5zZf+JJ6FVj05kXBr5B
        N9PcJ+BJS/iJYiYp7ciesNoGqUYd7LkPiz+3GSzPKczgPTu3qyIuDF2eKzCjSmm9sPOvEfFpPQwua
        o3CsVZEQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kVtZU-0005So-Ov; Fri, 23 Oct 2020 09:41:16 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 698B7304D2B;
        Fri, 23 Oct 2020 11:41:15 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 5005E2B945263; Fri, 23 Oct 2020 11:41:15 +0200 (CEST)
Date:   Fri, 23 Oct 2020 11:41:15 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Suzuki Poulose <suzuki.poulose@arm.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
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
Message-ID: <20201023094115.GR2611@hirez.programming.kicks-ass.net>
References: <cover.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <aa6e571156d6e26e54da0bb3015ba474e4a08da0.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <20201022113214.GD2611@hirez.programming.kicks-ass.net>
 <e7d236f7-61c2-731d-571b-839e0e545563@arm.com>
 <20201022150609.GI2611@hirez.programming.kicks-ass.net>
 <788706f2-0670-b7b6-a153-3ec6f16e0f2e@arm.com>
 <20201022212033.GA646497@xps15>
 <20201023073905.GM2611@hirez.programming.kicks-ass.net>
 <174e6461-4d46-cb65-c094-c06ee3b21568@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174e6461-4d46-cb65-c094-c06ee3b21568@arm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 23, 2020 at 09:49:53AM +0100, Suzuki Poulose wrote:
> On 10/23/20 8:39 AM, Peter Zijlstra wrote:

> > So then I don't understand the !->owner issue, that only happens when
> > the task dies, which cannot be concurrent with event creation. Are you
> 
> Part of the patch from Sai, fixes this by avoiding the dereferencing
> after event creation (by caching it). But the kernel events needs
> fixing.

I'm fundamentally failing here. Creating a link to the sink is strictly
event-creation time. Why would you ever need it again later? Later you
already have the sink setup.
