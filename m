Return-Path: <linux-arm-msm+bounces-69426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A394CB28BF6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 10:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE0821C87177
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 08:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BA423A562;
	Sat, 16 Aug 2025 08:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XsO0AeG4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5FE238C1E
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 08:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755333641; cv=none; b=kkSSVvXcydzDkZFiSimoq77gPlOdIdPP5aNYZrOM5roLmg90yJa5qaK6+l5evt0SmsrxrqLbvfKr2DJ3qq2AJ0AYQ4IC1MpLM7yRjZYU6ZhmZTKc5fKvMT5w0+KN63373RuJ4j0mNh7Tlqf8HNlajnWyAiKe6bVHdGgc6TTBi4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755333641; c=relaxed/simple;
	bh=+nyBYhn8EVJUVicrJiULxaDWYjj5D8eBw/Z0c2ikZx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RS9CfhfQ+/zGjGkAE3wP+E987py0VBAFY3VCdFaqlrZ61waLOpg7M6czbSZmZ8mM0NXzAEJAdob/2omnopalBhuWOrAcDBicOyyPJ5SMkDHnoVSn7KA+C6F8mSXYvxnRHzvhD2kTryFUmYwrTFja1IvBt3OQaJ+B987qMWOvv94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XsO0AeG4; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb7a5cff3so40850366b.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 01:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755333636; x=1755938436; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F/l+KZ/7BYHbQKPotBrKwjmieFaPg4+hOagx5GhBXek=;
        b=XsO0AeG4kPxa67egKDC1ElRMNlVseLkXNhNuZe39uE0gVcl9pxlPyAFp0V+ZLNGOps
         7pfxktUxUWIfuUu/cbIsXLpkwQ2DcgzBYjow3ikIzC9JOrXU+8nUnRzuihtLSRghN4jw
         zrZEREfMjfcwcxnN1SAmQ7Zv916T+8ZlwbRDnLVSce5BULgDq21MtqfuYsGDHXBaJfYr
         XLwsnPfbPw6qe0u19MXhbXEM4VkIngIp5ykynJkDv/nLTSec34H0JdSyLnwJI0nHzE2D
         MZDmhgTf0cBhIpgoQWQiuJuNyTrA2QS+RpHBsQ5qu4lY1yYAYV9Tushq02ZfKbrlED5/
         Oa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755333636; x=1755938436;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/l+KZ/7BYHbQKPotBrKwjmieFaPg4+hOagx5GhBXek=;
        b=koxj1WYFv4RSYL4G7ukdbAybYY7eRUYAdeVaAgn0fy8iuetvuMoUP52rxEBdkl2S2A
         UqBqcNh7cC7y+l+oGvhTtF96D63kvd70TnC7rGf70B/cl6RWUN6woq2fqdaPC1kI3d8O
         FKRiT6d1Aw8e9ykWx8v4J5COeqdxxtKyjFeL2aM22Q2pjHpzXnieFfVbYyz+aHTRzGBq
         +msQFYuZlA1SAwIufNCoXMCClLMOflluWDNSAGKChL/Y2ua81dSIIcHqV0QL1mfryCxT
         jFkib0eI0rBs/x7pul3kd4d1LIEOgTSN6vuHuGXjF1LZ0Mj1ZsAdVWpq0qbDcwe/nzWn
         wDOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHGtOZbiVlh6R9SvsJ/Dc7DKLtl4lu89d64rUfqjq/og8GjavR/uBWPiEij3Uw3SBGF/S0HmFTpkvL8I/8@vger.kernel.org
X-Gm-Message-State: AOJu0YwUw1hKY9XHxfmZJk8f37JaKIGqbRm0l5V7NlcWzeqxII49QS+Q
	V+PAlgfcfPCFzM72WzonEdGFK3oufUVYTe3solnSYt8+Xl6Lxb64JE5p3zJARQe6Sj8=
X-Gm-Gg: ASbGncuXy07U8vZDjVlC2CMit4ATeL1h7k01chVo5Ns2nYOFZeqRNXeqjnDYRFbG3ti
	iNs6PfAZWDM7MXlyD+BoJNqhFaix+Qlg7OGQ74oJR1YvOR877324orenMDqEE9J6HgKVQpBcfHG
	Up4L7pJjmNT22B4VDBqbAElfvPLT/3HF/DjNAHP5RnrbBx6d6eUaepceLyjt615aXgIZHuMR6ff
	/RVOjAoRk0KbKQUff02AhqrU7SvKFwjKGKvn/OaClS6rLviztU6AmSwYmkUHBULB56BgDGVsuJx
	lg8soScTmQc0fV1uSoM1Z7sOQwrUcQ27ATUZ1GWIITgqxuT5i/ahTyn49pRiNCSpiyUpix6qQb4
	Kr9+0CoLmOFLph5Ih7RomMqk1yb6s2QxZeTKt5L9blZ8=
X-Google-Smtp-Source: AGHT+IEUWPix12tYXIkNxiBUpB3rv7hl8dAmfhGPQnbSvib0NIVN2ojKsm5Asba9NVT8V172giODpw==
X-Received: by 2002:a17:907:9627:b0:af9:a9ea:f42f with SMTP id a640c23a62f3a-afcdc1f4d0emr205463366b.9.1755333635915;
        Sat, 16 Aug 2025 01:40:35 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce9ed8fsm339015466b.53.2025.08.16.01.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 01:40:35 -0700 (PDT)
Message-ID: <ddadd8cb-9738-4540-8c37-98e3aa93012f@linaro.org>
Date: Sat, 16 Aug 2025 10:40:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: icc-bwmon: Fix handling dev_pm_opp_find_bw_*()
 errors
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
References: <20250814063256.10281-2-krzysztof.kozlowski@linaro.org>
 <e35ca54c-252f-45c4-bfdf-fd943f833bc4@oss.qualcomm.com>
 <f2400037-c39c-4266-9e77-b084bd5f9395@linaro.org>
 <213ce041-733e-4e3e-87d5-db0b37c410b4@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <213ce041-733e-4e3e-87d5-db0b37c410b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2025 13:27, Konrad Dybcio wrote:
> On 8/14/25 1:25 PM, Krzysztof Kozlowski wrote:
>> On 14/08/2025 11:15, Konrad Dybcio wrote:
>>> On 8/14/25 8:32 AM, Krzysztof Kozlowski wrote:
>>>> The ISR calls dev_pm_opp_find_bw_ceil(), which can return EINVAL, ERANGE
>>>> or ENODEV, and if that one fails with ERANGE, then it tries again with
>>>> floor dev_pm_opp_find_bw_floor().
>>>>
>>>> Code misses error checks for two cases:
>>>> 1. First dev_pm_opp_find_bw_ceil() failed with error different than
>>>>    ERANGE,
>>>> 2. Any error from second dev_pm_opp_find_bw_floor().
>>>>
>>>> In an unlikely case these error happened, the code would further
>>>> dereference the ERR pointer.  Close that possibility and make the code
>>>> more obvious that all errors are correctly handled.
>>>>
>>>> Reported by Smatch:
>>>>   icc-bwmon.c:693 bwmon_intr_thread() error: 'target_opp' dereferencing possible ERR_PTR()
>>>>
>>>> Fixes: b9c2ae6cac40 ("soc: qcom: icc-bwmon: Add bandwidth monitoring driver")
>>>> Cc: <stable@vger.kernel.org>
>>>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>>> Closes: https://lore.kernel.org/r/aJTNEQsRFjrFknG9@stanley.mountain/
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>
>>>> ---
>>>>
>>>> Some unreleased smatch, though, because I cannot reproduce the warning,
>>>> but I imagine Dan keeps the tastiests reports for later. :)
>>>> ---
>>>>  drivers/soc/qcom/icc-bwmon.c | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
>>>> index 3dfa448bf8cf..597f9025e422 100644
>>>> --- a/drivers/soc/qcom/icc-bwmon.c
>>>> +++ b/drivers/soc/qcom/icc-bwmon.c
>>>> @@ -656,6 +656,9 @@ static irqreturn_t bwmon_intr_thread(int irq, void *dev_id)
>>>>  	if (IS_ERR(target_opp) && PTR_ERR(target_opp) == -ERANGE)
>>>>  		target_opp = dev_pm_opp_find_bw_floor(bwmon->dev, &bw_kbps, 0);
>>>>  
>>>> +	if (IS_ERR(target_opp))
>>>> +		return IRQ_HANDLED;
>>>
>>> So the thunk above checks for a ceil freq relative to bw_kbps and then
>>> if it doesn't exist, for a floor one
>>>
>>> Meaning essentially if we fall into this branch, there's no OPPs in the
>>> table, which would have been caught in probe
>> Yes, unless:
>> 1. There is a bug in the opp code
>> 2. Probe code is anyhow changed in the future
>>
>> I think the code should be readable and obviouswithin the function, not
>> depend on some pre-checks in the probe. But if you think that's
>> defensive coding I can also add a comment to silence future Smatch
>> complains.
> 
> I ultimately don't *really* mind either, just wanted to point out that
> currently it's effectively a false positive
I will adjust the commit msg to point out that it is actually impossible
condition now.

Best regards,
Krzysztof

