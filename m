Return-Path: <linux-arm-msm+bounces-84260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 822B5CA0DB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 19:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 097F03014DE6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 18:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3E72EDD7A;
	Wed,  3 Dec 2025 18:14:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E18823AB87;
	Wed,  3 Dec 2025 18:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764785699; cv=none; b=aLfwllB15bHc0c3Xk8M8QU6WpgEAV4XWeagxinD3RAYcOKAV8juNfWmzcHDHHnyOgvEHS4KXArfeC2mjA/NwJZb+enCovZP1JleAj2f+Z4+obaOD8E6TBjxu3LZDPsfiAOmA8Bg55MwPj8Ibg41EfgQNfWM1QhUE9dKqcojPNLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764785699; c=relaxed/simple;
	bh=wCOYtTUGwfcv+eaVP2qI2FhvFiT0ZfDvNzLgq+nbjpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+oG3YKlOaZppw95AAhx2+jX2A35poEcF2gQ8GeNVbFI9ElDJiu2YP+G0kQPjVgfdtFx0nkCCaPapl+0IbW+oRUszQVXriq/2x2MZCMfEAkRgX+gw9cqPe+/I5VjweNjiLfo5rVCU69uX06u/kRvA8E6xscJJX9lm1Pm9AylOmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06345339;
	Wed,  3 Dec 2025 10:14:49 -0800 (PST)
Received: from [10.57.75.103] (unknown [10.57.75.103])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48E2C3F66E;
	Wed,  3 Dec 2025 10:14:53 -0800 (PST)
Message-ID: <66d4488f-941a-4716-b81f-e0f9e1165931@arm.com>
Date: Wed, 3 Dec 2025 18:14:51 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-6-1db9e621441a@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-6-1db9e621441a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2025 03:01, Jie Gan wrote:
> Add an interrupt property to CTCU device. The interrupt will be triggered
> when the data size in the ETR buffer exceeds the threshold of the
> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
> of CTCU device will enable the interrupt.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index 843b52eaf872..ea05ad8f3dd3 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -39,6 +39,16 @@ properties:
>       items:
>         - const: apb
>   
> +  interrupts:
> +    items:
> +      - description: Byte cntr interrupt for etr0
> +      - description: Byte cntr interrupt for etr1
> +
> +  interrupt-names:
> +    items:
> +      - const: etr0
> +      - const: etr1

Why are they named "etr0" "etr1" ? That would be confusing, isn't it, 
especially with the Linux driver naming things randomly for the TMC-ETRs.


What we want is the "port" number corresponding to the "TMC-ETR" being
monitored ?

Have you explored other options, "port-0", "port-1" ?

Suzuki

> +
>     in-ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
> @@ -56,6 +66,8 @@ additionalProperties: false
>   
>   examples:
>     - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
>       ctcu@1001000 {
>           compatible = "qcom,sa8775p-ctcu";
>           reg = <0x1001000 0x1000>;
> @@ -63,6 +75,11 @@ examples:
>           clocks = <&aoss_qmp>;
>           clock-names = "apb";
>   
> +        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "etr0",
> +                          "etr1";
> +
>           in-ports {
>               #address-cells = <1>;
>               #size-cells = <0>;
> 


