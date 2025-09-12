Return-Path: <linux-arm-msm+bounces-73295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAC2B54966
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EECAD3BE1A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0E3226D1D;
	Fri, 12 Sep 2025 10:15:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF2B220F24;
	Fri, 12 Sep 2025 10:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672132; cv=none; b=hyoCWo8iaSyktAFaZ5/OrxpY5dc3CQaHI/qGW7WpcJ4wwS/vDI4y1Caqq96gMcmx0ojeIShnPw4zacR/CCha0m/aZgOdRy5KOQ0DT3dKps6RQCe8Q/x9FTkW05goJncFgwSFeRR/u8b4umfauDz60bKhjllGh2vm+wb3e+W0OQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672132; c=relaxed/simple;
	bh=2Y80fMR26x8bweDkrQJVwiJPBEae/A/iyAZox+5+Tr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PRYdE3NbGh5+AWkGRrJ7NvkY+OLXJ2RHlj0NxPR+x+LwqdCiYYjA2myZAVGmia/ObZUILyhKOCHln+3wHtI9Z66bVl+4RmiLqjHt6g0PdjvyXcZTxwHSkZQZhPYrAnsf+FkCvEv/zKhpyd2t04aL1qYd4ztcpUuvUAW3z89vRjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7604EC4CEF1;
	Fri, 12 Sep 2025 10:15:28 +0000 (UTC)
Message-ID: <7afa7533-9492-451f-b0da-b5a3fc5b2b04@nxsw.ie>
Date: Fri, 12 Sep 2025 11:15:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] clk: qcom: camcc-sm8250: Specify Titan GDSC power
 domain as a parent to IPE/BPS/SBI
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <EDYBvjOqgTpow_wXS7OI2pQc1SsU8PkAr-9ePdI7nBZpA4IYddblRSlO79_d9LsohI_hJs2UrWI6CTt8yh8TMA==@protonmail.internalid>
 <20250911011218.861322-6-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <20250911011218.861322-6-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2025 02:12, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM8250 camera clock controller, and it should include
> IPE, BPS and SBI ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/clk/qcom/camcc-sm8250.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
> index 6da89c49ba3d..c95a00628630 100644
> --- a/drivers/clk/qcom/camcc-sm8250.c
> +++ b/drivers/clk/qcom/camcc-sm8250.c
> @@ -2213,6 +2213,7 @@ static struct gdsc bps_gdsc = {
>   		.name = "bps_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> @@ -2222,6 +2223,7 @@ static struct gdsc ipe_0_gdsc = {
>   		.name = "ipe_0_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> @@ -2231,6 +2233,7 @@ static struct gdsc sbi_gdsc = {
>   		.name = "sbi_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> --
> 2.49.0
> 
> 

Please fix the commit log per Bjorn's feedback

Apply a Fixes: tag
Cc: stable@vger.kernel.org

Then you may add

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
bod

