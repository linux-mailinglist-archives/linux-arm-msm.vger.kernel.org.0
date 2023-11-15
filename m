Return-Path: <linux-arm-msm+bounces-733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBCA7EC94C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 18:04:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B963B20C7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 17:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825C73BB3A;
	Wed, 15 Nov 2023 17:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UQw2aDV3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AF73175A
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 17:04:38 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821031702
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 09:04:35 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c834c52b5aso72031971fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 09:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700067873; x=1700672673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EZtoQ6TsypQDjyf9B3Yz1sAlQQ1e5vDW1aebdA/byQI=;
        b=UQw2aDV3PE2Gz+HpNbZF0CRbLfvz+CiVy1Nhg9BnZtV1bnWNLrheeZkrkDgN6hxNV/
         jU73kJPItjYkSDaw78r75YGGeaHHr1c9+prFT0s/gYj3VkQLai/Jam6/jFx/2LKUzuJ9
         SDzyRRwwY5wYzKOzotOqNsFVU6OHtSkCQPIs2H8k/g0SYRwuDxpXKAzTZGImkAWCQU96
         BvYdhWC6GMa4iJR4jTcIZeagLet76TFxwfQtYOlwIUtqubqd4P2bHfYRy8OwXkESolyD
         Aix9P9HllKKMvV6yeCUG9YHH2V7Gi8g6iGQEip7xwZAVnJsIwD2Y5vGBkxv1Pcur5G4P
         73Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700067873; x=1700672673;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZtoQ6TsypQDjyf9B3Yz1sAlQQ1e5vDW1aebdA/byQI=;
        b=O2VVjyP65GuFiMfMHG0xrdj7Ljf7nv8IBfArs9uHqRpo5hjsQN2JwstJLh0DPOut+u
         ZYfvn3NxULQ/FVxj80ptoAdTwMz6c/S5ITHnkeemVsCo09KPmO8O2cRov3vJgeKsuHiC
         EqrBIJ9+cwYnY1cvFJFVg/a/WqhLkvePvbfAzfImzLDlYy1UKaNJrJz7qxT800Jtu+FZ
         ju6G7FHUEii+L+69sB0G4iVMqIYOSZ73toDufVF14uyBGXugYS2iA+XeFuHiLPOWs7sI
         uhzMcInnwrXbsOCxtOdaa5E39AwmUZBk0PKUdy8aajcqEKcMu1VgBPP8dOR/hmn9N/00
         jWig==
X-Gm-Message-State: AOJu0YzJHPm6keYTpwRmmNpV9Ocb2ZnKVlRNyREXYG8xFpYbbGHBHrbv
	hx03buO//sKpWW640imGWu1BoQ==
X-Google-Smtp-Source: AGHT+IE8avvVATeajyNQ9GHaEnf/2U2LC2iro5zXR+3HKqwOW58FE8XdyzjevmeJ/ayGaxeS3qGMUQ==
X-Received: by 2002:a05:651c:4c9:b0:2c5:19f2:4fde with SMTP id e9-20020a05651c04c900b002c519f24fdemr5596423lji.23.1700067873639;
        Wed, 15 Nov 2023 09:04:33 -0800 (PST)
Received: from [172.30.204.150] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z4-20020a2eb524000000b002bff8ed8e2bsm1795340ljm.9.2023.11.15.09.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 09:04:33 -0800 (PST)
Message-ID: <1208232f-c618-4a95-bca5-e5ee4245a873@linaro.org>
Date: Wed, 15 Nov 2023 18:04:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq6018: add QUP5 I2C node
Content-Language: en-US
To: Isaev Ruslan <legale.legale@gmail.com>, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CACDmYyfOe-jcgj4BAD8=pr08sHpOF=+FRcwrouuLAVsa4+zwtw@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CACDmYyfOe-jcgj4BAD8=pr08sHpOF=+FRcwrouuLAVsa4+zwtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/15/23 16:38, Isaev Ruslan wrote:
> Add node to support this bus inside of IPQ6018.
> For example, this bus is used to work with the
> voltage regulator (mp5496) on the Yuncore AX840 wireless AP.
> 
> 
> Signed-off-by: Isaev Ruslan <legale.legale@gmail.com>
> ---
> v1 -> v2: fix clocks typo; fix reg size warning.
Hi, it's also good practice to share a link to the previous
revision for easier comparison. The b4 tool [1] takes care
of most of the comments you've got.

>   arch/arm64/boot/dts/qcom/ipq6018.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index e59b9df96..00a61de9d 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -506,6 +506,21 @@ blsp1_i2c3: i2c@78b7000 {
>                          dma-names = "tx", "rx";
>                          status = "disabled";
>                  };
> +
> +               blsp1_i2c6: i2c@78ba000 {
> +                       compatible = "qcom,i2c-qup-v2.2.1";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0x0 0x078ba000 0x0 0x600>;
> +                       interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
The irq number seems a bit sus.. they're usually more or less contiguous
and I2C3 uses SPI97.. Are you sure it's the correct one?

Konrad

[1] https://b4.docs.kernel.org/en/latest/

