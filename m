Return-Path: <linux-arm-msm+bounces-43462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A66819FD02A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 05:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E6F718832E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 04:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826CF7080D;
	Fri, 27 Dec 2024 04:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDiyD4NJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515E817BA5;
	Fri, 27 Dec 2024 04:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735273449; cv=none; b=LbIHYVXAMqgfV2WmI/IPsSbE+odOE+U5pA2eEmSD6SQbsjWdM5WvUC1PDj71GQ2ArNNGXurVlfn4qwiao6YOiog/Y24VBrovoC+30jpeArAqCR5wD7bmvt7FZ9rijZOf5gpxBlDEhJkuQSi11q8vo2yKV/O2kcArDemkca8e7DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735273449; c=relaxed/simple;
	bh=iHlUyoMwiKATh25RB0e+wOJ32MSrfOKPKzxUTXAmKYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+bm0tT+BY2jR8HV88J/cPWOkkdHsk4ob0Gfnp3hAf2BTYvKciIQv79JmkoB450stv0aUPShZP1/8TwJPVl3+6qzDZlmJP/KvsabX5dprnT5tm3vtFfau/ZPfuYeIG3d7xwDBKq+qYr4A6mCgecyJ/wwtJES5hJRd4PiqUWKGQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDiyD4NJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF28C4CED0;
	Fri, 27 Dec 2024 04:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735273448;
	bh=iHlUyoMwiKATh25RB0e+wOJ32MSrfOKPKzxUTXAmKYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aDiyD4NJqwoMQtaEMbY/9doWtFgxKOXuhjgTofdrWqZqeZv2UoGcfT2it444uIqM0
	 JvXjT2vkAe/DWtiAPRNmUFhBKWLBP4+8qOPWghM907fJe4NxdG7cewotnkSreUC0tq
	 vnflHD5hehWnLSl2fS4tkwRqiwmggvspAedgkeopmGWJXM4zCp0r11D/B6SC8SIRyk
	 /OKq0yPXOPo8s+SwvrPqrsmicbrXkq7hie088tJSPmVT+2jJfxmOqMFOawDP99eW1E
	 FGNKTccTQN7PiaPoyp25Ajok9zCsA3XDeH4UemfGHrH1Fg+mWxTpvq8ejTMYP2Pkft
	 DLBb7W2nqNQPA==
Date: Thu, 26 Dec 2024 22:24:05 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Imran Shaik <quic_imrashai@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 2/6] clk: qcom: Add support for GPU Clock Controller
 on QCS8300
Message-ID: <xc7iiuwlbihb7dguq77el5ipt2w5324klyvojkyf2eh3lit6eh@zgj567elzljm>
References: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
 <20241106-qcs8300-mm-patches-v3-2-f611a8f87f15@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106-qcs8300-mm-patches-v3-2-f611a8f87f15@quicinc.com>

On Wed, Nov 06, 2024 at 03:21:57PM +0530, Imran Shaik wrote:
> Add support to the QCS8300 GPU clock controller by extending
> the SA8775P GPU clock controller, which is mostly identical
> but QCS8300 has few additional clocks and minor differences.
> 

What does "mostly identical" mean?

Is QCS8300 a derivative of SA8775P? Or is it just by accident that these
two SoCs happens to have almost the same set of clocks?


Also, commit messages should follow the flow described in
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes.

Regards,
Bjorn

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
>  drivers/clk/qcom/gpucc-sa8775p.c | 49 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-sa8775p.c b/drivers/clk/qcom/gpucc-sa8775p.c
> index f8a8ac343d70..78cad622cb5a 100644
> --- a/drivers/clk/qcom/gpucc-sa8775p.c
> +++ b/drivers/clk/qcom/gpucc-sa8775p.c
> @@ -12,7 +12,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
> -#include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
> +#include <dt-bindings/clock/qcom,qcs8300-gpucc.h>
>  
>  #include "clk-alpha-pll.h"
>  #include "clk-branch.h"
> @@ -317,6 +317,24 @@ static struct clk_branch gpu_cc_crc_ahb_clk = {
>  	},
>  };
>  
> +static struct clk_branch gpu_cc_cx_accu_shift_clk = {
> +	.halt_reg = 0x95e8,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x95e8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data){
> +			.name = "gpu_cc_cx_accu_shift_clk",
> +			.parent_hws = (const struct clk_hw*[]){
> +				&gpu_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
>  static struct clk_branch gpu_cc_cx_ff_clk = {
>  	.halt_reg = 0x914c,
>  	.halt_check = BRANCH_HALT,
> @@ -420,6 +438,24 @@ static struct clk_branch gpu_cc_demet_clk = {
>  	},
>  };
>  
> +static struct clk_branch gpu_cc_gx_accu_shift_clk = {
> +	.halt_reg = 0x95e4,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x95e4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data){
> +			.name = "gpu_cc_gx_accu_shift_clk",
> +			.parent_hws = (const struct clk_hw*[]){
> +				&gpu_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
>  static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
>  	.halt_reg = 0x7000,
>  	.halt_check = BRANCH_HALT_VOTED,
> @@ -499,6 +535,7 @@ static struct clk_regmap *gpu_cc_sa8775p_clocks[] = {
>  	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
>  	[GPU_CC_CB_CLK] = &gpu_cc_cb_clk.clkr,
>  	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
> +	[GPU_CC_CX_ACCU_SHIFT_CLK] = NULL,
>  	[GPU_CC_CX_FF_CLK] = &gpu_cc_cx_ff_clk.clkr,
>  	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
>  	[GPU_CC_CX_SNOC_DVM_CLK] = &gpu_cc_cx_snoc_dvm_clk.clkr,
> @@ -508,6 +545,7 @@ static struct clk_regmap *gpu_cc_sa8775p_clocks[] = {
>  	[GPU_CC_DEMET_DIV_CLK_SRC] = &gpu_cc_demet_div_clk_src.clkr,
>  	[GPU_CC_FF_CLK_SRC] = &gpu_cc_ff_clk_src.clkr,
>  	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
> +	[GPU_CC_GX_ACCU_SHIFT_CLK] = NULL,
>  	[GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK] = &gpu_cc_hlos1_vote_gpu_smmu_clk.clkr,
>  	[GPU_CC_HUB_AHB_DIV_CLK_SRC] = &gpu_cc_hub_ahb_div_clk_src.clkr,
>  	[GPU_CC_HUB_AON_CLK] = &gpu_cc_hub_aon_clk.clkr,
> @@ -583,6 +621,7 @@ static const struct qcom_cc_desc gpu_cc_sa8775p_desc = {
>  };
>  
>  static const struct of_device_id gpu_cc_sa8775p_match_table[] = {
> +	{ .compatible = "qcom,qcs8300-gpucc" },
>  	{ .compatible = "qcom,sa8775p-gpucc" },
>  	{ }
>  };
> @@ -596,6 +635,14 @@ static int gpu_cc_sa8775p_probe(struct platform_device *pdev)
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
>  
> +	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcs8300-gpucc")) {
> +		gpu_cc_pll0_config.l = 0x31;
> +		gpu_cc_pll0_config.alpha = 0xe555;
> +
> +		gpu_cc_sa8775p_clocks[GPU_CC_CX_ACCU_SHIFT_CLK] = &gpu_cc_cx_accu_shift_clk.clkr;
> +		gpu_cc_sa8775p_clocks[GPU_CC_GX_ACCU_SHIFT_CLK] = &gpu_cc_gx_accu_shift_clk.clkr;
> +	}
> +
>  	clk_lucid_evo_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
>  	clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
>  
> 
> -- 
> 2.25.1
> 

