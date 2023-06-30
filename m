Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 582F87436BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 10:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232234AbjF3INJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 04:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232097AbjF3INI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 04:13:08 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D08B1FCC
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 01:13:07 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so2640536e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 01:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688112785; x=1690704785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8N98NIXmZWmFeIP8+c/tNntFW57IprvaGEGZFvUwvnQ=;
        b=pFw7I4QfTtG5ff1hDrCExT9n0BgtdRfGGCBpZYh1OXJ8yv6/tU8QDMU7ydSWp0vhUK
         0RMo2xlaej/yxsJK7sQrf8iRJIo39eqsOiUbwQcKD7vbXtmV0ERQRyK3Qk5hPLCMzUAR
         zHLP9/QExOTAheg3fUM6oHzPq68JrIWQcn6sa14TfJcCUU3slx/SEou27iQqbPFW4FBh
         vhVhzIdRM7ukwcnKYKHGWiNDS3hAJaJq2VAcffwZcD9Oy9h3SZr6lR5gkJ4UWXUupAYm
         dEuG+abHYoQQzxL7Yn4bC37svpuE0r9rgcPJhpiAbOLBCxxeItIAlM8z8gON5lo9nMuq
         QmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688112785; x=1690704785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8N98NIXmZWmFeIP8+c/tNntFW57IprvaGEGZFvUwvnQ=;
        b=JwdE1ea65grg4aqcuoWK7pFNdWAKL1s5P+NnIrD71d0jUiGhEwhvKdx96y5mcsoNbv
         4kXs5IFLvKkp71Fiwdc8zur+NVeyA8jMy1Y8Cd75T3dqkStCUPs9/tvJr9GfDGYsZ5Xg
         16LaZkARo/CVspap6WwSL87NtHqWQvj13UwgkPZ77BXYQUSWLAcH+jdBv52OUMxd7oor
         DcjBUJeFLYve8WhZLrAFfYt+JpFbWfOuOAjoPEKaxemcNlNM0OJBry3GUT/bHOhbS9Qu
         JpKKAdz2k2jNQGN/mAdo0E3jfzYm+ZLs8jEYBoEOToYYMuFzwMR1ALG+Bt/ZgGg0uDmh
         m5/w==
X-Gm-Message-State: ABy/qLY0J3xnmOlbi4k2sdKAgK2cDIto6SIsj0yUJGYKY/bpYsslDMj/
        iKENKPilDDi7+cgPgxkR1l36bQ==
X-Google-Smtp-Source: APBJJlHidOeQ9zm5aN+jCatjHDU1qcKRQnBMu/++EeLXfTkmZ+cM2UmLvB4E2WrG5a/NL3MlSlHxDw==
X-Received: by 2002:a2e:9844:0:b0:2b6:cbba:1307 with SMTP id e4-20020a2e9844000000b002b6cbba1307mr1431342ljj.0.1688112785454;
        Fri, 30 Jun 2023 01:13:05 -0700 (PDT)
Received: from [192.168.1.101] (abyj222.neoplus.adsl.tpnet.pl. [83.9.29.222])
        by smtp.gmail.com with ESMTPSA id v10-20020a2e87ca000000b002b6d647c7e6sm63929ljj.133.2023.06.30.01.13.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 01:13:05 -0700 (PDT)
Message-ID: <4c7377c8-eca9-5614-9c71-d90c091f134d@linaro.org>
Date:   Fri, 30 Jun 2023 10:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/7] arm64: dts: qcom: pmk8350: fix ADC-TM compatible
 string
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
 <20230630061315.4027453-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230630061315.4027453-5-dmitry.baryshkov@linaro.org>
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

On 30.06.2023 08:13, Dmitry Baryshkov wrote:
> The commit b2de43136058 ("arm64: dts: qcom: pmk8350: Add peripherals for
> pmk8350") for the ADC TM (thermal monitoring device) have used the
> compatible string from the vendor kernel ("qcom,adc-tm7"). Use the
> proper compatible string that is defined in the upstream kernel
> ("qcom,spmi-adc-tm5-gen2").
> 
> Fixes: b2de43136058 ("arm64: dts: qcom: pmk8350: Add peripherals for pmk8350")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Well actually, adc-tm7 would be the correct compatible (PM8350X is PMIC7)
but it never landed on the driver side..

Konrad
>  arch/arm64/boot/dts/qcom/pmk8350.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> index bc6297e7253e..1eb74017062d 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> @@ -59,7 +59,7 @@ pmk8350_vadc: adc@3100 {
>  		};
>  
>  		pmk8350_adc_tm: adc-tm@3400 {
> -			compatible = "qcom,adc-tm7";
> +			compatible = "qcom,spmi-adc-tm5-gen2";
>  			reg = <0x3400>;
>  			interrupts = <PMK8350_SID 0x34 0x0 IRQ_TYPE_EDGE_RISING>;
>  			#address-cells = <1>;
