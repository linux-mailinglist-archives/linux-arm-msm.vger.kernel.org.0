Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31D9C26914D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 18:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgINQUE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 12:20:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:39124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726349AbgINQT4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 12:19:56 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D0F88217BA;
        Mon, 14 Sep 2020 16:19:30 +0000 (UTC)
Date:   Mon, 14 Sep 2020 12:19:29 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Gaurav Kohli <gkohli@codeaurora.org>
Cc:     mingo@redhat.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] trace: Fix race in trace_open and buffer resize call
Message-ID: <20200914121929.69a2e6cc@gandalf.local.home>
In-Reply-To: <d4691a90-9a47-b946-f2cd-bb1fce3981b0@codeaurora.org>
References: <1599199797-25978-1-git-send-email-gkohli@codeaurora.org>
        <d4691a90-9a47-b946-f2cd-bb1fce3981b0@codeaurora.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 14 Sep 2020 10:00:50 +0530
Gaurav Kohli <gkohli@codeaurora.org> wrote:

> Hi Steven,
> 
> Please let us know, if below change looks good.
> Or let us know some other way to solve this.
> 
> Thanks,
> Gaurav
> 
> 

Hmm, for some reason, I don't see this in my INBOX, but it shows up in my
LKML folder. :-/


> 
> On 9/4/2020 11:39 AM, Gaurav Kohli wrote:
> > Below race can come, if trace_open and resize of
> > cpu buffer is running parallely on different cpus
> > CPUX                                CPUY
> > 				    ring_buffer_resize
> > 				    atomic_read(&buffer->resize_disabled)
> > tracing_open
> > tracing_reset_online_cpus
> > ring_buffer_reset_cpu
> > rb_reset_cpu
> > 				    rb_update_pages
> > 				    remove/insert pages
> > resetting pointer
> > This race can cause data abort or some times infinte loop in
> > rb_remove_pages and rb_insert_pages while checking pages
> > for sanity.
> > Take ring buffer lock in trace_open to avoid resetting of cpu buffer.
> > 
> > Signed-off-by: Gaurav Kohli <gkohli@codeaurora.org>
> > 
> > diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
> > index 136ea09..55f9115 100644
> > --- a/include/linux/ring_buffer.h
> > +++ b/include/linux/ring_buffer.h
> > @@ -163,6 +163,8 @@ bool ring_buffer_empty_cpu(struct trace_buffer *buffer, int cpu);
> >   
> >   void ring_buffer_record_disable(struct trace_buffer *buffer);
> >   void ring_buffer_record_enable(struct trace_buffer *buffer);
> > +void ring_buffer_mutex_acquire(struct trace_buffer *buffer);
> > +void ring_buffer_mutex_release(struct trace_buffer *buffer);
> >   void ring_buffer_record_off(struct trace_buffer *buffer);
> >   void ring_buffer_record_on(struct trace_buffer *buffer);
> >   bool ring_buffer_record_is_on(struct trace_buffer *buffer);
> > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > index 93ef0ab..638ec8f 100644
> > --- a/kernel/trace/ring_buffer.c
> > +++ b/kernel/trace/ring_buffer.c
> > @@ -3632,6 +3632,25 @@ void ring_buffer_record_enable(struct trace_buffer *buffer)
> >   EXPORT_SYMBOL_GPL(ring_buffer_record_enable);
> >   
> >   /**
> > + * ring_buffer_mutex_acquire - prevent resetting of buffer
> > + * during resize
> > + */
> > +void ring_buffer_mutex_acquire(struct trace_buffer *buffer)
> > +{
> > +	mutex_lock(&buffer->mutex);
> > +}
> > +EXPORT_SYMBOL_GPL(ring_buffer_mutex_acquire);
> > +
> > +/**
> > + * ring_buffer_mutex_release - prevent resetting of buffer
> > + * during resize
> > + */
> > +void ring_buffer_mutex_release(struct trace_buffer *buffer)
> > +{
> > +	mutex_unlock(&buffer->mutex);
> > +}
> > +EXPORT_SYMBOL_GPL(ring_buffer_mutex_release);

I really do not like to export these.

> > +/**
> >    * ring_buffer_record_off - stop all writes into the buffer
> >    * @buffer: The ring buffer to stop writes to.
> >    *
> > @@ -4918,6 +4937,8 @@ void ring_buffer_reset(struct trace_buffer *buffer)
> >   	struct ring_buffer_per_cpu *cpu_buffer;
> >   	int cpu;
> >   
> > +	/* prevent another thread from changing buffer sizes */
> > +	mutex_lock(&buffer->mutex);
> >   	for_each_buffer_cpu(buffer, cpu) {
> >   		cpu_buffer = buffer->buffers[cpu];
> >   
> > @@ -4936,6 +4957,7 @@ void ring_buffer_reset(struct trace_buffer *buffer)
> >   		atomic_dec(&cpu_buffer->record_disabled);
> >   		atomic_dec(&cpu_buffer->resize_disabled);
> >   	}
> > +	mutex_unlock(&buffer->mutex);
> >   }
> >   EXPORT_SYMBOL_GPL(ring_buffer_reset);
> >   
> > diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> > index f40d850..392e9aa 100644
> > --- a/kernel/trace/trace.c
> > +++ b/kernel/trace/trace.c
> > @@ -2006,6 +2006,8 @@ void tracing_reset_online_cpus(struct array_buffer *buf)
> >   	if (!buffer)
> >   		return;
> >   
> > +	ring_buffer_mutex_acquire(buffer);
> > +
> >   	ring_buffer_record_disable(buffer);

Hmm, why do we disable here as it gets disabled again in the call to
ring_buffer_reset_online_cpus()? Perhaps we don't need to disable the
buffer here. The only difference is that we have:

 buf->time_start = buffer_ftrace_now(buf, buf->cpu);

And that the above disables the entire buffer, whereas the reset only
resets individual ones.

But I don't think that will make any difference.

-- Steve


> >   
> >   	/* Make sure all commits have finished */
> > @@ -2016,6 +2018,8 @@ void tracing_reset_online_cpus(struct array_buffer *buf)
> >   	ring_buffer_reset_online_cpus(buffer);
> >   
> >   	ring_buffer_record_enable(buffer);
> > +
> > +	ring_buffer_mutex_release(buffer);
> >   }
> >   
> >   /* Must have trace_types_lock held */
> >   
> 

