Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C72A6ABD35
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 11:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbjCFKsj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 05:48:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbjCFKsi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 05:48:38 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E7041C331
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 02:48:37 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id t11so12129570lfr.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 02:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678099715;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2lEWb9M+27usFFCg4r17f9lWCbgLfmjVxKsZzU2ZwyM=;
        b=q7O0FGrmn41rY8tsM47xZZKULIR2uEQ1Q1xXgDy4e51HNv2SAJittZeN/fEEnyEt8t
         uez/LH9Bs7sOifuQ5YveqdCIx8wPuhsE1G9e4gQMheFG6kd/RAzm9w5LCVubkOjF5SPQ
         DxMlPLvqt+nPLKjcHB/qbiXJ969Q3jjzopJpR6micpUmyOPrv4+SJxnKRbszKRo6YVUa
         uWC8FLZ6BrWupFxLA9vwVwxu2uLD5cnjBtbEg6nudoKVyzxliCSzjnDZfmtG6ETXPRcU
         F547MeT7r34DYFMr+TZnCRcxJP2oEK4/9PP/wItJodP0r5KQF4z/lO/+gj7qalXBokEU
         AriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678099715;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2lEWb9M+27usFFCg4r17f9lWCbgLfmjVxKsZzU2ZwyM=;
        b=gltp2r98+/UURMgLunqu890ThL94rIIHFK95kWgujRGndaBmnU0uBDQmrbSI2aJrHE
         qQtKxWg9SIXotouo4DiRpVtd46u8ct8l/T2KFkCXbSWS4W1WeXn6x7SDCz4ZCupB7Owk
         6RVCihIU8Vmky7B7pGx0lXGk5VXavl1rAWHsdA3xBv+BNjmTNBccB4Re9FMXIw3BOts5
         4Jv7WfhFQr1XaIYRMA9oOj5HKvFmSRoTsH+R6wc4CzSlK4VWRSCOCRF7654kdRgy9UnW
         2HOZwVxXvMrlhiCIQqF/3W6P5++e3iuGtneCviC235TslrXARU6BaUJHhQuEwaO1K2U6
         hZJg==
X-Gm-Message-State: AO0yUKX0zikWvFLJn7nySYJBEHnAYzYU734pZNyVe1rcRK0aw7XGR80i
        RjOsn7+QZzKuPmXgJEnr/dN35GDsv0JYYKIJRyQ=
X-Google-Smtp-Source: AK7set/6LkeOMH3WQokq5Ob72HziBLcaxSdFyJaqE4F3uGUs0etpCVKPVO4f1bdeNW/ue7KuPE+dhQ==
X-Received: by 2002:ac2:5181:0:b0:4cb:4571:9efe with SMTP id u1-20020ac25181000000b004cb45719efemr3333656lfi.35.1678099715563;
        Mon, 06 Mar 2023 02:48:35 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id s9-20020ac25fa9000000b004dc807b904bsm1579512lfe.120.2023.03.06.02.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 02:48:35 -0800 (PST)
Message-ID: <51eec3fc-3016-e314-d4a3-bce16f28eebc@linaro.org>
Date:   Mon, 6 Mar 2023 11:48:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 03/11] arm64: dts: qcom: qdu1000: drop incorrect serial
 properties
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230305125954.209559-1-krzysztof.kozlowski@linaro.org>
 <20230305125954.209559-3-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230305125954.209559-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 5.03.2023 13:59, Krzysztof Kozlowski wrote:
> The serial node does not use/allow address/size cells:
> 
>   qdu1000-idp.dtb: geniqup@9c0000: serial@99c000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
> 
> Fixes: 6bd20c54b589 ("arm64: dts: qcom: Add base QDU1000/QRU1000 DTSIs")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/qdu1000.dtsi | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> index f234159d2060..c72a51c32a30 100644
> --- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> @@ -412,8 +412,6 @@ uart0: serial@980000 {
>  				pinctrl-0 = <&qup_uart0_default>;
>  				pinctrl-names = "default";
>  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> -				#address-cells = <1>;
> -				#size-cells = <0>;
>  				status = "disabled";
>  			};
>  
> @@ -581,8 +579,6 @@ uart7: serial@99c000 {
>  				pinctrl-0 = <&qup_uart7_tx>, <&qup_uart7_rx>;
>  				pinctrl-names = "default";
>  				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
> -				#address-cells = <1>;
> -				#size-cells = <0>;
>  				status = "disabled";
>  			};
>  		};
