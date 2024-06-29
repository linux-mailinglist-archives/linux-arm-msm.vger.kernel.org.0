Return-Path: <linux-arm-msm+bounces-24725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D4391CCFE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 15:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77B851C21199
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 13:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06FD7EF09;
	Sat, 29 Jun 2024 13:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hVLXm+Uy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1375577107
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 13:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719666557; cv=none; b=dRuPOmfi9Enu+7vFNlOEm3SnUnybXLntigA3Nfla9vORbUiWyIYBsNafJ1aKAAlKTVXs1voCZFvBK3kpgv1PhQeJePwp01BWE065Pktp9y7bKoC/+AWT3RW9NXEbZvr9KjALENQla7cAjjS/dKh7T4BGB73aGD4Lg8o7EQZ9Oy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719666557; c=relaxed/simple;
	bh=5HcREViO2ZDmFrPzvgNo6tpoLDPXkXeQ1vOIWwIOy4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MLYRLi0ODE4boa1INTdT3XF9LMLdmGMY0YgXshUHW8IDSFch1s+93ymDvIkSHX1qtj6E3MYokRGNUzUvDi5I34LK10fqNyy/W+AY3koBITn8QRoUVaE+QN4Khd+94aRdF50b69Va/n+sCgg7+KufImv2qOYRQsP9LKu6WPos9Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hVLXm+Uy; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57ccd1111b0so966324a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 06:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719666554; x=1720271354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=szW+qpHen639wDwHyYUuN0+gHXUW14bCmbG+jcL15DE=;
        b=hVLXm+UyjVfpKM16PGEuCpVFB3dobjfum/UMBluf3PjgdN4eP8yohhikIJmjDuVyjU
         WOU+Supzdk3m6GVGXtmi4JySqodA0UjrSeqi01SS0EvlPBw6ZdcA7QlpLT72978V623Y
         vSfua7MwbPQKiTqOUfpcTT3fIiizgFBMkXS0JcFMGvWGVkTBpTZCvQq9S2nWsWsrCPNJ
         tnggx0FkvJe1gbmK6CylRJ64Y1y2EwTv1uOek/fNzDlk0n3kq6ZVjqgknuxFhp12BrFC
         l6uauu1lLNeCXL6u8IBugUjTZH1Dw9XSwuIMxCU7OIaAU38WeJJRwkj3RfjT5dXL0P0e
         k5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719666554; x=1720271354;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szW+qpHen639wDwHyYUuN0+gHXUW14bCmbG+jcL15DE=;
        b=TOHbw2jvErbgZEZljid1+Wd5waR5ysPAQJUl71RY0tKpAUaRboG3Nq2X58qmdQUwGx
         bk+2bSTYu+CgPq9TU/JP2U091gmnSFJR4Qt6wAjSWOhA6LSH/PBMdNA61JviiXwO5HQb
         C6RtX5De5ceBCR68vA2ega07s9pFAhrhhVB4k3vsoAH/4nsYFLUmydkbIcMhW/SywsTQ
         llEUn8cFsfvt1ZTdOVwJzF19HAyjmhSmH39gm8XyA6RO7XykDCnEbJYHx4LdCMkHlTEZ
         EwzUad+J4vZLW6ixD2eQS9NSXElXoUxAlJBtInM6iLINiD4wszkvUUbI/C3m7tr1WtFj
         QefQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDg2fu0ClXQg2hoEEoLZVPxhrS1AY0tRFj+7a1PmeyvCxbSnGaIZZ3BcYH6WNDOVzIibG3HCqDachl45KrEbNVT3S/etOA7t0yiXpHjg==
X-Gm-Message-State: AOJu0YxdO4XnQ3t5TfcL1mPVF9jNyZPiwmOP6X5B2dbM2o8t6PO1phDI
	aVl0SJ4tqkvO35P0RdHJnvB3fXo6CAhJlFbvpcxzt595Wq8ONe9lSct2/L5mILY=
X-Google-Smtp-Source: AGHT+IGAW8b892LzYjBo49cSL/7QUlVkTbYj03RIBUvQNFXrlob++LKjfIR5n0y6hLpu1m0VRwRK8w==
X-Received: by 2002:a05:6402:348a:b0:56e:3293:3777 with SMTP id 4fb4d7f45d1cf-5879f3ad3bcmr933147a12.17.1719666554033;
        Sat, 29 Jun 2024 06:09:14 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58615037bdesm2207202a12.97.2024.06.29.06.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 06:09:13 -0700 (PDT)
Message-ID: <0159b30e-2617-4e12-816b-273d58dfc297@linaro.org>
Date: Sat, 29 Jun 2024 15:09:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ARM: dts: qcom-msm8226-samsung-ms013g: Add initial
 device tree
To: Luca Weiss <luca@lucaweiss.eu>, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 Raymond Hackley <raymondhackley@protonmail.com>
References: <20240627193013.1800-1-raymondhackley@protonmail.com>
 <20240627193013.1800-3-raymondhackley@protonmail.com>
 <6223513.lOV4Wx5bFT@g550jk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <6223513.lOV4Wx5bFT@g550jk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.06.2024 11:01 AM, Luca Weiss wrote:
> On Donnerstag, 27. Juni 2024 21:30:52 MESZ Raymond Hackley wrote:
>> Samsung Galaxy Grand 2 is a phone based on MSM8226. It's similar to the
>> other Samsung devices based on MSM8226 with only a few minor differences.
>>
>> The device trees contain initial support with:
>>  - GPIO keys
>>  - Regulator haptic
>>  - SDHCI (internal and external storage)
>>  - UART (on USB connector via the TI TSU6721 MUIC)
>>  - Regulators
>>  - Touchscreen
>>  - Accelerometer
>>
>> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
>> ---

[...]

>> +	haptic {
>> +		compatible = "regulator-haptic";
>> +		haptic-supply = <&reg_motor_vdd>;
>> +		min-microvolt = <3300000>;
>> +		max-microvolt = <3300000>;
>> +	};
> 
> This is the vibration motor? Use "vibrator" as node name then as per
> https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter2-devicetree-basics.rst?plain=1#L299

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

