Return-Path: <linux-arm-msm+bounces-17207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 573E78A0CEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 11:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D22A81F22F40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 09:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377CF145B05;
	Thu, 11 Apr 2024 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tPb7E83u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D6E145345
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712829447; cv=none; b=dHJ1kgMyi1xQsNHoPgTrLSNcd0CM/D5evKU33d0ZO2wICsTiWvN6JO1SgJL+23wiPHVyHdnigQvzvbx9GochTCYDTtVvl0u0UlkwPj5omXX3ODJRqoR/GGjjOpIrmQG3FNBKf5OZd0lpB9jYaLAq/6ISjVPW4JaN8diqdm5ROM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712829447; c=relaxed/simple;
	bh=Wl2rfbDkNcvdaUwmseUqc9G7aGJDEjD2pVss9TNNkK8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DSux/RDPsrW52T5FsNyMH1JhSiKvJoQHedfzWZzt3JA/LrDcv0yS2zg6NZSTdGVXszLzgNKknuE+o/nXVNZZws7zNJN01adyCIyxdH64Nrzu4Da9j+vESSuLprh4rOdSTczjlAin6EMHmPpsOGFe6JL6Ae4By2YXiyOQtGAyXas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tPb7E83u; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-516d0c004b1so9148681e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 02:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712829443; x=1713434243; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y27dFQLhHTNJk4xW/x0GiFoKrdW8RjD8ddYzvU2JnUY=;
        b=tPb7E83uj/8pCOOCYJG6mhRR81zl8zCLl/AEEYqGUWwAZtd69dSOIVTmKJv+MxDnjP
         N6aH6PoYdgME+tXBfmQcY8seqvI/Zi83niTs47NDe1Uq990X5NN76coTew0HULiA0Yu6
         Y+0d0A75cueepJXeMsqeGrX6XqUPpEHDudQ/kxfa0CIJLAC9zgrYeloNKg9JlIxJ0Zie
         /6XBy70PVXkaYFzIrMrqFe3y7v55lQ/IuU52kyzeAanfLxlsaAv6afmc6kXqyWtGECco
         zWZiGE71JAprvm91eWAOi7pHeBxc+mRpYQhEycKpemSEdYRFZmPvtQrYsXl1aJS9x828
         AXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712829443; x=1713434243;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y27dFQLhHTNJk4xW/x0GiFoKrdW8RjD8ddYzvU2JnUY=;
        b=p2xzxdNFjuD0rBvsVK2l3cPAs3wF4XBcnRW28Gzb/go6M3BTfV4xRZct2vh+cRDqKv
         FfP7JQgvnjd35WyT3hhAZ+KjcEepu11TaHoA3AE0uroaRO4Ay7oSARl3NURfnSSx9QDO
         R1zQaWOkukzATQ6W4yh7/9t3JarAZv/i0VhDLYC+goisOPozT46C8yzNS1qoY5WoDvPm
         j6JXrAa5Q8VsLbU2/OGrb8PaHPJnbnhvQsskahs3Czpj/niRNPwYCDXFWijgHg58v+sm
         JiPr8TPnXj2Zr71eIhAOLzL08y5bo+h9WktVZdesnQPADY7KaJmrq0lOwFROImdKShWt
         cq+w==
X-Forwarded-Encrypted: i=1; AJvYcCVm/DnMKDLF783EvHmqmw4L5wvVVOtFfj+tQrBiYAANmg+iVSDYFd4xGGhbnOtVvOBs4a3SzRRd7thf0Dypq+fG4Q+70JDK4MyR4+hz1g==
X-Gm-Message-State: AOJu0YwYs+Ca0jiMOgMlWnrOjzMAf0EselsdYYRO9W7TJmKsEwFx2o/k
	MA12VbXLLw7xD6wcQqkBHalSR1yQjjohHeQ4evoZr2+60KG0kRlN2z5cGfRq0c4=
X-Google-Smtp-Source: AGHT+IHWb4o9DT2saToRoEUO7uwMePeJ5bB4LaVvspYsH1F6PdTl677fMQmZH+iwQvUty4ihnscBrg==
X-Received: by 2002:a05:6512:971:b0:515:9aba:743a with SMTP id v17-20020a056512097100b005159aba743amr3717033lft.59.1712829442905;
        Thu, 11 Apr 2024 02:57:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9b22:a845:661:e15f? ([2a01:e0a:982:cbb0:9b22:a845:661:e15f])
        by smtp.gmail.com with ESMTPSA id h7-20020a5d4fc7000000b00341ba91c1f5sm1363836wrw.102.2024.04.11.02.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 02:57:22 -0700 (PDT)
Message-ID: <2ba516e7-56e3-450a-a82e-a3cf8c5d8b58@linaro.org>
Date: Thu, 11 Apr 2024 11:57:21 +0200
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
 <93bf3b2e-bf42-42d2-b10a-5586ee9efc6b@linaro.org>
 <0fab9fb5-7d20-483b-9d40-c015bb8e2577@linaro.org>
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
In-Reply-To: <0fab9fb5-7d20-483b-9d40-c015bb8e2577@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/04/2024 10:46, Vladimir Zapolskiy wrote:
> On 4/10/24 18:26, neil.armstrong@linaro.org wrote:
>> On 10/04/2024 17:19, Vladimir Zapolskiy wrote:
>>> Hi Neil,
>>>
>>> On 4/10/24 16:50, neil.armstrong@linaro.org wrote:
>>>> On 10/04/2024 15:11, Vladimir Zapolskiy wrote:
>>>>> On 4/10/24 10:52, Neil Armstrong wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 10/04/2024 09:49, Vladimir Zapolskiy wrote:
>>>>>>> Qualcomm SM8650 SoC has three CCI controllers with two I2C busses
>>>>>>> connected to each of them.
>>>>>>>
>>>>>>> The CCI controllers on SM8650 are compatible with the ones found on
>>>>>>> many other older generations of Qualcomm SoCs.
>>>>>>>
>>>>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>>>> ---
>>>>>>> The change is based and depends on a patch series from Jagadeesh Kona:
>>>>>>>
>>>>>>>       https://lore.kernel.org/linux-arm-msm/20240321092529.13362-1-quic_jkona@quicinc.com/
>>>>>>>
>>>>>>> It might be an option to add this change right to the series,
>>>>>>> since it anyway requires a respin.
>>>>>>>
>>>>>>> A new compatible value "qcom,sm8650-cci" is NOT added to
>>>>>>> Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml , because
>>>>>>> the controller IP description and selection is covered by a generic
>>>>>>> compatible value "qcom,msm8996-cci".
>>>>>>
>>>>>> You'll still need to add qcom,sm8650-cci to the "CCI v2" list in qcom,i2c-cci.yaml,
>>>>>> otherwise the DTBS check fail, even if the fallback is already present.
>>>>>
>>>>> I do recognize the problem related to a build time warning, my motivation was
>>>>> to follow the rationale described in commit 3e383dce513f
>>>>> ("Revert "dt-bindings: i2c: qcom-cci: Document sc8280xp compatible"").
>>>>>
>>>>> For a similar sc8280xp-cci case it was asked by Konrad to drop a new
>>>>> compatible, I kindly ask the reviewers and maintainers to stick to one
>>>>> of the two contradicting asks.
>>>>
>>>> This is totally different, this commit added a new compatible that is used in the driver,
>>>> while here, you use a per-soc compatible that is (for now), only used in DT and uses
>>>
>>> I'm confused, please elaborate what do you mean above by "this commit" and "here".
>>> Could you please be more specific to avoid any possible disambiguation?
>>
>> "this" refer to "dt-bindings: i2c: qcom-cci: Document sc8280xp compatible".
>>
>>> If you refer to the driver drivers/i2c/busses/i2c-qcom-cci.c, then there is no
>>> difference between sc8280xp-cci and sm8650-cci. What is the total difference,
>>> which you found?
>>
>> If there's no difference between sc8280xp-cci and sm8650-cci, then the policy says
>> you need to _not_ add a new compatible in the driver, which is what you did here.
>>
>>>
>>>> the generic "qcom,msm8996-cci" as a fallback because it is considered as beeing 99%
>>>> compatible and no software change is needed.
>>>>
>>>
>>> I have no objections to revert a "Revert "dt-bindings: i2c: qcom-cci: Document sc8280xp compatible""
>>> commit and to update the change for sm8650-cci accordingly, but as I've
>>> already said it would be good to have and follow one common approach for both
>>> cases, since I based my change on the maintainer's decision from the past.
>>
>> The "new" policy is to use a fallback of an already defined compatible if no driver change
>> is needed, this is the case for the last year so far.
>> And updating the yaml bindings for the new per-soc compatible is also a year-old
>> policy, upstreaming of SM8550, SM8650 and X1E80100 have been done following this policy
> 
> I'm sorry, I'm still failing to understand it, it's trivial to check that there is no
> "sc8280xp-cci" in Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml description.
> 
> Despite my multiple asks I did not get an answer from anybody, if commit 3e383dce513f
> ("Revert "dt-bindings: i2c: qcom-cci: Document sc8280xp compatible"") is wrong and
> shall be reverted or not.
> 
> Since my point of discussion is all about the commit 3e383dce513f, because sm8650-cci
> change is based on it, I hope that my original understanding that commit 3e383dce513f
> shall be reverted, I'll send the change shorty.

No 3e383dce513f shall not be reverted, this has nothing to do with sm8650, just send a patch
adding the qcom,sm8650-cci entry in qcom,i2c-cci.yaml following the latest version Bryan did:
https://lore.kernel.org/all/20240111-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v4-0-cdd5c57ff1dc@linaro.org/

It was probably reverted because the if/properties/contains for clock/clock-names settings was missing,
and you should probably do the name otherwise the dtbs_check would fail.

Neil

> 
>> in order to :
>> 1) reduce useless driver changes
>> 2) have a fully verifiable DT against bindings, so we can ensure the DT is 100% valid against the bindings
>>
> 


