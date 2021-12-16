Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B12547677A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 02:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232605AbhLPBiu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 20:38:50 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:58372 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232576AbhLPBiu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 20:38:50 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1DFC061B8E;
        Thu, 16 Dec 2021 01:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69747C36AE1;
        Thu, 16 Dec 2021 01:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639618729;
        bh=W8uzl9WQID9wn9qU/d5EE2OS7Nsn5jFytQWpTJE3ifw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZW03Yc3qKNi/JeNs8MTBb46Jl8EmihD7tqeyCUsl2F58OANvYBRtmtLmwdSCiCkC3
         gr2BveZb02MJ+wPytJggOeq/EZgWo2F/y7RjNQxZ9Nja0kGeITPJnEeHzopyccbNbk
         MquInPH2KgMygwq7ShIUsy6DPPNamU2321Jm1nCkgURXKxhOBhKvIF1WpPDLAcvygU
         prCvwecXX8FiIWTHB/hUhb9KHIJ92mWn0wQS0GQgMAZNh/q3ve6OuFryj0eQ9+O53A
         YrhBZkIWVtHhWXdVyBeqAXquFKZ4B1hyl2tDgaleqxmogKcbqNCb0oolUkFJ154RT0
         bKuLOxLSZPudQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a4f7d300-90c2-7dda-5cda-5e2763a94912@linaro.org>
References: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org> <20211208022210.1300773-3-dmitry.baryshkov@linaro.org> <YbJNp+tnD6kEQAzt@ripper> <a4f7d300-90c2-7dda-5cda-5e2763a94912@linaro.org>
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sdm845: park disp_cc_mdss_mdp_clk_src
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 15 Dec 2021 17:38:48 -0800
User-Agent: alot/0.9.1
Message-Id: <20211216013849.69747C36AE1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-12-15 14:17:40)
> On 09/12/2021 21:40, Bjorn Andersson wrote:
> > On Tue 07 Dec 18:22 PST 2021, Dmitry Baryshkov wrote:
> >=20
> >> To stop disp_cc_mdss_mdp_clk_src from getting stuck during boot if it
> >> was enabled by the bootloader, part it to the TCXO clock source.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >>   drivers/clk/qcom/dispcc-sdm845.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispc=
c-sdm845.c
> >> index 735adfefc379..f2afbba7bc72 100644
> >> --- a/drivers/clk/qcom/dispcc-sdm845.c
> >> +++ b/drivers/clk/qcom/dispcc-sdm845.c
> >> @@ -858,6 +858,9 @@ static int disp_cc_sdm845_probe(struct platform_de=
vice *pdev)
> >>  =20
> >>      clk_fabia_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_conf=
ig);
> >>  =20
> >> +    /* Park disp_cc_mdss_mdp_clk_src */
> >> +    clk_rcg2_park_safely(regmap, 0x2088, 0);
> >=20
> > Today booting the system with "clk_ignore_unused" will give you a
> > working efifb up until the point where the display driver kicks in and
> > reinitializes the hardware state - which during development might be
> > indefinite.
>=20
> During development one can introduce a dispcc parameter. Maybe we should =

> add qcom-common parameter telling dispcc drivers to skip parking these=20
> clocks.
>=20
> >=20
> > If we blindly cut the mdp_clk_src here that will no longer be possible.
>=20
> I think we have several separate tasks here:
>=20
> 1) Support developing code. This is what you have in mind with EFIFB +=20
> clk_ignore_unused.
>=20
> 2) Get display to work stable and rock solid. This can include=20
> completely tearing down the display pipeline for the sake of getting=20
> MDP/MDSS/DSI to work with as few hacks as possible.
>=20
> 3) Gracious handover of display/framebuffer from bootloader to the Linux =

> kernel.
>=20
> For the task #1, you can hack the dispcc as you wish or set any=20
> additional parameters, as you are already passing clk_ignore_unused.=20
> This will all end up as #1 transitions to #2.
>=20
> I was targetting task#2. Disable everything to let dpu/dsi/dp start from =

> the scratch. If I understand correctly, this approach would also help=20
> you with your boot-clock-too-high-for-the-minimum-opp issue. Is my=20
> assumption correct?
>=20
> For the task #3 we need collaboration between dispcc, clock core and=20
> dpu/dsi drivers. Just marking the clocks for the clk_disable_unused() is =

> the least of the problems that we have here. I think [1] is a bit closer =

> to what I'd expect.
>=20
> I have a similar but slightly different idea of how this can be made to=20
> work. I'd do the following (excuse me for the hand waving, no code at han=
d):
>=20
> - Add clk_ops->inherit_state callback, which can check if the clock is=20
> enabled already or not. If it is, set the enable_count to 1, set special =

> CLOCK_INHERITED flag, read back the state, etc.
>=20
> - Make of_clk_set_defaults() ignore clocks with CLOCK_INHERITED flag.=20
> Maybe it should return special status telling that some of the clocks=20
> were not updated.

This sounds an awful lot like the CLK_HANDOFF flag that never
materialized. We know we have a problem where the enable state of a clk
isn't understood at registration time (although we do know the frequency
of the clk). So far it's been put largely on clk providers to figure out
that their clk is enabled and avoid doing something if it is. But that's
run into problems where clk flags that want us to not do something if
the clk is enabled fail to detect this, see CLK_SET_RATE_GATE for
example. This should be fixed; patches welcome.

Within the clk framework we don't really want to care about a clk already
being enabled and keeping track of that via the enable_count. Trying to
figure out when to "hand that off" is complex, and what exactly is the
point to it? Drivers still need to call clk_enable to enable the clk, so
all that really matters is that we know the clk is on at boot and to
respect the clk flags.

>=20
> - Add clk_get_inherit() call, which would drop the CLOCK_INHERITED flag=20
> and return previous flag state to calling driver. The driver now assumes =

> ownership of this clock with the enable_count of 1. This way the driver=20
> can adjust itself to the current clock state (e.g. drop the frequency,=20
> disable the clock and then call of_clk_set_defaults() again to=20
> reparent/reclock clocks as necessary, etc). If the parent chain is not=20
> fully available, clk_get_inherit must return an error for INHERITED=20
> clocks, so that the driver will not cause reparenting of the orphaned=20
> clocks.

Please god no more clk_get() APIs! The driver shouldn't care that the
clk is already enabled when clk_get() returns. The driver must call
clk_enable() if it wants the clk to be enabled.

Buried in here is the question of if we should allow clk_get() to
succeed if the clk is an orphan. I recall that rockchip had some problem
if we didn't allow orphans to be handed out but it's been years and I've
forgotten the details. But from a purely high-level we should definitely not
hand out orphan clks via clk_get() because the clk isn't operable
outside of clk_set_rate() or clk_set_parent().

And there's more work to do here first by getting rid of the .get_parent
clk_op and having it return a clk_hw pointer (see my two or three year
old clk_get_hw series). Once we do that we'll know if we can hand out an
orphan clk because it may one day be reparented via clk_set_parent() or
clk_set_rate() vs. the case where we shouldn't hand it out via clk_get()
because we'll never be able to parent it because the parent(s) doesn't
exist.
