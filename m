Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C01F71779B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 09:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234537AbjEaHPw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 03:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbjEaHPv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 03:15:51 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37FEA113
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 00:15:50 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5147dce372eso7885698a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 00:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685517348; x=1688109348;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8xSd0cqAgLf+YYqiwd7XbThq636v/o3mZGXKvGoMzbA=;
        b=rXMRIfL0QEhBKNiJLprXa7lweF4waA04T8WOPzJERq4jvpcQa+4SdeFrItnoyZ/3iV
         WVsKt+Pp/MzZTbhpGj9Z+IZRrkCX81rQOrk0VZLz0LicM4240MXekISKAMCtCnCO2sr6
         5FpUBr1wKOhb+gPz6ZaCZeLPaWg9QnkNJlkRtKPDC6Wew9NeBzaft2yFDmumjrN9pkPn
         HcR9qw9YGxsrc1ruMAC5Yc4+DyWlOQppqAilzOqzJHPm1lWCdLBS4HdHekMRLCtARyh8
         vvD3dhrVShTff1NGmkI5aYkZ3FWE9k5zqpRxA6eAseXxMczKWx54ekQwbiDlB1V/AFag
         3nQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685517348; x=1688109348;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8xSd0cqAgLf+YYqiwd7XbThq636v/o3mZGXKvGoMzbA=;
        b=BWPvQVvYQb9UpKeSH/xQ4HLEbhxF0nubuIoHjXBQfTarrPl78u8xi+gRsinQvD/w5S
         mItJpKT24/KPz+Rri6dyufFehN/E32eyx06A9KWNJqF0yK1CFAS8kMwJeYZpSr56zNF9
         sFh7p/jvInNNYnNtyW813gsDbL/lGrhljYF9eZDqj1A2z3MlcJCdhp1E/pLt6SVAAfkg
         Anwhg9d8ViI+RXO4Exl4rxFyjRzseS3bn2yyV6q/ehH4xbh8DRsZdYcmnfe3BEO/+GAx
         dqkWurB7WipDbH+704rC4XKbNULtx2a5rtyDxo1AnAEXckRBgw+1hHkNjbx03no9C5oH
         OGaA==
X-Gm-Message-State: AC+VfDyhYHM8Lyyx+nuXa/g6dkgTZHtO20UrmzEhXHczDsQ8nU94fAVL
        g+KsyMc79LiJtSQ20jKJuvix/A==
X-Google-Smtp-Source: ACHHUZ5F2hKC53ubgHiwwHDoDcx88Avzd7kTKgt28eaV0r3S69mPsGVeneI2iFV8X+/Rbm590SrJCw==
X-Received: by 2002:a17:907:d91:b0:96a:8412:a444 with SMTP id go17-20020a1709070d9100b0096a8412a444mr3827146ejc.73.1685517348720;
        Wed, 31 May 2023 00:15:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id n13-20020a170906688d00b0096f641c6167sm8399073ejr.181.2023.05.31.00.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 00:15:48 -0700 (PDT)
Message-ID: <46639d7e-95ed-35a6-a9ab-d802af4470ce@linaro.org>
Date:   Wed, 31 May 2023 09:15:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: ipq5332: enable GPIO based LEDs and
 Buttons
Content-Language: en-US
To:     Sridharan S N <quic_sridsn@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230531065619.9181-1-quic_sridsn@quicinc.com>
 <20230531065619.9181-2-quic_sridsn@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531065619.9181-2-quic_sridsn@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/05/2023 08:56, Sridharan S N wrote:
> Add support for wlan-2g LED on GPIO 36 and wps buttons on GPIO 35.
> 
> Signed-off-by: Sridharan S N <quic_sridsn@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332-mi01.2.dts | 43 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts | 43 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts | 43 +++++++++++++++++++++
>  3 files changed, 129 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332-mi01.2.dts b/arch/arm64/boot/dts/qcom/ipq5332-mi01.2.dts
> index 3af1d5556950..ba733b6cab06 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332-mi01.2.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5332-mi01.2.dts
> @@ -7,6 +7,8 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
>  #include "ipq5332.dtsi"
>  
>  / {
> @@ -20,6 +22,33 @@
>  	chosen {
>  		stdout-path = "serial0";
>  	};
> +
> +	gpio_keys {

No underscores in node names.

> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&gpio_keys_default>;
> +		pinctrl-names = "default";
> +		status = "okay";

It's by default, why do you need it?



Best regards,
Krzysztof

