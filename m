Return-Path: <linux-arm-msm+bounces-4366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B4F80E72A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 10:17:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9392E1C21388
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 09:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8E258134;
	Tue, 12 Dec 2023 09:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cLHbrcnT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E93D5
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 01:17:02 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5e23d5d72f0so100707b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 01:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702372622; x=1702977422; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p38ZcnMoGySoA9RmMEhaNrnZZBwNT7TlIqnl8C0Lsh4=;
        b=cLHbrcnTccbzLpgPFtaMkhk8CDo/sdm0AY57ytdW5qVS+9wKPREjSYF/lO7GGtd/QQ
         C3RRLuaaqVKIVQPGzRggNvWHJd0kDQV8GZZlODhpr26LhWdiqRbM2vXgBtgb5lHENC56
         1w6+yEAYfy/lXo9Br2XO9MnYqJ1UOPAU0RPOBaZaBZjLY4Xk3aA8rSH4J3StikVdVTqE
         Dg2TQpNkfdMev4GGOEfw7vSuzAOaZRG3v0nLDKeiZ4M+KrbslZJhs0x7RL9sYivpFQD4
         4mbKjLMnGtWZDIqLxMqbIgC1eicDHEC+8Vfsc2+TkajwK6jgetQZg9Y1hNA3jyYnZXds
         rmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702372622; x=1702977422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p38ZcnMoGySoA9RmMEhaNrnZZBwNT7TlIqnl8C0Lsh4=;
        b=OLh28V6vOIFsKi6v+ZdBlMm1dSPcky8Ode0YSmdowQVyAz65WVVuccVtQdnvzp9Gu7
         LQGQu8nCaAtPHDpNkJd+arHlOZFdcqlSJXp7NSYIg6IeabGZwHuhcsI8Fpovb6W+NPz9
         e6Um3Igg1kwkz22zoJWKixyf32UbGddf/VHf+SUUC6BKcyBe4gaJsknSB37ClL5DSWDC
         xX5MMmb8eWwZ4gNwO1OdFjK/YZOXNDRaYQ6duZHp7El1yOVIjkHGaQBJ8WlLXPcThk2d
         eA9qEW9mTgzBynIbec0DFk/Nh+YnCqHuZb35IFC8Ga7W3jYtjJOg58TwN7weel81XoLq
         KFYA==
X-Gm-Message-State: AOJu0YzGJgbMIxjatsIOMRDdAourVupi45N8UcB5T5s56daeU+N0GXmO
	WCDqLinGMZIKLTsknMajQEd4nC+NHka9RbP0sOyJrg==
X-Google-Smtp-Source: AGHT+IGfK6M82t1BPlvqg9TxCM/9qRj45o0tTiIJ27mtS0gYiaU1mn1aQ6NyYyJKbJ+DgcTtvVTbDhuMjYDaazDF4Ss=
X-Received: by 2002:a0d:e905:0:b0:5d7:1941:ac7 with SMTP id
 s5-20020a0de905000000b005d719410ac7mr4662948ywe.98.1702372621940; Tue, 12 Dec
 2023 01:17:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212-x1e80100-clock-controllers-v1-0-0de1af44dcb3@linaro.org> <20231212-x1e80100-clock-controllers-v1-10-0de1af44dcb3@linaro.org>
In-Reply-To: <20231212-x1e80100-clock-controllers-v1-10-0de1af44dcb3@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 11:16:50 +0200
Message-ID: <CAA8EJpriXaymPkbkr_8Z76SDqZFrNAUOH_ggtpxSE2VA=0gcqA@mail.gmail.com>
Subject: Re: [PATCH 10/10] clk: qcom: Add camcc clock driver for x1e80100
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Rajendra Nayak <quic_rjendra@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Dec 2023 at 00:46, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
>
> Add the camcc clock driver for x1e80100
>
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig          |    8 +
>  drivers/clk/qcom/Makefile         |    1 +
>  drivers/clk/qcom/camcc-x1e80100.c | 2489 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 2498 insertions(+)
>
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 0633728c870c..4580edbd13ea 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -20,6 +20,14 @@ menuconfig COMMON_CLK_QCOM
>
>  if COMMON_CLK_QCOM
>
> +config CLK_X1E80100_CAMCC
> +       tristate "X1E80100 Camera Clock Controller"
> +       depends on ARM64 || COMPILE_TEST
> +       select CLK_X1E80100_GCC
> +       help
> +         Support for the camera clock controller on X1E80100 devices.
> +         Say Y if you want to support camera devices and camera functionality.
> +
>  config CLK_X1E80100_DISPCC
>         tristate "X1E80100 Display Clock Controller"
>         depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 750b084553c6..1da65ca78e24 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -21,6 +21,7 @@ clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
>  obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
>  obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
>  obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
> +obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_GPUCC) += gpucc-x1e80100.o
> diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
> new file mode 100644
> index 000000000000..50dc578692a1
> --- /dev/null
> +++ b/drivers/clk/qcom/camcc-x1e80100.c
> @@ -0,0 +1,2489 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"
> +
> +enum {
> +       DT_BI_TCXO,
> +       DT_BI_TCXO_AO,
> +       DT_SLEEP_CLK,
> +};
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
> +       P_CAM_CC_PLL6_OUT_EVEN,
> +       P_CAM_CC_PLL8_OUT_EVEN,
> +       P_SLEEP_CLK,
> +};
> +
> +static const struct pll_vco lucid_ole_vco[] = {
> +       { 249600000, 2300000000, 0 },
> +};
> +
> +static const struct pll_vco rivian_ole_vco[] = {
> +       { 777000000, 1285000000, 0 },
> +};
> +
> +static const struct alpha_pll_config cam_cc_pll0_config = {
> +       .l = 0x3E,

Lowercase hex, please.
Other than that LGTM.

> +       .alpha = 0x8000,
> +       .config_ctl_val = 0x20485699,
> +       .config_ctl_hi_val = 0x00182261,
> +       .config_ctl_hi1_val = 0x82AA299C,
> +       .test_ctl_val = 0x00000000,
> +       .test_ctl_hi_val = 0x00000003,
> +       .test_ctl_hi1_val = 0x00009000,
> +       .test_ctl_hi2_val = 0x00000034,
> +       .user_ctl_val = 0x00008400,
> +       .user_ctl_hi_val = 0x00000005,
> +};



-- 
With best wishes
Dmitry

