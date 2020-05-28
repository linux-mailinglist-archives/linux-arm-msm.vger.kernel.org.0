Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62CD81E538E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 03:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgE1B71 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 21:59:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:53516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725849AbgE1B70 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 21:59:26 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8062B207CB;
        Thu, 28 May 2020 01:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590631165;
        bh=f+8uYByHjJyZ01uYG5pSv1ZMt/fLT2/K91SdYiWRq5U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=yD7Uu1nQC3xDzb9PlMBLlcHcr4LToVohxsPcF3NquhIallyf3+LUL9fUdQV+eOave
         LRdvu88+vs9sedAjrVT/3+bQ0BoHF+ApEaZQ5sj9bvl3lvXe+znrcqnng0gnags5x7
         g8cODBavPQ5F4DxJ5c+5JoNBJAAKmMBVFL+3eVEE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1590582292-13314-5-git-send-email-sivaprak@codeaurora.org>
References: <1590582292-13314-1-git-send-email-sivaprak@codeaurora.org> <1590582292-13314-5-git-send-email-sivaprak@codeaurora.org>
Subject: Re: [PATCH V6 4/5] clk: qcom: Add ipq6018 apss clock controller
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Wed, 27 May 2020 18:59:24 -0700
Message-ID: <159063116486.69627.5280506237179820811@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-05-27 05:24:51)
> diff --git a/drivers/clk/qcom/apss-ipq6018.c b/drivers/clk/qcom/apss-ipq6=
018.c
> new file mode 100644
> index 0000000..004f7e1
> --- /dev/null
> +++ b/drivers/clk/qcom/apss-ipq6018.c
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk-provider.h>
> +#include <linux/regmap.h>
> +#include <linux/module.h>
> +
> +#include <dt-bindings/clock/qcom,apss-ipq.h>
> +
> +#include "common.h"
> +#include "clk-regmap.h"
> +#include "clk-branch.h"
> +#include "clk-alpha-pll.h"
> +#include "clk-regmap-mux.h"
> +
> +enum {
> +       P_XO,
> +       P_APSS_PLL_EARLY,
> +};
> +
> +static const struct clk_parent_data parents_apcs_alias0_clk_src[] =3D {
> +       { .fw_name =3D "xo" },
> +       { .fw_name =3D "pll" },

This pll clk is not described in the binding. Please add it there.

> +};
> +
> +static const struct parent_map parents_apcs_alias0_clk_src_map[] =3D {
> +       { P_XO, 0 },
> +       { P_APSS_PLL_EARLY, 5 },
> +};
> +
