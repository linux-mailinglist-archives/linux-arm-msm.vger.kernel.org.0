Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 790CA390D21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 02:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232155AbhEZACL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 20:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232030AbhEZACL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 20:02:11 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5B2C06175F
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 17:00:40 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id v77so2008091ybi.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 17:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=OgPBD9RTWV/+yocErwSjNvY03ozhb/ZIhTE4mqMzglY=;
        b=QogSuupoLXyFIrvXgPMsgbgsuthJBIo84vbP7rB/tLuurhhp0LcJhmarHPFsNoryFQ
         42mnkolSR6ahg8rnHPK7IkBB/PZ7XVexz7cXHhe6MPzIcr0K0ghejT3KaYxX6JjEwiD8
         rcV9yhnjcexreaKFtyVgCQiR5QRtvjVp7DmRlOL6bciS4PXa/OMLFNUsHkuirNNwrmVv
         Bn2MMmK+vA+GzatXKF77ROeAap3hyKk7k8KanrJJkO/ewFZ7pioPXV4ogBQzIvpDScgV
         YoV0qKzlmyrV88MphFr/qxsbCgtE+XRKgxZ9gOnlgIqCCt/sXQxD9VeiElItLALzOSAW
         Y4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=OgPBD9RTWV/+yocErwSjNvY03ozhb/ZIhTE4mqMzglY=;
        b=O3/JDY+cB2zmrm97bTqIR4ZYO0B19UtKZY+2UiJ8jy4N/zJkunZknF46bg76tcO2Rm
         smyipid5C49GhgEe5n8inosen26W8wl6rGTtS25Lckcb5BEVD+jCCBGnKWPrN73iS3hS
         UrUvXm0aEt5Rr9HpovyxxLNfeH2wNtuFJdmc+G5MoLtFkd5M0Ty8v/C8Texn7ETFRpAh
         e3PFDC2Z4TwsgofyMtr3xOOiUzEUOqD4lT6Um2lKZ8DmuF3TDJrLKy48jOYgpBu4mw2+
         2/l/tiVbzXOCRly+M89aACHN/gapeubgR2/OPpKYDmsD3di2OfGRHkqE4IoD6ru/8ylo
         QDZA==
X-Gm-Message-State: AOAM5321Ltmuu5u0fJXQFdrIsGQwV7bB1gXzNiM2UQYEjHmBygPtMULt
        H6LVfdXhP01D/6++VUuzXLOzr2FTdnKrc4kvqMNtYw==
X-Google-Smtp-Source: ABdhPJzW+b+0ootIVJRT77W2OC01Wf6i3sBEfv820bajSe2qGZxWR2AQvY0EkjkdZvGr1uiz45DraOa6tGKNTWwbSjU=
X-Received: by 2002:a25:734b:: with SMTP id o72mr24441243ybc.412.1621987239181;
 Tue, 25 May 2021 17:00:39 -0700 (PDT)
MIME-Version: 1.0
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 25 May 2021 17:00:03 -0700
Message-ID: <CAGETcx_N-+7e0hgnmtuqavce0qgk7Ertf=9P-0kNZ01SOnFq_w@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: core: Invoke subdev callbacks in list order
To:     sidgup@codeaurora.org
Cc:     bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        psodagud@codeaurora.org, Saravana Kannan <saravanak@google.com>,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sending again due to accidental HTML.

On XXXXX, Siddharth Gupta wrote:
> On 5/24/2021 8:03 PM, Bjorn Andersson wrote:
> > On Mon 17 May 18:08 CDT 2021, Siddharth Gupta wrote:
> >
> >> Subdevices at the beginning of the subdev list should have
> >> higher priority than those at the end of the list. Reverse
> >> traversal of the list causes priority inversion, which can
> >> impact the performance of the device.
> >>
> > The subdev lists layers of the communication onion, we bring them up
> > inside out and we take them down outside in.
> >
> > This stems from the primary idea that we want to be able to shut things
> > down cleanly (in the case of a stop) and we pass the "crashed" flag to
> > indicate to each recipient during "stop" that it may not rely on the
> > response of a lower layer.
> >
> > As such, I don't think it's right to say that we have a priority
> > inversion.
> My understanding of the topic was that each subdevice should be
> independent of the other. In our case unfortunately the sysmon
> subdevice depends on the glink endpoint.

In that case, the glink has to be prepared/started before sysmon, right?

>
> However the priority inversion doesn't happen in these
> subdevices, it happens due to the SSR notifications that we send
> to kernel clients. In this case kernel clients also can have QMI
> sockets that in turn depend on the glink endpoint, which means
> when they go to release the QMI socket a broadcast will be sent
> out to all connected clients about the closure of the connection
> which in this case happens to be the remoteproc which died. So
> if we peel the onion, we will be unnecessarily be waiting for a
> dead remoteproc.

So why can't the QMI layer be smart about this and check that the
remoteproc hasn't crashed before you try to communicate with it? Or if
the glink is torn down before QMI gets to broadcast, then it's a
pretty clear indication of failure and just notify all the kernel side
QMI clients?

> >
> >> For example a device adds the glink, sysmon and ssr subdevs
> >> to its list. During a crash the ssr notification would go
> >> before the glink and sysmon notifications. This can cause a
> >> degraded response when a client driver waits for a response
> >> from the crashed rproc.
> >>
> > In general the design is such that components are not expected to
> > communicate with the crashed remote when "crashed" is set, this avoids
> > the single-remote crash.
> Here the glink device on the rpmsg bus won't know about the
> crashed remoteproc till we send glink notification first, right?

Why not just query the current state of the remote proc before trying
to talk to it? It should be a quick check.

> Since we send out sysmon and SSR notifications first, the glink
> device will still be "alive" on the rpmsg bus.
> >
> > The case where this isn't holding up is when two remote processors
> > crashes simultaneously, in which case e.g. sysmon has been seen hitting
> > its timeout waiting for an ack from a dead remoteproc - but I was under
> > the impression that this window shrunk dramatically as a side effect of
> > us fixing the notification ordering.
> You are right, the window would become smaller in the case of two
> remoteprocs, but this issue can come up with even a single
> remoteproc unless prioritize certain subdevices.

I think the main problem you have here is rproc sub devices that
depend on other rproc sub devices. But there's no dependency tracking
here. Your change just happens to work for your specific case because
the order of the sub devices in the list happens to work for your
inter-subdevice dependencies. But this is definitely not going to work
for all users of subdevices.

If keeping track of dependency is too much complexity (I haven't read
enough rproc code to comment on that), at the least, it looks like you
need another ops instead of changing the order of stop() callbacks. Or
at a minimum pick the ordering based on the "crashed" flag. A blanket,
I'll just switch the ordering of stop() for everyone for all cases is
wrong.

In fact, in the normal/clean shutdown case, I'd think you'll want to
stop the subdevices in reverse initialization order so that you can
cleanly stop QMI/sysmon first before shutting down glink.

-Saravana
