Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19B10E73CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2019 15:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390196AbfJ1OhR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Oct 2019 10:37:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:38244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726934AbfJ1OhR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Oct 2019 10:37:17 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B64B7208C0;
        Mon, 28 Oct 2019 14:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572273435;
        bh=QLJ4Cj4VSPodXcRky8pTS+gbLyjrVxJZQ3CDH6ARyOM=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=rlagd81iaVSZv9mJE3IZ5lTRVl7B1yTcyqV+DLl/Jfilprtc+skJLFbbOJ+RFCXZX
         54pRqx7bFY9c1sgnePMByPlbCzEghwJ3T2O8yuEP/DlLKL4/5rJIQYwxYKGhTUeQIA
         QVoDX7Gr4ShTVIGAMSMg3xH30XalXgzOo/oXiATQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191024141344.7023-1-vkoul@kernel.org>
References: <20191024141344.7023-1-vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] clk: qcom: gcc: Add missing clocks in SM8150
To:     Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 28 Oct 2019 07:37:14 -0700
Message-Id: <20191028143715.B64B7208C0@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-10-24 07:13:44)
> diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> index 20877214acff..0334b2be5fca 100644
> --- a/drivers/clk/qcom/gcc-sm8150.c
> +++ b/drivers/clk/qcom/gcc-sm8150.c
> @@ -1616,6 +1616,40 @@ static struct clk_branch gcc_gpu_cfg_ahb_clk =3D {
>         },
>  };
> =20
> +/* external clocks so add BRANCH_HALT_SKIP */

Ok. The comment is sort of worthless though. Which clk is external? The
parent of this clk?

And it seems very weird that we need this one to be halt skip because
the parent isn't external and I don't know why this is marked with
CLK_SET_RATE_PARENT. Are we going to allow gpll0 to be modified? gpll0
looks to be a fixed rate PLL or something so probably we don't want the
branch to allow consumers to change the main PLL frequency and it should
be turned on before this clk is enabled.

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
> @@ -1698,6 +1732,40 @@ static struct clk_branch gcc_npu_cfg_ahb_clk =3D {
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
> @@ -2812,6 +2880,45 @@ static struct clk_branch gcc_ufs_card_phy_aux_hw_c=
tl_clk =3D {
>         },
>  };
> =20
> +/* external clocks so add BRANCH_HALT_SKIP */

The UFS ones have always been this way. My understanding is that UFS phy
is the parent clk and it's not one when the driver enables it. I think
Manu has clarified these and I still hope we can just turn them on by
default and not model them in clk framework.

> +static struct clk_branch gcc_ufs_card_rx_symbol_0_clk =3D {
> +       .halt_check =3D BRANCH_HALT_SKIP,
> +       .clkr =3D {
> +               .enable_reg =3D 0x7501c,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_ufs_card_rx_symbol_0_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
[...]
> +static struct clk_branch gcc_usb3_sec_phy_pipe_clk =3D {

Same comment for USB as for UFS.

> +       .halt_check =3D BRANCH_HALT_SKIP,
> +       .clkr =3D {
> +               .enable_reg =3D 0x10058,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_usb3_sec_phy_pipe_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
>  static struct clk_branch gcc_usb3_sec_phy_com_aux_clk =3D {
>         .halt_reg =3D 0x10054,
>         .halt_check =3D BRANCH_HALT,
