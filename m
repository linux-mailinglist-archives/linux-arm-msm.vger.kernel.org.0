Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43E4316F440
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 01:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbgBZA26 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 19:28:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:46726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728756AbgBZA26 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 19:28:58 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2019820732;
        Wed, 26 Feb 2020 00:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582676937;
        bh=2PMEOSSd91WtZ6aS0URgU5NbJ9Ejg3d9n7C6UiZLmBU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LtLktzcKehUJvc6+0v1YUFa4Se6RgBxz1Wp13t1JWE18AE67Fe/UKLi1Eg5JpBmR0
         YEMO0rugrNApDEY3tlTWSXfE7cigFe/0xHajqBYZIqpY7nM3/BBR5nrokIGN99Z5Z4
         uvjFmlG0OCGwjsNb9Z86fjXuSZYjuKp6hwSqibkk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1582540703-6328-6-git-send-email-tdas@codeaurora.org>
References: <1582540703-6328-1-git-send-email-tdas@codeaurora.org> <1582540703-6328-6-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v5 5/5] clk: qcom: Add modem clock controller driver for SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 25 Feb 2020 16:28:56 -0800
Message-ID: <158267693624.177367.14912476991395295437@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-02-24 02:38:23)
> diff --git a/drivers/clk/qcom/mss-sc7180.c b/drivers/clk/qcom/mss-sc7180.c
> new file mode 100644
> index 0000000..993749e
> --- /dev/null
> +++ b/drivers/clk/qcom/mss-sc7180.c
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,mss-sc7180.h>
> +
> +#include "clk-regmap.h"
> +#include "clk-branch.h"
> +#include "common.h"
> +
> +static struct clk_branch mss_axi_nav_clk =3D {
> +       .halt_reg =3D 0x20bc,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x20bc,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "mss_axi_nav_clk",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .fw_name =3D "gcc_mss_nav_axi_clk",

Drop _clk from here.

> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch mss_axi_crypto_clk =3D {
> +       .halt_reg =3D 0x20cc,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x20cc,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "mss_axi_crypto_clk",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .fw_name =3D "gcc_mss_mfab_axis_clk",

And here, so that it matches the binding.

> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
