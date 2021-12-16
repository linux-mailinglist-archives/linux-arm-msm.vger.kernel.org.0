Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79CD34768BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 04:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233378AbhLPDeY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 22:34:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbhLPDeX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 22:34:23 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D159C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 19:34:23 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id jo22so22167175qvb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 19:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XXq/mnzKEeEf2jtp4IALqH0LZ08PZLALzoToYrf2550=;
        b=Q1287qr+WDQI6zubBsJgUT2ILale5Nyt8XjOyU4w3YzO0qLNCthdRQsswyFSfRtcRV
         3i6QifkByAq4rof5B5g3E3xa3uos0LA2OmElqiNmO7DKxeXKKKu3bAj3Nijvt5Na8Tis
         Jq2ElTPjCv5bomjpXNLwq/4NHR/SHjKUWS7LcyT6sCG6TaIzr/gdya1YyHB9gZwRMZKA
         jgcgETAe2Ex8Qmvral7SnP2+CWu2PLzV5mJAJB4NF3MnjCN6aJqpKmImCgEIg3oLjfiV
         N1K979IkcSpw6zq812rd/UqDmUoz8NJPZ5xOWOK2H5IfmLd8cV91TSJhHPVfhOFIxoOB
         na8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XXq/mnzKEeEf2jtp4IALqH0LZ08PZLALzoToYrf2550=;
        b=3KZZV7kihOg80fnGeo2jRJFMCW9GgVkLixAx369Ox3/+iIQynSHXGj1rNt0eD2xHpB
         DL7nYbV0YTBuyE+nI8y9XkXApd/tmbR35uHVt+oEHkMh2khnDadL+XELPmyRDOhqHbu6
         ePCg3N7TmAmwyRMIW+oNMmJP8xdiw+d9eY+7IucoA47xzWSRGHoU1Moo3wadM+0XidCT
         SAQisEihRk2E2Zitc1K3hU/V025gb7CfE7TYbNhgenHZmM2ikS1+oq/HWroXKHZuQUh9
         nZnffELoyY3YEmSTVaToFnR4R47vW2JagL2jWRSnOsV/9yb3ZbR/lkY23TR+b5GzXdRe
         IBiQ==
X-Gm-Message-State: AOAM532vZ8o5awqdbsmh0WDHuY9CfcGyM8jeLuwAL/4/CLVnsqLCbAsw
        nv1KkcKSUFoX745Ef7x6hEOgIyqqnxwGQI71aLsrtw==
X-Google-Smtp-Source: ABdhPJxehRW3d3qckDGFz7/BtxWeamZWW8u+3pJxfYP1TddA0KULl+D3bS2Ke7jC5v/OCUgii5E0I/DS49haFRU8HgQ=
X-Received: by 2002:a05:6214:83:: with SMTP id n3mr14206495qvr.122.1639625662551;
 Wed, 15 Dec 2021 19:34:22 -0800 (PST)
MIME-Version: 1.0
References: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org>
 <20211208022210.1300773-3-dmitry.baryshkov@linaro.org> <YbJNp+tnD6kEQAzt@ripper>
 <a4f7d300-90c2-7dda-5cda-5e2763a94912@linaro.org> <20211216013849.69747C36AE1@smtp.kernel.org>
In-Reply-To: <20211216013849.69747C36AE1@smtp.kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 16 Dec 2021 06:34:11 +0300
Message-ID: <CAA8EJpokxg6Urjfm6J0xvbGOCRK2goX94=+awZ8OEW4fv-EoWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sdm845: park disp_cc_mdss_mdp_clk_src
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 16 Dec 2021 at 04:38, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2021-12-15 14:17:40)
> > On 09/12/2021 21:40, Bjorn Andersson wrote:
> > > On Tue 07 Dec 18:22 PST 2021, Dmitry Baryshkov wrote:
> > >
> > >> To stop disp_cc_mdss_mdp_clk_src from getting stuck during boot if it
> > >> was enabled by the bootloader, part it to the TCXO clock source.
> > >>
> > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >> ---
> > >>   drivers/clk/qcom/dispcc-sdm845.c | 3 +++
> > >>   1 file changed, 3 insertions(+)
> > >>
> > >> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
> > >> index 735adfefc379..f2afbba7bc72 100644
> > >> --- a/drivers/clk/qcom/dispcc-sdm845.c
> > >> +++ b/drivers/clk/qcom/dispcc-sdm845.c
> > >> @@ -858,6 +858,9 @@ static int disp_cc_sdm845_probe(struct platform_device *pdev)
> > >>
> > >>      clk_fabia_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
> > >>
> > >> +    /* Park disp_cc_mdss_mdp_clk_src */
> > >> +    clk_rcg2_park_safely(regmap, 0x2088, 0);
> > >
> > > Today booting the system with "clk_ignore_unused" will give you a
> > > working efifb up until the point where the display driver kicks in and
> > > reinitializes the hardware state - which during development might be
> > > indefinite.
> >
> > During development one can introduce a dispcc parameter. Maybe we should
> > add qcom-common parameter telling dispcc drivers to skip parking these
> > clocks.
> >
> > >
> > > If we blindly cut the mdp_clk_src here that will no longer be possible.
> >
> > I think we have several separate tasks here:
> >
> > 1) Support developing code. This is what you have in mind with EFIFB +
> > clk_ignore_unused.
> >
> > 2) Get display to work stable and rock solid. This can include
> > completely tearing down the display pipeline for the sake of getting
> > MDP/MDSS/DSI to work with as few hacks as possible.
> >
> > 3) Gracious handover of display/framebuffer from bootloader to the Linux
> > kernel.
> >
> > For the task #1, you can hack the dispcc as you wish or set any
> > additional parameters, as you are already passing clk_ignore_unused.
> > This will all end up as #1 transitions to #2.
> >
> > I was targetting task#2. Disable everything to let dpu/dsi/dp start from
> > the scratch. If I understand correctly, this approach would also help
> > you with your boot-clock-too-high-for-the-minimum-opp issue. Is my
> > assumption correct?
> >
> > For the task #3 we need collaboration between dispcc, clock core and
> > dpu/dsi drivers. Just marking the clocks for the clk_disable_unused() is
> > the least of the problems that we have here. I think [1] is a bit closer
> > to what I'd expect.
> >
> > I have a similar but slightly different idea of how this can be made to
> > work. I'd do the following (excuse me for the hand waving, no code at hand):
> >
> > - Add clk_ops->inherit_state callback, which can check if the clock is
> > enabled already or not. If it is, set the enable_count to 1, set special
> > CLOCK_INHERITED flag, read back the state, etc.
> >
> > - Make of_clk_set_defaults() ignore clocks with CLOCK_INHERITED flag.
> > Maybe it should return special status telling that some of the clocks
> > were not updated.
>
> This sounds an awful lot like the CLK_HANDOFF flag that never
> materialized. We know we have a problem where the enable state of a clk
> isn't understood at registration time (although we do know the frequency
> of the clk). So far it's been put largely on clk providers to figure out
> that their clk is enabled and avoid doing something if it is. But that's
> run into problems where clk flags that want us to not do something if
> the clk is enabled fail to detect this, see CLK_SET_RATE_GATE for
> example. This should be fixed; patches welcome.
>
> Within the clk framework we don't really want to care about a clk already
> being enabled and keeping track of that via the enable_count. Trying to
> figure out when to "hand that off" is complex, and what exactly is the
> point to it? Drivers still need to call clk_enable to enable the clk, so
> all that really matters is that we know the clk is on at boot and to
> respect the clk flags.

It's a pity. Tracking the pre-enabled clocks status would keep the
clock running till the driver is actually able to pick it up.

> > - Add clk_get_inherit() call, which would drop the CLOCK_INHERITED flag
> > and return previous flag state to calling driver. The driver now assumes
> > ownership of this clock with the enable_count of 1. This way the driver
> > can adjust itself to the current clock state (e.g. drop the frequency,
> > disable the clock and then call of_clk_set_defaults() again to
> > reparent/reclock clocks as necessary, etc). If the parent chain is not
> > fully available, clk_get_inherit must return an error for INHERITED
> > clocks, so that the driver will not cause reparenting of the orphaned
> > clocks.
>
> Please god no more clk_get() APIs! The driver shouldn't care that the
> clk is already enabled when clk_get() returns. The driver must call
> clk_enable() if it wants the clk to be enabled.

What about clk_get returning the clock and clk_enable transferring the
ownership?
I see that Michael Turquette had more or less the same ideas in 2015-2016.

It would ensure that the clock chain stays on till msm takes over the
efifb/splash/etc.

>
> Buried in here is the question of if we should allow clk_get() to
> succeed if the clk is an orphan. I recall that rockchip had some problem
> if we didn't allow orphans to be handed out but it's been years and I've
> forgotten the details. But from a purely high-level we should definitely not
> hand out orphan clks via clk_get() because the clk isn't operable
> outside of clk_set_rate() or clk_set_parent().
>
> And there's more work to do here first by getting rid of the .get_parent
> clk_op and having it return a clk_hw pointer (see my two or three year
> old clk_get_hw series).

Could you please point me to it?

> Once we do that we'll know if we can hand out an
> orphan clk because it may one day be reparented via clk_set_parent() or
> clk_set_rate() vs. the case where we shouldn't hand it out via clk_get()
> because we'll never be able to parent it because the parent(s) doesn't
> exist.



-- 
With best wishes
Dmitry
