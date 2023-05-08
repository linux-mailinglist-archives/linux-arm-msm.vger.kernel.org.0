Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28C566FA2E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 11:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233731AbjEHJDb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 05:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233607AbjEHJDR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 05:03:17 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E05234B8
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 02:02:32 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f1fe1208a4so1868684e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 02:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683536537; x=1686128537;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/z9dgN6GMCoEGZ0jWnKqWd/MgKRJLoLICi2PFBWcqTg=;
        b=qRLq2/LbNjgNW8GFHVQYPqmv2lXtRYD2iqVkHTyYyJ/A5pA4z6StZvam+pZ6PjZTBS
         AAFIyK+uTRWY6UvmlSWLQvnttOIqf+w2ZCLDKGvNxKWhiE4WfjvUUwyqqNb+GKOjdfem
         vrzIJbDBRcrJSKpp+yLRIApMHH5a2BElwshYH2znr+IW5TZS9eZwvAveE8GBWNAHebvT
         6Si3UCczhla7aNFM7VIlHY+VO92d45FVdiWaeOKfNss4MeSlFoPch1co7+Kn+1ZxchRg
         YGeKN1UFHT1mMojwbw5RKPI95CDmUqWq7bFH/sC30f5NMa07CA+kSNq8qV6pZ8yiQ1gQ
         XCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683536537; x=1686128537;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/z9dgN6GMCoEGZ0jWnKqWd/MgKRJLoLICi2PFBWcqTg=;
        b=KSia2klApJDuH6KO4d0/PNMCJ/kDLsQqlvR+S2BvjFuxTIYYNhedujnHOaExlULVz7
         tWw4Rs7K32kwF123yIvAKQkmDF5jYI/vm0QVDPozCY8ziMnTGheqFoyc+mUJ6qu5EOzG
         LMAVLXuIE7DpUDLVVudGZ9yQ9R/rfiR9TbuyrjBDoTLZ5nfABqAJ9k1MOaH9zCDKV/jf
         ZCpMVkc57N2xRYN6Lu4gBoZq2qYO59FT2BUu3fCLa0DUBnGdDx9rhCL3mPru/CzlW/83
         vQNI9IYIQbdjpmjDEhJr1oiYoyW7CIdm52GyTehbQFl8pgl7Nz8TqmyIq2OCbK9ZojVg
         /Diw==
X-Gm-Message-State: AC+VfDwUfE8y4dNlE/O4y1YE64e6GLSqF4SJKOu/+zwa8SLSylBzRhXG
        lez/eO0+5EJC47lGkRug49GEC2bKhVRRwhluBoQ=
X-Google-Smtp-Source: ACHHUZ56FSrGanyqSw3WoaTSsPz5RHiEfcc1q2IJHX1NvrSfkMm1fzjyPkPaFwoVybnWYOxsl2hTSQ==
X-Received: by 2002:a19:7410:0:b0:4e8:4412:1d95 with SMTP id v16-20020a197410000000b004e844121d95mr2637569lfe.29.1683536537437;
        Mon, 08 May 2023 02:02:17 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id h12-20020a19700c000000b004f13ef9b360sm1241395lfc.142.2023.05.08.02.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 02:02:17 -0700 (PDT)
Message-ID: <494f17a9-3cda-378a-99cb-8336ff1fd63e@linaro.org>
Date:   Mon, 8 May 2023 11:02:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 5/6] ARM: dts: qcom: apq8074-dragonboard: add onboard leds
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230508003309.2363787-1-dmitry.baryshkov@linaro.org>
 <20230508003309.2363787-6-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230508003309.2363787-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.05.2023 02:33, Dmitry Baryshkov wrote:
> The dragonboard as three LEDs: red, green and blue. Add corresponding
> description.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> index 2017bdf81677..16d609b85dfe 100644
> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include "qcom-msm8974.dtsi"
>  #include "qcom-pm8841.dtsi"
> @@ -126,6 +127,29 @@ pinconf {
>          };
>  };
>  
> +&pm8941_lpg {
> +        qcom,power-source = <1>;
> +	status = "okay";
> +
> +	led@5 {
> +		reg = <5>;
> +                color = <LED_COLOR_ID_BLUE>;
> +                function = LED_FUNCTION_INDICATOR;
> +	};
> +
> +	led@6 {
> +		reg = <6>;
> +                color = <LED_COLOR_ID_GREEN>;
> +                function = LED_FUNCTION_INDICATOR;
> +	};
> +
> +	led@7 {
> +		reg = <7>;
> +                color = <LED_COLOR_ID_RED>;
> +                function = LED_FUNCTION_INDICATOR;
> +	};
This introduces broken indentation

Konrad
> +};
> +
>  &pm8941_resin {
>  	status = "okay";
>  	linux,code = <KEY_VOLUMEDOWN>;
