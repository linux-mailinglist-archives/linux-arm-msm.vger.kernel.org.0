Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2343DBB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2019 22:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406053AbfFKUOS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jun 2019 16:14:18 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:39702 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405476AbfFKUOS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jun 2019 16:14:18 -0400
Received: by mail-it1-f195.google.com with SMTP id j204so6903538ite.4;
        Tue, 11 Jun 2019 13:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L+hdHis2FMYQ2dbrl+iWFu+BV7L2wGuVMYJCOxZmRSE=;
        b=ZBV3XlkJZUQqfqvsBwYFFl88g+4oBtiYmhE3BlzhravPym+yzJtprctRX/1mikMzln
         KzniRicnupB+1F8X7myItexxVIMu0uJheHAUTyAROLBlMo1Q51aEFJ3rkKn7e5PV9a1C
         aY1RKPxsJqEVb9oREftCM7lxJ2a8redwVCP0cOwjJd4so1Ooq3gNrABEwf87jYlv8YCV
         0jRSiaqSA2XxpZgfNB5/xAYhYa2ofWSLqX4ue6Cs9dbu4RPDDgDUr3j0h/gg6PMkn01g
         jgrTljRy93OFzzIpXeZZBjsUuEZ+lsh0R2H/+OpUMvpc/DXzPcNX/vFttkUchDS2+CxK
         B3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L+hdHis2FMYQ2dbrl+iWFu+BV7L2wGuVMYJCOxZmRSE=;
        b=VyhA6rTGwSS+WWxwOEDDqhZ/ekbSZTufgR5Kdi0b5gfiIdxLi65E8/gZ8ma+Ajp8co
         G3YpR3QIVrbRXDSCT13eWimU6A7hD3j/g94+eZ9BAWZ4HC2dyTI6y+NBvCWupR8Twsm6
         SofhGQJaBKAd/7rX9e2RV24ss5ijYSa++tZ/3+XcDl37i6KkxAwTvdhxtul78ZKYwbAZ
         E3qdXnfQwWpRcd59WuJ3vqDSuGh8Sst/YXtA003CdJgEleMXai4ZgDNWGJSzPHpgclig
         xoZl1Y7WDpNVU3dLuctinwwH56C33SGRN0KoW5ikNqqVb1e1qec/EpWkCyEXjLj7no2J
         xYFw==
X-Gm-Message-State: APjAAAXOY51aAha8a2usURQyDgwoW5UfKiXQqhjKeu9o7IAV00xHgfFk
        n54G7fcgZnw4k4v7ntRvSvatdhvkrGPw3JK57JtI0A==
X-Google-Smtp-Source: APXvYqyfdZMEdhCtaaxfh+B4qCTNom6/c2BYMUWqh4DBKKCWWhDI9afd0Cgh5LUmSvFgpOVQYRLXpiyQLabQzng1VgU=
X-Received: by 2002:a05:660c:343:: with SMTP id b3mr15010584itl.52.1560284056894;
 Tue, 11 Jun 2019 13:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <1558449843-19971-1-git-send-email-jhugo@codeaurora.org>
 <933023a0-10fd-fedf-6715-381dae174ad9@codeaurora.org> <20190607203838.1361E208C3@mail.kernel.org>
 <CAOCk7NrnnUzaXtnRvH0pHyHha4sTQDQCRoVPPatHfgVuEPZr0Q@mail.gmail.com> <20190607231841.D101120825@mail.kernel.org>
In-Reply-To: <20190607231841.D101120825@mail.kernel.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 11 Jun 2019 14:14:06 -0600
Message-ID: <CAOCk7NpfG6bTj1E-_f+hXRJgiwe5V_w5Mdg2sYuRY9FHyGqEig@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] MSM8998 Multimedia Clock Controller
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        David Brown <david.brown@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 7, 2019 at 5:18 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Jeffrey Hugo (2019-06-07 14:31:13)
> > On Fri, Jun 7, 2019 at 2:38 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Jeffrey Hugo (2019-05-21 07:52:28)
> > > > On 5/21/2019 8:44 AM, Jeffrey Hugo wrote:
> > > > > The multimedia clock controller (mmcc) is the main clock controller for
> > > > > the multimedia subsystem and is required to enable things like display and
> > > > > camera.
> > > >
> > > > Stephen, I think this series is good to go, and I have display/gpu stuff
> > > > I'm polishing that will depend on this.  Would you kindly pickup patches
> > > > 1, 3, 4, and 5 for 5.3?  I can work with Bjorn to pick up patches 2 and 6.
> > > >
> > >
> > > If I apply patch 3 won't it break boot until patch 2 is also in the
> > > tree? That seems to imply that I'll break bisection, and we have
> > > kernelci boot testing clk-next so this will probably set off alarms
> > > somewhere.
> >
> > Yes, it'll break boot.  Maybe you and Bjorn can make a deal?  (more below)
> >
> > Doesn't look like kernelci is running tests on 8998 anymore, so maybe
> > no one will complain?  As far as I am aware, Marc, Lee, Bjorn, and I
> > are the only ones whom care about 8998 presently, and I think we are
> > all good with a temporary breakage in order to get this basic
> > functionality in since the platform isn't really well supported yet.
>
> Ok.
>
> >
> > >
> > > I thought we had some code that got removed that was going to make the
> > > transition "seamless" in the sense that it would search the tree for an
> > > RPM clk controller and then not add the XO fixed factor clk somehow.
> > > See commit 54823af9cd52 ("clk: qcom: Always add factor clock for xo
> > > clocks") for the code that we removed. So ideally we do something like
> > > this too, but now we search for a property on the calling node to see if
> > > the XO clk is there?
> > >
> >
> > Trying to remember back a bit.
> >
> > I don't think its possible.  Maybe I'm wrong.  I didn't see a solution
> > to the below:
> >
> > How does GCC know the following?
> > -RPMCC is compiled in the build (I guess this can be assumed)
>
> This is the IS_ENABLED part.

Eh, this would assume that someone hasn't compiled RPCC out of tree,
but this is probably me being pedantic.

>
> > -RPMCC has probed
> > -RPMCC is not and will not be providing XO
>
> Presumably if it's enabled then it will be providing XO at some point in
> the future. I'm not suggesting the probe defer logic is removed, just
> that we don't get into a state where clk tree has merged all the patches
> for clk driver side and that then relies on DT to provide the clk but it
> doesn't do that.
>
> So the idea is to check if RPM is compiled in and also check the GCC DT
> node for the clocks property having the xo clk there. Then we assume
> that we have the clk patches in place for the RPM clk driver to provide
> that clk and we skip inserting the fake clk that RPM is going to
> provide.

So, I thought about this, and I don't think it works.  This appears to be a
solution for if RPM is not present.  If, in patch 3, I check for the clocks
property in the gcc DT and don't see it, and I add the fake XO as a result,
I'll end up with a namespace conflict with either GCC or RPMCC failing
to register XO since both will attempt it.

The issue is do we have RPM providing XO (ie patch 3) without a DT
routing it to GCC (ie patch 2).  Since we have patch 3, we know RPM is
going to provide XO.  We just might not have a handle to it to do the
probe_defer logic.

I think the solution is check the DT for the clocks property, if present use
that to attempt to grab XO.  Otherwise, attempt to grab XO from the system
map.  I'll try this in the next rev.

>
> This is also a "general" solution to GCC not depending on or selecting
> the RPM clk driver. It may be better to just have a select statement in
> GCC Kconfig so that we can't enable the GCC driver without also enabling
> the RPM driver if it's an essential dependency to the clk tree working.
> But if we do this design then we can make the clk tree keep working
> regardless of RPM being there or not, which may be a good thing.
>

I'm not sure attempting to sidestep the RPM dependency is worthwhile.
Its not just GCC, but every clock controller that depends on XO, and thus
implicitly RPM.

I suspect any real system is going to have to have the RPM, just by the
nature of what the RPM controls that cannot be managed elsewhere,
such as BIMC.  At some point, a system is going to want to ramp up the
memory bus and DDR speeds to something more than the bare minimum.

Putting in a bunch of code to try to avoid depending on the RPM seems
like effort not well spent as its unlikely such code is going to be active.
