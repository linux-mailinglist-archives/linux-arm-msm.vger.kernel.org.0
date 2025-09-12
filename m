Return-Path: <linux-arm-msm+bounces-73198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9E6B54027
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 04:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DD12168082
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 02:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB44B19D07A;
	Fri, 12 Sep 2025 02:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWWu+0iG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30C854758;
	Fri, 12 Sep 2025 02:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757642949; cv=none; b=Fok80wXzA0Z4wVvYXzF4t0a4BmPt/Sp4iMr6clAHB0+j25AeelrMrhq+U3bJUYZH1lzOlz5tzigm/A7rrDWoqboKTrS6PHspBeD4xCD3anxyr4OkTUx/6S4YpODf2msgkEIFy2tWEBvAICk6ZzNBYafa5h8D47bA+JsGk+gcncc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757642949; c=relaxed/simple;
	bh=WbERhCfF7cnyyxYvEUH8SjkZ6cPUaFauA4lK0z2wk7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpXxL+rFD6YkdVHGsuwv50M9AgjwwXIncTt7AMC02fWMM4j6oASTiY1pJsyaxvBvbe50BG2nMkQLz3T6FckRxjKxzXIczqDv+jhYXbifwxZ4HdQBsYudK6SKebQqwKetdoadatTz3uPVro6FR8T2kiiEwYpi8EVihhfHPWAKPmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWWu+0iG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F114C4CEF0;
	Fri, 12 Sep 2025 02:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757642949;
	bh=WbERhCfF7cnyyxYvEUH8SjkZ6cPUaFauA4lK0z2wk7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tWWu+0iGVM87c+vcVBdrmu2U91nGZx3jYlnSoCRwrbtkUM1YhOZW2cnQG2a7x2uou
	 tGWgrVkEFy7qekKRJKtF27NbxKRZKxDRax89WKzkrZHeMq7dy61qD8YrfEUdYrKwYo
	 4AN5dbNpl2Fe2gpQX9zSLKXIZrffw7j3gUT9Us6u+z1z9z2eUYbEdo6C776NaaCbD0
	 v5kALbDITPZDM2ELe/ZBrYZvqTagh8ux9NDFTkMeCAzJpuUdXsUbNipE4kaGrBZVNP
	 YiBdGEUmCNDE42OaDLrptbRZp4L3//OLje1XOlHjvQIesZ0YyjncX2c5V44Zz0iz24
	 sGUYU1Q9p2TVw==
Date: Thu, 11 Sep 2025 21:09:06 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/6] clk: qcom: camcc-sm8550: Specify Titan GDSC power
 domain as a parent to other
Message-ID: <bsjcwbwvvw4eov4aaf4xk2bes4p4wsxvb53rsxkwhgd7bk44ix@wnbvksy6m3li>
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911011218.861322-2-vladimir.zapolskiy@linaro.org>

On Thu, Sep 11, 2025 at 04:12:13AM +0300, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM8550 camera clock controller to enforce a correct
> sequence of enabling and disabling power domains by the consumers.
> 

I don't understand which problem you're solving.

Are these GDSCs children of the titan_top and your patch is describing
that so that when a client is enabling any one of them they will be
enabled in order?

Are you correcting the description of the hardware? Or is this a hack to
trick the system into performing the operations in order?


Please start your commit message with a problem description, then a
description of your solution.

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

Regards,
Bjorn

> Fixes: ccc4e6a061a2 ("clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sm8550.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/qcom/camcc-sm8550.c b/drivers/clk/qcom/camcc-sm8550.c
> index 63aed9e4c362..b8ece8a57a8a 100644
> --- a/drivers/clk/qcom/camcc-sm8550.c
> +++ b/drivers/clk/qcom/camcc-sm8550.c
> @@ -3204,6 +3204,8 @@ static struct clk_branch cam_cc_sfe_1_fast_ahb_clk = {
>  	},
>  };
>  
> +static struct gdsc cam_cc_titan_top_gdsc;
> +
>  static struct gdsc cam_cc_bps_gdsc = {
>  	.gdscr = 0x10004,
>  	.en_rest_wait_val = 0x2,
> @@ -3213,6 +3215,7 @@ static struct gdsc cam_cc_bps_gdsc = {
>  		.name = "cam_cc_bps_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>  	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>  };
>  
> @@ -3225,6 +3228,7 @@ static struct gdsc cam_cc_ife_0_gdsc = {
>  		.name = "cam_cc_ife_0_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>  	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>  };
>  
> @@ -3237,6 +3241,7 @@ static struct gdsc cam_cc_ife_1_gdsc = {
>  		.name = "cam_cc_ife_1_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>  	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>  };
>  
> @@ -3249,6 +3254,7 @@ static struct gdsc cam_cc_ife_2_gdsc = {
>  		.name = "cam_cc_ife_2_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>  	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>  };
>  
> @@ -3261,6 +3267,7 @@ static struct gdsc cam_cc_ipe_0_gdsc = {
>  		.name = "cam_cc_ipe_0_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>  	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>  };
>  
> @@ -3273,6 +3280,7 @@ static struct gdsc cam_cc_sbi_gdsc = {
>  		.name = "cam_cc_sbi_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>  	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>  };
>  
> @@ -3285,6 +3293,7 @@ static struct gdsc cam_cc_sfe_0_gdsc = {
>  		.name = "cam_cc_sfe_0_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>  	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>  };
>  
> @@ -3297,6 +3306,7 @@ static struct gdsc cam_cc_sfe_1_gdsc = {
>  		.name = "cam_cc_sfe_1_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
>  	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>  };
>  
> -- 
> 2.49.0
> 

