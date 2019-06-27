Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05E1858D5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2019 23:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbfF0Vu3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jun 2019 17:50:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:39878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726384AbfF0Vu3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jun 2019 17:50:29 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 757982063F;
        Thu, 27 Jun 2019 21:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561672227;
        bh=+hnLXFnOo9VFV9gApTYWkYCpMs8WYGse15USRK+DkWA=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=nvqJiF3RGfDK9ZM/Klv4gK3SaINpieIK6jbGjahb1SD1jabIfv8ddey4f5RgBgSdf
         GzA+zcjrF8FuVVty7+HfCHYz3fhGplKhuLN1ZPb3zuZCfk9TS/NyxSLv6goadj4FFU
         HdCBE/OqVMgulzoChl6/ZWwWn2VNXMPbtbuLwxBQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190625063140.17106-3-vkoul@kernel.org>
References: <20190625063140.17106-1-vkoul@kernel.org> <20190625063140.17106-3-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 2/3] clk: qcom: clk-alpha-pll: Add support for Trion PLLs
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 27 Jun 2019 14:50:26 -0700
Message-Id: <20190627215027.757982063F@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-06-24 23:31:39)
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alph=
a-pll.c
> index 2c6773188761..30210f5c6726 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -32,6 +32,7 @@
>  # define PLL_LOCK_DET          BIT(31)
> =20
>  #define PLL_L_VAL(p)           ((p)->offset + (p)->regs[PLL_OFF_L_VAL])
> +#define PLL_CAL_L_VAL(p)       ((p)->offset + (p)->regs[PLL_OFF_CAL_L_VA=
L])
>  #define PLL_ALPHA_VAL(p)       ((p)->offset + (p)->regs[PLL_OFF_ALPHA_VA=
L])
>  #define PLL_ALPHA_VAL_U(p)     ((p)->offset + (p)->regs[PLL_OFF_ALPHA_VA=
L_U])
> =20
> @@ -44,14 +45,17 @@
>  # define PLL_VCO_MASK          0x3
> =20
>  #define PLL_USER_CTL_U(p)      ((p)->offset + (p)->regs[PLL_OFF_USER_CTL=
_U])
> +#define PLL_USER_CTL_U1(p)     ((p)->offset + (p)->regs[PLL_OFF_USER_CTL=
_U1])
> =20
>  #define PLL_CONFIG_CTL(p)      ((p)->offset + (p)->regs[PLL_OFF_CONFIG_C=
TL])
>  #define PLL_CONFIG_CTL_U(p)    ((p)->offset + (p)->regs[PLL_OFF_CONFIG_C=
TL_U])
> +#define PLL_CONFIG_CTL_U1(p)   ((p)->offset + (p)->regs[PLL_OFF_CONFIG_C=
TL_U11])

This looks like a typo, U11 vs U1. So I don't think this has been
compile tested....

>  #define PLL_TEST_CTL(p)                ((p)->offset + (p)->regs[PLL_OFF_=
TEST_CTL])
>  #define PLL_TEST_CTL_U(p)      ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL=
_U])
>  #define PLL_STATUS(p)          ((p)->offset + (p)->regs[PLL_OFF_STATUS])
>  #define PLL_OPMODE(p)          ((p)->offset + (p)->regs[PLL_OFF_OPMODE])
>  #define PLL_FRAC(p)            ((p)->offset + (p)->regs[PLL_OFF_FRAC])
> +#define PLL_CAL_VAL(p)         ((p)->offset + (p)->regs[PLL_OFF_CAL_VAL])
> =20
>  const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] =3D {
>         [CLK_ALPHA_PLL_TYPE_DEFAULT] =3D  {
>  const struct clk_ops clk_alpha_pll_ops =3D {
>         .enable =3D clk_alpha_pll_enable,
>         .disable =3D clk_alpha_pll_disable,
> @@ -1053,6 +1210,77 @@ static unsigned long clk_alpha_pll_postdiv_fabia_r=
ecalc_rate(struct clk_hw *hw,
[...]
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

And this is OK? Shouldn't we fail because we can't change to the rate
that's desired?

> +        */
> +       ret =3D regmap_read(regmap, PLL_MODE(pll), &val);
> +       if (ret)
> +               return ret;
> +
> +       if (val & PLL_VOTE_FSM_ENA)
> +               return 0;
> +
> +       div =3D DIV_ROUND_UP_ULL(parent_rate, rate);
> +       for (i =3D 0; i < pll->num_post_div; i++) {
> +               if (pll->post_div_table[i].div =3D=3D div) {
> +                       val =3D pll->post_div_table[i].val;
> +                       break;
> +               }
> +       }
> +
> +       return regmap_update_bits(regmap, PLL_USER_CTL(pll),
> +                                 PLL_POST_DIV_MASK(pll) << PLL_POST_DIV_=
SHIFT,
> +                                 val << PLL_POST_DIV_SHIFT);
> +}
