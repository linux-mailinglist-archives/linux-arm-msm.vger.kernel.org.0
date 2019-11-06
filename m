Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65A67F0B1D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 01:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730095AbfKFAg4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 19:36:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:59864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727252AbfKFAg4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 19:36:56 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BCB312178F;
        Wed,  6 Nov 2019 00:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573000614;
        bh=AM3y7wUik5MUuZRgNPekoMhux0EIapn0uq4Trd9e++M=;
        h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
        b=s8OFEfS6DXElpByB9gFyAFHv32qhQqEwKXmErMqCeV5CfH6i4h4aCNQQJYpCI/8pg
         sgBZSoxiGg33Zjy6MLVp7sIIUPXhbHyy0DTAEKULuwrnGtTrhceeuBXaoxmHw3siSN
         mgZXIFhzQd2nAKapnlaz6li3Gc8A2NeCGFfr08r0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1572524473-19344-2-git-send-email-tdas@codeaurora.org>
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org> <1572524473-19344-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 1/7] clk: qcom: clk-alpha-pll: Add support for Fabia PLL calibration
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Tue, 05 Nov 2019 16:36:54 -0800
Message-Id: <20191106003654.BCB312178F@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-10-31 05:21:07)
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alph=
a-pll.c
> index 055318f..8cb77ca 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -1141,15 +1160,11 @@ static int alpha_pll_fabia_set_rate(struct clk_hw=
 *hw, unsigned long rate,
>                                                 unsigned long prate)
>  {
>         struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> -       u32 val, l, alpha_width =3D pll_alpha_width(pll);
> +       u32 l, alpha_width =3D pll_alpha_width(pll);
>         u64 a;
>         unsigned long rrate;
>         int ret =3D 0;
>=20
> -       ret =3D regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
> -       if (ret)
> -               return ret;
> -
>         rrate =3D alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
>=20
>         /*

How is this diff related? Looks like it should be split off into another
patch to remove a useless register read.

> @@ -1167,7 +1182,66 @@ static int alpha_pll_fabia_set_rate(struct clk_hw =
*hw, unsigned long rate,
>         return __clk_alpha_pll_update_latch(pll);
>  }
>=20
> +static int alpha_pll_fabia_prepare(struct clk_hw *hw)
> +{

Why are we doing this in prepare vs. doing it at PLL configuration time?
Does it need to be recalibrated each time the PLL is enabled?

> +       struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> +       const struct pll_vco *vco;
> +       struct clk_hw *parent_hw;
> +       unsigned long cal_freq, rrate;
> +       u32 cal_l, regval, alpha_width =3D pll_alpha_width(pll);
> +       u64 a;
> +       int ret;
> +
> +       /* Check if calibration needs to be done i.e. PLL is in reset */
> +       ret =3D regmap_read(pll->clkr.regmap, PLL_MODE(pll), &regval);

Please use 'val' instead of 'regval' as regval almost never appears in
this file already.

> +       if (ret)
> +               return ret;
> +
> +       /* Return early if calibration is not needed. */
> +       if (regval & PLL_RESET_N)
> +               return 0;
> +
> +       vco =3D alpha_pll_find_vco(pll, clk_hw_get_rate(hw));
> +       if (!vco) {
> +               pr_err("alpha pll: not in a valid vco range\n");
> +               return -EINVAL;
> +       }
> +
> +       cal_freq =3D DIV_ROUND_CLOSEST((pll->vco_table[0].min_freq +
> +                               pll->vco_table[0].max_freq) * 54, 100);

Do we need to cast the first argument to a u64 to avoid overflow?

> +
> +       parent_hw =3D clk_hw_get_parent(hw);
> +       if (!parent_hw)
> +               return -EINVAL;
> +
> +       rrate =3D alpha_pll_round_rate(cal_freq, clk_hw_get_rate(parent_h=
w),
> +                                       &cal_l, &a, alpha_width);
> +       /*
> +        * Due to a limited number of bits for fractional rate programmin=
g, the
> +        * rounded up rate could be marginally higher than the requested =
rate.
> +        */
> +       if (rrate > (cal_freq + FABIA_PLL_RATE_MARGIN) || rrate < cal_fre=
q) {
> +               pr_err("Call set rate on the PLL with rounded rates!\n");

This message is weird. Drivers shouldn't need to call set rate with
rounded rates. What is going on?

> +               return -EINVAL;
> +       }
> +
> +       /* Setup PLL for calibration frequency */
> +       regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), cal_l);
> +
> +       /* Bringup the pll at calibration frequency */

capitalize PLL.

> +       ret =3D clk_alpha_pll_enable(hw);
> +       if (ret) {
> +               pr_err("alpha pll calibration failed\n");
> +               return ret;
> +       }
> +
> +       clk_alpha_pll_disable(hw);
> +
> +       return 0;
> +}
> +
