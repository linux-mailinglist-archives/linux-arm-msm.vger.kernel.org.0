Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB012F3D4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 01:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393300AbhALVgO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 16:36:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:33254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436603AbhALUFY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 15:05:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B16E22202;
        Tue, 12 Jan 2021 20:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610481882;
        bh=1o0zWRYsMorIJrlcWqTCOm9k7CjaC5powyIbGNDUSIc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AnopuI6J0LhWnmI8L1bEZ8ia+Vw3oUmaBznZXvhyfhSdtV/illGVxvcbfbO/kVOgo
         +RcjCCvUvwIR6FB7QIDXbLzcq0NhSjk1oWj18FDYYqaucHmEEhG3TiJTBXaYYffvn7
         AhThGRDDw35XMKzaTLdDYEd+8XJOiJuoJPKX3XgOr6po3ZKMIHFYosD8wwPAo1p6xk
         Y8o5SwxOWvj7GUtYrJm3X0wdLbHzJ1EEnwFk+MxiPhiXUYx6ricL8n1zle8Qivz+p9
         QN6qdpgPNThI/vaHSjIvm+knus3qOCHuRrKM/y5WXMKWp+IIbrbG+VPoDz3LpzrKIS
         hQELyJbH1UI6g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1608058114-29025-3-git-send-email-tdas@codeaurora.org>
References: <1608058114-29025-1-git-send-email-tdas@codeaurora.org> <1608058114-29025-3-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 2/2] clk: qcom: Add Global Clock controller (GCC) driver for SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 12 Jan 2021 12:04:41 -0800
Message-ID: <161048188125.3661239.13161942092910464158@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-12-15 10:48:34)
> diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
> new file mode 100644
> index 0000000..74a3151
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sc7280.c
> @@ -0,0 +1,3361 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,gcc-sc7280.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"
> +
[...]
> +static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk_src[] =3D {
> +       F(144000, P_BI_TCXO, 16, 3, 25),
> +       F(400000, P_BI_TCXO, 12, 1, 4),
> +       F(20000000, P_GCC_GPLL0_OUT_EVEN, 5, 1, 3),
> +       F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
> +       F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
> +       F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
> +       F(192000000, P_GCC_GPLL10_OUT_MAIN, 2, 0, 0),
> +       F(384000000, P_GCC_GPLL10_OUT_MAIN, 1, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 gcc_sdcc1_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0x7500c,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_gcc_sdcc1_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_sdcc1_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_8),
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,

This needs to use floor clk ops?

> +       },
> +};
> +
> +static const struct freq_tbl ftbl_gcc_sdcc1_ice_core_clk_src[] =3D {
> +       F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
> +       F(150000000, P_GCC_GPLL0_OUT_EVEN, 2, 0, 0),
> +       F(300000000, P_GCC_GPLL0_OUT_EVEN, 1, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src =3D {
> +       .cmd_rcgr =3D 0x7502c,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_1,
> +       .freq_tbl =3D ftbl_gcc_sdcc1_ice_core_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_sdcc1_ice_core_clk_src",
> +               .parent_data =3D gcc_parent_data_1,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_1),
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,

Same.

> +       },
> +};
> +
> +static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] =3D {
> +       F(400000, P_BI_TCXO, 12, 1, 4),
> +       F(19200000, P_BI_TCXO, 1, 0, 0),
> +       F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
> +       F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
> +       F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
> +       F(202000000, P_GCC_GPLL9_OUT_MAIN, 4, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 gcc_sdcc2_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0x1400c,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_9,
> +       .freq_tbl =3D ftbl_gcc_sdcc2_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_sdcc2_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_9,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_9),
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,

Same.

> +       },
> +};
> +
> +static const struct freq_tbl ftbl_gcc_sdcc4_apps_clk_src[] =3D {
> +       F(400000, P_BI_TCXO, 12, 1, 4),
> +       F(19200000, P_BI_TCXO, 1, 0, 0),
> +       F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
> +       F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
> +       F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 gcc_sdcc4_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0x1600c,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_1,
> +       .freq_tbl =3D ftbl_gcc_sdcc4_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gcc_sdcc4_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_1,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_1),
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,

Same.

> +       },
> +};
> +
[...]
> +static struct clk_branch gcc_cpuss_ahb_clk =3D {
> +       .halt_reg =3D 0x48000,
> +       .halt_check =3D BRANCH_HALT_VOTED,
> +       .hwcg_reg =3D 0x48000,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x52000,
> +               .enable_mask =3D BIT(21),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_cpuss_ahb_clk",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .hw =3D &gcc_cpuss_ahb_postdiv_clk_src.cl=
kr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,

Why is it critical? Please add a comment like sc7180.

> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
