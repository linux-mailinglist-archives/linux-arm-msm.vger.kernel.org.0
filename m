Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 560C754DA03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 07:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358690AbiFPFu6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 01:50:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiFPFu4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 01:50:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CDDA5B8A9;
        Wed, 15 Jun 2022 22:50:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A92196192C;
        Thu, 16 Jun 2022 05:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3BCFC34114;
        Thu, 16 Jun 2022 05:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655358654;
        bh=jBGr2mW0v20ki72++9YYdQvTKfBMUyIOPFlxMcNHOJs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bvohkB2CAmBsspqgtNYBRTAtZDtKAcdAvJRzqvyK1nM1do/G26BdlaYiLtgXcsHW6
         GC06R8YGfCpYREcEWVDYegJ7pAGxI2Jxe0kyVVKmgpGh6+oYuMRJvqZlnraTRFAAaJ
         CSlKJn8oOqf9GvSvJCTwX0BC9KEpawZ2Ap7iKc++hPHxw81cgLq+Jg/9sGyc8lm9v/
         FkiK0KvBx6FKHxBPYD32y0R7tV9symQBEVHa6Kcvs5fnZTAB6FFDuRkK7fs2ba7EYL
         EwPG8YCKbrhlkWGleqDYPehO5k/LSfpPfRV6hk/Ars0m2cJWbOn8Blga5jtQwmUC5R
         kuA1owQCZxXKA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220603080101.2251828-1-vladimir.zapolskiy@linaro.org>
References: <20220603080019.2251764-1-vladimir.zapolskiy@linaro.org> <20220603080101.2251828-1-vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v6 5/7] clk: qcom: clk-alpha-pll: add Lucid EVO PLL configuration interfaces
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Date:   Wed, 15 Jun 2022 22:50:51 -0700
User-Agent: alot/0.10
Message-Id: <20220616055053.F3BCFC34114@smtp.kernel.org>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vladimir Zapolskiy (2022-06-03 01:01:01)
> The change adds controls for Lucid EVO PLL configuration and exports

Please read the section from this grep

 $ git grep "This patch" -- Documentation/process/

> control functions to clock controller drivers.
>=20
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes from v3 to v6:
> * none.
>=20
> Changes from v2 to v3:
> * improved commit subject and description per ask from Bjorn.
>=20
>  drivers/clk/qcom/clk-alpha-pll.c | 65 ++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  5 ++-
>  2 files changed, 69 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alph=
a-pll.c
> index 47879ee5a677..54bad5277802 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -1994,6 +1996,33 @@ const struct clk_ops clk_alpha_pll_zonda_ops =3D {
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
> =20
> +void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regma=
p *regmap,
> +                                const struct alpha_pll_config *config)
> +{
> +       clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l |
> +                       (TRION_PLL_CAL_VAL << LUCID_EVO_PLL_CAL_L_VAL_SHI=
FT));

Prefer a local variable

	u32 lval =3D config->l;

	lval |=3D TRION_PLL_CAL_VAL << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), lval);


> +
> +       clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->al=
pha);
> +       clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->c=
onfig_ctl_val);
> +       clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), config-=
>config_ctl_hi_val);
> +       clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), config=
->config_ctl_hi1_val);
> +       clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll), config->use=
r_ctl_val);
> +       clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U(pll), config->u=
ser_ctl_hi_val);
> +       clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), config->tes=
t_ctl_val);
> +       clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), config->t=
est_ctl_hi_val);
> +       clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll), config->=
test_ctl_hi1_val);
> +
> +       /* Disable PLL output */
> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
> +
> +       /* Set operation mode to STANDBY */
> +       regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
> +
> +       /* Place the PLL in STANDBY mode */

You mean reset? The comments don't seem very useful.

> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_=
N);
> +}
> +EXPORT_SYMBOL_GPL(clk_lucid_evo_pll_configure);
> +
>  static int alpha_pll_lucid_evo_enable(struct clk_hw *hw)
>  {
>         struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
