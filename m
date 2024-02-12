Return-Path: <linux-arm-msm+bounces-10604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 789DA8511C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 12:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2A51B2714A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 11:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5452C2BAF0;
	Mon, 12 Feb 2024 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QOV2p0Cn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80AE28370
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 11:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707736010; cv=none; b=OuZTPZ3KJB9Udkd4bhWkrlegX9Ez3udZ8VRo7SOLtuGzQ75eF61fnirG4c1N3vnghxt1j+C1R0VN3vYkZG5oU8WBzfH/AHUogLczlRxeQ1yHnWOMdDZCBNCAWMP2TwjWBuh2gXj7bdUD7iLb6nBe/s0xeKfogkDkG1q3mlrOeKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707736010; c=relaxed/simple;
	bh=RrqQebk8MEWaWRfz6Ui/uTkNxZIWrCN8v4vHa4PXNc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=consbKN5YPmkUivZIvH4oy7l8OBgzROC3UGeKtqlzWwgdbBaO8PLIsmmvwXypI9Y7td5PALP7ZbB5Sla0gWLfl3iQyzOZtEcaVI2yU2fk77qEHD/LYS3w/Z/Wzihg6edCav+lNzYyd53tcizKCn7s2m3SZFK5kHkiwpcGsbVAbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QOV2p0Cn; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3be744df3fso301328266b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 03:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707736006; x=1708340806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O3wABuey571Xqv0wrWgtmt5tg5JObQURPrUQDZjev18=;
        b=QOV2p0CnO+8+bw5E4CCKmRtSzVSr115ZPUu0LaYszcuuvHtiEmrtSR+s/npDq3DxwN
         jftVQLr2rdZKV5/fWHa25sNuTMbC/0t0dHWIm/D3R+7AGJ0gu7U0nzRqWUFhAk4mKM+x
         GTsDZZ3T3j+szEAqcwF3G++exdVjZ3FKCpKXNKCjUjJEfCMaqmHC3OMUlucgZJA/xbID
         aA4J7+4aYNN/xFIDFQY/gUmFwJL6OwBhnmYeBkuc4ToioeuzOtyH8qDk9aHim30uM5vo
         TLcWhlcd24kSEv+UIkjObmSUGgb6Xi/Ye7xH3c23IRQ0K9y0TIP6BEPOuFM6IqLkSKvg
         08cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707736006; x=1708340806;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O3wABuey571Xqv0wrWgtmt5tg5JObQURPrUQDZjev18=;
        b=HqyHt2n9HlJL2BfR7FX4OEtagZ+DO7UlnRWnGqxul4q4n8GxfGrpaIhzei/YA3mHfS
         lT/DebeAHfHTB5/oZitP+pCK09Mv1k9Ad+wAX8wuSiQ/DIJQ0JqoM1wKUdjgx/OFuhh+
         m6UvmcGKY5g17qvg3vFwMWHyP6qWKeoQrxHwPBbfr5EUXxwf7GYctUT78lF2YV+9d/b4
         aD7+M6LcFy8p0unJ7VqrGR8rNwixih9Lsn5D/VYyvhmZ9CON4FJRJ7Ry1rMAYgpudZQ5
         //gH4ElbnpWxkOVbCZLIfkaKtmL/8xOPfT5H/bTQkmkSFTnz0s0N/Tv5xTjzKbrjTHT9
         eH+g==
X-Gm-Message-State: AOJu0YwZu2FK7butm0gtfMEcLlw0r/yer5mxD3WypNXF+sjv1HcZ4zrK
	xdyr3hkxPOOn11b1oV6XkVxazkRU/6KEFSS2eBn+YJj0DE1v1rVDxU89klOTV6c=
X-Google-Smtp-Source: AGHT+IFitwxlEjO3e46UA4wpoMuf6HZKFPjuyQD2vH7qXeoxc9Zr0CQrSF2s4Dz2EjtumSRas7IVYA==
X-Received: by 2002:a17:906:6893:b0:a3c:1046:93dd with SMTP id n19-20020a170906689300b00a3c104693ddmr4778168ejr.31.1707736005589;
        Mon, 12 Feb 2024 03:06:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW8WXIaVyguxwn+RNd8A1CPmAIw6No7r+3Kp5tXRghuATjIa7MQ4kMnBP70mck5WXGYrUV0wliStMR3zhcWwIW0ntMCeYAwSLcmRaSKuAAc5OjqtzJ53YyYwn81z0tfHO1xsglL4qR2kqPCcA0uyJ9nTNTcsidt9HzFNcF40OTyhWW453iUjO9fjGjOVBh6k/0hePAqCWGY3fhaqVLZbzsCEXVft5uMqrnVl7KKFAzWwEuKfh/vcxHNGeBCoZRzJgFrxsp/4U4qxubaYRc4+1k8zDqOr6ueDxWK
Received: from [192.168.192.135] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id d18-20020a17090648d200b00a3ccbeece96sm97404ejt.33.2024.02.12.03.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 03:06:45 -0800 (PST)
Message-ID: <0cb3a2a7-6ced-4f41-8632-6f4214a48956@linaro.org>
Date: Mon, 12 Feb 2024 12:06:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp-crd: Add PMIC die-temp
 vadc channels
Content-Language: en-US
To: quic_bjorande@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240210-sc8280xp-pmic-thermal-v1-0-a1c215a17d10@quicinc.com>
 <20240210-sc8280xp-pmic-thermal-v1-1-a1c215a17d10@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240210-sc8280xp-pmic-thermal-v1-1-a1c215a17d10@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.02.2024 05:41, Bjorn Andersson via B4 Relay wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The die-temp vadc channels are not defined for the CRD, but describing
> them directly would directly duplicate the definition from the Lenovo
> Thinkpad X13s DeviceTree.
> 
> The sc8280xp-pmics file describes the common configuration of PMK8280,
> two PMC8280, PMC8280C, and PMR735a. As such, even though these vadc
> channels makes references across PMICs, it's suitable to define them in
> the shared file.

For that reason, you can also keep the VADC enabled by default since
it's a constant element across designs utilizing this set of PMICs

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

