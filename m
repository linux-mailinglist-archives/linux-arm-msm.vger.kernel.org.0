Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5F6C182322
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 21:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387404AbgCKUIn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 16:08:43 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37151 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387394AbgCKUIm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 16:08:42 -0400
Received: by mail-pf1-f195.google.com with SMTP id p14so1947313pfn.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 13:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Whu7z5f/PBk0R24eJiLhc8HXXvDRvnVc2fh8l/R98LI=;
        b=e1VZlew9gXKtYH25ZI+J3ozt93X7ArIpoCV2+iCRA9pEhJirzPtqtLEB4I+Yl+EFau
         wm/HP5q/qGoQIfxTbRGiOsZwLy1ZzgB7Hpm1eYu+wm+k9qCxK3HAaXEQi4WVqrCnMSW3
         gwvxtSlGCaU43SKVjIrDC4ChL0eN2LNFCf2nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Whu7z5f/PBk0R24eJiLhc8HXXvDRvnVc2fh8l/R98LI=;
        b=W9N/lWP7uDB4tvVObdCq+9YoFTk+pWeqh9rW+aC3ebZaYMLGSNVdfYmNdYnaNo8sIF
         syQTAP0mJ82XqjUokPs0MGwrXDr0eIgv/OEK+846u2He9nWbgmOZUdsaViMT270VNRPv
         hJe3rDvirY/tDXGKfPMhGAgoc3OEks3qtLvVey5NS9GOC66qusQkAAMeLyDSP9Hj+moF
         LPOehSge7GSOj6c7bQ4AP/9MJo5+RBkwIUuQbmy5RHXATV2gwQ5NwYhpyVh0IzOS/oWI
         9/uTZfBxoSriJYmb6QNBHcmYuYbBwSpTgUyz5tiNT75CRZSQS2IpGTZ8+580o769B3Fp
         B4MA==
X-Gm-Message-State: ANhLgQ0yCTeKUKDwOxhEDKlyUEY+Keh2liSTHmwZoZxjfU7NHStAhG3D
        NcKaI2ScUNaANmjWLlaggNCjYw==
X-Google-Smtp-Source: ADFU+vuW0CSV+O1sfO7MIJ2z8BXsvmXbHSbaN+Z78MFHxspy4P8hC9ExGf/Bt4fqQziErCcQ/ATCDA==
X-Received: by 2002:aa7:97a7:: with SMTP id d7mr4522055pfq.194.1583957321577;
        Wed, 11 Mar 2020 13:08:41 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h24sm10982058pfn.49.2020.03.11.13.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 13:08:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=W5RGwu=ywtM7aCv3H-EpJ1i23S0awgVc8QtOsXtige4w@mail.gmail.com>
References: <20200306235951.214678-1-dianders@chromium.org> <20200306155707.RFT.2.Iaddc29b72772e6ea381238a0ee85b82d3903e5f2@changeid> <285d3315-7558-d9f6-fe65-24d8ad07949d@codeaurora.org> <CAD=FV=W5RGwu=ywtM7aCv3H-EpJ1i23S0awgVc8QtOsXtige4w@mail.gmail.com>
Subject: Re: [RFT PATCH 2/9] drivers: qcom: rpmh-rsc: Document the register layout better
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
To:     Doug Anderson <dianders@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>
Date:   Wed, 11 Mar 2020 13:08:38 -0700
Message-ID: <158395731898.149997.1612077509811625118@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2020-03-11 08:27:44)
> Hi,
>=20
> On Wed, Mar 11, 2020 at 2:35 AM Maulik Shah <mkshah@codeaurora.org> wrote:
> >
> > Hi Doug,
> >
> > On 3/7/2020 5:29 AM, Douglas Anderson wrote:
> > > Perhaps it's just me, it took a really long time to understand what
> > > the register layout of rpmh-rsc was just from the #defines.
> > i don't understand why register layout is so important for you to under=
stand?
> >
> > besides, i think all required registers are properly named with #define
> >
> > for e.g.
> > /* Register offsets */
> > #define RSC_DRV_IRQ_ENABLE              0x00
> > #define RSC_DRV_IRQ_STATUS              0x04
> > #define RSC_DRV_IRQ_CLEAR               0x08
> >
> > now when you want to enable/disable irq in driver code, its pretty simp=
le to figure out
> > that we need to read/write at RSC_DRV_IRQ_ENABLE offset.
>=20
> It's not the specific layout that's important to me.  It's the
> relationships between everything.  In other words:
>=20
> a) one rpmh-rsc contains some registers and then a whole bunch of TCS blo=
cks
>=20
> b) one TCS block contains some registers and space for up to 16 commands.
>=20
> c) each command has a handful of registers
>=20
> Nothing describes this in the existing code--you've gotta read through
> all the code and figure out how it's reading/writing registers to
> figure it out.
>=20
>=20
> > this seems unnecessary change to me, can you please drop this when you =
spin v2?
>=20
> In v2 I'll replace this with the prose below.  Personally I find this
> inferior to the struct definitions which are easier to read
> at-a-glance, but it seems like it would be less controversial...
>=20
> /*
>  * Here's a high level overview of how all the registers in RPMH work
>  * together:
>  *
>  * - The main rpmh-rsc address is the base of a register space that can
>  *   be used to find overall configuration of the hardware
>  *   (DRV_PRNT_CHLD_CONFIG).  Also found within the rpmh-rsc register
>  *   space are all the TCS blocks.  The offset of the TCS blocks is
>  *   specified in the device tree by "qcom,tcs-offset" and used to
>  *   compute tcs_base.

I never liked the qcom,tcs-offset property. Why can't that be hardcoded
in the driver based on the compatible string? Why does it need to be
specified in DT at all?

>  * - TCS blocks come one after another.  Type, count, and order are
>  *   specified by the device tree as "qcom,tcs-config".

This one too. Is the idea that some boards are going to change how the TCS
FIFOs are used?

>  * - Each TCS block has some registers, then space for up to 16 commands.
>  *   Note that though address space is reserved for 16 commands, fewer
>  *   might be present.  See ncpt (num cmds per TCS).
>  * - The first TCS block is special in that it has registers to control
>  *   interrupts (RSC_DRV_IRQ_XXX).  Space for these registers is reserved
>  *   in all TCS blocks to make the math easier, but only the first one
>  *   matters.

I suspect an ascii block diagram would be useful to understand how it is
all done up. But given that the first TCS block has some sort of irq
control registers maybe it isn't correct to draw it split out of TCS0. I
think the first TCS is always the "active" TCS so it has these registers
for "irq control". The other two are the sleep and wake ones. But
sometimes there isn't an active TCS or software doesn't have a use for
it? Can probably indicate this in the diagram too.

Oh and maybe there should be CMD registers inside each TCS in this
diagram. It'd be great to have something like this so visual learners
like me can understand it all.

  +--------------------------------------------------+
  |RSC                                               |
  | +----------------------------------------------+ |
  | |DRV0                                          | |
  | | +-----------------------------------------+  | |
  | | |IRQ CONTROL                              |  | |
  | | |                                         |  | |
  | | +-----------------------------------------+  | |
  | | +-----------------------------------------+  | |
  | | |TCS0 |  |  |  |  |  |  |  |  |  |  |  |  |  | |
  | | |     | 0| 1| 2| 3| 4| 5| .| .| .| .|14|15|  | |
  | | |     |  |  |  |  |  |  |  |  |  |  |  |  |  | |
  | | +-----------------------------------------+  | |
  | | +-----------------------------------------+  | |
  | | |TCS1 |  |  |  |  |  |  |  |  |  |  |  |  |  | |
  | | |     | 0| 1| 2| 3| 4| 5| .| .| .| .|14|15|  | |
  | | |     |  |  |  |  |  |  |  |  |  |  |  |  |  | |
  | | +-----------------------------------------+  | |
  | | +-----------------------------------------+  | |
  | | |TCS2 |  |  |  |  |  |  |  |  |  |  |  |  |  | |
  | | |     | 0| 1| 2| 3| 4| 5| .| .| .| .|14|15|  | |
  | | |     |  |  |  |  |  |  |  |  |  |  |  |  |  | |
  | | +-----------------------------------------+  | |
  | |                   ......                     | |
  | +----------------------------------------------+ |
  | +----------------------------------------------+ |
  | |DRV1                                          | |
  | | (same as DRV0)                               | |
  | +----------------------------------------------+ |
  +--------------------------------------------------+
