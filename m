Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 199A854D9F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 07:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358421AbiFPFqi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 01:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242923AbiFPFqh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 01:46:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0455B3E4;
        Wed, 15 Jun 2022 22:46:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8507BB8216D;
        Thu, 16 Jun 2022 05:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED48C34114;
        Thu, 16 Jun 2022 05:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655358394;
        bh=ZhJQepwIk1KyZLOmiobiSGZhW7H0P3Uur7O+SoTdqs4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Uopth/bNHvieB/trzceVipPml5VkC0bES0SZ7k7ZD786uH2bkdj5Z7PR7oWVvoJPP
         7ei3oJNjhw2p6Ay66Vu0o/IuSiipZr+GKZ5PK80XLbhI9GqsTbcgzVnJ960u4rpgHw
         +p80+X8k+BvGcqN16QRr28etD5sjHVe2mf3fAI/w85Yr/FMZ7XHyyQLNYTYYnkI3H8
         tNTEQcTeOC6+I7Sr+06/jEXwl5e9PEXPhC6LEXQS6f3P8Zg29Yc396RsO1/Zr8/02q
         8LGXqthZ708LM5sbgvOla6ueKblAoEav9M3YXIRK1O/GQ2c7SfmmcBr1WlX/rL26U3
         x8Os45Gcz0jVw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220603080105.2251866-1-vladimir.zapolskiy@linaro.org>
References: <20220603080019.2251764-1-vladimir.zapolskiy@linaro.org> <20220603080105.2251866-1-vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v6 7/7] clk: qcom: add camera clock controller driver for SM8450 SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Date:   Wed, 15 Jun 2022 22:46:31 -0700
User-Agent: alot/0.10
Message-Id: <20220616054633.EED48C34114@smtp.kernel.org>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vladimir Zapolskiy (2022-06-03 01:01:05)
> diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8=
450.c
> new file mode 100644
> index 000000000000..f213c33647e2
> --- /dev/null
> +++ b/drivers/clk/qcom/camcc-sm8450.c
> @@ -0,0 +1,2866 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/clk.h>

Is this include used?

> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>

Include mod_devicetable.h instead?

> +#include <linux/of.h>

Is this include used?

> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,sm8450-camcc.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"
> +
> +enum {
> +       P_BI_TCXO,
> +       P_CAM_CC_PLL0_OUT_EVEN,
> +       P_CAM_CC_PLL0_OUT_MAIN,
> +       P_CAM_CC_PLL0_OUT_ODD,
> +       P_CAM_CC_PLL1_OUT_EVEN,
> +       P_CAM_CC_PLL2_OUT_EVEN,
> +       P_CAM_CC_PLL2_OUT_MAIN,
> +       P_CAM_CC_PLL3_OUT_EVEN,
> +       P_CAM_CC_PLL4_OUT_EVEN,
> +       P_CAM_CC_PLL5_OUT_EVEN,
> +       P_CAM_CC_PLL6_OUT_EVEN,
> +       P_CAM_CC_PLL7_OUT_EVEN,
> +       P_CAM_CC_PLL8_OUT_EVEN,
> +       P_SLEEP_CLK,
> +};
> +
> +static const struct pll_vco lucid_evo_vco[] =3D {
> +       { 249600000, 2000000000, 0 },
> +};
> +
> +static const struct pll_vco rivian_evo_vco[] =3D {
> +       { 864000000, 1056000000, 0 },
> +};
> +
> +static const struct alpha_pll_config cam_cc_pll0_config =3D {
> +       .l =3D 0x3e,
> +       .alpha =3D 0x8000,
> +       .config_ctl_val =3D 0x20485699,
> +       .config_ctl_hi_val =3D 0x00182261,
> +       .config_ctl_hi1_val =3D 0x32aa299c,
> +       .user_ctl_val =3D 0x00008400,
> +       .user_ctl_hi_val =3D 0x00000805,
> +};
> +
> +static struct clk_alpha_pll cam_cc_pll0 =3D {
> +       .offset =3D 0x0,
> +       .vco_table =3D lucid_evo_vco,
> +       .num_vco =3D ARRAY_SIZE(lucid_evo_vco),
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
> +       .clkr =3D {
> +               .hw.init =3D &(struct clk_init_data){

Make these anonymous structs const please.

> +                       .name =3D "cam_cc_pll0",
> +                       .parent_data =3D &(const struct clk_parent_data){
