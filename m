Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 336F73B8CEC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 06:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbhGAEZd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jul 2021 00:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231844AbhGAEZd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jul 2021 00:25:33 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBF9C0617AE
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 21:23:03 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id x62-20020a4a41410000b029024fb8f731dfso672436ooa.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 21:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SjIkznd62qf0N2/dK9GJzXrfd0rBEDC5ueAUYi6JXT8=;
        b=Q7zdFbK5igGTcfVQOu4L33G/7Tz6XEb5PGkaU7fcUbR4Mzm9M/0JUIBoycrc/sLBS5
         8zRGzxme9L1Tvc66bmXrwHecEpBlL726C5pC7gd05Qn+1Qa+icC63XUzAVMKGtD5YrNt
         WpX+6NvFfNOSx52dykN3gNuSbQr7ui0flDFJhQ+fQjGdnn44XitejCpzINUa2ZXOM/r/
         5xoBzIGBw+WG8liSkXOZPnNghoZAoDmVDjfIBNunRafIYA88O6wknebK1okQlha8nHw/
         IVvzn1mscofD9wkgvaExPVmvTKr9XQwTBLOqQGHSbLqGlvLiQ6Hdp1gUabnXrk5GLVEa
         ZUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SjIkznd62qf0N2/dK9GJzXrfd0rBEDC5ueAUYi6JXT8=;
        b=cGWMrgapM/esvtvOh9yyi+T49bSs1e+PMKVNjxmCUWyvRcVq/LBc6o4GAtSLVpL68H
         KzlxGwI8DO1P3NdBmeFOgBQbWTo9P56L50KzhwLEddjk6ndb52AblUbfnO7OyTthQ0eZ
         /iyHfaU0butsiGjMZenBjF4+hMVPlj+UF1uGSPPl5pYhyaLdNEU8Z0rqjd+sY0lRPDEs
         K8vR+9jHCFGRxm3PNU9uArmzT/gFgC/8I2dbYJEZ9b9XbSeaYOQzjf32rZCOQ0sA0zkz
         5m66zTQvOB5ZGI8bvJF+xSbph4szxA6J1mS3Tgab13Y5x7xEDQgxWsRtl0q5ToSoq1+p
         1D0w==
X-Gm-Message-State: AOAM533AKl9lkpU4nHQVZAGFPpn6CtJsa9PncC3v9nCdX4hG1wp61/KA
        Pwe26u4qgzTHbRB5vSMsq4FtFA==
X-Google-Smtp-Source: ABdhPJzGiYEJBTQyjeWOlkqjXC9UawH0lJec0qTnkXoF5eOQ/ZxncxUtoaRTIqppCAZV9eNIgv6czg==
X-Received: by 2002:a4a:8901:: with SMTP id f1mr11392225ooi.66.1625113382138;
        Wed, 30 Jun 2021 21:23:02 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o25sm4993775ood.20.2021.06.30.21.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 21:23:01 -0700 (PDT)
Date:   Wed, 30 Jun 2021 23:22:59 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, rnayak@codeaurora.org
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
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
Message-ID: <YN1DIwR66JKoFhEZ@yoga>
References: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
 <20210630133149.3204290-4-dmitry.baryshkov@linaro.org>
 <YNyHDAHk6ad/XCGl@yoga>
 <CAA8EJpqf6VyaS7KyhujFgST+S=fua4S-uXia0g7Qh7ogYgWYbw@mail.gmail.com>
 <YNylqGEi7Q3tFCgy@yoga>
 <CAA8EJppHQ-XhZWbsPX39wie48JXWvsNerWB9=Q0yxxs7987xxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppHQ-XhZWbsPX39wie48JXWvsNerWB9=Q0yxxs7987xxA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 30 Jun 15:29 CDT 2021, Dmitry Baryshkov wrote:

> On Wed, 30 Jun 2021 at 20:11, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Wed 30 Jun 10:47 CDT 2021, Dmitry Baryshkov wrote:
> >
> > > Hi,
> > >
> > > On Wed, 30 Jun 2021 at 18:00, Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > >
> > > > On Wed 30 Jun 08:31 CDT 2021, Dmitry Baryshkov wrote:
> > > >
> > > > > On sm8250 dispcc and videocc registers are powered up by the MMCX power
> > > > > domain. Currently we used a regulator to enable this domain on demand,
> > > > > however this has some consequences, as genpd code is not reentrant.
> > > > >
> > > > > Teach Qualcomm clock controller code about setting up power domains and
> > > > > using them for gdsc control.
> > > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >
> > > > There's a proposal to add a generic binding for statically assigning a
> > > > performance states here:
> > > >
> > > > https://lore.kernel.org/linux-arm-msm/1622095949-2014-1-git-send-email-rnayak@codeaurora.org/
> 
> I checked this thread. It looks like Rajendra will also switch to the
> "required-opps" property. So if that series goes in first, we can drop
> the call to set_performance_state. If this one goes in first, we can
> drop the set_performance_state call after getting Rajendra's work in.
> 
> > > >
> > > >
> > > > But that said, do you really need this?
> > > >
> > > > The requirement for driving MMCX to LOW_SVS on SM8250 (and NOM on
> > > > SM8150/SC8180x) seems to only come from the fact that you push MDP_CLK
> > > > to 460MHz in &mdss.
> > > >
> > > > But then in &mdss_mdp you do the same using an opp-table based on the
> > > > actual MDP_CLK, which per its power-domains will scale MMCX accordingly.
> > >
> > > MDSS and DSI would bump up MMCX performance state requirements on
> > > their own, depending on the frequency being selected.
> > >
> >
> > Right, but as I copied things from the sm8250.dtsi to come up with
> > sm8150/sc8180x.dtsi I concluded that as soon as the assigned-clockrate
> > in &mdss kicks in I need the performance state to be at NOM.
> >
> > So keeping the assigned-clockrate in &mdss means that MMCX will never go
> > below NOM.
> 
> No, because once MDP is fully running, it will lower the clock frequency:
> 
> # grep mdp_clk /sys/kernel/debug/clk/clk_summary
>           disp_cc_mdss_mdp_clk_src       1        1        0
> 150000000          0     0  50000         ?
>              disp_cc_mdss_mdp_clk       2        2        0
> 150000000          0     0  50000         Y
> 

But won't that just lower the performance state requested by the
&mdss_mdp, while the &mdss still votes for NOM - with the outcome being
that we maintain NOM even if the clock goes down?

> >
> > > > So wouldn't it be sufficient to ensure that MDSS_GDSC is parented by
> > > > MMCX and then use opp-tables associated with the devices that scales the
> > > > clock and thereby actually carries the "required-opps".
> > >
> > > Actually no. I set the performance state in the qcom_cc_map, so that
> > > further register access is possible. Initially I was doing this in the
> > > qcom_cc_really_probe() and it was already too late.
> > > Just to remind: this patchset is not about MDSS_GDSC being parented by
> > > MMCX, it is about dispcc/videocc registers being gated with MMCX.
> > >
> >
> > So you're saying that just enabling MMCX isn't enough to touch the
> > dispcc/videocc registers? If that's the case it seems like MMCX's
> > definition of "on" needs to be adjusted - because just specifying MMCX
> > as the power-domain for dispcc/videocc and enabling pm_runtime should
> > ensure that MMCX is enabled when the clock registers are accessed (I
> > don't see anything like that for the GDSC part though).
> 
> No, it is not enough. If I comment out the set_performance_state call,
> the board reboots.
> 
> However I can set the opps as low as RET and register access will work.
> I'll run more experiments and if everything works as expected, I can
> use retention or min_svs level in the next iteration.
> Just note that downstream specifies low_svs as minimum voltage level
> for MMCX regulator.
> 

It doesn't make sense to me that a lone power_on on the power-domain
wouldn't give us enough juice to poke the registers.

But digging into the rpmhpd implementation answers the question, simply
invoking rpmhpd_power_on() is a nop, unless
rpmhpd_set_performance_state() has previously been called, because
pd->corner is 0. So this explains why enable isn't sufficient.

Compare this with the rpmpd implementation that will send an
enable request to the RPM in this case.

> > I thought our problem you had was that you need to set a
> > performance_state in order to clock up some of the clocks - e.g.
> > MDP_CLK.
> 
> No, even register access needs proper perf state.
> 

Per above finding you're right, enabling a rpmhpd power-domain doesn't
do anything. And I don't find this intuitive or even in line with the
expectations of the api...



A quick test booting rb3 and rb5 seems to indicate that it's possible to
initialize pd->corner to 1 (to ensure that enable at least gives us the
lowest level).

set_performance_state(0) will however then result in voting for "off",
rather than the lowest enabled level.


Rajendra, Stephen, is this really how rpmhpd is supposed to work?!

Regards,
Bjorn
