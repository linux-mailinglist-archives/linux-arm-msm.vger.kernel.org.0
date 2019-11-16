Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B804FEABF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2019 06:50:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbfKPFuQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Nov 2019 00:50:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:58364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725308AbfKPFuQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Nov 2019 00:50:16 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8FBCE20729;
        Sat, 16 Nov 2019 05:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573883415;
        bh=cqibmtWhugPFIdWWdJC/LaDl+aZlb97vNdXIjuHltc8=;
        h=In-Reply-To:References:Cc:To:Subject:From:Date:From;
        b=1Zk9wAz5nUsulI2tlJtlKZeDOw4Cfc3A9Qu9NO2eA7Aw+SQLwfkYz7d7Ez+geeUu+
         KbmHJC4U1kP8QQGUagT+bewwcNW2xMWBXj6/Pf3KRbdzTv5RK3EOZh89QGWjshaQbf
         pfnKuI2OKVJr1xUDq2ojknyZqnAOXO8RdIO1rt5Y=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <307ce88d-ab1b-ce2b-0e25-79b7fde637e5@codeaurora.org>
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org> <1572524473-19344-5-git-send-email-tdas@codeaurora.org> <20191106003053.DA8462178F@mail.kernel.org> <307ce88d-ab1b-ce2b-0e25-79b7fde637e5@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v1 4/7] clk: qcom: Add graphics clock controller driver for SC7180
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 21:50:14 -0800
Message-Id: <20191116055015.8FBCE20729@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-11-15 00:11:28)
> Hi Stephen,
>=20
> Thanks for the review.
>=20
> On 11/6/2019 6:00 AM, Stephen Boyd wrote:
> > Quoting Taniya Das (2019-10-31 05:21:10)
> >> diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-=
sc7180.c
> >> new file mode 100644
> >> index 0000000..0d893e6
> >> --- /dev/null
> >> +++ b/drivers/clk/qcom/gpucc-sc7180.c
> >> @@ -0,0 +1,274 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> >> + */
> >> +
> >> +#include <linux/clk-provider.h>
> >> +#include <linux/err.h>
> >> +#include <linux/kernel.h>
> >> +#include <linux/module.h>
> >> +#include <linux/of.h>
> >> +#include <linux/of_device.h>
> >=20
> > Are these of includes used?
> >
>=20
> yes, would clean up these headers.
>=20

Maybe they're used. I'm not sure.

> >> +       regmap =3D qcom_cc_map(pdev, &gpu_cc_sc7180_desc);
> >> +       if (IS_ERR(regmap))
> >> +               return PTR_ERR(regmap);
> >> +
> >> +       /* 360MHz Configuration */
> >> +       gpu_cc_pll_config.l =3D 0x12;
> >> +       gpu_cc_pll_config.alpha =3D 0xC000;
> >> +       gpu_cc_pll_config.config_ctl_val =3D 0x20485699;
> >> +       gpu_cc_pll_config.config_ctl_hi_val =3D 0x00002067;
> >> +       gpu_cc_pll_config.user_ctl_val =3D 0x00000001;
> >> +       gpu_cc_pll_config.user_ctl_hi_val =3D 0x00004805;
> >> +       gpu_cc_pll_config.test_ctl_hi_val =3D 0x40000000;
> >=20
> > Is there a reason this is built on the stack? Save space or something?
> >=20
>=20
> I have done as we had discussed during the dispcc review for SDM845
> https://patchwork.kernel.org/patch/10446073/
>  >>>
>  >> +static const struct alpha_pll_config disp_cc_pll0_config =3D {
>  >> +       .l =3D 0x2c,
>  >> +       .alpha =3D 0xcaaa,
>  >> +};
>  >
>  > Any reason this can't be put on the stack in the probe function?
>  >
> I would move it.
>  >>>
>=20
> In case you think I should move it outside I can do that too.

No I was just wondering what prompted it.

