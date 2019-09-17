Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE543B5288
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 18:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbfIQQKC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 12:10:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:47090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727845AbfIQQKB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 12:10:01 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DAFF3206C2;
        Tue, 17 Sep 2019 16:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568736601;
        bh=nAN0n7FNPLtue0I3YwzCKEoDfO6TOrlN0tJC0LD47mc=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=iZjJ8PRODuFF5bQCssu/hVtDsJt7QwjSBt4kNvNneXOX6wGA6Zlkb4QU2gzWezJP6
         6MUE9CaTWyKxZTSJCPpIE8H7eaG1gxm+FxLAL1bQ2nFg4/1dVucQCVNgFDkl9z9tzX
         okCisscpM4ABBs+pESlO8FG1++bfZoKlkah9nxSM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190917091623.3453-1-vkoul@kernel.org>
References: <20190917091623.3453-1-vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: qcom: gcc: Add missing clocks in SM8150
User-Agent: alot/0.8.1
Date:   Tue, 17 Sep 2019 09:09:59 -0700
Message-Id: <20190917161000.DAFF3206C2@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-09-17 02:16:23)
> The initial upstreaming of SM8150 GCC driver missed few clock so add
> them up now.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Should have some sort of fixes tag?

>  drivers/clk/qcom/gcc-sm8150.c | 172 ++++++++++++++++++++++++++++++++++
>  1 file changed, 172 insertions(+)
>=20
> diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> index 12ca2d14797f..13d4d14a5744 100644
> --- a/drivers/clk/qcom/gcc-sm8150.c
> +++ b/drivers/clk/qcom/gcc-sm8150.c
> @@ -1616,6 +1616,38 @@ static struct clk_branch gcc_gpu_cfg_ahb_clk =3D {
>         },
>  };
> =20
> +static struct clk_branch gcc_gpu_gpll0_clk_src =3D {
> +       .halt_check =3D BRANCH_HALT_SKIP,

Why skip?

> +       .clkr =3D {
> +               .enable_reg =3D 0x52004,
> +               .enable_mask =3D BIT(15),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_gpu_gpll0_clk_src",
> +                       .parent_hws =3D (const struct clk_hw *[]){
> +                               &gpll0.clkr.hw },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_gpu_gpll0_div_clk_src =3D {
> +       .halt_check =3D BRANCH_HALT_SKIP,

Why skip?

> +       .clkr =3D {
> +               .enable_reg =3D 0x52004,
> +               .enable_mask =3D BIT(16),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_gpu_gpll0_div_clk_src",
> +                       .parent_hws =3D (const struct clk_hw *[]){
> +                               &gcc_gpu_gpll0_clk_src.clkr.hw },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
>  static struct clk_branch gcc_gpu_iref_clk =3D {
>         .halt_reg =3D 0x8c010,
>         .halt_check =3D BRANCH_HALT,
> @@ -1698,6 +1730,38 @@ static struct clk_branch gcc_npu_cfg_ahb_clk =3D {
>         },
>  };
> =20
> +static struct clk_branch gcc_npu_gpll0_clk_src =3D {
> +       .halt_check =3D BRANCH_HALT_SKIP,
> +       .clkr =3D {
> +               .enable_reg =3D 0x52004,
> +               .enable_mask =3D BIT(18),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_npu_gpll0_clk_src",
> +                       .parent_hws =3D (const struct clk_hw *[]){
> +                               &gpll0.clkr.hw },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_npu_gpll0_div_clk_src =3D {
> +       .halt_check =3D BRANCH_HALT_SKIP,
> +       .clkr =3D {
> +               .enable_reg =3D 0x52004,
> +               .enable_mask =3D BIT(19),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_npu_gpll0_div_clk_src",
> +                       .parent_hws =3D (const struct clk_hw *[]){
> +                               &gcc_npu_gpll0_clk_src.clkr.hw },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
>  static struct clk_branch gcc_npu_trig_clk =3D {
>         .halt_reg =3D 0x4d00c,
>         .halt_check =3D BRANCH_VOTED,
> @@ -2812,6 +2876,42 @@ static struct clk_branch gcc_ufs_card_phy_aux_hw_c=
tl_clk =3D {
>         },
>  };
> =20
> +static struct clk_branch gcc_ufs_card_rx_symbol_0_clk =3D {
> +       .halt_check =3D BRANCH_HALT_SKIP,

Can't we fix the UFS driver to not require this anymore? This is the
fourth or fifth time I've asked for this.

> +       .clkr =3D {
> +               .enable_reg =3D 0x7501c,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_ufs_card_rx_symbol_0_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_ufs_card_rx_symbol_1_clk =3D {
> +       .halt_check =3D BRANCH_HALT_SKIP,
> +       .clkr =3D {
> +               .enable_reg =3D 0x750ac,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_ufs_card_rx_symbol_1_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_ufs_card_tx_symbol_0_clk =3D {
> +       .halt_check =3D BRANCH_HALT_SKIP,
> +       .clkr =3D {
> +               .enable_reg =3D 0x75018,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_ufs_card_tx_symbol_0_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
>  static struct clk_branch gcc_ufs_card_unipro_core_clk =3D {
>         .halt_reg =3D 0x75058,
>         .halt_check =3D BRANCH_HALT,
