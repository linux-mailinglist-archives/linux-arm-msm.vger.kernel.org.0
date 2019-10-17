Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17E29DB94C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2019 23:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406155AbfJQVuY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Oct 2019 17:50:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:44128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391375AbfJQVuY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Oct 2019 17:50:24 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2BFEC20872;
        Thu, 17 Oct 2019 21:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571349023;
        bh=TvWJf8lZHu/8E1n4K/La/6h4GBFRf5lBb0SElBcOrC8=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=PeV7ZytPF7Dv1Benft1zIJ35UqUm2s+ymQy9EIns2QiQlPT4YCX/s8kxNI+ctXNSz
         OhH/SV5QC/IGCkz1AdoY7cGAIm1RLdvUoeb4xMtf2iqmAcBBmt2l6mAjoh5EuGfIOj
         tcUV98ZuLSjTiveTw52giy5JkzYB/uWU09sAXaO4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191002011640.36624-1-jeffrey.l.hugo@gmail.com>
References: <20191002011555.36571-1-jeffrey.l.hugo@gmail.com> <20191002011640.36624-1-jeffrey.l.hugo@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, mturquette@baylibre.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v4 1/2] clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver
User-Agent: alot/0.8.1
Date:   Thu, 17 Oct 2019 14:50:22 -0700
Message-Id: <20191017215023.2BFEC20872@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-10-01 18:16:40)
> diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-ms=
m8998.c
> new file mode 100644
> index 000000000000..f0ccb4963885
> --- /dev/null
> +++ b/drivers/clk/qcom/gpucc-msm8998.c
> @@ -0,0 +1,346 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019, Jeffrey Hugo
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/clk-provider.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +#include <linux/clk.h>

Drop this include please.

> +
> +
> +static struct clk_rcg2 rbcpr_clk_src =3D {
> +       .cmd_rcgr =3D 0x1030,
> +       .hid_width =3D 5,
> +       .parent_map =3D gpu_xo_gpll0_map,
> +       .freq_tbl =3D ftbl_rbcpr_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "rbcpr_clk_src",
> +               .parent_data =3D gpu_xo_gpll0,
> +               .num_parents =3D 2,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_gfx3d_clk_src[] =3D {
> +       F(180000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> +       F(257000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> +       F(342000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> +       F(414000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> +       F(515000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> +       F(596000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> +       F(670000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> +       F(710000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> +       { }

I guess this one doesn't do PLL ping pong? Instead we just reprogram the
PLL all the time? Can we have rcg2 clk ops that set the rate on the
parent to be exactly twice as much as the incoming frequency? I thought
we already had this support in the code. Indeed, it is part of
_freq_tbl_determine_rate() in clk-rcg.c, but not yet implemented in the
same function name in clk-rcg2.c! Can you implement it? That way we
don't need this long frequency table, just this weird one where it looks
like:

	{ .src =3D P_GPUPLL0_OUT_EVEN, .pre_div =3D 3 }
	{ }

And then some more logic in the rcg2 ops to allow this possibility for a
frequency table when CLK_SET_RATE_PARENT is set.

> +};
> +
> +static struct clk_rcg2 gfx3d_clk_src =3D {
> +       .cmd_rcgr =3D 0x1070,
> +       .hid_width =3D 5,
> +       .parent_map =3D gpu_xo_gpupll0_map,
> +       .freq_tbl =3D ftbl_gfx3d_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gfx3d_clk_src",
> +               .parent_data =3D gpu_xo_gpupll0,
> +               .num_parents =3D 2,
> +               .ops =3D &clk_rcg2_ops,
> +               .flags =3D CLK_OPS_PARENT_ENABLE,

Needs CLK_SET_RATE_PARENT presumably?

> +       },
> +};
> +
> +static const struct freq_tbl ftbl_rbbmtimer_clk_src[] =3D {
> +       F(19200000, P_XO, 1, 0, 0),
> +       { }
> +};
> +
[...]
> +
> +static const struct qcom_cc_desc gpucc_msm8998_desc =3D {
> +       .config =3D &gpucc_msm8998_regmap_config,
> +       .clks =3D gpucc_msm8998_clocks,
> +       .num_clks =3D ARRAY_SIZE(gpucc_msm8998_clocks),
> +       .resets =3D gpucc_msm8998_resets,
> +       .num_resets =3D ARRAY_SIZE(gpucc_msm8998_resets),
> +       .gdscs =3D gpucc_msm8998_gdscs,
> +       .num_gdscs =3D ARRAY_SIZE(gpucc_msm8998_gdscs),
> +};
> +
> +static const struct of_device_id gpucc_msm8998_match_table[] =3D {
> +       { .compatible =3D "qcom,gpucc-msm8998" },

The compatible is different. In the merged binding it is
qcom,msm8998-gpucc. Either fix this or fix the binding please.

> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, gpucc_msm8998_match_table);
> +
