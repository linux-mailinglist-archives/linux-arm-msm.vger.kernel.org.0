Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC29A447FE5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 13:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238653AbhKHM5l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 07:57:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbhKHM5k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 07:57:40 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E3AC061570;
        Mon,  8 Nov 2021 04:54:56 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bu18so36071457lfb.0;
        Mon, 08 Nov 2021 04:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=dhxkuxD7y+T2oUxbCfh7/LSZD92zgc+Z3BiHJZcwpms=;
        b=UAbLL6XXoJdJTy8yMRqSdWQFR0Ky3RlOqulTRBBnEeWRTuARuWEIGpybETzelmBc02
         EwR5fF96ous50B5L83zh5Qc8afwTxNyLQu6iBf6XCaoY1cDFeRBciQVWBdHc63dNsmVj
         j5HU2wDqSU1YLMjlaFhFgb7akYpVDnUVq4NOfUV/NLvfbwE+kjJ6TFx3RkiU2+ljMeA3
         tfwjTxp6y6Ec1qMJKnE3zkBQLjU8Rg/uLrxQdTLFRMJ/XzVPzl3tEnmSYvLaTrN+Ojh6
         WJ5Q1J9yP3mojZ4a6acjOfx7Q4XGKayrxOc2WYK4oGJVbCWwhQeDOTMGdCjh5c0t/dQh
         HENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dhxkuxD7y+T2oUxbCfh7/LSZD92zgc+Z3BiHJZcwpms=;
        b=toXSK4tMj6qMQgTBabySKRM5x3fmWgD+RzOOIB8zBeyPmY7dK4uNocaLe+09l5aoZ2
         JFESHZRhvnsqf/UTemtHkqPZYsvcJ1sx5ZHNNue8NgLa1TwygXEb4ct8gRkc+s1Hi2V4
         Nb64YmShIQfKL+AJ0D8uLCfo4zIt6uQHkXFlT+pFprv763nkOdsoOREn/vh3ha2n5oqn
         IeIfoUBn0aRViKmujkAcsKpPnART2WVHHgg8qROJ4xfO7DpIDRM7ZNzHu2zvMNfJVxUS
         6U8lMJl0w6IRD5MffnJC3Hf/BDB9MeasYUgJgYC5bScpqdEj3bJLjjO0Wku0Wio8yGiU
         zEpQ==
X-Gm-Message-State: AOAM530Pa7abmbHjoYuzCj2UPIR7WegH2wR4YzAIfBVERobQQCaKxolG
        HrG4se05u7f2Qo2oLg5F5+Y=
X-Google-Smtp-Source: ABdhPJxF2fg5g4gcukSXF2hN0kNmRvlzieymMpxTEp+ysjtO/HyBbYADd5sA7lK7LKXX4tP/zMfGPw==
X-Received: by 2002:a05:6512:965:: with SMTP id v5mr56432329lft.3.1636376094406;
        Mon, 08 Nov 2021 04:54:54 -0800 (PST)
Received: from [10.1.250.9] (riviera.nat.ds.pw.edu.pl. [194.29.137.1])
        by smtp.gmail.com with ESMTPSA id i1sm1800363lfr.287.2021.11.08.04.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 04:54:54 -0800 (PST)
Message-ID: <70610f17-82c8-4239-f862-c90269b065f6@gmail.com>
Date:   Mon, 8 Nov 2021 13:54:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: sdm660-xiaomi-lavender: Add
 volume up button
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, martin.botka@somainline.org,
        marijn.suijten@somainline.org, paul.bouchara@somainline.org,
        angelogioacchino.delregno@somainline.org,
        Caleb Connolly <caleb@connolly.tech>
References: <20211108050336.3404559-1-danct12@riseup.net>
 <20211108050336.3404559-5-danct12@riseup.net>
From:   Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20211108050336.3404559-5-danct12@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 08/11/2021 06:03, Dang Huynh wrote:
> This enables the volume up key.
>
> Reviewed-by: Caleb Connolly <caleb@connolly.tech>
> Reviewed-by: Martin Botka <martin.botka@somainline.org>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>   .../boot/dts/qcom/sdm660-xiaomi-lavender.dts   | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> index 28408240735b..ab814dc8a875 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> @@ -9,6 +9,9 @@
>   #include "sdm660.dtsi"
>   #include "pm660.dtsi"
>   #include "pm660l.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/input/gpio-keys.h>
>   
>   / {
>   	model = "Xiaomi Redmi Note 7";
> @@ -31,6 +34,21 @@ vph_pwr: vph-pwr-regulator {
>   		regulator-boot-on;
>   	};
>   
> +	gpio_keys {

Nodes shouldn't use underscores.


> +		status = "okay";

It's set to "okay" by default, no need for this line.


> +		compatible = "gpio-keys";
> +		input-name = "gpio-keys";
> +		#address-cells = <1>;
> +		#size-cells = <0>;

Not sure if you need -cells here, as the child nodes don't have a reg.


> +
> +		vol_up {

Ditto


> +			label = "Volume Up";
> +			gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			debounce-interval = <15>;
> +		};
> +	};
> +
>   	reserved-memory {
>   		#address-cells = <2>;
>   		#size-cells = <2>;
>
Konrad
