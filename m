Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 466D47592CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jul 2023 12:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbjGSKYK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jul 2023 06:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbjGSKYF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jul 2023 06:24:05 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DEA22122
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 03:23:25 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-992dcae74e0so917804266b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 03:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689762163; x=1692354163;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WVG+sWyWa26PpY7QDaTDZQQjSl8d6kObGB5OaB4QKLo=;
        b=Sp4pTm66vZNhjyIIvHIpbVQ1WCbbArVxfwky/TS1tfEMZV9qwy3LtPIyZphTKOYnL7
         4T3wZerjQpcdv93KYKcoZVO3FqyvH8BppxDuIZmK3FEJSOL+1E4hYotA/AcgOrQaL1nI
         WQeb5zS+BB068Uhw9Z7RJIwSQQTxmSgHnxUbPNwS1OOLFWrioG+hUCLmhKXJUVAGyz3q
         /PzErk+0D7pdK2vSWPLrp1xYrgsmPkzme2Gf3GPKSyn9jf2ek6cWw3MT3bxOzbqJvjGH
         nnk62781AM+OIKxL6C2L4ZV0Pbp0/kInYBAPGQmImjGL6Bol0WYgxluU978cWpwIRMXk
         L1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689762163; x=1692354163;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WVG+sWyWa26PpY7QDaTDZQQjSl8d6kObGB5OaB4QKLo=;
        b=fvnIWR8SKTPSiMu8JebasyRWTcfd7TAy3JYGgr8enmvATsic52BKkNcGTX+hkoLo8Y
         b5iLVesmmko561udXfqqPxPvC8w+ayzZH/DCX1YLmk6gbA2is7FMUPgbSFXDXYKzAkdj
         GRZlCe2kPU1IcYt5DQYF7HJxL2HHQ9pc+DvCq1D5+q9s3cGfEd92upi1zTNdh16rzEmF
         a1HQFKPO4HRO1Xycneqy+bXqbCG6cZn+KUOmquTV8Hom+Cjhpdvzl8jJUIg58VRRdn4R
         e7yOpD14paMEBJznn7AaZFb3xALHBMIekU8LvfeGw7FrVp+z3dq5off0vWHRY9IimVHf
         Uihw==
X-Gm-Message-State: ABy/qLbUCB4oJhmFxrJgCtE8n14GyBqZMiI5nK0ihi2PQUmlW6bHtB5Q
        vxjyF6G5OsYzncTjX4lQWB7eqQ==
X-Google-Smtp-Source: APBJJlEDETedxrZ0tiMJtiYi6A4OOgCGZ/qfL+SNNytXm5x1VU5So9zSJiKSKrqxbRiFVyJ2HWFT/w==
X-Received: by 2002:a17:907:dac:b0:991:bf04:204f with SMTP id go44-20020a1709070dac00b00991bf04204fmr2669337ejc.60.1689762163288;
        Wed, 19 Jul 2023 03:22:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id kj6-20020a170907764600b00992025654c4sm2103921ejc.182.2023.07.19.03.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 03:22:42 -0700 (PDT)
Message-ID: <18520c7a-2e12-cc29-3071-b5d98a20a42b@linaro.org>
Date:   Wed, 19 Jul 2023 12:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/5] arm64: dts: qcom: Add base SM4450 DTSI
Content-Language: en-US
To:     Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     quic_tsoni@quicinc.com, quic_shashim@quicinc.com,
        quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230719100135.21325-1-quic_tengfan@quicinc.com>
 <20230719100135.21325-2-quic_tengfan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719100135.21325-2-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/07/2023 12:01, Tengfei Fan wrote:
> This add based DTSI for SM4450 SoC and includes base description of
> CPUs and interrupt-controller which helps to boot to shell with
> console on boards with this SoC.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>

Thank you for your patch. There is something to discuss/improve.


> ---
>  arch/arm64/boot/dts/qcom/sm4450.dtsi | 435 +++++++++++++++++++++++++++
>  1 file changed, 435 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm4450.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
> new file mode 100644
> index 000000000000..ab14aecbdcea
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
> @@ -0,0 +1,435 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	interrupt-parent = <&intc>;
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	chosen { };
> +
> +	clocks{
> +		xo_board: xo_board {

Please start your work from scratch from mainline SoC, so we won't have
to point you all these obvious issues which we fixed long time ago. Just
pick the most recent SoC, like SM8550.


> +			compatible = "fixed-clock";
> +			clock-frequency = <76800000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep_clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			#clock-cells = <0>;
> +		};
> +	};

...

> +		};
> +	};
> +
> +	firmware {
> +		scm: scm {
> +			compatible = "qcom,scm-sm4450", "qcom,scm";

Undocumented compatible. If you plan to document it further, then please
check if your patches are correctly ordered. Bindings are always before
their users.

> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	memory@a0000000 {
> +		device_type = "memory";
> +		/* We expect the bootloader to fill in the size */
> +		reg = <0x0 0xa0000000 0x0 0x0>;
> +	};
> +
> +	pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +
> +		CPU_PD0: power-domain-cpu0 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&CLUSTER_PD>;
> +			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> +		};
> +
> +		CPU_PD1: power-domain-cpu1 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&CLUSTER_PD>;
> +			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> +		};
> +
> +		CPU_PD2: power-domain-cpu2 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&CLUSTER_PD>;
> +			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> +		};
> +
> +		CPU_PD3: power-domain-cpu3 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&CLUSTER_PD>;
> +			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
> +		};
> +
> +		CPU_PD4: power-domain-cpu4 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&CLUSTER_PD>;
> +			domain-idle-states = <&BIG_CPU_SLEEP_0>;
> +		};
> +
> +		CPU_PD5: power-domain-cpu5 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&CLUSTER_PD>;
> +			domain-idle-states = <&BIG_CPU_SLEEP_0>;
> +		};
> +
> +		CPU_PD6: power-domain-cpu6 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&CLUSTER_PD>;
> +			domain-idle-states = <&BIG_CPU_SLEEP_0>;
> +		};
> +
> +		CPU_PD7: power-domain-cpu7 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&CLUSTER_PD>;
> +			domain-idle-states = <&BIG_CPU_SLEEP_0>;
> +		};
> +
> +		CLUSTER_PD: power-domain-cpu-cluster0 {
> +			#power-domain-cells = <0>;
> +			domain-idle-states = <&CLUSTER_SLEEP_0>, <&CLUSTER_SLEEP_1>;
> +		};
> +	};
> +
> +	soc: soc@0 {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0 0 0 0 0x10 0>;
> +		dma-ranges = <0 0 0 0 0x10 0>;
> +		compatible = "simple-bus";
> +
> +		tcsr_mutex: hwlock@1f40000 {
> +			compatible = "qcom,tcsr-mutex";
> +			reg = <0x0 0x01f40000 0x0 0x40000>;
> +			#hwlock-cells = <1>;
> +		};
> +
> +		pdc: interrupt-controller@b220000 {
> +			compatible = "qcom,sm4450-pdc", "qcom,pdc";
> +			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
> +			qcom,pdc-ranges = <0 480 94>, <94 494 31>, <125 63 1>;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&intc>;
> +			interrupt-controller;
> +		};
> +
> +		intc: interrupt-controller@17200000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			#redistributor-regions = <1>;
> +			redistributor-stride = <0x0 0x20000>;
> +			reg = <0x0 0x17200000 0x0 0x10000>,     /* GICD */
> +				<0x0 0x17260000 0x0 0x100000>;    /* GICR * 8 */

reg is always after compatible. Then ranges follow.

Also, indentation looks not aligned here.

> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> +		};
> +
> +		timer@17420000 {
> +			compatible = "arm,armv7-timer-mem";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0 0 0x20000000>;
> +			reg = <0x0 0x17420000 0x0 0x1000>;

Same problem... some weird ordering.

> +			clock-frequency = <19200000>;

Are you sure this property is allowed in new designs?

> +
> +			frame@17421000 {
> +				frame-number = <0>;
> +				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +						<GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x17421000 0x1000>,
> +					<0x17422000 0x1000>;
> +			};
> +
> +			frame@17423000 {
> +				frame-number = <1>;
> +				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x17423000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17425000 {
> +				frame-number = <2>;
> +				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x17425000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17427000 {
> +				frame-number = <3>;
> +				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x17427000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17429000 {
> +				frame-number = <4>;
> +				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x17429000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@1742b000 {
> +				frame-number = <5>;
> +				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x1742b000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@1742d000 {
> +				frame-number = <6>;
> +				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x1742d000 0x1000>;
> +				status = "disabled";
> +			};
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +				<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +				<GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +				<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +		clock-frequency = <19200000>;

Are you sure this property is allowed in new designs?

> +	};
> +};

Best regards,
Krzysztof

