Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 367D0182504
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 23:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729518AbgCKWf2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 18:35:28 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:46895 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729799AbgCKWf2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 18:35:28 -0400
Received: by mail-vs1-f66.google.com with SMTP id z125so2444342vsb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 15:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lsW0SE5bA/8L/+J4dteUD1+31q2t3sviyLsIUTUUjCU=;
        b=nA5aKb8YIyT8h3UqvLzjvnEgvNvnva47875wLVllSIDlNxQrTEGi8mAysT47bJNRt/
         6yAE65QhVyrMP4apMtBz+cREzwguDmgKslLK0xLg1K2u/wgdygflZJN1hjsBf7zjM2UN
         1ovYfu9dv+9G4VVNFRyaEsQ1ayewc0KF9dfuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lsW0SE5bA/8L/+J4dteUD1+31q2t3sviyLsIUTUUjCU=;
        b=VxYVPSsx3nmCtO/Ua5r3kKGyJQfzapfTk6MJLbyUiMl/LPVlxYPOO0p6i8qrhj0G6j
         s7PWHJWgrLJyagfjduo8G8063FB6pPxEE/iuZn/MfT0kYrDXwoZIbtcwJYQY8cU/ykt7
         fqTZ42kOCdUeuLSVPawP4MuXeLZ9mQojQFFnRsCFIM9lb5HJw9cWD6Ayz6gP6gA6NGqp
         Ruc65+0+dSnnCmXVD80hLkZOGfR14bunEDQeH+paPpKYoR2Hjb9Vv8mBS33PNsd701Rx
         pdND0K/6ME332Ohmsij6+VO4nho1UkAC8tlMmWUEEpdSVXU69oc3Z9ghIR0Y3TBcQIQp
         rd2g==
X-Gm-Message-State: ANhLgQ2JHydaK1s7Bo8p04DvvM+dfGEIV5k6UeNgoZ1yYc+xIuyCEyDQ
        WJTLKqW3VMLKuSdKKzhDd8OMek3zEYo=
X-Google-Smtp-Source: ADFU+vtr2WJ+xm3mM308poZDSyL7k0HPld8a3SrxCLMS5rVuy+NskybURSVfEGHrwIZZi9X/2IrxGg==
X-Received: by 2002:a05:6102:10dd:: with SMTP id t29mr3645555vsr.229.1583966124963;
        Wed, 11 Mar 2020 15:35:24 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id i26sm8153443uak.17.2020.03.11.15.35.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 15:35:23 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id c18so2453726vsq.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 15:35:23 -0700 (PDT)
X-Received: by 2002:a05:6102:30ba:: with SMTP id y26mr3622374vsd.198.1583966122839;
 Wed, 11 Mar 2020 15:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200306235951.214678-1-dianders@chromium.org>
 <20200306155707.RFT.2.Iaddc29b72772e6ea381238a0ee85b82d3903e5f2@changeid>
 <285d3315-7558-d9f6-fe65-24d8ad07949d@codeaurora.org> <CAD=FV=W5RGwu=ywtM7aCv3H-EpJ1i23S0awgVc8QtOsXtige4w@mail.gmail.com>
 <158395731898.149997.1612077509811625118@swboyd.mtv.corp.google.com>
In-Reply-To: <158395731898.149997.1612077509811625118@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Mar 2020 15:35:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wdyug3yijCTZGUR3CYWchNPn4wAT7=sv-6W9HWP3c59g@mail.gmail.com>
Message-ID: <CAD=FV=Wdyug3yijCTZGUR3CYWchNPn4wAT7=sv-6W9HWP3c59g@mail.gmail.com>
Subject: Re: [RFT PATCH 2/9] drivers: qcom: rpmh-rsc: Document the register
 layout better
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 11, 2020 at 1:08 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Doug Anderson (2020-03-11 08:27:44)
> > Hi,
> >
> > On Wed, Mar 11, 2020 at 2:35 AM Maulik Shah <mkshah@codeaurora.org> wrote:
> > >
> > > Hi Doug,
> > >
> > > On 3/7/2020 5:29 AM, Douglas Anderson wrote:
> > > > Perhaps it's just me, it took a really long time to understand what
> > > > the register layout of rpmh-rsc was just from the #defines.
> > > i don't understand why register layout is so important for you to understand?
> > >
> > > besides, i think all required registers are properly named with #define
> > >
> > > for e.g.
> > > /* Register offsets */
> > > #define RSC_DRV_IRQ_ENABLE              0x00
> > > #define RSC_DRV_IRQ_STATUS              0x04
> > > #define RSC_DRV_IRQ_CLEAR               0x08
> > >
> > > now when you want to enable/disable irq in driver code, its pretty simple to figure out
> > > that we need to read/write at RSC_DRV_IRQ_ENABLE offset.
> >
> > It's not the specific layout that's important to me.  It's the
> > relationships between everything.  In other words:
> >
> > a) one rpmh-rsc contains some registers and then a whole bunch of TCS blocks
> >
> > b) one TCS block contains some registers and space for up to 16 commands.
> >
> > c) each command has a handful of registers
> >
> > Nothing describes this in the existing code--you've gotta read through
> > all the code and figure out how it's reading/writing registers to
> > figure it out.
> >
> >
> > > this seems unnecessary change to me, can you please drop this when you spin v2?
> >
> > In v2 I'll replace this with the prose below.  Personally I find this
> > inferior to the struct definitions which are easier to read
> > at-a-glance, but it seems like it would be less controversial...
> >
> > /*
> >  * Here's a high level overview of how all the registers in RPMH work
> >  * together:
> >  *
> >  * - The main rpmh-rsc address is the base of a register space that can
> >  *   be used to find overall configuration of the hardware
> >  *   (DRV_PRNT_CHLD_CONFIG).  Also found within the rpmh-rsc register
> >  *   space are all the TCS blocks.  The offset of the TCS blocks is
> >  *   specified in the device tree by "qcom,tcs-offset" and used to
> >  *   compute tcs_base.
>
> I never liked the qcom,tcs-offset property. Why can't that be hardcoded
> in the driver based on the compatible string? Why does it need to be
> specified in DT at all?
>
> >  * - TCS blocks come one after another.  Type, count, and order are
> >  *   specified by the device tree as "qcom,tcs-config".
>
> This one too. Is the idea that some boards are going to change how the TCS
> FIFOs are used?

Yeah, those thoughts occurred to me as well.  ...but right now there
actually _is_ no SoC-specific compatible string.  From sc7180:

  apps_rsc: rsc@18200000 {
    compatible = "qcom,rpmh-rsc";

I wouldn't be opposed to deprecating those properties and adding an
SoC-specific compatible string, but I probably won't take that up in
my series.  It's already getting a little unwieldy.


> >  * - Each TCS block has some registers, then space for up to 16 commands.
> >  *   Note that though address space is reserved for 16 commands, fewer
> >  *   might be present.  See ncpt (num cmds per TCS).
> >  * - The first TCS block is special in that it has registers to control
> >  *   interrupts (RSC_DRV_IRQ_XXX).  Space for these registers is reserved
> >  *   in all TCS blocks to make the math easier, but only the first one
> >  *   matters.
>
> I suspect an ascii block diagram would be useful to understand how it is
> all done up. But given that the first TCS block has some sort of irq
> control registers maybe it isn't correct to draw it split out of TCS0. I
> think the first TCS is always the "active" TCS so it has these registers
> for "irq control". The other two are the sleep and wake ones. But
> sometimes there isn't an active TCS or software doesn't have a use for
> it? Can probably indicate this in the diagram too.

One thing that indicates that the first TCS is special and it's not
just that the first TCS happens to be the used for active-only is that
there are actually two active-only TCSs but we check the IRQ registers
in TCS 0 to tell us about both of them.


> Oh and maybe there should be CMD registers inside each TCS in this
> diagram. It'd be great to have something like this so visual learners
> like me can understand it all.
>
>   +--------------------------------------------------+
>   |RSC                                               |
>   | +----------------------------------------------+ |
>   | |DRV0                                          | |
>   | | +-----------------------------------------+  | |
>   | | |IRQ CONTROL                              |  | |
>   | | |                                         |  | |
>   | | +-----------------------------------------+  | |
>   | | +-----------------------------------------+  | |
>   | | |TCS0 |  |  |  |  |  |  |  |  |  |  |  |  |  | |
>   | | |     | 0| 1| 2| 3| 4| 5| .| .| .| .|14|15|  | |
>   | | |     |  |  |  |  |  |  |  |  |  |  |  |  |  | |
>   | | +-----------------------------------------+  | |
>   | | +-----------------------------------------+  | |
>   | | |TCS1 |  |  |  |  |  |  |  |  |  |  |  |  |  | |
>   | | |     | 0| 1| 2| 3| 4| 5| .| .| .| .|14|15|  | |
>   | | |     |  |  |  |  |  |  |  |  |  |  |  |  |  | |
>   | | +-----------------------------------------+  | |
>   | | +-----------------------------------------+  | |
>   | | |TCS2 |  |  |  |  |  |  |  |  |  |  |  |  |  | |
>   | | |     | 0| 1| 2| 3| 4| 5| .| .| .| .|14|15|  | |
>   | | |     |  |  |  |  |  |  |  |  |  |  |  |  |  | |
>   | | +-----------------------------------------+  | |
>   | |                   ......                     | |
>   | +----------------------------------------------+ |
>   | +----------------------------------------------+ |
>   | |DRV1                                          | |
>   | | (same as DRV0)                               | |
>   | +----------------------------------------------+ |
>   +--------------------------------------------------+

Thanks!  I was trying to figure out some sort of ASCII art at one
point but I gave up.  I was thinking that the struct was as good was
we were going to get in terms of "visual".  What you've got looks
useful though and I'll paste something like this in.  I'm going to
leave out the "IRQ control" parts though since it (to me) makes it
feel like it's a whole separate memory region.  In fact the IRQ
control registers seem (from the math) to be present in all the TCSs.
I'm going to go with this:

 *  +---------------------------------------------------+
 *  |RSC                                                |
 *  | ctrl                                              |
 *  |                                                   |
 *  | Drvs:                                             |
 *  | +-----------------------------------------------+ |
 *  | |DRV0                                           | |
 *  | | ctrl                                          | |
 *  | |                                               | |
 *  | | TCSs:                                         | |
 *  | | +------------------------------------------+  | |
 *  | | |TCS0  |  |  |  |  |  |  |  |  |  |  |  |  |  | |
 *  | | | IRQ  | 0| 1| 2| 3| 4| 5| .| .| .| .|14|15|  | |
 *  | | | ctrl |  |  |  |  |  |  |  |  |  |  |  |  |  | |
 *  | | +------------------------------------------+  | |
 *  | | +------------------------------------------+  | |
 *  | | |TCS1  |  |  |  |  |  |  |  |  |  |  |  |  |  | |
 *  | | |      | 0| 1| 2| 3| 4| 5| .| .| .| .|14|15|  | |
 *  | | | ctrl |  |  |  |  |  |  |  |  |  |  |  |  |  | |
 *  | | +------------------------------------------+  | |
 *  | | +------------------------------------------+  | |
 *  | | |TCS2  |  |  |  |  |  |  |  |  |  |  |  |  |  | |
 *  | | |      | 0| 1| 2| 3| 4| 5| .| .| .| .|14|15|  | |
 *  | | | ctrl |  |  |  |  |  |  |  |  |  |  |  |  |  | |
 *  | | +------------------------------------------+  | |
 *  | |                    ......                     | |
 *  | +-----------------------------------------------+ |
 *  | +-----------------------------------------------+ |
 *  | |DRV1                                           | |
 *  | | (same as DRV0)                                | |
 *  | +-----------------------------------------------+ |
 *  |                      ......                       |
 *  +---------------------------------------------------+

So I'll end up skipping the fake struct definitions and go with the
prose + diagram.  If nothing else it's less controversial than
bogus/unused struct definitions.

-Doug
