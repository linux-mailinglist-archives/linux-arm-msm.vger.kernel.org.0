Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE5E2743BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 16:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgIVOA2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 10:00:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:47306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726579AbgIVOA1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 10:00:27 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D8A2C20719;
        Tue, 22 Sep 2020 14:00:26 +0000 (UTC)
Date:   Tue, 22 Sep 2020 10:00:25 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Gaurav Kohli <gkohli@codeaurora.org>
Cc:     mingo@redhat.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] trace: Fix race in trace_open and buffer resize call
Message-ID: <20200922100025.5c57f490@gandalf.local.home>
In-Reply-To: <17b53f76-fa90-0086-8a9e-de166b789e60@codeaurora.org>
References: <1599199797-25978-1-git-send-email-gkohli@codeaurora.org>
        <d4691a90-9a47-b946-f2cd-bb1fce3981b0@codeaurora.org>
        <2fe2a843-e2b5-acf8-22e4-7231d24a9382@codeaurora.org>
        <20200915092353.5b805468@gandalf.local.home>
        <08d6f338-3be3-c5a2-ba4b-0116de9672c2@codeaurora.org>
        <20200915141304.41fa7c30@gandalf.local.home>
        <17b53f76-fa90-0086-8a9e-de166b789e60@codeaurora.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sorry for not replying sooner, my email is still rather full from my 10 day
vacation, and I'm still in "skimming" mode at looking at it.

On Wed, 16 Sep 2020 12:02:46 +0530
Gaurav Kohli <gkohli@codeaurora.org> wrote:


> >> Yes, got your point. then we can avoid export. Actually we are seeing
> >> issue in older kernel like 4.19/4.14/5.4 and there below patch was not
> >> present in stable branches:
> >>
> >> ommit b23d7a5f4a07 ("ring-buffer: speed up buffer resets by  
> >>   > avoiding synchronize_rcu for each CPU")  
> > 
> > If you mark this patch for stable, you can add:
> > 
> > Depends-on: b23d7a5f4a07 ("ring-buffer: speed up buffer resets by avoiding synchronize_rcu for each CPU")
> >   
> 
> Thanks Steven, Yes this needs to be back ported. I have tried this in 
> 5.4 but this need more patches like
> 13292494379f92f532de71b31a54018336adc589
> tracing: Make struct ring_buffer less ambiguous

No, that is not needed. That's just a trivial renaming of structures. Use
the old structure. Dependency is if the algorithm depends on the change.
Not cosmetic.

> 
> Instead of protecting all reset, can we do it individually like below:
> 
> 
> +++ b/kernel/trace/ring_buffer.c
> @@ -4838,7 +4838,9 @@ rb_reset_cpu(struct ring_buffer_per_cpu *cpu_buffer)
>   static void reset_disabled_cpu_buffer(struct ring_buffer_per_cpu 
> *cpu_buffer)
>   {
>          unsigned long flags;
> +       struct trace_buffer *buffer = cpu_buffer->buffer;
> 
> +       mutex_lock(&buffer->mutex);
>          raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
> 
>          if (RB_WARN_ON(cpu_buffer, local_read(&cpu_buffer->committing)))
> @@ -4852,6 +4854,7 @@ static void reset_disabled_cpu_buffer(struct 
> ring_buffer_per_cpu *cpu_buffer)
> 
>    out:
>          raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
> +       mutex_unlock(&buffer->mutex);
>   }
> 
> Please let me know, if above looks good, we will do testing with this.
> And this we can directly use in older kernel as well in 
> ring_buffer_reset_cpu.

No that will not work. You need the lock around the disabling of the
buffers and the synchronizing with RCU.

-- Steve
