Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 481246FC216
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 May 2023 10:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbjEIIxG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 May 2023 04:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234413AbjEIIxF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 May 2023 04:53:05 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F0F10D4
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 May 2023 01:53:03 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4efe8991b8aso6464424e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 May 2023 01:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683622381; x=1686214381;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EBMzH6lkxGGmY/PMfJpr4L+U0QFWQxDRrGHG6i/PULY=;
        b=jcJqhKk7iiRZxNxJ3KuyL4mKYAedtGrPuJ6WWbVJd5FVi4RNBqiMDyfFmUypE4N/UP
         IO7rwk8+ML88T3fNBctBEUNVh7nKxDTHJlIk1WtJtFpO8zA8wj+xTI9rXr2jWFXgibGY
         iFXTYGsZC3KcaPaQns49ymwX4he/z3HtDg0Oggdz3ynhDEvqmK9yVF6vhQ68JYc33JVl
         lelKY4Unz7KggdCpscgQ/VT+utwbNzWwhYO9TqZFTlmYFEEFeg7P2llEzMhIii2mkfpz
         93+bSbqT8rVAYPQsfQQIhH0Xk7UdrbprVt3Thn2ft7dgXewSV/3VXdV5+iDtd9bDUzk1
         b/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683622381; x=1686214381;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EBMzH6lkxGGmY/PMfJpr4L+U0QFWQxDRrGHG6i/PULY=;
        b=P1VpdFfhW0aL4hZEe3rw1fjBi5hAOBMIvJRgGWUrHRhBmExyxsTY9B/6cIbj5XMXTZ
         mJXeY6jffVH3PyCma6zYrt9GhGBP3GMKfMPW81pBC6tbgMA4EbL9Z8aN8PYDyA5Hq6Z0
         52einPhvnCGjRf4pU7NMmmuo3T8vGLNgOCqA8bwFraSKqzwytkUxPW7Ijzx+kC/1lTah
         vivJXMybf4ss4gfxia665lxOk/xCNimy307Yoea8t75G8QDdw4w81H19IiYn7A4Y80aq
         qo9l+V7/nZOFVVZm+pTkc4hlia3Lvywy+AFAewg6MjQCPZ09ypJZgniewLut7oNVKcCg
         kEOA==
X-Gm-Message-State: AC+VfDyM26KTf5wf4qDh2jhID8/ixboPDXZypb1ZkCnZZBuR+VXL+uRG
        AAIbrQ35SLK0uryH07GFvr1qew==
X-Google-Smtp-Source: ACHHUZ6yRo3edfxTi32rWnz4nY+3NNaAWVdJKygoKgejQKEviwPjTRuFVEOye5+sP+QGPS4Fj3Bb/g==
X-Received: by 2002:ac2:4d11:0:b0:4ea:f6d7:2293 with SMTP id r17-20020ac24d11000000b004eaf6d72293mr519605lfi.55.1683622381449;
        Tue, 09 May 2023 01:53:01 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id l9-20020a19c209000000b004cb35b31b96sm268821lfc.257.2023.05.09.01.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 01:53:01 -0700 (PDT)
Message-ID: <59b16d78-544b-7ea6-7668-d72d9a6078a9@linaro.org>
Date:   Tue, 9 May 2023 10:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 5/6] ARM: dts: qcom: apq8074-dragonboard: add onboard
 leds
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
References: <20230508160446.2374438-1-dmitry.baryshkov@linaro.org>
 <20230508160446.2374438-6-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230508160446.2374438-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.05.2023 18:04, Dmitry Baryshkov wrote:
> The dragonboard as three LEDs: red, green and blue. Add corresponding
> description.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> index 630180edecfd..07db6451f273 100644
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
> @@ -69,6 +70,29 @@ msm_keys_default: pm8941-gpio-keys-state {
>          };
>  };
>  
> +&pm8941_lpg {
> +        qcom,power-source = <1>;
> +	status = "okay";
Indentation?

Konrad
> +
> +	led@5 {
> +		reg = <5>;
> +		color = <LED_COLOR_ID_BLUE>;
> +		function = LED_FUNCTION_INDICATOR;
> +	};
> +
> +	led@6 {
> +		reg = <6>;
> +		color = <LED_COLOR_ID_GREEN>;
> +		function = LED_FUNCTION_INDICATOR;
> +	};
> +
> +	led@7 {
> +		reg = <7>;
> +		color = <LED_COLOR_ID_RED>;
> +		function = LED_FUNCTION_INDICATOR;
> +	};
> +};
> +
>  &pm8941_resin {
>  	linux,code = <KEY_VOLUMEDOWN>;
>  	status = "okay";
