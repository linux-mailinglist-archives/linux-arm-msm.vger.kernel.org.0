Return-Path: <linux-arm-msm+bounces-64462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11316B00E03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 23:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A0DA563E4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 21:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F227028B4F8;
	Thu, 10 Jul 2025 21:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PUUT4Akx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09B922338;
	Thu, 10 Jul 2025 21:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752183801; cv=none; b=NIVJarGaABstffmyZT8esb/vn2+rUyVOUyFnvJjjRD4iLNO1u0KLP5CiMljwfxaTucLNBGO56DbBqRbskEvtY4YDB5eP/4WRqopx7B5KbZXVpn+PAkve1hveLq62huaRHROQU1NR5lNH7MPo/nO0B2dqtJualdLr5XrQAQlZrhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752183801; c=relaxed/simple;
	bh=JyiBXGkjI//nsHnGr36FD+TwOyb4q6nbGeOiX/MY7j4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3GLa3c2jpnKU8OiH8o60xv8Iq+1VGbGFvob/i8BcZv9eq434Wz+Nkz3zl3mi0VO6s0ONTz2a6cuzzosdnvvMPB+3K0X58x181Emn8KB5fWCu6DuEeM7lh2CRLrsUxl2lDCqZ7O12lFV57HYz6Umip6TtdNYoEqzLL5gNZkS0Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUUT4Akx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB50C4CEE3;
	Thu, 10 Jul 2025 21:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752183800;
	bh=JyiBXGkjI//nsHnGr36FD+TwOyb4q6nbGeOiX/MY7j4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUUT4AkxcRwna33gV6XOnJ3Rsuq2qYdbDV0JOhVDeNsXVoOLTYaLRYq3dAH45DJbe
	 N3a39wBVOiLn2WpAot7yAx/XaiyAdpFT6ejiRdjocplZ7g/Tm9Cx/tozweMfkcHM8m
	 ICrHjJHAgHHUCbFl0GuFMLUr2qwAoPaKGh4M/PaPcIPN5uK8+dhhEevnsE2tfw50lP
	 olpIcHGlj2QY/JZ4dWAdTTyuWsHaWonvoMRKptcWzgpp9tcthlXiL1OiwzsTAYCafp
	 qFM9+xqKgMeqn/L/TSxxoWh4fqqmYOfGy1ejmzC/rjq7FkLJby2uoAMWhG2zF4uDMQ
	 JSUKWNfQjWGbQ==
Date: Thu, 10 Jul 2025 16:43:19 -0500
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom: Add SM8750 GPU clocks
Message-ID: <20250710214319.GA4015161-robh@kernel.org>
References: <20250708-topic-8750_gpucc-v1-0-86c86a504d47@oss.qualcomm.com>
 <20250708-topic-8750_gpucc-v1-1-86c86a504d47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-topic-8750_gpucc-v1-1-86c86a504d47@oss.qualcomm.com>

On Tue, Jul 08, 2025 at 02:47:20PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The SM8750 features a "traditional" GPU_CC block, much of which is
> controlled through the GMU microcontroller. Additionally, there's
> an separate GX_CC block, where the GX GDSC is moved.
> 
> Add bindings to accommodate for that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |  5 ++
>  .../bindings/clock/qcom,sm8750-gxcc.yaml           | 58 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,sm8750-gpucc.h      | 53 ++++++++++++++++++++
>  3 files changed, 116 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> index 02968632fb3af34d6b3983a6a24aa742db1d59b1..d1b3557ab344b071d16dba4d5c6a267b7ab70573 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> @@ -20,6 +20,7 @@ description: |
>      include/dt-bindings/clock/qcom,sm8550-gpucc.h
>      include/dt-bindings/reset/qcom,sm8450-gpucc.h
>      include/dt-bindings/reset/qcom,sm8650-gpucc.h
> +    include/dt-bindings/reset/qcom,sm8750-gpucc.h
>      include/dt-bindings/reset/qcom,x1e80100-gpucc.h
>  
>  properties:
> @@ -31,6 +32,7 @@ properties:
>        - qcom,sm8475-gpucc
>        - qcom,sm8550-gpucc
>        - qcom,sm8650-gpucc
> +      - qcom,sm8750-gpucc
>        - qcom,x1e80100-gpucc
>        - qcom,x1p42100-gpucc
>  
> @@ -40,6 +42,9 @@ properties:
>        - description: GPLL0 main branch source
>        - description: GPLL0 div branch source
>  
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - clocks
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8750-gxcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8750-gxcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..f35839193d18b608e177b4d6561827dfa98c9aa1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8750-gxcc.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm8750-gxcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Graphics Clock & Reset Controller on SM8750
> +
> +maintainers:
> +  - Konrad Dybcio <konradybcio@kernel.org>
> +
> +description: |
> +  Qualcomm graphics clock control module provides the clocks, resets and power
> +  domains on Qualcomm SoCs.
> +
> +  See also::

Don't need double colon.

> +    include/dt-bindings/reset/qcom,sm8750-gpucc.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8750-gxcc
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 3

You need to define what each power domain is.

> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - power-domains
> +  - '#power-domain-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sm8750-gpucc.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clock-controller@3d64000 {
> +            compatible = "qcom,sm8750-gxcc";
> +            reg = <0x0 0x03d64000 0x0 0x6000>;
> +            power-domains = <&rpmhpd RPMHPD_GFX>,
> +                            <&rpmhpd RPMHPD_MXC>,
> +                            <&gpucc GPU_CC_CX_GDSC>;
> +            #power-domain-cells = <1>;
> +        };
> +    };
> +...
> diff --git a/include/dt-bindings/clock/qcom,sm8750-gpucc.h b/include/dt-bindings/clock/qcom,sm8750-gpucc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..98e2f5df78740bf298c6b1065972d7e58ee81713
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,sm8750-gpucc.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8750_H
> +#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8750_H
> +
> +/* GPU_CC clocks */
> +#define GPU_CC_AHB_CLK						0
> +#define GPU_CC_CB_CLK						1
> +#define GPU_CC_CX_ACCU_SHIFT_CLK				2
> +#define GPU_CC_CX_FF_CLK					3
> +#define GPU_CC_CX_GMU_CLK					4
> +#define GPU_CC_CXO_AON_CLK					5
> +#define GPU_CC_CXO_CLK						6
> +#define GPU_CC_DEMET_CLK					7
> +#define GPU_CC_DPM_CLK						8
> +#define GPU_CC_FF_CLK_SRC					9
> +#define GPU_CC_FREQ_MEASURE_CLK					10
> +#define GPU_CC_GMU_CLK_SRC					11
> +#define GPU_CC_GX_ACCU_SHIFT_CLK				12
> +#define GPU_CC_GX_ACD_AHB_FF_CLK				13
> +#define GPU_CC_GX_AHB_FF_CLK					14
> +#define GPU_CC_GX_GMU_CLK					15
> +#define GPU_CC_GX_RCG_AHB_FF_CLK				16
> +#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				17
> +#define GPU_CC_HUB_AON_CLK					18
> +#define GPU_CC_HUB_CLK_SRC					19
> +#define GPU_CC_HUB_CX_INT_CLK					20
> +#define GPU_CC_HUB_DIV_CLK_SRC					21
> +#define GPU_CC_MEMNOC_GFX_CLK					22
> +#define GPU_CC_PLL0						23
> +#define GPU_CC_PLL0_OUT_EVEN					24
> +#define GPU_CC_RSCC_HUB_AON_CLK					25
> +#define GPU_CC_RSCC_XO_AON_CLK					26
> +#define GPU_CC_SLEEP_CLK					27
> +
> +/* GPU_CC power domains */
> +#define GPU_CC_CX_GDSC						0
> +
> +/* GPU_CC resets */
> +#define GPU_CC_GPU_CC_CB_BCR					0
> +#define GPU_CC_GPU_CC_CX_BCR					1
> +#define GPU_CC_GPU_CC_FAST_HUB_BCR				2
> +#define GPU_CC_GPU_CC_FF_BCR					3
> +#define GPU_CC_GPU_CC_GMU_BCR					4
> +#define GPU_CC_GPU_CC_GX_BCR					5
> +#define GPU_CC_GPU_CC_XO_BCR					6
> +
> +/* GX_CC power domains */
> +#define GX_CC_GX_GDSC						0
> +
> +#endif
> 
> -- 
> 2.50.0
> 

