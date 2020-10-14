Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2C928D835
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 04:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728645AbgJNCHg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 22:07:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:56338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbgJNCHg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 22:07:36 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BD53521775;
        Wed, 14 Oct 2020 02:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602641255;
        bh=KPvdf+a85L4OCPBIobRJspIbIReT/sQiwTlh0oeAdGY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gHYN0Dqpkk/2BtPmEkiteW1czHK1Urxz4WDRT2RFU+oxQaICXUgwcoVeg7WQVNWlJ
         1PMaWP+6TBqT2cJkyHdC8YFJwu1Rtx2Ph9Sr01hEYN668he6PYSH0b6bQWqzf/ONG9
         dspd7EBdKoN18Mqkd5Y3JOx7+FZRMFzR6/fbhJFU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1602609110-11504-2-git-send-email-tdas@codeaurora.org>
References: <1602609110-11504-1-git-send-email-tdas@codeaurora.org> <1602609110-11504-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v2 1/3] clk: qcom: clk-alpha-pll: Add support for controlling Agera PLLs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 13 Oct 2020 19:07:34 -0700
Message-ID: <160264125446.310579.18150875025884105137@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-10-13 10:11:48)
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alph=
a-pll.c
> index 26139ef..17e1fc0 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -1561,3 +1571,73 @@ const struct clk_ops clk_alpha_pll_postdiv_lucid_o=
ps =3D {
>         .set_rate =3D clk_alpha_pll_postdiv_fabia_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_ops);
> +
> +void clk_agera_pll_configure(struct clk_alpha_pll *pll, struct regmap *r=
egmap,
> +                       const struct alpha_pll_config *config)
> +{
> +       if (config->l)
> +               regmap_write(regmap, PLL_L_VAL(pll), config->l);

Maybe make a helper function for this too. That way we can't mix up the
if condition with the value in the write.

	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);

static void clk_alpha_pll_write_config(struct regmap *regmap,
				       unsigned int reg,
				       unsigned int val) {
	if (val)
		regmap_write(regmap, reg, val);
}

and how are we so lucky that zero isn't a value that we may need to
write?

> +
> +       if (config->alpha)
> +               regmap_write(regmap, PLL_ALPHA_VAL(pll), config->alpha);
> +
> +       if (config->user_ctl_val)
> +               regmap_write(regmap, PLL_USER_CTL(pll), config->user_ctl_=
val);
> +
> +       if (config->config_ctl_val)
> +               regmap_write(regmap, PLL_CONFIG_CTL(pll),
> +                                               config->config_ctl_val);
> +
> +       if (config->config_ctl_hi_val)
> +               regmap_write(regmap, PLL_CONFIG_CTL_U(pll),
> +                                               config->config_ctl_hi_val=
);
> +
> +       if (config->test_ctl_val)
> +               regmap_write(regmap, PLL_TEST_CTL(pll),
> +                                               config->test_ctl_val);
> +
> +       if (config->test_ctl_hi_val)
> +               regmap_write(regmap,  PLL_TEST_CTL_U(pll),
> +                                               config->test_ctl_hi_val);
> +}
> +EXPORT_SYMBOL_GPL(clk_agera_pll_configure);
> +
> +static int clk_alpha_pll_agera_set_rate(struct clk_hw *hw, unsigned long=
 rate,
> +                                                       unsigned long pra=
te)
> +{
> +       struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> +       u32 l, alpha_width =3D pll_alpha_width(pll);
> +       unsigned long rrate, max =3D rate + PLL_RATE_MARGIN;
> +       u64 a;
> +
> +       rrate =3D alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
> +
> +       /*
> +        * Due to limited number of bits for fractional rate programming,=
 the
> +        * rounded up rate could be marginally higher than the requested =
rate.
> +        */
> +       if (rrate > (rate + PLL_RATE_MARGIN) || rrate < rate) {
> +               pr_err("%s: Rounded rate %lu not within range [%lu, %lu)\=
n",
> +                      clk_hw_get_name(hw), rrate, rate, max);
> +               return -EINVAL;
> +       }

Can this be extracted into a helper function?

> +
> +       /* change L_VAL without having to go through the power on sequenc=
e */
> +       regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +       regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
> +
> +       if (clk_hw_is_enabled(hw))
> +               return wait_for_pll_enable_lock(pll);
> +
> +       return 0;
> +}
> +
