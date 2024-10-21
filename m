Return-Path: <linux-arm-msm+bounces-35175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 100D99A5DBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB9921F20EAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 07:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0121E0E18;
	Mon, 21 Oct 2024 07:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTBx9YBf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16741DF730;
	Mon, 21 Oct 2024 07:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729497373; cv=none; b=HJCO12rQta7OPDrIqhNF4t3NwaZ1P6mJq7D/3vwXWadzEO7P37YC+YkK65RTk2R4vTpQT7MFjeNuew+u8fQ6SsXm7oAIQ4MM6cLRvowNm3Zw8QdxzF5RJtCqTUyZDfH/+lkawGQ926s2WJu/BjCyK5pLLImzVoZvaZoNDxneKkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729497373; c=relaxed/simple;
	bh=DQhuco04oiVnYP1cZjNQ2CI+wRPOHbQtA3/UoSttBL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWhm92e3sPvnP56RhNeJVgfbGPhadRuDqJ2luMIgNuLM58VyUsZUmuLqMNTDKzUd0OVMv4wIlQ/jUv8NPQH0IJhcKb3z0ZP9K+ZBs3eG7BaTUTPt/sOIPm8hqnE56mjTZ6mp7E6xSJtvGH5DRaQQZ92MowUoVFodo9S8BIknIPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTBx9YBf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD10C4CEC3;
	Mon, 21 Oct 2024 07:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729497372;
	bh=DQhuco04oiVnYP1cZjNQ2CI+wRPOHbQtA3/UoSttBL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZTBx9YBfaa+6nfhk4HkEIv2YNoydlyM6wGKrD6TVf3tBMPuFSBpgAFDiUr+NqXQfT
	 1I99X6CegcTCl+WpM6yyKBEC3Ig/aW+d61oSFYqE1pLBV4an73kHcB9Grohv5o3u9+
	 eSvcUTNIQYVEJyeg2ZmpsI81E6xbcYUUQHMGfxRatoDYPHE9LVnai/Uh6AyLp/n87a
	 hPdvf7vEHEmTac+/fIvjhN6obdO8U1MHlqAT7RTKTOVXLTCB2wBJjxFah9YJmEMdxg
	 hi1B9U1QsVP7FEI5iviAHTcTQEljvn57e7mNoPhwU1t5S+28OQeDLP34CxCinFV5Wr
	 kz/hfjXgo/SUA==
Date: Mon, 21 Oct 2024 09:56:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <quic_imrashai@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: qcom: Add support for GPU Clock Controller on
 QCS8300
Message-ID: <puhpztfn6ga5rxv4mwu7wyvk63hqme2nzffcvzwv7t4oo5hlvc@4ugxncmu3wwk>
References: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
 <20241018-qcs8300-mm-patches-v1-2-859095e0776c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241018-qcs8300-mm-patches-v1-2-859095e0776c@quicinc.com>

On Fri, Oct 18, 2024 at 04:42:30PM +0530, Imran Shaik wrote:
> Add support to the QCS8300 GPU clock controller by extending
> the SA8775P GPU clock controller, which is mostly identical
> but QCS8300 has few additional clocks and minor differences.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
>  drivers/clk/qcom/gpucc-sa8775p.c | 47 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gpucc-sa8775p.c b/drivers/clk/qcom/gpucc-sa8775p.c
> index f8a8ac343d70..99a8344b00db 100644
> --- a/drivers/clk/qcom/gpucc-sa8775p.c
> +++ b/drivers/clk/qcom/gpucc-sa8775p.c
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

I just wanted to comment on your binding that devices should be made
compatible...

>  	{ }
>  };
> @@ -596,6 +635,14 @@ static int gpu_cc_sa8775p_probe(struct platform_device *pdev)
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
>  
> +	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcs8300-gpucc")) {

Why we cannot use match data? Seeing compatibles in the code is
unexpected and does not scale.

Best regards,
Krzysztof


