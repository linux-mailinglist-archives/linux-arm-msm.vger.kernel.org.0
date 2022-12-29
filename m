Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9EF658B97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 11:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbiL2KSn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 05:18:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbiL2KSD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 05:18:03 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECEB713F96
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 02:15:33 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id n1so18983651ljg.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 02:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lNN2sBvX/0Zx4BfvDXrMZKSh4hziHTKILA1D5f6MaPw=;
        b=tVPQ4VgqeMti8VBB8bvb2w9OZUPkBxxFagYHmnqInLlC+PTsL1t127Ak2nZWAh67rn
         y72I0scdngySfHSrYhPCSC+7BfYeKmzHAxUypIAhhnnSfy72Mo27o6dU9hejfJXtmtkI
         ylwNVIU59+Cw6HD0/u4YeZOzlODHiXNPTNswEd7G36zuXyRUI/k1c3nM9E4NZ9dTTw8n
         E8I5sSByxJpQ/GxfhQLBEg/dbEf637F03YJOOXGJSHx8j8FEmhArryWuKCpU6HR71ppo
         9q0gOTbYNzDpuDKF+OQTJUR+0zLOTJSz5j5td1sY16EDmv6MF8tJ9Aee/FAyu/L8oLyd
         roog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lNN2sBvX/0Zx4BfvDXrMZKSh4hziHTKILA1D5f6MaPw=;
        b=uils+OIxOwY5GB6azNNnpeHw2W+pkvmjjE56Rl5oDVHeEipUNDl2Isil4qbNYsuWUz
         cITnQDn4DIsSm+l/jg+VmiFBVIV1glRo35AdxL5Mln9F4iX9oFxtQWjFmxGntyQCGTn4
         6tSB5IVZjNxUNTV+DVfNyPhPNcdrZY83VngwhLmrbN27+SLjT/dX+g8l/6wPH1ATgMAs
         8ouxA3S+3jew4inbTuqZtibVCCwYytc1a6p7mx8JT28Fdyl/vaxMQO3NOX0ZEUPH6ZiJ
         R8j6ZqHx60xvTdoHKeVL1HcF8UPeLshejd9TP8HSfLqsp01vI6+uTWtd3oJLSAHM6h6p
         5JsQ==
X-Gm-Message-State: AFqh2kq/B10PqjMm6Pw/ySRrS45qG8LY6sTI7yuNZ/zxzFb72WQITRq8
        Cqgd7PajlS2FFLSawpsyl/+Vaw==
X-Google-Smtp-Source: AMrXdXvDet+IpOqiT9isaqBYpbvgjZNIHoQKKIX1RAUCcnec3JO7Zm/Y6kghsRTtnKwuA/tiOfIpEw==
X-Received: by 2002:a05:651c:233:b0:27f:79ff:6d8d with SMTP id z19-20020a05651c023300b0027f79ff6d8dmr7887501ljn.11.1672308932189;
        Thu, 29 Dec 2022 02:15:32 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id b14-20020a0565120b8e00b004ac980a1ba1sm3040839lfv.24.2022.12.29.02.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 02:15:31 -0800 (PST)
Message-ID: <87839ded-9fa5-beb0-429d-7be233b3d20e@linaro.org>
Date:   Thu, 29 Dec 2022 11:15:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/4] ARM: dts: qcom: pm8226: add IADC node
Content-Language: en-US
To:     Rayyan Ansari <rayyan@ansari.sh>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221228230421.56250-1-rayyan@ansari.sh>
 <20221228230421.56250-4-rayyan@ansari.sh>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221228230421.56250-4-rayyan@ansari.sh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 29.12.2022 00:04, Rayyan Ansari wrote:
> Add a node for the current ADC (IADC) found in PM8226.
> 
> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
> ---
>  arch/arm/boot/dts/qcom-pm8226.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-pm8226.dtsi b/arch/arm/boot/dts/qcom-pm8226.dtsi
> index 6af259218f63..46ba84f86c9f 100644
> --- a/arch/arm/boot/dts/qcom-pm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom-pm8226.dtsi
> @@ -88,6 +88,12 @@ adc-chan@f {
>  			};
>  		};
>  
> +		pm8226_iadc: adc@3600 {
> +			compatible = "qcom,pm8226-iadc", "qcom,spmi-iadc";
This needs a bindings update (unless it was merged beforehand somehow).

Konrad
> +			reg = <0x3600>;
> +			interrupts = <0x0 0x36 0x0 IRQ_TYPE_EDGE_RISING>;
> +		};
> +
>  		rtc@6000 {
>  			compatible = "qcom,pm8941-rtc";
>  			reg = <0x6000>, <0x6100>;
