Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9F56158E51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 13:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728547AbgBKMUr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 07:20:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:48768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728740AbgBKMUr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 07:20:47 -0500
Received: from localhost (unknown [209.37.97.194])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 55A6620842;
        Tue, 11 Feb 2020 12:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581423646;
        bh=9MQTtIlD4MIDKhQisnnow0DKeJ2MXGMRx580MlaZaIg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BF7RRqQik5KJN+K8KXG2DuHNLQDE1XEYtgXgqssdDG1EjFhReLYHCYhEJIXLTrmUQ
         nHs0HSHSrGJE2r9CIRcoYMW9wBKqCBEI242Taz7XSpkG52BA9Im+QE//gxX9KWlTH1
         qWWwuZunfe9R3doIQ1WNN8hdGF0Rq+IZoU0tkiKY=
Date:   Tue, 11 Feb 2020 04:20:46 -0800
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Gaurav Kohli <gkohli@codeaurora.org>
Cc:     akpm@linux-foundation.org,
        linux-kernel <linux-kernel@vger.kernel.org>, tglx@linutronix.de,
        linux-arm-msm@vger.kernel.org, neeraju@codeaurora.org
Subject: Re: Query: Regarding Notifier chain callback debugging or profiling
Message-ID: <20200211122046.GE1856500@kroah.com>
References: <82d5b63e-4ae6-fb5f-8a1c-2d5755db2638@codeaurora.org>
 <6e077b43-6c9e-3f4e-e079-db438e36a4eb@codeaurora.org>
 <20200210210626.GA1373304@kroah.com>
 <9d3206f9-5554-1f1d-7ee0-61fdcdf3070e@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d3206f9-5554-1f1d-7ee0-61fdcdf3070e@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 11, 2020 at 10:16:03AM +0530, Gaurav Kohli wrote:
> 
> 
> On 2/11/2020 2:36 AM, Greg KH wrote:
> > On Mon, Feb 10, 2020 at 05:26:16PM +0530, Gaurav Kohli wrote:
> > > Hi,
> > > 
> > > In Linux kernel, everywhere we are using notification chains to notify for
> > > any kernel events, But we don't have any debugging or profiling mechanism to
> > > know which callback is taking time or currently we are stuck on which call
> > > back(without dumps it is difficult to say for last problem)
> > 
> > Callbacks are a mess, I agree.
> > 
> > > Below are the few ways, which we can implement to profile callback on need
> > > basis:
> > > 
> > > 1) Use trace event before and after callback:
> > > 
> > > static int notifier_call_chain(struct notifier_block **nl,
> > >                                 unsigned long val, void *v,
> > >                                 int nr_to_call, int *nr_calls)
> > > {
> > >          int ret = NOTIFY_DONE;
> > >          struct notifier_block *nb, *next_nb;
> > > 
> > > 
> > > +		trace_event for entry of callback
> > >                  ret = nb->notifier_call(nb, val, v);
> > > +		trace_event for exit of callback
> > 
> > Ick.
> > 
> > >          }
> > >          return ret;
> > > }
> > > 
> > > 2) Or use pr_debug instead of trace_event
> > > 
> > > 3) Both of the above approach has certain problems, like it will dump
> > > callback for each notifier chain, which might flood trace buffer or dmesg.
> > > 
> > > So we can use bool variable to control that and dump the required
> > > notification chain only.
> > > 
> > > Some thing like below we can use:
> > > 
> > >   struct srcu_notifier_head {
> > >          struct mutex mutex;
> > >          struct srcu_struct srcu;
> > >          struct notifier_block __rcu *head;
> > > +       bool debug_callback;
> > >   };
> > > 
> > > 
> > >   static int notifier_call_chain(struct notifier_block **nl,
> > >                                 unsigned long val, void *v,
> > > -                              int nr_to_call, int *nr_calls)
> > > +                              int nr_to_call, int *nr_calls, bool
> > > debug_callback)
> > >   {
> > >          int ret = NOTIFY_DONE;
> > >          struct notifier_block *nb, *next_nb;
> > > @@ -526,6 +526,7 @@ void srcu_init_notifier_head(struct srcu_notifier_head
> > > *nh)
> > >          if (init_srcu_struct(&nh->srcu) < 0)
> > >                  BUG();
> > >          nh->head = NULL;
> > > +       nh->debug_callback = false; -> by default it would be false for
> > > every notifier chain.
> > > 
> > > 4) we can also think of something pre and post function, before and after
> > > each callback, And we can enable only for those who wants to profile.
> > > 
> > > Please let us what approach we can use, or please suggest some debugging
> > > mechanism for the same.
> > 
> > Why not just pay attention to the specific notifier you want?  Trace
> > when the specific blocking_notifier_call_chain() is called.
> > 
> > What specific notifier call chain is causing you problems that you need
> > to debug?
> 
> Thanks Greg for the reply.
> I agree, we can trace specific notifier chain, but that is very hacky(we
> have to add debug code here and there when problems comes)
> 
> We are using lot of SRCU notifier callchain to notify clients for events,
> And if we have something generic debugging mechanism, we just have to switch
> on for that particular client for initial testing phase.

Why are you using SRCU notifier chains for events?

What are you using them for like this, what in-kernel code is this so
that I can see what you are doing?

That feels like a very slow way of doing things, especially given the
recent changes in compilers due to Spectre issues.

> As mentioned above, if we can come up with something like below then only
> client has to switch on who wants to debug:
> >>   struct srcu_notifier_head {
> >>          struct mutex mutex;
> >>          struct srcu_struct srcu;
> >>          struct notifier_block __rcu *head;
> >> +       bool debug_callback; -> this we can turn on for particular
> client.
> >>   };
> 
> Right now we don't have any generic way to debug notifier chains, please
> suggest some approach. On live target, it is difficult to say where
> notification chain got stuck.

I suggest not using notifier chains for events :)

Seriously, try something local for your specific notifiers first.  It
should be easy to just add tracing for all of them using ftrace or bpf,
right?

thanks,

greg k-h
