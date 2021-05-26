Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB4BE390DA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 03:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbhEZBBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 21:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbhEZBBb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 21:01:31 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7436DC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 17:59:59 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id t10-20020a05683022eab0290304ed8bc759so30422499otc.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 17:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NjrHFQBrBgmCbBNV4QZKo4mFLbuHzTnqDUF5SJUKcaY=;
        b=GCqsUxCtjlppSkCqvJ3Kn8XW8m9bj7+kw/gIM3YrcpPIp+brZK3TmTIm+DL/EEvd75
         Nai/m/uPYcY5bdCD/x1U2v/ZwqtKSnPhf9GcA5QYJr9DJBzu/jFZQYX8tQf84jfGZPVK
         rfuPk17j6zAZC3fXlgG/EOe+sgl9AlnPqW/sWjCrky5KFOoH9pke1R9GGG6/8tZgQK4T
         yw4R5d/yuCjwoSVM5rMDXouDMslq2tc0htf+r938cB5adIwIyBY0y48sQrP/W0OuIJ6U
         3UGujDsXeI+R4fD3RCg1+upTJ/LjaWsdPE1yxtQ1H7bS8KNomvc4aJQgJERRAyYaVvoX
         O3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NjrHFQBrBgmCbBNV4QZKo4mFLbuHzTnqDUF5SJUKcaY=;
        b=r1sGikGJyfN5rIMu6kLMJLYHaaegDO4ib5pzA6lE8NnY7E5bR/rS/L6xhbz0rCmp5C
         Z+oClAlq3I8+MJa33vVAxv/mzlNMscCPEYXprpkSqNdraiz2I5jCsBbtYhSAH9skjKgu
         SVAjWV2tlwMa+s+TxpH8RvcyGP6VM5Zo/FLVTtr5zxxhKSWYopJypM1w5lmkkCbc9NYz
         pvtu8vyeJz0LN2342jUKPhAldgEVW7yImLB3e+jD12RoCrpuPWHckrp66Ug6y94Gv6km
         N1fnYkZjV6mqLPLARyk8jBB17OT+SkitsAocAPUpGAxUocewy7Pogcr4/OOxvUaAX5Ih
         If3A==
X-Gm-Message-State: AOAM5310qrxp39sYd/od+uc1/2LiCCj2fVFlXpPOLMV7XsLclh+hpwre
        8i41jt7bRv8rz3szJ5ht9HqcZQ==
X-Google-Smtp-Source: ABdhPJwlK/SW/CODeWM9kktlBpwCnis7FDQZ4Na/hT1U3OZdj13rfaGxTXzfpo9Enz/5cOgVh+crSg==
X-Received: by 2002:a05:6830:1d88:: with SMTP id y8mr334729oti.194.1621990798636;
        Tue, 25 May 2021 17:59:58 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a71sm3599841oib.20.2021.05.25.17.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 17:59:58 -0700 (PDT)
Date:   Tue, 25 May 2021 19:59:56 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Saravana Kannan <saravanak@google.com>
Cc:     sidgup@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        psodagud@codeaurora.org,
        Android Kernel Team <kernel-team@android.com>
Subject: Re: [PATCH] remoteproc: core: Invoke subdev callbacks in list order
Message-ID: <YK2djEop2Dn7v0SE@yoga>
References: <CAGETcx8ykYhBzkqZT+5G9oz2MOiHaSy4F3JoHudgK9WFnmRjbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGETcx8ykYhBzkqZT+5G9oz2MOiHaSy4F3JoHudgK9WFnmRjbw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 25 May 18:54 CDT 2021, Saravana Kannan wrote:

> On XXXXX, Siddharth Gupta wrote:
> > On 5/24/2021 8:03 PM, Bjorn Andersson wrote:
> > > On Mon 17 May 18:08 CDT 2021, Siddharth Gupta wrote:
> > >
> > >> Subdevices at the beginning of the subdev list should have
> > >> higher priority than those at the end of the list. Reverse
> > >> traversal of the list causes priority inversion, which can
> > >> impact the performance of the device.
> > >>
> > > The subdev lists layers of the communication onion, we bring them up
> > > inside out and we take them down outside in.
> > >
> > > This stems from the primary idea that we want to be able to shut things
> > > down cleanly (in the case of a stop) and we pass the "crashed" flag to
> > > indicate to each recipient during "stop" that it may not rely on the
> > > response of a lower layer.
> > >
> > > As such, I don't think it's right to say that we have a priority
> > > inversion.
> > My understanding of the topic was that each subdevice should be
> > independent of the other. In our case unfortunately the sysmon
> > subdevice depends on the glink endpoint.
> 
> In that case, the glink has to be prepared/started before sysmon, right?
> 

Correct, we prepare glink, then prepare sysmon, start glink then start
sysmon - and reverse for stop and unprepare.

> >
> > However the priority inversion doesn't happen in these
> > subdevices, it happens due to the SSR notifications that we send
> > to kernel clients. In this case kernel clients also can have QMI
> > sockets that in turn depend on the glink endpoint, which means
> > when they go to release the QMI socket a broadcast will be sent
> > out to all connected clients about the closure of the connection
> > which in this case happens to be the remoteproc which died. So
> > if we peel the onion, we will be unnecessarily be waiting for a
> > dead remoteproc.
> 
> So why can't the QMI layer be smart about this and check that the
> remoteproc hasn't crashed before you try to communicate with it?

I guess we could do that, if we really have to. But I find it quite
ugly and would like to avoid it.

> Or if the
> glink is torn down before QMI gets to broadcast, then it's a pretty clear
> indication of failure and just notify all the kernel side QMI clients?
> 

No, the system is designed to deal with this; as the remoteproc goes
down glink will be torn down, which will team down the qrtr link to
whatever qrtr nodes exist on (or beyond) that remote processor.

So if it's down the qrtr will naturally fail because there's no path to
that qrtr node.

> > >
> > >> For example a device adds the glink, sysmon and ssr subdevs
> > >> to its list. During a crash the ssr notification would go
> > >> before the glink and sysmon notifications. This can cause a
> > >> degraded response when a client driver waits for a response
> > >> from the crashed rproc.
> > >>
> > > In general the design is such that components are not expected to
> > > communicate with the crashed remote when "crashed" is set, this avoids
> > > the single-remote crash.
> > Here the glink device on the rpmsg bus won't know about the
> > crashed remoteproc till we send glink notification first, right?
> 
> Why not just query the current state of the remote proc before trying to
> talk to it? It should be a quick check.
> 

We notify subdevices (and thereby indirectly other drivers) that the
remoteproc is going down, either cleanly or that it's dead.

The problem seen here is that when remoteproc tell some component that
the particular remote processor is dead (crashed/not going to respond)
they react by attempting to communicate with the dying remote processor
- which will naturally time out.

In the general case the solution is simply to stop communicate with the
remote when you're told it's dead. The question is what kind of implicit
operations we're seeing here.

> > Since we send out sysmon and SSR notifications first, the glink
> > device will still be "alive" on the rpmsg bus.
> > >
> > > The case where this isn't holding up is when two remote processors
> > > crashes simultaneously, in which case e.g. sysmon has been seen hitting
> > > its timeout waiting for an ack from a dead remoteproc - but I was under
> > > the impression that this window shrunk dramatically as a side effect of
> > > us fixing the notification ordering.
> > You are right, the window would become smaller in the case of two
> > remoteprocs, but this issue can come up with even a single
> > remoteproc unless prioritize certain subdevices.
> 
> I think the main problem you have here is rproc sub devices that depend on
> other rproc sub devices. But there's no dependency tracking here. Your
> change just happens to work for your specific case because the order of the
> sub devices in the list happens to work for your inter-subdevice
> dependencies. But this is definitely not going to work for all users of
> subdevices.
> 

Right, in the particular case I'm talking about here we saw two remote
processors dying concurrently and ended up in sysmon with each one
trying to notify the other about the change in status. But as I said, to
a large degree this has been avoided by making sure that sysmon checks
the status of the remoteproc before attempting to send. It is however
still possible that you get past this check before the recipient of your
notification dies, in which case you would end up having to wait out the
timeout.

It might be possible to complete the process waiting for a response in
this case, but I don't have any data indicating if it's worth it.

And more importantly, this is not the problem that Siddharth is
reporting.

> If keeping track of dependency is too much complexity (I haven't read
> enough rproc code to comment on that), at the least, it looks like you need
> another ops instead of changing the order of stop() callbacks. Or at a
> minimum pick the ordering based on the "crashed" flag. A blanket, I'll just
> switch the ordering of stop() for everyone for all cases is wrong.
> 

I unfortunately don't see which problem you're trying to solve, above
looks to me like an extreme micro-optimization and has nothing to do
with dependencies.

> In fact, in the normal/clean shutdown case, I'd think you'll want to stop
> the subdevices in reverse initialization order so that you can cleanly stop
> QMI/sysmon first before shutting down glink.
> 

Yes.

Regards,
Bjorn
