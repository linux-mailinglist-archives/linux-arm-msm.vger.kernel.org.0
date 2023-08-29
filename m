Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AAED78C215
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 12:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235031AbjH2KNW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 06:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235115AbjH2KMv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 06:12:51 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86218103
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 03:12:47 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99c353a395cso541126466b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 03:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693303966; x=1693908766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8BHRqjRUHWh/q8q/oAtUtXBDpUw22yD75gwk1BrkR2g=;
        b=sMKG1r4INABe5BOHSCnaNYoII26XmYsAeFpSU1YVJgAnAaGFWUbi8mItCbppuT+nFa
         wDEmXOWCZzoHRi35wGyQmj1+nQC5fPVx5Lgk0FHZ+0D6k2Zso68fZEIrVcb1tYQK4cJ8
         jCPjiuKvkJkB+V46/cflo0vfC1Nh9lgxVzMZoSd4/mG62vf7skzmaQ4/ScEMwVMPihQ7
         eGjP8kpezTuY+d36uOzo4QcrsA8tUIRTk/6Ruy6nevErIE6PCRJLMMt5GyVU3wf9AA1B
         ELZ7ARs9a27HI7kGD4vANGR65pI6TUWF0pjYqXJEHtWrG217hPtmXFAXtRtNuwAxHNSf
         K0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693303966; x=1693908766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8BHRqjRUHWh/q8q/oAtUtXBDpUw22yD75gwk1BrkR2g=;
        b=NRPdGu9R0aVKKhLziUysr0qeBcQtkagi/LbrhAc3JOD/Q92Y2PLY8m5z+KViOYaja1
         ceXZJDMKZjT3PyGhviPpj0lw/7w6bO8VyysCx5oNkh3ZN2V00625ST3bsCfUDYkwGJoP
         gtLL1xRS1/3mQRQfykW7IjW5iQb+oo0E69oNTX4/LpCXrrSnIosBP+W0gQT48A5h9U6N
         anNFCvVg50IZgtzS/R8joj0mGuwU4TmLb69V8RMDd1k8jd8HdSDWnLW2AkAOIMm1a7wq
         XVY6e/pkm2io1lBmEKPvRTzQ9Ez+tmPbx6iEcAff1wiV+sIGJNXeI+YPe7TOpPigCh3G
         qCEQ==
X-Gm-Message-State: AOJu0YxH6tvJXvpt9pGYNXRZgakPYJncW8RVahJltY/n95v6hzoZVY7A
        BfKhikh5d9w34Hv+QDTX5o4LmQ==
X-Google-Smtp-Source: AGHT+IEVZG0wjv1izZ+thJ+jA0Y3aGWG+XxKPR547yYfZOSc84pSU324P8PndHrm4MicZOwPv6k+9g==
X-Received: by 2002:a17:907:78c4:b0:9a5:ceab:f499 with SMTP id kv4-20020a17090778c400b009a5ceabf499mr865367ejc.19.1693303966021;
        Tue, 29 Aug 2023 03:12:46 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id f17-20020a17090624d100b0099cb0a7098dsm5864237ejb.19.2023.08.29.03.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 03:12:45 -0700 (PDT)
Message-ID: <f457ee94-81d0-bd28-1432-ba2828dabb79@linaro.org>
Date:   Tue, 29 Aug 2023 12:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/3] arm64: dts: qcom: ipq5018: enable the CPUFreq support
Content-Language: en-US
To:     Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20230829095423.760641-1-quic_gokulsri@quicinc.com>
 <20230829095423.760641-4-quic_gokulsri@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829095423.760641-4-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/08/2023 11:54, Gokul Sriram Palanisamy wrote:
> Add the APCS, A53 PLL, cpu-opp-table nodes to set
> the CPU frequency at optimal range.
> 
> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 34 +++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 9f13d2dcdfd5..05843517312c 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-ipq5018.h>
>  #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
> +#include <dt-bindings/clock/qcom,apss-ipq.h>

c is before r.

>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -36,6 +37,8 @@ CPU0: cpu@0 {
>  			reg = <0x0>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_0>;
> +			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
> +			operating-points-v2 = <&cpu_opp_table>;
>  		};
>  
>  		CPU1: cpu@1 {
> @@ -44,6 +47,8 @@ CPU1: cpu@1 {
>  			reg = <0x1>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_0>;
> +			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
> +			operating-points-v2 = <&cpu_opp_table>;
>  		};
>  
>  		L2_0: l2-cache {
> @@ -54,6 +59,17 @@ L2_0: l2-cache {
>  		};
>  	};
>  
> +	cpu_opp_table: opp-table-cpu {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-1008000000 {
> +			opp-hz = /bits/ 64 <1008000000>;
> +			opp-microvolt = <1100000>;
> +			clock-latency-ns = <200000>;

And the rest of OPPs?

> +		};
> +	};
> +
>  	firmware {
>  		scm {
>  			compatible = "qcom,scm-ipq5018", "qcom,scm";
> @@ -181,6 +197,24 @@ v2m1: v2m@1000 {
>  			};
>  		};
>  
> +		a53pll: clock@b116000 {
> +			compatible = "qcom,ipq5018-a53pll";
> +			reg = <0x0b116000 0x40>;
> +			#clock-cells = <0>;
> +			clocks = <&xo_board_clk>;
> +			clock-names = "xo";
> +		};
> +
> +		apcs_glb: mailbox@b111000 {

0xb111000 looks lower than 0x116000.

> +			compatible = "qcom,ipq5018-apcs-apps-global",
> +				     "qcom,ipq6018-apcs-apps-global";
> +			reg = <0x0b111000 0x1000>;

Best regards,
Krzysztof

