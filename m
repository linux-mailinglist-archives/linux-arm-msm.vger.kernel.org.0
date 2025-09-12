Return-Path: <linux-arm-msm+bounces-73287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD930B5489C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 320631C2467F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C972DECCD;
	Fri, 12 Sep 2025 10:02:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2675F2DE70C;
	Fri, 12 Sep 2025 10:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671370; cv=none; b=rc8y5QHujABJHrBNJB2LLAocoABDTMo1UNEA5tTH8GhXikyorYDxewU1lAYDh4QBNGLNr0YVx/UkhibVyTqDBsgGeiWhp/U1SpLEKSkQVrfDWpF4rZMI8P5fdwHXKCTNLtsqvOkvEyar9mGM5Hil8b9LiMMeFZ37KPTVgyt4mjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671370; c=relaxed/simple;
	bh=sQFQcrQTN5qfuaG5GWjTYlqSJlQc5PoTM+A5IJ2l1T8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JAhbKkBksZrNc097atmQ1HVf2uRcfLViT1y1ThmTvdwwnQtzq5sLuut5UMu7HLBXeS7tXQ7NxH33jKLq0UEzsSDGjYnKyTLoZM/I8xnbzdRT/EHPG/2j61HVTHia3zVlDIgee/RVY35cWqm/1Gvi8w2VnLQsy4eHH7/KgvrlEIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8867CC4CEF1;
	Fri, 12 Sep 2025 10:02:46 +0000 (UTC)
Message-ID: <41f41d4f-05b2-4734-9629-9204d24caf02@nxsw.ie>
Date: Fri, 12 Sep 2025 11:02:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] clk: qcom: camcc-sm8550: Specify Titan GDSC power
 domain as a parent to other
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <1KEJg6q_Lyb1uNUEpVmes9JfWc0wXho8mWhy3CLBlGZ5c13Ow_93Og373zA1QW2GtVvJprzuwLTuM2qCmWICPg==@protonmail.internalid>
 <20250911011218.861322-2-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <20250911011218.861322-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2025 02:12, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM8550 camera clock controller to enforce a correct
> sequence of enabling and disabling power domains by the consumers.

Suggest:

Titan GDSC is the parent power domain of all other GDSCs in the CAMCC 
block. Mark it as such.

> Fixes: ccc4e6a061a2 ("clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/clk/qcom/camcc-sm8550.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/qcom/camcc-sm8550.c b/drivers/clk/qcom/camcc-sm8550.c
> index 63aed9e4c362..b8ece8a57a8a 100644
> --- a/drivers/clk/qcom/camcc-sm8550.c
> +++ b/drivers/clk/qcom/camcc-sm8550.c
> @@ -3204,6 +3204,8 @@ static struct clk_branch cam_cc_sfe_1_fast_ahb_clk = {
>   	},
>   };
> 
> +static struct gdsc cam_cc_titan_top_gdsc;
> +
>   static struct gdsc cam_cc_bps_gdsc = {
>   	.gdscr = 0x10004,
>   	.en_rest_wait_val = 0x2,
> @@ -3213,6 +3215,7 @@ static struct gdsc cam_cc_bps_gdsc = {
>   		.name = "cam_cc_bps_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>   };
> 
> @@ -3225,6 +3228,7 @@ static struct gdsc cam_cc_ife_0_gdsc = {
>   		.name = "cam_cc_ife_0_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>   };
> 
> @@ -3237,6 +3241,7 @@ static struct gdsc cam_cc_ife_1_gdsc = {
>   		.name = "cam_cc_ife_1_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>   };
> 
> @@ -3249,6 +3254,7 @@ static struct gdsc cam_cc_ife_2_gdsc = {
>   		.name = "cam_cc_ife_2_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>   };
> 
> @@ -3261,6 +3267,7 @@ static struct gdsc cam_cc_ipe_0_gdsc = {
>   		.name = "cam_cc_ipe_0_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>   };
> 
> @@ -3273,6 +3280,7 @@ static struct gdsc cam_cc_sbi_gdsc = {
>   		.name = "cam_cc_sbi_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>   };
> 
> @@ -3285,6 +3293,7 @@ static struct gdsc cam_cc_sfe_0_gdsc = {
>   		.name = "cam_cc_sfe_0_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>   };
> 
> @@ -3297,6 +3306,7 @@ static struct gdsc cam_cc_sfe_1_gdsc = {
>   		.name = "cam_cc_sfe_1_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>   };
> 
> --
> 2.49.0
> 
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

