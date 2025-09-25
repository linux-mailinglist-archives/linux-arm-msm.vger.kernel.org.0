Return-Path: <linux-arm-msm+bounces-75027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC770B9E2FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:04:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6F0B3AA9AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFAD925A631;
	Thu, 25 Sep 2025 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IanQIRNM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7338488
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758791092; cv=none; b=Z4uJQTMiXq5dZ5F3q4k0eD8/c8oFP/WHLkXZ58r0RntIVDVbtEtU1lp8e7pgP/KDi2R2b6abW6n4Sr7g6F6oHeuV+LvzMwfW1BPjllD9C56wje7QvQRzyZHqXEKmueji/n/+U/ai5VbBkILHbCC0TOjG+wH1wWahsnd9wGXtNrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758791092; c=relaxed/simple;
	bh=GiwBbWtoB2tfwoPzjKROuEEggM8W+m2R48BbdsJ/qW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M70sElBc5Sxvqc6sn2IftLvHjw1ma0h+jkB6aA8/323U/NdOboiF175sviBSbne3R4gqEdNkeJFsYXi9FgjPJBRrKaHJ488p6k5f7ht+ECoWUaBnK6RIg0YR0dSGSwBZqTnIpxMpKkP1h1hQWDgJsyUC8N+GCFrp0zstGVwBAKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IanQIRNM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e2e363118so6614015e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758791088; x=1759395888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=52cJq27fTrRB0shrC+OriI/jG8WLskY0nr0nR3oM2xU=;
        b=IanQIRNMwJ+YzYUAvzhZ0ZP0Q6vA5t/zs7D+UFw0RElRVvHyBz42ptgBmZgsBpCR0b
         5WAwxzeoihbknb/6xyKg2NKO2jRWP52ED3kef/0wzaM4nBTvEHnZiUxQIEFIru2JsaaV
         WBMPH1a8aP3uzFipNfxSV3T0C8tn5qZiTgcoNIDoVXL8Ed+XDwkI9xN5asN3Jmup7f9x
         iF2NPAO1yS1p9ywqN1fSG1pUiOoe3tpcecuhmC+GGYINSRUo2BOy1vQ9tzrMwT5Q/Zfh
         4pdHcs3gJywA6Hk/7EW+06JKCJQaSR9+uIgfGwLlCPutdXQihpMobPySGmzMTumrrkDK
         9dfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758791088; x=1759395888;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=52cJq27fTrRB0shrC+OriI/jG8WLskY0nr0nR3oM2xU=;
        b=GRCmBrmNlQ8Tus3XeLEs2+ND+kIf0nB3llYB+ikP5ymVlZ0IsI0PVouw9jMeTtzpZL
         MSiMOjOS+aqMY3GB+/5TIZ8fRoEwguay3216Wl/H3azxPPluFb4FZBca2o1ljROOz2gf
         ytYBllvRWti6Egz6u6+8J04AfGt1ecfMoy5EPbU/t4NBrCBjhrCYtICtopNSKuey0H5q
         CbE9DUAJaLEZPyA77ULHz55DRrf/41bF6yEP7GINILpYCiyYHukX37NFQy1PDIVBdoWL
         QBnCWlv3qzIuqjD75C5UUozu4yCEtS1k6HyMWosV7LMBhVPdOEwGJ9/bOcSblSJ1UFgL
         0rnA==
X-Gm-Message-State: AOJu0Yy9tyTk5OkmWI4EjBtAHk6Naz5U6x7bRKFcbA0BRNBed/EQBZ0h
	4Awhqrd7OrIEBvUeYfmJLa8Exf0Z4yz+eyiq0Jj2PiRHeDcrnC89PysK1tawyGT88Fs=
X-Gm-Gg: ASbGncuZUGOYx+fxHkGb3ACN+6ucIEFKPjjp8gjiOkLsuxaH/F21k23f+g8AUMGibK+
	PmuHkDNsYGnazpoaIXL++lRAO+/kHCv3g++TMkUZ2s3zt6jneHZg24QyZtnK1SdNCv9GUVCBbJO
	gtpQd8lD+10Nshbw2OEcHZmr4oyV0Vb72g6yXQ21ekf8nTZxd61arc4uAuhkWLzScZgb7fAQH5p
	YQ5wzKimnVU74zP0t16xe6l1aSBe/wtzdODW+J34Grf3d0yoIiu67JiuFh5NG2jK6Jbw5lsgLY7
	8ejTtgeI0pDzXPv6pu4//064gGMaiYLbXmANNLTfwW0YgFHQb4guYzzW93f2pZoiOfodOzqfwuJ
	iaG5TqUrORylwXAdXySliTydHP5jodDreSnXsuekt7UYwe9hnPceC2UrF6LjCRR+tM+nNVqmyI+
	D1ATNu7lTYdbKek4Qto9Iw
X-Google-Smtp-Source: AGHT+IErNyAgA6Qo/uMNdIgcGBbOskM97JAo4kEppskCvZUmBIRp8NL7i5asdGJupVwWIHvszpenhQ==
X-Received: by 2002:a05:600c:a43:b0:45b:7b54:881 with SMTP id 5b1f17b1804b1-46e329a0e5dmr26627875e9.1.1758791088108;
        Thu, 25 Sep 2025 02:04:48 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a9ac5basm80767955e9.7.2025.09.25.02.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:04:47 -0700 (PDT)
Message-ID: <19c66c0e-e784-4403-abae-c4cd92f4a150@linaro.org>
Date: Thu, 25 Sep 2025 10:04:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] dt-bindings: clock: qcom: document the Kaanapali GPU
 Clock Controller
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-5-d7ea96b4784a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-mmclk-v1-5-d7ea96b4784a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2025 00:56, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add bindings documentation for the Kaanapali Graphics Clock and Graphics
> power domain Controller.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>   .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    | 63 ++++++++++++++++++++++
>   .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
>   include/dt-bindings/clock/qcom,kaanapali-gpucc.h   | 47 ++++++++++++++++
>   .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    | 12 +++++
>   4 files changed, 124 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
> new file mode 100644
> index 000000000000..31398aec839d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,kaanapali-gxclkctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Graphics power domain Controller on Kaanapali
> +
> +maintainers:
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
> +
> +description: |
> +  Qualcomm graphics power domain control module provides the power
> +  domains on Qualcomm SoCs. This module exposes the GDSC power domain
> +  which helps the recovery of Graphics subsystem.
> +
> +  See also::
> +    include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,kaanapali-gxclkctl
> +
> +  power-domains:
> +    description:
> +      Power domains required for the clock controller to operate
> +    items:
> +      - description: GFX power domain
> +      - description: GMXC power domain
> +      - description: GPUCC(CX) power domain
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - '#power-domain-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clock-controller@3d68024 {
> +            compatible = "qcom,kaanapali-gxclkctl";
> +            reg = <0 0x3d68024 0x0 0x8>;
> +            power-domains = <&rpmhpd RPMHPD_GFX>,
> +                            <&rpmhpd RPMHPD_GMXC>,
> +                            <&gpucc 0>;
> +            #power-domain-cells = <1>;
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> index 44380f6f8136..6feaa32569f9 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> @@ -14,6 +14,7 @@ description: |
>     domains on Qualcomm SoCs.
>   
>     See also::
> +    include/dt-bindings/clock/qcom,kaanapali-gpucc.h
>       include/dt-bindings/clock/qcom,milos-gpucc.h
>       include/dt-bindings/clock/qcom,sar2130p-gpucc.h
>       include/dt-bindings/clock/qcom,sm4450-gpucc.h
> @@ -26,6 +27,7 @@ description: |
>   properties:
>     compatible:
>       enum:
> +      - qcom,kaanapali-gpucc
>         - qcom,milos-gpucc
>         - qcom,sar2130p-gpucc
>         - qcom,sm4450-gpucc
> diff --git a/include/dt-bindings/clock/qcom,kaanapali-gpucc.h b/include/dt-bindings/clock/qcom,kaanapali-gpucc.h
> new file mode 100644
> index 000000000000..e8dc2009c71b
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,kaanapali-gpucc.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_KAANAPALI_H
> +#define _DT_BINDINGS_CLK_QCOM_GPU_CC_KAANAPALI_H
> +
> +/* GPU_CC clocks */
> +#define GPU_CC_AHB_CLK						0
> +#define GPU_CC_CB_CLK						1
> +#define GPU_CC_CX_ACCU_SHIFT_CLK				2
> +#define GPU_CC_CX_GMU_CLK					3
> +#define GPU_CC_CXO_AON_CLK					4
> +#define GPU_CC_CXO_CLK						5
> +#define GPU_CC_DEMET_CLK					6
> +#define GPU_CC_DPM_CLK						7
> +#define GPU_CC_FF_CLK_SRC					8
> +#define GPU_CC_FREQ_MEASURE_CLK					9
> +#define GPU_CC_GMU_CLK_SRC					10
> +#define GPU_CC_GPU_SMMU_VOTE_CLK				11
> +#define GPU_CC_GX_ACCU_SHIFT_CLK				12
> +#define GPU_CC_GX_GMU_CLK					13
> +#define GPU_CC_HUB_AON_CLK					14
> +#define GPU_CC_HUB_CLK_SRC					15
> +#define GPU_CC_HUB_CX_INT_CLK					16
> +#define GPU_CC_HUB_DIV_CLK_SRC					17
> +#define GPU_CC_MEMNOC_GFX_CLK					18
> +#define GPU_CC_PLL0						19
> +#define GPU_CC_PLL0_OUT_EVEN					20
> +#define GPU_CC_RSCC_HUB_AON_CLK					21
> +#define GPU_CC_RSCC_XO_AON_CLK					22
> +#define GPU_CC_SLEEP_CLK					23
> +
> +/* GPU_CC power domains */
> +#define GPU_CC_CX_GDSC						0
> +
> +/* GPU_CC resets */
> +#define GPU_CC_CB_BCR						0
> +#define GPU_CC_CX_BCR						1
> +#define GPU_CC_FAST_HUB_BCR					2
> +#define GPU_CC_FF_BCR						3
> +#define GPU_CC_GMU_BCR						4
> +#define GPU_CC_GX_BCR						5
> +#define GPU_CC_XO_BCR						6
> +
> +#endif
> diff --git a/include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h b/include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
> new file mode 100644
> index 000000000000..460e21881c4f
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_GX_CLKCTL_KAANAPALI_H
> +#define _DT_BINDINGS_CLK_QCOM_GX_CLKCTL_KAANAPALI_H
> +
> +/* GX_CLKCTL power domains */
> +#define GX_CLKCTL_GX_GDSC				0
> +
> +#endif
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

