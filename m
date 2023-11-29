Return-Path: <linux-arm-msm+bounces-2587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EC87FE1A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 22:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E9C1282440
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 21:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAAC61664;
	Wed, 29 Nov 2023 21:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kV/3nZrt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FAB5D67
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 13:14:53 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40b472f98b1so1568715e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 13:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701292491; x=1701897291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrXYY2lU23zuZlfwWGvLQFyDFXfNY5T1gubM0hMOkP0=;
        b=kV/3nZrtIXim7T8H+5rv62fUMv1rQTPhLBD/3Isc8acCcwl7tAN/IbGSfQpCRaeIG9
         wMvhIYte02MMdFwstAlCzwAzKRIUtl7BqxUfJrhcBdQveNP2/JxEyBWhtAsZ/rM+ZlCi
         bPfcO6nNYbTr1V+KhLgkj9UbUkThs/14Ei3TqPmcpzfAiBpW9RUahGujFpobOCX3+Rzb
         JKbbJMA/Dmj1IGa5A797D9frd+gF0KRjEuqatl2pyHxjhExftdi+PfaSxVYFrHXVzlZi
         A+IDuIMPTZXFLckSH9SLQ5v0HosJGspOsXoZKHtybLmxPPxX/7Qn5EU9WfrkASSecPo/
         jw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701292491; x=1701897291;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrXYY2lU23zuZlfwWGvLQFyDFXfNY5T1gubM0hMOkP0=;
        b=RoFD5i5vzkpg1G+2DObU/inBuEbtb9gLnLNXq2ovZuTa61+SVUBIehRw+OfHOh+6ih
         E0X8KXJNcjnrpSkBIyNQR1kbs+fNmtLqfDtGsyE8+rUiAQXgV2hwMXG1G+4o0mVL6AYw
         V28Iv4OyWi0yan57432uHB4rFA1idZpfPowPXKY4G8jlD1q3ir/MoS129imU8mCnoP5a
         foT8i0bUI7un2qVCstvMVRnAk5c//AQImHUWaSx1tyb2H+ru9XV+qCzvHZ6CscTSBeFj
         FATsat5JOxNRO7qDELCH8Vddd43tYO0oT7YrbBjGcP5FJDLbyJLJAzox2/JSZ1Hhw7n7
         rdLA==
X-Gm-Message-State: AOJu0YwY+SSGldu43EKj2poIognSTTDE0Moy8ECBdmU4romOGrT0DB3d
	wO034epkNLauZhc9V5gTUg6j5w==
X-Google-Smtp-Source: AGHT+IGRcnRu1N1xTnN+KnuhwyPQ2zbQ1cfBs1AkuMyRKBLa9fu/rxRRKx3hyrPecuiaTRdyzUKC0g==
X-Received: by 2002:a05:600c:474d:b0:405:3885:490a with SMTP id w13-20020a05600c474d00b004053885490amr15194120wmo.0.1701292491583;
        Wed, 29 Nov 2023 13:14:51 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id t13-20020a05600c198d00b003feea62440bsm3374880wmq.43.2023.11.29.13.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 13:14:51 -0800 (PST)
Message-ID: <8318363a-7122-45f4-a42f-3f01b33457eb@linaro.org>
Date: Wed, 29 Nov 2023 21:14:50 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] clk: qcom: gpucc-sm6115: Unregister critical
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
 <20230717-topic-branch_aon_cleanup-v2-6-2a583460ef26@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v2-6-2a583460ef26@linaro.org>
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
>   drivers/clk/qcom/gpucc-sm6115.c | 33 +++------------------------------
>   1 file changed, 3 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-sm6115.c b/drivers/clk/qcom/gpucc-sm6115.c
> index fb71c21c9a89..93a50431aef8 100644
> --- a/drivers/clk/qcom/gpucc-sm6115.c
> +++ b/drivers/clk/qcom/gpucc-sm6115.c
> @@ -234,20 +234,6 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
>   	},
>   };
>   
> -static struct clk_branch gpu_cc_ahb_clk = {
> -	.halt_reg = 0x1078,
> -	.halt_check = BRANCH_HALT_DELAY,
> -	.clkr = {
> -		.enable_reg = 0x1078,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gpu_cc_ahb_clk",
> -			.flags = CLK_IS_CRITICAL,
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};
> -
>   static struct clk_branch gpu_cc_crc_ahb_clk = {
>   	.halt_reg = 0x107c,
>   	.halt_check = BRANCH_HALT_DELAY,
> @@ -336,20 +322,6 @@ static struct clk_branch gpu_cc_cxo_clk = {
>   	},
>   };
>   
> -static struct clk_branch gpu_cc_gx_cxo_clk = {
> -	.halt_reg = 0x1060,
> -	.halt_check = BRANCH_HALT_DELAY,
> -	.clkr = {
> -		.enable_reg = 0x1060,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gpu_cc_gx_cxo_clk",
> -			.flags = CLK_IS_CRITICAL,
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};
> -
>   static struct clk_branch gpu_cc_gx_gfx3d_clk = {
>   	.halt_reg = 0x1054,
>   	.halt_check = BRANCH_HALT_SKIP,
> @@ -418,7 +390,6 @@ static struct gdsc gpu_gx_gdsc = {
>   };
>   
>   static struct clk_regmap *gpu_cc_sm6115_clocks[] = {
> -	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
>   	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
>   	[GPU_CC_CX_GFX3D_CLK] = &gpu_cc_cx_gfx3d_clk.clkr,
>   	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
> @@ -426,7 +397,6 @@ static struct clk_regmap *gpu_cc_sm6115_clocks[] = {
>   	[GPU_CC_CXO_AON_CLK] = &gpu_cc_cxo_aon_clk.clkr,
>   	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
>   	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
> -	[GPU_CC_GX_CXO_CLK] = &gpu_cc_gx_cxo_clk.clkr,

OTOH.

Seems a pity to remove these clocks - generally for the series I mean - 
from the debug view in /sys/kernel/debug/clk_summary.

In the ideal case we have pm runtime functional without dropping these 
clocks from the view in /sys/kernel/debug/clk_summary.

Certainly I've found that interface useful when launching a real 
product. It might be confusing to _not_ see the always-on clocks 
enumerated there.

---
bod

