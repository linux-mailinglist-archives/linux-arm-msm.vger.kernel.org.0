Return-Path: <linux-arm-msm+bounces-73296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0158B5496E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 628B1586E6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1582F658F;
	Fri, 12 Sep 2025 10:16:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF83A2F6563;
	Fri, 12 Sep 2025 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672189; cv=none; b=ZLbPa8MKC9w2FwKz/UfrZIS1TFLIbtvr/VmJsnxPnL+Xm1c1p7df6xSdqopBmXqxLcKL+LiluSVnH36QDOH5LvwQ9aftAIMuym+kuvBvKwo/zTUxzfsvBx4BkMMEL8XLvIClOox7FRSirdBcO2+rOI/EkNFhOgPPoipN3B4jA84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672189; c=relaxed/simple;
	bh=b5bk2lcG87ekd48OY9uydwAqCA6ChZfJcEAbOO9qhaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rHizsTaHjb5Mm4QsH1vcLddVGIh7Be5+fY/WCdgaVNx0X9IB+n4m8rw0XxK+Knuik4eBYBGzohcLzg+fxtjVOCsNid0uVMUhFIVc7MCkulFQnb4NSMarl5G+DTSnKNVPTPHycwxisA7roVuhy8JY1kkAkxzKb/5j/Wspz4gGVVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB1DC4CEF1;
	Fri, 12 Sep 2025 10:16:26 +0000 (UTC)
Message-ID: <cdd90f0d-81fc-47be-93f4-e6397ae46299@nxsw.ie>
Date: Fri, 12 Sep 2025 11:16:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] clk: qcom: camcc-sm8450: Specify Titan GDSC power
 domain as a parent to IPE/BPS/SBI
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <kv2Hw3iDLRb2Jc-HWg7CO2YkpOrCHH9X6PduKiW9Nq5NafOS4QvXbquj8UEX8aqEXrpbFfR6y4-e4SbyWKo2UA==@protonmail.internalid>
 <20250911011218.861322-7-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <20250911011218.861322-7-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2025 02:12, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SD8450 camera clock controller, and it should include
> IPE, BPS and SBI ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/clk/qcom/camcc-sm8450.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
> index 4dd8be8cc988..ef8cf54d0eed 100644
> --- a/drivers/clk/qcom/camcc-sm8450.c
> +++ b/drivers/clk/qcom/camcc-sm8450.c
> @@ -2935,6 +2935,7 @@ static struct gdsc bps_gdsc = {
>   		.name = "bps_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> @@ -2944,6 +2945,7 @@ static struct gdsc ipe_0_gdsc = {
>   		.name = "ipe_0_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> @@ -2953,6 +2955,7 @@ static struct gdsc sbi_gdsc = {
>   		.name = "sbi_gdsc",
>   	},
>   	.flags = POLL_CFG_GDSCR,
> +	.parent = &titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> --
> 2.49.0
> 
> 

Please fix the commit log per Bjorn's feedback, I've given a commit log 
you might want to use.

Apply a Fixes: tag
Cc: stable@vger.kernel.org

Then you may add

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

