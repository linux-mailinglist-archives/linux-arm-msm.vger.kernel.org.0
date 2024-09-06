Return-Path: <linux-arm-msm+bounces-31097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 738C596F276
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 13:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B6F4282E23
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 11:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06BE1CB153;
	Fri,  6 Sep 2024 11:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nw6k5K+C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5EC1C9ED5
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 11:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725621150; cv=none; b=VQ3mLeUJHVOEZY/KiDuDkj5NG/ar27fAHl/t+mgNABwjkVnrH8vyKbX1uo9SRs7hrfflx1NC5PcQPG17LpwnADvn7ve4e0sUfN+jVlnNIaJUN2YYxI/DAsiyA0M8/E+8/oYLJhYd6Ksfc9aNNblgi66cpIr+LdZFSGWyeiFZkYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725621150; c=relaxed/simple;
	bh=FHH3wyQ7zY55R9CADvoIO5OcTdzNx226agmLIAzSrhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZhrRkgoRuSUjt2c1hA0wjcRWvaBVHiRaAkbARXHLTVxL1v6pGPpOMwhajPXo8T8/nU4WtqD3H30JLjWRMt4qtS0pPVQQ7DmYfeECyNowNIIRp01ZKDlwZ8ShsJjj6mN66DlefzQxUG9tJoNXy+f7G5fZG1JaaEyYd2/NUIao83k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nw6k5K+C; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a83597ce5beso308954366b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2024 04:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725621147; x=1726225947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uc2+zdjiBpu46m7tub9zqiCMuodzrCPOa9EZooZK8Qc=;
        b=Nw6k5K+CzDyDOiRFVgiHoIgbdTZqfCj5ppP0QdTScyXJ8er0NG9dDH6Bzkmp3lWgP5
         Dfl/ouPwNj2s24NAo3vxteFlIS8+pzAqvLQ3ha+V9p9kXgOyGrvXKJ4YOArFOO2jNV8Q
         YhupLW8QSCc9OE9d2yiqJg7MDl5STkTisvOm1+NEfNJC5sqmuOEEZv4uK6kOiyWAb2lA
         VXQaMZbm3YBM255UaFmbcMrBvrshvMfKAlXF1dmIOjy8sKSDEngpcJftHvncWfFk+FxG
         Cj2zWKzHp0AkKOHTa4uXik/MGgdNpOXybXjBdZEeRnKkZh761eOKbWPTPVSsfo+hryaP
         oKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725621147; x=1726225947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uc2+zdjiBpu46m7tub9zqiCMuodzrCPOa9EZooZK8Qc=;
        b=sgOnYu5mQgnnV462UHTC1UZm2FHJSj9zdyoHF0Jpf0etQJb5U82kDjPO921LYGCioP
         ERd5oX+OpH3ZY7mOgeszJ/XR3yd31FhGkfLIjW7YM8621RKHP80ApxhXzOLn8FopLGhc
         1sz8R/CzvXMZDdz96mCQ91HT2TqSXvcCFWufRXLYcZGYzLjU4nJokm6YvdO5SchFDQpb
         DjsIHsPVFlMWh6ExxaxAsLr5lvQp7J7wvZ9U9fAOuqegk6epXgN6CgbIHwG3oIL2Hytg
         mtt8jB7mF1nGVT0s+Xq93pFSu2DvsVZ/1zrxPtK36wSTjflVosrhB+cSybB/x4Wf+qXn
         xVug==
X-Forwarded-Encrypted: i=1; AJvYcCXAHVRXPPbgSCFfSImErYnLLD3mejfsYtHxJQh6Wykv+ZzEd+W3Poqwb5LQIxEnnuhdk+2D2uvwvXl7PXgr@vger.kernel.org
X-Gm-Message-State: AOJu0YwioFz4PgD7+x6SaU9/k6cuQ40vlpj5A/MNgx1/dTHf5s1moXmE
	dlsKf4tkyhq3phnpYZMoGGmVr8UV+Ad5JXKRloDIZVfqWKUoU2ZBhneHvcqT7Bk=
X-Google-Smtp-Source: AGHT+IHLGnwvuz0Zuk0iYkufW1lBlP6YOjby/D3zebopxnLANfHrrf5x7pPi6Md1UNB5/c88v20cNQ==
X-Received: by 2002:a17:907:1c22:b0:a8d:cef:bdd with SMTP id a640c23a62f3a-a8d0cef18a5mr44043766b.10.1725621146924;
        Fri, 06 Sep 2024 04:12:26 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8c8cd01fbfsm26513366b.123.2024.09.06.04.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 04:12:26 -0700 (PDT)
Message-ID: <d94c322e-b26b-4f1b-bcb8-187142dc25fa@linaro.org>
Date: Fri, 6 Sep 2024 12:12:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sc8280xp: Fix interrupt type of
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
 <20240905164142.3475873-5-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240905164142.3475873-5-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2024 17:41, Vladimir Zapolskiy wrote:
> The expected type of all CAMSS interrupts is edge rising, fix it in
> the CAMSS device tree node for sc8280xp platform.
> 
> Fixes: 5994dd60753e ("arm64: dts: qcom: sc8280xp: camss: Add CAMSS block definition")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 40 +++++++++++++-------------
>   1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 80a57aa22839..aa2678eb3bcd 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -3882,26 +3882,26 @@ camss: camss@ac5a000 {
>   				    "vfe3",
>   				    "csid3";
>   
> -			interrupts = <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 758 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 759 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 760 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 762 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 762 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 764 IRQ_TYPE_EDGE_RISING>;
>   			interrupt-names = "csid1_lite",
>   					  "vfe_lite1",
>   					  "csiphy3",

Yep, downstream defines these as rising.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

