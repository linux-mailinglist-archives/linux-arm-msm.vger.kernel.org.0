Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D476F6E90A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 12:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234480AbjDTKpt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 06:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234636AbjDTKp0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 06:45:26 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00CDC4688
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:44:32 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id a10so2266941ljr.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681987461; x=1684579461;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yRo5EUj7RXDMPXAd2VISgzld0n3oUPRdqArKtRXy7jY=;
        b=YePFAKMnJUPeNP514dvoBGsDyc/nfA98OSGHAwSpWD0yA/eQs6VlQvp8qTvsCRP6/Y
         tno75QyOr7aDkcuiTd9Vikrd3Pfep8f8uEvtTXiSXkGtOxygLMR4krvosuo9iyOnz083
         mZlIeLAkCkwxOXo5LGXXN+sZZgNOFrceCgClJUz2f19uLw4MpoAFqJqskWp948pk5RAI
         SYX3ihC8GHMCH66peQkmmesx4ohziGhGySEk8ZGwmwBJvdQXydjYA4WkPahQLMawMP1B
         swPcUCoQM1+7wVZH4YDoLngL0ggMXVG5HrovHAnTzR73WeWpO7ST1CdE9DemCNAfpkOL
         wdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681987461; x=1684579461;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yRo5EUj7RXDMPXAd2VISgzld0n3oUPRdqArKtRXy7jY=;
        b=c39wupQ0MHmCXhbCWwvC2Pz5/ey5Aphj3jrCUvCsoRy0YhJyGW46dYDmXlkKIabMsC
         s8M0Ri7ImJb6FlSmd7KH0cuIXtJFSTpwb3017tRNYSsd4g4wzX7qzXHEb/5DmjtG2gho
         kd/4dx+QRFpqns0KjXtlSOWd7bV1l0KwUSt1gSi46ZzStx433Fdzruylg/xKK0+yofYQ
         RFm99CVmvUw5ne/+iEv2+MZ0Gm+jHaOay0PzcljWQ1c6RYxWQQw4S1lwy+o9rA2A7moF
         D6oG42OXDZItueGfHSn7D5iFBLI3ju3XgNpXILKlzvCapnNIGH1HSSiyt47UrsiHw39J
         7q5A==
X-Gm-Message-State: AAQBX9fW/pzl31PHqzqPqXux8CitDw2CPHG/NOFRI/0VjrRrREGpJcK/
        m3/Kxc2VlSK58YWa2eZd7WmJUQ==
X-Google-Smtp-Source: AKy350Znt+H7xc3cDL3BB02Y2LM6YwPgPYKG8lF/R5zcI5/lMvPx7RsgSX6YQxOi1cJe0n4y1rQt0A==
X-Received: by 2002:a2e:9d43:0:b0:2a8:d0f0:584e with SMTP id y3-20020a2e9d43000000b002a8d0f0584emr282413ljj.16.1681987460846;
        Thu, 20 Apr 2023 03:44:20 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id w8-20020ac25d48000000b004eedb66983csm153561lfd.273.2023.04.20.03.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:44:20 -0700 (PDT)
Message-ID: <f00114c5-488f-3cbe-ad8b-f8f8cb35361e@linaro.org>
Date:   Thu, 20 Apr 2023 12:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/7] arm64: dts: qcom: ipq6018: add unit address to soc
 node
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230420063610.11068-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230420063610.11068-1-krzysztof.kozlowski@linaro.org>
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



On 20.04.2023 08:36, Krzysztof Kozlowski wrote:
> "soc" node is supposed to have unit address:
> 
>   Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 8ec9e282b412..e4267a6ec9a5 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -198,7 +198,7 @@ smem {
>  		hwlocks = <&tcsr_mutex 0>;
>  	};
>  
> -	soc: soc {
> +	soc: soc@0 {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
>  		ranges = <0 0 0 0 0x0 0xffffffff>;
