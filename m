Return-Path: <linux-arm-msm+bounces-30245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC58965FBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 12:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 148DF1F22174
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 10:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643FA18FDC5;
	Fri, 30 Aug 2024 10:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyULD8XN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4CF18FDAB;
	Fri, 30 Aug 2024 10:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725015463; cv=none; b=SVAvaCt+c0OyPqa0SULLt8sIEILjjF5ne5v82BAsAbB85WTO7oqEt+1z46c+kpQTdnFM6JLz1mNz90hyYzrRGDtsgY1N1deYUhkzUXQspsvFh8UCOlSp84yucMHX/ID+78KBZq+f+dLs/zEskCbePOVZJPGhjmO2+4ByMidrlbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725015463; c=relaxed/simple;
	bh=QPCh73MIzsRMp5X5kkNuR5+8HEgvyLIfQtr8PVQNfrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rfso4vs7dJeZ0KHj++kSJ0kX5XbtgsKsNCWkmoNMxKwAff4nDg4ATaTqUycjo2ppvA0CldKiY0V00BT2lEF+r3oZ7dhxNwNN1sJ5bzp2Xf7X6x4Zh48XQ4W1c3HbZyInnn0rGjg9h+0hBdBUoHPl0cdifjQQ2tV7OZS6qRdK5CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyULD8XN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1C6C4CEC2;
	Fri, 30 Aug 2024 10:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725015462;
	bh=QPCh73MIzsRMp5X5kkNuR5+8HEgvyLIfQtr8PVQNfrI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nyULD8XN9KhFmHcY6IhmQJ/cgW8RQJqf5i0mFy0WuY/2gz3EavGK/PSGDNuVdOaQF
	 y7sMc9OrxoIaC41y7afx2/hVAckafh0xZV4F7B/8bdrG0KdceX1M+IphTTLaAg5Rff
	 mkju/xoZyXpJ71GJo+EjKXRW/uTAHZ85V/yu2oRtLwKvbuyo1gAlEdCqSG0YepN3HU
	 rEfQP5QDvdlI5a7BO9RQVZIOKeIBND95oyGLZEh11ZW4j5X24ZVvzc2vXJJrbio9wU
	 /99BqBU+riVyihJY4eS9zvgtyseRF6RDMdZbZlooUpYLl4ET6tBzd/qQfomzaSEC/p
	 R8VcDsjDe9aNw==
Message-ID: <f7b8980b-b5e8-41c3-8e4c-488e06a4ab15@kernel.org>
Date: Fri, 30 Aug 2024 12:57:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: qcom: pbs: Simplify with dev_err_probe()
To: =?UTF-8?B?5LqO5L286Imv?= <yujiaoliang@vivo.com>
Cc: "opensource.kernel" <opensource.kernel@vivo.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240829124813.3264437-1-yujiaoliang@vivo.com>
 <894145dc-46fb-451f-a461-d0b9ff1e50dd@kernel.org>
 <5c558e3b-2d65-4045-816a-5e9415d26b8d@vivo.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <5c558e3b-2d65-4045-816a-5e9415d26b8d@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/08/2024 12:52, 于佼良 wrote:
> On 2024/8/30 16:08, Krzysztof Kozlowski wrote:
>> On 29/08/2024 14:48, Yu Jiaoliang wrote:
>>> Error handling in probe() can be a bit simpler with dev_err_probe().
>>>
>>> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
>>> ---
>>>   drivers/soc/qcom/qcom-pbs.c | 7 +++----
>>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/soc/qcom/qcom-pbs.c b/drivers/soc/qcom/qcom-pbs.c
>>> index 77a70d3d0d0b..ab9de12ec901 100644
>>> --- a/drivers/soc/qcom/qcom-pbs.c
>>> +++ b/drivers/soc/qcom/qcom-pbs.c
>>> @@ -201,10 +201,9 @@ static int qcom_pbs_probe(struct platform_device *pdev)
>>>   	}
>>>   
>>>   	ret = device_property_read_u32(pbs->dev, "reg", &val);
>>> -	if (ret < 0) {
>>> -		dev_err(pbs->dev, "Couldn't find reg, ret = %d\n", ret);
>>> -		return ret;
>>> -	}
>>> +	if (ret < 0)
>>> +		return dev_err_probe(pbs->dev, ret, "Couldn't find reg\n");
> Thank you for the feedback. I apologize for the oversight.
>> This cannot defer, so not much benefits.
> As noted in the dev_err_probe documentation, using this helper offers 
> benefits like standardized error code formatting and more compact error 
> paths.
> 
> "Using this helper in your probe function is totally fine even if @err  
> known to nerver be -EPROBE_DEFER. The benefit compared to a normal 
> dev_err() is the standardized format of the error code, it being emitted 
> syumbolically (i.e. you get "EAGAIN" instead of "-35") and the fact that 
> the error code is returned which allows more compact error paths."

I know, I wrote a bit of patches for the kernel myself...

It's still for me little benefit.


>> And you ignore other place in
>> the probe()... That's like a weird pattern with all your patches change
>> something irrelevant, but leave other places unchanged.
> If you think it's OK, I will update the patch to include both 
> modifications in the probe() function. I plan to submit patch v2 with 
> these changes and hope it will be more acceptable.

Doing this one-by-one is churn. For me that's not correct.

Changing this everywhere in the driver is questionable/subjective: some
find it ok, some not (considering this cannot defer).

But, after looking at your other patches like this (see serial), I have
doubts you know what you are doing in general. And that's the real
problem. You send innocent patch which requires a serious review,
because you do not understand the code.

Please get a mentor which will guide you through this. Or do some more
impactful changes like fixing warnings.

Best regards,
Krzysztof


