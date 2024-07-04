Return-Path: <linux-arm-msm+bounces-25242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C489270C5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 09:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED78B1C22F08
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 07:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8321662F1;
	Thu,  4 Jul 2024 07:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wak+oT4g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CD91A254E
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jul 2024 07:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720078787; cv=none; b=qa9aFMPIlFxBwnGHjiCtWmrkgDwFbMZNJlsAsCDoTKiCZJHTGqg8B9lil8Ms/YBRvXyrc2sJ57tPkq5PSXWG6U4ph76m09h/6juoeQdNhPG7zMaXCMotSrEIRknQe5uRevVxxEwTLXSr6VK7E118oVzuyySF1htVXFvZLWxNOzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720078787; c=relaxed/simple;
	bh=KapxeyYzAQKK9VihCD8Q2JtVxMe/HKtCBlSBlzUDaGk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=e5AtKK50RlPIhiLHP2dIVr+fRGx9QZNz4vbeQpg4rbQP2gujXgKobNJIEg/He595VBbV2ABaEVzTdkTWWRaWj7Bt9HhfWUAOAZWbZX9Yp5b7W3hcuXRZZD3onzflVNeWznEYBRgY2GqURVUa0oEFTmtxIKaQKj/u/szXcM0jAHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wak+oT4g; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52db11b1d31so466183e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jul 2024 00:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720078783; x=1720683583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PApFyRu0/EMQaGECbDmooQHO9ebJuXOQ4gSJ19eO3PM=;
        b=Wak+oT4gbPMiNk7JQRAQJhzI425lG7Gp0ywRO5GGHHZ/Tegu9acjPxiaTlp3GCk9nj
         lF6Q6t5p86QYSE6Oc68c4ftsrJf/xYUsMmNFel46PeNVI7MOvX0ro6UnbY+7tkDau/OX
         18PL0iiNb3TYYVESwGVGX8S/FldRuRkJ8YwFctUwISuNmh/MpppAmp2gvtlU7KYz0oA+
         W8UqxfMuSbt4pl6zZBUuS8PMeOwwbwnbUt8WTyAz/BVpAlWxiYTmhwBYgtSWaWuKsv46
         vSYv6UVb4X9nCVoV5KhhJwroTqJyEmm55jMAqwMnpZNRSQUk2lyp6CSl5jEnPZS2x6Mi
         5leg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720078783; x=1720683583;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PApFyRu0/EMQaGECbDmooQHO9ebJuXOQ4gSJ19eO3PM=;
        b=UcXGJtKyJzA6hXtsN/4nGIhpb2BThwm9yTQA0nJNF/rsyn9ZFskRBx1QkKtN57P2rh
         kRGEBM4/2ABMCwhF5tesIaGfpdkssByrVvMYNwWVgCEtBVcYNh2xBMZt7IO/BmU97hi+
         oZel9UII56lYiRVwvXn9lN1s2BFBlb5g+UxJhI4UDfKHyPYLF/Ekv7ovsJiyiCHKcTy+
         paPaJHqfDnpaL+WkRYAHyk0BlMVYhKJ9KkfgzpgPte4nR7j9fhh5IKM7agpRpzFKe8De
         TuOxlrWghciLr9Ualdti5k8ZrgReQwfBhF+RZpaZIKIYOz984AT4Vnsi8IMyFdV0N5yJ
         xIIw==
X-Forwarded-Encrypted: i=1; AJvYcCUnEzyHwGlK4h5IF0TB1jezOCFdhPO24mk6hi1ZxmDh26hrK02dR8De/PBGP6pQdh0zQwDvp7Ucsga8ucHEfed+JiG2foYIEmOtg3YHCA==
X-Gm-Message-State: AOJu0YzC6pIfRmiXG+yzqh8QIEJdvFdiqvVXk1iWoVPQ/t2POb+cSfln
	7xJ9tN60/VmoFUgHYtJTxef+CBvY++K+R9c6B91dPvHgLlZTg/SpxQdE1uKzuSA=
X-Google-Smtp-Source: AGHT+IFDsgws2ZUxwzfIfmeK6zGAw/81QNzfDvM8ZKA8y7lQzsk4mTBSR6dikk2P2JaZtN7BZmfD5A==
X-Received: by 2002:ac2:5a41:0:b0:52c:84d1:180e with SMTP id 2adb3069b0e04-52ea06ddeefmr468360e87.67.1720078782969;
        Thu, 04 Jul 2024 00:39:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bf0c:e5a4:4535:f45c? ([2a01:e0a:982:cbb0:bf0c:e5a4:4535:f45c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2fc8bcsm12665685e9.44.2024.07.04.00.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 00:39:42 -0700 (PDT)
Message-ID: <636922b4-96d4-49cb-9020-2359e7497f56@linaro.org>
Date: Thu, 4 Jul 2024 09:39:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] thermal: core: Call monitor_thermal_zone() if zone
 temperature is invalid
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux PM <linux-pm@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Lukasz Luba <lukasz.luba@arm.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Zhang Rui <rui.zhang@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <2764814.mvXUDI8C0e@rjwysocki.net>
 <2ed4c630-204a-4f80-a37f-f2ca838eb455@linaro.org>
 <8d91a3c1-018f-495b-83be-979b795b5548@linaro.org>
 <12c5c133-9519-4a26-b9a3-2da1d3466e94@linaro.org>
 <15b67ce6-3238-435d-ad28-7c06efbe9153@linaro.org>
 <ce6c2e8a-65a7-4cb2-a91d-fbcaeef6edc1@linaro.org>
 <0c4b401e-86b8-4169-af88-475433012d67@linaro.org>
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
In-Reply-To: <0c4b401e-86b8-4169-af88-475433012d67@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/07/2024 17:12, Daniel Lezcano wrote:
> On 03/07/2024 16:42, neil.armstrong@linaro.org wrote:
>> On 03/07/2024 16:00, Daniel Lezcano wrote:
>>> On 03/07/2024 14:43, neil.armstrong@linaro.org wrote:
>>>> Hi,
>>>>
>>>> On 03/07/2024 14:25, Daniel Lezcano wrote:
>>>>>
>>>>> Hi Neil,
>>>>>
>>>>> it seems there is something wrong with the driver actually.
>>>>>
>>>>> There can be a moment where the sensor is not yet initialized for different reason, so reading the temperature fails. The routine will just retry until the sensor gets ready.
>>>>>
>>>>> Having these errors seem to me that the sensor for this specific thermal zone is never ready which may be the root cause of your issue. The change is spotting this problem IMO.
>>>>
>>>> Probably, but it gets printed every second until system shutdown, but only for a single thermal_zone.
>>>>
>>>> Using v1 of Rafael's patch makes the message disappear completely.
>>>
>>> Yes, because you have probably the thermal zone polling delay set to zero, thus it fails the first time and does no longer try to set it up again. The V1 is an incomplete fix.
>>>
>>> Very likely the problem is in the sensor platform driver, or in the thermal zone description in the device tree which describes a non functional thermal zone.
>>>
>>
>> It was at 0 but the delay was removed recently:
>> https://lore.kernel.org/all/20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org/
> 
> Yes, these changes are because another change did:
> 
> commit 488164006a281986d95abbc4b26e340c19c4c85b
> Author: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
>      thermal/of: Assume polling-delay(-passive) 0 when absent
> 
> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> 
>> That doesn't explain it because only the last platforms have this error message printed.
> 
> Let me recap.
> 
> It has been reported if a thermal-zone with zero delay fails to initialize because the sensor returns an error, then there is no more attempt to initialize it and the thermal zone won't be functional.
> 
> The provided fix will periodically read the sensor temperature until there is a valid temperature. When there is a valid temperature, then the interrupts are set for the previous and the next temperature thresholds. That leads to the end of the routine of initializing the thermal zone and cancels the timer.
> 
> The platforms you reported, the delay is zero (before and after the 'polling cleanup').
> 
> My hypothesis is the following:
> 
> The thermal-zone29 describes a sensor which does not operate.
> 
> Before the patch:
> 
> First attempt to initialize it, the temperature is invalid, then because the delay is zero, the routine stops, and there is no more attempts to initialize it. Nothing will happen to this thermal zone and it will stay stuck silently. So at this point, the thermal zone is broken and you don't notice it.
> 
> After the patch:
> 
> The initialization routine is constantly retrying to init the thermal zone.
> 
> -------------------
> 
> If you revert the fix and you try to read the thermal zone 29, it should always fail to return an error.
> 
> If I'm correct, then I suggest to identify what thermal zone is 29 (type file), identify the node name in the DT, find the tsens channel and double check if it really describes an existing sensor
> 
> 
> 
OK I just found out, it's the `qcom-battmgr-bat` thermal zone, and in CI we do not have the firmwares so the
temperature is never available, this is why it fails in a loop.

Before this patch it would fail silently, but would be useless if we start the firmware too late.

So since it's firmware based, valid data could arrive very late in the boot stage, and sending an
error message in a loop until the firmware isn't started doesn't seem right.

I think Rafael's new patch is good, but perhaps it should send an error when it finally stops monitoring.

Neil



