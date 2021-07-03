Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C013BA6E2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jul 2021 05:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbhGCDWt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jul 2021 23:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230375AbhGCDWp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jul 2021 23:22:45 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 452B1C061762
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jul 2021 20:20:12 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id t24-20020a9d7f980000b029046f4a1a5ec4so12168912otp.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jul 2021 20:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tV2LkopDM2u372bsQhKMDYDzKmpYBmHyPi964WS1CIg=;
        b=A4gylom3TnLo38/TdQlrTHnuK/mkmVF17oI9sAHIM+DBwvUwcKKVOEr/YdQ10MxVcz
         t7zhf4GsMmD8EvBTEAkp5BXf20JX4a0FgOy1h8DM1NOGoNQylm0NBOwFJ8EzzAyvfLX1
         9MVsnPVdxOjgjjecfYMGdrUPUjOnk8wikJT1eUU7gdf3vwjN2HJ7q+PHZENYjYL8/8/u
         zP9vuFvuwdK9u/F1jj+es29PwFIUn3VN3t4DNjKl1z1/XMexONDcXvOxmsnQQnk92VB9
         JBqe2g/h9xvqCIti7ctRAoBVnvl1J+vDc8hucfSweuy3sJ3xBXYkrlEZr7/0pi91MYyD
         5GFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tV2LkopDM2u372bsQhKMDYDzKmpYBmHyPi964WS1CIg=;
        b=iwwIOzAJp7Q+NNLUbIlTt0BdbiGyftrrVaxJ3HyN+bnuOPFp6arXFIzVp+VT5/jqaz
         slyjkOzv0BBCu3jeD8CbohyhM8g7fzOmbjjj02EQH71pOp+QIpeedbCta3vE3RhBaTV6
         DRGTV+V7KgHoUSOalCmM06FwLveDJnRNUBKv88R99UVfDh/V0FF2hPRno1XEQAaeCBpZ
         VAPPrrShkJ5PLXfVWnXMdjnTp0iXAzPzQyWtnAj1eU7w9dgVHSGJjVoQ+DzqsD6bPLv/
         Wo3e5DlGDlZMuBJl3QpkdNUriyL9mldDiYlnDMDcsby6hvat93k+3vZ1DN351mgfDpIJ
         R2Yg==
X-Gm-Message-State: AOAM5301Hr2FmXXxE6rL/J0lrWqzqHrw11+FCczsGcvi58qt9A5dQkg0
        /a5X9Ewl1QfncpMg6Tvnh2LhIQ==
X-Google-Smtp-Source: ABdhPJweId/VyqbBDCAPTarD2Fif+9PxI9+7lefXm8EB0Jb0dO4f58RpfAds7ESK+AK8SZQkzkhkew==
X-Received: by 2002:a05:6830:1b6b:: with SMTP id d11mr1933556ote.86.1625282410673;
        Fri, 02 Jul 2021 20:20:10 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z22sm1009675otk.16.2021.07.02.20.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 20:20:09 -0700 (PDT)
Date:   Fri, 2 Jul 2021 22:20:07 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
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
Message-ID: <YN/XZ9g2q8AH39EE@yoga>
References: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
 <20210630133149.3204290-4-dmitry.baryshkov@linaro.org>
 <YNyHDAHk6ad/XCGl@yoga>
 <CAA8EJpqf6VyaS7KyhujFgST+S=fua4S-uXia0g7Qh7ogYgWYbw@mail.gmail.com>
 <YNylqGEi7Q3tFCgy@yoga>
 <CAA8EJppHQ-XhZWbsPX39wie48JXWvsNerWB9=Q0yxxs7987xxA@mail.gmail.com>
 <YN1DIwR66JKoFhEZ@yoga>
 <CAA8EJpr6qrVJY7DdcNagrpaTFW2FMxE-GE8nHyxmiFHCY0A+jA@mail.gmail.com>
 <YN4sRDqPpZMiNd1T@yoga>
 <ea5d9cea-a501-b8d7-e0b7-79110b84c4e6@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea5d9cea-a501-b8d7-e0b7-79110b84c4e6@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 02 Jul 02:35 CDT 2021, Rajendra Nayak wrote:

> 
> 
> On 7/2/2021 2:27 AM, Bjorn Andersson wrote:
> > On Thu 01 Jul 15:12 CDT 2021, Dmitry Baryshkov wrote:
> > 
> > > On Thu, 1 Jul 2021 at 07:23, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> > > > 
> > > > On Wed 30 Jun 15:29 CDT 2021, Dmitry Baryshkov wrote:
> > > > 
> > > > > On Wed, 30 Jun 2021 at 20:11, Bjorn Andersson
> > > > > <bjorn.andersson@linaro.org> wrote:
> > > > > > 
> > > > > > On Wed 30 Jun 10:47 CDT 2021, Dmitry Baryshkov wrote:
> > > > > > 
> > > > > > > Hi,
> > > > > > > 
> > > > > > > On Wed, 30 Jun 2021 at 18:00, Bjorn Andersson
> > > > > > > <bjorn.andersson@linaro.org> wrote:
> > > > > > > > 
> > > > > > > > On Wed 30 Jun 08:31 CDT 2021, Dmitry Baryshkov wrote:
> > > > > > > > 
> > > > > > > > > On sm8250 dispcc and videocc registers are powered up by the MMCX power
> > > > > > > > > domain. Currently we used a regulator to enable this domain on demand,
> > > > > > > > > however this has some consequences, as genpd code is not reentrant.
> > > > > > > > > 
> > > > > > > > > Teach Qualcomm clock controller code about setting up power domains and
> > > > > > > > > using them for gdsc control.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > > 
> > > > > > > > There's a proposal to add a generic binding for statically assigning a
> > > > > > > > performance states here:
> > > > > > > > 
> > > > > > > > https://lore.kernel.org/linux-arm-msm/1622095949-2014-1-git-send-email-rnayak@codeaurora.org/
> > > > > 
> > > > > I checked this thread. It looks like Rajendra will also switch to the
> > > > > "required-opps" property. So if that series goes in first, we can drop
> > > > > the call to set_performance_state. If this one goes in first, we can
> > > > > drop the set_performance_state call after getting Rajendra's work in.
> > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > But that said, do you really need this?
> > > > > > > > 
> > > > > > > > The requirement for driving MMCX to LOW_SVS on SM8250 (and NOM on
> > > > > > > > SM8150/SC8180x) seems to only come from the fact that you push MDP_CLK
> > > > > > > > to 460MHz in &mdss.
> > > > > > > > 
> > > > > > > > But then in &mdss_mdp you do the same using an opp-table based on the
> > > > > > > > actual MDP_CLK, which per its power-domains will scale MMCX accordingly.
> > > > > > > 
> > > > > > > MDSS and DSI would bump up MMCX performance state requirements on
> > > > > > > their own, depending on the frequency being selected.
> > > > > > > 
> > > > > > 
> > > > > > Right, but as I copied things from the sm8250.dtsi to come up with
> > > > > > sm8150/sc8180x.dtsi I concluded that as soon as the assigned-clockrate
> > > > > > in &mdss kicks in I need the performance state to be at NOM.
> > > > > > 
> > > > > > So keeping the assigned-clockrate in &mdss means that MMCX will never go
> > > > > > below NOM.
> > > > > 
> > > > > No, because once MDP is fully running, it will lower the clock frequency:
> > > > > 
> > > > > # grep mdp_clk /sys/kernel/debug/clk/clk_summary
> > > > >            disp_cc_mdss_mdp_clk_src       1        1        0
> > > > > 150000000          0     0  50000         ?
> > > > >               disp_cc_mdss_mdp_clk       2        2        0
> > > > > 150000000          0     0  50000         Y
> > > > > 
> > > > 
> > > > But won't that just lower the performance state requested by the
> > > > &mdss_mdp, while the &mdss still votes for NOM - with the outcome being
> > > > that we maintain NOM even if the clock goes down?
> > > 
> > > &mdss doesn't vote on performance state. At least it does not on
> > > msm/msm-next which I have at hand right now.
> > > &mdss toggles mdss_gdsc, but does not assign any performance state.
> > > 
> > 
> > Right, but per the upstream implementation, enabling MDSS_GDSC could in
> > itself fail, because unless something else has driven up the performance
> > state the enable that trickles up won't actually turn on the supply.
> > 
> > > On the other hand &mdss_mdp and &dsi0 clearly vote on mmcx's performance state.
> > > 
> > 
> > Right, but it does so as part of its clock scaling, so this makes
> > perfect sense to me.
> > 
> > > > 
> > > > > > 
> > > > > > > > So wouldn't it be sufficient to ensure that MDSS_GDSC is parented by
> > > > > > > > MMCX and then use opp-tables associated with the devices that scales the
> > > > > > > > clock and thereby actually carries the "required-opps".
> > > > > > > 
> > > > > > > Actually no. I set the performance state in the qcom_cc_map, so that
> > > > > > > further register access is possible. Initially I was doing this in the
> > > > > > > qcom_cc_really_probe() and it was already too late.
> > > > > > > Just to remind: this patchset is not about MDSS_GDSC being parented by
> > > > > > > MMCX, it is about dispcc/videocc registers being gated with MMCX.
> > > > > > > 
> > > > > > 
> > > > > > So you're saying that just enabling MMCX isn't enough to touch the
> > > > > > dispcc/videocc registers? If that's the case it seems like MMCX's
> > > > > > definition of "on" needs to be adjusted - because just specifying MMCX
> > > > > > as the power-domain for dispcc/videocc and enabling pm_runtime should
> > > > > > ensure that MMCX is enabled when the clock registers are accessed (I
> > > > > > don't see anything like that for the GDSC part though).
> > > > > 
> > > > > No, it is not enough. If I comment out the set_performance_state call,
> > > > > the board reboots.
> > > > > 
> > > > > However I can set the opps as low as RET and register access will work.
> > > > > I'll run more experiments and if everything works as expected, I can
> > > > > use retention or min_svs level in the next iteration.
> > > > > Just note that downstream specifies low_svs as minimum voltage level
> > > > > for MMCX regulator.
> > > > > 
> > > > 
> > > > It doesn't make sense to me that a lone power_on on the power-domain
> > > > wouldn't give us enough juice to poke the registers.
> > > > 
> > > > But digging into the rpmhpd implementation answers the question, simply
> > > > invoking rpmhpd_power_on() is a nop, unless
> > > > rpmhpd_set_performance_state() has previously been called, because
> > > > pd->corner is 0. So this explains why enable isn't sufficient.
> > > > 
> > > > Compare this with the rpmpd implementation that will send an
> > > > enable request to the RPM in this case.
> 
> Right, in case of RPMh, there was no separate 'enable' request which
> could be sent, there was just a 'corner' request.
> 
> I don't completely recall, but the reason to not send a 'default corner'
> on enable was perhaps to keep the enable and set_performance orthogonal.
> 
> However, given we then decided to send the lowest possible corner
> in disable, it perhaps makes sense to send a 'lowest non-zero corner' on enable
> as well.
> 

I was slightly worries that the change would dump cx and mx from
whatever level the bootloader put it at down to LOW_SVS during boot.

But both rb3 and rb5 boots fine with this change, so I posted it here:
https://lore.kernel.org/linux-arm-msm/20210703025449.2687201-1-bjorn.andersson@linaro.org/

> > > 
> > > Do you think that we should change that to:
> > > 
> > > rpmhpd_aggregate_corner(pd, max(pd->corner, 1)) ?
> > > 
> > > Or
> > > 
> > > rpmhpd_aggregate_corner(pd, max(pd->corner, pd->levels[1])) ?
> > > 
> > 
> > In rpmhpd_power_on() and rpmhpd_set_performance_state() we pass the
> > index of the entry in pd->levels[] that we want, but in
> > rpmhpd_power_off() we pass the value of pd->levels[0].
> > 
> > So I would suggest dropping the if (pd->corner) and doing:
> > 
> >    rpmhpd_aggregate_corner(pd, max(pd->corner, 1));
> 
> So the index value represents the hlvl (0-15) that eventually gets sent to
> rpmh, the pd->levels are the sparse vlvl values that come from the command
> DB mappings.
> 
> What seems sane is to sent the lowest non-zero vlvl. That in most cases
> would be at index 1, but for some which do not support complete off,
> it could be at index 0.
> 

I took this into consideration in above patch, keeping track of the
first non-zero corner and using this when the domain is enabled.

Unfortunately, if the first entry would be say LOW_SVS power_off would
request corner (hlvl) 64. So I fixed that in patch 1/2 in above series.

Regards,
Bjorn

> > 
> > And it seems both rb3 and rb5 still boots with this change (but I need
> > to do some more testing to know for sure).
> > 
> > > > 
> > > > > > I thought our problem you had was that you need to set a
> > > > > > performance_state in order to clock up some of the clocks - e.g.
> > > > > > MDP_CLK.
> > > > > 
> > > > > No, even register access needs proper perf state.
> > > > > 
> > > > 
> > > > Per above finding you're right, enabling a rpmhpd power-domain doesn't
> > > > do anything. And I don't find this intuitive or even in line with the
> > > > expectations of the api...
> > > > 
> > > > 
> > > > 
> > > > A quick test booting rb3 and rb5 seems to indicate that it's possible to
> > > > initialize pd->corner to 1 (to ensure that enable at least gives us the
> > > > lowest level).
> > > > 
> > > > set_performance_state(0) will however then result in voting for "off",
> > > > rather than the lowest enabled level.
> > > 
> > > Well, set_performance_state(0) means that "the device wouldn't
> > > participate anymore to find the target performance state of the
> > > genpd".
> > 
> > I agree.
> > 
> > > Strictly speaking it does not specify whether it is ok to turn
> > > it off or not. (like the regulator with the voltage set to 0V).
> > > But I'd also like to hear a comment from Stephen here.
> > > 
> > 
> > Looking at other power-domains (e.g. gdsc and rpmpd) enabling the
> > power-domain means it is no longer off and if you need some specific
> > performance state you have to vote for that.
> > 
> > So I'm also interested in hearing if there's any reasoning behind how
> > this was written.
> > 
> > Regards,
> > Bjorn
> > 
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
