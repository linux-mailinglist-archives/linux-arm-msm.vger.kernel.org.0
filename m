Return-Path: <linux-arm-msm+bounces-57364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1744AB0B6F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 09:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DE6F17EFA9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 07:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B9326E142;
	Fri,  9 May 2025 07:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ia5Z+O0z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr [80.12.242.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152DF26C3A7;
	Fri,  9 May 2025 07:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775093; cv=none; b=cBVNG6uN+bns0qfQcxbTwSqCW7JXgd/ZG8U6TkNM0csk0FofroC1fmCfoWSam3m3gex9cQohSET4NvTvvgzSp97uyXKzWR17lFIN8VBa88tT07EzYIZ9oaN4/xfSbgM+SEGkgKZkk0wW/ez/FLmVpS+GRPttb8T8OsZcsgQBA7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775093; c=relaxed/simple;
	bh=qLypNSLhJNhGq9cRVVEVDiHNu2AmBy9fvzi2tBbPElw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pzCLZ7I4q3JA1N7y6Y10l2wRxMCbJH/JwYqkd527+mLIOZ0sLq8H+QRq3SyQUErMUoK7yLHdO169l7nBGDNNBQKgMpg2E1UoO0PDO0cYFBuRDGwWUswp/QxmhpRc6dftt27S7ca1Zjc4HsZb/Gym9BraoKYXIUfMBRCuoFbmWAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ia5Z+O0z; arc=none smtp.client-ip=80.12.242.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id DHziu7HGDmoFgDHziuKapL; Fri, 09 May 2025 09:18:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1746775089;
	bh=SuEH7GvxkDRk49jKXAc44ciDslMSh7QDgm6oWhdU6fU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ia5Z+O0z7yTEIWAfQHuaEXxabkZurCcpM7AVnzI5nFmRtdmT+SwJn09+dVoR+5P/9
	 mJukfbve/L0RnoRj+FQgQ5TWlmCR+7G+/RVSkQyVbydwvNUk1H0/WSSWEznqjtjAx4
	 NBzm72yjYdnpdBFIoIZwmd/9H7AkuNSYDpGix5X1MWwf/9KYVCdUAaKV80P3Xhjj9q
	 Akum2BCiqJ1hnKLzPyHHU1aJoAoaJhsxY+WPiLVZA/D7nS0prpqfT/f0HVCfKfKNLd
	 1zXEmDM6fpJKbcD1sI0mQWzjG2WRn2IEYr3kbmIZ9wUSH9gEdMfSw1MCoVD4PonJCH
	 94rTxgc04kPqw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 09 May 2025 09:18:09 +0200
X-ME-IP: 90.11.132.44
Message-ID: <03dc87ba-95ae-4d7f-b4df-2138844525df@wanadoo.fr>
Date: Fri, 9 May 2025 09:18:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] extcon: adc-jack: Fix wakeup source leaks on
 device unbind
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Hans de Goede <hdegoede@redhat.com>,
 Chen-Yu Tsai <wens@csie.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250501-device-wakeup-leak-extcon-v2-0-7af77802cbea@linaro.org>
 <20250501-device-wakeup-leak-extcon-v2-1-7af77802cbea@linaro.org>
 <22aaebb7-553b-4571-8a43-58a523241082@wanadoo.fr>
 <1cd209e0-bdfa-49f0-8430-fec7e6108f35@linaro.org>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <1cd209e0-bdfa-49f0-8430-fec7e6108f35@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 09/05/2025 à 09:12, Krzysztof Kozlowski a écrit :
> On 09/05/2025 08:20, Christophe JAILLET wrote:
>>>    drivers/extcon/extcon-adc-jack.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/extcon/extcon-adc-jack.c b/drivers/extcon/extcon-adc-jack.c
>>> index 46c40d85c2ac89599ffbe7b6d11b161b295d5564..557930394abd25771799733a22121d1f8e254918 100644
>>> --- a/drivers/extcon/extcon-adc-jack.c
>>> +++ b/drivers/extcon/extcon-adc-jack.c
>>> @@ -164,6 +164,7 @@ static void adc_jack_remove(struct platform_device *pdev)
>>>    {
>>>    	struct adc_jack_data *data = platform_get_drvdata(pdev);
>>>    
>>> +	device_init_wakeup(&pdev->dev, false);
>>
>> Hi,
>>
>> Shouldn't this be:
>>
>> 	if (data->wakeup_source)
>> 		device_init_wakeup(&pdev->dev, false);
>>
>> to match how things are done in the probe?
> 
> Yes, it should. I'll fix it.
> 
> Best regards,
> Krzysztof
> 
> 

While at it, maybe also s/1/true/ in device_init_wakeup() in the probe?

CJ

