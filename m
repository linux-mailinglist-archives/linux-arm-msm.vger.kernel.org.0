Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFAE6398168
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 08:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbhFBGv5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 02:51:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:37934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229880AbhFBGvz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 02:51:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BBAE61242;
        Wed,  2 Jun 2021 06:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622616612;
        bh=VemZ7psr2OhQF+zfrudEtorjnDEKvdpdz5/6ajamHs0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BC0U1s0/XVl/CrX92nOCkvqME2Dxd+cATbgnHRbiSFA7BdFgOwTJcMcLGGuoKOHPB
         nta+YwGhzJBd+RhXtzUpoPun7NK8cewqRJVEVuHHeRWLaz9G7LspEAS31ivtLYUeN4
         /4Bj0FFa65+T6/rMVs1HHY6q5bBhJyVCbhB+SuyWjkS/p3O+S/j1OaUINV9rdrFhDl
         rLUNxGpELJLjPnAlBapJqoOHwZpk0WTD0Ry9axyr9evUFT1pKNqxxT9mRtGXUvEW6V
         G9+40IJCJjLCZq72xu70DngBNwJCuxyMI2JuM349M53xnTgsO+ok0GJ4tjezwUowfs
         S4W6vpCNbFw7w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210313020310.386152-2-konrad.dybcio@somainline.org>
References: <20210313020310.386152-1-konrad.dybcio@somainline.org> <20210313020310.386152-2-konrad.dybcio@somainline.org>
Subject: Re: [PATCH 2/2] clk: qcom: Add MDM9607 GCC driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Tue, 01 Jun 2021 23:50:11 -0700
Message-ID: <162261661130.4130789.14150099315161377490@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-03-12 18:03:08)
> Add Global Clock Controller (GCC) support for MDM9607 SoC.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next

>  drivers/clk/qcom/Kconfig       |    7 +
>  drivers/clk/qcom/Makefile      |    1 +
>  drivers/clk/qcom/gcc-mdm9607.c | 1656 ++++++++++++++++++++++++++++++++
>  3 files changed, 1664 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-mdm9607.c
>=20
> diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm960=
7.c
> new file mode 100644
> index 000000000000..a4b3cff7e98f
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-mdm9607.c
> @@ -0,0 +1,1656 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/clk.h>

I dropped this.

> +#include <linux/clk-provider.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +
> +#include <dt-bindings/clock/qcom,gcc-mdm9607.h>
> +
> +#include "common.h"
> +#include "clk-regmap.h"
> +#include "clk-alpha-pll.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-branch.h"
> +#include "reset.h"
> +#include "gdsc.h"
> +
[...]
> +
> +static const struct freq_tbl ftbl_pcnoc_bfdcd_clk_src[] =3D {
> +       F(19200000, P_XO, 1, 0, 0),
> +       F(50000000, P_GPLL0, 16, 0, 0),
> +       F(100000000, P_GPLL0, 8, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 pcnoc_bfdcd_clk_src =3D {
> +       .cmd_rcgr =3D 0x27000,
> +       .freq_tbl =3D ftbl_pcnoc_bfdcd_clk_src,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_xo_gpll0_bimc_map,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "pcnoc_bfdcd_clk_src",
> +               .parent_data =3D gcc_xo_gpll0_bimc,
> +               .num_parents =3D ARRAY_SIZE(gcc_xo_gpll0_bimc),
> +               .ops =3D &clk_rcg2_ops,
> +               .flags =3D CLK_IS_CRITICAL,

Is this how it is downstream? Because it looks like this will mean that
xo shutdown can never be achieved.

> +       },
> +};
> +
