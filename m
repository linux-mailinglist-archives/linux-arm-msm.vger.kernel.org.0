Return-Path: <linux-arm-msm+bounces-21418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD2C8D76BC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 17:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF0871F2133E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 15:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4114F4644C;
	Sun,  2 Jun 2024 15:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UezuUtkT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818F2446A5
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jun 2024 15:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717342088; cv=none; b=b83gFo0fMJBQwYrggoVG2EUR3lJhXSrtjQkOjfe+uSt8cHeWkO8Cq2LacbKHVpv02Q/C7oVVGdnHW98W9FAfX6+FqgWU3BUuuSjjGjqIdhepvzh1w8D6ZZRfSCQ3RmLtYHZrLJVQT84WKAu6F4jFYaNECgdLNFcSI5E4wJP9kdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717342088; c=relaxed/simple;
	bh=IykilOMVJgaiHvIeECYjsxf3gRDr0iNjeHIVFackIyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mHYKjVH8AHhUdnP0v5MwOe72+PhBx5FITKGnCPSE/gQ0zpQueoEKeQbPWhrXS8bvlj3zh0GipLNTgxCVfItLDRZDovF01XfioR/cAMPoA4EmnhuecGufWQLN9LyXoYT6iLSoI5eYkswTEVsiQtEL2KbJPWu5sw5VflC6kk6Hdqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UezuUtkT; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-35dc04717a1so2685580f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jun 2024 08:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717342085; x=1717946885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=baPp/gJ8KPQc7AlJvsezYzdw4vqg3FUNjautDtpuOQk=;
        b=UezuUtkT0NT6UkLamC4di2PnHFxEthOeyiOzHZ9TzDgTBgmGTmemCdOOADjHLgOO5K
         sXx4znFyZ7CEJq6qsSUCXDPOCcn/IWUEsnD28tymcl6MI04Xrl77e+cfCgAAx9ujWzGk
         +0Qe5/0+bVnS4okYdcRCNfQQDoNs7uZhR3WrLV8yuyhU35R4HSR8/+Rk+SPMHZIEHneM
         Jonexa5SmVSl1nd3+KazI+CAM0wQx3ANclaz7WV7IILsSXd9C36S7ATpHs4/6Y7aAimn
         GatJ+5rh3LlYHA+Dj+KIA5YLuvD7ztyZd74KLQm4k6oOyybtY0sGYeL6VIqvdxCvrfrf
         owiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717342085; x=1717946885;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=baPp/gJ8KPQc7AlJvsezYzdw4vqg3FUNjautDtpuOQk=;
        b=cp6sA5f3LpVv0psDQnAScZVT8Tgevbu8Wt+5CDgdmSOW4QS6K58tyrCdM4Y44JlA4D
         LLgUgJYJICFIn5A0u/AyM0qAICBa5y+IB0W/aXX+XPyPjTDqQd5/fW3j9UB5UF2OLdZk
         pa1oT+aja+e8682PEuJOnMoEN+Js1ygZPEmFAH1pzyrS511bUu+0BmMigDjRC1KYX3T5
         bbCJogrjCGbmJojog+nVR/XzJkTxsAATy6LRMS7PYvKAWamnxnQS6P64vOy46Gcw933H
         vq5w2HEecKLqxfUSb94FwiCNX9oDZ4SO+NwGNO9Uelp6iLgNr024UWSwBAhC4YMniEWT
         BCBg==
X-Forwarded-Encrypted: i=1; AJvYcCWrM1cBQFA0qSGTcuOv5D8U9At1mYObzKG7fd5Vl0szMWQzCKx86LYYr0zjAZp0VUBcvcHwsmNMbEuLdPnGdtzsjR/iYGCWzupJoKvXxQ==
X-Gm-Message-State: AOJu0YxXubM9B9ujvzycLEQglrEco+CzOot6JGJZLuOID/ktfJC0LmTo
	3YKgIOIjeCr0z6kIsiIcr9uCYhEt9oKdw9XHihjmUqJyxr4ez2yv6Jz/iw9XlW8=
X-Google-Smtp-Source: AGHT+IEsWHchIXy71DI4d8HK8Hi6YOhUT1vGsSATiMHWL/C6Z4iJ3afogi0r3rUD4s+4beTE4KJ1gQ==
X-Received: by 2002:a05:600c:4705:b0:421:2918:3d97 with SMTP id 5b1f17b1804b1-4212e0add57mr59143535e9.30.1717342084829;
        Sun, 02 Jun 2024 08:28:04 -0700 (PDT)
Received: from [192.168.2.24] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b84a97csm85739515e9.14.2024.06.02.08.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jun 2024 08:28:04 -0700 (PDT)
Message-ID: <fa7dc574-e431-4a29-951d-1aaf4b86c37d@linaro.org>
Date: Sun, 2 Jun 2024 17:28:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] clk: qcom: gpucc-sa8775p: Remove the
 CLK_IS_CRITICAL and ALWAYS_ON flags
To: Bjorn Andersson <andersson@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 quic_jkona@quicinc.com, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-5-quic_tdas@quicinc.com>
 <0f56831e-8572-46f5-89cf-d1e990813a02@linaro.org>
 <woi4vzsc2mgug26rluvzt6ayoawfsus6ow2kqnmfnnqlwf2lty@sirpsaf2anuz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <woi4vzsc2mgug26rluvzt6ayoawfsus6ow2kqnmfnnqlwf2lty@sirpsaf2anuz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/06/2024 06:12, Bjorn Andersson wrote:
> On Fri, May 31, 2024 at 11:59:04AM GMT, Krzysztof Kozlowski wrote:
>> On 31/05/2024 11:02, Taniya Das wrote:
>>> The gpu clocks and GDSC have been marked critical from the clock driver
>>> which is not desired for functionality. Hence remove the CLK_IS_CRITICAL
>>> and ALWAYS_ON flags.
>>>
>>> Fixes: 0afa16afc36d ("clk: qcom: add the GPUCC driver for sa8775p")
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>>  drivers/clk/qcom/gpucc-sa8775p.c | 27 +++++++++++----------------
>>>  1 file changed, 11 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/clk/qcom/gpucc-sa8775p.c b/drivers/clk/qcom/gpucc-sa8775p.c
>>> index 1167c42da39d..f965babf4330 100644
>>> --- a/drivers/clk/qcom/gpucc-sa8775p.c
>>> +++ b/drivers/clk/qcom/gpucc-sa8775p.c
>>> @@ -1,6 +1,6 @@
>>>  // SPDX-License-Identifier: GPL-2.0-only
>>>  /*
>>> - * Copyright (c) 2021-2022, Qualcomm Innovation Center, Inc. All rights reserved.
>>> + * Copyright (c) 2021-2022, 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>
>> That's not a fix.
>>
>>>   * Copyright (c) 2023, Linaro Limited
>>>   */
>>>  
>>> @@ -280,7 +280,7 @@ static struct clk_branch gpu_cc_ahb_clk = {
>>>  				&gpu_cc_hub_ahb_div_clk_src.clkr.hw,
>>>  			},
>>>  			.num_parents = 1,
>>> -			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>>> +			.flags = CLK_SET_RATE_PARENT,
>>
>> I fail to see why this is a fix. They were marked as critical on
>> purpose. It was needed, wasn't it?
>>
>> Provide jsutification for commits, not just sprinkle Fixes tag all around.
>>
> 
> This is indeed a fix, as marking clocks CLK_IS_CRITICAL prevents any
> power-domain associated with the clock controller from suspending. In
> other words, the current behavior is broken.
> 
> @Taniya, "not desired for functionality" does not carry any useful
> information explaining why this change is made. Please update the commit
> message.

Then please provide some sort of bug explanation in the commit msg. I
assume the clocks were marked critical to solve some particular problem,
e.g. missing parents, so marking this as fix sounds like both incorrect
and error-prone when backported. Maybe that's not the case, so this is
why there is commit msg to explain such details...

Best regards,
Krzysztof


