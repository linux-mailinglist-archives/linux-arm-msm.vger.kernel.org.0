Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4F71B88C6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2020 21:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgDYTKm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Apr 2020 15:10:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:58212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726386AbgDYTKm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Apr 2020 15:10:42 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F25F92072B;
        Sat, 25 Apr 2020 19:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587841842;
        bh=qCzK81o9S1FvWHH3Re7Q5eO5cCxmRBtEqvPS2rVjoZk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=xkzm+y6yqXjR3PWNmT/aaBECsOFQOmnjcQlOIjPG1tznWghzKpNkUqqjrl06lfdqW
         UEDyrPCUPgzuGQkozCi9qi94uq7RsYns2BFo/c0ZMwkKeEQKATlMH9uq7ak0PyY4lE
         mCiF7QRmyHfcDdK4rJnpNS85Ybj/YWi6gQo7DKNg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200424044311.2155917-1-vkoul@kernel.org>
References: <20200424044311.2155917-1-vkoul@kernel.org>
Subject: Re: [PATCH 1/2] clk: qcom: gcc: Add GPU and NPU clocks for SM8150
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>
Date:   Sat, 25 Apr 2020 12:10:41 -0700
Message-ID: <158784184123.117437.7321952768664025415@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2020-04-23 21:43:10)
> Add the GPU and NPU clocks for SM8150. They were missed in earlier
> addition of clock driver.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Fixes tag? That way backporters know they're missing this.

> ---
>  drivers/clk/qcom/gcc-sm8150.c | 72 +++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>=20
> diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> index ef98fdc51755..5c3dc34c955e 100644
> --- a/drivers/clk/qcom/gcc-sm8150.c
> +++ b/drivers/clk/qcom/gcc-sm8150.c
> @@ -1617,6 +1617,40 @@ static struct clk_branch gcc_gpu_cfg_ahb_clk =3D {
>         },
>  };
> =20
> +/* external clocks so add BRANCH_HALT_SKIP */
> +static struct clk_branch gcc_gpu_gpll0_clk_src =3D {
> +       .halt_check =3D BRANCH_HALT_SKIP,
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
> +/* these are external clocks so add BRANCH_HALT_SKIP */
> +static struct clk_branch gcc_gpu_gpll0_div_clk_src =3D {
> +       .halt_check =3D BRANCH_HALT_SKIP,
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
> @@ -1699,6 +1733,40 @@ static struct clk_branch gcc_npu_cfg_ahb_clk =3D {
>         },
>  };
> =20
> +/* external clocks so add BRANCH_HALT_SKIP */
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
> +/* external clocks so add BRANCH_HALT_SKIP */

None of these look external. The parents are all inside this driver. Why
are we skipping the halt check?

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
