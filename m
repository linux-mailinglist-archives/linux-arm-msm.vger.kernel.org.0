Return-Path: <linux-arm-msm+bounces-72928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B8DB511B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 10:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5CCE460B65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 08:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C183115A0;
	Wed, 10 Sep 2025 08:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bx1M4qmF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725F3310644
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 08:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757493770; cv=none; b=YMyyLRyyVocIoypCqk36sswlZ+AUymteNYxZTn6umwmWTDi6e10rJ4B+xGbDxI9ho99zIGCPjM0/6qKTE5wIL8EzpSk6qPQWohKCM7OaamyZEZVu3o1qaDDXvgIROD9yDJdjyflwIqO0e+YPZWqtdc/mFtWlDUsxpNZhxhpW5K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757493770; c=relaxed/simple;
	bh=sI6ml4hTh+NeJSK15fW+krN1+UqokRd841kdomv2beQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=en1GY4Yj1lL6PzAp7XnXhuUh51vI5STtvY4LUwpWpFNseDpGjhPbrEq7sIt8M6AJ/RKlFFgQbyCsnlC6AYkzqNnV7NdT7z5FE6fYj7OAwtp0UEdPtCzDJHAN3LYmgIFzNJ7HIt4cmz/AQlbatpEWIZbi+k+2j8dZstpBuwr1d4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bx1M4qmF; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso40550075e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 01:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757493766; x=1758098566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lquJ5PztwzuglOeRIwX9xUr/VMazVnds3G/8YT7Fvc4=;
        b=Bx1M4qmFf/fvaj3xSI0o53J5qtElAsxAMW1njKe6tJotp2Wb/bA4qKFPyEtv7gXFdj
         8N4jddmgJAxc9vNGVLYGK1UefzsF45pDTMRResB/tREqius0PgCZX40EZqfdXzvPc5uA
         l0f/6i4hCZqC7Xfqe4u2yQ4UEPurbbJYkDxtF96QC7e361+U+DurXtgYBBwg7E0mK9WO
         At9ECdgJOu2PLhWbvjhGxomW/tRoSr/5CvK5HOz45T54WwhH1utv8jA/Ygn9PjfgHkQj
         I5QQeLK1xYSZKCM9ECgV8CyJFI+79OTFB0FetDgbvylR1agpfuMZf0S23ra73H6uI/gF
         KdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757493766; x=1758098566;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lquJ5PztwzuglOeRIwX9xUr/VMazVnds3G/8YT7Fvc4=;
        b=HDgCATCUxYSauP+qO55kpi34jzGuqvRq4MpodaBcyV2E2pCczFqgFLtw89HiSWcOl5
         ZgGpg9SJ+jvfUnygl184IPu2HwR92wPUjp+sOy2PwlJR0qhBqKJ2m0sdJseBRSVBkbg3
         TkbcCEusGXMnukojnHthrwbU5zS4Br2q1c2auBQdrnMqAUiDyTAYSwkdDohgK0B5jeRW
         IfwINOlpXhw4QcMTanLQOdddJ22qJnZTjbEXEQxuYRMh7RgVOL5rtFDII+6oaevNFOKE
         5glSYZNGbVGd9G3yyHYodue2GTdnUrCogh1evAs6ryD5Dp0LTU7031FLbsFMEBvhuC8q
         mAfw==
X-Forwarded-Encrypted: i=1; AJvYcCXKjYSFzuU9D5woarqpo5HX0AGH+cpRRY9JniaIP60yM/41JSHnorMZvKjxn/4SJSFUzaELXmGehVpaxyCc@vger.kernel.org
X-Gm-Message-State: AOJu0YwPRYwZdDlgTCqOJcRQANaEDvGk/ahgKCKo6rQ3I5MDJnjXTTD7
	ChGQIY1D/i8DzZLP/JYrZnT5SmQ/xKUzKjwI3UkdDXahmWme/zYB01tz1GcKKGkBibI=
X-Gm-Gg: ASbGncvSWhEdch93PCciSKMiKP56VoNB4nwFwDamdgduKEi8y5IfqKP6BdraNVwuJim
	xIe31xEbTWREq13a1h8t7YqnNXw86iOsVVTma001pau5Wkb/Ru0Rp8pRW76K6GTetlB5Xu07n9W
	rkIGV23+r0FcIwufdfrhIhwVITOCKwNXGabtKaNUCClfz8jz2BoIZR4YsK+TqWyynYNZhLa8Kj5
	jSJg5hHuk2fSa8+U05DrJYPX7H49nhX/y8hM5IawIeQ5THrYqXbKCVh0z2Nfs97huvuWsrJ2ZW1
	uGerYnJEYn0SaWazzJeTrkmSUeeP1K2dld5vWXWH529GAEYBN4GmSUJl9PZQg6vF28dgFWRA5ha
	TRb34TgX5SRQ8ut3L1IqTdk05P6dH6Q1UlcqzrB6yr2zoALDDbjydSPJJysvtwAENnk0mmpmQjc
	jqaHDWMcFkzGd1mg3fkmw=
X-Google-Smtp-Source: AGHT+IHVjNthO4SktB1Xz75HnDS8/BmjdCNmc8dzepzAh2MGw5GBwzE8aoUhNAen8jMgrcMcoay5OA==
X-Received: by 2002:a05:600c:474e:b0:456:1b6f:c888 with SMTP id 5b1f17b1804b1-45dddecd894mr125340515e9.23.1757493765680;
        Wed, 10 Sep 2025 01:42:45 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247acbsm19112915e9.13.2025.09.10.01.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 01:42:45 -0700 (PDT)
Message-ID: <c7635e11-d606-4e65-b48e-d8c26ee7be1d@linaro.org>
Date: Wed, 10 Sep 2025 09:42:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Add qcom,qcs8300-camss
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-2-quic_vikramsa@quicinc.com>
 <f1e3c3a9-9929-477a-b1ad-e485c059cbc2@linaro.org>
 <d16d40ab-8a35-4886-b11f-2eee15849e1c@quicinc.com>
 <8c1163ad-6e65-450b-ae44-c9a71a045333@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <8c1163ad-6e65-450b-ae44-c9a71a045333@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2025 08:42, Krzysztof Kozlowski wrote:
> On 10/09/2025 09:26, Vikram Sharma wrote:
>>
>> On 9/10/2025 12:35 PM, Krzysztof Kozlowski wrote:
>>> On 13/08/2025 07:37, Vikram Sharma wrote:
>>>> Add the compatible string "qcom,qcs8300-camss" to support the
>>>> Camera Subsystem (CAMSS) on the Qualcomm QCS8300 platform.
>>>>
>>>> The QCS8300 platform provides:
>>>> - 2 x VFE (version 690), each with 3 RDI
>>>> - 5 x VFE Lite (version 690), each with 6 RDI
>>>> - 2 x CSID (version 690)
>>>> - 5 x CSID Lite (version 690)
>>>> - 3 x CSIPHY (version 690)
>>>> - 3 x TPG
>>>>
>>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>    .../bindings/media/qcom,qcs8300-camss.yaml    | 336 ++++++++++++++++++
>>>>    1 file changed, 336 insertions(+)
>>> So it turns out this code is wrong and you already sent fixes for it.
>>
>> Hi Krzysztof,
>> Thanks for your comments. These bindings are tested with TPG (Test Pattern Generator), As camera sensor testing was not possible at that point.
> 
> You cannot test bindings with TPG. It's impossible.
> 
>> This is because Monaco-evk kit was not ready which can be used to enable sensor.
>>
>> These Bindings are complete in its own, If someone want to use TPG.
> 
> No. You do not understand - they are not complete if you add new
> properties to them!
> 
> How bindings could be complete if you add now supplies!?!?
> 
>>
>> My latest update in these bindings are for camera sensor enablement which needs supplies too.
>>
>> Please let me know if this justification works to accept these bindings it its current form and add supplies as a separate patch.
> 
> NAK. Read writing bindings doc. Or internal docs.
> 
> Best regards,
> Krzysztof

@Vikram

Could you send an updated dt-bindings with the supplies included ASAP as 
a v4 of this series ?

The -supplies in your email here look fine

20250909114241.840842-5-quic_vikramsa@quicinc.com

Otherwise we will have to drop this binding and the associated driver 
changes.

---
bod

