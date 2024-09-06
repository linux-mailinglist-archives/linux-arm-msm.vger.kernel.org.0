Return-Path: <linux-arm-msm+bounces-31099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B456A96F27E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 13:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEF841C21440
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 11:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58EB1CB308;
	Fri,  6 Sep 2024 11:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nSCERZGk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0569C1CB15A
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 11:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725621172; cv=none; b=OBTd2G8d0pVmbxVyFEqr+pZy4ksdd2jK7v1GmU2aD/hbJuiavz5CBjvAEPHglfxpuTDjipKnQih/kB+LlIjMlJQoehQaAzJTEO/qEDBZZfAUxKoqsknGFljavmBkn5dznxjge7FUD9rCWT7pUzuCXRfVwYxELVSCVP5/GHBguYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725621172; c=relaxed/simple;
	bh=MUYgtSDvau8hrT7a0AiTdq77TL2MkPI9OzTL0d2OnSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GrJLmecbt6lZtFEx7eA4/Pi2gDp7Xq5eRBY88x0wl1DfzyHMWYIb1671QB7QpZbYI3GUdyJs7KS2P8eJV+kMIYLMrUAbpdkEBnhqGG7NVBAfTMuMk9KFsm62ddaz/c/+ZWnZ56wbPJaXv55wQoN3cGXRhWccklZPdRVomxVykqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nSCERZGk; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c260b19f71so2070098a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2024 04:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725621169; x=1726225969; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nfzckFpKc9LJFRwS9irFl84GC7WbAq3dwTai8aMxnY4=;
        b=nSCERZGkdaOGF9+eyHtxCBysaJZEnQSzZMs5DFMXmM1ieht8qOuiuKvk5cAl/5721j
         JHoFW6H4+9KKgWrK64FI01VIU8jZQJkRkD+lIbmUuL25Fwst8BNDylxO9ZlYhj0WI5wg
         ixhWtWPIKIdV4Z/5R0ctoczkOS6ZixbdpT/piDOCq1Lg8S+aurgvi/WGA/a6+QKgo5DX
         5C+7Gy1/2n5WubmRB7wMK5daqhHMQzQmDebx1p1QdVJAEK8QSF1ZXtQ3C2uCCuyW9/xd
         btGBTocEON3MCH2irzlhvxdi5FTLiVZ1N5QKhnT6KAPgMgAuI5bgJX4s0s8mAUdnlmFU
         UV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725621169; x=1726225969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nfzckFpKc9LJFRwS9irFl84GC7WbAq3dwTai8aMxnY4=;
        b=Vk6zU1Db+1QiH7oZqzNUY92qa4LN7TBfOEgLOU/kliBO+YNJF0JwrJnaK7oIhXVOq4
         6gS30XeS+PzNKNlizGD6IL5j4Jd4AN28vyhoN7QZM9+Eu1NIv7k3J0aMDUdU11IDapf+
         SgqdiBI52CThQGqbXFPsHgQyoDJP8uUfsLKzLF1LM4KHoEYcmZSiaZkxukJnDD0BIOw4
         Fc3pAF+E9A309l8D1bwsT9WXE3x9PKOwqVkkm6bv8lHvJATzfvjZQvJRr/7ka7OF6p00
         fQMJ6FXc2wFxioDE287uSPGrKt/xwGydAZf1U4AA84fo7d3iytoeUQ514zLfQOqLg0BE
         n3sA==
X-Forwarded-Encrypted: i=1; AJvYcCU12peb4ATEbSbFMfjtomEzd/yxKYxzBw9PkZ/R1bdzNQjWvpzgsD8VPFW8O0JiL2l00qBFY1YH1utx/NdF@vger.kernel.org
X-Gm-Message-State: AOJu0YzJCv2eO8Seqp9WmYIXwsp7igsvewGOaqMvsOSfwiCFm9w82/oX
	XNXoTtR/SZHjdszcoa1QAimdqcHaa5LiETv0BzwiaKgJWISnMFmDQFnCocuLoZE=
X-Google-Smtp-Source: AGHT+IFumS/Hy62OgRzIQHTeJZmU1kmKVGC2MsfN9/QLaLaj15G0R5vXD/hPYLrh1WnbXKOSAf8ciA==
X-Received: by 2002:a05:6402:5203:b0:5c2:6311:8478 with SMTP id 4fb4d7f45d1cf-5c3dc7bb4e1mr1403995a12.25.1725621169162;
        Fri, 06 Sep 2024 04:12:49 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc699f7esm2318819a12.60.2024.09.06.04.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 04:12:48 -0700 (PDT)
Message-ID: <8c7168ed-5036-4f89-b821-10a970c1ffb5@linaro.org>
Date: Fri, 6 Sep 2024 12:12:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8250: Fix interrupt types of
 camss interrupts
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20240905164142.3475873-1-vladimir.zapolskiy@linaro.org>
 <20240905164142.3475873-7-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240905164142.3475873-7-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2024 17:41, Vladimir Zapolskiy wrote:
> The expected type of all CAMSS interrupts is edge rising, fix it in
> the CAMSS device tree node for sm8250 platform.
> 
> Fixes: 30325603b910 ("arm64: dts: qcom: sm8250: camss: Add CAMSS block definition")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 9d6c97d1fd9d..bd73ff97739c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4504,20 +4504,20 @@ camss: camss@ac6a000 {
>   				    "vfe_lite0",
>   				    "vfe_lite1";
>   
> -			interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
>   			interrupt-names = "csiphy0",
>   					  "csiphy1",
>   					  "csiphy2",

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

