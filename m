Return-Path: <linux-arm-msm+bounces-40151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F7B9E2F94
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 00:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 288D4B3AD08
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 22:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAF520A5C6;
	Tue,  3 Dec 2024 22:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbUqH586"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9391D79A0;
	Tue,  3 Dec 2024 22:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733263629; cv=none; b=C4YSgCSPCGqBOk1ImxwcliopEwMod9xvQ/Qx32HnzxPW2xLR8MtQortesUndhdNbiGZlFYGNmqTjle8RSv1q9wzVZ4Q7MWv+N3uIB40kD3YcgfpQDWei5OyWpVAHaSkXNUQ+eMaZhpvtJrkAsn2+BOzEzle5YrZeaBsD3NUHUk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733263629; c=relaxed/simple;
	bh=HQAKDlz0KUN+mZdkSSDyvm1hQM8fcKSAsXSTKruZoaM=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=LR0TE7k8sn7VcD/eMbs7EsiYigf0bECedLjkX9dm9PoEUYf0l/ol2ZR/bm6vxLMJTx4L2zQzB5TSqGB8FBSvp7uyy3MIZgQTXe+WKRVYoIvFCUNh+MldK6Ch4DA5lF2VqO8Io2aGdOqiWjq3HOFJzgOrujRyNfxesndPaRrXdsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbUqH586; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF969C4CEE0;
	Tue,  3 Dec 2024 22:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733263628;
	bh=HQAKDlz0KUN+mZdkSSDyvm1hQM8fcKSAsXSTKruZoaM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cbUqH586dG+KmiWrRHmTyZRZsuzD7YDxfWa1ndkhcxeC3GrrtyNtx1yOM99RQmwxO
	 1+7DrwXwAomzzBjsDdacvHF/kOzendaJEL3cHuCcfpcVIoFee9AzbqB+0XteFF0AhP
	 VADJVyKBQXUdvEzWVgdOIJtDHFv5B8FJYV2Y+e3Lh6x3dsjQZmmoUwKqwawu8OEHd8
	 TGZMycwjLDg9QrezrfdA4xTMHJfmzp73wVDNPNep1SkxBYBWnNFnI87Ou9fXzHTxRu
	 PXstezL6Aau/79W6HL6Hhv4vwUh6qO3F8CABb1iqN4UuR099M0gp4Gw+gkJEjVfzL1
	 BjnmBtbXlCF7A==
Message-ID: <aed888b8c2f49eaaffcd6cfbdda84078.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241128-sm8750-dispcc-v1-2-120705a4015c@linaro.org>
References: <20241128-sm8750-dispcc-v1-0-120705a4015c@linaro.org> <20241128-sm8750-dispcc-v1-2-120705a4015c@linaro.org>
Subject: Re: [PATCH 2/3] clk: qcom: clk-alpha-pll: Add Pongo PLL
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Date: Tue, 03 Dec 2024 14:07:06 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Krzysztof Kozlowski (2024-11-28 07:08:00)
> @@ -360,13 +384,14 @@ static int wait_for_pll(struct clk_alpha_pll *pll, =
u32 mask, bool inverse,
>         u32 val;
>         int count;
>         int ret;
> -       const char *name =3D clk_hw_get_name(&pll->clkr.hw);
> +       const char *name;
> =20
>         ret =3D regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
>         if (ret)
>                 return ret;
> =20
> -       for (count =3D 200; count > 0; count--) {
> +       /* Pongo PLLs using a 32KHz reference can take upwards of 1500us =
to lock. */
> +       for (count =3D 1500; count > 0; count--) {
>                 ret =3D regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val=
);
>                 if (ret)
>                         return ret;
> @@ -378,6 +403,13 @@ static int wait_for_pll(struct clk_alpha_pll *pll, u=
32 mask, bool inverse,
>                 udelay(1);
>         }
> =20
> +       /* Called with clocks already registered ... */
> +       if (pll->clkr.hw.core)
> +               name =3D clk_hw_get_name(&pll->clkr.hw);
> +       else
> +               /* or before registering, when init data is present */
> +               name =3D pll->clkr.hw.init->name;

This is sad. Why can't we enable the PLL from the clk prepare/enable
path? PLLs are typically calibrated during clk_prepare().

> +
>         WARN(1, "%s failed to %s!\n", name, action);
>         return -ETIMEDOUT;
>  }
> @@ -2524,6 +2556,129 @@ const struct clk_ops clk_alpha_pll_reset_lucid_ev=
o_ops =3D {
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_reset_lucid_evo_ops);
> =20
> +static int alpha_pll_pongo_elu_enable(struct clk_hw *hw)
> +{
> +       struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> +       struct regmap *regmap =3D pll->clkr.regmap;
> +       int ret;
> +
> +       /* Check if PLL is already enabled */
> +       if (trion_pll_is_enabled(pll, regmap))
> +               return 0;
> +
> +       ret =3D regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PL=
L_RESET_N);
> +       if (ret)
> +               return ret;
> +
> +       /* Set operation mode to RUN */
> +       regmap_write(regmap, PLL_OPMODE(pll), PLL_RUN);
> +
> +       ret =3D wait_for_pll_enable_lock(pll);
> +       if (ret)
> +               return ret;
> +
> +       /* Enable the global PLL outputs */
> +       ret =3D regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, PL=
L_OUTCTRL);
> +       if (ret)
> +               return ret;
> +
> +       /* Ensure that the write above goes through before returning. */
> +       mb();
> +
> +       return ret;
> +}
> +
> +static void alpha_pll_pongo_elu_disable(struct clk_hw *hw)
> +{
> +       struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> +       struct regmap *regmap =3D pll->clkr.regmap;
> +       int ret;
> +
> +       /* Disable the global PLL output */
> +       ret =3D regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
> +       if (ret)
> +               return;
> +
> +       /* Place the PLL mode in STANDBY */
> +       regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
> +}
> +
> +static unsigned long alpha_pll_pongo_elu_recalc_rate(struct clk_hw *hw,
> +                                                    unsigned long parent=
_rate)
> +{
> +       struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> +       struct regmap *regmap =3D pll->clkr.regmap;
> +       u32 l;
> +
> +       if (regmap_read(regmap, PLL_L_VAL(pll), &l))
> +               return 0;
> +
> +       l &=3D PONGO_PLL_L_VAL_MASK;
> +
> +       return alpha_pll_calc_rate(parent_rate, l, 0, pll_alpha_width(pll=
));
> +}
> +
> +const struct clk_ops clk_alpha_pll_pongo_elu_ops =3D {
> +       .enable =3D alpha_pll_pongo_elu_enable,
> +       .disable =3D alpha_pll_pongo_elu_disable,
> +       .recalc_rate =3D alpha_pll_pongo_elu_recalc_rate,
> +};
> +EXPORT_SYMBOL(clk_alpha_pll_pongo_elu_ops);

GPL please.

> +
> +void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll,
> +                                struct regmap *regmap,
> +                                const struct alpha_pll_config *config)
> +{
> +       u32 val;
> +
> +       regmap_update_bits(regmap, PLL_USER_CTL(pll), PONGO_PLL_OUT_MASK,
> +                          PONGO_PLL_OUT_MASK);
> +
> +       if (trion_pll_is_enabled(pll, regmap))
> +               return;
> +
> +       if (regmap_read(regmap, PLL_L_VAL(pll), &val))
> +               return;
> +       val &=3D PONGO_PLL_L_VAL_MASK;
> +       if (val)
> +               return;
> +
> +       clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
> +       clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->al=
pha);
> +       clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->c=
onfig_ctl_val);
> +       clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), config-=
>config_ctl_hi_val);
> +       clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), config=
->config_ctl_hi1_val);
> +       clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U2(pll), config=
->config_ctl_hi2_val);
> +       clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll),
> +                                  config->user_ctl_val | PONGO_PLL_OUT_M=
ASK);
> +       clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U(pll), config->u=
ser_ctl_hi_val);
> +       clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), config->tes=
t_ctl_val);
> +       clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), config->t=
est_ctl_hi_val);
> +       clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll), config->=
test_ctl_hi1_val);
> +       clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U2(pll), config->=
test_ctl_hi2_val);
> +       clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U3(pll), config->=
test_ctl_hi3_val);
> +
> +       /* Disable PLL output */
> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
> +
> +       /* Enable PLL intially to one-time calibrate against XO. */
> +       regmap_write(regmap, PLL_OPMODE(pll), PLL_RUN);
> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_=
N);
> +       regmap_update_bits(regmap, PLL_MODE(pll), PONGO_XO_PRESENT, PONGO=
_XO_PRESENT);
> +
> +       /* Set regmap for wait_for_pll() */
> +       pll->clkr.regmap =3D regmap;
> +       if (wait_for_pll_enable_lock(pll))
> +               return;
> +
> +       /* Disable PLL after one-time calibration. */
> +       regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
> +
> +       /* Select internally generated clock. */
> +       regmap_update_bits(regmap, PLL_MODE(pll), PONGO_CLOCK_SELECT, PON=
GO_CLOCK_SELECT);
> +}
> +EXPORT_SYMBOL(clk_pongo_elu_pll_configure);

GPL please.

