Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD9CBD55F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2019 01:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406772AbfIXXMZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Sep 2019 19:12:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:50906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389437AbfIXXMZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Sep 2019 19:12:25 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9012C207FD;
        Tue, 24 Sep 2019 23:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569366743;
        bh=+j5AnNwQqbgf/RjmaOj47PhlrItx9j7FWIaZz17xSJk=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=gH92DrEndcCCHU6/4MPa6jo3NtGaa0u6iNz3U6tb/8zo5SH7Nob3dwlKOkhSyzZzi
         xl0loW0SfMexj9nNqeKL+9BK7JyvK9IaxjatCtf5c1xUm492fCGe6H2XwmlhxrCJg3
         Y1ea2aiR/GKHMN9nu5jHURN4wlEJGNE6G/RBOQho=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a3cd82c9-8bfa-f4a3-ab1f-2e397fbd9d16@codeaurora.org>
References: <20190918095018.17979-1-tdas@codeaurora.org> <20190918095018.17979-4-tdas@codeaurora.org> <20190918213946.DC03521924@mail.kernel.org> <a3cd82c9-8bfa-f4a3-ab1f-2e397fbd9d16@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>, robh+dt@kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 3/3] clk: qcom: Add Global Clock controller (GCC) driver for SC7180
User-Agent: alot/0.8.1
Date:   Tue, 24 Sep 2019 16:12:22 -0700
Message-Id: <20190924231223.9012C207FD@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-09-23 01:01:11)
> Hi Stephen,
>=20
> Thanks for your comments.
>=20
> On 9/19/2019 3:09 AM, Stephen Boyd wrote:
> > Quoting Taniya Das (2019-09-18 02:50:18)
> >> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc71=
80.c
> >> new file mode 100644
> >> index 000000000000..d47865d5408f
> >> --- /dev/null
> >> +++ b/drivers/clk/qcom/gcc-sc7180.c
> >> @@ -0,0 +1,2515 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> >> + */
> >> +
> >> +#include <linux/err.h>
> >> +#include <linux/kernel.h>
> >> +#include <linux/module.h>
> >> +#include <linux/of.h>
> >> +#include <linux/of_device.h>
> >> +#include <linux/regmap.h>
> >=20
> > include clk-provider.h
> >=20
>=20
> will add this header.
> Currently the <drivers/clk/qcom/clk-regmap.h> already includes it.

Yes but it should be included in any clk-provider drivers too.

> >> +
> >> +/* Leave the clock ON for parent config_noc_clk to be kept enabled */
> >> +static struct clk_branch gcc_disp_ahb_clk =3D {
> >> +       .halt_reg =3D 0xb00c,
> >> +       .halt_check =3D BRANCH_HALT,
> >> +       .hwcg_reg =3D 0xb00c,
> >> +       .hwcg_bit =3D 1,
> >> +       .clkr =3D {
> >> +               .enable_reg =3D 0xb00c,
> >> +               .enable_mask =3D BIT(0),
> >> +               .hw.init =3D &(struct clk_init_data){
> >> +                       .name =3D "gcc_disp_ahb_clk",
> >> +                       .flags =3D CLK_IS_CRITICAL,
> >=20
> > Does this assume the display is left enabled out of the bootloader? Why
> > is this critical to system operation? Maybe it is really
> > CLK_IGNORE_UNUSED?
> >=20
>=20
> This clock is not kept enabled by bootloader. But leaving this ON for=20
> clients on config noc.

Please see below comment for the other critical clk with no parent.

>=20
> >> +                       .ops =3D &clk_branch2_ops,
> >> +               },
> >> +       },
> >> +};
> >> +
[...]
> >> +static struct clk_branch gcc_ufs_phy_phy_aux_clk =3D {
> >> +       .halt_reg =3D 0x77094,
> >> +       .halt_check =3D BRANCH_HALT,
> >> +       .hwcg_reg =3D 0x77094,
> >> +       .hwcg_bit =3D 1,
> >> +       .clkr =3D {
> >> +               .enable_reg =3D 0x77094,
> >> +               .enable_mask =3D BIT(0),
> >> +               .hw.init =3D &(struct clk_init_data){
> >> +                       .name =3D "gcc_ufs_phy_phy_aux_clk",
> >> +                       .parent_data =3D &(const struct clk_parent_dat=
a){
> >> +                               .hw =3D &gcc_ufs_phy_phy_aux_clk_src.c=
lkr.hw,
> >> +                       },
> >> +                       .num_parents =3D 1,
> >> +                       .flags =3D CLK_SET_RATE_PARENT,
> >> +                       .ops =3D &clk_branch2_ops,
> >> +               },
> >> +       },
> >> +};
> >> +
> >> +static struct clk_branch gcc_ufs_phy_rx_symbol_0_clk =3D {
> >> +       .halt_reg =3D 0x7701c,
> >> +       .halt_check =3D BRANCH_HALT_SKIP,
> >=20
> > Again, nobody has fixed the UFS driver to not need to do this halt skip
> > check for these clks? It's been over a year.
> >=20
>=20
> The UFS_PHY_RX/TX clocks could be left enabled due to certain HW boot=20
> configuration and thus during the late initcall of clk_disable there=20
> could be warnings of "clock stuck ON" in the dmesg. That is the reason=20
> also to use the BRANCH_HALT_SKIP flag.

Oh that's bad. Why do the clks stay on when we try to turn them off?

>=20
> I would also check internally for the UFS driver fix you are referring he=
re.

Sure. I keep asking but nothing is done :(

>=20
> >> +       .clkr =3D {
> >> +               .enable_reg =3D 0x7701c,
> >> +               .enable_mask =3D BIT(0),
> >> +               .hw.init =3D &(struct clk_init_data){
> >> +                       .name =3D "gcc_ufs_phy_rx_symbol_0_clk",
> >> +                       .ops =3D &clk_branch2_ops,
> >> +               },
> >> +       },
> >> +};
> >> +
[...]
> >> +
> >> +static struct clk_branch gcc_usb3_prim_phy_pipe_clk =3D {
> >> +       .halt_reg =3D 0xf058,
> >> +       .halt_check =3D BRANCH_HALT_SKIP,
> >=20
> > Why does this need halt_skip?
>=20
> This is required as the source is external PHY, so we want to not check=20
> for HALT.

This doesn't really answer my question. If the source is an external phy
then it should be listed as a clock in the DT binding and the parent
should be specified here. Unless something doesn't work because of that?

>=20
> >=20
> >> +       .clkr =3D {
> >> +               .enable_reg =3D 0xf058,
> >> +               .enable_mask =3D BIT(0),
> >> +               .hw.init =3D &(struct clk_init_data){
> >> +                       .name =3D "gcc_usb3_prim_phy_pipe_clk",
> >> +                       .ops =3D &clk_branch2_ops,
> >> +               },
> >> +       },
> >> +};
> >> +
> >> +static struct clk_branch gcc_usb_phy_cfg_ahb2phy_clk =3D {
> >> +       .halt_reg =3D 0x6a004,
> >> +       .halt_check =3D BRANCH_HALT,
> >> +       .hwcg_reg =3D 0x6a004,
> >> +       .hwcg_bit =3D 1,
> >> +       .clkr =3D {
> >> +               .enable_reg =3D 0x6a004,
> >> +               .enable_mask =3D BIT(0),
> >> +               .hw.init =3D &(struct clk_init_data){
> >> +                       .name =3D "gcc_usb_phy_cfg_ahb2phy_clk",
> >> +                       .ops =3D &clk_branch2_ops,
> >> +               },
> >> +       },
> >> +};
> >> +
> >> +/* Leave the clock ON for parent config_noc_clk to be kept enabled */
> >=20
> > There's no parent though... So I guess this means it keeps it enabled
> > implicitly in hardware?
> >=20
>=20
> These are not left enabled, but want to leave them enabled for clients=20
> on config NOC.

Sure. It just doesn't make sense to create clk structures and expose
them in the kernel when we just want to turn the bits on and leave them
on forever. Why not just do some register writes in probe for this
driver? Doesn't that work just as well and use less memory?

