Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AACDF2279C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 09:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbgGUHsF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 03:48:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:54614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726389AbgGUHsE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 03:48:04 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B4DD420792;
        Tue, 21 Jul 2020 07:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595317683;
        bh=BQZ5hmFIpZckWyenvtmkpbQjIg05LGMKNSIMSzTcK/A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ehUhwlCwbnHNUi1W6XHRH3vBCM2gpc5QnE57816xOwX2itcx+armXE57XNgrOBLau
         EHPxOfO/YQPTe6p8ldWbhMgOiM2aFisEQ0oO5kBNRIfpTD1nuvvxbxD7D+GCdjv/ZW
         PVVy7gY2jBo0VwWfsLKgZvXH/XCCDDZFmzb2FBAI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1594795010-9074-5-git-send-email-tdas@codeaurora.org>
References: <1594795010-9074-1-git-send-email-tdas@codeaurora.org> <1594795010-9074-5-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v4 4/4] clk: qcom: lpass: Add support for LPASS clock controller for SC7180
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
Date:   Tue, 21 Jul 2020 00:48:03 -0700
Message-ID: <159531768310.3847286.13203525525881212775@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-07-14 23:36:50)
> diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpa=
sscorecc-sc7180.c
> new file mode 100644
> index 0000000..fd8537c
> --- /dev/null
> +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> @@ -0,0 +1,478 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "common.h"
> +#include "gdsc.h"
> +
> +enum {
> +       P_BI_TCXO,
> +       P_LPASS_LPAAUDIO_DIG_PLL_OUT_ODD,
> +       P_SLEEP_CLK,
> +};
> +
> +static struct pll_vco fabia_vco[] =3D {
> +       { 249600000, 2000000000, 0 },
> +};
> +
> +static const struct alpha_pll_config lpass_lpaaudio_dig_pll_config =3D {
> +       .l =3D 0x20,
> +       .alpha =3D 0x0,
> +       .config_ctl_val =3D 0x20485699,
> +       .config_ctl_hi_val =3D 0x00002067,
> +       .test_ctl_val =3D 0x40000000,
> +       .test_ctl_hi_val =3D 0x00000000,
> +       .user_ctl_val =3D 0x00005105,
> +       .user_ctl_hi_val =3D 0x00004805,
> +};
> +
> +static const u8 clk_alpha_pll_regs_offset[][PLL_OFF_MAX_REGS] =3D {
> +       [CLK_ALPHA_PLL_TYPE_FABIA] =3D  {
> +               [PLL_OFF_L_VAL] =3D 0x04,
> +               [PLL_OFF_CAL_L_VAL] =3D 0x8,
> +               [PLL_OFF_USER_CTL] =3D 0x0c,
> +               [PLL_OFF_USER_CTL_U] =3D 0x10,
> +               [PLL_OFF_USER_CTL_U1] =3D 0x14,
> +               [PLL_OFF_CONFIG_CTL] =3D 0x18,
> +               [PLL_OFF_CONFIG_CTL_U] =3D 0x1C,
> +               [PLL_OFF_CONFIG_CTL_U1] =3D 0x20,
> +               [PLL_OFF_TEST_CTL] =3D 0x24,
> +               [PLL_OFF_TEST_CTL_U] =3D 0x28,
> +               [PLL_OFF_STATUS] =3D 0x30,
> +               [PLL_OFF_OPMODE] =3D 0x38,
> +               [PLL_OFF_FRAC] =3D 0x40,
> +       },
> +};
> +
> +static struct clk_alpha_pll lpass_lpaaudio_dig_pll =3D {
> +       .offset =3D 0x1000,
> +       .vco_table =3D fabia_vco,
> +       .num_vco =3D ARRAY_SIZE(fabia_vco),
> +       .regs =3D clk_alpha_pll_regs_offset[CLK_ALPHA_PLL_TYPE_FABIA],
> +       .clkr =3D {
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "lpass_lpaaudio_dig_pll",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .fw_name =3D "bi_tcxo",
> +                               .name =3D "bi_tcxo",

We don't need .name if we have .fw_name and this is a new binding/device.

> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_alpha_pll_fabia_ops,
> +               },
> +       },
> +};
> +
