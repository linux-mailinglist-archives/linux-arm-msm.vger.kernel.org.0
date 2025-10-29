Return-Path: <linux-arm-msm+bounces-79448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A38FC1A2A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 13:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A34B3A9167
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 12:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADCF338F55;
	Wed, 29 Oct 2025 12:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+zSlKYM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E0D2E6CDA
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761740408; cv=none; b=shmwyCtR4+sI88n5Qjhk4f/fUNWWpdCcQUDiwqQPtcKJukR6j6VZ66emMFreyYiaZmQvRoYHmFs7MPDRlQ4tlQPlvHAq5R53QIhNJQcSWGYbFY9O8988ym+FJ7pUbRhlbDOjtsQhQQnY/s9Y3ZB1w1gz+JAsis9znG6Qukh19f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761740408; c=relaxed/simple;
	bh=1Ya7qkOQEDdNbi09gHmO3z9rZVCZYmN2SBoOEI6PACc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pMQJgSN34jzuawqydmHwiwsHK3AN7YTpSXSgr1wWlhvRb4JXYcIlEBB30Fid8Pkoyz59WgfYwfH45qNdKwwosYEuTwWUjqWdyQ5hiVZXWPq4TlgokIEenZPor0+gEEqXpzQ2jWtNWDeR5zh4FhNeT8OWQH5yPltI5++gON34uGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+zSlKYM; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-33f9aec69b6so9823333a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 05:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761740407; x=1762345207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vyHDL+kvmpNavTHblJ9DGWC2vfEbREpLIB5luOfUbqM=;
        b=W+zSlKYMT0bua6TOOQUy6HJUfeQLiWUudO1oSVysP+DvpjMQtmFsjl6LUaytNyguve
         peaHH033ZT5zATHf9PNjAXWfEafOV9npzRf1vQ43e79G2EZWC1dA8+gUot06QnV1Te1t
         giMlYCS3C8YIm/Y9mOBkUgklqyk0c/G5vEp0ycxym0UM1l7iPSMmZKqF1ZRRWqLtUadV
         PiEeHIMPGFRN6A6/6M9+qMKAbO98Ih4HExykrC14vKYXaMyDfua8fJimeZ0yCb9UpBpf
         JAEl3EAQckmt1LMV5lSlpXrF6h7mUjbU/+4OMyXWWtT8GubVcK0ssYAaMT4/DwP7zRio
         +AKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761740407; x=1762345207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vyHDL+kvmpNavTHblJ9DGWC2vfEbREpLIB5luOfUbqM=;
        b=CFcFjBi4I6QSaonBjkPrWD7eOVG3f+/q4CsRv8qWhMOcoIAY0AHcUUBSBrHTMOj0h/
         4Knp4yDGzf5stlxFJnMHaN6b0xmnDQCiLlkKSaRYhKE287xGkQdnjgLmCBzI/vMnP6Da
         cH2CNl+TSGBA5aD6UKLIQslmLcgzTkXtL9DNgZxP0YoakbCnmTI5Ec9W+Yh6pRQJ2G/N
         zjOyyclgPRanOsW78ni40yMtVLLwz89tq4h0RhNPRHNhaSbaOaAB7yey3Acc2vi/k04P
         mzg4DFpW2zTCLZr0X5HFqhSD18K6w2qLtQzbc0+aYVoVqjvchCvqNNQXHrKrkEigtelS
         eNIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2dJwPZ8E05Q3zZVKbORAwdiZiKxcQ+z2MmgKvLdcNtx8aOEZMRSgqHGak5hEWTGxyYhjc4xwkJ4Jv15/G@vger.kernel.org
X-Gm-Message-State: AOJu0YxrUHynQw21y4j2TvkLMgqD9JSIr65Ifz+VVK4pNNRzbJF9h39e
	gTUNuFodGvQZbyTtO3nkMVA55CmVqsWmDKqSOuJwAtda3FtgCXiIrmnfm8pe/Q==
X-Gm-Gg: ASbGncvYu4Hm3Cg6FzBT4PwyjL0VxJTzc8QH0b1K+n8xBFikKqCZzqw2YPHjTHO3jMq
	FEcBcmE9Muv0bx0HIMx1Alzs8XRTe5MAGpHcSLcvjOZq8av0aXSd7D6WNxozaK5TXOcTWEusCRv
	JSXHnwnVYtqchQffhafiaNPhgScqTIPtSSDjXJmVrtF2WRs1KA5CEdcAq9Jihqd4QfYSROFkdKc
	1Yb0gDuq+GoF/GJjxqdtWp4MRdoHF0SkaApkFm5z/cYWZvDG3aGGCnDr/yMmKz6pqqLOaK2Nf3H
	RJ0gLnzhcnsVFMd1hFPY/1uveu5Lmt8X/wjhMg6d9cRTlAK4HWNJzn/jNWJ66r/ptWs3VdHkagF
	S9ki1bqJT9Mq9f9psrvMDBm1ZDrhYINbpPLekjZucX1jG/9VaXw/rLFDZpe3XyOLBE5PI4l8kN9
	XZiHezaAUiZT5f
X-Google-Smtp-Source: AGHT+IG4iUvvmVrCgSP0YCk+HtT00u5Cv73qchYGx6AbmE0/ypVfmBzPMDibB16MqRFuCBEdGpYg6g==
X-Received: by 2002:a17:903:2348:b0:25d:37fc:32df with SMTP id d9443c01a7336-294deedb5c6mr33673225ad.47.1761740406560;
        Wed, 29 Oct 2025 05:20:06 -0700 (PDT)
Received: from [172.17.49.162] ([103.218.174.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d2317csm150801635ad.48.2025.10.29.05.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 05:20:06 -0700 (PDT)
Message-ID: <9208d2ef-79da-4e80-ac1f-e01fa5feae0a@gmail.com>
Date: Wed, 29 Oct 2025 17:50:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: talos-evk: Add support for
 dual-channel LVDS panel
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251028061636.724667-1-tessolveupstream@gmail.com>
 <20251028061636.724667-2-tessolveupstream@gmail.com>
 <d05fe82a-640f-4a09-9d83-39bb5aff179d@oss.qualcomm.com>
Content-Language: en-US
From: Tessolve Upstream <tessolveupstream@gmail.com>
In-Reply-To: <d05fe82a-640f-4a09-9d83-39bb5aff179d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 28/10/25 14:55, Konrad Dybcio wrote:
> On 10/28/25 7:16 AM, Sudarshan Shetty wrote:
>> This patch introduces a new device tree for the QCS615 Talos
>> EVK platform with dual-channel LVDS display support.
>>
>> The new DTS file (`talos-evk-lvds.dts`) is based on the existing
>> `talos-evk.dts` and extends it to enable a dual-channel LVDS display
>> configuration using the TI SN65DSI84 DSI-to-LVDS bridge.
>>
>> where channel-A carries odd pixel and channel-B carries even pixel
>> on the QCS615 talos evk platform.
>>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
> 
> [...]
> 
>> +	backlight: backlight {
>> +		compatible = "gpio-backlight";
>> +		gpios = <&tlmm 115 GPIO_ACTIVE_HIGH>;
>> +		default-on;
>> +	};
>> +
>> +	lcd0_pwm_en {
> 
> Use hyphens instead of underscores in node names

Okay, will update in next patch.
> 
>> +		compatible = "pwm-gpio";
>> +		gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-0 = <&lcd0_bklt_pwm>;
> 
> I think your intention was to use pwm-backlight and wire this node
> up to that

Soc does not support the PWM interface hence we are using gpio 
as "pwm-gpio" by setting the duty cycle to 100%(i.e. "no pwm")
> 
> Konrad


