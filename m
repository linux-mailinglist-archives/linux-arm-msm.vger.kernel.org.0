Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E78A62BB5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239163AbiKPLT4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:19:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiKPLTm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 06:19:42 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703905E3DE
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:07:38 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id f27so43254495eje.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9eTJRYf1yPFFjImpOiQwsUnTcrPAbYewUIUGfLR6HRM=;
        b=CJqb2IGRrP64fnoT5rEnJ8/1olAPzXj8v5mrboJ0568X0HJYUj7A9FSm1ErxUGvZ2Q
         rdr5sBrtcLkmtJs/mGhfKZ4X/oyHn0s1AKAm5PyliCP6ar3B5gB6vqHlx+BAOwuoAayX
         OWqBgG7lRm0xcbeH30cX0t/w5Q0utYf5lYvmxWyX1d4e5O1FEruxYOVmZd78nBJA5WTK
         /7kFegco4DlumvGxdVmQh2a01V432dIUUC/t0ZNAvyuSZ5RsgJv7g8aqv9AU+kpmVhL7
         qCs43PGW46V14dx5DAQmbGEQ19kczhlrR7xpJ40C30+FFwfItDam3xvm3ilo2wntmkxt
         75tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9eTJRYf1yPFFjImpOiQwsUnTcrPAbYewUIUGfLR6HRM=;
        b=s/BwfFP3BS7wkwNYKDvCAnoyKB+7ZaGNNb+9+JaVLAFUndlYIXGqTk21Zi6JP/gWZf
         uKNg+YZ+c2hXQ43bGl/BDOHO+SH9xI5IQD3FpE9EYQCN3B/k47zQfur2BAG6RIL6Y/fJ
         2sJFAzLXFPG7O5n7RWS0rNFpUUPGD/5WiIrjMXLtXe1iBsYoxjZgQRXi0LGy3qfj1ZuS
         4xLh+cQkvxd8h8sJsi5toWhSb6NbF661Yhba+GK70CPnjQQs5XnVleMsOZDadQnR+YNn
         zzTha+cFyd2FDjZ48R3yQcgq2miqMF6ZoQQLGOm7w6Z2BteG2UqiPj0muTiQsDOTLL6U
         2xtA==
X-Gm-Message-State: ANoB5pmC1syFv5D9Jh7UER3Ee7AGLyqkV89MZ5046yA4jGe0lz6KcYIT
        TfYV47+Z03zPYV3b4FcaiNLeKw==
X-Google-Smtp-Source: AA0mqf4poeYHxfbflj7WbVG09DZ1PTfD9RXELSaYnp+GxgaehIz9G/9TFWq1WWjIafXKre7V7FTvIA==
X-Received: by 2002:a17:906:66da:b0:7a5:f8a5:6f84 with SMTP id k26-20020a17090666da00b007a5f8a56f84mr16678876ejp.569.1668596856899;
        Wed, 16 Nov 2022 03:07:36 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id 13-20020a170906318d00b007822196378asm6817324ejy.176.2022.11.16.03.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 03:07:36 -0800 (PST)
Message-ID: <f86d8eb5-74d4-70d3-f725-cc95dfbeb1cf@linaro.org>
Date:   Wed, 16 Nov 2022 12:07:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 05/10] arm64: dts: qcom: Add PM8550b pmic dtsi
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20221116103146.2556846-1-abel.vesa@linaro.org>
 <20221116103146.2556846-6-abel.vesa@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221116103146.2556846-6-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 16/11/2022 11:31, Abel Vesa wrote:
> From: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Add nodes for PM8550b in separate dtsi file.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   arch/arm64/boot/dts/qcom/pm8550b.dtsi | 59 +++++++++++++++++++++++++++
>   1 file changed, 59 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/pm8550b.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8550b.dtsi b/arch/arm64/boot/dts/qcom/pm8550b.dtsi
> new file mode 100644
> index 000000000000..16bcfb64d735
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8550b.dtsi
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2022, Linaro Limited
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +/ {
> +	thermal-zones {
> +		pm8550b-thermal {
> +			polling-delay-passive = <100>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&pm8550b_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +
> +&spmi_bus {
> +	pm8550b: pmic@7 {
> +		compatible = "qcom,pm8550", "qcom,spmi-pmic";
> +		reg = <0x7 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pm8550b_temp_alarm: temp-alarm@a00 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0x7 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pm8550b_gpios: gpio@8800 {
> +			compatible = "qcom,pm8550b-gpio", "qcom,spmi-gpio";
> +			reg = <0x8800>;
> +			gpio-controller;
> +			gpio-ranges = <&pm8550b_gpios 0 0 12>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +};
