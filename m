Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E17E2748AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 21:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgIVTBB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 15:01:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:40708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726583AbgIVTBB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 15:01:01 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AD5172311C;
        Tue, 22 Sep 2020 19:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600801260;
        bh=3E9I3vOeFfrmcIyp2JeQvFpLp5w8HcpM+KPeNbVzjug=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=yp5t55s5wNf4u0IPslYMoXac9S33spqjj6EH8xqOPU+PgiNBSnAeeg0yT4zj+wUen
         fqbBwBwjvup1+LQyB6BHu8eDby/i0MHyiSRaWK/sYDuH7Hb6drUAwzhXkY+UbGYfqu
         p7YX5BskFlLgkBPk5a4M2yl4WxFE4zDn6b7wFWq8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200911153412.21672-8-jonathan@marek.ca>
References: <20200911153412.21672-1-jonathan@marek.ca> <20200911153412.21672-8-jonathan@marek.ca>
Subject: Re: [PATCH v3 7/7] clk: qcom: Add display clock controller driver for SM8250
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Tue, 22 Sep 2020 12:00:59 -0700
Message-ID: <160080125949.310579.17354323673790889544@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-09-11 08:34:07)
> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-s=
m8250.c
> new file mode 100644
> index 000000000000..7c0f384a3a42
> --- /dev/null
> +++ b/drivers/clk/qcom/dispcc-sm8250.c
> @@ -0,0 +1,1100 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> + */
> +
[...]
> +
> +static const struct clk_parent_data disp_cc_parent_data_6[] =3D {
> +       { .fw_name =3D "bi_tcxo" },
> +       { .fw_name =3D "dsi0_phy_pll_out_dsiclk" },
> +       { .fw_name =3D "dsi1_phy_pll_out_dsiclk" },

Can we remove clk postfix on these clk names?

> +};
> +
> +static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] =3D {
> +       F(19200000, P_BI_TCXO, 1, 0, 0),
> +       F(37500000, P_DISP_CC_PLL1_OUT_MAIN, 16, 0, 0),
> +       F(75000000, P_DISP_CC_PLL1_OUT_MAIN, 8, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_ahb_clk_src =3D {
> +       .cmd_rcgr =3D 0x22bc,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_3,
> +       .freq_tbl =3D ftbl_disp_cc_mdss_ahb_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_ahb_clk_src",
> +               .parent_data =3D disp_cc_parent_data_3,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_3),
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_shared_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_disp_cc_mdss_byte0_clk_src[] =3D {
> +       F(19200000, P_BI_TCXO, 1, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_byte0_clk_src =3D {
> +       .cmd_rcgr =3D 0x2110,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_2,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_byte0_clk_src",
> +               .parent_data =3D disp_cc_parent_data_2,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_2),
> +               .flags =3D CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,

Why do we need CLK_GET_RATE_NOCACHE? Please remove it.

> +               .ops =3D &clk_byte2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_byte1_clk_src =3D {
> +       .cmd_rcgr =3D 0x212c,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_2,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_byte1_clk_src",
> +               .parent_data =3D disp_cc_parent_data_2,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_2),
> +               .flags =3D CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> +               .ops =3D &clk_byte2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_dp_aux1_clk_src =3D {
> +       .cmd_rcgr =3D 0x2240,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_1,
> +       .freq_tbl =3D ftbl_disp_cc_mdss_byte0_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_dp_aux1_clk_src",
> +               .parent_data =3D disp_cc_parent_data_1,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_1),
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src =3D {
> +       .cmd_rcgr =3D 0x21dc,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_1,
> +       .freq_tbl =3D ftbl_disp_cc_mdss_byte0_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_dp_aux_clk_src",
> +               .parent_data =3D disp_cc_parent_data_1,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_1),
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_disp_cc_mdss_dp_link1_clk_src[] =3D {
> +       F(162000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> +       F(270000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> +       F(540000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> +       F(810000000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_dp_link1_clk_src =3D {
> +       .cmd_rcgr =3D 0x220c,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_0,
> +       .freq_tbl =3D ftbl_disp_cc_mdss_dp_link1_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_dp_link1_clk_src",
> +               .parent_data =3D disp_cc_parent_data_0,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_0),
> +               .flags =3D CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src =3D {
> +       .cmd_rcgr =3D 0x2178,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_0,
> +       .freq_tbl =3D ftbl_disp_cc_mdss_dp_link1_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_dp_link_clk_src",
> +               .parent_data =3D disp_cc_parent_data_0,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_0),
> +               .flags =3D CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_dp_pixel1_clk_src =3D {
> +       .cmd_rcgr =3D 0x21c4,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_0,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_dp_pixel1_clk_src",
> +               .parent_data =3D disp_cc_parent_data_0,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_0),
> +               .flags =3D CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> +               .ops =3D &clk_dp_ops,

This is affected by the patch I just applied 355a7d754b92 ("clk: qcom:
dispcc: Update DP clk ops for phy design"). Please resend.

> +       },
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_dp_pixel2_clk_src =3D {
> +       .cmd_rcgr =3D 0x21f4,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_0,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_dp_pixel2_clk_src",
> +               .parent_data =3D disp_cc_parent_data_0,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_0),
> +               .flags =3D CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> +               .ops =3D &clk_dp_ops,
> +       },
> +};
> +
