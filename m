Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15F1039D882
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 11:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbhFGJVD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 05:21:03 -0400
Received: from mail-pf1-f177.google.com ([209.85.210.177]:37573 "EHLO
        mail-pf1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhFGJVA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 05:21:00 -0400
Received: by mail-pf1-f177.google.com with SMTP id y15so12611915pfl.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jun 2021 02:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yhjA7swv1NUczcyf3Bq27br3nhbyP5tL5RtMgb86MtY=;
        b=OaiITcLObrYbez1rJ0mKkzBkLMaGR1zAhIUOm6w80wyfzMNoJOEOX+HH7dKaaFEjBg
         1EqV8/TtITxd3WlSWmwt/wJkf70TdHr5mPpHJkaPQVCc4TF8wDZN/bArnTa5U+pglvsy
         AOwUYdXWY3BwMPYNfvMNtaGbivHjhL0xG1sJ15RIUl3fzGdoz7XZOxRL8JFW3weilCVc
         Q99o9s0FJem5d2cWxbBnrMfZjMMxYOZ7sdfUCmpLeUTfhPG3H2wWp24WQmjcWTj1usQb
         2cPuZX3u5WdBoGOvAohkX+U9W7qEuUZSvWsWndVt1fGcr0VCd8jgj1ewPiHbQkyYojrL
         oaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yhjA7swv1NUczcyf3Bq27br3nhbyP5tL5RtMgb86MtY=;
        b=hZ3dC4/fOR8dYp7ZhPUwF2OH5UDzZoLZNcLVAlM3aMiKHr820cTkt+0O0S+se+zUAk
         A9/QvCwmrRY8/f5wOfdxtH6fLZi4/0iGJo3bLZYXJS4TzaW0Ms1l0m8/2I1yrFHhIERj
         6llQQS++waGnFu7b+M1v8T35/23mfBh0UbpSg0OVH6NkNzvTw2xKGhgRHr/XkhPiG+oF
         1a/AqylQX8BgW6utpES/hWFua8W3dpfBqQvVELn0gYO6NhdevZW6yFuSrqVQSKN/BNwZ
         fgibn2XHxaOwxY5ldMsKvIhmpuoRhFhhBf+lBcAAv2C7H8nBm31NmI2glRRKA27T8v8e
         BHIA==
X-Gm-Message-State: AOAM5320oSyx4XY5WWux08M4XEd42+mm5q9dtWjQHXojr/q5VzTYkIk7
        9w9vdcXT0Jthq3fHB3jnwKPk5UowxgeXZMlPvyn6gQ==
X-Google-Smtp-Source: ABdhPJwCWjpNFUX/ztmlKtkOdtEgSPcW5dSwzgwVuNL1CuUOQHY7Z2XtTSpZptbCxTJgKLw4wxMV0O7+oVOUnEjbrek=
X-Received: by 2002:a63:bf0d:: with SMTP id v13mr16912315pgf.303.1623057475593;
 Mon, 07 Jun 2021 02:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <YLfL9Q+4860uqS8f@gerhold.net> <CAMZdPi9tcye-4P4i0uXZcECJ-Big5T11JdvdXW6k2mEEi9XwyA@mail.gmail.com>
 <YLtDB2Cz5ttewsFu@gerhold.net>
In-Reply-To: <YLtDB2Cz5ttewsFu@gerhold.net>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 7 Jun 2021 11:27:07 +0200
Message-ID: <CAMZdPi_-Qa=JnThHs_h-144dAfSAjF5s+QdBawdXZ3kk8Mx8ng@mail.gmail.com>
Subject: Re: [RFC] Integrate RPMSG/SMD into WWAN subsystem
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Aleksander Morgado <aleksander@aleksander.es>,
        Network Development <netdev@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephan,

On Sat, 5 Jun 2021 at 11:25, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> Hi Loic,
>
> On Fri, Jun 04, 2021 at 11:11:45PM +0200, Loic Poulain wrote:
> > On Wed, 2 Jun 2021 at 20:20, Stephan Gerhold <stephan@gerhold.net> wrote:
> > > I've been thinking about creating some sort of "RPMSG" driver for the
> > > new WWAN subsystem; this would be used as a QMI/AT channel to the
> > > integrated modem on some older Qualcomm SoCs such as MSM8916 and MSM8974.
> > >
> > > It's easy to confuse all the different approaches that Qualcomm has to
> > > talk to their modems, so I will first try to briefly give an overview
> > > about those that I'm familiar with:
> > >
> > > ---
> > > There is USB and MHI that are mainly used to talk to "external" modems.
> > >
> > > For the integrated modems in many Qualcomm SoCs there is typically
> > > a separate control and data path. They are not really related to each
> > > other (e.g. currently no common parent device in sysfs).
> > >
> > > For the data path (network interface) there is "IPA" (drivers/net/ipa)
> > > on newer SoCs or "BAM-DMUX" on some older SoCs (e.g. MSM8916/MSM8974).
> > > I have a driver for BAM-DMUX that I hope to finish up and submit soon.
> > >
> > > The connection is set up via QMI. The messages are either sent via
> > > a shared RPMSG channel (net/qrtr sockets in Linux) or via standalone
> > > SMD/RPMSG channels (e.g. "DATA5_CNTL" for QMI and "DATA1" for AT).
> > >
> > > This gives a lot of possible combinations like BAM-DMUX+RPMSG
> > > (MSM8916, MSM8974), or IPA+QRTR (SDM845) but also other funny
> > > combinations like IPA+RPMSG (MSM8994) or BAM-DMUX+QRTR (MSM8937).
> > >
> > > Simply put, supporting all these in userspace like ModemManager
> > > is a mess (Aleksander can probably confirm).
> > > It would be nice if this could be simplified through the WWAN subsystem.
> > >
> > > It's not clear to me if or how well QRTR sockets can be mapped to a char
> > > device for the WWAN subsystem, so for now I'm trying to focus on the
> > > standalone RPMSG approach (for MSM8916, MSM8974, ...).
> > > ---
> > >
> > > Currently ModemManager uses the RPMSG channels via the rpmsg-chardev
> > > (drivers/rpmsg/rpmsg_char.c). It wasn't my idea to use it like this,
> > > I just took that over from someone else. Realistically speaking, the
> > > current approach isn't too different from the UCI "backdoor interface"
> > > approach that was rejected for MHI...
> > >
> > > I kind of expected that I can just trivially copy some code from
> > > rpmsg_char.c into a WWAN driver since they both end up as a simple char
> > > device. But it looks like the abstractions in wwan_core are kind of
> > > getting in the way here... As far as I can tell, they don't really fit
> > > together with the RPMSG interface.
> > >
> > > For example there is rpmsg_send(...) (blocking) and rpmsg_trysend(...)
> > > (non-blocking) and even a rpmsg_poll(...) [1] but I don't see a way to
> > > get notified when the TX queue is full or no longer full so I can call
> > > wwan_port_txon/off().
> > >
> > > Any suggestions or other thoughts?
> >
> > It would be indeed nice to get this in the WWAN framework.
> > I don't know much about rpmsg but I think it is straightforward for
> > the RX path, the ept_cb can simply forward the buffers to
> > wwan_port_rx.
>
> Right, that part should be straightforward.
>
> > For tx, simply call rpmsg_trysend() in the wwan tx
> > callback and don't use the txon/off helpers. In short, keep it simple
> > and check if you observe any issues.
> >
>
> I'm not sure that's a good idea. This sounds like exactly the kind of
> thing that might explode later just because I don't manage to get the
> TX queue full in my tests. In that case, writing to the WWAN char dev
> would not block, even if O_NONBLOCK is not set.

Right, if you think it could be a problem, you can always implement a
more complex solution like calling rpmsg_send from a
workqueue/kthread, and only re-enable tx once rpmsg_send returns.

>
> But I think you're right that it's probably easiest if I start with
> that, see if I can get anything working at all ...
>
> > And for sure you can propose changes in the WWAN framework if you
> > think something is missing to support your specific case.
> >
>
> ... and then we can discuss that further on a RFC PATCH or something
> like that. Does that sound good to you?

Yes, you can submit the series, no need to be RFC IMHO, this thread is
already your RFC.

Regards,
Loic
