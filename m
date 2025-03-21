Return-Path: <linux-arm-msm+bounces-52184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 811DCA6BBB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 14:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDEDC7A5BC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 13:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1722B22AE68;
	Fri, 21 Mar 2025 13:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="biNfksZS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D4422ACC6
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 13:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742563609; cv=none; b=QFpfnjtRfgX4NdxRy5mtEVsZk9RG997XSFA9og02FnfzNvd998eTlrq71XHyMoP+JxHTcyfyRT7rNSnH6m/wE+ZIpfE037ILwnLNYhjlzwxhkMac/UH8uxeVlcVtFuol8anL2AOIy1cV0ImRHglkXaix76brU6D2XRmv1tjqHaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742563609; c=relaxed/simple;
	bh=xMeqGv/jZySimNc6vELEg0wI4OT6OHTVxuOS/HRWpzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mEJp3TW0f9xxRDTSZgeDdAo0y7/hwrKryuDzCXRTbMs+GUNenrE8CsrDnr0sjOK/lBaJxpACp968U/6y0PQyGr247adbM38DjA6qZgt2B6n+a2UfRSsY5JF8hA9DiO1UXSyhmEi61egr3djmHMA9YZyoLRk2ze1KMuKXKSKV7cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=biNfksZS; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f2f391864so1107883f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 06:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742563606; x=1743168406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x+nfdqXMXDIXPRHZvpsBbeClbsVJF3/i4egLlwdwO+s=;
        b=biNfksZSvhyJhkN3QGe/C7UTbAt09uwc8cwvp2Y6ZEhKEC8sIJjyhkaZublPCme9cc
         4VkG+kD3NjeqI1WeYcYx7iK03nFz96JmEe/l0FFtl3WqhUraZ2HhyF5tHJ/PcLEkgNOZ
         Lrm1SbYlkdeJJHzn1EuU6yx7IlObdv/x7p7XfyJXafSAMbaECbp2R1SPtmdjC6xFwdmF
         IFzt2uEzaOUFyH2gh+kWeP981x8KvfdVyZ9/NwNLaKEON9J0L0RuLe7Cevka1JmRkBgy
         TzRHdUEzGByVmtEnwzc3LoYJJaFrS09R3mHWkpZIsKD5ep/T4S1dnn8k8KWTCrsnfUOo
         mM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742563606; x=1743168406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+nfdqXMXDIXPRHZvpsBbeClbsVJF3/i4egLlwdwO+s=;
        b=gGIDZZlYVlQGHKg7RifpQ4igEgZsiYLrXKzv+ZyB+3ExkyssJJjE5CG3jsJR6pWmko
         d6fSMiIyFRSmMfd4RQoZsVOaND85LdqDD8lhNTruBqE2zf+McSomu8UL6+mbaWoggJ53
         l6z1j95k0JwYRU393QRS6bFQJpG2B9770GuZGJUl8y6LGE4fchGTvAsPV/jMNL3fttM1
         Na4L5zseHSp0P2wMbc7Sr2b/M4CSY8fJXtD11I0HZSGJX3GBCAepTCj8T33QY+bcaEPa
         vJduG57B6a1kIFfXWWjByAS3/p7PhyJAjJSDrKxEARFI8ZrRJ7wibh29USRE6dtePiya
         pejw==
X-Forwarded-Encrypted: i=1; AJvYcCWPTde/B7aXeTLjzey1FW4PvpY4fSfy0X1ZAFfI+Cu9cS7pjS0Q0Y0zHmT69YSIO/x4lOpUKvFoWq8fPRMH@vger.kernel.org
X-Gm-Message-State: AOJu0YzkRn/fA5eriqYtqpBBUDBEzK0PxVecc5TD9vQIwh/6PggRxXNt
	l0MhC5HW+AvBTcdrguvROStyFcekPWy+azGO7KDqi69PUx+SG2BNZyzvR1WgE0c=
X-Gm-Gg: ASbGncuNkDAwMnkFq7rr8w7CZ8xkhLbwrScUnhbtPEoWUliATm51a67cba+sUWCsM8N
	sdU97VRohzyrCE23tgP/owQF6gKBJ0Aqejq2gmjGSWcDgcOC84TgtJMC458q3pRu3/aYvIHkiUh
	lXDAwtkHr/gTPAd3PsMpPfq0sTVXqNuIzm0VrKDwwXWgJM7YPfZJ07S74cqcduUw9JhOvCnKpmp
	4oQ0+PkKscwr0FczJ/OoyfS2lHu8DL+wUuHgZ8Ar+RIJYG+ya1jZtvBp5bLLodUR1EmzW/5drqj
	MsJl+JHLp/wt9Q1COTIhI3eYXTf58Yi/0DnJYlveYycxzSmibJhP3HyswXlVMygCLvbZDVJw2w=
	=
X-Google-Smtp-Source: AGHT+IFItBfdiuwTpyaV5kuTi/ldTSC9Nx5SxBw7qLGhnUVc61bpqSJwTkGLSn5VdoJA25gliLrfGQ==
X-Received: by 2002:a5d:588e:0:b0:391:4674:b136 with SMTP id ffacd0b85a97d-3997f90e00cmr2957330f8f.29.1742563606193;
        Fri, 21 Mar 2025 06:26:46 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3997f9a3f81sm2419531f8f.35.2025.03.21.06.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 06:26:45 -0700 (PDT)
Message-ID: <1d93f731-66c1-47b2-a249-9bdb25205525@linaro.org>
Date: Fri, 21 Mar 2025 13:26:44 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] ASoC: codecs: wcd938x: add mux control support for
 hp audio mux
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
 krzk+dt@kernel.org, ivprusov@salutedevices.com, luca.ceresoli@bootlin.com,
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johan+linaro@kernel.org
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
 <20250320115633.4248-5-srinivas.kandagatla@linaro.org>
 <rdvsnxuc6by6sci56sh7thzpxo5cqi7q24fnmc7hi5yrfszwrg@kqjpiilko3xo>
 <b1aed195-b2e6-4f48-ba10-3049d74085a9@linaro.org>
 <CAO9ioeWLRfzUOwjnFsi_yztdJo2Q25bhvjddh6D3naV_K5eShA@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <CAO9ioeWLRfzUOwjnFsi_yztdJo2Q25bhvjddh6D3naV_K5eShA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/03/2025 13:16, Dmitry Baryshkov wrote:
> On Fri, 21 Mar 2025 at 14:35, Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>>
>>
>> On 20/03/2025 14:03, Dmitry Baryshkov wrote:
>>> On Thu, Mar 20, 2025 at 11:56:32AM +0000, srinivas.kandagatla@linaro.org wrote:
>>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>>
>>>> On some platforms to minimise pop and click during switching between
>>>> CTIA and OMTP headset an additional HiFi mux is used. Most common
>>>> case is that this switch is switched on by default, but on some
>>>> platforms this needs a regulator enable.
>>>>
>>>> move to using mux control to enable both regulator and handle gpios,
>>>> deprecate the usage of gpio.
>>>>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>> ---
>>>>    sound/soc/codecs/Kconfig   |  2 ++
>>>>    sound/soc/codecs/wcd938x.c | 38 ++++++++++++++++++++++++++++++--------
>>>>    2 files changed, 32 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
>>>> index ee35f3aa5521..b04076282c8b 100644
>>>> --- a/sound/soc/codecs/Kconfig
>>>> +++ b/sound/soc/codecs/Kconfig
>>>> @@ -2226,6 +2226,8 @@ config SND_SOC_WCD938X
>>>>       tristate
>>>>       depends on SOUNDWIRE || !SOUNDWIRE
>>>>       select SND_SOC_WCD_CLASSH
>>>> +    select MULTIPLEXER
>>>> +    imply MUX_GPIO
>>>
>>> Why? This is true for a particular platform, isn't it?
>>
>> We want to move the codec to use gpio mux instead of using gpios directly
>>
>> So this become codec specific, rather than platform.
> 
> Not quite. "select MULTIPLEXER" is correct and is not questionable.
> I'm asking about the MUX_GPIO. The codec itself has nothing to do with
> the board using _GPIO_ to switch 4-pin modes. It is a board-level
> decision. A board can use an I2C-controlled MUX instead. I'd say, that
> at least you should describe rationale for this `imply` clause in the
> commit message.

I agree to you point, but historically in this case us/euro selection is 
only driven by gpio. But I see no harm in moving the MUX_GPIO dependency 
to machine driver KConfigs.

Will fix this in v3.

thanks,
Srini
> 

