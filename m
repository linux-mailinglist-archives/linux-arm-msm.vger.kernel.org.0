Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEC16118741
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2019 12:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbfLJLv4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Dec 2019 06:51:56 -0500
Received: from onstation.org ([52.200.56.107]:42316 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727681AbfLJLvz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Dec 2019 06:51:55 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id EF4BA3E8F7;
        Tue, 10 Dec 2019 11:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1575978714;
        bh=30eM9AeN2U7UZiaB8mnsdwLndEUaPhap2fjO0o8/B50=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ISDoyhvpC4VpbMXCaTUeDalAIMymmq+F6jnvBUX6eYmgwaIBnpyahiibx4RihlGTJ
         XmbE9ENMbzq1qvkK54tU1Y9MnnGb7ib40RUKVKRPlGo7qEyH3LZp6EHzh1xql2ojiI
         f4n/LaY+uHSbHx+4fnQ8yBu1b+qMP+SnPx02M1Lw=
Date:   Tue, 10 Dec 2019 06:51:53 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     sboyd@kernel.org, dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/7] clk: qcom: add support for setting the duty cycle
Message-ID: <20191210115153.GA10298@onstation.org>
References: <20191205002503.13088-1-masneyb@onstation.org>
 <20191205002503.13088-2-masneyb@onstation.org>
 <0101016eee224b50-8a5545e2-837f-41c2-9574-b385e111a6b3-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016eee224b50-8a5545e2-837f-41c2-9574-b385e111a6b3-000000@us-west-2.amazonses.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Taniya,

On Tue, Dec 10, 2019 at 04:47:35AM +0000, Taniya Das wrote:
> On 12/5/2019 5:54 AM, Brian Masney wrote:
> > Add support for setting the duty cycle via the D register for the
> > Qualcomm clocks.
> > 
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > ---
> > A few quirks that were noted when varying the speed of CAMSS_GP1_CLK on
> > msm8974 (Nexus 5 phone):
> > 
> >    - The mnd_width is set to 8 bits, however the d width is actually 7
> >      bits, at least for this clock. I'm not sure about the other clocks.
> > 
> >    - When the d register has a value less than 17, the following error
> >      from update_config() is shown: rcg didn't update its configuration.
> >      So this patch keeps the value of the d register within the range
> >      [17, 127].
> > 
> > I'm not sure about the relationship of the m, n, and d values,
> > especially how the 50% duty cycle is calculated by inverting the n
> > value, so that's why I'm saving the duty cycle ratio for
> > get_duty_cycle().
> > 
> >   drivers/clk/qcom/clk-rcg.h  |  4 +++
> >   drivers/clk/qcom/clk-rcg2.c | 61 +++++++++++++++++++++++++++++++++++--
> >   2 files changed, 63 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> > index 78358b81d249..c3b8732cec8f 100644
> > --- a/drivers/clk/qcom/clk-rcg.h
> > +++ b/drivers/clk/qcom/clk-rcg.h
> > @@ -139,6 +139,8 @@ extern const struct clk_ops clk_dyn_rcg_ops;
> >    * @freq_tbl: frequency table
> >    * @clkr: regmap clock handle
> >    * @cfg_off: defines the cfg register offset from the CMD_RCGR + CFG_REG
> > + * @duty_cycle_num: Numerator of the duty cycle ratio
> > + * @duty_cycle_den: Denominator of the duty cycle ratio
> >    */
> >   struct clk_rcg2 {
> >   	u32			cmd_rcgr;
> > @@ -149,6 +151,8 @@ struct clk_rcg2 {
> >   	const struct freq_tbl	*freq_tbl;
> >   	struct clk_regmap	clkr;
> >   	u8			cfg_off;
> > +	int			duty_cycle_num;
> > +	int			duty_cycle_den;
> >   };
> >   #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
> > diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> > index 8f4b9bec2956..8d685baefe50 100644
> > --- a/drivers/clk/qcom/clk-rcg2.c
> > +++ b/drivers/clk/qcom/clk-rcg2.c
> > @@ -258,7 +258,11 @@ static int clk_rcg2_determine_floor_rate(struct clk_hw *hw,
> >   	return _freq_tbl_determine_rate(hw, rcg->freq_tbl, req, FLOOR);
> >   }
> > -static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
> > +static int __clk_rcg2_configure_with_duty_cycle(struct clk_rcg2 *rcg,
> > +						const struct freq_tbl *f,
> > +						int d_reg_val,
> > +						int duty_cycle_num,
> > +						int duty_cycle_den)
> >   {
> >   	u32 cfg, mask;
> >   	struct clk_hw *hw = &rcg->clkr.hw;
> > @@ -280,9 +284,12 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
> >   			return ret;
> >   		ret = regmap_update_bits(rcg->clkr.regmap,
> > -				RCG_D_OFFSET(rcg), mask, ~f->n);
> > +				RCG_D_OFFSET(rcg), mask, d_reg_val);
> >   		if (ret)
> >   			return ret;
> > +
> > +		rcg->duty_cycle_num = duty_cycle_num;
> > +		rcg->duty_cycle_den = duty_cycle_den;
> >   	}
> >   	mask = BIT(rcg->hid_width) - 1;
> > @@ -295,6 +302,12 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
> >   					mask, cfg);
> >   }
> > +static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
> > +{
> > +	/* Set a 50% duty cycle */
> > +	return __clk_rcg2_configure_with_duty_cycle(rcg, f, ~f->n, 1, 2);
> > +}
> > +
> >   static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
> >   {
> >   	int ret;
> > @@ -353,6 +366,32 @@ static int clk_rcg2_set_floor_rate_and_parent(struct clk_hw *hw,
> >   	return __clk_rcg2_set_rate(hw, rate, FLOOR);
> >   }
> > +static int clk_rcg2_get_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
> > +{
> > +	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> > +
> > +	duty->num = rcg->duty_cycle_num;
> > +	duty->den = rcg->duty_cycle_den;
> > +
> > +	return 0;
> > +}
> > +
> > +static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
> > +{
> > +	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> > +	int ret, d_reg_val, mask;
> > +
> > +	mask = BIT(rcg->mnd_width - 1) - 1;
> > +	d_reg_val = mask - (((mask - 17) * duty->num) / duty->den);
> > +	ret = __clk_rcg2_configure_with_duty_cycle(rcg, rcg->freq_tbl,
> > +						   d_reg_val, duty->num,
> > +						   duty->den);
> 
> The duty-cycle calculation is not accurate.
> There is already a plan to submit the duty-cycle changes from my side.

OK... I assume that the m and n values need to be changed as well. I
couldn't find any docs online about the meaning of the m, n, and d
values and how they relate to each other.

Feel free to take over this patch if you find any value in what I posted
here.

> > +	if (ret)
> > +		return ret;
> > +
> > +	return update_config(rcg);
> > +}
> > +
> >   const struct clk_ops clk_rcg2_ops = {
> >   	.is_enabled = clk_rcg2_is_enabled,
> >   	.get_parent = clk_rcg2_get_parent,
> > @@ -361,6 +400,8 @@ const struct clk_ops clk_rcg2_ops = {
> >   	.determine_rate = clk_rcg2_determine_rate,
> >   	.set_rate = clk_rcg2_set_rate,
> >   	.set_rate_and_parent = clk_rcg2_set_rate_and_parent,
> > +	.get_duty_cycle = clk_rcg2_get_duty_cycle,
> > +	.set_duty_cycle = clk_rcg2_set_duty_cycle,
> >   };
> >   EXPORT_SYMBOL_GPL(clk_rcg2_ops);
> > @@ -372,6 +413,8 @@ const struct clk_ops clk_rcg2_floor_ops = {
> >   	.determine_rate = clk_rcg2_determine_floor_rate,
> >   	.set_rate = clk_rcg2_set_floor_rate,
> >   	.set_rate_and_parent = clk_rcg2_set_floor_rate_and_parent,
> > +	.get_duty_cycle = clk_rcg2_get_duty_cycle,
> > +	.set_duty_cycle = clk_rcg2_set_duty_cycle,
> >   };
> >   EXPORT_SYMBOL_GPL(clk_rcg2_floor_ops);
> > @@ -499,6 +542,8 @@ const struct clk_ops clk_edp_pixel_ops = {
> >   	.set_rate = clk_edp_pixel_set_rate,
> >   	.set_rate_and_parent = clk_edp_pixel_set_rate_and_parent,
> >   	.determine_rate = clk_edp_pixel_determine_rate,
> > +	.get_duty_cycle = clk_rcg2_get_duty_cycle,
> > +	.set_duty_cycle = clk_rcg2_set_duty_cycle,
> >   };
> >   EXPORT_SYMBOL_GPL(clk_edp_pixel_ops);
> > @@ -557,6 +602,8 @@ const struct clk_ops clk_byte_ops = {
> >   	.set_rate = clk_byte_set_rate,
> >   	.set_rate_and_parent = clk_byte_set_rate_and_parent,
> >   	.determine_rate = clk_byte_determine_rate,
> > +	.get_duty_cycle = clk_rcg2_get_duty_cycle,
> > +	.set_duty_cycle = clk_rcg2_set_duty_cycle,
> >   };
> >   EXPORT_SYMBOL_GPL(clk_byte_ops);
> > @@ -627,6 +674,8 @@ const struct clk_ops clk_byte2_ops = {
> >   	.set_rate = clk_byte2_set_rate,
> >   	.set_rate_and_parent = clk_byte2_set_rate_and_parent,
> >   	.determine_rate = clk_byte2_determine_rate,
> > +	.get_duty_cycle = clk_rcg2_get_duty_cycle,
> > +	.set_duty_cycle = clk_rcg2_set_duty_cycle,
> >   };
> >   EXPORT_SYMBOL_GPL(clk_byte2_ops);
> > @@ -717,6 +766,8 @@ const struct clk_ops clk_pixel_ops = {
> >   	.set_rate = clk_pixel_set_rate,
> >   	.set_rate_and_parent = clk_pixel_set_rate_and_parent,
> >   	.determine_rate = clk_pixel_determine_rate,
> > +	.get_duty_cycle = clk_rcg2_get_duty_cycle,
> > +	.set_duty_cycle = clk_rcg2_set_duty_cycle,
> >   };
> >   EXPORT_SYMBOL_GPL(clk_pixel_ops);
> > @@ -804,6 +855,8 @@ const struct clk_ops clk_gfx3d_ops = {
> >   	.set_rate = clk_gfx3d_set_rate,
> >   	.set_rate_and_parent = clk_gfx3d_set_rate_and_parent,
> >   	.determine_rate = clk_gfx3d_determine_rate,
> > +	.get_duty_cycle = clk_rcg2_get_duty_cycle,
> > +	.set_duty_cycle = clk_rcg2_set_duty_cycle,
> >   };
> >   EXPORT_SYMBOL_GPL(clk_gfx3d_ops);
> > @@ -942,6 +995,8 @@ const struct clk_ops clk_rcg2_shared_ops = {
> >   	.determine_rate = clk_rcg2_determine_rate,
> >   	.set_rate = clk_rcg2_shared_set_rate,
> >   	.set_rate_and_parent = clk_rcg2_shared_set_rate_and_parent,
> > +	.get_duty_cycle = clk_rcg2_get_duty_cycle,
> > +	.set_duty_cycle = clk_rcg2_set_duty_cycle,
> >   };
> >   EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
> > @@ -1081,6 +1136,8 @@ static const struct clk_ops clk_rcg2_dfs_ops = {
> >   	.get_parent = clk_rcg2_get_parent,
> >   	.determine_rate = clk_rcg2_dfs_determine_rate,
> >   	.recalc_rate = clk_rcg2_dfs_recalc_rate,
> > +	.get_duty_cycle = clk_rcg2_get_duty_cycle,
> > +	.set_duty_cycle = clk_rcg2_set_duty_cycle,
> >   };
> > 
> 
> Why do you want to support duty-cycle for other RCGs when you are
> specifically want it for GP clocks only.
> The DFS can never handle duty-cycle set/get.

I wrongly assumed that all of variants supported this. I did this
without any of the hardware documentation.

Brian
