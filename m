Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 286432D68D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 21:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404647AbgLJUhU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 15:37:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:47850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404645AbgLJUhT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 15:37:19 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607632597;
        bh=7iFM29jowjPX3IR5RulV7xkq1L2JyiQCLQfcogBu7Kk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oYjvwrx6j1BHQOURWWjdAUqSq0wRvBRQlg9myPmuRH1tfBFVQe7ml/Wo65R/kzj5H
         Ea9c5PUBphDPUzCvJYihSakAyl8GzapYau7D1MhkZN2HM1gLU00mvZBnpkSxIWFuDX
         pmVSTog1wmA4OTbDDqT1C6BY0lmyuLWMia41HG9g2y3GahZJ6dDGtQ+W73jjtllRoV
         X/sn0tI36lMqQ3Ec/Np/COQrvmYl8wmOrIenv/lQcvpJIpfiUAmrxQ8Sh+bvD+hjSi
         uXgs/79kqqvZ1hGtTbjt83QZaWcI1ZaSsnBH65LMyVtJ8P2GxsSa14/9H6PFALkdMC
         UDHdptdjrGUtA==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201208064702.3654324-5-vkoul@kernel.org>
References: <20201208064702.3654324-1-vkoul@kernel.org> <20201208064702.3654324-5-vkoul@kernel.org>
Subject: Re: [PATCH v2 4/5] clk: qcom: clk-alpha-pll: Add support for Lucid 5LPE PLL
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vivek Aknurwar <viveka@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeevan Shriram <jshriram@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Date:   Thu, 10 Dec 2020 12:36:36 -0800
Message-ID: <160763259636.1580929.12912274485007017282@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2020-12-07 22:47:01)
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alph=
a-pll.c
> index 564431130a76..6a399663d564 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -146,6 +146,12 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>  /* LUCID PLL specific settings and offsets */
>  #define LUCID_PCAL_DONE                BIT(27)
> =20
> +/* LUCID 5LPE PLL specific settings and offsets */
> +#define LUCID_5LPE_PCAL_DONE           BIT(11)
> +#define LUCID_5LPE_ENABLE_VOTE_RUN     BIT(21)
> +#define LUCID_5LPE_PLL_LATCH_INPUT     BIT(14)
> +#define LUCID_5LPE_ALPHA_PLL_ACK_LATCH BIT(13)

Sort these by bit or define name?

> +
>  #define pll_alpha_width(p)                                     \
>                 ((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) =3D=3D 4) ? \
>                                  ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WID=
TH)
> @@ -1561,3 +1567,220 @@ const struct clk_ops clk_alpha_pll_postdiv_lucid_=
ops =3D {
>         .set_rate =3D clk_alpha_pll_postdiv_fabia_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_ops);
> +
> +static int alpha_pll_lucid_5lpe_enable(struct clk_hw *hw)
> +{
> +       struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> +       u32 val;
> +       int ret;
> +
> +       ret =3D regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &val);
> +       if (ret)
> +               return ret;
> +
> +       /* If in FSM mode, just vote for it */
> +       if (val & LUCID_5LPE_ENABLE_VOTE_RUN) {
> +               ret =3D clk_enable_regmap(hw);
> +               if (ret)
> +                       return ret;
> +               return wait_for_pll_enable_lock(pll);
> +       }
> +
> +       /* Check if PLL is already enabled */

Yeah that's obvious, but then what?

> +       ret =3D trion_pll_is_enabled(pll, pll->clkr.regmap);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret =3D regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_R=
ESET_N, PLL_RESET_N);
> +       if (ret)
> +               return ret;
> +
> +       /* Set operation mode to RUN */

This comment is worthless.

> +       regmap_write(pll->clkr.regmap, PLL_OPMODE(pll), PLL_RUN);
> +
> +       ret =3D wait_for_pll_enable_lock(pll);
> +       if (ret)
> +               return ret;
> +
> +       /* Enable the PLL outputs */
> +       ret =3D regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll), P=
LL_OUT_MASK, PLL_OUT_MASK);
> +       if (ret)
> +               return ret;
> +
> +       /* Enable the global PLL outputs */
> +       ret =3D regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_O=
UTCTRL, PLL_OUTCTRL);
> +       if (ret)
> +               return ret;
> +
> +       /* Ensure that the write above goes through before returning. */
> +       mb();

Regmap has a memory barrier in writel. Drop this.

> +       return ret;
> +}
> +
> +static void alpha_pll_lucid_5lpe_disable(struct clk_hw *hw)
> +{
> +       struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> +       u32 val;
> +       int ret;
> +
> +       ret =3D regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &val);
> +       if (ret)
> +               return;
> +
> +       /* If in FSM mode, just unvote it */
> +       if (val & LUCID_5LPE_ENABLE_VOTE_RUN) {
> +               clk_disable_regmap(hw);
> +               return;
> +       }
> +
> +       /* Disable the global PLL output */
> +       ret =3D regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_O=
UTCTRL, 0);
> +       if (ret)
> +               return;
> +
> +       /* Disable the PLL outputs */
> +       ret =3D regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll), P=
LL_OUT_MASK, 0);
> +       if (ret)
> +               return;
> +
> +       /* Place the PLL mode in STANDBY */
> +       regmap_write(pll->clkr.regmap, PLL_OPMODE(pll), PLL_STANDBY);
> +}
> +
> +/*
> + * The Lucid 5LPE PLL requires a power-on self-calibration which happens
> + * when the PLL comes out of reset. Calibrate in case it is not complete=
d.
> + */
> +static int alpha_pll_lucid_5lpe_prepare(struct clk_hw *hw)
> +{
> +       struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> +       struct clk_hw *p;
> +       u32 regval;

Can you use u32 val? And also include a patch to replace the couple
times where there is 'regval' in this file. The former is shorter and
used far more in qcom clk code.

> +       int ret;
> +
> +       /* Return early if calibration is not needed. */
> +       regmap_read(pll->clkr.regmap, PLL_MODE(pll), &regval);
> +       if (regval & LUCID_5LPE_PCAL_DONE)
> +               return 0;
> +
> +       p =3D clk_hw_get_parent(hw);
> +       if (!p)
> +               return -EINVAL;
> +
> +       ret =3D alpha_pll_lucid_5lpe_enable(hw);
> +       if (ret)
> +               return ret;
> +
> +       alpha_pll_lucid_5lpe_disable(hw);
> +
> +       return 0;
> +}
> +
> +static int alpha_pll_lucid_5lpe_set_rate(struct clk_hw *hw, unsigned lon=
g rate,
> +                                        unsigned long prate)
> +{
> +       struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> +       unsigned long rrate;
> +       u32 regval, l;
> +       u64 a;
> +       int ret;
> +
> +       rrate =3D alpha_pll_round_rate(rate, prate, &l, &a, ALPHA_REG_16B=
IT_WIDTH);
> +
> +       /*
> +        * Due to a limited number of bits for fractional rate programmin=
g, the
> +        * rounded up rate could be marginally higher than the requested =
rate.
> +        */
> +       if (rrate > (rate + PLL_RATE_MARGIN) || rrate < rate) {
> +               pr_err("Call set rate on the PLL with rounded rates!\n");
> +               return -EINVAL;
> +       }

Can we use alpha_pll_check_rate_margin()?

> +
> +       regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +       regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
> +
> +       /* Latch the PLL input */
> +       ret =3D regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
> +                                LUCID_5LPE_PLL_LATCH_INPUT, LUCID_5LPE_P=
LL_LATCH_INPUT);
> +       if (ret)
> +               return ret;
> +
> +       /* Wait for 2 reference cycles before checking the ACK bit. */
> +       udelay(1);
> +       regmap_read(pll->clkr.regmap, PLL_MODE(pll), &regval);
> +       if (!(regval & LUCID_5LPE_ALPHA_PLL_ACK_LATCH)) {
> +               pr_err("Lucid 5LPE PLL latch failed. Output may be unstab=
le!\n");
> +               return -EINVAL;
> +       }
> +
> +       /* Return the latch input to 0 */
> +       ret =3D regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), LUCID=
_5LPE_PLL_LATCH_INPUT, 0);
> +       if (ret)
> +               return ret;
> +
> +       if (clk_hw_is_enabled(hw)) {
> +               ret =3D wait_for_pll_enable_lock(pll);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       /* Wait for PLL output to stabilize */
> +       udelay(100);
> +       return 0;
> +}
> +
> +static int clk_lucid_5lpe_pll_postdiv_set_rate(struct clk_hw *hw, unsign=
ed long rate,
> +                                              unsigned long parent_rate)
> +{
> +       struct clk_alpha_pll_postdiv *pll =3D to_clk_alpha_pll_postdiv(hw=
);
> +       int i, val =3D 0, div, ret;
> +
> +       /*
> +        * If the PLL is in FSM mode, then treat set_rate callback as a
> +        * no-operation.
> +        */
> +       ret =3D regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &val);
> +       if (ret)
> +               return ret;
> +
> +       if (val & LUCID_5LPE_ENABLE_VOTE_RUN)
> +               return 0;
> +
> +       if (!pll->post_div_table) {
> +               pr_err("Missing the post_div_table for the PLL\n");

Can this be rolled into the loop below?

> +               return -EINVAL;
> +       }
> +
> +       div =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);
> +       for (i =3D 0; i < pll->num_post_div; i++) {

So that this finds nothing.

> +               if (pll->post_div_table[i].div =3D=3D div) {
> +                       val =3D pll->post_div_table[i].val;
> +                       break;
> +               }
> +       }

and then if val =3D=3D -1 we return -EINVAL?

> +
> +       return regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
> +                               (BIT(pll->width) - 1) << pll->post_div_sh=
ift,

Use GENMASK?

> +                               val << pll->post_div_shift);
> +}
> +
