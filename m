Return-Path: <linux-arm-msm+bounces-137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E9A7E4F6A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 04:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 679AC2815CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 03:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B3C1368;
	Wed,  8 Nov 2023 03:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+2i7M+o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F8B111D;
	Wed,  8 Nov 2023 03:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B25EC433C8;
	Wed,  8 Nov 2023 03:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699413527;
	bh=nr23IYqJ52gB7VQC3QYRB9jW/a2ZZpMsz8yfJxERIYk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=T+2i7M+op4d2+dFKg9orvplaQTtNHLu9MyPG5WQ7s7WPZ5GFAcqhp3WgMIZtgvnr+
	 Zob6sZJg4RO2WZsKd0+OKuMvRCK9Qls2AXc+aGJzjo46yrhbxtxZqSaBbU7aeJZcJf
	 zvSKnGDB3pfGVlC5RZiRR+dDXpW6gFsPJIUF+1LNfSYQCl+FjqhMFWXV5dKEzicOzz
	 SrENZWPx+EQpQCmHANDmIAudG6r76+T+H6bbbogAhisxZQy0IZT1ZhVCKyXXB/V1s5
	 rfNlv5naIBhFEgLdusOeEjWw5p/aYDvvuRBfysfbdMVmgXU0xhAeatw2RkkhQPlLUj
	 5ymA7jHt+FdEg==
Message-ID: <e20129cd99e0685de27d48d73cc2b045.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <849046e96437d11e8fb997597b40979e.sboyd@kernel.org>
References: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org> <20231004012308.2305273-3-dmitry.baryshkov@linaro.org> <2346f541be5b8528ad1a16df256a2f50.sboyd@kernel.org> <1290a5a0f7f584fcce722eeb2a1fd898.sboyd@kernel.org> <CAA8EJpq_pvtCxuPKrHmUOgsDFmDeG8cuUcynvvk-0SJNY3HJnA@mail.gmail.com> <849046e96437d11e8fb997597b40979e.sboyd@kernel.org>
Subject: Re: [RFC PATCH v2 2/3] clk: qcom: implement RCG2 'parked' clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 07 Nov 2023 19:18:45 -0800
User-Agent: alot/0.10

Quoting Stephen Boyd (2023-11-07 14:50:18)
> Quoting Dmitry Baryshkov (2023-11-06 18:00:04)
> > On Tue, 7 Nov 2023 at 03:36, Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Stephen Boyd (2023-11-03 18:24:47)
> > >
> > > I looked at this more today. It seems that I need to both read the
> > > config register at init and also move over the rcg to the safe source=
 at
> > > init (i.e. park the clk at init). That's doable with a call to
> > > clk_rcg2_shared_disable() for the clk_ops::init callback. Otherwise I
> > > get a stuck clk warning.
> > >
> > > Either
> > >
> > >  disp_cc_mdss_mdp_clk status stuck at 'off'
> > >
> > > or
> > >
> > >  disp_cc_mdss_rot_clk status stuck at 'on'
> > >
> > > When I don't park the rcg, the disp_cc_mdss_rot_clk gets stuck during
> > > disabling of unused clks. I think I understand that problem. What
> > > happens is disp_cc_mdss_mdp_clk_src and disp_cc_mdss_rot_clk_src are
> > > both sourcing from disp_cc_pll0 at boot. Fixing the parent mapping ma=
kes
> > > it so that enabling and then disabling disp_cc_mdss_ahb_clk causes
> > > disp_cc_pll0 to be turned off when disp_cc_mdss_rot_clk_src is sourced
> > > from it (and the branch disp_cc_mdss_rot_clk is enabled). If we park
> > > both the rcgs at clk registration time we avoid this problem because =
the
> > > PLL is disabled but nothing is actually a child clk. The act of readi=
ng
> > > the config register and stashing that in the 'parked_cfg' only helps
> > > avoid duplicate calls to change the rate, and doesn't help when we try
> > > to repoint the clk at XO when the parent PLL is off.
> > >
> > > The part I still don't understand is why reading the config register =
at
> > > init and stashing that in 'parked_cfg' fixes the disp_cc_mdss_mdp_clk
> > > stuck at off problem. I see that the branch clk is turned off and on
> > > many times during boot and there aren't any warnings regardless of
> > > stashing the config register. That means we should be moving the RCG =
to
> > > XO source, between forcibly enabling and disabling the RCG, which
> > > presumably would complain about being unable to update the config
> > > register, but it doesn't. Only after late init does the clk fail to
> > > enable, and the source is still XO at that time. Something else must =
be
> > > happening that wedges the branch to the point that it can't be
> > > recovered. But simply reporting the proper parent is enough for
> > > disp_cc_mdss_mdp_clk.
> >=20
> > I suppose that the issue is caused by mdss_gdsc or mmcx also being
> > shut down at the late_init. And if I remember correctly, properly
> > parking disp_cc_mdss_mdp_clk to the XO solves this issue. This is
> > where is_enabled comes to play. Adding it changes the
> > clk_disable_unused behaviour.
>=20
> The thing is that disp_cc_mdss_mdp_clk_src has been parked to XO by the
> time late_init runs. The branch clk (disp_cc_mdss_mdp_clk) has been
> enabled and disabled repeatedly during boot as well, and all those times
> nothing has signaled a failure. That means the RCG has supposedly
> switched away from the disp_cc_pll0 to XO (parked) and the branch isn't
> stuck on or off. So how does turning the mdss_gdsc or mmcx off during
> late_init cause the branch to get stuck off if the parent of the RCG is
> XO? Is something changing the parent back to the display PLL?
>=20

I've found that only marking disp_cc_pll0 as CLK_IGNORE_UNUSED fixes the
problem as well. In this case, mdp and rot clks are both actually
parented to disp_cc_pll0 at boot, but mdp is switched to XO due to
parking while rot is left on disp_cc_pll0 because only the branch is
disabled during unused clk disabling.

When I fix the parent by reading the parked_cfg value at init time,
disp_cc_pll0 is turned off pretty early because the parent of mdp is
discovered to be disp_cc_pll0. I wonder if turning off disp_cc_pll0
somehow "clears" state, but it has to be done in a controlled manner. I
also found that simply never disabling the PLL also fixes it (i.e.
returning early from alpha_pll_fabia_disable if the clk is
disp_cc_pll0). That seems to imply that something about disabling the
PLL during unused clks disabling is bad.

I've also noticed that when the RCG is enabled before turning on the
stuck off disp_cc_mdss_mdp_clk that the RCG root_off bit (bit 31) is
clear. Something is turning the RCG clk on when software thinks it is
off, but that should be OK because the parent is XO. Before this point
(and late init), the RCG is off when software thinks it is off. I
printed the config register from the unused clk disabling code and the
rcg is still off after we disable the PLL.

I also tried skipping slamming a bunch of PLL config register writes
into the PLL at probe by removing the clk_fabia_pll_configure() call but
it doesn't fix it. Maybe I need to measure the clk at probe time to see
if it is actually on XO or if it is stuck on the PLL but all the
registers are saying it is XO.

