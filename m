Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 732B9269A41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 02:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgIOAOB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 20:14:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:58478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726125AbgIOANs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 20:13:48 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 80747208DB;
        Tue, 15 Sep 2020 00:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600128827;
        bh=d8bD4uKVWeKZYe08W0vdN05h/ZB4CqmvBFazsW+NFcw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IiLXrv4ITcF1XYW9UP436SwWf830AZTc1QAzYhWePWBGu82+6YBFMiNZHo/LEQZtb
         3I8T2dMRxs5yAv4YTTQrYWHVgDFgnGyBJBFMBuorZVQj9NjelvuFVyGWUMOAA9QvVS
         AQNusgkEwkfc8aXfpkahDj+a1IBLzwt5gXtwMcok=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1599584848-15530-2-git-send-email-tdas@codeaurora.org>
References: <1599584848-15530-1-git-send-email-tdas@codeaurora.org> <1599584848-15530-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 1/3] clk: qcom: clk-alpha-pll: Add support for controlling Agera PLLs
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
Date:   Mon, 14 Sep 2020 17:13:46 -0700
Message-ID: <160012882627.4188128.11464299361688037948@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-09-08 10:07:26)
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alph=
a-pll.c
> index 26139ef..fb27fcf 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -1561,3 +1571,75 @@ const struct clk_ops clk_alpha_pll_postdiv_lucid_o=
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
> +static int alpha_pll_agera_set_rate(struct clk_hw *hw, unsigned long rat=
e,

Why not clk_alpha_pll prefix? We should prefix the other PLL functions
in here with clk_alpha_ like trion and fabia

> +                                                       unsigned long pra=
te)
> +{
> +       struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> +       u32 l, alpha_width =3D pll_alpha_width(pll);
> +       unsigned long rrate;
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
> +               pr_err("Call set rate on the PLL with rounded rates!\n");
> +               return -EINVAL;
> +       }

See commit f78f29079327 ("clk: qcom: alpha-pll: Make error prints more
informative") where I tried to make this better. Can you extract this
check into a function that helps us understand the error better?

> +
> +       /* change L_VAL without having to go through the power on sequenc=
e */
> +       regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +       regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
> +
> +       /* Ensure that the write above goes through before proceeding. */
> +       mb();

regmap has an mb() in it. Remove this?

> +
> +       if (clk_hw_is_enabled(hw))
> +               return wait_for_pll_enable_lock(pll);
> +
> +       return 0;
> +}
> +
> +const struct clk_ops clk_alpha_pll_agera_ops =3D {
> +       .enable =3D clk_alpha_pll_enable,
> +       .disable =3D clk_alpha_pll_disable,
> +       .is_enabled =3D clk_alpha_pll_is_enabled,
> +       .recalc_rate =3D alpha_pll_fabia_recalc_rate,
> +       .round_rate =3D clk_alpha_pll_round_rate,
> +       .set_rate =3D alpha_pll_agera_set_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_agera_ops);
