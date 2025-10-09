Return-Path: <linux-arm-msm+bounces-76597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CCEBC85A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C400C4E1364
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BDA3275B0F;
	Thu,  9 Oct 2025 09:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UxUQai9i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3BA253B59
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760003134; cv=none; b=HIB0ejt36MDxEXIp5yXhc8mrGUOYoenHyFnfecROzKWqnpK4gqkldHeDTQKqsp3rj3R0o6qAKNmLIseZxxAfiClMOpxNU9H7kxRJb9TB/9cdqF91+7R92NvNsabkLaWgtpzbvRpjhKV84n/ylfwxyZndz3Hr6qRQUfr5Jw8X07Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760003134; c=relaxed/simple;
	bh=+WuDGN8PwcdrONCswSpy1/6ukiYeOjoibZ5/S2bBspg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Eg9gSEnEI9GLGXSD7ZL33tjVFYddLKRLxqhWFeVP0yQtVrVvtSlIsHgenSVQEJk2gDsWbaxCPBNqC15Ah65rVq6jIer+xknVc42I0b50wIbyTt61et+eTAcYkVNznPPFODnCSjORmr33t3hJQqB9k4nV7QPClSKhBivvrvazKCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UxUQai9i; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e2c3b6d4cso5101815e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 02:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760003130; x=1760607930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbUfqJ5j71TBp7MjjYEvcsqbYwQhLnnJoyZYmO0oJ5k=;
        b=UxUQai9iq93UYEy41EkcG5ATrh5c0sEfQTlsHTCiJBy4C0lpiEeXXh47K2ybloq0dm
         F/I9ddMEPBHVtDbAJOlXznJyV3XFnnobXmhbuRhwFdtfblYBDWAacu2EQmmFBf4AsNA5
         6RvkDufSOyzkazZgkrPNuPu/2fX9lfionzW551Qwp54/QPjHcugo+1HjRIsZRtOuEO5I
         ZKBunuAK2MmTacqZSKEmi40onuw7D8qjRtXyY5x6cmOVM15RKZNmz9hePCPejHmI4R6l
         kfeAaKzaBeU6ojwvyyU7aXqYjUF19/WGnWNLGr9QufysHxHmWrNdPSuB+lFAnVlC1p5J
         eNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760003130; x=1760607930;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kbUfqJ5j71TBp7MjjYEvcsqbYwQhLnnJoyZYmO0oJ5k=;
        b=Vjsy7U+iU/xISiwlAeBRA7q6OUq7rMNhqYeExtq9yxMX86xeZ7x0uISEk671rhKBZh
         pvpJUooIZa20v2OmKc+o31HRIzJLf4mY4HQq2AXI/hWQHQ7rVSIzyBKgTUFGByr9gj1c
         KIOvgROvadFdIpytG/uTAl3RObtu3UymRX/rpzklEL2Orw7uYWAJyw6lZI+Q1bgNB3Rm
         mmnfCvL9KMQvgCnmT+GVq9//ld+AmAzenkaaVdKqIwOLbvyJIHxnZtaFQmYRevwZnBTp
         aaM6vjquAps7xIrISGLjwR9i8ek9RBn+ijUDhi66TF6lTAvsMCdqs+yeVPd/0iBjTOry
         3OPA==
X-Forwarded-Encrypted: i=1; AJvYcCUbIl6mfjow6b34RjXz6AkkN2Eh8+sCCEa5YrQ06Bx0LbfmLPEs7wDSNwJMRy6iSN6smi0LOacnsKfb6Kf2@vger.kernel.org
X-Gm-Message-State: AOJu0YzJkKoQeKZ3qXmbR4BA0hsJivcZ4+NtQ0x+v3LF1PPs6WxF4UGr
	GElPhQd0arLaW5ern4Av+SkuOYbhoL0vVW4eOeuud4y2PXAL33Q4b8TPq14ajt60n3U=
X-Gm-Gg: ASbGnctw0oO5x2TlVOYFe1lh3u/PQCZRuhNd4BRQV3eUrpGLVryXvXN7zMvpymHJqBz
	rEmLEkGgn/FHe1bbnDITptMyuLgASSkcjAtnBPU6dXfJB//tngC4xwuWwGJzZiMpqtewRLRlkDJ
	0dClwYf+9GyslxVC0mTdRZJmIIx9YWq2V2jCWqSdo65sOBqzxB6si/yEDw+aceBBWUVw92q9oFb
	ktMI/h8V7nEqoU50KDRZSPu23706C4OuMZk/a82eoapZHXPRvQD3Bk+8k8FTBThGsvCch0qNYV7
	YJE9pBLbwixPqDjWBsRBsgOiNUQITMmH0jngiED6vp+yafnhoSqmcwzXT58vm8U99kZXTFMKea3
	5G1xPwjxmJv5FmNANqkFbdzG8hP5B+IBIB6sqisDNrG94i9hruOlSXmeDzEo0BciztpjI9eYvuR
	UKAb4Ktq32bPECqGQzFiEjEZkNiCg=
X-Google-Smtp-Source: AGHT+IFO8IRDk5imUegHSmbnk/EmeFggjgdJn5I9b3H8USmPMbWmI4oj5AxEVR/9edpf44w240UrcQ==
X-Received: by 2002:a05:600c:1d1a:b0:46e:3978:ba71 with SMTP id 5b1f17b1804b1-46fa9aefedemr45680875e9.21.1760003130336;
        Thu, 09 Oct 2025 02:45:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:7a0c:da2f:6591:67ee? ([2a01:e0a:3d9:2080:7a0c:da2f:6591:67ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9b622cdsm76319065e9.0.2025.10.09.02.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:45:29 -0700 (PDT)
Message-ID: <d702a630-eee8-4889-98fc-62f4907791b0@linaro.org>
Date: Thu, 9 Oct 2025 11:45:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC v2 3/6] ASoC: soc: qcom: sc8280xp: add support for I2S
 clocks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org>
 <20251008-topic-sm8x50-next-hdk-i2s-v2-3-6b7d38d4ad5e@linaro.org>
 <630bb2b0-0ab4-4083-96a2-9aa485041797@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <630bb2b0-0ab4-4083-96a2-9aa485041797@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/25 11:41, Konrad Dybcio wrote:
> On 10/8/25 8:56 PM, Neil Armstrong wrote:
>> Add support for getting the I2S clocks used for the MI2S
>> interfaces, and enable/disable the clocks on the PCM
>> startup and shutdown card callbacks.
>>
>> The rate can be easily calculated since the card forces 48Hz,
>> 2 channels at 16bit slot size.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> [...]
> 
>> +static int sc8280xp_snd_i2s_index(struct snd_soc_dai *dai)
>> +{
>> +	switch (dai->id) {
>> +	case PRIMARY_MI2S_RX...PRIMARY_MI2S_TX:
> 
> I have mixed feelings about the range syntax here.. it's only 2 entries
> per and it's quite error-prone (no errors in this case, but it
> encourages the thinking that things are always contiguous)..
> 
> [...]
> 
>>   	switch (cpu_dai->id) {
>>   	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
>>   	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
> 
> whereas e.g. here we see that it's not really the case, but it's
> tempting for someone trying to 'clean up' the code to change it to:
> 
> case PRIMARY_MI2S_RX...QUINARY_MI2S_TX
> 
> and the reviewers may not catch it

I understand your point, but I just took what was already in the file...

Is my change correct, yes, is the style of the code improvable, yes.

I'll do my best to fix the style issue later on.

Neil

> 
> Konrad


