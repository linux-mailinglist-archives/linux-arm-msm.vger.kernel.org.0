Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6CC146EE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 18:01:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729936AbgAWRBh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 12:01:37 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:40100 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729822AbgAWRBg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 12:01:36 -0500
Received: by mail-il1-f194.google.com with SMTP id c4so2617089ilo.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 09:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3T3XW9ObtDvH41u0oiLPng2xqMLffjeMRdO/UO5hcQk=;
        b=jwusNk8HEBf+lYTXTSZF87RSARfaLlueWxX9AWHVr+fInNo8lx+kEnxvm10B3mp7hR
         vUmGtD4Nu51ZyA2PrM9jMUSuEnmAO4Cu1vlkmQ15MLVSLyTmGbrWYbzkbQIIP9LYuLX7
         MgmxJx31rM/0zu5f60oPXpCNtAVYWAMqzaE2mVSZrsO2F/gszaSGMFEx53EIKKvi1vWW
         9vdWkWnVCIO2vxYmdS4TTWk5UouMAR1ac887GoDD+dCRCVz/WCRW5m3w5/MUdPNuPBwf
         09jkEQck1tOIq8uiMTfsrXDhMC2gejddhzHIw8umyFvJgMLsR5mCD5D1/mcm64fHp9pk
         LBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3T3XW9ObtDvH41u0oiLPng2xqMLffjeMRdO/UO5hcQk=;
        b=nNZNh2V/UphOwhx+OPxuKkzMePyhfgRhUeHYnAyJpkohY6Glu3NnSlJuzEZe4d3cyD
         cB8ZHMwbdUFbWzNeIxImAwtEPNEx0M20s7hRTJW8cl2Yxs+fRUjJgkj6NCzGthvOYX+p
         O+dWrwaN/uZBDGPvZfc1R73vkb29bSaGNzzlhzvDczb0ImO4iaScp+THmD2S5JPqFKay
         GR1m7mN/ZSK+PrW0OQ6XN+7s9ota2yRIbKvysGNcf1EbkyQskvSEkn34iBC+sKpXvVPo
         ayDmrFdb5NBRUZW8tc8PDHHjT1AtRZnnTiHO9lXehoxtzoxyNwHvzi5bz5U4BBFKqD7p
         YSUg==
X-Gm-Message-State: APjAAAUU3YiIEBq6MIEgSNCjV5lyS7MoXFMBnDrxHiIcGKbrXxDJrOC+
        4MhqwtSo/q/evILDHhLgWwh5ii4nI2zBAb01tVndTg==
X-Google-Smtp-Source: APXvYqyLZKjrRp/IwFBeBXBlZTKic2w21A8Xn1g75ixmc/1tXdRf9Sgawmhq/Dpa/23MCm3mSMWjDmbH4maJ1mfiRZY=
X-Received: by 2002:a92:2907:: with SMTP id l7mr13319443ilg.140.1579798895648;
 Thu, 23 Jan 2020 09:01:35 -0800 (PST)
MIME-Version: 1.0
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-8-bjorn.andersson@linaro.org> <20200110212806.GD11555@xps15>
 <20200122193936.GB3261042@ripper>
In-Reply-To: <20200122193936.GB3261042@ripper>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 23 Jan 2020 10:01:24 -0700
Message-ID: <CANLsYkx-C9U4W3R3Xo6t3BJBM4UK_i3zuwzhnXMMEQ0-ur+8Kg@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] remoteproc: qcom: q6v5: Add common panic handler
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 22 Jan 2020 at 12:40, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 10 Jan 13:28 PST 2020, Mathieu Poirier wrote:
>
> > On Thu, Dec 26, 2019 at 09:32:14PM -0800, Bjorn Andersson wrote:
> > > Add a common panic handler that invokes a stop request and sleep enough
> > > to let the remoteproc flush it's caches etc in order to aid post mortem
> > > debugging.
> > >
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >
> > > Changes since v1:
> > > - None
> > >
> > >  drivers/remoteproc/qcom_q6v5.c | 19 +++++++++++++++++++
> > >  drivers/remoteproc/qcom_q6v5.h |  1 +
> > >  2 files changed, 20 insertions(+)
> > >
> > > diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> > > index cb0f4a0be032..17167c980e02 100644
> > > --- a/drivers/remoteproc/qcom_q6v5.c
> > > +++ b/drivers/remoteproc/qcom_q6v5.c
> > > @@ -6,6 +6,7 @@
> > >   * Copyright (C) 2014 Sony Mobile Communications AB
> > >   * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
> > >   */
> > > +#include <linux/delay.h>
> > >  #include <linux/kernel.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/interrupt.h>
> > > @@ -15,6 +16,8 @@
> > >  #include <linux/remoteproc.h>
> > >  #include "qcom_q6v5.h"
> > >
> > > +#define Q6V5_PANIC_DELAY_MS        200
> > > +
> > >  /**
> > >   * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
> > >   * @q6v5:  reference to qcom_q6v5 context to be reinitialized
> > > @@ -162,6 +165,22 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5)
> > >  }
> > >  EXPORT_SYMBOL_GPL(qcom_q6v5_request_stop);
> > >
> > > +/**
> > > + * qcom_q6v5_panic() - panic handler to invoke a stop on the remote
> > > + * @q6v5:  reference to qcom_q6v5 context
> > > + *
> > > + * Set the stop bit and sleep in order to allow the remote processor to flush
> > > + * its caches etc for post mortem debugging.
> > > + */
> > > +void qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
> > > +{
> > > +   qcom_smem_state_update_bits(q6v5->state,
> > > +                               BIT(q6v5->stop_bit), BIT(q6v5->stop_bit));
> > > +
> > > +   mdelay(Q6V5_PANIC_DELAY_MS);
> >
> > I really wonder if the delay should be part of the remoteproc core and
> > configurable via device tree.  Wanting the remote processor to flush its caches
> > is likely something other vendors will want when dealing with a kernel panic.
> > It would be nice to see if other people have an opinion on this topic.  If not
> > then we can keep the delay here and move it to the core if need be.
> >
>
> I gave this some more thought and what we're trying to achieve is to
> signal the remote processors about the panic and then give them time to
> react, but per the proposal (and Qualcomm downstream iirc) we will do
> this for each remote processor, one by one.
>
> So in the typical case of a Qualcomm platform with 4-5 remoteprocs we'll
> end up giving the first one a whole second to react and the last one
> "only" 200ms.
>
> Moving the delay to the core by iterating over rproc_list calling
> panic() and then delaying would be cleaner imo.

I agree.

>
> It might be nice to make this configurable in DT, but I agree that it
> would be nice to hear from others if this would be useful.

I think the delay has to be configurable via DT if we move this to the
core.  The binding can be optional and default to 200ms if not
present.

>
> Regards,
> Bjorn
>
> > Thanks,
> > Mathieu
> >
> > > +}
> > > +EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
> > > +
> > >  /**
> > >   * qcom_q6v5_init() - initializer of the q6v5 common struct
> > >   * @q6v5:  handle to be initialized
> > > diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
> > > index 7ac92c1e0f49..c37e6fd063e4 100644
> > > --- a/drivers/remoteproc/qcom_q6v5.h
> > > +++ b/drivers/remoteproc/qcom_q6v5.h
> > > @@ -42,5 +42,6 @@ int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
> > >  int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
> > >  int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5);
> > >  int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
> > > +void qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
> > >
> > >  #endif
> > > --
> > > 2.24.0
> > >
