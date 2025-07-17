Return-Path: <linux-arm-msm+bounces-65459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8939B08D27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 14:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4C304A205F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 12:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC822D1309;
	Thu, 17 Jul 2025 12:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WnPwXVvf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C423C29ACF3
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752755938; cv=none; b=OTW7+XoOzeN87DdjhXXsAi31gSM6SYSopsitrJiPIBP0VaOwpCphnlHOdRk95eTrGdIJoR+jzOIWB0VOrBNjIj2s8GJ7wrZTkKN5ILEsEFE+Y6/GkOIrC9tT6SbAqJMt7ukajbvGTbv5qO1fJ79pCgf9tx1V8SnCrieL7C3TaII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752755938; c=relaxed/simple;
	bh=RcIkhs+PWG65kpyVBx3jeSr4dOMJSG7K3RPmTlULAM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZeylPXgwgM2Mg2IFbZU/8p6aEOocpMJS0t4W8mjf0wioHnMfOYN7gMfrZQ8r2o5O0aCa4/vtcjnI3t4cd4vlQFq0yWcPmXtwLTewO3B8MHOUzWRKjnze9m0nPKK4WBWZ/A43430toBZluIjvs/imFLLHUgIeRXsjfyeGvQ/lKeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WnPwXVvf; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60c733792e9so142920a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 05:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752755935; x=1753360735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PX/ctpdQl7UzXj5LfUq23XzYmkmTNHChay0GALh9u58=;
        b=WnPwXVvfY6h+po1aV2YFiSKx5GfcwIAw0pIAfetzWnBrdm5uQT5Q9ZtQrmNitmL8hG
         EtawJ10RjlhMNm1LS+eW68bl6s3vhHTLJNAzgB1DUtYPQjLFmMvrFbtUXEFL/Ikhzi+5
         JfZjqXCKpkQT4Pm92FOGWyJO8L0gQNdZ/T8xgM9KHvbbdiK/v1OkggBD4DsbXHW5AIM0
         cpXIRW6PIqY3wnF7Xoz8e9Gez2J2UFsGPWmYditCyQwUXS62Y3geO+R/1DaGqOrtWZ8p
         l/InhhlnyX098vjUKxcL1HgJGIRe2YsIHnJ1GqkCwPKE+wpHd7aE0P6ekCPvBYwM68yi
         uvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752755935; x=1753360735;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PX/ctpdQl7UzXj5LfUq23XzYmkmTNHChay0GALh9u58=;
        b=SZxRbaiK4qKSWht39t/w93jrN+ZaY6/2ieYybrd1Aw9AAd0FHY9HJpOqW+roFqe0OJ
         pU4oYNdFxEpNalHLa6y8BgF4a0NMcQG9992qBda0xgggHRUlY+k6zuOb8+doi96oTg07
         HXbFaC198RraEz8KHmoV40a3lk7ZQEiG0YJRfTfIV2DJLt8j1sKCzMNzb33SMy7f3LFP
         eK6QpTtlsb/vuvJ14f/XxveVt6SPypizdqYZDPytTvb5GHeJANYwpPzQEnbxFlwcENWG
         FkEks6WAVFENNTN/mkEjpEkPUWnn3Os2+5l9F/N5l6Tmf6j0IJItA1bwB3zRpcFoe4L2
         T1YA==
X-Forwarded-Encrypted: i=1; AJvYcCX59RVdjtZ60bz+uf7RcQwDGKyMCFig3Do5rmiC2J2jEA88oGO6LppusNFOAX5EwNQXcsYZrV9RRoFcA7WR@vger.kernel.org
X-Gm-Message-State: AOJu0YyxLUQCeFU7bk0kiKuYmOQG56EzwhX3pWa1BD4Sxdl7at2oAPaY
	Im1MweTgzR+7Jw69dBNJxpNYjYc1E7lm+DZJy53QyPMgfnHL1dCI4IiEBw7h2zp4nhQ=
X-Gm-Gg: ASbGncuTRq+X1i0138OJ+V7SNQn5FsMqXFpodg5CDTNhPvccXrMqcq/GBegvW0JyIm+
	RyUsoyjgqjxkRpY/3gECvS1hHLlpZuOncIwkMIdTquvXUqVCRxG76KEb9nidp33+UiMmZmZ9uzo
	LLeleXqeRnFh0QrYq6CeZVgRD6z4tyLvnONjhDUBQkR9LdqQBzQPLKO89mSZwZHndUZXQoHCu9g
	NYVXfenCDG239XViT1y0umEqCEIKNemGvwvuFKYf0sjjM32I/P6mTwT2ZSoVeMp+hUQ+lVxOO7Q
	3px4lVREqBcWYPqYuCzlBLs7BmWXHaxTeGY7jMn77Hmqx/4C/kcRTjS8PsNUP4NeByreJw6fKdR
	YdCvOTnB+XCezHrZu3oAaf8WbLGw5E0PnWUUfh9Nc0g==
X-Google-Smtp-Source: AGHT+IHBsoW2HU+lEGBR1Fois9YmUVZiOCT0jmQwPz4gVuNgeF3eU03AINq+XO3PZqrCmU8VrnkGmw==
X-Received: by 2002:a05:6402:270d:b0:608:c773:8b3 with SMTP id 4fb4d7f45d1cf-612823bb47amr2098900a12.7.1752755935011;
        Thu, 17 Jul 2025 05:38:55 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611e21c724csm9068233a12.61.2025.07.17.05.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 05:38:54 -0700 (PDT)
Message-ID: <d9de2e4f-5b26-41af-bc69-327978d3d571@linaro.org>
Date: Thu, 17 Jul 2025 14:38:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: iris: Add support for SM8750 (VPU v3.5)
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org>
 <20250714-sm8750-iris-v1-3-3006293a5bc7@linaro.org>
 <7b0a984f-b62a-ac4d-74bf-a6e839c59272@quicinc.com>
 <d4c39f2c-9f95-4e65-87a3-78173b39adf1@linaro.org>
 <1c5df071-7000-ab45-dbc6-4384d883ba24@quicinc.com>
 <a6dbca7e-4d49-49a6-987c-8cd587501c98@linaro.org>
 <3a87c37b-b392-598a-736f-bb01e4c311e1@quicinc.com>
 <f6f86227-8d26-400b-9ad6-605cee966b56@linaro.org>
 <2d5edf11-2d13-bcc7-93a9-e0a223bd6eb8@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <2d5edf11-2d13-bcc7-93a9-e0a223bd6eb8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/07/2025 14:02, Vikash Garodia wrote:
> 
> On 7/17/2025 4:24 PM, Krzysztof Kozlowski wrote:
>> On 17/07/2025 12:50, Dikshita Agarwal wrote:
>>>>>>>> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
>>>>>>>> +		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
>>>>>>>> +					 val, val & 0x400000, 2000, 20000);
>>>>>>>> +		if (ret)
>>>>>>>> +			goto disable_power;
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>>>>>>>> +				 val, val & BIT(0), 200, 2000);
>>>>>>> what are you polling here for?
>>>>>>
>>>>>>
>>>>>> This is not different than existing code. I don't understand why you are
>>>>>> commenting on something which is already there.
>>>>>
>>>>> Which code are you referring to?
>>>>
>>>> To the existing vpu33 which had Reviewed-by: Vikash Garodia
>>>> <quic_vgarodia@quicinc.com>
>>>>
>>>> You understand that everything here is the same, everything is a copy
>>>> while adding just few more things?
>>>>
>>>> My patch is not doing in this respect anything different that what you
>>>> reviewed.
>>>>
>>>
>>> It seems to have been missed in vpu33 power off sequence as well and should
>>> be fixed.
>>>
>>> Still, as mentioned earlier as well, your reference should be
>>> HPG/downstream driver of SM8750 not the previous generation (SM8650).
>>
>> Yes and partially no, because we write upstream code matching or
>> extending existing upstream driver. As you said earlier, downstream is
>> not the truth always:
>>
>> "That shouldn’t be the case. The downstream design is different, which
>> is why the driver requires the above code to move the GDSC"
>>
>> so here I built on top of SM8650 and re-iterate whatever mistakes are
>> there. The best if someone fixes VPU33 and then I rebase on top,
>> re-using fixed code as my base.
> 
> You have mixed different comments made earlier.


I did not mix. I used them here to show how pointless arguments you keep
making instead of focusing on technical aspects.

Once you say that, other place you say something else.

> 
> 1. Downstream GDSCs are still in HW_CTRL mode, while upstream GDSCs are migrated
> to HW_CTRL_TRIGGER. This does not need a fix in SM8650, but in the
> "iris_vpu35_power_on_hw" which you have added in this patch for SM8750.

No one discusses this.

> 
> 2. Register write "AON_WRAPPER_MVP_NOC_LPI_CONTROL" with 0x1 is needed on both
> SM8650 and SM8750, before polling AON_WRAPPER_MVP_NOC_LPI_STATUS in
> "iris_vpu35_power_off_hw" function.
> 
> I can soon submit a patch to fix SM8650 with the missing register write, but i

Great!

> do not see a need to wait for it to continue your development on SM8750.


I am not sure if you both understand how upstream development works. We
reduce to a reasonable minimum duplicated codes and different solutions,
so that's why my code is a copy of existing code plus new things for SM8750.

The goal of upstream is not to implement SM8750 completely different.
Please switch downstream approach to above re-usage approach.

And that's why your fix is important because I am going to copy exactly
that part of code and I should not come with different code.


Best regards,
Krzysztof

