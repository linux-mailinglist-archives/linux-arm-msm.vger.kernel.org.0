Return-Path: <linux-arm-msm+bounces-17065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6008489FB78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 17:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 157E128585E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 15:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64B41591E1;
	Wed, 10 Apr 2024 15:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="adZAze8U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70FA15EFBF
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 15:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712762813; cv=none; b=hCunEhYTjrXmV0QPwZBiQqVWicWRaakOa6SW3JRj+zWe5gAQwICdwlCKaTgRG/jT1IPvi0tQfxJeUiy4KGpd70S3qMQB5OJmcxdAFf9b9UBk4tUSTWg/GB5omIiL7AN2tEn+9hDxfV9+nt4tlceC2mejI1OcX3GNJRNOjMRPpKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712762813; c=relaxed/simple;
	bh=Tzh3HzuL9qtr+kAU3aaWCI44iJG4sSqVhDvuw8Xj71Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=a/ulB7ugmEx8FMb1Q7ji6f7M0lbb5HyHSVtr3/F8juXU6yShxkX9sdW5PTVEjnbP2LTfdxhIcQJa8ewrDzgyPicU7hLXJ1mHg/AeIrCNDp68O1C3JK11KZtqth7erZryCoWJi5/Dy/iXMRUMGK9r3Qb72B6bQ3VqPRGzb1mNumM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=adZAze8U; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3442f4e098bso2434665f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 08:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712762810; x=1713367610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3/WbimiOlydcOJLTLpJ2sk9aiLmvjCy78EJyBg7E8o=;
        b=adZAze8Ubq1ToiW77FtzzxvKCPLJgMEroNtmqLG0cmGgXQal/GhzHOeIqxHSY683ej
         OGyNW27xzRi2ei9WjkCDzrJCrmEdla06jwgF97fCfBAJhMN6cToJnq2gE/ec3dpGB0MM
         fvJMeuDanIJ76Zwy9o9++fJN6sQ3PfdmxY2SQ6P0EKU/Qh8vN9TXjfcev6ysSxIftKrr
         xh9r09XFgRWopqObx2f6x5kNG6N0fr4HYPAzrIRt95Tt8Wms1o/fxktED2r56zmNsvP6
         l6wWDCV7E4njPWPfkXqajo3QqrAInYEhF7nDLA5mvmzrQ6XwmpeKaJ7mnmXvM29J+LJQ
         Es5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712762810; x=1713367610;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x3/WbimiOlydcOJLTLpJ2sk9aiLmvjCy78EJyBg7E8o=;
        b=cPoo347KPKARA/3qqzRqMrk/TK4IYDFw/Yvogy3WXOTO8Ne33LkQVXL5lZp3Y3jvUr
         olfzvSX0jdAPGbtlTRtEEjUSWYHQ14ybjWol8nX6yWxU4baFaccLZ6XSAYIAFBhtysEq
         krfRAyBvYFcalxIx55gBVsVdx+o3F4TT52dL+2iBuVTlvhCsMLdcP4XZO08v/5v68hwe
         i2cIm3m5dL8yXy4gsw59z3Hb6DX1wnYfrNbe6K4QnaVwJ5ZbmXdRfaEvIWR12AJNxJ+2
         VRU31BqrNWkmj8ES2rP3Tq4PjlmMveK704Dhd6Q21wcxg+KMBmcmjvo6XEm/fMxyJA7a
         wZgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4lEnr/ZyCCp4LrCb/E87T1EQ+vBgQORvCNsAjbWqI15xGV8+VoK28bscxYg9PDytVoLZm50A3wdd5zURuEd9abOuEArJZOV+jzNvoBQ==
X-Gm-Message-State: AOJu0YwytBhBVS4Ref7g0EtF+FEDwCCyDatdG0O6ay3FpmpGtQpEqT04
	MnPxOEql7wW58oMxQteB9oVh14WT1zV7X+ZC2YCdj320smrSFzedJZSAPwNTLd8=
X-Google-Smtp-Source: AGHT+IH8FvGqImnbiE3kXfEgNWroZois6i/4/58Nz1OsQIgTD16pxjAuEAcEJPWAags4HUcbtmxbTQ==
X-Received: by 2002:adf:f5ce:0:b0:343:c52a:7fc5 with SMTP id k14-20020adff5ce000000b00343c52a7fc5mr5062807wrp.18.1712762809587;
        Wed, 10 Apr 2024 08:26:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:760d:c2fa:a66b:fed3? ([2a01:e0a:982:cbb0:760d:c2fa:a66b:fed3])
        by smtp.gmail.com with ESMTPSA id q18-20020adfcd92000000b00343e5f3a3e2sm13601037wrj.19.2024.04.10.08.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 08:26:49 -0700 (PDT)
Message-ID: <93bf3b2e-bf42-42d2-b10a-5586ee9efc6b@linaro.org>
Date: Wed, 10 Apr 2024 17:26:48 +0200
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
 <4162174b-df35-4282-859e-84b0579ff91b@linaro.org>
 <f5611116-df8e-4118-8aad-16561f65c79f@linaro.org>
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
In-Reply-To: <f5611116-df8e-4118-8aad-16561f65c79f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/04/2024 17:19, Vladimir Zapolskiy wrote:
> Hi Neil,
> 
> On 4/10/24 16:50, neil.armstrong@linaro.org wrote:
>> On 10/04/2024 15:11, Vladimir Zapolskiy wrote:
>>> On 4/10/24 10:52, Neil Armstrong wrote:
>>>> Hi,
>>>>
>>>> On 10/04/2024 09:49, Vladimir Zapolskiy wrote:
>>>>> Qualcomm SM8650 SoC has three CCI controllers with two I2C busses
>>>>> connected to each of them.
>>>>>
>>>>> The CCI controllers on SM8650 are compatible with the ones found on
>>>>> many other older generations of Qualcomm SoCs.
>>>>>
>>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>> ---
>>>>> The change is based and depends on a patch series from Jagadeesh Kona:
>>>>>
>>>>>      https://lore.kernel.org/linux-arm-msm/20240321092529.13362-1-quic_jkona@quicinc.com/
>>>>>
>>>>> It might be an option to add this change right to the series,
>>>>> since it anyway requires a respin.
>>>>>
>>>>> A new compatible value "qcom,sm8650-cci" is NOT added to
>>>>> Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml , because
>>>>> the controller IP description and selection is covered by a generic
>>>>> compatible value "qcom,msm8996-cci".
>>>>
>>>> You'll still need to add qcom,sm8650-cci to the "CCI v2" list in qcom,i2c-cci.yaml,
>>>> otherwise the DTBS check fail, even if the fallback is already present.
>>>
>>> I do recognize the problem related to a build time warning, my motivation was
>>> to follow the rationale described in commit 3e383dce513f
>>> ("Revert "dt-bindings: i2c: qcom-cci: Document sc8280xp compatible"").
>>>
>>> For a similar sc8280xp-cci case it was asked by Konrad to drop a new
>>> compatible, I kindly ask the reviewers and maintainers to stick to one
>>> of the two contradicting asks.
>>
>> This is totally different, this commit added a new compatible that is used in the driver,
>> while here, you use a per-soc compatible that is (for now), only used in DT and uses
> 
> I'm confused, please elaborate what do you mean above by "this commit" and "here".
> Could you please be more specific to avoid any possible disambiguation?

"this" refer to "dt-bindings: i2c: qcom-cci: Document sc8280xp compatible".

> If you refer to the driver drivers/i2c/busses/i2c-qcom-cci.c, then there is no
> difference between sc8280xp-cci and sm8650-cci. What is the total difference,
> which you found?

If there's no difference between sc8280xp-cci and sm8650-cci, then the policy says
you need to _not_ add a new compatible in the driver, which is what you did here.

> 
>> the generic "qcom,msm8996-cci" as a fallback because it is considered as beeing 99%
>> compatible and no software change is needed.
>>
> 
> I have no objections to revert a "Revert "dt-bindings: i2c: qcom-cci: Document sc8280xp compatible""
> commit and to update the change for sm8650-cci accordingly, but as I've
> already said it would be good to have and follow one common approach for both
> cases, since I based my change on the maintainer's decision from the past.

The "new" policy is to use a fallback of an already defined compatible if no driver change
is needed, this is the case for the last year so far.
And updating the yaml bindings for the new per-soc compatible is also a year-old
policy, upstreaming of SM8550, SM8650 and X1E80100 have been done following this policy
in order to :
1) reduce useless driver changes
2) have a fully verifiable DT against bindings, so we can ensure the DT is 100% valid against the bindings

Neil

> 
> -- 
> Best wishes,
> Vladimir


