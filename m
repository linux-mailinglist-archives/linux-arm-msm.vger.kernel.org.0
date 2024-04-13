Return-Path: <linux-arm-msm+bounces-17373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B680F8A3B8F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Apr 2024 10:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D63E71C20ECC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Apr 2024 08:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A83F1D551;
	Sat, 13 Apr 2024 08:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmJtYyuI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DAB1CFBB;
	Sat, 13 Apr 2024 08:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712995463; cv=none; b=bJKD13k6slE0+BP6vbpL/7jwhnOXPQanL4tou9BdwTy/gyezw4OZuFroZJASZPjt1bqCMAV+G5ELE6C1nDeMpBhPiFZ9hsEchX39pz82/yTKmXSZIsPZweOgF4Klf9j6vW7nzkiQtyJj6R/QZJ0/e4prsip//WUoHo0rfte0NNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712995463; c=relaxed/simple;
	bh=QZCEK0CIagBybPLkRjQZB+ueBDbozC2tromIPFers3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LxMle+v50VkPy6ZQuwm9ngTnoFmLRznb5QCEqN+JTjiELCGRFoj3st10KgoUgVVJ63Rba8rdZFbpQDlMnFUiCsnsyH7tFPSN9XmT7dxwm2EgxKRzaiI62tCHXsrFb6n844jzcj67/NG034tVS+orYjqeKbrz3CDoLXI1BJ+GdB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmJtYyuI; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e3ff14f249so12471235ad.1;
        Sat, 13 Apr 2024 01:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712995461; x=1713600261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bxLRqhr1FqEjQA1PjAbGBGSdX+2n1rP+a8Vb8lQhOj4=;
        b=TmJtYyuISRyej/RpB7e9gUcNkNuMxhsJnRQqL1aqKJUpHOGYlZqN9myFKA1CV3V3Ru
         wf5/yXpeVtRIDjj3NTYlQWKGJ0yRDKjrgvj6Tr1XPOwHv32JO6IyDmSYhSaXEUsZaWVT
         5V6km8uY/QRM+0cBHDgfoUvlSt1CUA3gHQGQbMuCdjsYfxx01QPSnPz76z8we3Rf0mmJ
         xa2+HMb2DQGruI95GhALQz6CfRIwoN7VLoy2jB0JoL4GVw5J2mFRVgkM5SDgJlaJrt3k
         M8mInFu4Kl/AOMY5wQtAgpcY/GZes9dzIc/wXcpcl8BNzjuKtHYltuPDb93ZDYTgPDJB
         pZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712995461; x=1713600261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bxLRqhr1FqEjQA1PjAbGBGSdX+2n1rP+a8Vb8lQhOj4=;
        b=GbAWbmA9h8mOMOI+OvcWoeoPRbauqk/3uLchdTDzF6EYw/l4GqJvGBr59uB69uUFhL
         kNuF+ypViqU1Ko90AB+a1L2RlCJJi1m4dxS+Yz3mEuTfBPDrpJIYRubua7ydO+ATBraF
         9X/g6YIUez2B9wWESN0Bm1+fKfUORD+QP8koiDZDikHhiJNXgiO7A8f8PXur5AqKSCS3
         ItvIW9ratoO6Q4xtwBBD2Iga1jFTrbiR6eU4VoLU7cXPBhSzTknX8Cuotz6vLIc8j8Oa
         scWVnO3XUBOTZyZm3mEznUllf0mivunslCnGb5p1B+vGZUCszBYPWITNUW0e9cbs7QjS
         TJbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEX9f/1qxx59GCOrduS0GEYoFj+s439GqggBZldocjOFKTbWjtgkMjbQFMG+jrX/K1/rl5forGgrSHw4gFxtLnmxufBz8siBiGMpGMCjZuxRoo5TqbaIKayHtIPJU1WMS+iuzpeOMlYQ==
X-Gm-Message-State: AOJu0YxZFtXBzdPa5bHmf1g0s59cpJUIQFvBdcyRYTk9YrT/jg4waSZi
	z+mBM9DzEonGu3AdqBc5iZA04+HdUMvANYo1hz6ILUXOsRyrMa57dUFLSJhGCFk=
X-Google-Smtp-Source: AGHT+IGUGLWSwfiw7R8x/M8N7rE7Rt5vT6K+6abu8hm6zxcpzczpPkE1/EDPv515yZpWvd8XwEVlPQ==
X-Received: by 2002:a17:902:d4cb:b0:1e0:c0b9:589e with SMTP id o11-20020a170902d4cb00b001e0c0b9589emr9877377plg.25.1712995461252;
        Sat, 13 Apr 2024 01:04:21 -0700 (PDT)
Received: from [0.0.0.0] (42-3-109-144.ptr.netvigator.com. [42.3.109.144])
        by smtp.gmail.com with ESMTPSA id i18-20020a170902c95200b001e3f148ffb8sm4121481pla.21.2024.04.13.01.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Apr 2024 01:04:20 -0700 (PDT)
Message-ID: <f2496498-d8cb-449c-905b-fb32d9b3deff@gmail.com>
Date: Sat, 13 Apr 2024 16:04:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Split PMU nodes for heterogeneous CPUs
To: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240412222942.3874269-1-robh@kernel.org>
Content-Language: en-US
From: Xilin Wu <wuxilin123@gmail.com>
In-Reply-To: <20240412222942.3874269-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024/4/13 6:29, Rob Herring wrote:
> Arm heterogeneous configurations should have separate PMU nodes for each
> CPU uarch as the uarch specific events can be different. The
> "arm,armv8-pmuv3" compatible is also intended for s/w models rather than
> specific uarch implementations.
> 
> All the kryo CPUs are missing PMU compatibles, so they can't be fixed.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8956.dtsi |  4 ++--
>   arch/arm64/boot/dts/qcom/msm8976.dtsi | 10 ++++++++++
>   arch/arm64/boot/dts/qcom/sm4450.dtsi  | 11 ++++++++---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi  | 14 ++++++++++++--
>   arch/arm64/boot/dts/qcom/sm8550.dtsi  | 19 +++++++++++++++++--
>   arch/arm64/boot/dts/qcom/sm8650.dtsi  | 14 ++++++++++++--
>   6 files changed, 61 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8956.dtsi b/arch/arm64/boot/dts/qcom/msm8956.dtsi
> index 668e05185c21..fa36b62156bb 100644
> --- a/arch/arm64/boot/dts/qcom/msm8956.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8956.dtsi
> @@ -8,8 +8,8 @@
>   
>   #include "msm8976.dtsi"
>   
> -&pmu {
> -	interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
> +&pmu_a72 {
> +	interrupts = <GIC_PPI 7 (GIC_CPU_MASK_RAW(0x30) | IRQ_TYPE_LEVEL_HIGH)>;
>   };
>   
>   &tsens {
> diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> index d2bb1ada361a..1ad102b1633c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> @@ -226,6 +226,16 @@ pmu: pmu {
>   		compatible = "arm,armv8-pmuv3";
>   		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
>   	};
> +	pmu-a53 {
> +		compatible = "arm,cortex-a53-pmu";
> +		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +	};
> +
> +	pmu_a72: pmu-a72 {
> +		compatible = "arm,cortex-a72-pmu";
> +		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_RAW(0xf0) | IRQ_TYPE_LEVEL_HIGH)>;
> +	};
> +
>   
>   	psci {
>   		compatible = "arm,psci-1.0";
> diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
> index 603c962661cc..411eb7577407 100644
> --- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
> @@ -268,9 +268,14 @@ memory@a0000000 {
>   		reg = <0x0 0xa0000000 0x0 0x0>;
>   	};
>   
> -	pmu {
> -		compatible = "arm,armv8-pmuv3";
> -		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +	pmu-a55 {
> +		compatible = "arm,cortex-a55-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	pmu-a78 {
> +		compatible = "arm,cortex-a78-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   
>   	psci {
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index a5e7dbbd8c6c..127fa9a935da 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -300,8 +300,18 @@ memory@80000000 {
>   		reg = <0x0 0x80000000 0x0 0x0>;
>   	};
>   
> -	pmu {
> -		compatible = "arm,armv8-pmuv3";
> +	pmu-a55 {
> +		compatible = "arm,cortex-a55-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	pmu-a78 {
> +		compatible = "arm,cortex-a78-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	pmu-x1 {
> +		compatible = "arm,cortex-x1-pmu";
>   		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 3904348075f6..8e7d0ac17a12 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -357,8 +357,23 @@ memory@a0000000 {
>   		reg = <0 0xa0000000 0 0>;
>   	};
>   
> -	pmu {
> -		compatible = "arm,armv8-pmuv3";
> +	pmu-a510 {
> +		compatible = "arm,cortex-a510-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	pmu-a710 {
> +		compatible = "arm,cortex-a710-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	pmu-a720 {
> +		compatible = "arm,cortex-a720-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	pmu-x3 {
> +		compatible = "arm,cortex-x3-pmu";
>   		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   

I believe SM8550 uses cortex-a715 instead of a720.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index ba72d8f38420..90102a41489d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -394,8 +394,18 @@ memory@a0000000 {
>   		reg = <0 0xa0000000 0 0>;
>   	};
>   
> -	pmu {
> -		compatible = "arm,armv8-pmuv3";
> +	pmu-a520 {
> +		compatible = "arm,cortex-a520-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	pmu-a720 {
> +		compatible = "arm,cortex-a720-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	pmu-x4 {
> +		compatible = "arm,cortex-x4-pmu";
>   		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   


