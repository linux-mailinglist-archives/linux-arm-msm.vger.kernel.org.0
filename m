Return-Path: <linux-arm-msm+bounces-35064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 489D29A4AC4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 02:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 027FE28437F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 00:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF5E198E86;
	Sat, 19 Oct 2024 00:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wDpRG3mX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48590EED6
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 00:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729299212; cv=none; b=d9PVpar4GJfwG/CWWAjQFqS03aZ8mSqQjTVjUATHNfYTSWubuQyYQi80rfw0zlRqRO0xLlSWxwYSnCncakV1wJmg0AU+sZIb+Sgbmx5AV+JzbFMM3bLuAHDNnTA906XIEG9d1ZOs6GlM3kXtq4uu2oaH0Dc6kU7MuvNn3chstuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729299212; c=relaxed/simple;
	bh=fxJP6TH0Kf88Cju3h2DOUOHhzoA+0mHGNQ0kONReDZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sJLFDMee4BjzeJXNn7Ho+WYVt9QDwya0vIViUGeOV2wlMZsaZFFDz9N3twK/zumI4QoxlUxULpTXMmYmMsVQK7pItxlyzDhuYmuGMkwGCACeVv/FV15uNl5cwOmtLjTza8UY53PIiGkT0UBzoIH0p4Q7zkViM9+EVcXEJMtxx5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wDpRG3mX; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9a26a5d6bfso387891066b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 17:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729299208; x=1729904008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lC+kKjnHN4Mbf8H0HShnBhmWgFVk4d57CzYOuvwy+Pk=;
        b=wDpRG3mXu96pvWXP5EQOWkK3kFmMnydXQtdYHymWI5UEwtnpL0kWH7FPiL4lebnMAu
         b0++Sci56XXFfr4NasrxM1SGy2y0nLdcVOgoeeCkKtnMxhSvlo7LBl1Y46/a8sfS3/BU
         27gvXFdSUx2txqdvMtsbOtYIDibUsjFC7mySDmH3bOJm2UvAU8L199sqUvY7sHdl1/2K
         KwKe6p6FwOJNVUujd0NIlFBi8nlxByMfn2rFncE2aeQKnYpN2RsSpkbaQ9Ilt8czdTNP
         7ByWUyXxcS0UjjFFXlH8/+ThhAhVm8LzAdPaa0j7rEt+DNUt9nm29LLMi2W1S4sWvelD
         Nnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729299208; x=1729904008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lC+kKjnHN4Mbf8H0HShnBhmWgFVk4d57CzYOuvwy+Pk=;
        b=PW54gPuoTExfebvdYlR0ow78kXAGoWC+AYhlP+ECwWIh1dALjiFDTVrMauxIocfSMy
         QyIdZdalSDcpiYzsDH0aUhwg41LSTzJo5hPaFffWuAplRIJOHkpcS4iJ/2VcEBfIdzjG
         9Y2vy5RTrPRGN3KXpgn9WdEoyjmzh1Efo4qIlbEXd8fxjKuMZtsmGLq4MDURwRFaaECy
         dEitw9Pov9xuWUocdesbP0pjHc+Yl0Ebc6cPrT6M97OZs2RwT3yB19jPo6jtmf8bYC9G
         WNCb+mY8SPux974PrJMDSCiJqjlD140r52CifylZVFlpA6R5A/BH5Q9vE2VCTCJJm8RP
         5FJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc/q+4NfrYoXejyWDhY6/y7hlzx1YXbljGCXGFp5xifWk0UDuiJ6LRXUiIi10WqHKu1MgsX2G+PfLyH+NX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7XItWRrVeMK76PmNDJwJVEdiRv/FjoppC/vAShUOXSqGtjS/r
	Sm6T2wTYY4ofUixElSaS35xADyNjchNrauXfL7qERG/zvh8O9e9aKfFKyi4Pbro=
X-Google-Smtp-Source: AGHT+IHf/aIS9ByQ7hRwPT8KFuGH1SyFkxmybGXDN9u0/DXROuk9s58q/ntAna6EEjs0NGHCd4R2Nw==
X-Received: by 2002:a17:907:9284:b0:a99:4601:b9d8 with SMTP id a640c23a62f3a-a9a69de8cbbmr336906366b.63.1729299208375;
        Fri, 18 Oct 2024 17:53:28 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68bc49bfsm152566166b.101.2024.10.18.17.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 17:53:27 -0700 (PDT)
Message-ID: <752f6195-335f-453d-b449-898b0a924126@linaro.org>
Date: Sat, 19 Oct 2024 01:53:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] clk: qcom: camcc-qcs615: Add QCS615 camera clock
 controller driver
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241019-qcs615-mm-clockcontroller-v1-0-9f1ca2048287@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-4-9f1ca2048287@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241019-qcs615-mm-clockcontroller-v1-4-9f1ca2048287@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/10/2024 20:12, Taniya Das wrote:
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on QCS615 platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>   drivers/clk/qcom/Kconfig        |   10 +
>   drivers/clk/qcom/Makefile       |    1 +
>   drivers/clk/qcom/camcc-qcs615.c | 1588 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 1599 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 30eb8236c9d80071a87e0332cfac7b667a08824a..bdb1c672dd90d96814b214afd234341e37e3c470 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -460,6 +460,16 @@ config QCM_DISPCC_2290
>   	  Say Y if you want to support display devices and functionality such as
>   	  splash screen.
>   
> +config QCS_CAMCC_615
> +	tristate "QCS615 Camera Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select QCS_GCC_615
> +	help
> +	  Support for the camera clock controller on Qualcomm Technologies, Inc
> +	  QCS615 devices.
> +	  Say Y if you want to support camera devices and functionality such as
> +	  capturing pictures.
> +
>   config QCS_GCC_404
>   	tristate "QCS404 Global Clock Controller"
>   	help
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 2b378667a63ff6eca843d7bef638a5422d35c3d3..f69c1bc13d3eca1859d9e849399e55175df869c3 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
>   obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
>   obj-$(CONFIG_QCM_GCC_2290) += gcc-qcm2290.o
>   obj-$(CONFIG_QCM_DISPCC_2290) += dispcc-qcm2290.o
> +obj-$(CONFIG_QCS_CAMCC_615) += camcc-qcs615.o
>   obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
>   obj-$(CONFIG_QCS_Q6SSTOP_404) += q6sstop-qcs404.o
>   obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
> diff --git a/drivers/clk/qcom/camcc-qcs615.c b/drivers/clk/qcom/camcc-qcs615.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..2341ddb57598eaaa7fa35300ae6635ff40da99ae
> --- /dev/null
> +++ b/drivers/clk/qcom/camcc-qcs615.c
> @@ -0,0 +1,1588 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
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
> +	DT_BI_TCXO,
> +	DT_BI_TCXO_AO,
> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_CAM_CC_PLL0_OUT_AUX,
> +	P_CAM_CC_PLL1_OUT_AUX,
> +	P_CAM_CC_PLL2_OUT_AUX2,
> +	P_CAM_CC_PLL2_OUT_EARLY,
> +	P_CAM_CC_PLL3_OUT_MAIN,
> +};
> +
> +static const struct pll_vco brammo_vco[] = {
> +	{ 500000000, 1250000000, 0 },
> +};
> +
> +static const struct pll_vco spark_vco[] = {
> +	{ 1000000000, 2100000000, 0 },
> +	{ 750000000, 1500000000, 1 },
> +	{ 500000000, 1000000000, 2 },
> +	{ 300000000, 500000000, 3 },
> +	{ 550000000, 1100000000, 4 },
> +};
> +
> +/* 600MHz configuration */
> +static const struct alpha_pll_config cam_cc_pll0_config = {
> +	.l = 0x1f,
> +	.alpha_hi = 0x40,
> +	.alpha_en_mask = BIT(24),
> +	.vco_val = 0x2 << 20,
> +	.vco_mask = 0x3 << 20,
> +	.aux_output_mask = BIT(1),
> +	.config_ctl_val = 0x4001055b,
> +	.test_ctl_hi_val = 0x1,
> +	.test_ctl_hi_mask = 0x1,
> +};
> +
> +static struct clk_alpha_pll cam_cc_pll0 = {
> +	.offset = 0x0,
> +	.vco_table = spark_vco,
> +	.num_vco = ARRAY_SIZE(spark_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_pll0",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_ops,
> +		},
> +	},
> +};
> +
> +/* 808MHz configuration */
> +static struct alpha_pll_config cam_cc_pll1_config = {
> +	.l = 0x2A,
> +	.alpha_hi = 0x15,
> +	.alpha = 0x55555555,
> +	.alpha_en_mask = BIT(24),
> +	.vco_val = 0x2 << 20,
> +	.vco_mask = 0x3 << 20,
> +	.aux_output_mask = BIT(1),
> +	.config_ctl_val = 0x4001055b,
> +	.test_ctl_hi_val = 0x1,
> +	.test_ctl_hi_mask = 0x1,
> +};
> +
> +static struct clk_alpha_pll cam_cc_pll1 = {
> +	.offset = 0x1000,
> +	.vco_table = spark_vco,
> +	.num_vco = ARRAY_SIZE(spark_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_pll1",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_ops,
> +		},
> +	},
> +};
> +
> +/* 960MHz configuration */
> +static struct alpha_pll_config cam_cc_pll2_config = {
> +	.l = 0x32,
> +	.vco_val = 0x0 << 20,

zero shifted any direction is still zero

zed.c

#include <stdio.h>
#include <stdint.h>

int main(int argc, char *argv[])
{
	uint32_t a = 0, b = 0 << 20;

	printf("a = %d b = %d\n", a, b);

	return 0;
}

gcc -o zed zed.c

a = 0 b = 0

> +static struct gdsc bps_gdsc = {
> +	.gdscr = 0x6004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "bps_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
> +};
> +
> +static struct gdsc ife_0_gdsc = {
> +	.gdscr = 0x9004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "ife_0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR,
> +};
> +
> +static struct gdsc ife_1_gdsc = {
> +	.gdscr = 0xa004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "ife_1_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR,
> +};

Shouldn't these have RETAIN flags ?

> +
> +static struct gdsc ipe_0_gdsc = {
> +	.gdscr = 0x7004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "ipe_0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};

I'd say those flags are very aspirational suggest POLL_CFG_GDSCR | 
RETAIN_FF_ENABLE.


> +
> +static struct gdsc titan_top_gdsc = {
> +	.gdscr = 0xb134,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "titan_top_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR,
> +};
> 

As Dmitry queried, TOP_GDSC should almost certainly be the parent of the 
IFE/IPE/BPS and others.

> +static int cam_cc_qcs615_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = qcom_cc_map(pdev, &cam_cc_qcs615_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	clk_alpha_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
> +	clk_alpha_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
> +	clk_alpha_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
> +	clk_alpha_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);

Got to be missing something like

         /* Keep some clocks always-on */
         qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */

If the GDSC gets declocked everything beneath it - including the stuff 
in RETAIN goes away...

Smells wrong.

---
bod

