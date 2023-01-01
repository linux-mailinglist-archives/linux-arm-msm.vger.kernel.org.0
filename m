Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7C2665AA76
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jan 2023 16:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbjAAPtK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Jan 2023 10:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbjAAPtJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Jan 2023 10:49:09 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F71B56
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jan 2023 07:49:07 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bp15so38398072lfb.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jan 2023 07:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gb6XglI1fED0fL7pjVB3dDglcOozlQzsZ5vAYulGpKU=;
        b=xSnFTJp57tAHeSA3XQAXatgzTSJRFKFpUXXcB6PsSFYj1XRN1Qq8FXzEolByoHhajK
         59H2Yy7YNBKzkHbw2aXlE2XVpnN4ygjn/vQm4qe1nnH1USl3iSK/PyGyElk0pSLnj/06
         kqkdi6Wqewhy19j1fUpg0MzdCNduD/e9dqY3+LnjZ3zRM085JEdDcU2sxgvdVTt4szi+
         vUbnzCL0cUQCCZKuQLeHT+hMvJrzBwRZhxfnAceQU46UjdTa8L9WraWojz6BvlhnBqkI
         cE1wexVGS92IW0EJdQAbFRyyEu3Fu2e1yxWQOdAD9yR35vPWR0tplPWxePA5IVYWpvpt
         G2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gb6XglI1fED0fL7pjVB3dDglcOozlQzsZ5vAYulGpKU=;
        b=Bkp19Db2JwznxOZkT59Ao+x2DHziazENTr7nPjYF+4SgJEltfn2CAtuPePMtY4ihbw
         9VBvMiToHXMwWYC0Q2vC7p8Cvb/TToWKIyeCkLn6gSJrXJ/TfXyjNbV0k7mOCx+C0g4n
         grUf6HLGrigXkkdyGjP7sV0iMsNnHHnCSP6d2OOg4Eh0+U9zPVByRyrVeE3rE7yba5ji
         rWjPHrdR3zCN3f1mC/a+8RUJ5LdagbDVf/zg9MrVwHY3/zONWHsYMZTEFPSVq2c+soWh
         wskjdEMpqysS55aHcdjH845zZ/arbDTH1uHB1Abbj2HjCd1o6tNeSTdyXOlZADEa+MK1
         hNkA==
X-Gm-Message-State: AFqh2krUzUY69S1jfRSo82yNVikMLF/xxfqcXpEvIEFYB870PZNmRVPs
        ahVjsl1a22/C8kwK/bBFKxYWsDB3Xil4q+/u
X-Google-Smtp-Source: AMrXdXvTEpmjOAE8ruMv7Z4jW+vI7unK1ZXvCqAwJt+Oko1tewzBJufCT4Aw0PSo4TWz1dRdphWTRA==
X-Received: by 2002:a05:6512:2528:b0:4b6:f22c:7dc9 with SMTP id be40-20020a056512252800b004b6f22c7dc9mr10666239lfb.57.1672588145653;
        Sun, 01 Jan 2023 07:49:05 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z5-20020ac24f85000000b004b5480edf67sm4176567lfs.36.2023.01.01.07.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jan 2023 07:49:05 -0800 (PST)
Message-ID: <ec43c40d-66fc-b4e3-273c-c21e1418ddab@linaro.org>
Date:   Sun, 1 Jan 2023 16:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v8 02/10] arm64: dts: qcom: Add base SM8550 dtsi
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
References: <20221230202230.2493494-1-abel.vesa@linaro.org>
 <20221230202230.2493494-3-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221230202230.2493494-3-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/12/2022 21:22, Abel Vesa wrote:
> Add base dtsi for SM8550 SoC and includes base description of
> CPUs, GCC, RPMHCC, UART, interrupt controller, TLMM, reserved
> memory, RPMh PD, TCSRCC, ITS, IPCC, AOSS QMP, LLCC, cpufreq,
> interconnect, thermal sensor, cpu cooling maps and SMMU nodes
> which helps boot to shell with console on boards with this SoC.
> 
> Co-developed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 3519 ++++++++++++++++++++++++++
>  1 file changed, 3519 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8550.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> new file mode 100644
> index 000000000000..a9514fcd6109
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -0,0 +1,3519 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2022, Linaro Limited
> + */
> +
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm8550-gcc.h>
> +#include <dt-bindings/clock/qcom,sm8550-tcsr.h>
> +#include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interconnect/qcom,sm8550-rpmh.h>
> +#include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/thermal/thermal.h>
> +
> +/ {
> +	interrupt-parent = <&intc>;
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	chosen { };
> +
> +	clocks {
> +		xo_board: xo-board {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		CPU0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo";
> +			reg = <0 0>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_0>;
> +			power-domains = <&CPU_PD0>;
> +			power-domain-names = "psci";
> +			qcom,freq-domain = <&cpufreq_hw 0>;
> +			capacity-dmips-mhz = <1024>;
> +			dynamic-power-coefficient = <100>;
> +			#cooling-cells = <2>;
> +			L2_0: l2-cache {
> +			      compatible = "cache";

You miss cache-level properties in all cache nodes.

> +			      next-level-cache = <&L3_0>;
> +				L3_0: l3-cache {

Messed indentation,

> +					compatible = "cache";
> +				};
> +			};
> +		};
> +


Best regards,
Krzysztof

