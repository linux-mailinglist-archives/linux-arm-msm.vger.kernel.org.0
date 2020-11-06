Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFB442A92E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 10:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgKFJif (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 04:38:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:57344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725868AbgKFJif (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 04:38:35 -0500
Received: from localhost (unknown [122.179.17.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0FFCB208FE;
        Fri,  6 Nov 2020 09:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604655513;
        bh=X25UXPXttjy8TXg+mepAbodJpN8EbjzFhU0N6Tt/O5o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TIFgCQ8jrd8ROgegdhFxtkKtfNdnpln9XURXOm3SnikZPaBtFt/TCvVsOg7TtlP0O
         GdYfDnQQuY1HF9MTYiXH2IgEzv5idkCzAgvtu6GfiP3WfnuVo1+bCgEU+eImapQjOI
         uEdjn5I3wNU16iinGD04PC9nZBZ7V2qy61A4uAVU=
Date:   Fri, 6 Nov 2020 15:08:19 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Naveen Yadav <naveenky@codeaurora.org>
Subject: Re: [PATCH v2 2/4] clk: qcom: Add SDX55 GCC support
Message-ID: <20201106093819.GE2621@vkoul-mobl>
References: <20201105104817.15715-1-manivannan.sadhasivam@linaro.org>
 <20201105104817.15715-3-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105104817.15715-3-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-11-20, 16:18, Manivannan Sadhasivam wrote:
> From: Naveen Yadav <naveenky@codeaurora.org>
> 
> Add Global Clock Controller (GCC) support for SDX55 SoCs from Qualcomm.
> 
> Signed-off-by: Naveen Yadav <naveenky@codeaurora.org>
> [mani: converted to parent_data, commented critical clocks, cleanups]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig     |    7 +
>  drivers/clk/qcom/Makefile    |    1 +
>  drivers/clk/qcom/gcc-sdx55.c | 1626 ++++++++++++++++++++++++++++++++++
>  3 files changed, 1634 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-sdx55.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 3a965bd326d5..7897a3947e6d 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -413,6 +413,13 @@ config SDM_LPASSCC_845
>  	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
>  	  controller to reset the LPASS subsystem.
>  
> +config SDX_GCC_55
> +	tristate "SDX55 Global Clock Controller"
> +	help
> +	  Support for the global clock controller on SDX55 devices.
> +	  Say Y if you want to use peripheral devices such as UART,
> +	  SPI, I2C, USB, SD/UFS, PCIe etc.
> +
>  config SM_DISPCC_8250
>  	tristate "SM8150 and SM8250 Display Clock Controller"
>  	depends on SM_GCC_8150 || SM_GCC_8250
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 11ae86febe87..886b877e70c7 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -64,6 +64,7 @@ obj-$(CONFIG_SDM_GCC_845) += gcc-sdm845.o
>  obj-$(CONFIG_SDM_GPUCC_845) += gpucc-sdm845.o
>  obj-$(CONFIG_SDM_LPASSCC_845) += lpasscc-sdm845.o
>  obj-$(CONFIG_SDM_VIDEOCC_845) += videocc-sdm845.o
> +obj-$(CONFIG_SDX_GCC_55) += gcc-sdx55.o
>  obj-$(CONFIG_SM_DISPCC_8250) += dispcc-sm8250.o
>  obj-$(CONFIG_SM_GCC_8150) += gcc-sm8150.o
>  obj-$(CONFIG_SM_GCC_8250) += gcc-sm8250.o
> diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
> new file mode 100644
> index 000000000000..bf114165e24b
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sdx55.c
> @@ -0,0 +1,1626 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020, Linaro Ltd.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,gcc-sdx55.h>
> +
> +#include "common.h"
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "reset.h"
> +
> +enum {
> +	P_BI_TCXO,
> +	P_CORE_BI_PLL_TEST_SE,

This is for test and we removed this for upstream, so can you do that as
well (not parent will decrease for clks below)

With that updated:

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
