Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B370735831
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 15:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbjFSNNx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 09:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbjFSNNj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 09:13:39 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF49E7E
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 06:13:26 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b470330145so21232951fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 06:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687180405; x=1689772405;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yUCyn43Ba05/wUTOfOtOC0PNLhyt9DVE36oTpy8FhmQ=;
        b=GSgSqHAeUeq4yP1hrxDx/jdZ19hRgodHecxJnEL1tomeV8PoZWM97/WPmxMn+bAtih
         m3AAO2zg/F3NnYk9gJsmCYcj2CgD7StPi6jD4yCs7Dhdbx6OXOdLEHwIdMul1tLYEuDu
         +7bzTOEHmMyNJI+xKjgpxMkphW6SYj5fn0humBCqFARjsT91t1mb2DVl4MeImsy6eqUK
         qp0kRvsh6tEGiiGcASFCmRh6njWsWWXEIvTtLzVh4q6VPsi0Yfq8oT8UeaSz6BgRkJHD
         RRwFaS4R8FFfbkgur0rkYTx2YTwvO2Oscdj1yCE153vdUvG/UyaIBKODCFPMRrrgTWRN
         FDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180405; x=1689772405;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUCyn43Ba05/wUTOfOtOC0PNLhyt9DVE36oTpy8FhmQ=;
        b=BoopQPpQV2rS76teZoCR5W1XtVJCOmJvhR91B4XGpV98UfKFLGz8pRhaeadWU7JF9v
         kyuH1cONik5rdqpoHezydVgM8jz49F5klgTwHl/tNqxLpuEuegikOEx7pGm5NRODirkI
         JbHxaL6wI6oCZMZr2zjebWXkq42nKOmQs3xFzJ58e6dmFGK9QldPn8R7eNhe46L1qr4y
         dD6urT9c34GoNX8k/sv+Br/j0pKOa9Z0NR5odanWaxZ2+La4MKs9MUA4X7d6AwKvwGSk
         9iFXyTdmWGOtcwL3iJVPpbqIPhRf1jP6P8wjWo7DZCqvXzlUSvQQic39jPJiJVIPNM0U
         o7Hw==
X-Gm-Message-State: AC+VfDzXIMLQD9HJ7LEsxw2QlDX/pQdyMS442PErl+E23brr+UbYVcHM
        q31HBHD34aqTw/U1iihp1FzCGA==
X-Google-Smtp-Source: ACHHUZ4QmAXqKKYI0X6pS123LITWyxHMwUQiADRiJtPSdqleIp0mfmhlbA2qwnxHC6FBbbgptq8bcQ==
X-Received: by 2002:a2e:9808:0:b0:2b4:4a0b:8fb8 with SMTP id a8-20020a2e9808000000b002b44a0b8fb8mr5529604ljj.53.1687180404749;
        Mon, 19 Jun 2023 06:13:24 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
        by smtp.gmail.com with ESMTPSA id d8-20020a2e9288000000b002b247680950sm4758983ljh.131.2023.06.19.06.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 06:13:24 -0700 (PDT)
Message-ID: <43f57911-15bc-072e-fc41-bbb55c99c5fc@linaro.org>
Date:   Mon, 19 Jun 2023 15:13:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 08/15] arm64: dts: qcom: sc7180-aspire1: use generic ADC
 channel node names
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Nikita Travkin <nikita@trvn.ru>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230617171541.286957-1-krzysztof.kozlowski@linaro.org>
 <20230617171541.286957-8-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230617171541.286957-8-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17.06.2023 19:15, Krzysztof Kozlowski wrote:
> ADC channel node names were changed to require generic 'channel'.  The
> user-visible part is defined via label.
> 
>   sc7180-acer-aspire1.dtb: adc@3100: 'charger-thermistor@4f', 'thermistor@4e' do not match any of the regexes: '^channel@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
> index b637b4270f88..dbb48934d499 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
> @@ -314,16 +314,18 @@ &mdss_dsi0_phy {
>  };
>  
>  &pm6150_adc {
> -	thermistor@4e {
> +	channel@4e {
>  		reg = <ADC5_AMUX_THM2_100K_PU>;
>  		qcom,ratiometric;
>  		qcom,hw-settle-time = <200>;
> +		label = "thermistor";
>  	};
>  
> -	charger-thermistor@4f {
> +	channel@4f {
>  		reg = <ADC5_AMUX_THM3_100K_PU>;
>  		qcom,ratiometric;
>  		qcom,hw-settle-time = <200>;
> +		label = "charger_thermistor";
>  	};
>  };
>  
