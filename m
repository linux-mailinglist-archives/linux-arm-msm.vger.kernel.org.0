Return-Path: <linux-arm-msm+bounces-71687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF198B40FE4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 00:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EC6B7B1F60
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 22:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC9E2749C0;
	Tue,  2 Sep 2025 22:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NQCaPVv+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6108923B63B
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 22:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756851460; cv=none; b=Hgm3g/gLN3GJMEY1aXeSCbOEsuepXjWSTl3lI7yaPHx/0EVRBtmp4OIZrzt4YyDUI9YkQteJKWc2MdxVKcYsLptFtrpAi9URI1XU6HrKkatZsGCryTP+q/qTRMytyVU/Lbx64ajK/GEybD/lNvCfeEnXRiNG180u52ZlVBHUKiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756851460; c=relaxed/simple;
	bh=YEIc194Ao5yrfy9fw80PwIuIjisIq6gf8KDaB/zh1tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u2gxRPvwJ3EbhTjmYq+7gj21esG0yMZe8UHay0XVxsVTlxFF4mUyvrOTmR60bQrjirNGHsgZcMQ2EN+qmpbu/CxXdO0oW09vQNT20UUbhhi6d2ngRyRV5rocmlib6zsC6Xdowoo05k3TAw/lwZ9tuaiagzq1DgsBQsn7gFcPK6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NQCaPVv+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b8b2712d8so29666195e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 15:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756851457; x=1757456257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Odc+SKaLkvuOl8Zr1Krcde+q8Sa9570C7V06vYvfBtQ=;
        b=NQCaPVv+QuqGlQ3snW2yZBTfOnYt2jhf3sFYE6JTQ7b5HFlK8xGhlFet0L+RSkgVST
         YKxXWnm3OI+ZQAEw2GznTLEibGWlzZo2aU5Nt5McVMhg+KmKIfJeeB8zVrBXuuZ4wiPr
         MpZvm2CN0dGOZeflnTHzzkjFeRNp16iKyvi2duQ2fSJy1l/GNEQTQgWOG42+47Ne0bQS
         mUgzxGMcxlHkX+sj7F3mPmTDPdq+WJTPEreI81MhkkKCUFDOmphQHGMvzhA5LrlmDZjB
         iZTYMhyP0qEkxipD9CFk1MabQRFDV+EWHWGyCM1vwCKu5bCDT1KaEIysXQWcyrm2CJPy
         WwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756851457; x=1757456257;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Odc+SKaLkvuOl8Zr1Krcde+q8Sa9570C7V06vYvfBtQ=;
        b=JQ4uS99waqZDeLp5q4Ttwh7IwdXJqiiY17rT4goqVOBraZHanRUjTo4eLWH8MCW1pA
         GZMFUOSHYXbGs5A34mztsMjHoisHWg2CpiO3FEB44/ZE/m8nyfGEIoV8PLz+wHTgTUI1
         qTwO+XBHgEyXQ8Km3TfxBDV6GuyycC9KSJBNfi0gOwIq36UUHsvg3tf3ok0nBPRp4809
         kc3pgT8UB28GkGPeUqyUTZ64zpPiUojjGjJULOD0BY7HU9w0PACmLZIb+FC4CLUwlQ65
         Tl4zga8SsV+30J2S2wQfU4mjUNF+TVSRImSjTyl/QgSDHlIujKBT7K9hWS5G/qz88mSH
         pTIg==
X-Forwarded-Encrypted: i=1; AJvYcCUv/tVQI/nPon6tISlLktq1Kl6l6TRlmb/e5Rjc9oXuDl4+dk0or8RBuOywXJLtPtKMi1Njtnim3f1N8Fbz@vger.kernel.org
X-Gm-Message-State: AOJu0YyoJwQJxX3/9x4A6C+iiGrSHixnKoMP4Oy54kPLMqMEkvTDTfwp
	gqR5/ssRgCNoY+3JfnA+vlwWVqAo6zF0dEn7i5u5EwB7KmsXNlSHnZD2AXPoKH+4vVE=
X-Gm-Gg: ASbGncuyORPl5/COZrwh77sHwwASqY7dJnci3U/uU2fkYTMUV3YC/0MOQ862WN82Xea
	nEBvsGKdKclGwUfyZuVvP6LAAtSRSgf5wR957F1QxW0u4KV6fXR2ccqq3/W8UjgxvSVnAwAQz0e
	FYcoLjrzydsYrs70MZALeP3QskxBGcmy1t5d71v5kB7meaXMs/Oxbe4hbCLOxTxpcsUIQ01EeGA
	sYLXdejY1lhLpAHJhJqih3HreP4hcTvybZ83oBlq52wsg1UwDas96bcjmoB+3Wp9EZrpnoKaKi9
	EIOR4H2HvpRcYHbD4K3tfCeS/mC+/H+qTqGOIMjJtLpuQPpmkaRNeFr/UkTXfl6r0JMey2969hU
	QeekENvOWdrOEYtg0j2I9t0FGduwI71+53DoNjEy6BXoHa+8FAjth4Eymh9n/JbcxEspD+TWeUx
	woYbG6w6sq19thQAnoy9WTTJt7EsLBDtw=
X-Google-Smtp-Source: AGHT+IEcfnYXz+ii1oNYKNXIttKMgpo4bfd3Q7jINqKFuzP2Jas3kpGopgl+yDLGBteadORdYJEmQA==
X-Received: by 2002:a05:600c:3153:b0:458:bda4:43df with SMTP id 5b1f17b1804b1-45b85570996mr137042635e9.17.1756851456607;
        Tue, 02 Sep 2025 15:17:36 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45c447244c4sm15302105e9.6.2025.09.02.15.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 15:17:36 -0700 (PDT)
Message-ID: <80bc915b-16fa-4cab-b461-b18b9a124d0e@linaro.org>
Date: Tue, 2 Sep 2025 23:17:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: dt-bindings: qcom,sm8550-iris: Add SM8750
 video codec
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250902-sm8750-iris-v3-0-564488b412d2@linaro.org>
 <20250902-sm8750-iris-v3-1-564488b412d2@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250902-sm8750-iris-v3-1-564488b412d2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2025 13:45, Krzysztof Kozlowski wrote:
> Add binding for Qualcom SM8750 Iris video codec, which comes with
> significantly different powering up sequence than previous SM8650, thus
> different clocks and resets.  For consistency keep existing clock and
> clock-names naming, so the list shares common part.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/media/qcom,sm8750-iris.yaml           | 201 +++++++++++++++++++++
>   1 file changed, 201 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..1d9e8479a4b04eaf571cfd022725dc0b397e4947
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
> @@ -0,0 +1,201 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8750-iris.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8750 SoC Iris video encoder and decoder
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> +
> +description:
> +  The Iris video processing unit on Qualcomm SM8750 SoC is a video encode and
> +  decode accelerator.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8750-iris
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: iface          # AXI0
> +      - const: core
> +      - const: vcodec0_core
> +      - const: iface1         # AXI1
> +      - const: core_freerun
> +      - const: vcodec0_core_freerun
> +
> +  dma-coherent: true
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: video-mem
> +
> +  iommus:
> +    maxItems: 2
> +
> +  memory-region:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +  power-domains:
> +    maxItems: 4
> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: mxc
> +      - const: mmcx
> +
> +  resets:
> +    maxItems: 4
> +
> +  reset-names:
> +    items:
> +      - const: bus0
> +      - const: bus1
> +      - const: core
> +      - const: vcodec0_core
> +
> +required:
> +  - compatible
> +  - dma-coherent
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - power-domain-names
> +  - resets
> +  - reset-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/clock/qcom,sm8750-gcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    video-codec@aa00000 {
> +        compatible = "qcom,sm8750-iris";
> +        reg = <0x0aa00000 0xf0000>;
> +
> +        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +                 <&videocc_mvs0c_clk>,
> +                 <&videocc_mvs0_clk>,
> +                 <&gcc GCC_VIDEO_AXI1_CLK>,
> +                 <&videocc_mvs0c_freerun_clk>,
> +                 <&videocc_mvs0_freerun_clk>;
> +        clock-names = "iface",
> +                      "core",
> +                      "vcodec0_core",
> +                      "iface1",
> +                      "core_freerun",
> +                      "vcodec0_core_freerun";
> +
> +        dma-coherent;
> +        iommus = <&apps_smmu 0x1940 0>,
> +                 <&apps_smmu 0x1947 0>;
> +
> +        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                         &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                        <&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
> +                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +        interconnect-names = "cpu-cfg",
> +                             "video-mem";
> +
> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        operating-points-v2 = <&iris_opp_table>;
> +
> +        memory-region = <&video_mem>;
> +
> +        power-domains = <&videocc_mvs0c_gdsc>,
> +                        <&videocc_mvs0_gdsc>,
> +                        <&rpmhpd RPMHPD_MXC>,
> +                        <&rpmhpd RPMHPD_MMCX>;
> +        power-domain-names = "venus",
> +                             "vcodec0",
> +                             "mxc",
> +                             "mmcx";
> +
> +        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> +                 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
> +                 <&videocc_mvs0c_freerun_clk_ares>,
> +                 <&videocc_mvs0_freerun_clk_ares>;
> +        reset-names = "bus0",
> +                      "bus1",
> +                      "core",
> +                      "vcodec0_core";
> +
> +        iris_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-240000000 {
> +                opp-hz = /bits/ 64 <240000000>;
> +                required-opps = <&rpmhpd_opp_low_svs_d1>,
> +                                <&rpmhpd_opp_low_svs_d1>;
> +            };
> +
> +            opp-338000000 {
> +                opp-hz = /bits/ 64 <338000000>;
> +                required-opps = <&rpmhpd_opp_low_svs>,
> +                                <&rpmhpd_opp_low_svs>;
> +            };
> +
> +            opp-420000000 {
> +                opp-hz = /bits/ 64 <420000000>;
> +                required-opps = <&rpmhpd_opp_svs>,
> +                                <&rpmhpd_opp_svs>;
> +            };
> +
> +            opp-444000000 {
> +                opp-hz = /bits/ 64 <444000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-533333334 {
> +                opp-hz = /bits/ 64 <533333334>;
> +                required-opps = <&rpmhpd_opp_nom>,
> +                                <&rpmhpd_opp_nom>;
> +            };
> +
> +            opp-570000000 {
> +                opp-hz = /bits/ 64 <570000000>;
> +                required-opps = <&rpmhpd_opp_nom_l1>,
> +                                <&rpmhpd_opp_nom_l1>;
> +            };
> +
> +            opp-630000000 {
> +                opp-hz = /bits/ 64 <630000000>;
> +                required-opps = <&rpmhpd_opp_turbo>,
> +                                <&rpmhpd_opp_turbo>;
> +            };
> +        };
> +    };
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

