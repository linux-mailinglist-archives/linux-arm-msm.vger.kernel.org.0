Return-Path: <linux-arm-msm+bounces-2586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C277FE196
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 22:10:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13FC21C20ACC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 21:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E603C6167A;
	Wed, 29 Nov 2023 21:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HDSIBx0g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27DD310CB
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 13:10:50 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40b4c2ef58aso1850215e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 13:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701292248; x=1701897048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wtBnMhm6OvHI+sD8xVhry5VRmxy7IqGvQG/iVuqiaCo=;
        b=HDSIBx0grkiFIuVQEncbGx+zGKJCrBZc1Y6koKNNyU29PZoq/ayADwuI9NPlpv7cPe
         ixQJ9tTWiddnbqNTpg5+GN1djEuhlp/j0sX3MuEQHEbMOtTUnrR2ap3B2xmZBAZsg0xT
         QLNQGYFu+lkifDgL74bOr7n/EdIEhNa3jATire/01Xc72dncTDKonwFWL649Bm8b608r
         8dTpu1UTAaMURJN04q6LWHTrHkna/S2cVsTSUkLESAWEbX8Lm0MoEE7zfsMjFeyc0QIH
         ekNuLrZLdIssT8epO+zxLc7BR3EWFZt0Zqd3rmz+s9nSsiFXcWhdwlUbjcE47A3YEFWm
         Cjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701292248; x=1701897048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wtBnMhm6OvHI+sD8xVhry5VRmxy7IqGvQG/iVuqiaCo=;
        b=eeJBa2C+NsfQXyQsytl92M4RtO2Cee5FKIuLJwSveVMm+Cx2GUed/wLX5Qzv+BdyW9
         5EEtUNSXCiaFgUBIvYNTZ6ujyCLTh70jRXlQRhRJ2w5UBfRcpCMp215P4nKbAVCLV8e8
         CDsBrUMYjddxiODhS+z3M4LEUKvetNQQXNWoijXN3POYTqayWCfRA/xluwG0wQqomdPP
         EMunAV1X69YprMZMd3Ur/1zEoM1P3zK0Tu44zCO38yvvWue9N3Kq5WGKnk1/CnduUv6R
         WsMLsrlhJp1m+jEQuOBTLrUMzRqQ1bxLBXdnFN+8pI5CWXIhslttqb9e0kYz/wJqn1Wi
         1NGg==
X-Gm-Message-State: AOJu0YwDFT/ywO5Nx7Wn4SND/vpL4Rjt/GlOuiXNqCmmF229uFoMOr19
	oxLEDCUUlOx29UO+FH/hoT6OoA==
X-Google-Smtp-Source: AGHT+IFK6ZIhfZ4JuFNWETn6u9qVaS2ig7dwVdCiT9wxAV7HwOa3SUvF1+3PBWJecliU6ZqoknkANg==
X-Received: by 2002:adf:f14c:0:b0:333:145b:dbe4 with SMTP id y12-20020adff14c000000b00333145bdbe4mr2636137wro.42.1701292248595;
        Wed, 29 Nov 2023 13:10:48 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id n14-20020a05600c500e00b0040b478da760sm3433383wmr.48.2023.11.29.13.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 13:10:48 -0800 (PST)
Message-ID: <622181e8-acd8-42e4-8a39-c75cd8862999@linaro.org>
Date: Wed, 29 Nov 2023 21:10:47 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/15] clk: qcom: gpucc-sm6375: Unregister critical
 clocks
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230717-topic-branch_aon_cleanup-v2-0-2a583460ef26@linaro.org>
 <20230717-topic-branch_aon_cleanup-v2-5-2a583460ef26@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v2-5-2a583460ef26@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/11/2023 18:59, Konrad Dybcio wrote:
> Some clocks need to be always-on, but we don't really do anything
> with them, other than calling enable() once and telling Linux they're
> enabled.
> 
> Unregister them to save a couple of bytes and, perhaps more
> importantly, allow for runtime suspend of the clock controller device,
> as CLK_IS_CRITICAL prevents the latter.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/gpucc-sm6375.c | 33 +++------------------------------
>   1 file changed, 3 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-sm6375.c b/drivers/clk/qcom/gpucc-sm6375.c
> index da24276a018e..6d85936dd441 100644
> --- a/drivers/clk/qcom/gpucc-sm6375.c
> +++ b/drivers/clk/qcom/gpucc-sm6375.c
> @@ -183,20 +183,6 @@ static struct clk_rcg2 gpucc_gx_gfx3d_clk_src = {
>   	},
>   };
>   
> -static struct clk_branch gpucc_ahb_clk = {
> -	.halt_reg = 0x1078,
> -	.halt_check = BRANCH_HALT_DELAY,
> -	.clkr = {
> -		.enable_reg = 0x1078,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gpucc_ahb_clk",
> -			.flags = CLK_IS_CRITICAL,
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};
> -
>   static struct clk_branch gpucc_cx_gfx3d_clk = {
>   	.halt_reg = 0x10a4,
>   	.halt_check = BRANCH_HALT_DELAY,
> @@ -294,20 +280,6 @@ static struct clk_branch gpucc_cxo_clk = {
>   	},
>   };
>   
> -static struct clk_branch gpucc_gx_cxo_clk = {
> -	.halt_reg = 0x1060,
> -	.halt_check = BRANCH_HALT_DELAY,
> -	.clkr = {
> -		.enable_reg = 0x1060,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gpucc_gx_cxo_clk",
> -			.flags = CLK_IS_CRITICAL,
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};
> -
>   static struct clk_branch gpucc_gx_gfx3d_clk = {
>   	.halt_reg = 0x1054,
>   	.halt_check = BRANCH_HALT_DELAY,
> @@ -381,7 +353,6 @@ static struct gdsc gpu_gx_gdsc = {
>   };
>   
>   static struct clk_regmap *gpucc_sm6375_clocks[] = {
> -	[GPU_CC_AHB_CLK] = &gpucc_ahb_clk.clkr,
>   	[GPU_CC_CX_GFX3D_CLK] = &gpucc_cx_gfx3d_clk.clkr,
>   	[GPU_CC_CX_GFX3D_SLV_CLK] = &gpucc_cx_gfx3d_slv_clk.clkr,
>   	[GPU_CC_CX_GMU_CLK] = &gpucc_cx_gmu_clk.clkr,
> @@ -389,7 +360,6 @@ static struct clk_regmap *gpucc_sm6375_clocks[] = {
>   	[GPU_CC_CXO_AON_CLK] = &gpucc_cxo_aon_clk.clkr,
>   	[GPU_CC_CXO_CLK] = &gpucc_cxo_clk.clkr,
>   	[GPU_CC_GMU_CLK_SRC] = &gpucc_gmu_clk_src.clkr,
> -	[GPU_CC_GX_CXO_CLK] = &gpucc_gx_cxo_clk.clkr,
>   	[GPU_CC_GX_GFX3D_CLK] = &gpucc_gx_gfx3d_clk.clkr,
>   	[GPU_CC_GX_GFX3D_CLK_SRC] = &gpucc_gx_gfx3d_clk_src.clkr,
>   	[GPU_CC_GX_GMU_CLK] = &gpucc_gx_gmu_clk.clkr,
> @@ -455,6 +425,9 @@ static int gpucc_sm6375_probe(struct platform_device *pdev)
>   	clk_lucid_pll_configure(&gpucc_pll0, regmap, &gpucc_pll0_config);
>   	clk_lucid_pll_configure(&gpucc_pll1, regmap, &gpucc_pll1_config);
>   
> +	qcom_branch_set_clk_en(regmap, 0x1078); /* GPUCC_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x1060); /* GPUCC_GX_CXO_CLK */
> +
>   	ret = qcom_cc_really_probe(pdev, &gpucc_sm6375_desc, regmap);
>   	pm_runtime_put(&pdev->dev);
>   
> 

I think this makes sense for a CLK_IS_CRITICAL clock - why bother 
enumerating halt regs/semantics we never use..

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

