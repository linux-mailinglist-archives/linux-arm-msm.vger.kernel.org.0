Return-Path: <linux-arm-msm+bounces-7-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 360BA7E32A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 02:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2A8AB20A78
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 01:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19C7186C;
	Tue,  7 Nov 2023 01:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bT6izTAG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE70C17F4;
	Tue,  7 Nov 2023 01:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC55C433C7;
	Tue,  7 Nov 2023 01:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699320972;
	bh=kL48fIOTndmBh9Sq5LIKKaJC+DRa+TCqhCyeEJzBeMM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bT6izTAGxcTL/ZNfNkJosin+OA6yE/q62UZD4hOeuNGWMWsUfLiY4Bs66omKmdIue
	 hTPLvI4TT1Hj/3UlDOLEKAyG0zkdF9r6uGPoWPxv5AV88qfUI7H20JvsigwGRayd3m
	 U6/nivePTruLGPCjMzhgwSc6naHAafLVgXDxIvhsJm5ay2wCF0TmfwU1dmQCPa3QJ5
	 zxGqZbM3aPQvoPu7pyM2HRwl7Cn4otihDAx7venQDwcsfTlNXqdrR6ti+bbhza3e3o
	 XLREMr07NH3WqyLLUiOXB45F+kWIZzfAbqLO8bkOPQ9QxhnfoKOMIQfxGJFkiyQgTd
	 SOjeflTLK0+lg==
Message-ID: <1290a5a0f7f584fcce722eeb2a1fd898.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2346f541be5b8528ad1a16df256a2f50.sboyd@kernel.org>
References: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org> <20231004012308.2305273-3-dmitry.baryshkov@linaro.org> <2346f541be5b8528ad1a16df256a2f50.sboyd@kernel.org>
Subject: Re: [RFC PATCH v2 2/3] clk: qcom: implement RCG2 'parked' clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Taniya Das <quic_tdas@quicinc.com>
Date: Mon, 06 Nov 2023 17:36:09 -0800
User-Agent: alot/0.10

Quoting Stephen Boyd (2023-11-03 18:24:47)
> Quoting Dmitry Baryshkov (2023-10-03 18:23:07)
> > +
> > +       ret =3D regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, =
&cfg);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return FIELD_GET(CFG_SRC_SEL_MASK, cfg) !=3D rcg->safe_src_inde=
x;
> > +}
> > +
> > +static int clk_rcg2_parked_init(struct clk_hw *hw)
> > +{
> > +       struct clk_rcg2 *rcg =3D to_clk_rcg2(hw);
> > +       const struct freq_tbl *f =3D rcg->freq_tbl;
> > +
> > +       regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &rcg->parked=
_cfg);
>=20
> I need this part today to fix a stuck clk problem I see on trogdor.lazor
> where during registration a call to clk_ops::get_parent() sees the clk
> isn't enabled at boot (because there isn't a clk_ops::is_enabled()
> function) so clk_rcg2_shared_get_parent() reads the parent from the
> 'parked_cfg' value, which is zero. If the hardware actually has non-zero
> for the parent then the framework will get the wrong parent, which is
> what happens on trogdor when the devmode screen is shown. The parent is
> the display PLL instead of XO. I haven't dug far enough to understand
> why disabling unused clks wedges the branch when we try to enable it
> again, but not disabling unused clks fixes the problem or reading the
> config register at registration to get the proper parent also fixes it.
> I guess the problem is that we're switching the RCG value when we
> shouldn't be doing that.
>=20

I looked at this more today. It seems that I need to both read the
config register at init and also move over the rcg to the safe source at
init (i.e. park the clk at init). That's doable with a call to
clk_rcg2_shared_disable() for the clk_ops::init callback. Otherwise I
get a stuck clk warning.

Either

 disp_cc_mdss_mdp_clk status stuck at 'off'

or

 disp_cc_mdss_rot_clk status stuck at 'on'

When I don't park the rcg, the disp_cc_mdss_rot_clk gets stuck during
disabling of unused clks. I think I understand that problem. What
happens is disp_cc_mdss_mdp_clk_src and disp_cc_mdss_rot_clk_src are
both sourcing from disp_cc_pll0 at boot. Fixing the parent mapping makes
it so that enabling and then disabling disp_cc_mdss_ahb_clk causes
disp_cc_pll0 to be turned off when disp_cc_mdss_rot_clk_src is sourced
from it (and the branch disp_cc_mdss_rot_clk is enabled). If we park
both the rcgs at clk registration time we avoid this problem because the
PLL is disabled but nothing is actually a child clk. The act of reading
the config register and stashing that in the 'parked_cfg' only helps
avoid duplicate calls to change the rate, and doesn't help when we try
to repoint the clk at XO when the parent PLL is off.

The part I still don't understand is why reading the config register at
init and stashing that in 'parked_cfg' fixes the disp_cc_mdss_mdp_clk
stuck at off problem. I see that the branch clk is turned off and on
many times during boot and there aren't any warnings regardless of
stashing the config register. That means we should be moving the RCG to
XO source, between forcibly enabling and disabling the RCG, which
presumably would complain about being unable to update the config
register, but it doesn't. Only after late init does the clk fail to
enable, and the source is still XO at that time. Something else must be
happening that wedges the branch to the point that it can't be
recovered. But simply reporting the proper parent is enough for
disp_cc_mdss_mdp_clk.

