Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29C7462BB58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239209AbiKPLT0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:19:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239205AbiKPLSs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 06:18:48 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A20E31348
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:07:21 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id z18so25996801edb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ER0Mh/YYX8I6GnN2Nz/uIzI/Fk2xZQ4NnXMMQtVXxLc=;
        b=E2BrYxTcC9R0dxZI3Akit1pnCIsBsC91NZywXPD1FKNXVQ8fuJY4g5DBW6+QKQdPO8
         zbIprg1Cva5XYNDO+oE0lnpqVWgYUl7Ihg7eYiVUncrHnnpeeLHO0lXEMYa/yFLJ8oTv
         KDirsntjuuKAMu8qmJqvEt5ScuOGHRFhRVI/F+fnTntQRDlVjlYHybD+vXTZp242lihU
         J7/qYPOt1SOQuUD2Y1PcpFpuNPA6XNHOInySycWf0XIC/f1QBhjt31JXThA1byBxxuC5
         dMCka1d67Y77cmHS0hElAcPYIBd98gfLtuChw+/lsdIuyDJyoWo+g4tgcgSpFkbWS6w2
         p8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ER0Mh/YYX8I6GnN2Nz/uIzI/Fk2xZQ4NnXMMQtVXxLc=;
        b=lEjNOAvm74BjELyF2S9jnqAsur0GwO57pqin9NZsf69GvyFlxhceIGutrzGXqq+Rbl
         YSW8StwYdlBQJZdY7wQG7Fxl95A0CGYVtoGQ36KsJP5u3MuyXPf90UXkJT5wwG0ZYL6A
         ruNqIfUI48F7fajdXmCltTzm5Kmh/Z6FxVk3nETyM0bg4Ukyqtn3rfTqQlHwSAGE4mdX
         lsZJxwlzfBi4suTuXMJ5/StLaKxrL/unmxFyLxwEHLTPj2q9jXE0C4bwAg28BDSJj2Eg
         CjZSEin8U/jv+qKmyq9cf/CT9061ogI4OPHIyK9cTESq5EwXbnarVRKbqEmerw02EIei
         9bMg==
X-Gm-Message-State: ANoB5pm1p+CvSByxtmTNgDNKP6YHl7gvplMxB+27NsWQQuL7QfqUKLYV
        2rtXhgOuFzEWfkvLHlmo113BKw==
X-Google-Smtp-Source: AA0mqf7FR7jQpTnSzHO2lkMWZgWzQvnOf6tKzUEq3qNn7di8jINLTEC4rmoe2yknpGBNCcinnlJNnA==
X-Received: by 2002:aa7:c557:0:b0:464:b8b:f526 with SMTP id s23-20020aa7c557000000b004640b8bf526mr19215748edr.342.1668596839864;
        Wed, 16 Nov 2022 03:07:19 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id rl24-20020a170907217800b007ae035374a0sm6679121ejb.214.2022.11.16.03.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 03:07:19 -0800 (PST)
Message-ID: <22ba639d-89a3-5808-c563-a6ecf23339e1@linaro.org>
Date:   Wed, 16 Nov 2022 12:07:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 04/10] arm64: dts: qcom: Add PM8550 pmic dtsi
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
 <20221116103146.2556846-5-abel.vesa@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221116103146.2556846-5-abel.vesa@linaro.org>
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
> Add nodes for PM8550 in separate dtsi file.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   arch/arm64/boot/dts/qcom/pm8550.dtsi | 59 ++++++++++++++++++++++++++++
>   1 file changed, 59 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/pm8550.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
> new file mode 100644
> index 000000000000..46396ec1a330
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
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
> +		pm8550-thermal {
> +			polling-delay-passive = <100>;
> +			polling-delay = <0>;
> +
> +			thermal-sensors = <&pm8550_temp_alarm>;
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
> +	pm8550: pmic@1 {
> +		compatible = "qcom,pm8550", "qcom,spmi-pmic";
> +		reg = <0x1 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pm8550_temp_alarm: temp-alarm@a00 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pm8550_gpios: gpio@8800 {
> +			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
> +			reg = <0x8800>;
> +			gpio-controller;
> +			gpio-ranges = <&pm8550_gpios 0 0 12>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +};
