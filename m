Return-Path: <linux-arm-msm+bounces-49727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3594DA4845D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 17:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A6E73B8E9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 16:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD031DE2B9;
	Thu, 27 Feb 2025 16:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="koQKNspj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19101DDA3E
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 16:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740672251; cv=none; b=R+eNoD+jVqWzOPmkEjydjbTew5LYbWvJ4H0Y1ANvkJ5CjcF/aiFdyJqwwR/TvDDzgXyfrHVxVrQxlMRqiLwW263XWHl7puaw76W1p49PWuncrkF61Ro8BDSZ9ZC0bPNk+d5Wz3iekr4CI6n22YwL7L6SHBA3R0wj9nieeAR99Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740672251; c=relaxed/simple;
	bh=tyjvAD+adDTd//PDrw1nlWoUz+V/OCQOULIAUJl5qMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5u7WekeQY1gzm2/n/Y9kHqKSowl2GwoxPnChwhmVQkKKw0TFbiDJoivt/6Ykm3esWFW9MPOOssaQ2JXa/j3kbSuF9/HR44G9cOMKLminV4/2jBCcDZvZH9KtDBBUNa/sJA7GUEj0eNGGtCezf8OvmSfrDEXMdxh8ramRdGSwLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=koQKNspj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so8413475e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 08:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740672247; x=1741277047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LvIn24tYLHOsgb21p347DIWtQWK0Ha6hvZuB/OU8gA0=;
        b=koQKNspjSWudfG9DJfPwlQQTnrc2AX/QdoVrNc67zuepx4saVwpGStrcGd9e6CCsaM
         3xyre+69JFtI606iHO9Vn0ipMjdFVrOuxAy55K9SWwlf5ZF6vuU0SMkRhw42pMd5Of9e
         n8YMafu+0x1ARUzQHMgqB/n4p+VSwBzGg3FeT7wQv+5WYZJY/D/ylEwhQBjbaj263Z2a
         Xu8QPf9pOF15K5kbGAGLdOOVA/xZVLykYEysF5R4L0qMuBNACCAg6s8z3xsLR9G3afJX
         M1PQ5oaMO2zuCLtnJAyNnVZ/UOet18YKA2ydy9rP3A3Y5xigwwUWM+Q+RZweVqxa+0Pp
         ybaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740672247; x=1741277047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LvIn24tYLHOsgb21p347DIWtQWK0Ha6hvZuB/OU8gA0=;
        b=DAGEj8tTJaJssQjhp8Sdg2QS5XiS//8gBGVMbvRGhPsVdVeWsWaPlWMXk9aDVvj9EV
         hZfa+wrvQyRaVE/53HVa/HYStJbV6R6xAUELvWhCACuV5If5v2Fho+Cpd6TMhYmLo/JP
         T2p6EvIpWXpi+aMr+Jt+/OXLcGZOmUQbLjzQxiXkUTiyDwkjh+4Gr8l3mHJRvs7H2e6W
         vWt5sOh5THrW7AQBc+op01S0dXm1Rt96NO8jknlIE8Vau54REjeUhYofaoOzGrp76OBF
         oq5DKI02Ufkji8XltZPvLBOLi6h0Xgg+TtIFJhLAOq7KkO9kjE/Ic+2R95dyfOYSLIjh
         IuOw==
X-Forwarded-Encrypted: i=1; AJvYcCWOrXC+tC3d/cCtr+NeoQVzCBl1lU2hW0OVE4EUcPSgjsbkSxM7xrZrZ1YJnTIerCL+EgO6thoDmjp70svt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+1sKH51/NSDWh9p7iSDxlcU/yX7o/V00xg9lgjBJnyT1Vqapn
	eQ7OB/wIWp2Vo8Br7ZFCYE9jMpOaG9AkxrpxuP5nIGRVioACFZ7kNjCWi87eq0s=
X-Gm-Gg: ASbGncvLNwNtTgzZDRvIal+Ma9KyjD8ipFy4gvRjFEmS4mrYkXA5yntUuK/Y2bFKdMp
	O26SNFycZqA64FNTXpt9TZXWJKylQ95cG/i9nsJrdKIenu/CAlMQXUsVMw9KLQTpJm0x0xQN6DR
	1010DCjbmzN4zdDpQQ3ma+sBbKsLGLIPOg4+Kr7/gXEJFDAmRrL6zeqkzq+5zDAntRO2lW9bDPT
	36m4U4uTo3TdeKDMg91ikcuc6SH/9ASzb1mlyLMV+CFMN0oC82rUy2TCRsXvFtUId516qgwhT5L
	D6U7vzup0Jhf4hD7NvBBPIcZjzV50bjE2VlgtsVSeArzKetBYUtsPFkoW98W5GQFU68=
X-Google-Smtp-Source: AGHT+IE3Ip9lM9pQRwKTBvY/WeuCuU31LF5zKSLs2OxofNzgwY3TCLJUZhTWGYeeFNNIo1VpBFTuBg==
X-Received: by 2002:a05:600c:1c1d:b0:439:9496:181c with SMTP id 5b1f17b1804b1-439aebdc9e1mr215296025e9.29.1740672246975;
        Thu, 27 Feb 2025 08:04:06 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b7a27b27bsm27022515e9.31.2025.02.27.08.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 08:04:06 -0800 (PST)
Message-ID: <96208c2e-f38f-4d1b-aa6f-0b774359c2cf@linaro.org>
Date: Thu, 27 Feb 2025 16:04:05 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine:
 Drop CMA heap
To: Nikita Travkin <nikita@trvn.ru>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250227-qcom-nonroot-overlays-v2-0-bde44f708cbe@trvn.ru>
 <20250227-qcom-nonroot-overlays-v2-1-bde44f708cbe@trvn.ru>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250227-qcom-nonroot-overlays-v2-1-bde44f708cbe@trvn.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/02/2025 14:26, Nikita Travkin wrote:
> Initially added, the cma heap was supposed to help with libcamera swisp,
> however a mistake was made such that the node was never applied as part
> of the overlay since the change was added to the overlay root ("/") and
> not with a reference to the target dtb root ("&{/}"). Moveover libcamera
> doesn't require CMA heap on Qualcomm platforms anymore as it can now use
> UDMA buffers instead.
> 
> Drop the CMA heap node. This change has no effect on the final dtb.
> 
> This reverts commit 99d557cfe4fcf89664762796678e26009aa3bdd9.
> 
> Fixes: 99d557cfe4fc ("arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Add cma heap for libcamera softisp support")
> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
>   arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso | 11 -----------
>   1 file changed, 11 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
> index ae256c713a36078afdadc67193f381a19ea8e5d3..5fe331923dd3cd31ff2be047a2228e1c4104e80e 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
> @@ -9,17 +9,6 @@
>   #include <dt-bindings/clock/qcom,camcc-sm8250.h>
>   #include <dt-bindings/gpio/gpio.h>
>   
> -/ {
> -	reserved-memory {
> -		linux,cma {
> -			compatible = "shared-dma-pool";
> -			size = <0x0 0x8000000>;
> -			reusable;
> -			linux,cma-default;
> -		};
> -	};
> -};
> -
>   &camcc {
>   	status = "okay";
>   };
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

