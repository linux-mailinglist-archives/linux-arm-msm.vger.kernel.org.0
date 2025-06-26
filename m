Return-Path: <linux-arm-msm+bounces-62675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0867EAEA11C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 16:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B06D9166E1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 14:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24602ECE8F;
	Thu, 26 Jun 2025 14:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g2hDXUb4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9BA2EB5DC
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 14:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948857; cv=none; b=ixcu+AVkAlJzfuTY+Hp00N2DBeWPjPoa61h07o4jp9Ly+7ZcHR5phmVOlqg7ryurzJVMT0MsrAvv+P202SyoYo1vXmgSbEzo2SIt5SSxIEksW8nP7nC387JvUp6fn1GvnKxjQoPJnr9wZ5S4o2EpPuM6XyPGPfLqQucjPRKMxaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948857; c=relaxed/simple;
	bh=8O3gt7jx+aGh1tZT01SJ9L2g6Jsx6u6+UXl+1sLn5b0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HPCuWQzJWkxYTKlz0cUwDycSj5EqZrkY2LZeyvDfzTU5m30egWQlmqfcgG7UdNgiPxg8NmTic0HZaa2XYnLm5FGCSzc3UkIJY+XmSzHCrKR80VH252MOxcvB7seJqFgRtTjJ/ff0ebYRNcK4QLMkzQo11M7DvjM77Mz3wNuZ550=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g2hDXUb4; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-45310223677so6596525e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750948854; x=1751553654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wy/zTlmBvKUKunUHtc1dVVfJLd3o8GbdKsSB+SxoJFU=;
        b=g2hDXUb4QacfOpPn+MT5V3QfAjYn04J5eDTmhK3HRBPEex51PLUAqS0PDpyqvAsBpk
         54ljAhx3ScqUk5DqY06V1XsHqv3rtMhdft7wQltxMB6rcB/zoqBKB+R6LCayhqI7KJsf
         t1efI39GDUbHCswPdRfQV/nh08eo3mbEdFRzmTu6+ysQ0reZwxs6Ne5nUvnUIu2zpynF
         TM0X+WTy6ZfUs6o/99FwLIMA/v9ilXJoYULUFCznm9+5U8t2Un6IkPH2tjVjcC1GsjfV
         WZYvV/nZnPIQLEoGiLozOEydTHMOV8eRETF9BqoyvWMTfUGQNKVvebncqP4ERuxh7GsW
         V7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750948854; x=1751553654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wy/zTlmBvKUKunUHtc1dVVfJLd3o8GbdKsSB+SxoJFU=;
        b=PpdjXJyYxYyAeec4y/Sb3fIoV0zUM6KdDKilIus8sQfmhU+XC5cQs5ou78aXPnl1xU
         lUm6yjxQurGw8vedz3eAP73SySlQWeQBhIE14Tfv9lwq5GrtCreRTB32gtBfLP+G1UTJ
         EB5MwbraaUwn94+aweVY/CpjEGxbjZ+hpJf16Zgt8hMqjqlxlQiBPsm1QibpEJlo4NPS
         O0++NHSOUiYgI5gRCYB3+TOVZIKsbyzc8K/CdSiFq+zva2XmT7eSdPlQs05LK/FVI1KU
         S2NVZp8fYIJDUjdMf74jSfPVmKkw3iJPsN1l7GxNJSfh1b4+haEMrp/HgEedmMTfPxCs
         FxBQ==
X-Gm-Message-State: AOJu0YyPa1AVWzU0MnfSyDtSVKrq/TILBUwvtIN1gpwsYKg9sNElf/09
	Ij/7WsocqOuaMrEFdjDWBkSe/kjl4YFBeXxfnd3Jm/GELCisXdnA7CJrK7Jk5IMRLlk=
X-Gm-Gg: ASbGncvoo4mYNbF+fZz3CafgzMA2MwCoOXKcEk4ejIl34vQl3nd/khtX4sm+0XGwRh9
	QGF4qkMYO1DyVwajOAV85NEjapxo4lFF0fbmEEHhXQjGar9phk2UM2KymzxcC2uc2/hi7WmVy+M
	5rUFRgsyHQyZQ3iLSH0AE9+fIYsJ5WTxXHVBPoBgCTv042BxZ8HfI0dv08Lvlive8K2mo7Yn/fk
	hfFgN9bnJCGxrI44vzNzRHGqNx7ur0U8BUaRoLfhoC2fwRlw6EnnUSVsHoBegxyznAktwDREOT8
	dGE3zQYlZ28lbSsuOlfe0OVG5cnIAHReBPrRZMdWO9wQGhsKVPyoZmMCFpvH1mITBa6Z3oQY+u5
	qVxVCpED3T5sS8l5icna5LtVCcu8=
X-Google-Smtp-Source: AGHT+IFJsf8jt4eAr1bTr8MT4go/FTU7WrRQVFp9b4j12cJ2ErH5LEoba2mg/H/VfQkHwRZCUZYOLw==
X-Received: by 2002:a05:600c:5014:b0:442:ccfa:fa with SMTP id 5b1f17b1804b1-45381aeb284mr63726245e9.27.1750948853943;
        Thu, 26 Jun 2025 07:40:53 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453883d81besm32042595e9.38.2025.06.26.07.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:40:53 -0700 (PDT)
Message-ID: <fd6914ca-5431-4c82-925b-7dab3f0d026a@linaro.org>
Date: Thu, 26 Jun 2025 15:40:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/2025 14:59, Jorge Ramirez-Ortiz wrote:
> Add a schema for the venus video encoder/decoder on the qcm2290.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
>   1 file changed, 127 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> new file mode 100644
> index 000000000000..a9f89b545334
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QCM2290 Venus video encode and decode accelerators
> +
> +maintainers:
> +  - Vikash Garodia <quic_vgarodia@quicinc.com>
> +
> +description:
> +  The Venus AR50_LITE IP is a video encode and decode accelerator present
> +  on Qualcomm platforms
> +
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,qcm2290-venus
> +
> +  power-domains:
> +    maxItems: 3
> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: cx
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +      - const: bus
> +      - const: throttle
> +      - const: vcodec0_core
> +      - const: vcodec0_bus
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 5
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: video-mem
> +      - const: cpu-cfg
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +required:
> +  - compatible
> +  - power-domain-names
> +  - iommus
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
> +    #include <dt-bindings/interconnect/qcom,qcm2290.h>
> +    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    venus: video-codec@5a00000 {
> +        compatible = "qcom,qcm2290-venus";
> +        reg = <0x5a00000 0xf0000>;
> +        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        power-domains = <&gcc GCC_VENUS_GDSC>,
> +                        <&gcc GCC_VCODEC0_GDSC>,
> +                        <&rpmpd QCM2290_VDDCX>;
> +        power-domain-names = "venus",
> +                             "vcodec0",
> +                             "cx";
> +        operating-points-v2 = <&venus_opp_table>;
> +
> +        clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> +                 <&gcc GCC_VIDEO_AHB_CLK>,
> +                 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> +                 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> +                 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> +                 <&gcc GCC_VCODEC0_AXI_CLK>;
> +        clock-names = "core",
> +                       "iface",
> +                       "bus",
> +                       "throttle",
> +                       "vcodec0_core",
> +                       "vcodec0_bus";
> +
> +        memory-region = <&pil_video_mem>;
> +        iommus = <&apps_smmu 0x860 0x0>,
> +                 <&apps_smmu 0x880 0x0>,
> +                 <&apps_smmu 0x861 0x04>,
> +                 <&apps_smmu 0x863 0x0>,
> +                 <&apps_smmu 0x804 0xE0>;
> +
> +        interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> +                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> +                        <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> +                         &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> +        interconnect-names = "video-mem",
> +                             "cpu-cfg";
> +
> +        venus_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-133000000 {
> +                opp-hz = /bits/ 64 <133000000>;
> +                required-opps = <&rpmpd_opp_low_svs>;
> +            };
> +            opp-240000000 {
> +                opp-hz = /bits/ 64 <240000000>;
> +                required-opps = <&rpmpd_opp_svs>;
> +            };
> +        };
> +    };
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

