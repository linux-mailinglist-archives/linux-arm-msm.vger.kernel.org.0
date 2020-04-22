Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EFE91B353E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 04:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgDVC4V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 22:56:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:35576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726173AbgDVC4U (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 22:56:20 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 60608206D5;
        Wed, 22 Apr 2020 02:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587524179;
        bh=uXktadkm7XuXT9daSgTz03SBn8FHZ34ecH0ouje4lq8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hAyf5PrQe6/18AAwtdCBy7/vTmkGHFGFWYcT0VucAZGK2avIiPxB3tdbXuKdsc1JX
         fuuHheVQ6av9Fm1wTvsGGd5MVl+Nfvo/B8pgLXXwAlMz+qTt0aiF5K39+1gyc5D7ll
         j7wFUiAvPfeCpk0eHH6W0COpcM9jSiPWX81GHpDg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200419121808.440780-4-bryan.odonoghue@linaro.org>
References: <20200419121808.440780-1-bryan.odonoghue@linaro.org> <20200419121808.440780-4-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 3/3] clk: qcom: gcc-msm8939: Make silicon specific updates for msm8939
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, p.zabel@pengutronix.de,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Tue, 21 Apr 2020 19:56:18 -0700
Message-ID: <158752417863.132238.13958544237045504884@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bryan O'Donoghue (2020-04-19 05:18:08)
> The msm8939 is based on the msm8916. It is compatible in several ways but,
> has additional functional blocks added which require additional PLL
> sources. In some cases functional blocks from the msm8916 have different
> clock sources or different supported frequencies.
>=20
> This patch encapsulates the conversion from msm8916 to msm8939.
>=20
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/clk/qcom/gcc-msm8939.c | 832 ++++++++++++++++++++++++++++-----
>  1 file changed, 709 insertions(+), 123 deletions(-)
>=20

Please use the new way of specifying clk parents with the clk_hw and DT
based way. Some qcom clk drivers have already migrated. If this is a
copy of the other driver then perhaps also modify that one in the series
so that git can find the copy still. Sigh I still haven't written the
documentation about it!

Look for .parent_data in drivers/clk/qcom/gcc-sc7180.c for the best
guidance.

> @@ -1695,6 +1997,7 @@ static struct clk_branch gcc_blsp1_qup4_spi_apps_cl=
k =3D {
>         },
>  };
> =20
> +/* CBCR/halt_reg value derived from code only */
>  static struct clk_branch gcc_blsp1_qup5_i2c_apps_clk =3D {
>         .halt_reg =3D 0x06020,
>         .clkr =3D {
> @@ -1712,6 +2015,7 @@ static struct clk_branch gcc_blsp1_qup5_i2c_apps_cl=
k =3D {
>         },
>  };
> =20
> +/* CBCR/halt_reg value derived from code only */
>  static struct clk_branch gcc_blsp1_qup5_spi_apps_clk =3D {
>         .halt_reg =3D 0x0601c,
>         .clkr =3D {
> @@ -1729,6 +2033,7 @@ static struct clk_branch gcc_blsp1_qup5_spi_apps_cl=
k =3D {
>         },
>  };
> =20
> +/* CBCR/halt_reg value derived from code only */
>  static struct clk_branch gcc_blsp1_qup6_i2c_apps_clk =3D {
>         .halt_reg =3D 0x07020,
>         .clkr =3D {
> @@ -1746,6 +2051,7 @@ static struct clk_branch gcc_blsp1_qup6_i2c_apps_cl=
k =3D {
>         },
>  };
> =20
> +/* CBCR/halt_reg value derived from code only */
>  static struct clk_branch gcc_blsp1_qup6_spi_apps_clk =3D {
>         .halt_reg =3D 0x0701c,
>         .clkr =3D {
> @@ -1797,6 +2103,7 @@ static struct clk_branch gcc_blsp1_uart2_apps_clk =
=3D {
>         },
>  };
> =20
> +/* CBCR/halt_reg value derived from code only */
>  static struct clk_branch gcc_boot_rom_ahb_clk =3D {
>         .halt_reg =3D 0x1300c,
>         .halt_check =3D BRANCH_HALT_VOTED,
> @@ -2341,6 +2648,7 @@ static struct clk_branch gcc_camss_vfe_axi_clk =3D {
>         },
>  };
> =20
> +/* CBCR/halt_reg value derived from code only */
>  static struct clk_branch gcc_crypto_ahb_clk =3D {
>         .halt_reg =3D 0x16024,
>         .halt_check =3D BRANCH_HALT_VOTED,
> @@ -2359,6 +2667,7 @@ static struct clk_branch gcc_crypto_ahb_clk =3D {
>         },
>  };
> =20
> +/* CBCR/halt_reg value derived from code only */
>  static struct clk_branch gcc_crypto_axi_clk =3D {
>         .halt_reg =3D 0x16020,
>         .halt_check =3D BRANCH_HALT_VOTED,
> @@ -2377,6 +2686,7 @@ static struct clk_branch gcc_crypto_axi_clk =3D {
>         },
>  };
> =20
> +/* CBCR/halt_reg value derived from code only */
>  static struct clk_branch gcc_crypto_clk =3D {
>         .halt_reg =3D 0x1601c,
>         .halt_check =3D BRANCH_HALT_VOTED,
> @@ -2650,6 +3011,7 @@ static struct clk_branch gcc_oxili_gfx3d_clk =3D {
>         },
>  };
> =20
> +/* CBCR/halt_reg value derived from code only */
>  static struct clk_branch gcc_pdm2_clk =3D {
>         .halt_reg =3D 0x4400c,
>         .clkr =3D {
> @@ -2667,6 +3029,7 @@ static struct clk_branch gcc_pdm2_clk =3D {
>         },
>  };
> =20
> +/* CBCR/halt_reg value derived from code only */
>  static struct clk_branch gcc_pdm_ahb_clk =3D {
>         .halt_reg =3D 0x44004,
>         .clkr =3D {
> @@ -2684,6 +3047,7 @@ static struct clk_branch gcc_pdm_ahb_clk =3D {
>         },
>  };
> =20
> +/* CBCR/halt_reg value derived from code only */

Drop these useless comments.
