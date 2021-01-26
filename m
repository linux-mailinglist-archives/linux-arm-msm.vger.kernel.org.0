Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4DA303FDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 15:13:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405603AbhAZOM6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 09:12:58 -0500
Received: from m-r2.th.seeweb.it ([5.144.164.171]:38743 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405667AbhAZOM4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 09:12:56 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 8105C3F277;
        Tue, 26 Jan 2021 15:11:53 +0100 (CET)
Subject: Re: [PATCH v2 3/9] clk: qcom: Add SDM660 Multimedia Clock Controller
 (MMCC) driver
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>, agross@kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
 <20210113183817.447866-4-angelogioacchino.delregno@somainline.org>
 <2453cbae-bd30-416c-4432-9b27754670e1@linaro.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <6ba8ac3c-d33b-3ab2-5855-f99d431b397a@somainline.org>
Date:   Tue, 26 Jan 2021 15:11:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <2453cbae-bd30-416c-4432-9b27754670e1@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 26/01/21 14:39, Stanimir Varbanov ha scritto:
> 
> 
> On 1/13/21 8:38 PM, AngeloGioacchino Del Regno wrote:
>> From: Martin Botka <martin.botka@somainline.org>
>>
>> Add a driver for the multimedia clock controller found on SDM660
>> based devices. This should allow most multimedia device drivers
>> to probe and control their clocks.
>>
>> Signed-off-by: Martin Botka <martin.botka@somainline.org>
>> Co-developed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> [angelogioacchino.delregno@somainline.org: Cleaned up SDM630 clock fixups]
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> ---
>>   drivers/clk/qcom/Kconfig                     |    9 +
>>   drivers/clk/qcom/Makefile                    |    1 +
>>   drivers/clk/qcom/mmcc-sdm660.c               | 2864 ++++++++++++++++++
>>   include/dt-bindings/clock/qcom,mmcc-sdm660.h |  162 +
>>   4 files changed, 3036 insertions(+)
>>   create mode 100644 drivers/clk/qcom/mmcc-sdm660.c
>>   create mode 100644 include/dt-bindings/clock/qcom,mmcc-sdm660.h
>>
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index d32bb12cd8d0..eb9746e84556 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -366,6 +366,15 @@ config SDM_GCC_660
>>   	  Say Y if you want to use peripheral devices such as UART, SPI,
>>   	  i2C, USB, UFS, SDDC, PCIe, etc.
>>   
>> +config SDM_MMCC_660
>> +	tristate "SDM660 Multimedia Clock Controller"
>> +	select SDM_GCC_660
>> +	select QCOM_GDSC
>> +	help
>> +	  Support for the multimedia clock controller on SDM660 devices.
>> +	  Say Y if you want to support multimedia devices such as display,
>> +	  graphics, video encode/decode, camera, etc.
>> +
>>   config QCS_TURING_404
>>   	tristate "QCS404 Turing Clock Controller"
>>   	help
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 9e5e0e3cb7b4..bfa8350f088d 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -62,6 +62,7 @@ obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
>>   obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
>>   obj-$(CONFIG_SDM_DISPCC_845) += dispcc-sdm845.o
>>   obj-$(CONFIG_SDM_GCC_660) += gcc-sdm660.o
>> +obj-$(CONFIG_SDM_MMCC_660) += mmcc-sdm660.o
>>   obj-$(CONFIG_SDM_GCC_845) += gcc-sdm845.o
>>   obj-$(CONFIG_SDM_GPUCC_845) += gpucc-sdm845.o
>>   obj-$(CONFIG_SDM_LPASSCC_845) += lpasscc-sdm845.o
>> diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
>> new file mode 100644
>> index 000000000000..d268e1c89f57
>> --- /dev/null
>> +++ b/drivers/clk/qcom/mmcc-sdm660.c
>> @@ -0,0 +1,2864 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2020, Martin Botka <martin.botka@somainline.org>
>> + * Copyright (c) 2020, Konrad Dybcio <konrad.dybcio@somainline.org>
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/bitops.h>
>> +#include <linux/err.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset-controller.h>
>> +#include <linux/clk.h>
>> +
>> +
>> +#include <dt-bindings/clock/qcom,mmcc-sdm660.h>
>> +
>> +#include "common.h"
>> +#include "clk-regmap.h"
>> +#include "clk-regmap-divider.h"
>> +#include "clk-alpha-pll.h"
>> +#include "clk-rcg.h"
>> +#include "clk-branch.h"
>> +#include "reset.h"
>> +#include "gdsc.h"
>> +
> 
> <cut>
> 
>> +
>> +static struct gdsc venus_gdsc = {
>> +	.gdscr = 0x1024,
>> +	.pd = {
>> +		.name = "venus",
>> +	},
>> +	.pwrsts = PWRSTS_OFF_ON,
>> +};
>> +
>> +static struct gdsc venus_core0_gdsc = {
>> +	.gdscr = 0x1040,
>> +	.pd = {
>> +		.name = "venus_core0",
>> +	},
>> +	.parent = &venus_gdsc.pd,
>> +	.pwrsts = PWRSTS_OFF_ON,
> 
> I think this gdsc should be under hw control?
> 
> +	.flags = HW_CTRL,
> 

Feels strange, eh? Was the same for me, but then noupe, there is no
hw control for this GDSC downstream, nor a hw_ctrl address for it, so
on this SoC it shouldn't be under hw control.

Besides that, testing also agrees with this (enc/dec works)...

P.S.: Thanks for the review!
-- Angelo

>> +};
>> +

