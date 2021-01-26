Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68B94303FEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 15:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391808AbhAZNlo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 08:41:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391775AbhAZNkf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 08:40:35 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BD6C061A29
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 05:39:55 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id c6so19802588ede.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 05:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lk4JPRwUYALCNG2igi4afiTcBYEM/7rNUk9OAWBcEKk=;
        b=UdoDKTi1sbPTjTJ0MhX4Kqhq+E/25MT5yDvXGL4Lw/8bOvznJXP0tqAV6gvt012HI+
         Ev2hEmfTso5JGXBtKJzZbcauz+6G/Vvob9aAIfSyQNzR3UP9aahETacfBhUH4NMTqJfG
         28ukc1xDY2V1dNFw8EENwGvTAvF4JJm+odDaZLsWpTT+zftemxavbyks/bP4UmIwGc93
         385PhrWn3eVRLJ3fIQnswzQTh+fCRfMHcTyBLtbwzr8FDksAL/nOSFGlZVaegBrGmeG3
         OUUASyq5mxgl8H68jPCJmXHuT4pZgDs9KVTjHiZQ2L9LRUYwbKzH/atU7ZJ1n3Ht+28F
         lKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lk4JPRwUYALCNG2igi4afiTcBYEM/7rNUk9OAWBcEKk=;
        b=I+en4VDPaaYrJQx9kM0hoKbXYjF9Xs+5aagdysaPuz2nFbq01EgdLTCQ5SWvLzLdbX
         GUOiF7Bh9WTi4vWvVoB0yaKzTPkyzLX1MY4sCFwA6SWf6AYPpYu6jJHEsfmM75c85XY/
         SckESv6HVLGgIZ+YeumOGggGVUL8sNKFW9NzXAprPaL44Fp8fQ12aaiNucNqXlOgzEnJ
         m+ttXLGZgU+T5BrmyQ9HhElhNRGMvdCKm+9okP+poe84cqpTCpEXeoiLCNVNOQViZruq
         kfSdgO2/T1jPYRSHNQwyDzCaOLGh50k6rgkYksTTAzxmwV5MbyT/fKAvnqWWeelrVzW+
         /1mw==
X-Gm-Message-State: AOAM5333vc/ybTH4QvOr0CTUKinSUVhrwigehvI9oHRnN1Yd7e8L3apy
        aClsb+unT24EYYq59Ne8J5F8dA==
X-Google-Smtp-Source: ABdhPJzfsUKl3nbwig8RQGGsmtTC3iiYEKOK8dCvoMmrGeiWyq+JIptIf9wgNf3sl7zWKgCI0XMpiQ==
X-Received: by 2002:a50:fc97:: with SMTP id f23mr4882928edq.307.1611668393900;
        Tue, 26 Jan 2021 05:39:53 -0800 (PST)
Received: from [192.168.0.4] (hst-221-115.medicom.bg. [84.238.221.115])
        by smtp.googlemail.com with ESMTPSA id w2sm9932644ejn.73.2021.01.26.05.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 05:39:53 -0800 (PST)
Subject: Re: [PATCH v2 3/9] clk: qcom: Add SDM660 Multimedia Clock Controller
 (MMCC) driver
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, agross@kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
 <20210113183817.447866-4-angelogioacchino.delregno@somainline.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <2453cbae-bd30-416c-4432-9b27754670e1@linaro.org>
Date:   Tue, 26 Jan 2021 15:39:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210113183817.447866-4-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/13/21 8:38 PM, AngeloGioacchino Del Regno wrote:
> From: Martin Botka <martin.botka@somainline.org>
> 
> Add a driver for the multimedia clock controller found on SDM660
> based devices. This should allow most multimedia device drivers
> to probe and control their clocks.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> Co-developed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> [angelogioacchino.delregno@somainline.org: Cleaned up SDM630 clock fixups]
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/clk/qcom/Kconfig                     |    9 +
>  drivers/clk/qcom/Makefile                    |    1 +
>  drivers/clk/qcom/mmcc-sdm660.c               | 2864 ++++++++++++++++++
>  include/dt-bindings/clock/qcom,mmcc-sdm660.h |  162 +
>  4 files changed, 3036 insertions(+)
>  create mode 100644 drivers/clk/qcom/mmcc-sdm660.c
>  create mode 100644 include/dt-bindings/clock/qcom,mmcc-sdm660.h
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index d32bb12cd8d0..eb9746e84556 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -366,6 +366,15 @@ config SDM_GCC_660
>  	  Say Y if you want to use peripheral devices such as UART, SPI,
>  	  i2C, USB, UFS, SDDC, PCIe, etc.
>  
> +config SDM_MMCC_660
> +	tristate "SDM660 Multimedia Clock Controller"
> +	select SDM_GCC_660
> +	select QCOM_GDSC
> +	help
> +	  Support for the multimedia clock controller on SDM660 devices.
> +	  Say Y if you want to support multimedia devices such as display,
> +	  graphics, video encode/decode, camera, etc.
> +
>  config QCS_TURING_404
>  	tristate "QCS404 Turing Clock Controller"
>  	help
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 9e5e0e3cb7b4..bfa8350f088d 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -62,6 +62,7 @@ obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
>  obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
>  obj-$(CONFIG_SDM_DISPCC_845) += dispcc-sdm845.o
>  obj-$(CONFIG_SDM_GCC_660) += gcc-sdm660.o
> +obj-$(CONFIG_SDM_MMCC_660) += mmcc-sdm660.o
>  obj-$(CONFIG_SDM_GCC_845) += gcc-sdm845.o
>  obj-$(CONFIG_SDM_GPUCC_845) += gpucc-sdm845.o
>  obj-$(CONFIG_SDM_LPASSCC_845) += lpasscc-sdm845.o
> diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
> new file mode 100644
> index 000000000000..d268e1c89f57
> --- /dev/null
> +++ b/drivers/clk/qcom/mmcc-sdm660.c
> @@ -0,0 +1,2864 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020, Martin Botka <martin.botka@somainline.org>
> + * Copyright (c) 2020, Konrad Dybcio <konrad.dybcio@somainline.org>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/clk-provider.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +#include <linux/clk.h>
> +
> +
> +#include <dt-bindings/clock/qcom,mmcc-sdm660.h>
> +
> +#include "common.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-alpha-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-branch.h"
> +#include "reset.h"
> +#include "gdsc.h"
> +

<cut>

> +
> +static struct gdsc venus_gdsc = {
> +	.gdscr = 0x1024,
> +	.pd = {
> +		.name = "venus",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +};
> +
> +static struct gdsc venus_core0_gdsc = {
> +	.gdscr = 0x1040,
> +	.pd = {
> +		.name = "venus_core0",
> +	},
> +	.parent = &venus_gdsc.pd,
> +	.pwrsts = PWRSTS_OFF_ON,

I think this gdsc should be under hw control?

+	.flags = HW_CTRL,

> +};
> +
-- 
-- 
regards,
Stan
