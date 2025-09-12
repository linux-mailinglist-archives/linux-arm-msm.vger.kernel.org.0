Return-Path: <linux-arm-msm+bounces-73293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C21B54943
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EADB1CC35F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F9F2E9EDA;
	Fri, 12 Sep 2025 10:14:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157D42E62B4;
	Fri, 12 Sep 2025 10:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672070; cv=none; b=VuM5Bi1MGlDI5isgfHWhTQXY2hlO72pq2sTepKXxvZRUOVoq4AzAR/J/QJRykwfZxqUMvVTtO3O/fusbYmTU4q8X2g7CC65fA93xnrw1B1Z3y/Tt4DjTOSNEiBjblC/BmeaN5vokEepvE4J0B2O9JQbxSGMAxwWFQYR/20kYL7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672070; c=relaxed/simple;
	bh=zZKNblX7phaqHucaD34egGjLJwYF2GdYlO3PloYGjAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gkc4YXAo7KC1h9QlwDf/6SKfstgoep7clZmtl7aYQePOu1VpEDxp+6te8q8A/Wd1NnZReiSu+r1V1agB3WEWvB7lLfd6PrHUk04/zxK2p49fbIWlQ2Vj0R/pa4M7nc72EPK0oOLggQfZ+e0aoY+6XpsGnp0Jqiv9n4aLTmMU1D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1C0C4CEF1;
	Fri, 12 Sep 2025 10:14:24 +0000 (UTC)
Message-ID: <563e69dc-ce3c-4208-8a33-468d51198bd4@nxsw.ie>
Date: Fri, 12 Sep 2025 11:14:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: camcc-sdm845: Specify Titan GDSC power
 domain as a parent to other
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <QzAPOBSJJ2DSDLJ71RGr_7pAbeHb7IIdtAj1wpI5h7rfCYIQw13c4RjvXdAy3N0lrJdhgkyQJYIRS4Pc7_di3w==@protonmail.internalid>
 <20250911011218.861322-4-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <20250911011218.861322-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2025 02:12, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SDM845 camera clock controller, and it should include
> IPE0/1 and BPS ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/clk/qcom/camcc-sdm845.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
> index cf60e8dd292a..fb313da7165b 100644
> --- a/drivers/clk/qcom/camcc-sdm845.c
> +++ b/drivers/clk/qcom/camcc-sdm845.c
> @@ -1543,6 +1543,7 @@ static struct gdsc bps_gdsc = {
>   		.name = "bps_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> @@ -1552,6 +1553,7 @@ static struct gdsc ipe_0_gdsc = {
>   		.name = "ipe_0_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> @@ -1561,6 +1563,7 @@ static struct gdsc ipe_1_gdsc = {
>   		.name = "ipe_1_gdsc",
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

Please apply a Fixes: tag
Cc: stable@vger.kernel.org

---
bod

