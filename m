Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3C2390D62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 02:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbhEZAii (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 20:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232439AbhEZAii (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 20:38:38 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A99C061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 17:37:06 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id x15so32001092oic.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 17:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wn/Pvg1jUHgqwYqfhGxkAgvTuwBtizQ4fD+JZC+WLcQ=;
        b=ad8sxQX+fhkVtFsqXifgS7wW9djZRnxnYcB5pwFK8Wr1NCoo8axD/qVjsFQX5n4mms
         /0oYDFL060Lskgm6HtKJ4c5+6CWnykEH8Ntwbh+vf60hbSStmOpGCKYk/l1C/bvkfZJZ
         t7VH56Ftr36FTltaufY8p1xrqUr651yy4IsQ5V5UvmEQN6ee2DAzyKkW0soLG1G/ETIO
         LU9WscE/PYi3Ia/O2zFQugEr7Yg9oM87LoGRKAgeR97NgnIVo+DUoVGNLKTD/SlLkL6K
         sSzoEPAf0H/Of9PUrTWkkGAwDEZRyma82MnS4XkteiaWIcY1jxHCvimig8ybkZmoLV0c
         KsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wn/Pvg1jUHgqwYqfhGxkAgvTuwBtizQ4fD+JZC+WLcQ=;
        b=QV1beKlivm/aK0T6+KfkFhr7uuIrT0BkZY5OPjKoxDNQLcMHPAFITukiW2yz3ZUoXL
         JxRwfKkwagddlB8vveODxjMqJd3Cy9as1VrX+q7mh6qEG+78yBX1uoAnrEgUQc/Y+aNH
         dr7fSCKKw4kdQIqCfQzkAw2n1FFGCN+wa5vOle2JQ4ImVrN60iYtlo0+3bJD0SxtPz++
         GZRZhWfjzaatqXuRvm+0UjzL82ayzfwUYQEr6+mYT7i3FjFJHswZA1IiNGsBdb3Veo5r
         5boqbHJG/pe723RV5DxDZUos02FICJRX1MdC/6X5g3Gc92iBlWWrn74/kI94pv2d1hgT
         Si/w==
X-Gm-Message-State: AOAM5322sgx5aJWgNZXOfSbJ587hkmh+CxS8IYMg/VvX+2J4qsKt1Zr5
        hU3fttOUhu3KMDAqYvTRHyoaoQ==
X-Google-Smtp-Source: ABdhPJz0LoeEm8SD90TGZq02/iMua/DOH9VrdqQD6veWdAh6gumts5aGeSDFrZMvC81FCT8wX3lp4A==
X-Received: by 2002:aca:498a:: with SMTP id w132mr212372oia.122.1621989425698;
        Tue, 25 May 2021 17:37:05 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o18sm4089205otp.61.2021.05.25.17.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 17:37:05 -0700 (PDT)
Date:   Tue, 25 May 2021 19:37:03 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, psodagud@codeaurora.org
Subject: Re: [PATCH] remoteproc: core: Invoke subdev callbacks in list order
Message-ID: <YK2YL7im+1RH4MmY@yoga>
References: <1621292893-18827-1-git-send-email-sidgup@codeaurora.org>
 <YKxo5BXwEPjS5K4d@yoga>
 <02bc228b-4bd2-de5a-6cf7-5623b8048e7f@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02bc228b-4bd2-de5a-6cf7-5623b8048e7f@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 25 May 14:48 CDT 2021, Siddharth Gupta wrote:

> 
> On 5/24/2021 8:03 PM, Bjorn Andersson wrote:
> > On Mon 17 May 18:08 CDT 2021, Siddharth Gupta wrote:
> > 
> > > Subdevices at the beginning of the subdev list should have
> > > higher priority than those at the end of the list. Reverse
> > > traversal of the list causes priority inversion, which can
> > > impact the performance of the device.
> > > 
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
> 

We need to care for the ordering if sysmon is to be able to use smd or
glink to send the shutdown request.

> However the priority inversion doesn't happen in these
> subdevices, it happens due to the SSR notifications that we send
> to kernel clients. In this case kernel clients also can have QMI
> sockets that in turn depend on the glink endpoint, which means
> when they go to release the QMI socket a broadcast will be sent
> out to all connected clients about the closure of the connection
> which in this case happens to be the remoteproc which died. So
> if we peel the onion, we will be unnecessarily be waiting for a
> dead remoteproc.

I see, that is indeed a problem.

> > 
> > > For example a device adds the glink, sysmon and ssr subdevs
> > > to its list. During a crash the ssr notification would go
> > > before the glink and sysmon notifications. This can cause a
> > > degraded response when a client driver waits for a response
> > > from the crashed rproc.
> > > 
> > In general the design is such that components are not expected to
> > communicate with the crashed remote when "crashed" is set, this avoids
> > the single-remote crash.
> Here the glink device on the rpmsg bus won't know about the
> crashed remoteproc till we send glink notification first, right?
> Since we send out sysmon and SSR notifications first, the glink
> device will still be "alive" on the rpmsg bus.

Yes, and this all stems from the design that everything communicating
over glink is a child of glink, which isn't the case when you have a SSR
event that will end up blocking the sequence in qrtr.

For sysmon this is not a problem, because sysmon is implemented to not
attempt to communicate with the parent remoteproc upon a crash. And
all rpmsg devices will be torn down as a result of glink being torn
down, so glink can fail early based on this (not sure if this was
implemented downstream though).

> > 
> > The case where this isn't holding up is when two remote processors
> > crashes simultaneously, in which case e.g. sysmon has been seen hitting
> > its timeout waiting for an ack from a dead remoteproc - but I was under
> > the impression that this window shrunk dramatically as a side effect of
> > us fixing the notification ordering.
> You are right, the window would become smaller in the case of two
> remoteprocs, but this issue can come up with even a single
> remoteproc unless prioritize certain subdevices.

The problem that you describe where an SSR notification will directly or
indirectly attempt to communicate over QRTR will certainly cause issues
in the single-rproc case as well.


But is there any reason why these listeners has to do the wrong thing at
stop(crashed=true)?

> > 
> > > Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> > > ---
> > >   drivers/remoteproc/remoteproc_core.c | 24 ++++++++++++++----------
> > >   1 file changed, 14 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index 626a6b90f..ac8fc42 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1167,7 +1167,7 @@ static int rproc_handle_resources(struct rproc *rproc,
> > >   static int rproc_prepare_subdevices(struct rproc *rproc)
> > >   {
> > > -	struct rproc_subdev *subdev;
> > > +	struct rproc_subdev *subdev, *itr;
> > >   	int ret;
> > >   	list_for_each_entry(subdev, &rproc->subdevs, node) {
> > > @@ -1181,9 +1181,11 @@ static int rproc_prepare_subdevices(struct rproc *rproc)
> > >   	return 0;
> > >   unroll_preparation:
> > > -	list_for_each_entry_continue_reverse(subdev, &rproc->subdevs, node) {
> > > -		if (subdev->unprepare)
> > > -			subdev->unprepare(subdev);
> > > +	list_for_each_entry(itr, &rproc->subdevs, node) {
> > > +		if (itr == subdev)
> > > +			break;
> > > +		if (itr->unprepare)
> > > +			itr->unprepare(subdev);
> > >   	}
> > >   	return ret;
> > > @@ -1191,7 +1193,7 @@ static int rproc_prepare_subdevices(struct rproc *rproc)
> > >   static int rproc_start_subdevices(struct rproc *rproc)
> > >   {
> > > -	struct rproc_subdev *subdev;
> > > +	struct rproc_subdev *subdev, *itr;
> > >   	int ret;
> > >   	list_for_each_entry(subdev, &rproc->subdevs, node) {
> > > @@ -1205,9 +1207,11 @@ static int rproc_start_subdevices(struct rproc *rproc)
> > >   	return 0;
> > >   unroll_registration:
> > > -	list_for_each_entry_continue_reverse(subdev, &rproc->subdevs, node) {
> > > -		if (subdev->stop)
> > > -			subdev->stop(subdev, true);
> > > +	list_for_each_entry(itr, &rproc->subdevs, node) {
> > > +		if (itr == subdev)
> > > +			break;
> > > +		if (itr->stop)
> > > +			itr->stop(itr, true);
> > >   	}
> > >   	return ret;
> > > @@ -1217,7 +1221,7 @@ static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
> > >   {
> > >   	struct rproc_subdev *subdev;
> > > -	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
> > > +	list_for_each_entry(subdev, &rproc->subdevs, node) {
> > I presume this is the case you actually care about, can you help me
> > understand if you changed the others for consistence or if there's some
> > flow of events where that might be necessary.
> Yes you are right, I only changed the others for consistence.
> However, I will give this more thought and see if unprepare in
> the reverse order can make a difference.
> 

Per above argument I don't think things depend on the unrolling on error
happening in reverse order. But it's idiomatic.

Regards,
Bjorn

> Thanks,
> Sid
> > 
> > Regards,
> > Bjorn
> > 
> > >   		if (subdev->stop)
> > >   			subdev->stop(subdev, crashed);
> > >   	}
> > > @@ -1227,7 +1231,7 @@ static void rproc_unprepare_subdevices(struct rproc *rproc)
> > >   {
> > >   	struct rproc_subdev *subdev;
> > > -	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
> > > +	list_for_each_entry(subdev, &rproc->subdevs, node) {
> > >   		if (subdev->unprepare)
> > >   			subdev->unprepare(subdev);
> > >   	}
> > > -- 
> > > Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > a Linux Foundation Collaborative Project
> > > 
