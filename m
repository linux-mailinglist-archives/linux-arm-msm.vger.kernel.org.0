Return-Path: <linux-arm-msm+bounces-705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7070A7EC525
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 15:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E929EB20A4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 14:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CCBE542;
	Wed, 15 Nov 2023 14:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vPgwcnj6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02AB2D042
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 14:28:04 +0000 (UTC)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FDD310F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 06:28:03 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-32fbf271346so4222208f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 06:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700058481; x=1700663281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Evtot4Yh11FEYzBefFRVE52J4bwfzJ6OpH6hCREKuc0=;
        b=vPgwcnj64Qwu6IN+RS8M1iGLH7VzIy6Yx/j8EBStTr0q7LcCp5b5+4jzyoiXPaTJOX
         X6fV7HEcipg5wJ9gsAWTy0WwiwD95R1lHnqmPl4X4YFOXf/Pv4IiLdcTMH3IdiXZLg8v
         VkhKztOpU1Yhwr2qAulsNancIbFjpejQ2yo0G0ieYnLX4Td7w8YAJQWs+yNRxrrwNZkd
         yvzY2/uUM/9Ku17bxwPZzFBDG+k1C4k1mbGRniNWoRHd9Fj52fGpdPzd78Vvb+npu9LF
         X0eP97C1G5dD8Y0LiwK4kmIN9OKlpHavDpLUFXZS0LVcrEmXWUtezc6ajTWPGUj2G+K1
         4iMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700058481; x=1700663281;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Evtot4Yh11FEYzBefFRVE52J4bwfzJ6OpH6hCREKuc0=;
        b=cfsWiCGhG3UifJkZAgZOt/HeQ6u1BXTja+gOHiPYrqGvK95QK/j7tGq/Y7frTFow9Z
         hEKWwaSqjt6WIJzzzDyUWuyAW8I7lY/N7beG+plpXzXZxletxddXZEwpfasG06JoqOjU
         PUUMLmvVerKLX+U0sHsv1IaxJTAFinYSUyb7lqUHjbJiomhPD4zlKn9UzPhMwlXNRbmv
         W9EuZmGf5gigD9KziJnz+kVfAbNwt9Fml9XhZTDn0wH7JNi1owwNQAizXJot9dMP19/p
         7lJp+LozLuQgXFEGMyDJfAXryJUdNwdMEAZwZ3tfOZ8l2+mTDLj7TsGhaPjKzEmDRPjb
         JP2A==
X-Gm-Message-State: AOJu0YzkjlxabjvsKD8dltpbQ5H9v1+xPiiL7e6npPuwdWV4Si7TTi//
	mu0RNYlhmcmYpu13oH6lpxGvgA==
X-Google-Smtp-Source: AGHT+IGy/J9LcmDCiDCJZj8G9WmVZlzWvn8wbfDi7y0jzmUhP2J26XTDrpjGpc0p/0knDyMccZdLFA==
X-Received: by 2002:adf:f0ce:0:b0:314:dc0:2fca with SMTP id x14-20020adff0ce000000b003140dc02fcamr8889899wro.29.1700058481635;
        Wed, 15 Nov 2023 06:28:01 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id p1-20020a5d48c1000000b0032fdcbfb093sm10695138wrs.81.2023.11.15.06.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 06:28:01 -0800 (PST)
Message-ID: <cf22c52e-cd4b-4560-b5db-c887c9f8a1b8@linaro.org>
Date: Wed, 15 Nov 2023 14:28:00 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq6018: add QUP5 I2C node
Content-Language: en-US
To: Legale Legale <legale.legale@gmail.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CACDmYyf4hxbuw+cpKqEDnqmHpS9yPXuE5MPD5_XZ3hjmYuViUQ@mail.gmail.com>
 <a3e35d3b-906a-4540-924c-0103cf32efa4@linaro.org>
 <CACDmYydnLQd0n9ACnTQ6P4wYf38eMzokyHrF7r6LisG4oTFtyg@mail.gmail.com>
 <5cd19f5e-baa6-47da-8730-fe0ddedff364@linaro.org>
 <CACDmYyeBbGVPxLh+dmWus=BEiM6rp-1Qn17_RhSyDywrWf8uLw@mail.gmail.com>
 <CACDmYycHgu8JKjRM6xrMeNkruEHMba+afXtSqLq5TCw3y-b0Zw@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CACDmYycHgu8JKjRM6xrMeNkruEHMba+afXtSqLq5TCw3y-b0Zw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/11/2023 14:20, Legale Legale wrote:
> Wrong file. sorry. This one is correct:

Top posting makes Alan Turning cry.

https://docs.kernel.org/process/submitting-patches.html#use-trimmed-interleaved-replies-in-email-discussions

> ---
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
> +                       clocks = <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>,
> +                                <&gcc GCC_BLSP1_AHB_CLK>;
> +                       clock-names = "core", "iface";
> +                       clock-frequency = <400000>;
> +                       dmas = <&blsp_dma 22>, <&blsp_dma 23>;
> +                       dma-names = "tx", "rx";
> +                       status = "disabled";
> +               };
> 
>                  qpic_bam: dma-controller@7984000 {
>                          compatible = "qcom,bam-v1.7.0";
> --

So you need to make a V2 of this patch.

1. Suggested changing "Legale Leagle" to your signoff name
    Isaev Ruslan <legale.legale@gmail.com>

2. Please remember to run dtbs_check and dtbs_binding_check

The dtb checks should catch errors like the register size.

---
bod


