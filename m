Return-Path: <linux-arm-msm+bounces-50810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72442A5917B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 11:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A34FB167889
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 10:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB80226CF9;
	Mon, 10 Mar 2025 10:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YpT5XZiE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FFD226CEB
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741603485; cv=none; b=W3xF4ES7+6QIvvYMXeCLqGTZQ0gM0ACJLXsCcoVjx050j79/YR+keOuf3SAngY+fmGcDCOAGjDSwYelMbyPMvcgL6YFO0DjX5ruL3wd0QCOAL+ogOmwKVlaXYi6/Qwmhx39m2/G/n1BWgizxjYNivh7l4sD8zberxLFGmLshxsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741603485; c=relaxed/simple;
	bh=W86R7IVl5vFPfAm4qhmA/ZOkcKxfvO+ui47zCi/gQsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZ+SDfuRs0AMjQu5DXOjrno8+9yAg+fYwqyZnV1uD0nmUd5RRZpAnZTk5/S7mORFSb2HiIrNNr8PL2u9mcBj4OO2uyYFnZBb5BNZqV4QpJlZt8IxvyQ+OZCnfu+oQN11b7AAl2VwFA8RBR2pqfz5YnEeypabJ+DU3MTGIhwMWWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YpT5XZiE; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5498d73ff88so427603e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 03:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741603481; x=1742208281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5/dNvTB+PA3fGtHYrb54pNt4vjI9qtq4wZH4Xt7vLdk=;
        b=YpT5XZiEl2mh8tlu5ET2x0G0bC0U5fo7MYPtCCO8ogiGfJThFid47vj2d9waChGNQI
         EqfL87Fda2Dcv0VhqUqV/1menUCJKDas2TN0UjSbsRLAy6LMeQlYSnkaUH3rDC95q7nx
         28uNUkN9R8oRoCUJA0dTSmIdbpxHaa3LlbDkwi4dCRC2pnWWEZcC7RNVL3qDZntdnoZd
         ujURdkvBt665qP8XIB9pbQdbWvY7ixJ5VYxn4Wboq5ScHjgEH8MXv/msbBn9WxOMKaA5
         bTxNIEFKgblpJ8zWP9ZHuLDpl9mR1xE5FXDRqyq0A42GK2qDbczGwcnuoVSUXEe/GjyU
         X5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603481; x=1742208281;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5/dNvTB+PA3fGtHYrb54pNt4vjI9qtq4wZH4Xt7vLdk=;
        b=kg287BdKcte4PIL8NR/KiuSOfX6Jz4a6erLUaqujHGHazX/eh6Aplh4aVIdei6vA0m
         TqtxZCU//YR5jKfnTh9okRXciH4ofASjjADzDVZ9bPnNFMKDiyeQReZJCgbQMiLXA23b
         ddFGVl9EnWMPHywaABfUCCGJrg7yY1LPE+/dMuwGQeAlKJo4F7AUtZJPoPySlysMN3u/
         HNAs1NHuxWfyD0Pdhg047e7jlEOVZzrSdMFo0H1YqOIjY42nMgUfu+q6oNWkS0fiBF8g
         1vhBIE+OpooHafFLf2A5Mr0lMsmhpyxQ0bSKvz6CdMsZoR7j9mJMxH5HozFu4wjTKRCH
         a7gQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2DhhlqcvFxzNwRbyvbFYfb83Bosr6k0TAVJcJ3/PSF3rmqZUiYrcwNmKFVrvl8kZd/JHZNSONs9n4zxJ2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5k+9O/mYs3XmPUV/md3fD60S5FUOJ50HxGQg9FvMdobKBJiDl
	jiWL46aAbnIqghE8FMsLj53zWB2Z+w23+r59NzWx3u4nMMp7deiUZQoULLWdd/o=
X-Gm-Gg: ASbGncvmOYb106uF4weCjEv+x51/GyNGdODNHF35yjlqVQHECg0EYN2SLFJD/+0gLV7
	IxQ0+Vozv+mwrxByecANqcQWh87TT+2eBwCc0Qopw2imRrE+KzFxfJ4xr8ox2WvPrmFfQERt9NZ
	W0epNwtgc/KocpANvW81pH0JIyKzaJm4ZBqPM8Px+TQAHDUyfGU3x40WlPerPDN4HpZRngTNGK5
	tzYbqQsBW5qAEQevlQc7q/UpursfCBTsK65+JNJH6dcv2OSwRgtcUbabBDavQ4t+IUbgZyooW34
	nOB4nQqtiXpon/iTVVkG8LZNRCukntfwDJE2pYkjK4yPuzAu2r808WvvpZEOsr2FROcWq7qfIQ6
	t/21AvhE1a2a7gBjTDKJYKoPkrcZZwNRXDA==
X-Google-Smtp-Source: AGHT+IGkvmrK54Y77DiLpPeyH9HX5ppOK5F0WcDiedCMulR61NdC/bj3JYvNA4VroVbjFSvPxhCb7Q==
X-Received: by 2002:a05:6512:114f:b0:549:9044:94b0 with SMTP id 2adb3069b0e04-54998e25595mr1026427e87.4.1741603479687;
        Mon, 10 Mar 2025 03:44:39 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bd08asm1407721e87.124.2025.03.10.03.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 03:44:39 -0700 (PDT)
Message-ID: <57222e16-0760-4832-ac15-0bd5ffe21077@linaro.org>
Date: Mon, 10 Mar 2025 12:44:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org>
 <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-2-c2964504131c@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-2-c2964504131c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Bryan.

On 1/19/25 02:54, Bryan O'Donoghue wrote:
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 9d38436763432..10035bcfa89bb 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -5,6 +5,7 @@
>   
>   #include <dt-bindings/clock/qcom,rpmh.h>
>   #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
> +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
> @@ -5109,6 +5110,21 @@ usb_1_ss1_dwc3_ss: endpoint {
>   			};
>   		};
>   
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,x1e80100-camcc";
> +			reg = <0 0x0ade0000 0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>;

Since I believe here is the error in the device tree bindings, it makes
sense to fix it before adding the clock controller into the platform dtsi
file, please review the proposed change:

https://lore.kernel.org/all/20250304143152.1799966-1-vladimir.zapolskiy@linaro.org/

> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>   		mdss: display-subsystem@ae00000 {
>   			compatible = "qcom,x1e80100-mdss";
>   			reg = <0 0x0ae00000 0 0x1000>;
> 

--
Best wishes,
Vladimir

