Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F91D1F4B33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 04:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbgFJCHC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 22:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgFJCHB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 22:07:01 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1728DC03E96F
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 19:07:00 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x207so408461pfc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 19:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=4glYxASgMDAadsVhEqHbsHqHBR+RRgfpDKkWe3Ja284=;
        b=E9CwDV0dsQ1ESgc/f+kUq5tFMWnniz5ZokL/K/J8ldddByEhbK4zi//zbxtMLg8j7i
         nPTT59aHjZ32x3JAkmhDiGeDYuGPTLyU36Gn8/MJDZtu32O4hDv386lE4m1vA3ysT42i
         Gwym9r9W7nMXhsi3G3HBKvrJCKbiZBcONj/68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=4glYxASgMDAadsVhEqHbsHqHBR+RRgfpDKkWe3Ja284=;
        b=qH97JzEXZu23l2GN+xYnpXUAR5ZNjQ0xRUbUor2tM5bG16RzkrW+SKGpy7X73UErfp
         xeChkWh2nxgIuAxrJA5Iki/fp5ktMUjRCSQgBhKCM/Newlk3ooZCX4tSmCkuH3aS2z7E
         nYcGHNqr7kK6OpGafhhrNZhBxXfVpQSMNJVO1PmLhsAWjPElhGKCYMahQtG5xasjJWH1
         Gi2VXF+nJbCTg6jXcNGcToyBeWpdxkzw7Vr+CE0iBN+bd6VDe++OnNDPpg7pD4/1xiUY
         SmZyNjXBRqE5ZgQO8wRHDFsTimoYlbxqZ3ZefalYyl5XLwhYusvdDF42anJasPf5b9RX
         Ptpw==
X-Gm-Message-State: AOAM530LZS7QdXEpqe3VVYrzPZatLzBT78w6Gh53ae/O2uUuuOsv5DHZ
        jQGJoSDxrkiT95WRiwsyGqJB7Q==
X-Google-Smtp-Source: ABdhPJy3gWScefF8burjTamNmwtw2Ue5huL5G18f79lzCM5NR1omTP/tmlaAyOE8sY8mmbofKOh1Bg==
X-Received: by 2002:a63:af02:: with SMTP id w2mr750995pge.116.1591754820052;
        Tue, 09 Jun 2020 19:07:00 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id d67sm11265641pfc.63.2020.06.09.19.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 19:06:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200609034623.10844-1-tanmay@codeaurora.org>
References: <20200609034623.10844-1-tanmay@codeaurora.org>
Subject: Re: [PATCH v6 4/5] drm/msm/dp: add support for DP PLL driver
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     sam@ravnborg.org, seanpaul@chromium.org,
        freedreno@lists.freedesktop.org, chandanu@codeaurora.org,
        robdclark@gmail.com, abhinavk@codeaurora.org,
        nganji@codeaurora.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>
To:     Tanmay Shah <tanmay@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Date:   Tue, 09 Jun 2020 19:06:58 -0700
Message-ID: <159175481823.242598.9387748150892951863@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Tanmay Shah (2020-06-08 20:46:23)
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp=
/dp_catalog.c
> index d02f4eb..2b982f0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -5,6 +5,7 @@
> =20
>  #define pr_fmt(fmt)    "[drm-dp] %s: " fmt, __func__
> =20
> +#include <linux/rational.h>
>  #include <linux/delay.h>
>  #include <linux/iopoll.h>
>  #include <drm/drm_dp_helper.h>
> @@ -134,59 +135,61 @@ static inline void dp_write_ahb(struct dp_catalog_p=
rivate *catalog,
>         writel(data, catalog->io->dp_controller.base + offset);
>  }
> =20
> -static inline u32 dp_read_cc(struct dp_catalog_private *catalog, u32 off=
set)
> -{
> -       return readl_relaxed(catalog->io->dp_cc_io.base + offset);
> -}
> -

Why was this added in the first place? Remove it from the place it came
in please.

>  static inline void dp_write_phy(struct dp_catalog_private *catalog,
>                                u32 offset, u32 data)
>  {
> +       offset +=3D DP_PHY_REG_OFFSET;
>         /*
>          * To make sure phy reg writes happens before any other operation,
[...]
> @@ -568,17 +574,37 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *=
dp_catalog,
>                                         bool fixed_nvid)
>  {
>         u32 pixel_m, pixel_n;
> -       u32 mvid, nvid;
> +       u32 mvid, nvid, div, pixel_div =3D 0, dispcc_input_rate;
>         u32 const nvid_fixed =3D DP_LINK_CONSTANT_N_VALUE;
>         u32 const link_rate_hbr2 =3D 540000;
>         u32 const link_rate_hbr3 =3D 810000;
> +       unsigned long den, num;
> =20
>         struct dp_catalog_private *catalog =3D container_of(dp_catalog,
>                                 struct dp_catalog_private, dp_catalog);
> =20
> -       pixel_m =3D dp_read_cc(catalog, MMSS_DP_PIXEL_M);
> -       pixel_n =3D dp_read_cc(catalog, MMSS_DP_PIXEL_N);
> -       DRM_DEBUG_DP("pixel_m=3D0x%x, pixel_n=3D0x%x\n", pixel_m, pixel_n=
);
> +       div =3D dp_read_phy(catalog, REG_DP_PHY_VCO_DIV);

Why do we need to read the phy? The pixel_div seems to match what the
clk driver is doing so presumably we can make this follow the link rate
being used vs. having to read the phy.

> +       div &=3D 0x03;
> +
> +       if (div =3D=3D 0)
> +               pixel_div =3D 6;
> +       else if (div =3D=3D 1)
> +               pixel_div =3D 2;
> +       else if (div =3D=3D 2)
> +               pixel_div =3D 4;
> +       else
> +               DRM_ERROR("Invalid pixel mux divider\n");
> +
> +       dispcc_input_rate =3D (rate * 10) / pixel_div;
> +
> +       rational_best_approximation(dispcc_input_rate, stream_rate_khz,
> +                       (unsigned long)(1 << 16) - 1,
> +                       (unsigned long)(1 << 16) - 1, &den, &num);
> +
> +       den =3D ~(den - num);
> +       den =3D den & 0xFFFF;
> +       pixel_m =3D num;
> +       pixel_n =3D den;
> =20
>         mvid =3D (pixel_m & 0xFFFF) * 5;
>         nvid =3D (0xFFFF & (~pixel_n)) + (pixel_m & 0xFFFF);
> diff --git a/drivers/gpu/drm/msm/dp/dp_pll_10nm.c b/drivers/gpu/drm/msm/d=
p/dp_pll_10nm.c
> new file mode 100644
> index 0000000..998d659
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/dp_pll_10nm.c
> @@ -0,0 +1,903 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
> + */
> +
> +/*
> + * Display Port PLL driver block diagram for branch clocks
> + *
> + *              +------------------------------+
> + *              |         DP_VCO_CLK           |
> + *              |                              |
> + *              |    +-------------------+     |
> + *              |    |   (DP PLL/VCO)    |     |
> + *              |    +---------+---------+     |
> + *              |              v               |
> + *              |   +----------+-----------+   |
> + *              |   | hsclk_divsel_clk_src |   |
> + *              |   +----------+-----------+   |
> + *              +------------------------------+
> + *                              |
> + *          +---------<---------v------------>----------+
> + *          |                                           |
> + * +--------v---------+                                 |
> + * |    dp_phy_pll    |                                 |
> + * |     link_clk     |                                 |
> + * +--------+---------+                                 |
> + *          |                                           |
> + *          |                                           |
> + *          v                                           v
> + * Input to DISPCC block                                |
> + * for link clk, crypto clk                             |
> + * and interface clock                                  |
> + *                                                      |
> + *                                                      |
> + *      +--------<------------+-----------------+---<---+
> + *      |                     |                 |
> + * +----v---------+  +--------v-----+  +--------v------+
> + * | vco_divided  |  | vco_divided  |  | vco_divided   |
> + * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
> + * |              |  |              |  |               |
> + * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
> + * +-------+------+  +-----+--------+  +--------+------+
> + *         |                 |                  |
> + *         v---->----------v-------------<------v
> + *                         |
> + *              +----------+---------+
> + *              |   dp_phy_pll_vco   |
> + *              |       div_clk      |
> + *              +---------+----------+
> + *                        |
> + *                        v
> + *              Input to DISPCC block
> + *              for DP pixel clock
> + *
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/regmap.h>
> +#include <linux/iopoll.h>

Should be a clk-provider.h include here given that this is providing
clks.

> +
> +#include "dp_hpd.h"
> +#include "dp_pll.h"
> +#include "dp_pll_private.h"
> +
> +#define NUM_PROVIDED_CLKS              2
> +
> +#define DP_LINK_CLK_SRC                        0
> +#define DP_PIXEL_CLK_SRC               1
> +
> +static struct dp_pll_db *dp_pdb;
> +
> +static const struct clk_ops dp_10nm_vco_clk_ops =3D {
> +       .recalc_rate =3D dp_vco_recalc_rate_10nm,
> +       .set_rate =3D dp_vco_set_rate_10nm,
> +       .round_rate =3D dp_vco_round_rate_10nm,
> +       .prepare =3D dp_vco_prepare_10nm,
> +       .unprepare =3D dp_vco_unprepare_10nm,
> +};
> +
> +struct dp_pll_10nm_pclksel {
> +       struct clk_hw hw;
> +
> +       /* divider params */
> +       u8 shift;
> +       u8 width;
> +       u8 flags; /* same flags as used by clk_divider struct */
> +
> +       struct dp_pll_db *pll;
> +};
> +
> +#define to_pll_10nm_pclksel(_hw) \
> +       container_of(_hw, struct dp_pll_10nm_pclksel, hw)
> +
> +static const struct clk_parent_data disp_cc_parent_data_0[] =3D {
> +       { .fw_name =3D "bi_tcxo" },
> +       { .fw_name =3D "dp_phy_pll_link_clk", .name =3D "dp_phy_pll_link_=
clk" },
> +       { .fw_name =3D "dp_phy_pll_vco_div_clk",
> +                               .name =3D "dp_phy_pll_vco_div_clk"},
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +};
> +
> +static struct dp_pll_vco_clk dp_vco_clk =3D {
> +       .min_rate =3D DP_VCO_HSCLK_RATE_1620MHZDIV1000,
> +       .max_rate =3D DP_VCO_HSCLK_RATE_8100MHZDIV1000,
> +};
> +
> +static int dp_pll_mux_set_parent_10nm(struct clk_hw *hw, u8 val)
> +{
> +       struct dp_pll_10nm_pclksel *pclksel =3D to_pll_10nm_pclksel(hw);
> +       struct dp_pll_db *dp_res =3D pclksel->pll;
> +       struct dp_io_pll *pll_io =3D &dp_res->base->pll_io;
> +       u32 auxclk_div;
> +
> +       auxclk_div =3D PLL_REG_R(pll_io->phy_base, REG_DP_PHY_VCO_DIV);
> +       auxclk_div &=3D ~0x03;
> +
> +       if (val =3D=3D 0)
> +               auxclk_div |=3D 1;
> +       else if (val =3D=3D 1)
> +               auxclk_div |=3D 2;
> +       else if (val =3D=3D 2)
> +               auxclk_div |=3D 0;
> +
> +       PLL_REG_W(pll_io->phy_base,
> +                       REG_DP_PHY_VCO_DIV, auxclk_div);
> +       DRM_DEBUG_DP("%s: mux=3D%d auxclk_div=3D%x\n", __func__, val, aux=
clk_div);
> +
> +       return 0;
> +}
> +
> +static u8 dp_pll_mux_get_parent_10nm(struct clk_hw *hw)
> +{
> +       u32 auxclk_div =3D 0;
> +       struct dp_pll_10nm_pclksel *pclksel =3D to_pll_10nm_pclksel(hw);
> +       struct dp_pll_db *dp_res =3D pclksel->pll;
> +       struct dp_io_pll *pll_io =3D &dp_res->base->pll_io;
> +       u8 val =3D 0;
> +
> +       auxclk_div =3D PLL_REG_R(pll_io->phy_base, REG_DP_PHY_VCO_DIV);
> +       auxclk_div &=3D 0x03;
> +
> +       if (auxclk_div =3D=3D 1) /* Default divider */
> +               val =3D 0;
> +       else if (auxclk_div =3D=3D 2)
> +               val =3D 1;
> +       else if (auxclk_div =3D=3D 0)
> +               val =3D 2;
> +
> +       DRM_DEBUG_DP("%s: auxclk_div=3D%d, val=3D%d\n", __func__, auxclk_=
div, val);
> +
> +       return val;
> +}
> +
> +static int dp_pll_clk_mux_determine_rate(struct clk_hw *hw,
> +                                    struct clk_rate_request *req)
> +{
> +       unsigned long rate =3D 0;
> +       int ret =3D 0;
> +
> +       rate =3D clk_get_rate(hw->clk);
> +
> +       if (rate <=3D 0) {
> +               DRM_ERROR("Rate is not set properly\n");
> +               return -EINVAL;
> +       }
> +
> +       req->rate =3D rate;
> +
> +       DRM_DEBUG_DP("%s: rate=3D%ld\n", __func__, req->rate);
> +       /* Set the new parent of mux if there is a new valid parent */
> +       if (hw->clk && req->best_parent_hw->clk) {
> +               ret =3D clk_set_parent(hw->clk, req->best_parent_hw->clk);

Why do we need to call clk consumer APIs from the clk provider ops? This
is pretty confusing what's going on here.

> +               if (ret) {
> +                       DRM_ERROR("%s: clk_set_parent failed: ret=3D%d\n",
> +                                       __func__, ret);
> +                       return ret;
> +               }
> +       }
> +       return 0;
> +}
> +
> +static unsigned long dp_pll_mux_recalc_rate(struct clk_hw *hw,
> +                                       unsigned long parent_rate)
> +{
> +       struct clk_hw *div_clk_hw =3D NULL, *vco_clk_hw =3D NULL;
> +       struct dp_pll_vco_clk *vco;
> +
> +       div_clk_hw =3D clk_hw_get_parent(hw);
> +       if (!div_clk_hw)
> +               return 0;
> +
> +       vco_clk_hw =3D clk_hw_get_parent(div_clk_hw);
> +       if (!vco_clk_hw)
> +               return 0;
> +
> +       vco =3D to_dp_vco_hw(vco_clk_hw);
> +       if (!vco)
> +               return 0;
> +
> +       if (vco->rate =3D=3D DP_VCO_HSCLK_RATE_8100MHZDIV1000)
> +               return (vco->rate / 6);
> +       else if (vco->rate =3D=3D DP_VCO_HSCLK_RATE_5400MHZDIV1000)
> +               return (vco->rate / 4);
> +       else
> +               return (vco->rate / 2);
> +}
> +
> +static int dp_pll_10nm_get_provider(struct msm_dp_pll *pll,
> +                                    struct clk **link_clk_provider,
> +                                    struct clk **pixel_clk_provider)
> +{
> +       struct clk_hw_onecell_data *hw_data =3D pll->hw_data;
> +
> +       if (link_clk_provider)
> +               *link_clk_provider =3D hw_data->hws[DP_LINK_CLK_SRC]->clk;
> +       if (pixel_clk_provider)
> +               *pixel_clk_provider =3D hw_data->hws[DP_PIXEL_CLK_SRC]->c=
lk;
> +
> +       return 0;
> +}
> +
> +static const struct clk_ops dp_10nm_pclksel_clk_ops =3D {
> +       .get_parent =3D dp_pll_mux_get_parent_10nm,
> +       .set_parent =3D dp_pll_mux_set_parent_10nm,
> +       .recalc_rate =3D dp_pll_mux_recalc_rate,
> +       .determine_rate =3D dp_pll_clk_mux_determine_rate,
> +};
> +
> +static struct clk_hw *dp_pll_10nm_pixel_clk_sel(struct dp_pll_db *pll_10=
nm)
> +{
> +       struct device *dev =3D &pll_10nm->pdev->dev;
> +       struct dp_pll_10nm_pclksel *pll_pclksel;
> +       struct clk_init_data pclksel_init =3D {
> +               .parent_data =3D disp_cc_parent_data_0,
> +               .num_parents =3D 3,
> +               .name =3D "dp_phy_pll_vco_div_clk",

So the dp_phy_pll_vco_div_clk has a potential parent that is
dp_phy_pll_vco_div_clk. Huh?

> +               .ops =3D &dp_10nm_pclksel_clk_ops,
> +       };
> +       int ret;
> +
> +       pll_pclksel =3D devm_kzalloc(dev, sizeof(*pll_pclksel), GFP_KERNE=
L);
> +       if (!pll_pclksel)
> +               return ERR_PTR(-ENOMEM);
> +
> +       pll_pclksel->pll =3D pll_10nm;
> +       pll_pclksel->shift =3D 0;
> +       pll_pclksel->width =3D 4;
> +       pll_pclksel->flags =3D CLK_DIVIDER_ONE_BASED;

Is this flag used?

> +       pll_pclksel->hw.init =3D &pclksel_init;
> +
> +       ret =3D clk_hw_register(dev, &pll_pclksel->hw);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return &pll_pclksel->hw;
> +}
> +
> +static int dp_pll_10nm_register(struct dp_pll_db *pll_10nm)
> +{
> +       struct clk_hw_onecell_data *hw_data;
> +       int ret;
> +       struct clk_hw *hw;
> +
> +       struct msm_dp_pll *pll =3D pll_10nm->base;
> +       struct device *dev =3D &pll_10nm->pdev->dev;
> +       struct clk_hw **hws =3D pll_10nm->hws;
> +       int num =3D 0;
> +       struct clk_init_data vco_init =3D {
> +               .parent_data =3D &(const struct clk_parent_data){
> +                               .fw_name =3D "bi_tcxo",
> +               },
> +               .num_parents =3D 1,
> +               .name =3D "dp_vco_clk",
> +               .ops =3D &dp_10nm_vco_clk_ops,
> +       };

I thought the plan was to not have a vco clk? Just expose the two clks
for the link and the vco divider. Furthermore, drop the divider
"parents" and implement a single clk that programs the right divider
value for the various link rates chosen.

> +
> +       DRM_DEBUG_DP("DP->id =3D %d", pll_10nm->id);
> +
> +       hw_data =3D devm_kzalloc(dev, sizeof(*hw_data) +
> +                              NUM_PROVIDED_CLKS * sizeof(struct clk_hw *=
),
> +                              GFP_KERNEL);
> +       if (!hw_data)
> +               return -ENOMEM;
> +
> +       dp_vco_clk.hw.init =3D &vco_init;
> +       ret =3D clk_hw_register(dev, &dp_vco_clk.hw);
> +       if (ret)
> +               return ret;
> +       hws[num++] =3D &dp_vco_clk.hw;
> +
> +       hw =3D clk_hw_register_fixed_factor(dev, "dp_phy_pll_link_clk",
> +                               "dp_vco_clk", CLK_SET_RATE_PARENT, 1, 10);
> +
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       hws[num++] =3D hw;
> +       hw_data->hws[DP_LINK_CLK_SRC] =3D hw;
> +
> +       hw =3D clk_hw_register_fixed_factor(dev, "dp_vco_divsel_two_clk_s=
rc",
> +                                       "dp_vco_clk",  0, 1, 2);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       hws[num++] =3D hw;
> +
> +       hw =3D clk_hw_register_fixed_factor(dev, "dp_vco_divsel_four_clk_=
src",
> +                                        "dp_vco_clk", 0, 1, 4);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       hws[num++] =3D hw;
> +
> +       hw =3D clk_hw_register_fixed_factor(dev, "dp_vco_divsel_six_clk_s=
rc",
> +                                        "dp_vco_clk", 0, 1, 6);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       hws[num++] =3D hw;
> +
> +       hw =3D dp_pll_10nm_pixel_clk_sel(pll_10nm);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +
> +       hws[num++] =3D hw;
> +       hw_data->hws[DP_PIXEL_CLK_SRC] =3D hw;
> +
> +       pll_10nm->num_hws =3D num;
> +
> +       hw_data->num =3D NUM_PROVIDED_CLKS;
> +       pll->hw_data =3D hw_data;
> +
> +       ret =3D of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_ge=
t,
> +                                    pll->hw_data);
> +       if (ret) {
> +               DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n=
",
> +                               ret);
> +               return ret;
> +       }
> +
> +       return ret;
> +}
> +
> +int msm_dp_pll_10nm_init(struct msm_dp_pll *pll, int id)
> +{
> +       struct dp_pll_db *dp_10nm_pll;
> +       struct platform_device *pdev =3D pll->pdev;
> +       int ret;
> +
> +       dp_10nm_pll =3D devm_kzalloc(&pdev->dev,
> +                                       sizeof(*dp_10nm_pll), GFP_KERNEL);
> +       if (!dp_10nm_pll)
> +               return -ENOMEM;
> +
> +       DRM_DEBUG_DP("DP PLL%d", id);
> +
> +       dp_10nm_pll->base =3D pll;
> +       dp_10nm_pll->pdev =3D pll->pdev;
> +       dp_10nm_pll->id =3D id;
> +       dp_pdb =3D dp_10nm_pll;
> +       pll->priv =3D (void *)dp_10nm_pll;
> +       dp_vco_clk.priv =3D pll;
> +
> +       ret =3D of_property_read_u32(pdev->dev.of_node, "cell-index",
> +                               &dp_10nm_pll->index);
> +       if (ret) {
> +               DRM_ERROR("Unable to get the cell-index ret=3D%d\n", ret);
> +               dp_10nm_pll->index =3D 0;
> +       }

Is the cell-index used for anything?

> +
> +       ret =3D dp_pll_10nm_register(dp_10nm_pll);
> +       if (ret) {
> +               DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n",=
 ret);
> +               return ret;
> +       }
> +
> +       pll->get_provider =3D dp_pll_10nm_get_provider;
> +
> +       return ret;
> +}
