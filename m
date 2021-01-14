Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39CBF2F6DED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 23:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730654AbhANWNZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 17:13:25 -0500
Received: from relay06.th.seeweb.it ([5.144.164.167]:40803 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730613AbhANWNY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 17:13:24 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 9BF613EBE2;
        Thu, 14 Jan 2021 23:12:40 +0100 (CET)
Subject: Re: [PATCH v2 00/11] Clock fixes for MSM8998 GCC, MMCC, GPUCC
To:     linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <b85658a1-be8a-c950-185e-efc772134a07@somainline.org>
Date:   Thu, 14 Jan 2021 23:12:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 14/01/21 23:10, AngeloGioacchino Del Regno ha scritto:
> This patch series fixes some issues with the MSM8998 clocks and, in
> particular, brings a very important fix to the GCC PLLs.
> 
> These fixes are enhancing this SoC's stability and also makes it
> possible to eventually enable the Adreno GPU (with proper clock
> scaling) and other components.
> 
> This patch series was tested on:
> - Sony Xperia XZ Premium (MSM8998)
> - F(x)Tec Pro1 (MSM8998)
> 

Forgot to write this part, so adding as a reply to myself...

Changes in v2:
  - Separated dt-bindings headers definitions additions from
    actual code, as per Rob Herring's review

> AngeloGioacchino Del Regno (11):
>    dt-bindings: clocks: gcc-msm8998: Add GCC_MMSS_GPLL0_CLK definition
>    clk: qcom: gcc-msm8998: Wire up gcc_mmss_gpll0 clock
>    dt-bindings: clock: gcc-msm8998: Add HMSS_GPLL0_CLK_SRC definition
>    clk: qcom: gcc-msm8998: Add missing hmss_gpll0_clk_src clock
>    clk: qcom: gcc-msm8998: Mark gpu_cfg_ahb_clk as critical
>    clk: qcom: gcc-msm8998: Fix Alpha PLL type for all GPLLs
>    clk: qcom: mmcc-msm8998: Set CLK_GET_RATE_NOCACHE to pixel/byte clks
>    clk: qcom: mmcc-msm8998: Add hardware clockgating registers to some
>      clks
>    clk: qcom: mmcc-msm8998: Set bimc_smmu_gdsc always on
>    clk: qcom: gpucc-msm8998: Add resets, cxc, fix flags on gpu_gx_gdsc
>    clk: qcom: gpucc-msm8998: Allow fabia gpupll0 rate setting
> 
>   drivers/clk/qcom/gcc-msm8998.c               | 143 ++++++++++++-------
>   drivers/clk/qcom/gpucc-msm8998.c             |  18 ++-
>   drivers/clk/qcom/mmcc-msm8998.c              |  20 ++-
>   include/dt-bindings/clock/qcom,gcc-msm8998.h |   2 +
>   4 files changed, 125 insertions(+), 58 deletions(-)
> 

