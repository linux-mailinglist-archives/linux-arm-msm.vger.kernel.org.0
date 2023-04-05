Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E60C46D8276
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 17:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239086AbjDEPsJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 11:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239076AbjDEPsE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 11:48:04 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81A85FE1
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 08:47:42 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id z42so37715711ljq.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 08:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680709652;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=teOccrm2PQgYq8QnTmz+eRFW97mM0aIsbw7UQ2Tfsrg=;
        b=AvwwU6K+f/BqP7dTEd6k00OCbTMgmklmpUWVFJG0/N5HQwHt65kpliYGlUaUSByx0e
         H7nKN0UZWK5d9DJmWDS6XfL5uEQk3fQ9ulyZKOlmjMapn2SrA0+XELU7gzs1rqvooYTL
         M8+zIJuqlqgxEd/KOAUSkh77fnFe5is/CFo5t0JhSzufiKWv355X6rM7iNKSVGZ1I+yY
         nECV88VdV9+X2l4NHS6N59d6LBDyVLWSB9iJn4J1NfhKwUC+1/e0HpdUWhuHCkYSqP/V
         Y6T1ce1e+1LxKx8FyOqG7wdzQPvuJpmu/GJc09uXMbdJjB2QVEFOfh/Q68D285+rEYl9
         xNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680709652;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=teOccrm2PQgYq8QnTmz+eRFW97mM0aIsbw7UQ2Tfsrg=;
        b=Sl7RRvIDRMr7icALiPDptK3s2B8f3pyIATjUc7CGUpVS8wUBnI0dk5FNdCkUAVFo7x
         MAg1JgIVPfcGJrM/hyNW/1zAaRb+EjjWvYw40Z5Yoo7xFohZhgdE4POQhL4LctA8CPkm
         QiDMZ1IzDHLFHWgSyPX5tY5yhfQ34NTWzsfIDJgaJOOWdeYh3S6d49CY5qBS1j+lh5l5
         fuF1VVJOuzgNUfl5zcWTr+2rM8X9GzYq29pVzQYQ1nOzdmzy2VN6NQ3O7p0uQ+DBlLT+
         BKg4hvXR3auFsyDWBmhNf7qBFHufNwNcto5kG5ZBmS5pcECx4WLbA7ea1Zne/VYSMf1U
         0iVA==
X-Gm-Message-State: AAQBX9ccIwvLVzJQDVhlVb3G1gtT50ByheOHztoYCBZD5I+gf+Qc86ye
        HWEO3RyFN9Qmk8TiavUR1NBUhA==
X-Google-Smtp-Source: AKy350Z5M3Jv3GGcIu3XJdxnZIkAjAQCiMZ6gEBAUxr0KzwYutHIISYMmbJr9557hIJFRR2DQ3zFaQ==
X-Received: by 2002:a2e:6a05:0:b0:29b:d471:c817 with SMTP id f5-20020a2e6a05000000b0029bd471c817mr1626652ljc.12.1680709651970;
        Wed, 05 Apr 2023 08:47:31 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id l22-20020a2e8356000000b0029352fc39fbsm2802323ljh.63.2023.04.05.08.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 08:47:31 -0700 (PDT)
Message-ID: <33d5daba-99fe-72db-0409-2099719a67ba@linaro.org>
Date:   Wed, 5 Apr 2023 17:47:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sm8450: label the Soundwire nodes
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230405060906.143058-1-krzysztof.kozlowski@linaro.org>
 <20230405060906.143058-2-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230405060906.143058-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5.04.2023 08:09, Krzysztof Kozlowski wrote:
> Use labels, instead of comments, for Soundwire controllers.  Naming them
> is useful, because they are specialized and have also naming in
> datasheet/programming guide.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index ce4b7d0a09ab..1dd000748f9e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2153,13 +2153,13 @@ wsa2macro: codec@31e0000 {
>  			#sound-dai-cells = <1>;
>  		};
>  
> -		/* WSA2 */
>  		swr4: soundwire-controller@31f0000 {
>  			compatible = "qcom,soundwire-v1.7.0";
>  			reg = <0 0x031f0000 0 0x2000>;
>  			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&wsa2macro>;
>  			clock-names = "iface";
> +			label = "WSA2";
>  
>  			qcom,din-ports = <2>;
>  			qcom,dout-ports = <6>;
> @@ -2268,13 +2268,13 @@ wsamacro: codec@3240000 {
>  			#sound-dai-cells = <1>;
>  		};
>  
> -		/* WSA */
>  		swr0: soundwire-controller@3250000 {
>  			compatible = "qcom,soundwire-v1.7.0";
>  			reg = <0 0x03250000 0 0x2000>;
>  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&wsamacro>;
>  			clock-names = "iface";
> +			label = "WSA";
>  
>  			qcom,din-ports = <2>;
>  			qcom,dout-ports = <6>;
