Return-Path: <linux-arm-msm+bounces-8436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E7B83DAA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 14:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F7871C22000
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 13:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37951B80E;
	Fri, 26 Jan 2024 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dQKS+cYs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CCA1B803
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 13:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706275272; cv=none; b=hfSF3s9Iu52g5DprnatCdbEoSfLiJxY/keDb2PKs+n7uHrGh36j6l0c7sMJ1RzSU8R8AkpefcLLs7I7+DEzY+GyoLak75taUfH1wd197ixfdmhnAXmqHz1DZGNvDPI8QeMH9dGDvZdrEddZlMG5NMYpl7q/YiuBvrVtld6fctHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706275272; c=relaxed/simple;
	bh=k/hmjmzlrned/165p3axqjqzNbe0FFV/hch3IZTVydA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=puIloaGcrszKogJpWhi3wYqn0TzGby4Om1Jq7WGhZ7SBF6tGFTPVSqSmn7m17JFp3NsXMNkHrRbi5hSedzMubF92hlKh7HpsNs5zqhv8qfctZzq4o/kgSyiTGugdsHqr/r3b6nUv0IUGzjZNnEa9w+txgYYdO3l7gf9+UV3aWs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dQKS+cYs; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2cf42ca9bb2so5282931fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 05:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706275269; x=1706880069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KVmQv9Y5onGlqwoMtR9By+Wn80G7PjkoIVuCrBbQ7so=;
        b=dQKS+cYs2kCmKxk3jJFQZYmgxotaFPf/5LCau2W+ykg9iRTqzIViRUEhxKx6AUbyyN
         4CCGochLkA0TgZJVy/K/n4Z5ADlwAYejNJjjPtlYbw4I7H/WFVL99N8g3geB60kpCsiH
         FL+I/dwImos0CBbOso4ZoL/3DdMJECW61oog5cIBkXh3MmI4m3aEMWCnWl061sfZcc6c
         uJXLx3nKGV2mXZbP11e5Gfu04/btHD119JQIneId5Y4nRgGEgVJnARMr60O3w6dQF1bt
         YMfgpushziRqiYmANpYFqJnA8TmoTqUExZp1ul7wO3mt48dVyRGi9Mz4xJqSqxhSDpwM
         NS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706275269; x=1706880069;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KVmQv9Y5onGlqwoMtR9By+Wn80G7PjkoIVuCrBbQ7so=;
        b=uWUJC5+2tESbfmBVy7g3G4+VM9SeivMBKWavom+64qxnf/boYGB8RLKi7DXgCJoTnT
         wJfkLvh8/3iv+W4GfFtP8aQpPJsBm1kK88hBLPhkL6VqQRq0UKP734GDlueAT52mVI+g
         AiKmRIVQKOJjQqenLv2LwbjPHiqslUc2k5jxk/8IUxszkyiIhQEhhyUCsoroYQyu0UV1
         YV8MFUOqYk/KL2geRkd2k0L56LKin4n7n99CnQUffBitvhmxLciYQe0jNQgmHn8b48wT
         aaLX5GJlpz97NpDmPucctt+aONDP1AMEE87pQ5rkcJjTOn45GhrntIc0RLyzddlTHh0V
         yJug==
X-Gm-Message-State: AOJu0YzlC3XCsed69SPeZth5REWTxvFio+rWiKpnRgg9cQs9XmG/9uke
	sGCl73qSfl8hdFrcoB5A78tgqqUtRPVNu2r0at+X/aweLRiahHuB4Lzc5WHbiko=
X-Google-Smtp-Source: AGHT+IG/KfVN0OJU93FXTI8VXeIHenvI+pKcY89vxS9fG6+aXB5dFbBe9TpNB2afyZz5WxtcwU9U+Q==
X-Received: by 2002:a2e:bb95:0:b0:2cf:2309:ca28 with SMTP id y21-20020a2ebb95000000b002cf2309ca28mr662733lje.58.1706275268838;
        Fri, 26 Jan 2024 05:21:08 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id l30-20020a50d6de000000b0055c875c2095sm612168edj.96.2024.01.26.05.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 05:21:08 -0800 (PST)
Message-ID: <c34dd7ca-01b5-4424-a8ec-a525b8d722a3@linaro.org>
Date: Fri, 26 Jan 2024 13:21:07 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-x13s: correct analogue
 microphone route
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240125154531.417098-1-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240125154531.417098-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Krzystof,

On 25/01/2024 15:45, Krzysztof Kozlowski wrote:
> Starting with Qualcomm SM8350 SoC, so Low Power Audio SubSystem (LPASS)
> block version v9.2, the register responsible for TX SMIC MUXn muxes is
> different.  The LPASS TX macro codec driver is being fixed to handle
> that difference, so the DTS must be updated as well for new widget name.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
Unfortunately this is breaking mic on X13s.

--srini
> This unfortunately depends on:
> https://lore.kernel.org/alsa-devel/20240125153110.410295-1-krzysztof.kozlowski@linaro.org/T/#m62da29e6b80fa419e6339d3c27439894cb04cecb
> 
> and my tries to make it backwards compatible failed.
> ---
>   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index def3976bd5bb..0165492e4e11 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -986,7 +986,7 @@ &sound {
>   		"VA DMIC0", "VA MIC BIAS1",
>   		"VA DMIC1", "VA MIC BIAS1",
>   		"VA DMIC2", "VA MIC BIAS3",
> -		"TX SWR_ADC1", "ADC2_OUTPUT";
> +		"TX SWR_INPUT1", "ADC2_OUTPUT";
>   
>   	wcd-playback-dai-link {
>   		link-name = "WCD Playback";

