Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE91742CD6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbhJMWLl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:11:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:41632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231149AbhJMWLl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:11:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BE2C610E7;
        Wed, 13 Oct 2021 22:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634162977;
        bh=fqBNu1VQVnHRXBno7nQwekr/Zstv2PGJBtOIqWlkkGA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BEykInsQoscgG6nA4l6uGbUNj06CcjBXXmPJ0SdXjuie6JCckrAwRubg5oHhlaO4z
         lUyqutQfV2LC+pVsrINBcTzYttNrv+OwvY550kTtPAtf24tILQixhPnCKNtY0+nzrN
         /TmEoiCEqEgOLaU9ggU3d4wGZRjIruW1vXI0Qfu+j1xAe2+5+11f7GxiUoZAigdXKu
         /zSZqX0V8hBsebu+noLDaCgiFNkC6qa8jiPWoOftqv1zwaUcxt8iwNBjmtKsxJIZcs
         9xXzRWAM3eMLnY82zi6xKndekJeVDjUBS/y9gk0dszSAvxJCU4T4uD5Jj02nt97T+K
         dG6XLwgGYLN8g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210923162645.23257-3-konrad.dybcio@somainline.org>
References: <20210923162645.23257-1-konrad.dybcio@somainline.org> <20210923162645.23257-3-konrad.dybcio@somainline.org>
Subject: Re: [PATCH v4 3/9] clk: qcom: gcc-msm8994: Fix up SPI QUP clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Wed, 13 Oct 2021 15:09:36 -0700
Message-ID: <163416297617.936110.15563294159982964830@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-09-23 09:26:36)
> Fix up SPI QUP freq tables to account for the fact
> that not every QUP can run at the same set of frequencies.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  drivers/clk/qcom/gcc-msm8994.c | 118 +++++++++++++++++++++++++++++----
>  1 file changed, 105 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm899=
4.c
> index 8e9a8ebadf73..78c06104854e 100644
> --- a/drivers/clk/qcom/gcc-msm8994.c
> +++ b/drivers/clk/qcom/gcc-msm8994.c
> @@ -169,7 +169,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src =
=3D {
>         },
>  };
> =20
> -static struct freq_tbl ftbl_blspqup_spi_apps_clk_src[] =3D {
> +static struct freq_tbl ftbl_blsp1_qup1_spi_apps_clk_src[] =3D {
>         F(960000, P_XO, 10, 1, 2),
>         F(4800000, P_XO, 4, 0, 0),
>         F(9600000, P_XO, 2, 0, 0),
> @@ -187,7 +187,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src =
=3D {
>         .mnd_width =3D 8,
>         .hid_width =3D 5,
>         .parent_map =3D gcc_xo_gpll0_map,
> -       .freq_tbl =3D ftbl_blspqup_spi_apps_clk_src,
> +       .freq_tbl =3D ftbl_blsp1_qup1_spi_apps_clk_src,
>         .clkr.hw.init =3D &(struct clk_init_data){
>                 .name =3D "blsp1_qup1_spi_apps_clk_src",
>                 .parent_data =3D gcc_xo_gpll0,
> @@ -209,12 +209,25 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src =
=3D {
>         },
>  };
> =20
> +static struct freq_tbl ftbl_blsp1_qup2_spi_apps_clk_src[] =3D {
> +       F(960000, P_XO, 10, 1, 2),
> +       F(4800000, P_XO, 4, 0, 0),
> +       F(9600000, P_XO, 2, 0, 0),
> +       F(15000000, P_GPLL0, 10, 1, 4),
> +       F(19200000, P_XO, 1, 0, 0),
> +       F(24000000, P_GPLL0, 12.5, 1, 2),
> +       F(25000000, P_GPLL0, 12, 1, 2),
> +       F(42860000, P_GPLL0, 14, 0, 0),
> +       F(46150000, P_GPLL0, 13, 0, 0),
> +       { }
> +};
> +
>  static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src =3D {
>         .cmd_rcgr =3D 0x06cc,
>         .mnd_width =3D 8,
>         .hid_width =3D 5,
>         .parent_map =3D gcc_xo_gpll0_map,
> -       .freq_tbl =3D ftbl_blspqup_spi_apps_clk_src,
> +       .freq_tbl =3D ftbl_blsp1_qup2_spi_apps_clk_src,
>         .clkr.hw.init =3D &(struct clk_init_data){
>                 .name =3D "blsp1_qup2_spi_apps_clk_src",
>                 .parent_data =3D gcc_xo_gpll0,
> @@ -236,12 +249,25 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src =
=3D {
>         },
>  };
> =20
> +static struct freq_tbl ftbl_blsp1_qup3_4_spi_apps_clk_src[] =3D {
> +       F(960000, P_XO, 10, 1, 2),
> +       F(4800000, P_XO, 4, 0, 0),
> +       F(9600000, P_XO, 2, 0, 0),
> +       F(15000000, P_GPLL0, 10, 1, 4),
> +       F(19200000, P_XO, 1, 0, 0),
> +       F(24000000, P_GPLL0, 12.5, 1, 2),
> +       F(25000000, P_GPLL0, 12, 1, 2),
> +       F(42860000, P_GPLL0, 14, 0, 0),
> +       F(44440000, P_GPLL0, 13.5, 0, 0),
> +       { }
> +};
> +
>  static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src =3D {
>         .cmd_rcgr =3D 0x074c,
>         .mnd_width =3D 8,
>         .hid_width =3D 5,
>         .parent_map =3D gcc_xo_gpll0_map,
> -       .freq_tbl =3D ftbl_blspqup_spi_apps_clk_src,
> +       .freq_tbl =3D ftbl_blsp1_qup3_4_spi_apps_clk_src,
>         .clkr.hw.init =3D &(struct clk_init_data){
>                 .name =3D "blsp1_qup3_spi_apps_clk_src",
>                 .parent_data =3D gcc_xo_gpll0,
> @@ -268,7 +294,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src =
=3D {
>         .mnd_width =3D 8,
>         .hid_width =3D 5,
>         .parent_map =3D gcc_xo_gpll0_map,
> -       .freq_tbl =3D ftbl_blspqup_spi_apps_clk_src,
> +       .freq_tbl =3D ftbl_blsp1_qup3_4_spi_apps_clk_src,
>         .clkr.hw.init =3D &(struct clk_init_data){
>                 .name =3D "blsp1_qup4_spi_apps_clk_src",
>                 .parent_data =3D gcc_xo_gpll0,
> @@ -290,12 +316,25 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src =
=3D {
>         },
>  };
> =20
> +static struct freq_tbl ftbl_blsp1_qup5_spi_apps_clk_src[] =3D {
> +       F(960000, P_XO, 10, 1, 2),
> +       F(4800000, P_XO, 4, 0, 0),
> +       F(9600000, P_XO, 2, 0, 0),
> +       F(15000000, P_GPLL0, 10, 1, 4),
> +       F(19200000, P_XO, 1, 0, 0),
> +       F(24000000, P_GPLL0, 12.5, 1, 2),
> +       F(25000000, P_GPLL0, 12, 1, 2),
> +       F(40000000, P_GPLL0, 15, 0, 0),
> +       F(42860000, P_GPLL0, 14, 0, 0),
> +       { }
> +};
> +
>  static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src =3D {
>         .cmd_rcgr =3D 0x084c,
>         .mnd_width =3D 8,
>         .hid_width =3D 5,
>         .parent_map =3D gcc_xo_gpll0_map,
> -       .freq_tbl =3D ftbl_blspqup_spi_apps_clk_src,
> +       .freq_tbl =3D ftbl_blsp1_qup5_spi_apps_clk_src,
>         .clkr.hw.init =3D &(struct clk_init_data){
>                 .name =3D "blsp1_qup5_spi_apps_clk_src",
>                 .parent_data =3D gcc_xo_gpll0,
> @@ -317,12 +356,25 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src =
=3D {
>         },
>  };
> =20
> +static struct freq_tbl ftbl_blsp1_qup6_spi_apps_clk_src[] =3D {
> +       F(960000, P_XO, 10, 1, 2),
> +       F(4800000, P_XO, 4, 0, 0),
> +       F(9600000, P_XO, 2, 0, 0),
> +       F(15000000, P_GPLL0, 10, 1, 4),
> +       F(19200000, P_XO, 1, 0, 0),
> +       F(24000000, P_GPLL0, 12.5, 1, 2),
> +       F(27906976, P_GPLL0, 1, 2, 43),
> +       F(41380000, P_GPLL0, 15, 0, 0),
> +       F(42860000, P_GPLL0, 14, 0, 0),
> +       { }
> +};
> +
>  static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src =3D {
>         .cmd_rcgr =3D 0x08cc,
>         .mnd_width =3D 8,
>         .hid_width =3D 5,
>         .parent_map =3D gcc_xo_gpll0_map,
> -       .freq_tbl =3D ftbl_blspqup_spi_apps_clk_src,
> +       .freq_tbl =3D ftbl_blsp1_qup6_spi_apps_clk_src,
>         .clkr.hw.init =3D &(struct clk_init_data){
>                 .name =3D "blsp1_qup6_spi_apps_clk_src",
>                 .parent_data =3D gcc_xo_gpll0,
> @@ -447,12 +499,25 @@ static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src =
=3D {
>         },
>  };
> =20
> +static struct freq_tbl ftbl_blsp2_qup1_2_spi_apps_clk_src[] =3D {
> +       F(960000, P_XO, 10, 1, 2),
> +       F(4800000, P_XO, 4, 0, 0),
> +       F(9600000, P_XO, 2, 0, 0),
> +       F(15000000, P_GPLL0, 10, 1, 4),
> +       F(19200000, P_XO, 1, 0, 0),
> +       F(24000000, P_GPLL0, 12.5, 1, 2),
> +       F(25000000, P_GPLL0, 12, 1, 2),
> +       F(42860000, P_GPLL0, 14, 0, 0),
> +       F(44440000, P_GPLL0, 13.5, 0, 0),
> +       { }
> +};
> +
>  static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src =3D {
>         .cmd_rcgr =3D 0x098c,
>         .mnd_width =3D 8,
>         .hid_width =3D 5,
>         .parent_map =3D gcc_xo_gpll0_map,
> -       .freq_tbl =3D ftbl_blspqup_spi_apps_clk_src,
> +       .freq_tbl =3D ftbl_blsp2_qup1_2_spi_apps_clk_src,
>         .clkr.hw.init =3D &(struct clk_init_data){
>                 .name =3D "blsp2_qup1_spi_apps_clk_src",
>                 .parent_data =3D gcc_xo_gpll0,
> @@ -479,7 +544,7 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src =
=3D {
>         .mnd_width =3D 8,
>         .hid_width =3D 5,
>         .parent_map =3D gcc_xo_gpll0_map,
> -       .freq_tbl =3D ftbl_blspqup_spi_apps_clk_src,
> +       .freq_tbl =3D ftbl_blsp2_qup1_2_spi_apps_clk_src,
>         .clkr.hw.init =3D &(struct clk_init_data){
>                 .name =3D "blsp2_qup2_spi_apps_clk_src",
>                 .parent_data =3D gcc_xo_gpll0,
> @@ -488,6 +553,19 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src =
=3D {
>         },
>  };
> =20
> +static struct freq_tbl ftbl_blsp2_qup3_4_spi_apps_clk_src[] =3D {
> +       F(960000, P_XO, 10, 1, 2),
> +       F(4800000, P_XO, 4, 0, 0),
> +       F(9600000, P_XO, 2, 0, 0),
> +       F(15000000, P_GPLL0, 10, 1, 4),
> +       F(19200000, P_XO, 1, 0, 0),
> +       F(24000000, P_GPLL0, 12.5, 1, 2),
> +       F(25000000, P_GPLL0, 12, 1, 2),
> +       F(42860000, P_GPLL0, 14, 0, 0),
> +       F(48000000, P_GPLL0, 12.5, 0, 0),
> +       { }
> +};
> +
>  static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src =3D {
>         .cmd_rcgr =3D 0x0aa0,
>         .hid_width =3D 5,
> @@ -506,7 +584,7 @@ static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src =
=3D {
>         .mnd_width =3D 8,
>         .hid_width =3D 5,
>         .parent_map =3D gcc_xo_gpll0_map,
> -       .freq_tbl =3D ftbl_blspqup_spi_apps_clk_src,
> +       .freq_tbl =3D ftbl_blsp2_qup3_4_spi_apps_clk_src,
>         .clkr.hw.init =3D &(struct clk_init_data){
>                 .name =3D "blsp2_qup3_spi_apps_clk_src",
>                 .parent_data =3D gcc_xo_gpll0,
> @@ -533,7 +611,7 @@ static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src =
=3D {
>         .mnd_width =3D 8,
>         .hid_width =3D 5,
>         .parent_map =3D gcc_xo_gpll0_map,
> -       .freq_tbl =3D ftbl_blspqup_spi_apps_clk_src,
> +       .freq_tbl =3D ftbl_blsp2_qup3_4_spi_apps_clk_src,
>         .clkr.hw.init =3D &(struct clk_init_data){
>                 .name =3D "blsp2_qup4_spi_apps_clk_src",
>                 .parent_data =3D gcc_xo_gpll0,
> @@ -560,7 +638,8 @@ static struct clk_rcg2 blsp2_qup5_spi_apps_clk_src =
=3D {
>         .mnd_width =3D 8,
>         .hid_width =3D 5,
>         .parent_map =3D gcc_xo_gpll0_map,
> -       .freq_tbl =3D ftbl_blspqup_spi_apps_clk_src,
> +       /* BLSP1 QUP1 and BLSP2 QUP5 use the same freqs */
> +       .freq_tbl =3D ftbl_blsp1_qup1_spi_apps_clk_src,
>         .clkr.hw.init =3D &(struct clk_init_data){
>                 .name =3D "blsp2_qup5_spi_apps_clk_src",
>                 .parent_data =3D gcc_xo_gpll0,
> @@ -582,12 +661,25 @@ static struct clk_rcg2 blsp2_qup6_i2c_apps_clk_src =
=3D {
>         },
>  };
> =20
> +static struct freq_tbl ftbl_blsp2_qup6_spi_apps_clk_src[] =3D {
> +       F(960000, P_XO, 10, 1, 2),
> +       F(4800000, P_XO, 4, 0, 0),
> +       F(9600000, P_XO, 2, 0, 0),
> +       F(15000000, P_GPLL0, 10, 1, 4),
> +       F(19200000, P_XO, 1, 0, 0),
> +       F(24000000, P_GPLL0, 12.5, 1, 2),
> +       F(25000000, P_GPLL0, 12, 1, 2),
> +       F(44440000, P_GPLL0, 13.5, 0, 0),
> +       F(48000000, P_GPLL0, 12.5, 0, 0),
> +       { }
> +};
> +
>  static struct clk_rcg2 blsp2_qup6_spi_apps_clk_src =3D {
>         .cmd_rcgr =3D 0x0c0c,
>         .mnd_width =3D 8,
>         .hid_width =3D 5,
>         .parent_map =3D gcc_xo_gpll0_map,
> -       .freq_tbl =3D ftbl_blspqup_spi_apps_clk_src,
> +       .freq_tbl =3D ftbl_blsp2_qup6_spi_apps_clk_src,
>         .clkr.hw.init =3D &(struct clk_init_data){
>                 .name =3D "blsp2_qup6_spi_apps_clk_src",
>                 .parent_data =3D gcc_xo_gpll0,
> --=20
> 2.33.0
>
