Return-Path: <linux-arm-msm+bounces-40152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E719E2F56
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 23:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DF58B2B3F9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 22:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B33920A5C6;
	Tue,  3 Dec 2024 22:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1lYktJw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3441DDA3D;
	Tue,  3 Dec 2024 22:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733263786; cv=none; b=u6Q3Xj0W4F7QsHuJa0khlYQyteCJ/pFxea9Vgcy4QsBiohP9OZaRc4JaBCpsJTfg+1Ln1Bm+V8sk5Kd1O6Q0TslpYB6iGjC/05Ak8JHVmd3l7T3bHksd6eo/EFLHA6IQc72c5D8iXsvuNU0LefSDqWmqO4XMejI9rjMwYXA9Kas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733263786; c=relaxed/simple;
	bh=N8XGQ/OdIAHqBKWwDiHLRvWWphx300ZW1+T6n2w3q4Q=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=LhVY8UNYxy0cVh/VXnNPgS6aUJRCZFAUw8rRpC18qZZRGeQo5oz1CSbTU770dzojFC/dXGBytztj2jqKJurmm9oWl6vHE06ztP4xm9Ucji8TRI5kvDT7VLLjjB4Mx9rNlCUUGp3+7avHcXJqKlSDwgtwvfNkI9h/l2O1q1oSQDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1lYktJw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C300EC4CEE1;
	Tue,  3 Dec 2024 22:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733263785;
	bh=N8XGQ/OdIAHqBKWwDiHLRvWWphx300ZW1+T6n2w3q4Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Z1lYktJwhwxb4fl0qRkD2ddZzctqBiHfP5C0SeKomjElccyY1GJ3KwuyilqX2aoy5
	 LZYkhStNAttnie1om9fp1q0NL5A3xpvZIvL6sakKxLzCZyAxMo4j1Fiuv3TxD7BMuh
	 RrdIvv/4/erDRZqUvnrEiiLb9GP69a4UCyRiRdQhzjvZlYwGDs+Y8kMkFFKaPMxPk7
	 OhnD5ekygSOJLwOC91T+BWgecZXe1PX9Ar9mrPoUP6cUPJzm5GhYV8ZRlWZ+TTEpkk
	 rwjm9txMzlfIDjdb7UK/KUMg/22P5PTmIPn6yptjY2NADzHiQGdniGdsSkDFnenbqL
	 VY9ybUsoBkWlA==
Message-ID: <5f05f2305f37bd40bf92299c04480fbf.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241128-sm8750-dispcc-v1-3-120705a4015c@linaro.org>
References: <20241128-sm8750-dispcc-v1-0-120705a4015c@linaro.org> <20241128-sm8750-dispcc-v1-3-120705a4015c@linaro.org>
Subject: Re: [PATCH 3/3] clk: qcom: dispcc-sm8750: Add SM8750 Display clock controller
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Date: Tue, 03 Dec 2024 14:09:43 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Krzysztof Kozlowski (2024-11-28 07:08:01)
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 2ec9be21ff678e3343cccafa85801aa68805f440..d9ab42c625ddd61f9bf185752=
2d44d4547e42bf5 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1022,6 +1022,16 @@ config SM_DISPCC_8550
>           Say Y if you want to support display devices and functionality =
such as
>           splash screen.
> =20
> +config SM_DISPCC_8750
> +       tristate "SM8750 Display Clock Controller"
> +       depends on ARM64 || COMPILE_TEST

Please select QCOM_GDSC

> +       depends on SM_GCC_8750

select? Or imply? It's a functional dependency, not a build time one.

> +       help
> diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-s=
m8750.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..ff64ff93c4dbdd2aae22b55dd=
0e404544cc9373e
> --- /dev/null
> +++ b/drivers/clk/qcom/dispcc-sm8750.c
> @@ -0,0 +1,1960 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023-2024, Linaro Ltd.
> + */
> +
> +#include <linux/clk.h>

Is this include used?

> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <dt-bindings/clock/qcom,sm8750-dispcc.h>
> +
> +#include "common.h"
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "reset.h"
> +#include "gdsc.h"
[...]
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_mdp_clk_src =3D {
> +       .cmd_rcgr =3D 0x8150,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_9,
> +       .freq_tbl =3D ftbl_disp_cc_mdss_mdp_clk_src,
> +       .clkr.hw.init =3D &(const struct clk_init_data) {
> +               .name =3D "disp_cc_mdss_mdp_clk_src",
> +               .parent_data =3D disp_cc_parent_data_9,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_9),
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_shared_ops, /* TODO: switch to cesta m=
anaged clocks */

What is cesta?

> +       },
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src =3D {
> +       .cmd_rcgr =3D 0x8108,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_1,
> +       .freq_tbl =3D ftbl_disp_cc_esync0_clk_src,
> +       .clkr.hw.init =3D &(const struct clk_init_data) {
> +               .name =3D "disp_cc_mdss_pclk0_clk_src",
> +               .parent_data =3D disp_cc_parent_data_1,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_1),
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_pixel_ops,
> +       },
[...]
> +               .enable_reg =3D 0x80b4,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(const struct clk_init_data) {
> +                       .name =3D "disp_cc_osc_clk",
> +                       .parent_hws =3D (const struct clk_hw*[]) {
> +                               &disp_cc_osc_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct gdsc mdss_gdsc =3D {
> +       .gdscr =3D 0x9000,
> +       .en_rest_wait_val =3D 0x2,
> +       .en_few_wait_val =3D 0x2,
> +       .clk_dis_wait_val =3D 0xf,
> +       .pd =3D {
> +               .name =3D "mdss_gdsc",
> +       },
> +       .pwrsts =3D PWRSTS_OFF_ON,
> +       .flags =3D POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
> +       // TODO: no supply?

What is this?

> +};
> +
> +static struct gdsc mdss_int2_gdsc =3D {
> +       .gdscr =3D 0xb000,
> +       .en_rest_wait_val =3D 0x2,
> +       .en_few_wait_val =3D 0x2,
> +       .clk_dis_wait_val =3D 0xf,
> +       .pd =3D {
> +               .name =3D "mdss_int2_gdsc",
> +       },
> +       .pwrsts =3D PWRSTS_OFF_ON,
> +       .flags =3D POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,

