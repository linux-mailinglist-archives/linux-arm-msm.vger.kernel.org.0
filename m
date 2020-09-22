Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC4D27487A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 20:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbgIVSqn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 14:46:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:45006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726573AbgIVSqn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 14:46:43 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6DCC520715;
        Tue, 22 Sep 2020 18:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600800402;
        bh=/EPp8Eyd8DyfuPNncV9qHeoV1jlxMhy753ljerLLf+E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KSzieesIWpsfTrelXrNEUojdz2wlSgoYYYUuww2Pi71Vi7s+QfwTJtQnfKMwL+OMX
         y0aLDRWwvoOFv/PGTwWcRJtHZqSzFnBvJs47eXxwdIQk+V0MVnQvPdSm4U7h7+ANie
         z1FVUjwF+iip/1DA+02GvoClfAdNOGIfr+1yppqw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200904030958.13325-6-jonathan@marek.ca>
References: <20200904030958.13325-1-jonathan@marek.ca> <20200904030958.13325-6-jonathan@marek.ca>
Subject: Re: [PATCH v2 5/5] clk: qcom: add video clock controller driver for SM8250
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Tue, 22 Sep 2020 11:46:41 -0700
Message-ID: <160080040123.310579.8471841951357841843@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-09-03 20:09:54)
> Add support for the video clock controller found on SM8250 based devices.
>=20
> Derived from the downstream driver.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/clk/qcom/Kconfig          |   9 +
>  drivers/clk/qcom/Makefile         |   1 +
>  drivers/clk/qcom/videocc-sm8250.c | 518 ++++++++++++++++++++++++++++++
>  3 files changed, 528 insertions(+)
>  create mode 100644 drivers/clk/qcom/videocc-sm8250.c
>=20
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 40d7ee9886c9..95efa38211d5 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -453,6 +453,15 @@ config SM_VIDEOCC_8150
>           Say Y if you want to support video devices and functionality su=
ch as
>           video encode and decode.
> =20
> +config SM_VIDEOCC_8250
> +       tristate "SM8250 Video Clock Controller"
> +       select SDM_GCC_8250
> +       select QCOM_GDSC
> +       help
> +         Support for the video clock controller on SM8250 devices.
> +         Say Y if you want to support video devices and functionality su=
ch as
> +         video encode and decode.
> +
>  config SPMI_PMIC_CLKDIV
>         tristate "SPMI PMIC clkdiv Support"
>         depends on SPMI || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 6f4c580d2728..55fb20800b66 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_SM_GCC_8250) +=3D gcc-sm8250.o
>  obj-$(CONFIG_SM_GPUCC_8150) +=3D gpucc-sm8150.o
>  obj-$(CONFIG_SM_GPUCC_8250) +=3D gpucc-sm8250.o
>  obj-$(CONFIG_SM_VIDEOCC_8150) +=3D videocc-sm8150.o
> +obj-$(CONFIG_SM_VIDEOCC_8250) +=3D videocc-sm8250.o
>  obj-$(CONFIG_SPMI_PMIC_CLKDIV) +=3D clk-spmi-pmic-div.o
>  obj-$(CONFIG_KPSS_XCC) +=3D kpss-xcc.o
>  obj-$(CONFIG_QCOM_HFPLL) +=3D hfpll.o
> diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc=
-sm8250.c
> new file mode 100644
> index 000000000000..a814d10945c4
> --- /dev/null
> +++ b/drivers/clk/qcom/videocc-sm8250.c
> @@ -0,0 +1,518 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,videocc-sm8250.h>
> +
[...]
> +static struct clk_rcg2 video_cc_ahb_clk_src =3D {
> +       .cmd_rcgr =3D 0xbd4,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D video_cc_parent_map_0,
> +       .freq_tbl =3D ftbl_video_cc_ahb_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "video_cc_ahb_clk_src",
> +               .parent_data =3D video_cc_parent_data_0,
> +               .num_parents =3D ARRAY_SIZE(video_cc_parent_data_0),
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_shared_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 video_cc_xo_clk_src =3D {
> +       .cmd_rcgr =3D 0xecc,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D video_cc_parent_map_0,
> +       .freq_tbl =3D ftbl_video_cc_ahb_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "video_cc_xo_clk_src",
> +               .parent_data =3D video_cc_parent_data_0,
> +               .num_parents =3D ARRAY_SIZE(video_cc_parent_data_0),
> +               .flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,

Similar critical clk comment, see below.

> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_branch video_cc_ahb_clk =3D {
> +       .halt_reg =3D 0xe58,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0xe58,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "video_cc_ahb_clk",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .hw =3D &video_cc_ahb_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,

Similar critical clk comment, see below.

> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch video_cc_mvs0_clk =3D {
> +       .halt_reg =3D 0xd34,
> +       .halt_check =3D BRANCH_HALT_SKIP, /* TODO: hw gated ? */

Is this resolved?

> +       .clkr =3D {
> +               .enable_reg =3D 0xd34,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "video_cc_mvs0_clk",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .hw =3D &video_cc_mvs0_div_clk_src.clkr.h=
w,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
[...]
> +
> +static struct clk_branch video_cc_xo_clk =3D {
> +       .halt_reg =3D 0xeec,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0xeec,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "video_cc_xo_clk",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .hw =3D &video_cc_xo_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,

Please add a coment why it's critical. If no consumer of this clk exists
it's preferred to move the enabling to probe and not waste memory
modeling it in software.

> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
