Return-Path: <linux-arm-msm+bounces-87962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C5AD00286
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 22:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8999B3003499
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 21:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5CAA218E91;
	Wed,  7 Jan 2026 21:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a5nxX0hI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39A731C576
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 21:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767821066; cv=none; b=Tq8DgFOEKej9liaAG4ubge2eoyhfWWKQFCF8ZcSVd1dsqXKcY0yc3lMY5TXMZtEtqZIyTqzyWi8eF+eWyKBXXhzv93lTvJUHByIKjn9KwUx1SE0ZTzixJwZsfiW0Uy6LyU14duWIp6aqhTKbyD0I9WX0lqtAyVDPKGcsUhSkgkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767821066; c=relaxed/simple;
	bh=xuhPSFxHT5dicps+AzXUc5xZwOnIs5QdImrqvGMjdcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cz7QBZ65wuQ97KtfeJIFbeiJuwbFlySOrPNf/uy03JN6yL8ITSKxHc/m+sRsUoG9vc0O/EWhuq/vex3d1IjXWSqvFNTqm6p6z93FQJNjRTpiR3Ys8Vw/l0OrC4qU8dNIeSJzD/9SMXRHbPqwKY4CAdXsT9d3OpyDnZo4G/UdN3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a5nxX0hI; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-382f99274e1so1567511fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 13:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767821063; x=1768425863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/TDnZeMqywPB6R9BWNPYGT+EayXhfAhq0K6Z+LpKaw=;
        b=a5nxX0hIAJ7aPbLMg7vlyFUOibQiu4qYt8ZBwnIxOwZ8k9dR7oCCCp1EyKKsSrXeq1
         B11XTAWscz6iDk0WdBAzV369nddJIYyibBLDzoov3b/neArkP+UkFujLlkdyU+m6/gCq
         R0+lKQkQtOBpCx4uokSDMUJroxyBGtPbjy5W7uPjw25NWyG2ze1JlzziWQ8f8n4ts2rJ
         7bLc9ePxZo60ovhicFtEMmvKJfZGxZ/PB+mKPKRMnly6QL9PI/6RxrM0cMxdhjxP2wWS
         4Zqo/NCH3w28WQaKZFr5QufFwkzGyZFjWrwIapHE30F4Ftfr2D0EvTeQLS18OKayaP90
         5Ijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767821063; x=1768425863;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/TDnZeMqywPB6R9BWNPYGT+EayXhfAhq0K6Z+LpKaw=;
        b=CUrmwiMhUpwgJ/sjQR/SGDKvuqPAxAx48eQUhI12xAGSjpe75RnFQaPf9766zdEwZU
         YYFadLKt/p3EynA0X+b0hyExydYL4xF74x4KhkVsLEMEbJonXhqDQNAATpBDFKIVbpte
         8fs6VesLxDLMvVzPlclDU2wIEYrDDkDxO4bU8xmI5YHYVkYWlLRxin/1HHrGBv8K/bID
         xuERDwio+K5lOcJpTCc6BUJ/NMFv36libJ+maoUSZ6Xpu+YCsh55NT3kTNrdA4a9dUwn
         8C+psp89D3PyJANnTmW2Bk4q1cx722v0e389iIlwrBK2GBqku7/rUG414+Yo2aYgOww7
         A3Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUmcm1QCB8FGPaHlfNp4THpyk5P54TMBZ424+O19w+xoaprVpag8TojcqhrwJoRcfbkJST1WCmh/w2J2aMQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv59WILDMye8Y+Hjh9mnbRkTdCfvhFYogQPYVM7iNhLp26CvP3
	fpXp3i4LDQB1+FYXtnpjVOIdAAZlwIry00X/t3+Xik/Rn37Nr/pjYl8kW8JD6ZxqdNo=
X-Gm-Gg: AY/fxX4MZbqkZOThgAmoLpQrd4x6aUtKF2XwQtEBbXN/DyOtR3na4RcX8MjeH1jloGk
	3RU44OBVmjDgtz/S1iRDb8DXgNmeuX6AMEriSgs3mKHjZ31+ZSidSfCP4sDowXasK0poATzqXCO
	eIC8Hqv6EqlRjr0qttBHxUogE3k7Qpw9qwR4YeQlIrkA2EqvJXjxL8u2yWk65rnqGuw86ttUuja
	37S/rdmMQ7HtCSYInEhTbxcIFeSn0RrYcGryV1+4H2wqMdD7fn+cyiXb/gA25mU8o0pY+GJznev
	9idUa6WA7KX8zapfZYYKr2s8AKRkNGpYHltAjZU+mdhrGK5SLlUjw5JidKS8lvd38r5zBsaTA1E
	2Lmv7jhnfxLHxAKkz8gjLvpArhgDSlzHPjrrivdim8XMApgk9zOkQDcivcnH2SwvZtkVNRjUaBO
	Psuy41BTL1vUZ/gEBlNfCJPJcB9YlLEjO5Rah1Mf1C0O3eBeGrBeNniJhePSy2FOS59g==
X-Google-Smtp-Source: AGHT+IFfcRWxAkywDeN2SZBwl0HWgo5W5lepeGrLd7xnmJgoH3TiNoELSgeJNH2HwayG/aI4gRkMSw==
X-Received: by 2002:a2e:bc15:0:b0:37e:6e31:c9bc with SMTP id 38308e7fff4ca-382ff8256famr6465671fa.8.1767821062911;
        Wed, 07 Jan 2026 13:24:22 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb3a0039sm11811641fa.4.2026.01.07.13.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 13:24:21 -0800 (PST)
Message-ID: <6d2a582d-a738-4f1e-97c1-d8ee6d9b0882@linaro.org>
Date: Wed, 7 Jan 2026 23:24:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
 <ndexzb5bo2rxjsj7jkf3bevbb6vmtjpuuhxbonpf3v5csxnjtu@sotufkkvfc4r>
 <f09670ed-1aba-4622-94b2-85ade831f7fa@oss.qualcomm.com>
 <e91414c6-fc89-4b38-a5be-f282c8601b5f@linaro.org>
 <3a8e8327-1a55-4822-885a-86fec029952d@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <3a8e8327-1a55-4822-885a-86fec029952d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/7/26 07:55, Wenmeng Liu wrote:
> On 1/7/2026 1:16 PM, Vladimir Zapolskiy wrote:
>> On 1/7/26 05:05, Wenmeng Liu wrote:
>>> On 1/7/2026 2:23 AM, Dmitry Baryshkov wrote:
>>>> On Tue, Jan 06, 2026 at 05:39:56PM +0800, Wenmeng Liu wrote:
>>>>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>>>>
>>>>> The Talos EVK board does not include a camera sensor
>>>>> by default, this overlay reflects the possibility of
>>>>> attaching an optional camera sensor.
>>>>> For this reason, the camera sensor configuration is
>>>>> placed in talos-evk-camera.dtso, rather than
>>>>> modifying the base talos-evk.dts.
>>>>>
>>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>>> ---
>>>>>     arch/arm64/boot/dts/qcom/Makefile              |  2 +
>>>>>     arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 63 +++++++++++++
>>>>> +++++++++++++
>>>>
>>>> Is it possible to attach other sensors? If so, overlay name should
>>>> depicit which sensors are attached (compare this to the RBn boards where
>>>> specifying "vision kit" defines all sensors attached to the device).
>>>
>>> Okay, we previously had a discussion on this. I will rename the file to
>>> talos-evk-camera-imx577.dtso.
>>>
>>
>> Other camera or display .dtso names commonly repeat the name given by
>> the vendor, and the bare minimum is to name it the commit message or in
>> the code. Is it Arducam 12.3MP IMX577 Mini Camera Module or something else?
>>
> 
> I believe that modifications for the sensor do not need to include
> Arducam descriptions, because this DTS is intended to support this
> sensor module. Even if it is replaced with another vendor`s IMX577
> sensor, it should still work.
> 

Most probably yes, if the connector type and its pads are one-to-one equal,
but before such another camera sensor module appears, it makes sense to
mention at least in the commit message the exact type of the sensor module,
which has been tested and supported by your change.

Hopefully, it should not be too complicated to add a line into the commit
message, that the change supports Arducam 12.3MP IMX577 Mini Camera Module.

-- 
Best wishes,
Vladimir

