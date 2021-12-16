Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 673674768F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 05:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbhLPEKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 23:10:17 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:49940 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbhLPEKR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 23:10:17 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E5CE161BDF;
        Thu, 16 Dec 2021 04:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8A7C36AE3;
        Thu, 16 Dec 2021 04:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639627816;
        bh=lZOnr8QqXUrRg94PL03YOTAhERYuduDNpbInbvwbG2A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=o+X4w16Ykjuv82Ozy2++hhTexNDNFz8GV7HiPC4tAvSJevJPCUfRGj8m9K3jGzsDc
         a0W02PMf1AOne57a1wO+s4bBcoLjbnlN5D6sD+Tchkoh6GwqwhiPIBhXtqqcj6ken5
         FHF5Dl2wHUNF3qwgUJmsRQ7Cw+ziYbBJkkVyWNuBjdN6p1lENswEIu03QhpHz5pMG1
         LBUxcdskFjocJdw7M2+n94EomT05dOC9oSSsDRtY0CMyW/nRBUt3Jd1LLDwMiORtsI
         7m273zGIj116vvPF7E1XaOPTbq1I60AHvy8unyPriO1+irV61/c/XiYJ6W9PF5VA2G
         fz2EpbrBanDfg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAA8EJpokxg6Urjfm6J0xvbGOCRK2goX94=+awZ8OEW4fv-EoWQ@mail.gmail.com>
References: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org> <20211208022210.1300773-3-dmitry.baryshkov@linaro.org> <YbJNp+tnD6kEQAzt@ripper> <a4f7d300-90c2-7dda-5cda-5e2763a94912@linaro.org> <20211216013849.69747C36AE1@smtp.kernel.org> <CAA8EJpokxg6Urjfm6J0xvbGOCRK2goX94=+awZ8OEW4fv-EoWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sdm845: park disp_cc_mdss_mdp_clk_src
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 15 Dec 2021 20:10:14 -0800
User-Agent: alot/0.9.1
Message-Id: <20211216041016.3E8A7C36AE3@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-12-15 19:34:11)
> On Thu, 16 Dec 2021 at 04:38, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2021-12-15 14:17:40)
> > > On 09/12/2021 21:40, Bjorn Andersson wrote:
> > > > On Tue 07 Dec 18:22 PST 2021, Dmitry Baryshkov wrote:
> > > >
> > > >> To stop disp_cc_mdss_mdp_clk_src from getting stuck during boot if=
 it
> > > >> was enabled by the bootloader, part it to the TCXO clock source.
> > > >>
> > > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >> ---
> > > >>   drivers/clk/qcom/dispcc-sdm845.c | 3 +++
> > > >>   1 file changed, 3 insertions(+)
> > > >>
> > > >> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/d=
ispcc-sdm845.c
> > > >> index 735adfefc379..f2afbba7bc72 100644
> > > >> --- a/drivers/clk/qcom/dispcc-sdm845.c
> > > >> +++ b/drivers/clk/qcom/dispcc-sdm845.c
> > > >> @@ -858,6 +858,9 @@ static int disp_cc_sdm845_probe(struct platfor=
m_device *pdev)
> > > >>
> > > >>      clk_fabia_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_=
config);
> > > >>
> > > >> +    /* Park disp_cc_mdss_mdp_clk_src */
> > > >> +    clk_rcg2_park_safely(regmap, 0x2088, 0);
> > > >
> > > > Today booting the system with "clk_ignore_unused" will give you a
> > > > working efifb up until the point where the display driver kicks in =
and
> > > > reinitializes the hardware state - which during development might be
> > > > indefinite.
> > >
> > > During development one can introduce a dispcc parameter. Maybe we sho=
uld
> > > add qcom-common parameter telling dispcc drivers to skip parking these
> > > clocks.
> > >
> > > >
> > > > If we blindly cut the mdp_clk_src here that will no longer be possi=
ble.
> > >
> > > I think we have several separate tasks here:
> > >
> > > 1) Support developing code. This is what you have in mind with EFIFB +
> > > clk_ignore_unused.
> > >
> > > 2) Get display to work stable and rock solid. This can include
> > > completely tearing down the display pipeline for the sake of getting
> > > MDP/MDSS/DSI to work with as few hacks as possible.
> > >
> > > 3) Gracious handover of display/framebuffer from bootloader to the Li=
nux
> > > kernel.
> > >
> > > For the task #1, you can hack the dispcc as you wish or set any
> > > additional parameters, as you are already passing clk_ignore_unused.
> > > This will all end up as #1 transitions to #2.
> > >
> > > I was targetting task#2. Disable everything to let dpu/dsi/dp start f=
rom
> > > the scratch. If I understand correctly, this approach would also help
> > > you with your boot-clock-too-high-for-the-minimum-opp issue. Is my
> > > assumption correct?
> > >
> > > For the task #3 we need collaboration between dispcc, clock core and
> > > dpu/dsi drivers. Just marking the clocks for the clk_disable_unused()=
 is
> > > the least of the problems that we have here. I think [1] is a bit clo=
ser
> > > to what I'd expect.
> > >
> > > I have a similar but slightly different idea of how this can be made =
to
> > > work. I'd do the following (excuse me for the hand waving, no code at=
 hand):
> > >
> > > - Add clk_ops->inherit_state callback, which can check if the clock is
> > > enabled already or not. If it is, set the enable_count to 1, set spec=
ial
> > > CLOCK_INHERITED flag, read back the state, etc.
> > >
> > > - Make of_clk_set_defaults() ignore clocks with CLOCK_INHERITED flag.
> > > Maybe it should return special status telling that some of the clocks
> > > were not updated.
> >
> > This sounds an awful lot like the CLK_HANDOFF flag that never
> > materialized. We know we have a problem where the enable state of a clk
> > isn't understood at registration time (although we do know the frequency
> > of the clk). So far it's been put largely on clk providers to figure out
> > that their clk is enabled and avoid doing something if it is. But that's
> > run into problems where clk flags that want us to not do something if
> > the clk is enabled fail to detect this, see CLK_SET_RATE_GATE for
> > example. This should be fixed; patches welcome.
> >
> > Within the clk framework we don't really want to care about a clk alrea=
dy
> > being enabled and keeping track of that via the enable_count. Trying to
> > figure out when to "hand that off" is complex, and what exactly is the
> > point to it? Drivers still need to call clk_enable to enable the clk, so
> > all that really matters is that we know the clk is on at boot and to
> > respect the clk flags.
>=20
> It's a pity. Tracking the pre-enabled clocks status would keep the
> clock running till the driver is actually able to pick it up.

I have no problem determining the prepare/enable state at clk
registration time and then using that to make the clk flags work
properly and to skip calling down into the prepare and enable clk_ops.
It needs to be disjoint from the counts though so that the possibility
of handing off the count is removed.

>=20
> > > - Add clk_get_inherit() call, which would drop the CLOCK_INHERITED fl=
ag
> > > and return previous flag state to calling driver. The driver now assu=
mes
> > > ownership of this clock with the enable_count of 1. This way the driv=
er
> > > can adjust itself to the current clock state (e.g. drop the frequency,
> > > disable the clock and then call of_clk_set_defaults() again to
> > > reparent/reclock clocks as necessary, etc). If the parent chain is not
> > > fully available, clk_get_inherit must return an error for INHERITED
> > > clocks, so that the driver will not cause reparenting of the orphaned
> > > clocks.
> >
> > Please god no more clk_get() APIs! The driver shouldn't care that the
> > clk is already enabled when clk_get() returns. The driver must call
> > clk_enable() if it wants the clk to be enabled.
>=20
> What about clk_get returning the clock and clk_enable transferring the
> ownership?

No? Why can't the caller of clk_get() call clk_enable()?

> I see that Michael Turquette had more or less the same ideas in 2015-2016.

Yes

>=20
> It would ensure that the clock chain stays on till msm takes over the
> efifb/splash/etc.

Who is turning off the clk? Some driver or the disable unused code?

>=20
> >
> > Buried in here is the question of if we should allow clk_get() to
> > succeed if the clk is an orphan. I recall that rockchip had some problem
> > if we didn't allow orphans to be handed out but it's been years and I've
> > forgotten the details. But from a purely high-level we should definitel=
y not
> > hand out orphan clks via clk_get() because the clk isn't operable
> > outside of clk_set_rate() or clk_set_parent().
> >
> > And there's more work to do here first by getting rid of the .get_parent
> > clk_op and having it return a clk_hw pointer (see my two or three year
> > old clk_get_hw series).
>=20
> Could you please point me to it?

https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=3Dclk-=
parent-rewrite

My god it's been three years.
