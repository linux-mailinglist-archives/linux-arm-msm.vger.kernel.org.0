Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07F2C671EE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 15:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbjAROIS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 09:08:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjAROIC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 09:08:02 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0558BA8387
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:44:13 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id vm8so83298054ejc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Dh0QLLZzta5LKG1zmma3eIkQGyszm+yGfi2ZxnY8pA=;
        b=TwCNCRUBe+6um3oYvtnga0duZE0bo0MKFCPyFy2a269oi7MNc0D4Ln0nQsc01r1dFF
         W7sNPKNQpT93Mx2YcaUeCWEfu/hLBXNc9n/4A5PsDeNpHH+iMvfc3tkowpA1A25yxVHv
         cADATgM2Hf5AS9ZzYEjvQw+bmIL4zi3+pl8K95KBPmgR/lOZ9GnRF+4nWuT7RftBqrp6
         NobVwEwYqMmmw9FT80MU7GVuNx4F0ZeSQyajJpn0J31PLt7ELmmHD9HiPIIEtrLJL/AX
         nYFcUlEj6QUyZ/J9WIibHWOR4cv/CQ4rfjK4RYtRxumD/WlEYNXwmfHyk2V1nZBZ+MDS
         Y4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Dh0QLLZzta5LKG1zmma3eIkQGyszm+yGfi2ZxnY8pA=;
        b=FImdPOaerKlL6yexH2LjpxQWLH4IahUJb+ISu/RjyHjTzUMTgsGHWqvEIuHQwisBJp
         ti1nBbJ8JFglc2KgA+3hah2oacFG9Zhk+h+Fti9bVABpybZiPGm6aBMN08FNXRghefXj
         QPo6nypjT3GOaye30sIJREoA04k1lKg0Nf/ULlTsGKHRaqI9nZjCPJX556YrRetaArcc
         25obiCIrX7/tHRssXUO9a7FL1lJfr2crWUtDvk7Z8FgnUHlXLori8MmhBLgvcUAthHDk
         jYcTtrblXXdmASLOSOujL/2D8RaR1z7f8Hhfq7Cs/PZ68/wOYql1U9XSrSZANi3M1/1o
         L+sg==
X-Gm-Message-State: AFqh2koPNhPGtFPew6Y9eEI5lVLmjt3QM1UKYn7qNk43Bb03/RLhmmBA
        em/uVzIR+YjYUmoGoQMjf4aYYQ==
X-Google-Smtp-Source: AMrXdXsbkgf2ylb56IUty71Eu7bxQxGqm5DhzImRcE3FZmcy5YZL4PQNGjPS7eTdbK3G7hvaLZ/nWA==
X-Received: by 2002:a17:906:8154:b0:866:d17a:e50 with SMTP id z20-20020a170906815400b00866d17a0e50mr6825572ejw.70.1674049451589;
        Wed, 18 Jan 2023 05:44:11 -0800 (PST)
Received: from [192.168.1.101] (abxh252.neoplus.adsl.tpnet.pl. [83.9.1.252])
        by smtp.gmail.com with ESMTPSA id k2-20020a170906970200b0073dbaeb50f6sm14507622ejx.169.2023.01.18.05.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 05:44:10 -0800 (PST)
Message-ID: <2382c5f5-f57d-1fc6-497c-b355aed08036@linaro.org>
Date:   Wed, 18 Jan 2023 14:44:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: msm8996: add CBF device entry
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
 <20230117225824.1552604-7-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230117225824.1552604-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.01.2023 23:58, Dmitry Baryshkov wrote:
> Add device tree node for the CBF clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 150d13c0f4b8..7d8e31b84959 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -3562,6 +3562,13 @@ saw3: syscon@9a10000 {
>  			reg = <0x09a10000 0x1000>;
>  		};
>  
> +		cbf: clock-controller@9a11000 {
> +			compatible = "qcom,msm8996-cbf";
> +			reg = <0x09a11000 0x10000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&apcs_glb>;
This should be RPM_SMD_XO_A_CLK_SRC, downstream consumes cxo_ao.

Konrad
> +			#clock-cells = <0>;
> +		};
> +
>  		intc: interrupt-controller@9bc0000 {
>  			compatible = "qcom,msm8996-gic-v3", "arm,gic-v3";
>  			#interrupt-cells = <3>;
