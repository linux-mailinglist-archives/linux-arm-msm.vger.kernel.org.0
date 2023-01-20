Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6FD4675318
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 12:11:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjATLLY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 06:11:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbjATLLX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 06:11:23 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B26B4E24
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 03:11:20 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id u19so13011011ejm.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 03:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Msf3aZq6hsZzyl53GrxRyzFCabRQpwAsoNSPIY0ffo=;
        b=qGHbZYTV6JqSbvwuQHTDUqQnde2DemrsWo0WpRHiuQ2Gip87qLSEAFA4F1kOEI2Xv2
         5I9tUUTJKkasbSmRvKqK1oQLo2SDYluFAzsH6HE0LCaC90emq2eOoLkXJYcCKPAkuBT4
         wOLp/ZQ1+7ErEKKcOfjR5JX0bWyMAbf/zYHooagrM9C6FBTTiKzXjrrI6gTgzumv0t9/
         3syGIv9ohelZH6TLQeOvI8v+sUuUuZPawQ3HljeqkvI5LQFmpbH70xjONOYnTi2bLYOP
         nnuB2d4kkqGpfT2b7CffB/f2lt6HXzOZtnnDtMm1iJ4xJm69tqF4wYFcr9m4uxingX/h
         OmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Msf3aZq6hsZzyl53GrxRyzFCabRQpwAsoNSPIY0ffo=;
        b=LRYk/E57GEVhxr/fmyp4BU6piN6RwszYwQkUHOkwjTMyGU9qZO0g/V7hMnXTbUILkj
         wmVIzwPg7GDNU+LPZh2KYMM0MHAcHQBnGwSIPmZY9EVSODe4uud9X/dXW2Yh9v2R6V5E
         lPbNdqAPpVcGkQX2/6onu3VgDI84INZqfN8LtpKZa8dUFsxN8+5LrA1tAqkhfDF5sTTp
         alaBNcCFgIrZdOqtgnkglz/kY6EWb3OEDSHG88JpbqUBn7kG+niFkUhKxcOmHx6WKdHL
         IhZsdpjiDi3wRyk6eTdjwZkWLzi18mVYYJX5fd4MtiAEpCDork9qW4WWSqMJsD3C0Rwj
         hb4Q==
X-Gm-Message-State: AFqh2koRFDMb23R1mmNe1/P0gaJbomTURLKdbBNshKDn/1ycdvXODm4/
        ZOTaILAkmWSdjgyFDWQ4UL4zog==
X-Google-Smtp-Source: AMrXdXt484yon872oQDybevj4rhqDNlz28tLFpbkmSoAA3gVVnQKBpMLCjY4rD/s1xUloduOPL+Ulw==
X-Received: by 2002:a17:906:1f57:b0:872:2cc4:6886 with SMTP id d23-20020a1709061f5700b008722cc46886mr10108266ejk.30.1674213079006;
        Fri, 20 Jan 2023 03:11:19 -0800 (PST)
Received: from [192.168.1.101] (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906b08b00b0084c62b7b7d8sm17801434ejy.187.2023.01.20.03.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 03:11:18 -0800 (PST)
Message-ID: <7160ac5e-fe51-17b4-4bea-f0d2ee66b116@linaro.org>
Date:   Fri, 20 Jan 2023 12:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] ARM: dts: qcom: align OPP table names with DT schema
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230120072113.138656-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230120072113.138656-1-krzysztof.kozlowski@linaro.org>
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



On 20.01.2023 08:21, Krzysztof Kozlowski wrote:
> DT schema expects names of operating points tables to match certain
> pattern:
> 
>   qcom-ipq4018-ap120c-ac.dtb: opp_table0: $nodename:0: 'opp_table0' does not match '^opp-table(-[a-z0-9]+)?$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-ipq4019.dtsi | 2 +-
>  arch/arm/boot/dts/qcom-sdx55.dtsi   | 2 +-
>  arch/arm/boot/dts/qcom-sdx65.dtsi   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> index a73c3a17b6a4..02e9ea78405d 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> @@ -106,7 +106,7 @@ L2: l2-cache {
>  		};
>  	};
>  
> -	cpu0_opp_table: opp_table0 {
> +	cpu0_opp_table: opp-table {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
> index 5408ff715fbf..c64088c12c89 100644
> --- a/arch/arm/boot/dts/qcom-sdx55.dtsi
> +++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
> @@ -62,7 +62,7 @@ cpu0: cpu@0 {
>  		};
>  	};
>  
> -	cpu_opp_table: cpu-opp-table {
> +	cpu_opp_table: opp-table-cpu {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> diff --git a/arch/arm/boot/dts/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom-sdx65.dtsi
> index d3c661d7650d..aa6439d8763a 100644
> --- a/arch/arm/boot/dts/qcom-sdx65.dtsi
> +++ b/arch/arm/boot/dts/qcom-sdx65.dtsi
> @@ -61,7 +61,7 @@ cpu0: cpu@0 {
>  		};
>  	};
>  
> -	cpu_opp_table: cpu-opp-table {
> +	cpu_opp_table: opp-table-cpu {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
