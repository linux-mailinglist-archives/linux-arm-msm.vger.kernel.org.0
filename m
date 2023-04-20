Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E20336E90FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 12:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235074AbjDTKve (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 06:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234713AbjDTKvO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 06:51:14 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4AE7170A
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:48:53 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id h4so2308903ljb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681987731; x=1684579731;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ZvynBxZTNHSwuOrwpbtbw0Z48iEiikNHML15c2GQxM=;
        b=NuJEJJ1iEjIK/7pdK4fUoPb3QCxTDFDyhgtPvTjf+4/xnKZb+vD5i1Gl7kL9YAUA8I
         JL8/ZgTit1XCGCbGRnn+4D94vgSl0pxVX84CjUEX/J+QCz2e0ZWnBqVsjT72lLth07bw
         ctruGrE/XFWJ2s9nKcPO7D/9rE+feeFauYxsmsOWtaIN5woabb8ipq427qkfdOOM9fSk
         2oklCWTTy6o1JFIrpofwTeeLsVHjSOkmZoshmFdukuNOLSbnK+2/MxspatQ8EobZeZuX
         rtDCCTOVpdQJG1tmQattVwqsFF8H0czIgxiUUwZ3S2iS6VrlMP7fDdu6PJj9wfcwnQKg
         rfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681987731; x=1684579731;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZvynBxZTNHSwuOrwpbtbw0Z48iEiikNHML15c2GQxM=;
        b=B1Vgyx4iOKk/3PAG7PjrxvvSi+G513KfiyhNADfKe9bMwRnfCX9TgY3lRfzfbZLfOP
         1NqP0zzvckibXMld42X8un9WZTkJkpA6kuOgcYzk4CAwcbDYpyHYrpd100gCUV+cxcFY
         afOL2OyFNxPGqBFwHXfEGJxsxKM1kC6nrcE8ocEFjIP7wW3Tvg8UmEJ9V9Fz0L5d0pG+
         s0nUSOQ87y28DjsKEWzNublXv5nbt1jSjgr7DfYmU98eJgB8fkC0XIdrdEJiRSajHuA8
         iolf5CQYtUjzlj+1/Rrw/AwElDCG57DWR3BwkUGxg8Eg0G3b519M+VkiUhGgBqEX6hDf
         lznw==
X-Gm-Message-State: AAQBX9faV7gMhd7rJ8hAf08qWKuR0X8svkiejxbH0C9Vi20YkqbOqMB4
        FZL+d5JgLz+gcrOQPMDEyyo9KQ==
X-Google-Smtp-Source: AKy350b/N4OKWyIJLYTw0GF7g5StsbD7nqFd2GOQy4IORtx2YMRbdTGSlkx99lr1xdGRphwYFW0ujA==
X-Received: by 2002:a2e:9b0c:0:b0:2a8:c75d:8167 with SMTP id u12-20020a2e9b0c000000b002a8c75d8167mr355672lji.4.1681987731244;
        Thu, 20 Apr 2023 03:48:51 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id u21-20020a2e8455000000b002a8e8c776e9sm196076ljh.56.2023.04.20.03.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:48:50 -0700 (PDT)
Message-ID: <a4bcf698-0709-986e-50fb-44ab9ae16b3e@linaro.org>
Date:   Thu, 20 Apr 2023 12:48:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 07/10] ARM: dts: qcom: ipq8064: align USB node names with
 bindings
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230420075053.41976-1-krzysztof.kozlowski@linaro.org>
 <20230420075053.41976-7-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230420075053.41976-7-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.04.2023 09:50, Krzysztof Kozlowski wrote:
> Bindings expect USB controller node names to be named "usb".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 49310520da1c..396938ec46cb 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -614,7 +614,7 @@ nss_common: syscon@3000000 {
>  			reg = <0x03000000 0x0000FFFF>;
>  		};
>  
> -		usb3_0: usb3@100f8800 {
> +		usb3_0: usb@100f8800 {
>  			compatible = "qcom,ipq8064-dwc3", "qcom,dwc3";
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> @@ -629,7 +629,7 @@ usb3_0: usb3@100f8800 {
>  
>  			status = "disabled";
>  
> -			dwc3_0: dwc3@10000000 {
> +			dwc3_0: usb@10000000 {
>  				compatible = "snps,dwc3";
>  				reg = <0x10000000 0xcd00>;
>  				interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> @@ -660,7 +660,7 @@ ss_phy_0: phy@100f8830 {
>  			status = "disabled";
>  		};
>  
> -		usb3_1: usb3@110f8800 {
> +		usb3_1: usb@110f8800 {
>  			compatible = "qcom,ipq8064-dwc3", "qcom,dwc3";
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> @@ -675,7 +675,7 @@ usb3_1: usb3@110f8800 {
>  
>  			status = "disabled";
>  
> -			dwc3_1: dwc3@11000000 {
> +			dwc3_1: usb@11000000 {
>  				compatible = "snps,dwc3";
>  				reg = <0x11000000 0xcd00>;
>  				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
