Return-Path: <linux-arm-msm+bounces-30218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C535965DD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 12:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 308BC282F45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 10:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7176716D9A7;
	Fri, 30 Aug 2024 10:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPZjGCog"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D3C165EF0;
	Fri, 30 Aug 2024 10:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012207; cv=none; b=GzTNLgJTGJCiauKGEFDbyA+alBZuw0kUaL5ceC44C94Rb3GYi7uivbaLhDB6FT07xBEjaIaEkAlPEiby2NJkZLWDTgGky21896CYcu6nEmWCwmK6eIFlL71JXUJRm1cCmZW6q8JFOxEpErlf0a4ljm6k18mqWSevSFkj1t0CrAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012207; c=relaxed/simple;
	bh=BkechsmIXgVScuoRGAScxHxOdTX6dTyDCGjnf6gIoJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LbTlwmkV6nrhJmesC+EP3XmXRo4Wc+GU6NIDvub9Qvt/CgGBC7nq+vqcWn63jq8BKY5xlFYAW6D8uAI1TLt33YyYBlvm7i20Sjm5JJf5wirAf/z7cN1i733x1i6CYstsEGlSq+ATgrQSvZyFOoWOhxpM/YRvl3NMjzfJUdIJ36U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPZjGCog; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FCFC4CEC4;
	Fri, 30 Aug 2024 10:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725012206;
	bh=BkechsmIXgVScuoRGAScxHxOdTX6dTyDCGjnf6gIoJs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mPZjGCogiLvh3qpt9o+63/whKj5YExM+hmv3Oqyyixwl21QfKSt/1PacycnnviTGM
	 97mxFXmwYnSAV/rC26NUCLDnxSCnF5rVCg9AiQDEB9CNNGeL+7olE4Hly4vVixsqgq
	 LxGPgV4HZ+T5l/nASMQO40IyapkwgmJHV7FNzGz+j0I0Uq998U/rF/4WSzbSjj7Orc
	 0grdXTpyoeJeYO2x5EzKiS4WHM623aB6tpKt9F51vyZ+Lmc2XJ0cceD+fTX1S2PFrQ
	 PHtww3FU87xaqNJtnteI9KfGwJFrsm4HSnJP3HV4D2IKVW17t5/JuFCKDnYcQBD56a
	 5wRk6Uq3zYErg==
Message-ID: <10fad15b-d2a6-4ec1-8af7-bde8f7bf39be@kernel.org>
Date: Fri, 30 Aug 2024 12:03:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: qcom: pbs: Simplify with dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>, Yu Jiaoliang
 <yujiaoliang@vivo.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com, Dan Carpenter <dan.carpenter@linaro.org>
References: <20240829124813.3264437-1-yujiaoliang@vivo.com>
 <894145dc-46fb-451f-a461-d0b9ff1e50dd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <894145dc-46fb-451f-a461-d0b9ff1e50dd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.08.2024 10:08 AM, Krzysztof Kozlowski wrote:
> On 29/08/2024 14:48, Yu Jiaoliang wrote:
>> Error handling in probe() can be a bit simpler with dev_err_probe().
>>
>> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
>> ---
>>  drivers/soc/qcom/qcom-pbs.c | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/qcom-pbs.c b/drivers/soc/qcom/qcom-pbs.c
>> index 77a70d3d0d0b..ab9de12ec901 100644
>> --- a/drivers/soc/qcom/qcom-pbs.c
>> +++ b/drivers/soc/qcom/qcom-pbs.c
>> @@ -201,10 +201,9 @@ static int qcom_pbs_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	ret = device_property_read_u32(pbs->dev, "reg", &val);
>> -	if (ret < 0) {
>> -		dev_err(pbs->dev, "Couldn't find reg, ret = %d\n", ret);
>> -		return ret;
>> -	}
>> +	if (ret < 0)
>> +		return dev_err_probe(pbs->dev, ret, "Couldn't find reg\n");
> 
> This cannot defer, so not much benefits. And you ignore other place in
> the probe()... That's like a weird pattern with all your patches change
> something irrelevant, but leave other places unchanged.
> 
> That's pointless and churn.

Hm, that's a good point.. Maybe the static checker folks could come up
with a way that would find functions that call something that can defer
at one point or another and suggest (not) using dev_err_probe with W=1/2..
(although that is probably not going to be very high prio given all the
other static checker issues we're still yet to resolve)

Unless we have something like that already? +CC Dan

Konrad

