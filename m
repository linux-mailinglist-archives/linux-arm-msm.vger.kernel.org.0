Return-Path: <linux-arm-msm+bounces-2277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DADEB7FBB4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 14:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F5DC282BC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 13:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4441D57889;
	Tue, 28 Nov 2023 13:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pj0Hdids"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C87BA0
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 05:19:30 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40b472f98a3so15520265e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 05:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701177569; x=1701782369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNhsdNqM7DGYXXzzSoZ3aBCuUaMath6u9/Bs2pK5d60=;
        b=pj0HdidsDnJgc8tevrnSY+qdUTuDna3KRqVpb9Rwud2DI+S7iGuvpz3L1uafXCbjLj
         r4+Ed8e3zzzO7AuRIPYRClBgBtBIT6oWA6AHKa64GQnwjZL4e3NsJITZSLw7LbYw5cdx
         UGhB7ilLDuBfsTWnygtG/EEhPVg7VuszSMluP3IVtzuU3r4yIJT1IzBAsmzF5qhKbLBV
         /Ck+XbpijMhcykpzwJVQs+3ce4jIIjMzH8UC/fFYdKUkdlSeVsfkpYT0aXZsoD0ojc0g
         k1y9nbmMe7ulzfjfLogTvVPgqkG3QxJwaZbFMgSSRI9teY0Dnbkwy/NOV7zSvwYaRYfy
         j+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701177569; x=1701782369;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VNhsdNqM7DGYXXzzSoZ3aBCuUaMath6u9/Bs2pK5d60=;
        b=Ogc1aIzc37htuijrTB+ht+BaPKgmBlNFLYsWcx3ECLdjZvQIIWQDXgEJplB4FcwCB6
         2oJGf2bdsbeBiVqprlROWnNcEUMxQm8AQxDRusWERLsS7eUetBelcAMaDmObiF1Abqq5
         HaC4rwjci6c70T8DUf9Rut2bgr9WqMg2XONLVD3tMCNUxaZ1z9VjDfx0R9PjCHIkBcQC
         HItAJGL9jZUSJwyBM+fY4ptyPjp6e0myZ/eG0WZRTENZSWfJZ5e7h8ICUXv5mPUHsy70
         AzEUHKbJvX30dMpgKtBuuFs4Q88iCBSADA2qW2OHVpT0lxvjdCISiYXAV2+8ZkzZBVap
         aMBQ==
X-Gm-Message-State: AOJu0Yytd8YkpV/74J1zWZPhdN2UiMIze45yhJPiaGMY0gitejDVfkF/
	OKkVX77AqwYv2DCfGpbOi3PcFw==
X-Google-Smtp-Source: AGHT+IHrIT0HPh3K2KDgTyB37aW5JnsDj7JyidP3X51QkRbWmF2wl94CcS78jsUivO1DNxcB8sIXXw==
X-Received: by 2002:a05:600c:3583:b0:40b:36e6:78c5 with SMTP id p3-20020a05600c358300b0040b36e678c5mr11544980wmq.37.1701177568728;
        Tue, 28 Nov 2023 05:19:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe? ([2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe])
        by smtp.gmail.com with ESMTPSA id he7-20020a05600c540700b0040b4b66110csm2661239wmb.22.2023.11.28.05.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 05:19:28 -0800 (PST)
Message-ID: <14b954d2-6865-40a2-97ec-2486ed97c4f6@linaro.org>
Date: Tue, 28 Nov 2023 14:19:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/5] ASoC: codecs: Add WCD939x Soundwire slave driver
Content-Language: en-US, fr
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-4-21d4ad9276de@linaro.org>
 <ZV+PTynfbRmF0trU@finisterre.sirena.org.uk>
 <ee3baf94-4158-4440-8d89-de39fe0aa2f3@linaro.org>
 <ZWXhVvGWwXc27FHo@finisterre.sirena.org.uk>
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
Organization: Linaro Developer Services
In-Reply-To: <ZWXhVvGWwXc27FHo@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/11/2023 13:47, Mark Brown wrote:
> On Tue, Nov 28, 2023 at 10:09:29AM +0100, Neil Armstrong wrote:
>> On 23/11/2023 18:43, Mark Brown wrote:
> 
>>>> +static int wcd9390_interrupt_callback(struct sdw_slave *slave,
>>>> +				      struct sdw_slave_intr_status *status)
>>>> +{
>>>> +	struct wcd939x_sdw_priv *wcd = dev_get_drvdata(&slave->dev);
>>>> +	struct irq_domain *slave_irq = wcd->slave_irq;
>>>> +	u32 sts1, sts2, sts3;
>>>> +
>>>> +	do {
>>>> +		handle_nested_irq(irq_find_mapping(slave_irq, 0));
>>>> +		regmap_read(wcd->regmap, WCD939X_DIGITAL_INTR_STATUS_0, &sts1);
>>>> +		regmap_read(wcd->regmap, WCD939X_DIGITAL_INTR_STATUS_1, &sts2);
>>>> +		regmap_read(wcd->regmap, WCD939X_DIGITAL_INTR_STATUS_2, &sts3);
>>>> +
>>>> +	} while (sts1 || sts2 || sts3);
>>>> +
>>>> +	return IRQ_HANDLED;
>>>> +}
> 
>>> We do this in the other Qualcomm drivers but it doesn't seem ideal to
>>> just ignore the interrupts.
> 
>> It seems we simply ignore IRQs that are not mapped in the regmap_irq,
>> what would be the ideal way to handle this ?
> 
> I don't understnad what "this" is here.  Why even register an interrupt
> handler here?  What is the regmap_irq you are referring to here and why
> would an interrupt handler here be related to it?

OK, I'm analyzing it, basically the Soundwire device interrupt event is
passed out-of-band and the device gets such interrupt_callback().

The codec part setups a linear single-irq domain where the regmap_irq is
attached, and this code generates irq events to the single-irq domain
thus triggering the regmap_irq chip handlers on the unique irq.

Seems the looping makes sure no interrupts were missed in the process,
we do not ignore interrupts in any case.

This design was introduced with wcd939x to make full usage or regmap_irq,
on previous drivers (wcd934x.c/wcd9335.c) it was manually done for slimbus.

> 
>>>> +static int wcd939x_sdw_component_bind(struct device *dev, struct device *master,
>>>> +				      void *data)
>>>> +{
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void wcd939x_sdw_component_unbind(struct device *dev,
>>>> +					 struct device *master, void *data)
>>>> +{
>>>> +}
>>>> +
>>>> +static const struct component_ops wcd939x_sdw_component_ops = {
>>>> +	.bind = wcd939x_sdw_component_bind,
>>>> +	.unbind = wcd939x_sdw_component_unbind,
>>>> +};
> 
>>> Do these need to be provided if they can legitimately be empty?
> 
>> AFAIK yes, component code will crash if those are not defined.
>> I'll add a comment explaining whey they are no-op.
> 
> If the framework can genuninely have empty callbacks here the framework
> should be updated to make the callbacks optional.

Sure, I'll add it to my todo list...

Thanks,
Neil

