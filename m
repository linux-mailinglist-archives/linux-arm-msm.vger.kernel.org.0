Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD72153925
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 20:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbgBETdy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 14:33:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:42088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727122AbgBETdy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 14:33:54 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2BDCC20720;
        Wed,  5 Feb 2020 19:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580931233;
        bh=+nyLmX46s9G7X/53SRM/o2mo63iRBrtO5nxuwKZt+fs=;
        h=In-Reply-To:References:From:Subject:To:Date:From;
        b=kzNO9SWODHYyp8ttsM3EJyJsqbEW2BZ759IxFZNM9RPOF4RFdOgjYnGzLyet3qILQ
         NJMot8rfIn3SAU9tn3yEj1KcIrROCQjzIWA6hxPWJdAcrsLpALx9074WEHnjpWpG0z
         yzmFYmvSPxB2JcQr0SSS+kLRWPkAEzxBlbAnAqqs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1579905147-12142-5-git-send-email-vnkgutta@codeaurora.org>
References: <1579905147-12142-1-git-send-email-vnkgutta@codeaurora.org> <1579905147-12142-5-git-send-email-vnkgutta@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 4/7] clk: qcom: clk-alpha-pll: Add support for controlling Lucid PLLs
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, jshriram@codeaurora.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, psodagud@codeaurora.org,
        robh+dt@kernel.org, tdas@codeaurora.org, tsoni@codeaurora.org,
        vinod.koul@linaro.org, vnkgutta@codeaurora.org
User-Agent: alot/0.8.1
Date:   Wed, 05 Feb 2020 11:33:52 -0800
Message-Id: <20200205193353.2BDCC20720@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Venkata Narendra Kumar Gutta (2020-01-24 14:32:24)
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alph=
a-pll.c
> index 1b073b2..4258ab0 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -1367,3 +1388,172 @@ static int clk_alpha_pll_postdiv_fabia_set_rate(s=
truct clk_hw *hw,
>         .set_rate =3D clk_alpha_pll_postdiv_fabia_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
> +
> +void clk_lucid_pll_configure(struct clk_alpha_pll *pll, struct regmap *r=
egmap,

Can we get some kernel documentation for this function?

> +                            const struct alpha_pll_config *config)
> +{
> +       if (config->l)
> +               regmap_write(regmap, PLL_L_VAL(pll), config->l);
> +
> +       regmap_write(regmap, PLL_CAL_L_VAL(pll), LUCID_PLL_CAL_VAL);
> +
> +       if (config->alpha)
> +               regmap_write(regmap, PLL_ALPHA_VAL(pll), config->alpha);
> +
> +       if (config->config_ctl_val)
> +               regmap_write(regmap, PLL_CONFIG_CTL(pll),
> +                            config->config_ctl_val);
> +
> +       if (config->config_ctl_hi_val)
> +               regmap_write(regmap, PLL_CONFIG_CTL_U(pll),
> +                            config->config_ctl_hi_val);
> +
> +       if (config->config_ctl_hi1_val)
> +               regmap_write(regmap, PLL_CONFIG_CTL_U1(pll),
> +                            config->config_ctl_hi1_val);
> +
> +       if (config->user_ctl_val)
> +               regmap_write(regmap, PLL_USER_CTL(pll),
> +                            config->user_ctl_val);
> +
> +       if (config->user_ctl_hi_val)
> +               regmap_write(regmap, PLL_USER_CTL_U(pll),
> +                            config->user_ctl_hi_val);
> +
> +       if (config->user_ctl_hi1_val)
> +               regmap_write(regmap, PLL_USER_CTL_U1(pll),
> +                            config->user_ctl_hi1_val);
> +
> +       if (config->test_ctl_val)
> +               regmap_write(regmap, PLL_TEST_CTL(pll),
> +                            config->test_ctl_val);
> +
> +       if (config->test_ctl_hi_val)
> +               regmap_write(regmap, PLL_TEST_CTL_U(pll),
> +                            config->test_ctl_hi_val);
> +
> +       if (config->test_ctl_hi1_val)
> +               regmap_write(regmap, PLL_TEST_CTL_U1(pll),
> +                            config->test_ctl_hi1_val);
> +
> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_UPDATE_BYPASS,
> +                          PLL_UPDATE_BYPASS);
> +
> +       /* Disable PLL output */
> +       regmap_update_bits(regmap, PLL_MODE(pll),  PLL_OUTCTRL, 0);
> +
> +       /* Set operation mode to OFF */
> +       regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
> +
> +       /* PLL should be in OFF mode before continuing */
> +       wmb();

How does the write above overtake the write below? This barrier looks
wrong.

> +
> +       /* Place the PLL in STANDBY mode */
> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_=
N);
> +}
> +EXPORT_SYMBOL_GPL(clk_lucid_pll_configure);
> +
> +/*
> + * The Lucid PLL requires a power-on self-calibration which happens when=
 the
> + * PLL comes out of reset. Calibrate in case it is not completed.
> + */
> +static int alpha_pll_lucid_prepare(struct clk_hw *hw)
> +{
> +       struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> +       u32 regval;
> +       int ret;
> +
> +       /* Return early if calibration is not needed. */
> +       regmap_read(pll->clkr.regmap, PLL_STATUS(pll), &regval);
> +       if (regval & LUCID_PCAL_DONE)
> +               return 0;
> +
> +       ret =3D clk_trion_pll_enable(hw);
> +       if (ret)
> +               return ret;
> +
> +       clk_trion_pll_disable(hw);
> +
> +       return 0;

Can you write this like:

	/* On/off to calibrate */
	ret =3D clk_trion_pll_enable(hw);
	if (!ret)
		clk_trion_pll_disable(hw);

	return ret;

> +}
> +
> +static int alpha_pll_lucid_set_rate(struct clk_hw *hw, unsigned long rat=
e,
> +                                   unsigned long prate)
> +{
> +       struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> +       unsigned long rrate;
> +       u32 regval, l, alpha_width =3D pll_alpha_width(pll);
> +       u64 a;
> +       int ret;
> +
> +       rrate =3D alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
> +
> +       /*
> +        * Due to a limited number of bits for fractional rate programmin=
g, the
> +        * rounded up rate could be marginally higher than the requested =
rate.
> +        */
> +       if (rrate > (rate + PLL_RATE_MARGIN) || rrate < rate) {

Any chance this can be pushed into the alpha_pll_round_rate() API? It's
duplicated in this driver.

> +               pr_err("Call set rate on the PLL with rounded rates!\n");
> +               return -EINVAL;
> +       }
> +
> +       regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +       regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
> +
> +       /* Latch the PLL input */
> +       ret =3D regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
> +                                PLL_UPDATE, PLL_UPDATE);
> +       if (ret)
> +               return ret;
> +
> +       /* Wait for 2 reference cycles before checking the ACK bit. */

Are reference cycles 2 * 1 / 19.2MHz?

> +       udelay(1);
> +       regmap_read(pll->clkr.regmap, PLL_MODE(pll), &regval);
> +       if (!(regval & ALPHA_PLL_ACK_LATCH)) {
> +               WARN(1, "PLL latch failed. Output may be unstable!\n");

Do we need a big WARN stack for this? How about pr_warn() instead?

> +               return -EINVAL;
> +       }
> +
> +       /* Return the latch input to 0 */
> +       ret =3D regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
> +                                PLL_UPDATE, 0);
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
