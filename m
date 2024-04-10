Return-Path: <linux-arm-msm+bounces-17059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B39E89F8FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 15:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C1A21F32E72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 13:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819EC16DEC3;
	Wed, 10 Apr 2024 13:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DaihdW0c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B185D16E87B
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 13:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712757053; cv=none; b=dFh3AO64g5WulAyH//yuibXXP6hegDglLSfaEjdI3X4Lei+kMfzwcT7HJP6XXXym+75jHwdfuCGMYYtohFAoJHgrVIBAGr9++YOz26K/zT4RlJfowkvXPYLbgK5lqMReUKYwy1Qlhh7+JG/3PozjCuypWmh19Rs9EOG/2bHZj4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712757053; c=relaxed/simple;
	bh=OttZI9OAC44DLV9FXfH33BV5Wo93iewW4H9OfdnDw80=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cW2iYAAk7Z6HA8EZaSpqcOHU16abVNExaL6gDEzq3TDvOIHsEHdByGZ4WdqCfLEuDjE7Fa6/8T37DSJ0Z8IqUxNUWx+ta6hBxlzxhi5Z3RE4WxtTNgCB4/CzqSCrbFSTnEyTTMEZpSr/udDHDQasGMz7EO4JqjQxyIlvYF8Etp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DaihdW0c; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4155819f710so53353755e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 06:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712757050; x=1713361850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tGzMC5eZRbkZA2tRcuu2z6ooJ7rB/GVbGEQNpZntfhs=;
        b=DaihdW0cvoEBI4v+79oq9+CG4gBDX3EjAXu105eY+UFqw2k79sid2MPxR4y8xZv5s5
         AYXBj/sC2JMnQ1D/ZOSLPZkZ7auYLFiwZLbtN9kgikcm6r/FN27T6aQ1R+o/ZGxyM7Po
         pQo+7pCRcs+vtyDehNS+tD2znKD5+E/mTUFfZAC4Q+OFkiJ/bqwXr4nbx0Aj3N/5FHHv
         AqyQZtwn7fDWmSsn2XdfU9X7ANzAEfMHpcqQ7XSk3pmVrcinEvDmWdPdhCUopMnGpWPq
         /82zMZGgbwCtQjB0LbJ7Gzd1GQrkkwqkbG2D9cv1SzmU5UTwAqt2FkSRzNYDLwCG6Jdq
         pw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712757050; x=1713361850;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tGzMC5eZRbkZA2tRcuu2z6ooJ7rB/GVbGEQNpZntfhs=;
        b=ob5a7XRylEVEPuAGRJgEYosLhN5p8Iz0zB7lgOqAEEDbZZ5la416pVxHQnNxLFsaPs
         g5IwF1FIczhIdp6flbL2cqM1dDi1rVwcYj1jJCZ8FyG6x63PHe0wAi6lB5Au/sit0WWI
         cYnGXux0fVVBaB1mBzdyt0vo9rAOs9OcBQAkUNm38NfzhMGdCapDWcIh9Qbu9aNaOQMV
         0hE0uQJiFIzW82wdNAXfq5Ey8JwtDmVUPaXOywBs8uNNAAcFR0EXoYRRR2X1kEvBIFQK
         Mn+BzO66ReZ5q9PyhJyWQh3oIN1Jpk3P3UIO0vh63KZ8kIEsZx8tYywGmgFudWjApEOe
         yHbw==
X-Forwarded-Encrypted: i=1; AJvYcCWkpnlQSjd65HK3Ekb4OBauXR4MM60nMdSKk12alasZZJ5+vOpCu+jjKnQ9SD3DrTe4N7t/cQgmqAnnvJyRW725NcV60yUdfpdGNLSAwA==
X-Gm-Message-State: AOJu0YyNLVFW5jfUlufaSw4xxAQp3vZsPXFWohmh9OhIF5jKpsGfg7ck
	jN7WlkuA04AtiZQSvmeG/RRkpQVrdakt1X8VjF9zWQjT22MZm+MLEKbetBoIYxc=
X-Google-Smtp-Source: AGHT+IEmfFqVDaXyW0ngHWIN9f1BwLofhhiM641EuiC/NVxqR1Y8a1qZWi0MicKLQK7i+TDJlWbzvg==
X-Received: by 2002:a05:600c:4586:b0:416:8040:cccb with SMTP id r6-20020a05600c458600b004168040cccbmr2217805wmo.26.1712757049710;
        Wed, 10 Apr 2024 06:50:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:760d:c2fa:a66b:fed3? ([2a01:e0a:982:cbb0:760d:c2fa:a66b:fed3])
        by smtp.gmail.com with ESMTPSA id r4-20020a05600c35c400b0041638a085d3sm2337169wmq.15.2024.04.10.06.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 06:50:49 -0700 (PDT)
Message-ID: <4162174b-df35-4282-859e-84b0579ff91b@linaro.org>
Date: Wed, 10 Apr 2024 15:50:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: add description of CCI
 controllers
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240410074951.447898-1-vladimir.zapolskiy@linaro.org>
 <72816a9f-3c25-44d3-8386-9b561a8ae996@linaro.org>
 <b5f81ed2-d2d9-4c48-8feb-d78bfd714a40@linaro.org>
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
In-Reply-To: <b5f81ed2-d2d9-4c48-8feb-d78bfd714a40@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/04/2024 15:11, Vladimir Zapolskiy wrote:
> On 4/10/24 10:52, Neil Armstrong wrote:
>> Hi,
>>
>> On 10/04/2024 09:49, Vladimir Zapolskiy wrote:
>>> Qualcomm SM8650 SoC has three CCI controllers with two I2C busses
>>> connected to each of them.
>>>
>>> The CCI controllers on SM8650 are compatible with the ones found on
>>> many other older generations of Qualcomm SoCs.
>>>
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> ---
>>> The change is based and depends on a patch series from Jagadeesh Kona:
>>>
>>>     https://lore.kernel.org/linux-arm-msm/20240321092529.13362-1-quic_jkona@quicinc.com/
>>>
>>> It might be an option to add this change right to the series,
>>> since it anyway requires a respin.
>>>
>>> A new compatible value "qcom,sm8650-cci" is NOT added to
>>> Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml , because
>>> the controller IP description and selection is covered by a generic
>>> compatible value "qcom,msm8996-cci".
>>
>> You'll still need to add qcom,sm8650-cci to the "CCI v2" list in qcom,i2c-cci.yaml,
>> otherwise the DTBS check fail, even if the fallback is already present.
> 
> I do recognize the problem related to a build time warning, my motivation was
> to follow the rationale described in commit 3e383dce513f
> ("Revert "dt-bindings: i2c: qcom-cci: Document sc8280xp compatible"").
> 
> For a similar sc8280xp-cci case it was asked by Konrad to drop a new
> compatible, I kindly ask the reviewers and maintainers to stick to one
> of the two contradicting asks.

This is totally different, this commit added a new compatible that is used in the driver,
while here, you use a per-soc compatible that is (for now), only used in DT and uses
the generic "qcom,msm8996-cci" as a fallback because it is considered as beeing 99%
compatible and no software change is needed.

But having a per-soc compatible can help adding software support later in the case you
want to implement sm8650 specific features or add bug fixes.

It avoids changing the driver for no reason, and provides a backup in case there's
a driver change needed in the future that can be backported safely and still work
with older DT without changing the DT.

Neil

> 
> -- 
> Best wishes,
> Vladimir


