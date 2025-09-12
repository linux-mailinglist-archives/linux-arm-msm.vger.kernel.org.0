Return-Path: <linux-arm-msm+bounces-73294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 911F5B5494B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52BEC481B93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013F02EA756;
	Fri, 12 Sep 2025 10:14:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D566D2E1730;
	Fri, 12 Sep 2025 10:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672082; cv=none; b=MK6R6x+rQftmxz0DDllxY1lP2gwc/gf2wjJ0yuKtiHdrML27lSEi0XDgxF6WhzGWAq7C/ZA4JBo73rP03hAXkN3fDLDFuDWP8uHag9kCOen3OBJOF8hd1tMJXsjDU2+e/MpBWP29J628HlLLUUKALpNuCsuH9ifojCc6zJuGJrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672082; c=relaxed/simple;
	bh=Ou5Fm8Q8T6iyBhE+kvVNX3UO3Kr77TZ2uDzXvt2UVVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+eYSXbUMKLCdG72QL+MAJX+7u5F0FoZvhBzh31rmjSeMi6p+V26CsAIK4A9jiFkEvX6CQ0gzYdVwiCmKSaaQekt05me77xDwmq6CFc9YIK5d+qDQtpXrKQPfvRuZbUmwZD/hAcsFHDVbp/5w6fOQCSJlLWIYS9j+mCVGI+0JVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B8BCC4CEFF;
	Fri, 12 Sep 2025 10:14:38 +0000 (UTC)
Message-ID: <2dd858a3-5b6d-43e5-be86-1222ff982cce@nxsw.ie>
Date: Fri, 12 Sep 2025 11:14:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: camcc-sm7150: Specify Titan GDSC power
 domain as a parent to IPEx and BPS
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <ilbxHd5Mgx6B7mM9zuoCveOseTxibuVat5l3Y5QtqYOyaZNWLHlAgTM6oWPFK77aF7TEoHa6vGb40GqIJx--ng==@protonmail.internalid>
 <20250911011218.861322-5-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <20250911011218.861322-5-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2025 02:12, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM7150 camera clock controller, and it should include
> IPE0/1 and BPS ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/clk/qcom/camcc-sm7150.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/camcc-sm7150.c b/drivers/clk/qcom/camcc-sm7150.c
> index 4a3baf5d8e85..0e072ae39ec0 100644
> --- a/drivers/clk/qcom/camcc-sm7150.c
> +++ b/drivers/clk/qcom/camcc-sm7150.c
> @@ -1846,6 +1846,7 @@ static struct gdsc camcc_bps_gdsc = {
>   		.name = "camcc_bps_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &camcc_titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> @@ -1875,6 +1876,7 @@ static struct gdsc camcc_ipe_0_gdsc = {
>   		.name = "camcc_ipe_0_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &camcc_titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> @@ -1884,6 +1886,7 @@ static struct gdsc camcc_ipe_1_gdsc = {
>   		.name = "camcc_ipe_1_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &camcc_titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> --
> 2.49.0
> 
> 
Please apply a Fixes: tag
Cc: stable@vger.kernel.org

---
bod

