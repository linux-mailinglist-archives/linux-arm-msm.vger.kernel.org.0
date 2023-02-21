Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10BE769E72B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Feb 2023 19:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjBUSMF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Feb 2023 13:12:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjBUSME (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Feb 2023 13:12:04 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE35030199
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Feb 2023 10:11:33 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id f18so6873417lfa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Feb 2023 10:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g9l35INoDfUDk0IuqXZaCgRGRY7dxuPgfajlmx6iWoY=;
        b=bBlJkYc52rUmJbh9l+/+eL8BPRA/Tcf60XxsFxAPreABYRbwngQHk4HJOMZxaPW6B3
         O+r9sc1CAdUOZ4RztHgwf3/mHI619zen+4HgxmYdyKdYe3UIbfCBlc+YiTKgrBoYtkT8
         8279ZDo5JeFgYrhWoKmuavX+md3lCFrXS6L7whPNWzFtGQOiCWo7OWZQY/uIMi+qxY6A
         MD8dclBXLOIA3VBs/T5gQFqYgX/IN4uXNaXnmD+yILR6PLXF621K7FotjmXSUJFAqH+c
         Lth/c8XTVvX9a+ggYlBtLWeE93bxHGtKRv0o8co5AbkyVvqSTdV70KNLjMHs4+opV59w
         382w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9l35INoDfUDk0IuqXZaCgRGRY7dxuPgfajlmx6iWoY=;
        b=Tpv4xoNUlN3HKY7o4XA1hfmJxr3PKKbkMkEEfFXvXSNDBkQ8C0ds0gnaO9QV0o6RAH
         dXsAGetR52RUan9bV7UnSedhBZE5dNcs3nVDVZthq7kBNuiZ4SEVfdon1cS5qCvMtndV
         GfoNyUfPuASy6ylUSxt7qeCq4C1U/yUHs/lifbG71UiRk+fdzcQrHk3+T0g3Cfk2GTMf
         yIF9crU+8+3sUOAJEoFPJkDPZ988RUlckbBg1m3WWCcnrXj/zUbOaRQuxCz0ukOeMV1K
         mjJ3q/5kL4pHzk/DVI0af805hzfv3I4p5h4X+oYgNiLS0ciuud5CTYIhXxhGQtI3CaIN
         JEcg==
X-Gm-Message-State: AO0yUKU4Q60cuwQgxa4vX7xT7cvnqtrmGKn3Wz6I+vERy2Y1jUYN0syB
        IR40y79D7eNacGmYOU94DE8Ywg==
X-Google-Smtp-Source: AK7set/lYk44gi0NBjJmIAUFh1HMRhdisJ6K6VhAs2zjAHruCJj30THCA2nJGiGge5kAsIQHxmNXHA==
X-Received: by 2002:a05:6512:203:b0:4d7:b818:788d with SMTP id a3-20020a056512020300b004d7b818788dmr2095444lfo.23.1677003065980;
        Tue, 21 Feb 2023 10:11:05 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id b17-20020ac25e91000000b004b6f00832cesm1899856lfq.166.2023.02.21.10.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 10:11:05 -0800 (PST)
Message-ID: <98ee82b3-ff8f-b21d-8cc3-169b62e50ebf@linaro.org>
Date:   Tue, 21 Feb 2023 19:11:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] clk: qcom: Add global clock controller driver for
 MSM8917
Content-Language: en-US
To:     =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230221174909.164029-1-otto.pflueger@abscue.de>
 <20230221174909.164029-3-otto.pflueger@abscue.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230221174909.164029-3-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21.02.2023 18:49, Otto Pflüger wrote:
> This driver provides clocks, resets and power domains needed for various
> components of the MSM8917 SoC and the very similar QM215 SoC.
> 
> According to [1] in the downstream kernel, the GPU clock has a different
> source mapping on QM215 (gcc_gfx3d_map vs gcc_gfx3d_map_qm215).
> 
> [1]: https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LF.UM.8.6.2-28000-89xx.0/include/dt-bindings/clock/msm-clocks-hwio-8952.h#L298
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
Thanks for working on reviving old and affordable devices!

>  drivers/clk/qcom/Kconfig       |    8 +
>  drivers/clk/qcom/Makefile      |    1 +
>  drivers/clk/qcom/gcc-msm8917.c | 3283 ++++++++++++++++++++++++++++++++
>  3 files changed, 3292 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-msm8917.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 70d43f0a8919..3ef58b09385a 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -196,6 +196,14 @@ config MSM_GCC_8916
>  	  Say Y if you want to use devices such as UART, SPI i2c, USB,
>  	  SD/eMMC, display, graphics, camera etc.
>  
> +config MSM_GCC_8917
> +	tristate "MSM8917 Global Clock Controller"
Please also mention QM215

> +	select QCOM_GDSC
> +	help
> +	  Support for the global clock controller on msm8917 devices.
> +	  Say Y if you want to use devices such as UART, SPI i2c, USB,
> +	  SD/eMMC, display, graphics, camera etc.
> +
>  config MSM_GCC_8939
>  	tristate "MSM8939 Global Clock Controller"
>  	select QCOM_GDSC
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index f18c446a97ea..ff5f2c4127a9 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_MDM_LCC_9615) += lcc-mdm9615.o
>  obj-$(CONFIG_MSM_GCC_8660) += gcc-msm8660.o
>  obj-$(CONFIG_MSM_GCC_8909) += gcc-msm8909.o
>  obj-$(CONFIG_MSM_GCC_8916) += gcc-msm8916.o
> +obj-$(CONFIG_MSM_GCC_8917) += gcc-msm8917.o
>  obj-$(CONFIG_MSM_GCC_8939) += gcc-msm8939.o
>  obj-$(CONFIG_MSM_GCC_8953) += gcc-msm8953.o
>  obj-$(CONFIG_MSM_GCC_8960) += gcc-msm8960.o
> diff --git a/drivers/clk/qcom/gcc-msm8917.c b/drivers/clk/qcom/gcc-msm8917.c
> new file mode 100644
> index 000000000000..a2f4ffca18dc
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-msm8917.c
> @@ -0,0 +1,3283 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 Otto Pflüger
> + *
> + * Based on gcc-msm8953.c:
> + *   Copyright 2021, The Linux Foundation. All rights reserved.
> + * with parts taken from gcc-qcs404.c:
> + *   Copyright 2018, The Linux Foundation. All rights reserved.
> + * and gcc-msm8939.c:
> + *   Copyright 2020 Linaro Limited
> + * adapted with data from clock-gcc-8952.c in Qualcomm's msm-4.9 release:
> + *   Copyright (c) 2014-2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/clk-provider.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
Please sort these
> +
> +#include <dt-bindings/clock/qcom,gcc-msm8917.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"

> +
> +enum {
> +	P_XO,
> +	P_SLEEP_CLK,
> +	P_GPLL0,
> +	P_GPLL3,
> +	P_GPLL4,
> +	P_GPLL6,
> +	P_DSI0PLL,
> +	P_DSI0PLL_BYTE,
> +};
> +
> +static struct clk_alpha_pll gpll0_sleep_clk_src = {
> +	.offset = 0x21000,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> +	.clkr = {
> +		.enable_reg = 0x45008,
> +		.enable_mask = BIT(23),
> +		.enable_is_inverted = true,
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gpll0_sleep_clk_src",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.fw_name = "xo",
Please switch to .index (check sm8550 drivers for reference)

> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_ops,
> +		},
> +	},
> +};
[...]

> +
> +static struct clk_pll gpll6_early = {
> +	.l_reg = 0x37004,
> +	.m_reg = 0x37008,
> +	.n_reg = 0x3700C,
> +	.config_reg = 0x37014,
> +	.mode_reg = 0x37000,
> +	.status_reg = 0x3701C,
Please use lowercase hex everywhere except for preprocessor
defines.

> +	.status_bit = 17,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "gpll6_early",
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "xo",
> +		},
> +		.num_parents = 1,
> +		.ops = &clk_pll_ops,
> +	},
> +};
> +
[...]

> +
> +static const struct clk_parent_data gcc_pclk_data[] = {
> +	{ .fw_name = "xo" },
> +	{ .fw_name = "dsi0pll", .name = "dsi0pll" },
Since this is a new driver with no legacy leftovers, one
lookup method is enough.

(and .index would be preferred)


Konrad
