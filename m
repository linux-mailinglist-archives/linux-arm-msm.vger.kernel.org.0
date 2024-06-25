Return-Path: <linux-arm-msm+bounces-24172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0996A9173A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 23:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF6B41F257E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 21:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAB017E44D;
	Tue, 25 Jun 2024 21:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A7jeQAPc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CE117DE2C
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 21:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719351820; cv=none; b=pkVhrWsBMtJ6m+zd/42Zeadh3PTJ0MERdbZGXry1BE07x7nYKYD1yy3WMddRFCb4bblSi9BdzK35x963ok2RDLgV8m2RHqN+9hya9WCWrS5Up57UF+wXPo9AJQz30fJ8kSs6HKdoADq/1BUq0pn0e/1bN1WkmYbQc9TYPLuwKd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719351820; c=relaxed/simple;
	bh=eK8jnNsLrrwlG3hHsRnPuKUXreDbP+T+9J+d/Ndtgz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fFTJ0IVdM5PJ9wLM1bAF3jki72B0Jq7jgp+XNEQEFXJ3vB/9XoCM0v0XbLGKvCxgyTgWYqzvfHlL5xJ1KS85Z7aSKdtKk/V/hkOGlFS1ZxmxD2qeSbEApdpb962fvZZOz1/I2cbJU9jE3V63z1pp4A92HfVnZGUwZxJC1kfiJR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A7jeQAPc; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4217d451f69so51496225e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 14:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719351817; x=1719956617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gXpVGAgwaXGnHWzmK/3ybQ7VK229d1+vDFY8MfYFxcQ=;
        b=A7jeQAPcNwVJVN03cHHTA+ib/0Rh74RUxy3c5xV7upsOUU6kNrQlmekPCZT/cPpbBI
         FmMVumGKy2gMbrQnPYNkPCdmYXnWJHtH/1LgE0+qAwqp+r/ZFLvxk4Av9Cj/5NUN0R+Y
         xgZiDJ143Cb/Je9f8SLmZzWG7aTlFxm79o/wPycH6bNrJ6K1qZSAbCXTvui1acxMC77d
         8yfzlDhNtp/V7kZikGETMulGCbFzr7XylaOr51qMMxTZeQiAPpyhFhiigYAnnyD6kq1A
         gBmeiEqsYV/zkOGBvLhVdZ+trE3DoergrVA9Hyx3cgLo/pw8e6mQ3JzL2IluepoiIAE/
         beYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719351817; x=1719956617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gXpVGAgwaXGnHWzmK/3ybQ7VK229d1+vDFY8MfYFxcQ=;
        b=Ga8/xoQl2K7NSwv2B4RFST/uPqa6B5beIzXqNh/ayvKVB2E1mbhFqPw4Vic7D0Huxe
         CfxIniQIlL/CiUVwNm2TfCFCmFR/M0yvEsADNHDzv3o/l9Lrki5fvSDqDbbEG2UWJKyQ
         5iYtTE0MaA3lznDZzn7unr+HxoXSqVkYQJ6imRCpiL/VfciysXKH8gMr2SXFro6Vbf8g
         smujwnrgqKvSWvVeD5DJejST9tzWupcXanqRCWwPPBzhYoz0z/hMAhWbgHDfM0GUPvTp
         QmN6YuHfvk9YMFPS11DwEPV2v+yWuNvqAlFZ7xZFShxdbiaou2jntHHb/ZAAABDhDErS
         Erxg==
X-Gm-Message-State: AOJu0YzWEsoyB6RUC1jvHBeShU4D88ulajnMBlLM/LOdGn+jQZaKr8Au
	mpy90TTGeQLF2COctg3ZCV3YiFbMF5LUG0w0XodWmMjOiGrqfh9H3jlfN7HcmooHUwr+6QSIdeN
	owks6AdGU
X-Google-Smtp-Source: AGHT+IGSc2wgdCJSQ2IQbEeJTeTHpxgUkGGoqpZteI2TbE3JWwvNoFt8wgeJm4phRg+xVk17xHRjjA==
X-Received: by 2002:a05:600c:5686:b0:424:798a:f7f6 with SMTP id 5b1f17b1804b1-4248cc1838dmr67897875e9.8.1719351816915;
        Tue, 25 Jun 2024 14:43:36 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3667c2fd7fbsm13663529f8f.89.2024.06.25.14.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 14:43:36 -0700 (PDT)
Message-ID: <1ba23d2b-473b-41e4-99dd-fa6a489c5af3@linaro.org>
Date: Tue, 25 Jun 2024 22:43:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: pm8916: add temp-alarm thermal zone
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240625-pm8916-tz-v1-1-a4c1f61e92dd@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240625-pm8916-tz-v1-1-a4c1f61e92dd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/2024 21:16, Dmitry Baryshkov wrote:
> Define the themal zones using the temperature values in stage1 for this
> platform so that the spmi-temp-alarm driver becomes active.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/pm8916.dtsi | 31 ++++++++++++++++++++++++++++++-
>   1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> index 4b2e8fb47d2d..2def48f2d101 100644
> --- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> @@ -4,8 +4,37 @@
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/spmi/spmi.h>
>   
> -&spmi_bus {
> +/ {
> +	thermal-zones {
> +		pm8150-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pm8916_temp>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <105000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <125000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +
> +				trip2 {
> +					temperature = <145000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +	};
> +};
145 c seemed amazingly hot to me but apparently this is the more 
conservative of the possible set.

https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/blob/LA.BR.1.2.9.c26/Documentation/devicetree/bindings/thermal/qpnp-temp-alarm.txt?ref_type=heads#L28

Heating up even typing this email..

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

