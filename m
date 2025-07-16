Return-Path: <linux-arm-msm+bounces-65325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC02B080E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 01:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6170D4E30FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 23:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347732EF29F;
	Wed, 16 Jul 2025 23:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jTo1ej1a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D00A29A9E6
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 23:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752708179; cv=none; b=LSHTDRdM/AhQuM+kj73Xl1oQRZWGOQelLzqcJ9LfWh+q+htyswjA76EkF7M0mnRFRYJbcwTSEbbtiVxpOlbbWUNa/UvzBftlrOxqNaHNRrApvUV+8aFgkdzDar0/xD8iRR2umeIVtjfSSN54CaCzMwimubBd8p5OKCgDv4xBN58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752708179; c=relaxed/simple;
	bh=lHrO7ghXNv+BOwuxjbXikdvUSRwMlfAidd09c75UGII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aeC3Dtw4srUOoiVeLxlRGbb0LyB2iUHPKf2EGSV9FaAxesA4YPNYT3doeIxW6p1HMld3ljjgVE5hyKE02zru+c6UhY3FLJ/GCxQVkGLCxKvpl+63g/f3ISWqFwW3JJAIssw6XukswbCgdFx7Nu4h0D5DxjHcoTxR12sBFXz1uIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jTo1ej1a; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so916251f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 16:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752708175; x=1753312975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DkPtKIO7NhPfmSP1zxkzxJPlW/xiUwZt47WKbfa7rFw=;
        b=jTo1ej1ax5q7zJIySgyDP0pLhG6fMEEHuMMMDmu8JI6GSFkpj/2w9iUvTJnZC9M9Ns
         b8BPzL3MTh3yfNwEDTGllV672A2rDQtdXokmsw4KXQx6JirL/gOIj+TwQDd+m73yE9m7
         ob4oxbYzu6QMsVqfzTfFHSLVg2wnC62rIocOvig/WKs0E/ddkn8WROjq5Qe+yW6FpTJm
         U8fO39BI0AfeNIPZNQ6gvmVNzY+PmUdzt0wZz5ztCGmEpL8zENjvlb1hWdIceXiOML8d
         wW5ewq3x5238fuhFtINcuVVixgqM3pgp9bzLltjGQQubMiu9s97xIBGYA41wKP03Unxh
         9PIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752708175; x=1753312975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DkPtKIO7NhPfmSP1zxkzxJPlW/xiUwZt47WKbfa7rFw=;
        b=egTl+W/JSSqwlKlJ0678VimewaR03VPDUE+sKkcWuS4EcphhK+GoNgPKj0sB52WN7k
         KyNEFQEwg2PKs6efEZKd1sOIN3PMbRMWU3HAdA6KaL6Qx0DSIbqzGVA2Y7LH4+LhEsBO
         l+cfN6nC3jJ4vPkRPIsH+48W+naUaWkKeSgoM9MALnR/pkgQxBOGSthfuyjqtvSu3wzA
         mKAFfdBAYrRKQR3Wn9qcIAr9Hd1eYspY0EtXBZsec+50/S6aF7Alh7rF4dBCSI8cMU9K
         PhxbvSQAPKidSpuwwACcASd1XXdkRPYmPxUn1PjrzJyL5b2Q0v1lzkWzsvFOfnroS22z
         0CBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDvPidZWu+p3HVNMzysOsPvHZ+yz3JS6qmIKFlQ8wZe2kvSq47N9Iqj0DCpsAbzVk8gT9TpViqtPrYraBN@vger.kernel.org
X-Gm-Message-State: AOJu0YyuDic1gxScy9JfSK1C1rCRlEOyAkDNjQ9k0TCwuKCmZmjahB64
	s0/s11QD9zqUCz7em4WnKLSHaN7fR/2lYWf60nT/zfQfa6rWru2zL3Tn3FGFt4iRO4w=
X-Gm-Gg: ASbGncvNP0wfCLnFTjX5yZHHVrV+Y8sGPc8aJdxFAwtnTQnrUohsHthC/nfsuO10hfH
	dAtnQ1jenSSYbsp7XHMfe6NVcHKyWcinUdJcE3hsK57zj3P5CgXpPxOYt4pOmLC+BeU6t+QkiNv
	aE/JJeASJU+Q83BrmZ3M+lck+BVn4z5445PZ0+be2ZutQWsALE1QRaHjA3owvVi94bqDdNi3QuI
	sU2U1qri6wE8FBasECMftAT+bcJRUesoKjaUlez9BSlZmMh5LT40Oeu85gl6d2w8FmNm57k6VBd
	oSQXC/WRFspgJGLMHcsDfojVHjAfgNAdoRDe36cJVGaugSzaYr/2ku/QoLPNNtPItyUYUwo1d19
	eRtyQ5ZFMPXfU7mz86epAdPzsEEJ9qdzUoHdjzRU4l2iU4ZfkzmtmlNOf9eMXQEt8
X-Google-Smtp-Source: AGHT+IHwXJaztqWJkdTIkVdOxyH1299bOPGJlgaVcAkmrBYL12PbZpGxwAGAEuNylkrKZJgPKYBnRQ==
X-Received: by 2002:a05:6000:2a0c:b0:3a5:8934:4959 with SMTP id ffacd0b85a97d-3b613a3ff3fmr694018f8f.27.1752708175443;
        Wed, 16 Jul 2025 16:22:55 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45634f9d599sm5060255e9.33.2025.07.16.16.22.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 16:22:54 -0700 (PDT)
Message-ID: <8a63f517-a443-48e4-9b9c-0c4b362f59f8@linaro.org>
Date: Thu, 17 Jul 2025 00:22:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] media: dt-bindings: venus: Add qcm2290 dt schema
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, krzk+dt@kernel.org,
 konradybcio@kernel.org, mchehab@kernel.org, andersson@kernel.org,
 conor+dt@kernel.org, amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-2-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250715204749.2189875-2-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/07/2025 21:47, Jorge Ramirez-Ortiz wrote:
> Add a schema for the venus video encoder/decoder on the qcm2290.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
>   1 file changed, 127 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> new file mode 100644
> index 000000000000..0371f8dd91a3
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

Shouldn't you be on this list ? If you upstream a file I think you 
should list yourself as responsible for its glory or its mess.

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

I'm confused to see this is still here

https://lore.kernel.org/linux-media/zk5cmielm4urfm22yszmjmwvi4mqvdsfthlonq6mij7rkijcsp@7evb3ejxuaj7/

I think Dima is right, what's the problem with declaring maxItems: 5 here ?


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

Alphabetise includes for preference.

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
> +                 <&apps_smmu 0x804 0xe0>;

You're listing five iommus.

I understand there's some disagreement about whether or not to list all 
of the potential use-cases but, TBH I don't think those are good arguments.

Unless there's some technical prohibition I can't think of listing all 
five maxItems:5 .. let's just do that.

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
> +            opp-133333333 {
> +                opp-hz = /bits/ 64 <133333333>;
> +                required-opps = <&rpmpd_opp_low_svs>;
> +            };
> +            opp-240000000 {
> +                opp-hz = /bits/ 64 <240000000>;
> +                required-opps = <&rpmpd_opp_svs>;
> +            };
> +        };
> +    };
---
bod

