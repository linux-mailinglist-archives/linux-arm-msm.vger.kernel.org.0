Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCECF393B6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2019 19:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730991AbfFGRzo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 13:55:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:35830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727391AbfFGRzo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 13:55:44 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D9D56208C0;
        Fri,  7 Jun 2019 17:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559930143;
        bh=MX/fuZ19/Q8W4niXDIk65px+1vun1Fu8DRq7pvgK/Ik=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=IuawJLcX/j/+tWcwSLGnCb8HGXlB779YtfQTLuimnIL0uDkuQ4UbE5qW+RjBLHIx5
         PWmM/6k3LN+aKEjPeaxDhq1LHPG1njsHvZc76IEVhzVaA+zg9e3yV9GjXm2iKwr7Ce
         pztrw7/cXJq7Kn8Rc4SeeUQVkIaQFPrQ4jmu7xXc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190607101234.30449-1-vkoul@kernel.org>
References: <20190607101234.30449-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] clk: qcom: clk-alpha-pll: Add support for Trion PLLs
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Fri, 07 Jun 2019 10:55:42 -0700
Message-Id: <20190607175542.D9D56208C0@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-06-07 03:12:33)
> From: Deepak Katragadda <dkatraga@codeaurora.org>
>=20
> Add programming sequence support for managing the Trion
> PLLs.
>=20
> Signed-off-by: Deepak Katragadda <dkatraga@codeaurora.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> [vkoul: port to upstream and tidy-up]

This tag isn't very useful. Maybe you can list out what you actually did
instead of just "tidying"?

> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alph=
a-pll.c
> index 0ced4a5a9a17..bf36a929458b 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -120,6 +140,15 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>  #define FABIA_PLL_OUT_MASK     0x7
>  #define FABIA_PLL_RATE_MARGIN  500
> =20
> +#define TRION_PLL_CAL_VAL      0x44
> +#define TRION_PLL_STANDBY      0x0
> +#define TRION_PLL_RUN          0x1
> +#define TRION_PLL_OUT_MASK     0x7
> +#define TRION_PCAL_DONE                BIT(26)
> +#define TRION_PLL_RATE_MARGIN  500

These last two aren't used. Do we need them?

> +
> +#define XO_RATE                        19200000

Please remove this define. It isn't used (thankfully!).

> +
>  #define pll_alpha_width(p)                                     \
>                 ((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) =3D=3D 4) ? \
>                                  ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WID=
TH)
> @@ -392,6 +421,15 @@ alpha_pll_round_rate(unsigned long rate, unsigned lo=
ng prate, u32 *l, u64 *a,
>         u64 remainder;
>         u64 quotient;
> =20
> +       /*
> +        * The PLLs parent rate is zero probably since the parent hasn't
> +        * registered yet. Return early with the requested rate.
> +        */
> +       if (!prate) {

This hasn't been a problem before. Why is it a problem now?

> +               pr_warn("PLLs parent rate hasn't been initialized.\n");
> +               return rate;
> +       }
> +
>         quotient =3D rate;
>         remainder =3D do_div(quotient, prate);
>         *l =3D quotient;
> @@ -730,6 +768,136 @@ static long alpha_pll_huayra_round_rate(struct clk_=
hw *hw, unsigned long rate,
>         return alpha_huayra_pll_round_rate(rate, *prate, &l, &a);
>  }
> =20
> +static int trion_pll_is_enabled(struct clk_alpha_pll *pll,
> +                               struct regmap *regmap)
> +{
> +       u32 mode_regval, opmode_regval;
> +       int ret;
> +
> +       ret =3D regmap_read(regmap, PLL_MODE(pll), &mode_regval);
> +       ret |=3D regmap_read(regmap, PLL_OPMODE(pll), &opmode_regval);
> +       if (ret)
> +               return 0;
> +
> +       return ((opmode_regval & TRION_PLL_RUN) && (mode_regval & PLL_OUT=
CTRL));
> +}
> +
> +static int clk_trion_pll_enable(struct clk_hw *hw)
> +{
> +       struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> +       struct regmap *regmap =3D pll->clkr.regmap;
> +       u32 val;
> +       int ret;
> +
> +       ret =3D regmap_read(regmap, PLL_MODE(pll), &val);
> +       if (ret)
> +               return ret;
> +
> +       /* If in FSM mode, just vote for it */
> +       if (val & PLL_VOTE_FSM_ENA) {
> +               ret =3D clk_enable_regmap(hw);
> +               if (ret)
> +                       return ret;
> +               return wait_for_pll_enable_active(pll);
> +       }
> +
> +       /* Set operation mode to RUN */
> +       regmap_write(regmap, PLL_OPMODE(pll), TRION_PLL_RUN);
> +
> +       ret =3D wait_for_pll_enable_lock(pll);
> +       if (ret)
> +               return ret;
> +
> +       /* Enable the PLL outputs */
> +       ret =3D regmap_update_bits(regmap, PLL_USER_CTL(pll),
> +                                TRION_PLL_OUT_MASK, TRION_PLL_OUT_MASK);
> +       if (ret)
> +               return ret;
> +
> +       /* Enable the global PLL outputs */
> +       ret =3D regmap_update_bits(regmap, PLL_MODE(pll),
> +                                PLL_OUTCTRL, PLL_OUTCTRL);
> +       if (ret)
> +               return ret;

This if (ret) can be removed.

> +
> +       /* Ensure that the write above goes through before returning. */
> +       mb();

As far as I recall mb() does nothing to ensure the write above goes
through, just that writes after this one are ordered with the write
above.

> +       return ret;
> +}
> +
> +static void clk_trion_pll_disable(struct clk_hw *hw)
> +{
> +       struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> +       struct regmap *regmap =3D pll->clkr.regmap;
> +       u32 val;
> +       int ret;
> +
> +       ret =3D regmap_read(regmap, PLL_MODE(pll), &val);
> +       if (ret)
> +               return;
> +
> +       /* If in FSM mode, just unvote it */
> +       if (val & PLL_VOTE_FSM_ENA) {
> +               clk_disable_regmap(hw);
> +               return;
> +       }
> +
> +       /* Disable the global PLL output */
> +       ret =3D regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
> +       if (ret)
> +               return;
> +
> +       /* Disable the PLL outputs */
> +       ret =3D regmap_update_bits(regmap, PLL_USER_CTL(pll),
> +                                TRION_PLL_OUT_MASK, 0);
> +       if (ret)
> +               return;
> +
> +       /* Place the PLL mode in STANDBY */
> +       regmap_write(regmap, PLL_OPMODE(pll), TRION_PLL_STANDBY);
> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_=
N);
> +}
> +
> +static unsigned long
> +clk_trion_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +       struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> +       struct regmap *regmap =3D pll->clkr.regmap;
> +       u32 l, frac;
> +       u64 prate =3D parent_rate;
> +
> +       regmap_read(regmap, PLL_L_VAL(pll), &l);
> +       regmap_read(regmap, PLL_ALPHA_VAL(pll), &frac);
> +
> +       return alpha_pll_calc_rate(prate, l, frac, ALPHA_REG_16BIT_WIDTH);
> +}
> +
> +static int clk_trion_pll_is_enabled(struct clk_hw *hw)
> +{
> +       struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> +
> +       return trion_pll_is_enabled(pll, pll->clkr.regmap);
> +}

Can you move this function right below trion_pll_is_enabled()?

> +
> +static long clk_trion_pll_round_rate(struct clk_hw *hw, unsigned long ra=
te,
> +                                    unsigned long *prate)
> +{
> +       struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> +       unsigned long min_freq, max_freq;
> +       u32 l;
> +       u64 a;
> +
> +       rate =3D alpha_pll_round_rate(rate, *prate,
> +                                   &l, &a, ALPHA_REG_16BIT_WIDTH);
> +       if (!pll->vco_table || alpha_pll_find_vco(pll, rate))
> +               return rate;
> +
> +       min_freq =3D pll->vco_table[0].min_freq;
> +       max_freq =3D pll->vco_table[pll->num_vco - 1].max_freq;
> +
> +       return clamp(rate, min_freq, max_freq);
> +}
> +
>  const struct clk_ops clk_alpha_pll_ops =3D {
>         .enable =3D clk_alpha_pll_enable,
>         .disable =3D clk_alpha_pll_disable,
> @@ -902,6 +1079,10 @@ static int alpha_pll_fabia_enable(struct clk_hw *hw)
>         ret =3D regmap_read(regmap, PLL_OPMODE(pll), &opmode_val);
>         if (ret)
>                 return ret;
> +       ret =3D regmap_update_bits(regmap, PLL_MODE(pll),
> +                                PLL_BYPASSNL, PLL_BYPASSNL);
> +       if (ret)
> +               return ret;

What is this?

> =20
>         /* Skip If PLL is already running */
>         if ((opmode_val & FABIA_OPMODE_RUN) && (val & PLL_OUTCTRL))
> @@ -1058,6 +1239,91 @@ static unsigned long clk_alpha_pll_postdiv_fabia_r=
ecalc_rate(struct clk_hw *hw,
>         return (parent_rate / div);
>  }
> =20
> +static unsigned long
> +clk_trion_pll_postdiv_recalc_rate(struct clk_hw *hw, unsigned long paren=
t_rate)
> +{
> +       struct clk_alpha_pll_postdiv *pll =3D to_clk_alpha_pll_postdiv(hw=
);
> +       struct regmap *regmap =3D pll->clkr.regmap;
> +       u32 i, div =3D 1, val;
> +
> +       if (!pll->post_div_table) {
> +               pr_err("Missing the post_div_table for the PLL\n");

Ahhh!

> +               return -EINVAL;
> +       }
> +
> +       regmap_read(regmap, PLL_USER_CTL(pll), &val);
> +
> +       val >>=3D pll->post_div_shift;
> +       val &=3D PLL_POST_DIV_MASK(pll);
> +
> +       for (i =3D 0; i < pll->num_post_div; i++) {
> +               if (pll->post_div_table[i].val =3D=3D val) {
> +                       div =3D pll->post_div_table[i].div;
> +                       break;
> +               }
> +       }
> +
> +       return (parent_rate / div);
> +}
> +
> +static long
> +clk_trion_pll_postdiv_round_rate(struct clk_hw *hw, unsigned long rate,
> +                                unsigned long *prate)
> +{
> +       struct clk_alpha_pll_postdiv *pll =3D to_clk_alpha_pll_postdiv(hw=
);
> +
> +       if (!pll->post_div_table) {
> +               pr_err("Missing the post_div_table for the PLL\n");
> +               return -EINVAL;

Does this ever happen? I'd rather see this removed and the code blow up
if the driver author didn't test this.

> +       }
> +
> +       return divider_round_rate(hw, rate, prate, pll->post_div_table,
> +                                 pll->width, CLK_DIVIDER_ROUND_CLOSEST);
> +};
> +
> +static int
> +clk_trion_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
> +                              unsigned long parent_rate)
> +{
> +       struct clk_alpha_pll_postdiv *pll =3D to_clk_alpha_pll_postdiv(hw=
);
> +       struct regmap *regmap =3D pll->clkr.regmap;
> +       int i, val =3D 0, div, ret;
> +
> +       /*
> +        * If the PLL is in FSM mode, then treat the set_rate callback
> +        * as a no-operation.
> +        */
> +       ret =3D regmap_read(regmap, PLL_MODE(pll), &val);
> +       if (ret)
> +               return ret;
> +
> +       if (val & PLL_VOTE_FSM_ENA)
> +               return 0;
> +
> +       if (!pll->post_div_table) {
> +               pr_err("Missing the post_div_table for the PLL\n");

Again!

> +               return -EINVAL;
> +       }
> +
> +       div =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);

Is the cast necessary?

> +       for (i =3D 0; i < pll->num_post_div; i++) {
> +               if (pll->post_div_table[i].div =3D=3D div) {
> +                       val =3D pll->post_div_table[i].val;
> +                       break;
> +               }
> +       }
> +       return regmap_update_bits(regmap, PLL_USER_CTL(pll),
> +                                 PLL_POST_DIV_MASK(pll) << PLL_POST_DIV_=
SHIFT,
> +                                 val << PLL_POST_DIV_SHIFT);
> +}
> +
> +const struct clk_ops clk_trion_pll_postdiv_ops =3D {
> +       .recalc_rate =3D clk_trion_pll_postdiv_recalc_rate,
> +       .round_rate =3D clk_trion_pll_postdiv_round_rate,
> +       .set_rate =3D clk_trion_pll_postdiv_set_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_trion_pll_postdiv_ops);
> +
>  static long clk_alpha_pll_postdiv_fabia_round_rate(struct clk_hw *hw,
>                                 unsigned long rate, unsigned long *prate)
>  {
