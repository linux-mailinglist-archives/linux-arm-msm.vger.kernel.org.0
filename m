Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0B41E3C59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 10:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388019AbgE0IoD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 04:44:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:45112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387811AbgE0IoC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 04:44:02 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8EF3620723;
        Wed, 27 May 2020 08:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590569041;
        bh=+/NGB2sSlT/fbXh2DrGQlclwzqoCcKODEoqXcgZ+w/I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PBDJ/cQ710tqqqopy/zdRKfSSpzslqeR99wc57R/ID4DryWQmX7cxpspThsdX4XZK
         hmoouoE/6tUeVhGUfUfw/uSJiAWN7Oev/I1Uc4o3DG9nQ1JWwh52KdTqbOai547N8y
         PrHOEfwmsenKZ4XMgP5kh0cZoOi5E5TCsUZsf1bw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200524210615.17035-8-jonathan@marek.ca>
References: <20200524210615.17035-1-jonathan@marek.ca> <20200524210615.17035-8-jonathan@marek.ca>
Subject: Re: [PATCH 07/10] clk: qcom: Add graphics clock controller driver for SM8150
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Wed, 27 May 2020 01:44:00 -0700
Message-ID: <159056904079.88029.16161248455546031414@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-05-24 14:06:08)
> diff --git a/drivers/clk/qcom/gpucc-sm8150.c b/drivers/clk/qcom/gpucc-sm8=
150.c
> new file mode 100644
> index 000000000000..6e1fff0cde75
> --- /dev/null
> +++ b/drivers/clk/qcom/gpucc-sm8150.c
> @@ -0,0 +1,429 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,gpucc-sm8150.h>
[..]
> +
> +static struct clk_rcg2 gpu_cc_gmu_clk_src =3D {
> +       .cmd_rcgr =3D 0x1120,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D gpu_cc_parent_map_0,
> +       .freq_tbl =3D ftbl_gpu_cc_gmu_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gpu_cc_gmu_clk_src",
> +               .parent_names =3D gpu_cc_parent_names_0,
> +               .num_parents =3D 6,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_branch gpu_cc_ahb_clk =3D {
> +       .halt_reg =3D 0x1078,
> +       .halt_check =3D BRANCH_HALT_DELAY,
> +       .clkr =3D {
> +               .enable_reg =3D 0x1078,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gpu_cc_ahb_clk",
> +                       .flags =3D CLK_IS_CRITICAL,

Why is this CLK_IS_CRITICAL? Why not just enable the clk manually with
a register write in probe and then remove this clk from the system? We
can save some memory that way.

> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
[...]
> +
> +static struct gdsc gpu_cx_gdsc =3D {
> +       .gdscr =3D 0x106c,
> +       .gds_hw_ctrl =3D 0x1540,
> +       .pd =3D {
> +               .name =3D "gpu_cx_gdsc",
> +       },
> +       .pwrsts =3D PWRSTS_OFF_ON,
> +       .flags =3D VOTABLE,
> +};
> +
> +/* see comment in gpucc-sdm845 about this */
> +static int gx_gdsc_enable(struct generic_pm_domain *domain)
> +{
> +       /* Do nothing but give genpd the impression that we were successf=
ul */
> +       return 0;
> +}

Maybe we should export a helper from gdsc.c for this with the comment
and it named something obvious? gx_gdsc_do_nothing_enable()?

> +
> +static struct gdsc gpu_gx_gdsc =3D {
> +       .gdscr =3D 0x100c,
> +       .clamp_io_ctrl =3D 0x1508,
> +       .pd =3D {
> +               .name =3D "gpu_gx_gdsc",
> +               .power_on =3D gx_gdsc_enable,
> +       },
> +       .pwrsts =3D PWRSTS_OFF_ON,
> +       .flags =3D CLAMP_IO | AON_RESET | POLL_CFG_GDSCR,
> +};
> +
