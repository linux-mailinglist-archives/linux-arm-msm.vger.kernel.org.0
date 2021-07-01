Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E5F3B970E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 22:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233040AbhGAUPM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jul 2021 16:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233975AbhGAUPM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jul 2021 16:15:12 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4121DC061764
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jul 2021 13:12:40 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id y9so5023301qtx.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jul 2021 13:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IRBdJfZtqdTD8dfu42iDMw+1kiTU/iXVIZE4bw9+r8w=;
        b=Uxtj/3SQ170QVlNu/SMKZ8EZu0BrxZFF1GQy9XJVD54dMG1+175ytv2DGm3HaKK/sO
         HcSy0A+klkKcUI+A4u5m5MrKcIOUYO3iBR0ZKKvLhYEWlck6OyygIYPLV57njq4/Y+aF
         0IN+OO7O5GdjNq7NMjN2pZp8fPOrKcGgEu1Bu7C+EB2RfPJjZUfWkJZh4iDXX/F/8Qm8
         L6CM/fsyQp4XlqgthNWX2o5SJqMk0mmTbiVLSkwPY9BsPMNRq50FrT6ecxA9XV7ttfsk
         9QJ9ZSoVpn2gBSd5UCZxWFkhnH+M8qssL177gkTWppJEdJCe1bK8GIO7x3wx0JV/tbgN
         L/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IRBdJfZtqdTD8dfu42iDMw+1kiTU/iXVIZE4bw9+r8w=;
        b=OI5jy3iMaKrImJZpCOVON7Pc0RB2VLosrwtWCnxoHxZlfurel8tuD/Hbr5hzW4JCaY
         0uj+fJu7LJTRLWCxmHsDFF9Tk9xBS+AmZztoOwGCKCuT4jG+GWRk7XXpbEiV5XquVN8n
         KLmL4W//HPylPiALg4c+Ljn4pv7Ti3AyRNPgFOYDB7qETr83Y2NEhd1QZkagb5YzneO4
         AocEr5tr66tb/tIRy4PcgdpwHHskPpCgmfC3cR+P7mV1wWyzdl7WrWLPPSEOjArQoqX9
         7nqeG+3mbiuKRGwH7l4aW/I1qFyawnNrFGMGvoJ4MjkMGxh2msTvhVqZIaTivsoh3kOm
         tgkw==
X-Gm-Message-State: AOAM532SGMTQlZZVDOGmv9PhPa2xWizVMA4a90ht0ry0VHQzcVykLQS+
        FDvEEG7QbKlt4wMv3CXVDenkksSGsJFQ1+U0gFxNuA==
X-Google-Smtp-Source: ABdhPJw49As8AbIVoei6s0cq92oq3hCWuzSx1MGQeISmA95gFm4I7FY2spyQhoXdh7nHoImLTroCnRgnsNZf+X5rcIk=
X-Received: by 2002:ac8:688:: with SMTP id f8mr1674302qth.135.1625170359373;
 Thu, 01 Jul 2021 13:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
 <20210630133149.3204290-4-dmitry.baryshkov@linaro.org> <YNyHDAHk6ad/XCGl@yoga>
 <CAA8EJpqf6VyaS7KyhujFgST+S=fua4S-uXia0g7Qh7ogYgWYbw@mail.gmail.com>
 <YNylqGEi7Q3tFCgy@yoga> <CAA8EJppHQ-XhZWbsPX39wie48JXWvsNerWB9=Q0yxxs7987xxA@mail.gmail.com>
 <YN1DIwR66JKoFhEZ@yoga>
In-Reply-To: <YN1DIwR66JKoFhEZ@yoga>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 1 Jul 2021 23:12:27 +0300
Message-ID: <CAA8EJpr6qrVJY7DdcNagrpaTFW2FMxE-GE8nHyxmiFHCY0A+jA@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: qcom: gdsc: enable optional power domain support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 1 Jul 2021 at 07:23, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Wed 30 Jun 15:29 CDT 2021, Dmitry Baryshkov wrote:
>
> > On Wed, 30 Jun 2021 at 20:11, Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > On Wed 30 Jun 10:47 CDT 2021, Dmitry Baryshkov wrote:
> > >
> > > > Hi,
> > > >
> > > > On Wed, 30 Jun 2021 at 18:00, Bjorn Andersson
> > > > <bjorn.andersson@linaro.org> wrote:
> > > > >
> > > > > On Wed 30 Jun 08:31 CDT 2021, Dmitry Baryshkov wrote:
> > > > >
> > > > > > On sm8250 dispcc and videocc registers are powered up by the MMCX power
> > > > > > domain. Currently we used a regulator to enable this domain on demand,
> > > > > > however this has some consequences, as genpd code is not reentrant.
> > > > > >
> > > > > > Teach Qualcomm clock controller code about setting up power domains and
> > > > > > using them for gdsc control.
> > > > > >
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > >
> > > > > There's a proposal to add a generic binding for statically assigning a
> > > > > performance states here:
> > > > >
> > > > > https://lore.kernel.org/linux-arm-msm/1622095949-2014-1-git-send-email-rnayak@codeaurora.org/
> >
> > I checked this thread. It looks like Rajendra will also switch to the
> > "required-opps" property. So if that series goes in first, we can drop
> > the call to set_performance_state. If this one goes in first, we can
> > drop the set_performance_state call after getting Rajendra's work in.
> >
> > > > >
> > > > >
> > > > > But that said, do you really need this?
> > > > >
> > > > > The requirement for driving MMCX to LOW_SVS on SM8250 (and NOM on
> > > > > SM8150/SC8180x) seems to only come from the fact that you push MDP_CLK
> > > > > to 460MHz in &mdss.
> > > > >
> > > > > But then in &mdss_mdp you do the same using an opp-table based on the
> > > > > actual MDP_CLK, which per its power-domains will scale MMCX accordingly.
> > > >
> > > > MDSS and DSI would bump up MMCX performance state requirements on
> > > > their own, depending on the frequency being selected.
> > > >
> > >
> > > Right, but as I copied things from the sm8250.dtsi to come up with
> > > sm8150/sc8180x.dtsi I concluded that as soon as the assigned-clockrate
> > > in &mdss kicks in I need the performance state to be at NOM.
> > >
> > > So keeping the assigned-clockrate in &mdss means that MMCX will never go
> > > below NOM.
> >
> > No, because once MDP is fully running, it will lower the clock frequency:
> >
> > # grep mdp_clk /sys/kernel/debug/clk/clk_summary
> >           disp_cc_mdss_mdp_clk_src       1        1        0
> > 150000000          0     0  50000         ?
> >              disp_cc_mdss_mdp_clk       2        2        0
> > 150000000          0     0  50000         Y
> >
>
> But won't that just lower the performance state requested by the
> &mdss_mdp, while the &mdss still votes for NOM - with the outcome being
> that we maintain NOM even if the clock goes down?

&mdss doesn't vote on performance state. At least it does not on
msm/msm-next which I have at hand right now.
&mdss toggles mdss_gdsc, but does not assign any performance state.

On the other hand &mdss_mdp and &dsi0 clearly vote on mmcx's performance state.

>
> > >
> > > > > So wouldn't it be sufficient to ensure that MDSS_GDSC is parented by
> > > > > MMCX and then use opp-tables associated with the devices that scales the
> > > > > clock and thereby actually carries the "required-opps".
> > > >
> > > > Actually no. I set the performance state in the qcom_cc_map, so that
> > > > further register access is possible. Initially I was doing this in the
> > > > qcom_cc_really_probe() and it was already too late.
> > > > Just to remind: this patchset is not about MDSS_GDSC being parented by
> > > > MMCX, it is about dispcc/videocc registers being gated with MMCX.
> > > >
> > >
> > > So you're saying that just enabling MMCX isn't enough to touch the
> > > dispcc/videocc registers? If that's the case it seems like MMCX's
> > > definition of "on" needs to be adjusted - because just specifying MMCX
> > > as the power-domain for dispcc/videocc and enabling pm_runtime should
> > > ensure that MMCX is enabled when the clock registers are accessed (I
> > > don't see anything like that for the GDSC part though).
> >
> > No, it is not enough. If I comment out the set_performance_state call,
> > the board reboots.
> >
> > However I can set the opps as low as RET and register access will work.
> > I'll run more experiments and if everything works as expected, I can
> > use retention or min_svs level in the next iteration.
> > Just note that downstream specifies low_svs as minimum voltage level
> > for MMCX regulator.
> >
>
> It doesn't make sense to me that a lone power_on on the power-domain
> wouldn't give us enough juice to poke the registers.
>
> But digging into the rpmhpd implementation answers the question, simply
> invoking rpmhpd_power_on() is a nop, unless
> rpmhpd_set_performance_state() has previously been called, because
> pd->corner is 0. So this explains why enable isn't sufficient.
>
> Compare this with the rpmpd implementation that will send an
> enable request to the RPM in this case.

Do you think that we should change that to:

rpmhpd_aggregate_corner(pd, max(pd->corner, 1)) ?

Or

rpmhpd_aggregate_corner(pd, max(pd->corner, pd->levels[1])) ?

>
> > > I thought our problem you had was that you need to set a
> > > performance_state in order to clock up some of the clocks - e.g.
> > > MDP_CLK.
> >
> > No, even register access needs proper perf state.
> >
>
> Per above finding you're right, enabling a rpmhpd power-domain doesn't
> do anything. And I don't find this intuitive or even in line with the
> expectations of the api...
>
>
>
> A quick test booting rb3 and rb5 seems to indicate that it's possible to
> initialize pd->corner to 1 (to ensure that enable at least gives us the
> lowest level).
>
> set_performance_state(0) will however then result in voting for "off",
> rather than the lowest enabled level.

Well, set_performance_state(0) means that "the device wouldn't
participate anymore to find the target performance state of the
genpd". Strictly speaking it does not specify whether it is ok to turn
it off or not. (like the regulator with the voltage set to 0V).
But I'd also like to hear a comment from Stephen here.


> Rajendra, Stephen, is this really how rpmhpd is supposed to work?!



-- 
With best wishes
Dmitry
