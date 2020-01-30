Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85C8114E086
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 19:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbgA3SI5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 13:08:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:38570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728190AbgA3SI5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 13:08:57 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B65C20678;
        Thu, 30 Jan 2020 18:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580407736;
        bh=3W+VaepOQZK1/2OtY04p71hljSuNF5huaq7gghm3Ydc=;
        h=In-Reply-To:References:Subject:To:From:Cc:Date:From;
        b=cuGCBO4qLa3QUE7OV1nspLRbwqAqVDYW0sUVqJ6IvhWuakis8yFV1jzEOEsxLAs13
         EhnToPmlKjoazvdWTD/nlwpemWiCoeLKYr/wJSjT/dq72LZ86bISAkHv81CgcIiRv8
         epMaDzvWAwhxUrtCts0NRsAtir52umiQ54fXCNkw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1580357923-19783-4-git-send-email-tdas@codeaurora.org>
References: <1580357923-19783-1-git-send-email-tdas@codeaurora.org> <1580357923-19783-4-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3 3/3] clk: qcom: Add modem clock controller driver for SC7180
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Thu, 30 Jan 2020 10:08:55 -0800
Message-Id: <20200130180856.6B65C20678@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-01-29 20:18:43)
> Add support for the modem clock controller found on SC7180
> based devices. This would allow modem drivers to probe and
> control their clocks.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  drivers/clk/qcom/Kconfig      |   9 +++
>  drivers/clk/qcom/Makefile     |   1 +
>  drivers/clk/qcom/gcc-sc7180.c |  70 +++++++++++++++++++++
>  drivers/clk/qcom/mss-sc7180.c | 143 ++++++++++++++++++++++++++++++++++++=
++++++

Please split this patch into two, one for gcc and one for mss.

>  4 files changed, 223 insertions(+)
>  create mode 100644 drivers/clk/qcom/mss-sc7180.c
>=20
> diff --git a/drivers/clk/qcom/mss-sc7180.c b/drivers/clk/qcom/mss-sc7180.c
> new file mode 100644
> index 0000000..d82600e
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
[...]
> +
> +static struct regmap_config mss_regmap_config =3D {

Can this be const?

> +       .reg_bits       =3D 32,
> +       .reg_stride     =3D 4,
> +       .val_bits       =3D 32,
> +       .fast_io        =3D true,
> +};
> +
