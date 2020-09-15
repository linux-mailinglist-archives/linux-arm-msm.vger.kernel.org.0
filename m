Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A3426AC07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 20:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbgIOSd4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 14:33:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:40912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727970AbgIOSNI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 14:13:08 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D631F20936;
        Tue, 15 Sep 2020 18:13:05 +0000 (UTC)
Date:   Tue, 15 Sep 2020 14:13:04 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Gaurav Kohli <gkohli@codeaurora.org>
Cc:     mingo@redhat.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] trace: Fix race in trace_open and buffer resize call
Message-ID: <20200915141304.41fa7c30@gandalf.local.home>
In-Reply-To: <08d6f338-3be3-c5a2-ba4b-0116de9672c2@codeaurora.org>
References: <1599199797-25978-1-git-send-email-gkohli@codeaurora.org>
        <d4691a90-9a47-b946-f2cd-bb1fce3981b0@codeaurora.org>
        <2fe2a843-e2b5-acf8-22e4-7231d24a9382@codeaurora.org>
        <20200915092353.5b805468@gandalf.local.home>
        <08d6f338-3be3-c5a2-ba4b-0116de9672c2@codeaurora.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 15 Sep 2020 22:53:32 +0530
Gaurav Kohli <gkohli@codeaurora.org> wrote:

> On 9/15/2020 6:53 PM, Steven Rostedt wrote:
> > On Tue, 15 Sep 2020 10:38:03 +0530
> > Gaurav Kohli <gkohli@codeaurora.org> wrote:
> >   
> >>  
> >>   >>> +void ring_buffer_mutex_release(struct trace_buffer *buffer)
> >>   >>> +{
> >>   >>> +    mutex_unlock(&buffer->mutex);
> >>   >>> +}
> >>   >>> +EXPORT_SYMBOL_GPL(ring_buffer_mutex_release);  
> >>   >
> >>   > I really do not like to export these.
> >>   >  
> >>
> >> Actually available reader lock is not helping
> >> here(&cpu_buffer->reader_lock), So i took ring buffer mutex lock to
> >> resolve this(this came on 4.19/5.4), in latest tip it is trace buffer
> >> lock. Due to this i have exported api.  
> > 
> > I'm saying, why don't you take the buffer->mutex in the
> > ring_buffer_reset_online_cpus() function? And remove all the protection in
> > tracing_reset_online_cpus()?  
> 
> Yes, got your point. then we can avoid export. Actually we are seeing 
> issue in older kernel like 4.19/4.14/5.4 and there below patch was not 
> present in stable branches:
> 
> ommit b23d7a5f4a07 ("ring-buffer: speed up buffer resets by
>  > avoiding synchronize_rcu for each CPU")  

If you mark this patch for stable, you can add:

Depends-on: b23d7a5f4a07 ("ring-buffer: speed up buffer resets by avoiding synchronize_rcu for each CPU")  

> 
> Actually i have also thought to take mutex lock in ring_buffer_reset_cpu
> while doing individual cpu reset, but this could cause another problem:

Hmm, I think we should also take the buffer lock in the reset_cpu() call
too, and modify tracing_reset_cpu() the same way.

> 
> Different cpu buffer may have different state, so i have taken lock in 
> tracing_reset_online_cpus.

Why would different states be an issue in synchronizing?

-- Steve

> >
> > void tracing_reset_online_cpus(struct array_buffer *buf)
> > {
> > 	struct trace_buffer *buffer = buf->buffer;
> > 
> > 	if (!buffer)
> > 		return;
> > 
> > 	buf->time_start = buffer_ftrace_now(buf, buf->cpu);
> > 
> > 	ring_buffer_reset_online_cpus(buffer);
> > }
> > 
> > The reset_online_cpus() is already doing the synchronization, we don't need
> > to do it twice.
> > 
> > I believe commit b23d7a5f4a07 ("ring-buffer: speed up buffer resets by
> > avoiding synchronize_rcu for each CPU") made the synchronization in
> > tracing_reset_online_cpus() obsolete.
> > 
> > -- Steve
> >   
> 
> Yes, with above patch no need to take lock in tracing_reset_online_cpus.

