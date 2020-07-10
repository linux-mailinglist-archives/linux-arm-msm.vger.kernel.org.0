Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4207021C013
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 00:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgGJWoc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 18:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbgGJWoc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 18:44:32 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53BFEC08C5DC
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 15:44:32 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id t12so1286679ooc.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 15:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gCyI0kUrT87FAQAI0Q1u+opAu/z1jGmTcNbCc0ywLlQ=;
        b=pEe0x1D2oXhrROhhsfdBSl2Of0HeeOQzHLu21ytP7olDdMMZPcgjiV0SFxkgRAMS/a
         zblIckErEPPlyKbegdkpsh0OW2Xqu9dnKnUdDl8IU+qez3avQGV8FZM14sbgNWmRlm7w
         Ko1PO1Prn7C0/+tMbFDpECoaIDNxX4OffjwTb6Ox7od3D9ZNzpnW3pgRUR/h8hQQQUnw
         NAWhdtBgvYpwFCMZjLHabISmRiZm6E7qj3wdj04qmnUqNzmD90pKyk3HAmgJ+Eu491o1
         m/JxPxczvMRz7ZVoUvv+TZ8LvVDcYiZGgoZQEAs290rCxG9VW0H0QJwbyUdRTgYdcdoP
         jx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gCyI0kUrT87FAQAI0Q1u+opAu/z1jGmTcNbCc0ywLlQ=;
        b=GLVHVdMTTjXim2fQD9BY7qeT2xmV6qEUsmALIEXV+HI+yTBiQ0Bwyaiy0iCT/anw2y
         7AB44vv7LdwpDNua69HOQwEaMFIGtEwqYVjJVM5clrsTDlyOTAjJoFvDslybYCrVLX5r
         KeQKewRl0OiLrEmiwDbUF9x7H3YSbhc3ql1XeqtVEnZt3aLzNAFtWfB+m07oI8Q23U/W
         5mb3N+B8agpp8j2T8nsuRynkwE0+pNPsdvh0z2K3Rvhi0n2lrggXVwI3rB8qn308sw65
         2+GdwH61LKod209ON61laEg5oHF2GjJ2Ml2P8jQgGsO0YF508slkoDxOp9BfpDyXn98r
         dkDg==
X-Gm-Message-State: AOAM5317GSeRr7JU0UPOkZZO4qbNVqz6up0pToqhiCRa1Srss2lbVu+T
        b84f/7F93b1Gb8FjTUqwb7GjUJgKVIy8BjXty/6TaQ==
X-Google-Smtp-Source: ABdhPJwHQLhjN0fx5nsYDQ/5gAMYf/FtTG+FNllJpIvQ3csH/hy0WBxDIT6X+tOsNnJi0NtINvoXzdjwg4qm1AYXGVE=
X-Received: by 2002:a4a:d08a:: with SMTP id i10mr60007237oor.88.1594421071672;
 Fri, 10 Jul 2020 15:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200625001039.56174-1-john.stultz@linaro.org>
 <20200625001039.56174-4-john.stultz@linaro.org> <159315737502.62212.16093934831673347066@swboyd.mtv.corp.google.com>
 <CALAqxLVNGar8g+FvHaVHN_e-MOZZ+=ZPmDt_GKKSC8AS-wLFGg@mail.gmail.com>
 <87wo3setn8.wl-maz@kernel.org> <159436097057.1987609.13993891118929459851@swboyd.mtv.corp.google.com>
In-Reply-To: <159436097057.1987609.13993891118929459851@swboyd.mtv.corp.google.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 10 Jul 2020 15:44:18 -0700
Message-ID: <CALAqxLW14f4Gn6Q3b89X10y7=Zct2NJSgjagUqxez_bObcp42w@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] irqchip: Allow QCOM_PDC to be loadable as a
 permanent module
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Marc Zyngier <maz@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 9, 2020 at 11:02 PM Stephen Boyd <swboyd@chromium.org> wrote:
> Quoting Marc Zyngier (2020-06-27 02:37:47)
> > On Sat, 27 Jun 2020 02:34:25 +0100,
> > John Stultz <john.stultz@linaro.org> wrote:
> > >
> > > On Fri, Jun 26, 2020 at 12:42 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > >
> > > > Is there any reason to use IRQCHIP_DECLARE if this can work as a
> > > > platform device driver?
> > > >
> > >
> > > Hey! Thanks so much for the review!
> > >
> > > Mostly it was done this way to minimize the change in the non-module
> > > case. But if you'd rather avoid the #ifdefery I'll respin it without.
> >
> > That would certainly be my own preference. In general, IRQCHIP_DECLARE
> > and platform drivers should be mutually exclusive in the same driver:
> > if you can delay the probing and have it as a proper platform device,
> > then this should be the one true way.
> >
>
> Does it work? I haven't looked in detail but I worry that the child
> irqdomain (i.e. pinctrl-msm) would need to delay probing until this
> parent irqdomain is registered. Or has the hierarchical irqdomain code
> been updated to handle the parent child relationship and wait for things
> to probe or be loaded?

So I can't say I know the underlying hardware particularly well, but
I've been using this successfully on the Dragonboard 845c with both
static builds as well as module enabled builds.
And the same patch has been in the android-mainline and android-5.4
kernels for a while without objections from QCOM.

As to the probe ordering question, Saravana can maybe speak in more
detail if it's involved in this case but the fw_devlink code has
addressed many of these sorts of ordering issues.
However, I'm not sure if I'm lucking into the right probe order, as we
have been able to boot android-mainline w/ both fw_devlink=on and
fw_devlink=off (though in the =off case, we need
deferred_probe_timeout=30 to give us a bit more time for modules to
load after init starts).

thanks
-john
