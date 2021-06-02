Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38944399575
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 23:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhFBVgO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 17:36:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:34184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229467AbhFBVgN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 17:36:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53C84613E9;
        Wed,  2 Jun 2021 21:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622669670;
        bh=dwfKNXe06HiEsvdu4JBANgbquCcKQPDuMnik64+E+BQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PKHpM542/cRaNkqCFJwF0jFMTs3KaIo2qKGm8MyVsqB40ePGbyMRPKwzXE9px8z4C
         PoplUtpCevNIpCrdEMeofpx2FO+ssa692qCDZhT+l3+yWPTALmR/srb9V0WWoS6tWn
         b2I6AfSFaHaLzdaFz/hYtxfzFoIuke/RQggkb3+aCUYZLxyfhgu37rcrIE72+Dqi/4
         S8pMistnQTxs6fTrGp5o8We4W3uHrvp4mjBw1yYedxb3Rmm7iZHkS8nthRep4Wc6qE
         1sDp5p8lEWKXmd/rfUII5eXXBX0L6pJjel7fyzADnuqMzxNAuqp2EGwhUtxl2fzwdS
         eh3RPYILWgYRA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210519001802.1863-1-jonathan@marek.ca>
References: <20210519001802.1863-1-jonathan@marek.ca>
Subject: Re: [PATCH v2 1/2] clk: qcom: add support for SM8350 DISPCC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Wed, 02 Jun 2021 14:34:29 -0700
Message-ID: <162266966911.4130789.18195427738586432385@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2021-05-18 17:18:01)
> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-s=
m8250.c
> index de09cd5c209f..5f22a715e2f0 100644
> --- a/drivers/clk/qcom/dispcc-sm8250.c
> +++ b/drivers/clk/qcom/dispcc-sm8250.c
> @@ -36,6 +36,10 @@ static struct pll_vco vco_table[] =3D {
>         { 249600000, 2000000000, 0 },
>  };
> =20
> +static struct pll_vco lucid_5lpe_vco[] =3D {

const

> +       { 249600000, 1750000000, 0 },
> +};
> +
>  static struct alpha_pll_config disp_cc_pll0_config =3D {
>         .l =3D 0x47,
>         .alpha =3D 0xE000,
> @@ -1039,6 +1043,7 @@ static const struct qcom_cc_desc disp_cc_sm8250_des=
c =3D {
>  static const struct of_device_id disp_cc_sm8250_match_table[] =3D {
>         { .compatible =3D "qcom,sm8150-dispcc" },
>         { .compatible =3D "qcom,sm8250-dispcc" },
> +       { .compatible =3D "qcom,sm8350-dispcc" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, disp_cc_sm8250_match_table);
> @@ -1051,7 +1056,7 @@ static int disp_cc_sm8250_probe(struct platform_dev=
ice *pdev)
>         if (IS_ERR(regmap))
>                 return PTR_ERR(regmap);
> =20
> -       /* note: trion =3D=3D lucid, except for the prepare() op */
> +       /* Apply differences for SM8150 and SM8350 */
>         BUILD_BUG_ON(CLK_ALPHA_PLL_TYPE_TRION !=3D CLK_ALPHA_PLL_TYPE_LUC=
ID);
>         if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8150-dispc=
c")) {
>                 disp_cc_pll0_config.config_ctl_hi_val =3D 0x00002267;
> @@ -1062,8 +1067,62 @@ static int disp_cc_sm8250_probe(struct platform_de=
vice *pdev)
>                 disp_cc_pll1_config.config_ctl_hi1_val =3D 0x00000024;
>                 disp_cc_pll1_config.user_ctl_hi1_val =3D 0x000000D0;
>                 disp_cc_pll1_init.ops =3D &clk_alpha_pll_trion_ops;
> +       } else if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm835=
0-dispcc")) {
> +               static struct clk_rcg2* const rcgs[] =3D {

Please move this to global scope and give it a name.

> +                       &disp_cc_mdss_byte0_clk_src,
> +                       &disp_cc_mdss_byte1_clk_src,
> +                       &disp_cc_mdss_dp_aux1_clk_src,
> +                       &disp_cc_mdss_dp_aux_clk_src,
> +                       &disp_cc_mdss_dp_link1_clk_src,
> +                       &disp_cc_mdss_dp_link_clk_src,
> +                       &disp_cc_mdss_dp_pixel1_clk_src,
> +                       &disp_cc_mdss_dp_pixel2_clk_src,
> +                       &disp_cc_mdss_dp_pixel_clk_src,
> +                       &disp_cc_mdss_esc0_clk_src,
> +                       &disp_cc_mdss_mdp_clk_src,
> +                       &disp_cc_mdss_pclk0_clk_src,
> +                       &disp_cc_mdss_pclk1_clk_src,
> +                       &disp_cc_mdss_rot_clk_src,
> +                       &disp_cc_mdss_vsync_clk_src,
> +               };
> +               static struct clk_regmap_div* const divs[] =3D {

Move global.

> +                       &disp_cc_mdss_byte0_div_clk_src,
> +                       &disp_cc_mdss_byte1_div_clk_src,
> +                       &disp_cc_mdss_dp_link1_div_clk_src,
> +                       &disp_cc_mdss_dp_link_div_clk_src,
> +               };
> +               unsigned i;

int i? I doubt being unsigned helps.

> +               static bool offset_applied =3D false;
> +
> +               /* only apply the offsets once (in case of deferred probe=
) */
> +               if (!offset_applied) {

Maybe instead of doing this in probe it can be done when the driver is
added in module init? It would mean searching the DT for the compatible
string and then if it is present running the subtraction code, but at
least we would only do it once and the code would be thrown away after
init.

> +                       for (i =3D 0; i < ARRAY_SIZE(rcgs); i++)
> +                               rcgs[i]->cmd_rcgr -=3D 4;
> +
> +                       for (i =3D 0; i < ARRAY_SIZE(divs); i++) {
> +                               divs[i]->reg -=3D 4;
> +                               divs[i]->width =3D 4;
> +                       }
> +
> +                       disp_cc_mdss_ahb_clk.halt_reg -=3D 4;
> +                       disp_cc_mdss_ahb_clk.clkr.enable_reg -=3D 4;
> +
> +                       offset_applied =3D true;
> +               }
> +
> +               disp_cc_mdss_ahb_clk_src.cmd_rcgr =3D 0x22a0;
> +
> +               disp_cc_pll0_config.config_ctl_hi1_val =3D 0x2A9A699C;
> +               disp_cc_pll0_config.test_ctl_hi1_val =3D 0x01800000;
> +               disp_cc_pll0_init.ops =3D &clk_alpha_pll_lucid_5lpe_ops;
> +               disp_cc_pll0.vco_table =3D lucid_5lpe_vco;
> +               disp_cc_pll1_config.config_ctl_hi1_val =3D 0x2A9A699C;

Lowercase hex please.

> +               disp_cc_pll1_config.test_ctl_hi1_val =3D 0x01800000;
> +               disp_cc_pll1_init.ops =3D &clk_alpha_pll_lucid_5lpe_ops;
> +               disp_cc_pll1.vco_table =3D lucid_5lpe_vco;
>         }
> =20
> +       /* note for SM8350: downstream lucid_5lpe configure differs sligh=
tly */

Is this a TODO?

>         clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_conf=
ig);
>         clk_lucid_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_conf=
ig);
>
