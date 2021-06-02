Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2F563982A1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 09:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbhFBHIa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 03:08:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:47896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229753AbhFBHI2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 03:08:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B6E760FF3;
        Wed,  2 Jun 2021 07:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622617606;
        bh=lquQN/jlE/0WNJ9FMxm7Amdcp89k6AsKIIqlAAppnSM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=d04Gz8cosorzMIhGRraoB+oDV6DOT+lbEY6Fejjl/rPsqylApRBOQPYuMpfoxYjpw
         nIovEktjAp6TjrOgS5+X2lv8DcXLqaBwTQwNRZlF10OR2vbPIcAIjIesDuuyXt3Bto
         qMg5wOxCxGlxiLCyGXTKAjkhqXGpqhDg2Zs1T2jL37oPzSb6QKxTfdr4gaTbVw9qOZ
         hlZ9tXFb2txJV0RvX0XczhUX43C2Q7/UI01zpcAYinS0zGdRF1dI+/OauKdo3K9/Gg
         TX+rWDpMJJ+7lMprY9tGhIGLp7F2tn8b1kzuGm/gLyhVkR4Blhe7sOGyw66nzIkc7Z
         TaSr3umLuJ1Mg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1619519590-3019-7-git-send-email-tdas@codeaurora.org>
References: <1619519590-3019-1-git-send-email-tdas@codeaurora.org> <1619519590-3019-7-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v2 6/6] clk: qcom: Add video clock controller driver for SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Wed, 02 Jun 2021 00:06:44 -0700
Message-ID: <162261760498.4130789.12499425999582046146@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-04-27 03:33:10)
> diff --git a/drivers/clk/qcom/videocc-sc7280.c b/drivers/clk/qcom/videocc=
-sc7280.c
> new file mode 100644
> index 0000000..3387154
> --- /dev/null
> +++ b/drivers/clk/qcom/videocc-sc7280.c
> @@ -0,0 +1,372 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,videocc-sc7280.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-rcg.h"
> +#include "common.h"
> +#include "reset.h"
> +#include "gdsc.h"
> +
> +enum {
> +       P_BI_TCXO,
> +       P_SLEEP_CLK,
> +       P_VIDEO_PLL0_OUT_EVEN,
> +};
> +
> +static struct pll_vco lucid_vco[] =3D {

const?

> +       { 249600000, 2000000000, 0 },
> +};
> +
[...]
> +
> +static const struct parent_map video_cc_parent_map_0[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_VIDEO_PLL0_OUT_EVEN, 3 },
> +};
> +
> +static const struct clk_parent_data video_cc_parent_data_0[] =3D {
> +       { .fw_name =3D "bi_tcxo" },
> +       { .hw =3D &video_pll0.clkr.hw },
> +};
> +
> +static const struct parent_map video_cc_parent_map_1[] =3D {
> +       { P_SLEEP_CLK, 0 },
> +};
> +
> +static const struct clk_parent_data video_cc_parent_data_1[] =3D {
> +       { .fw_name =3D "sleep_clk" },
> +};
> +
> +static const struct parent_map video_cc_parent_map_2[] =3D {
> +       { P_BI_TCXO, 0 },
> +};
> +
> +static const struct clk_parent_data video_cc_parent_data_2_ao[] =3D {
> +       { .fw_name =3D "bi_tcxo_ao" },

This is new. Why would we want the video clk parent state to turn off
when the CPU is off? Does the video engine keep XO enabled for itself?
Can you please add some comment into the code explaining why it's ok to
use the ao clk here?

> +};
> +
> +static const struct freq_tbl ftbl_video_cc_iris_clk_src[] =3D {
> +       F(133333333, P_VIDEO_PLL0_OUT_EVEN, 3, 0, 0),
> +       F(240000000, P_VIDEO_PLL0_OUT_EVEN, 2, 0, 0),
> +       F(335000000, P_VIDEO_PLL0_OUT_EVEN, 2, 0, 0),
> +       F(424000000, P_VIDEO_PLL0_OUT_EVEN, 2, 0, 0),
> +       F(460000000, P_VIDEO_PLL0_OUT_EVEN, 2, 0, 0),
> +       { }
> +};
[...]
> +
> +static struct clk_branch video_cc_xo_clk =3D {
> +       .halt_reg =3D 0x7018,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x7018,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "video_cc_xo_clk",
> +                       .parent_hws =3D (const struct clk_hw*[]){
> +                               &video_cc_xo_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,

Please add a comment why it is critical.

> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
