Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 854D82FE022
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 04:52:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727136AbhAUDwD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 22:52:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:56128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726456AbhAUC5S (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 21:57:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2111523884;
        Thu, 21 Jan 2021 02:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611197165;
        bh=c1XsJT/SXPWs5fqOseN8Eebhs8J1o75FxNXKgsJnSIc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NYWE9SMnDc3ZX8r69M2IAJPIMqU03VJt5VgjP/Au5NlA1q40qVo8cxLf4vGe9pGPJ
         5UVAgaO+PRHYaK0gGinYEC+Y58Pgta3ULKtzBEXJagCVsbb9aqmQX7aMe3IC+hXERI
         HHa/LTu5zc0LxrBBGOvGVNVkfx6WjLShbSz4CAV7AQJjQ5FDt1+DMMUAIzWZ7oEri6
         d0RPCBfeejOuujlPfOUMmhB1Ffs1dJ+Lwnqq48OKJ4SMEcw5HVFJKQUrKHvT13gE0b
         PUv8tBWKTh1dIicht0jaVd5h2EMsGtF/Lbqup+kzhvm4/5XE0QJUZuuEXMP/17YQJy
         PFgnW6WkLzGbA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e6843147-514b-8901-a04c-b1d6e3ebf1c2@somainline.org>
References: <1611128871-5898-1-git-send-email-tdas@codeaurora.org> <e6843147-514b-8901-a04c-b1d6e3ebf1c2@somainline.org>
Subject: Re: [PATCH V1] clk: qcom: gcc-sc7180: Mark the MM XO clocks to be always ON
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Wed, 20 Jan 2021 18:46:03 -0800
Message-ID: <161119716362.3661239.18168143877101107424@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-20 01:16:17)
> Il 20/01/21 08:47, Taniya Das ha scritto:
> > There are intermittent GDSC power-up failures observed for titan top
> > gdsc, which requires the XO clock. Thus mark all the MM XO clocks always
> > enabled from probe.
> >=20
>=20
> Hello Tanya,
>=20
> > Fixes: 8d4025943e13 ("clk: qcom: camcc-sc7180: Use runtime PM ops inste=
ad of clk ones")
> > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > ---
> >   drivers/clk/qcom/gcc-sc7180.c | 47 ++++------------------------------=
---------
> >   1 file changed, 4 insertions(+), 43 deletions(-)
> >=20
> > --
> > Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> > of the Code Aurora Forum, hosted by the  Linux Foundation.
> >=20
> > diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc718=
0.c
> > index b05901b..88e896a 100644
> > --- a/drivers/clk/qcom/gcc-sc7180.c
> > +++ b/drivers/clk/qcom/gcc-sc7180.c
> > @@ -1,6 +1,6 @@
> >   // SPDX-License-Identifier: GPL-2.0-only
> >   /*
> > - * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2019-2021, The Linux Foundation. All rights reserved.
> >    */
> >=20
> >   #include <linux/clk-provider.h>
> > @@ -919,19 +919,6 @@ static struct clk_branch gcc_camera_throttle_hf_ax=
i_clk =3D {
> >       },
> >   };
> >=20
> > -static struct clk_branch gcc_camera_xo_clk =3D {
> > -     .halt_reg =3D 0xb02c,
> > -     .halt_check =3D BRANCH_HALT,
> > -     .clkr =3D {
> > -             .enable_reg =3D 0xb02c,
> > -             .enable_mask =3D BIT(0),
> > -             .hw.init =3D &(struct clk_init_data){
> > -                     .name =3D "gcc_camera_xo_clk",
> > -                     .ops =3D &clk_branch2_ops,
> > -             },
> > -     },
> > -};
> > -
>=20
> Why are you avoiding to register these clocks entirely?
> If this is needed by the Titan GDSC, this clock "does indeed exist".
>=20
> If these clocks shall never be turned off, then you should add the
> CLK_IS_CRITICAL flag and perhaps add a comment explaining why.

I'd rather not have critical clks wasting kernel memory and registration
time if they're never going to be turned off and we're basically just
writing a bit so that they're always on. This patch looks OK to me from
that perspective. There aren't any parents for these clks either so
really it's a glorified bit toggle and poll to make sure that it is
enabled. Maybe we should be checking that they're actually enabled at
the end of probe, but otherwise we don't need all this complexity.
