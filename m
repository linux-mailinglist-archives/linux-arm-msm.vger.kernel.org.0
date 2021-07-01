Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4693E3B97D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 22:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234190AbhGAVAP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jul 2021 17:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234192AbhGAVAP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jul 2021 17:00:15 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05DC2C061764
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jul 2021 13:57:43 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id b2so8861122oiy.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jul 2021 13:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xaKcdpFN2Fw7OEDvlSL72eEsFlsZE9M1SAXoH6GaDOE=;
        b=KCDSp+iPQWpVLOMxPSrwSVq5HA31cKZynMTvSpoT2vIIQQsexxo9hV+o4ycEBhgbAs
         3JrKLrRm9cVxY+GnHGBSNsqmorNYUPURDFZimp3R5tUtvAkPvYtov4H+rHkSUK9pO+RY
         y6NFIMq9ZW2VKqdR69b/QbbdAoc+vSboS2MqDnwrS9zBgEMjcUfaS0AJ2oxRVXReBetX
         6Vkh53ZfPrfazlNlz4a7lL4DdyM5N+41e4niGDKSOnTzwQT5LwMfxjqvyWVccpSu2dyB
         Ax3RY4kPCFoKMwwWHsA3pv1vvIqDlbX5QGzqIGPHdmxPu+J4xRF+aA3d2P6Ef+jcsRLB
         LV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xaKcdpFN2Fw7OEDvlSL72eEsFlsZE9M1SAXoH6GaDOE=;
        b=EnTLB8PBhBh09R1yq9uzNKVCOupFWk0OL7sdcGaq4lQyfG1XsLdwPHgRa6EE84bhkb
         +tEXB1t4SqcT+AoSewX0tla2opXL84dlnPj+vkWj249Qz+Yicehj2Efohz64wfju24TX
         h6sOFWU6KaMcCNasmJ1Jzl9p06CSEl2BlFLo4Ub0N623W0m1uJtDQk4xIWlqyuY3NiD7
         FGSOhPyqIYJ88oAyvAmcAjHdnoGAw/QHVK2NiwTQEhTyP6i1QCoJ3otZt9YLDs2n2sQC
         aL1vWp3FCee5FDCGprycj0qeaWCmU+QoJZC5HJddn6HtTdhT1eeYpe8DbOdvVV6KAiaL
         /zvQ==
X-Gm-Message-State: AOAM532bMzpN3HUGrObri1lvIqlbVkxOwAgBLk0cDLbalNiJKBW9r26U
        lqnayAE6UJO2IQWw8Iry6IW/mQ==
X-Google-Smtp-Source: ABdhPJx0Wjb0iHhvWkfKXwSwN9GFKAP7ElCkMltSdlOwYuFU97C2uRI4KejvvrJMn//dgOoHW0Q+EA==
X-Received: by 2002:a05:6808:316:: with SMTP id i22mr9216689oie.41.1625173063200;
        Thu, 01 Jul 2021 13:57:43 -0700 (PDT)
Received: from yoga (rrcs-97-77-166-58.sw.biz.rr.com. [97.77.166.58])
        by smtp.gmail.com with ESMTPSA id w2sm253104oia.34.2021.07.01.13.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 13:57:42 -0700 (PDT)
Date:   Thu, 1 Jul 2021 15:57:40 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/6] clk: qcom: gdsc: enable optional power domain support
Message-ID: <YN4sRDqPpZMiNd1T@yoga>
References: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
 <20210630133149.3204290-4-dmitry.baryshkov@linaro.org>
 <YNyHDAHk6ad/XCGl@yoga>
 <CAA8EJpqf6VyaS7KyhujFgST+S=fua4S-uXia0g7Qh7ogYgWYbw@mail.gmail.com>
 <YNylqGEi7Q3tFCgy@yoga>
 <CAA8EJppHQ-XhZWbsPX39wie48JXWvsNerWB9=Q0yxxs7987xxA@mail.gmail.com>
 <YN1DIwR66JKoFhEZ@yoga>
 <CAA8EJpr6qrVJY7DdcNagrpaTFW2FMxE-GE8nHyxmiFHCY0A+jA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpr6qrVJY7DdcNagrpaTFW2FMxE-GE8nHyxmiFHCY0A+jA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 01 Jul 15:12 CDT 2021, Dmitry Baryshkov wrote:

> On Thu, 1 Jul 2021 at 07:23, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> >
> > On Wed 30 Jun 15:29 CDT 2021, Dmitry Baryshkov wrote:
> >
> > > On Wed, 30 Jun 2021 at 20:11, Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > >
> > > > On Wed 30 Jun 10:47 CDT 2021, Dmitry Baryshkov wrote:
> > > >
> > > > > Hi,
> > > > >
> > > > > On Wed, 30 Jun 2021 at 18:00, Bjorn Andersson
> > > > > <bjorn.andersson@linaro.org> wrote:
> > > > > >
> > > > > > On Wed 30 Jun 08:31 CDT 2021, Dmitry Baryshkov wrote:
> > > > > >
> > > > > > > On sm8250 dispcc and videocc registers are powered up by the MMCX power
> > > > > > > domain. Currently we used a regulator to enable this domain on demand,
> > > > > > > however this has some consequences, as genpd code is not reentrant.
> > > > > > >
> > > > > > > Teach Qualcomm clock controller code about setting up power domains and
> > > > > > > using them for gdsc control.
> > > > > > >
> > > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > >
> > > > > > There's a proposal to add a generic binding for statically assigning a
> > > > > > performance states here:
> > > > > >
> > > > > > https://lore.kernel.org/linux-arm-msm/1622095949-2014-1-git-send-email-rnayak@codeaurora.org/
> > >
> > > I checked this thread. It looks like Rajendra will also switch to the
> > > "required-opps" property. So if that series goes in first, we can drop
> > > the call to set_performance_state. If this one goes in first, we can
> > > drop the set_performance_state call after getting Rajendra's work in.
> > >
> > > > > >
> > > > > >
> > > > > > But that said, do you really need this?
> > > > > >
> > > > > > The requirement for driving MMCX to LOW_SVS on SM8250 (and NOM on
> > > > > > SM8150/SC8180x) seems to only come from the fact that you push MDP_CLK
> > > > > > to 460MHz in &mdss.
> > > > > >
> > > > > > But then in &mdss_mdp you do the same using an opp-table based on the
> > > > > > actual MDP_CLK, which per its power-domains will scale MMCX accordingly.
> > > > >
> > > > > MDSS and DSI would bump up MMCX performance state requirements on
> > > > > their own, depending on the frequency being selected.
> > > > >
> > > >
> > > > Right, but as I copied things from the sm8250.dtsi to come up with
> > > > sm8150/sc8180x.dtsi I concluded that as soon as the assigned-clockrate
> > > > in &mdss kicks in I need the performance state to be at NOM.
> > > >
> > > > So keeping the assigned-clockrate in &mdss means that MMCX will never go
> > > > below NOM.
> > >
> > > No, because once MDP is fully running, it will lower the clock frequency:
> > >
> > > # grep mdp_clk /sys/kernel/debug/clk/clk_summary
> > >           disp_cc_mdss_mdp_clk_src       1        1        0
> > > 150000000          0     0  50000         ?
> > >              disp_cc_mdss_mdp_clk       2        2        0
> > > 150000000          0     0  50000         Y
> > >
> >
> > But won't that just lower the performance state requested by the
> > &mdss_mdp, while the &mdss still votes for NOM - with the outcome being
> > that we maintain NOM even if the clock goes down?
> 
> &mdss doesn't vote on performance state. At least it does not on
> msm/msm-next which I have at hand right now.
> &mdss toggles mdss_gdsc, but does not assign any performance state.
> 

Right, but per the upstream implementation, enabling MDSS_GDSC could in
itself fail, because unless something else has driven up the performance
state the enable that trickles up won't actually turn on the supply.

> On the other hand &mdss_mdp and &dsi0 clearly vote on mmcx's performance state.
> 

Right, but it does so as part of its clock scaling, so this makes
perfect sense to me.

> >
> > > >
> > > > > > So wouldn't it be sufficient to ensure that MDSS_GDSC is parented by
> > > > > > MMCX and then use opp-tables associated with the devices that scales the
> > > > > > clock and thereby actually carries the "required-opps".
> > > > >
> > > > > Actually no. I set the performance state in the qcom_cc_map, so that
> > > > > further register access is possible. Initially I was doing this in the
> > > > > qcom_cc_really_probe() and it was already too late.
> > > > > Just to remind: this patchset is not about MDSS_GDSC being parented by
> > > > > MMCX, it is about dispcc/videocc registers being gated with MMCX.
> > > > >
> > > >
> > > > So you're saying that just enabling MMCX isn't enough to touch the
> > > > dispcc/videocc registers? If that's the case it seems like MMCX's
> > > > definition of "on" needs to be adjusted - because just specifying MMCX
> > > > as the power-domain for dispcc/videocc and enabling pm_runtime should
> > > > ensure that MMCX is enabled when the clock registers are accessed (I
> > > > don't see anything like that for the GDSC part though).
> > >
> > > No, it is not enough. If I comment out the set_performance_state call,
> > > the board reboots.
> > >
> > > However I can set the opps as low as RET and register access will work.
> > > I'll run more experiments and if everything works as expected, I can
> > > use retention or min_svs level in the next iteration.
> > > Just note that downstream specifies low_svs as minimum voltage level
> > > for MMCX regulator.
> > >
> >
> > It doesn't make sense to me that a lone power_on on the power-domain
> > wouldn't give us enough juice to poke the registers.
> >
> > But digging into the rpmhpd implementation answers the question, simply
> > invoking rpmhpd_power_on() is a nop, unless
> > rpmhpd_set_performance_state() has previously been called, because
> > pd->corner is 0. So this explains why enable isn't sufficient.
> >
> > Compare this with the rpmpd implementation that will send an
> > enable request to the RPM in this case.
> 
> Do you think that we should change that to:
> 
> rpmhpd_aggregate_corner(pd, max(pd->corner, 1)) ?
> 
> Or
> 
> rpmhpd_aggregate_corner(pd, max(pd->corner, pd->levels[1])) ?
> 

In rpmhpd_power_on() and rpmhpd_set_performance_state() we pass the
index of the entry in pd->levels[] that we want, but in
rpmhpd_power_off() we pass the value of pd->levels[0].

So I would suggest dropping the if (pd->corner) and doing:

  rpmhpd_aggregate_corner(pd, max(pd->corner, 1));

And it seems both rb3 and rb5 still boots with this change (but I need
to do some more testing to know for sure).

> >
> > > > I thought our problem you had was that you need to set a
> > > > performance_state in order to clock up some of the clocks - e.g.
> > > > MDP_CLK.
> > >
> > > No, even register access needs proper perf state.
> > >
> >
> > Per above finding you're right, enabling a rpmhpd power-domain doesn't
> > do anything. And I don't find this intuitive or even in line with the
> > expectations of the api...
> >
> >
> >
> > A quick test booting rb3 and rb5 seems to indicate that it's possible to
> > initialize pd->corner to 1 (to ensure that enable at least gives us the
> > lowest level).
> >
> > set_performance_state(0) will however then result in voting for "off",
> > rather than the lowest enabled level.
> 
> Well, set_performance_state(0) means that "the device wouldn't
> participate anymore to find the target performance state of the
> genpd".

I agree.

> Strictly speaking it does not specify whether it is ok to turn
> it off or not. (like the regulator with the voltage set to 0V).
> But I'd also like to hear a comment from Stephen here.
> 

Looking at other power-domains (e.g. gdsc and rpmpd) enabling the
power-domain means it is no longer off and if you need some specific
performance state you have to vote for that.

So I'm also interested in hearing if there's any reasoning behind how
this was written.

Regards,
Bjorn
