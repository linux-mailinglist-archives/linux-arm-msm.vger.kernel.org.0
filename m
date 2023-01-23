Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0895C678167
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 17:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbjAWQ3a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 11:29:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232048AbjAWQ33 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 11:29:29 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0803B2A995
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 08:29:27 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id z11so15271839ede.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 08:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QnI9gK1RE/xFPeiF67JBO03UXJnSe4HAgZlnhIo2fT8=;
        b=lGzKRehrYviynINTjrUw56QeQxwcOHWugpQVBuDkTuP7zf3a+WnHtvRWcud4bpErK+
         eZ3dCED9L8dYqv4hxX5ywJKIiOKeK7ybjBLXQQL8Hp2NzSyrda1ovALv+HehedLJs/i6
         P8HQvJRseK4QSXmD8nCcZmCvTS3rMlRZabCzXNL/WFiQYWYpe44OdSMcTywtujcCalRC
         gJRJfffvzoBICrA3RXJUtlsRyN6m3scEv+P0AngFWPjUB7Yx7qED2K0y9qqn0tQQGJJ6
         W5noqYosOk7CMRsW/SVx+geIgk8IHf6+aJ7m/31TrS0G99liIGPkZ7PWGXax812yxnBa
         QkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QnI9gK1RE/xFPeiF67JBO03UXJnSe4HAgZlnhIo2fT8=;
        b=t4THxJH2a5nOeSzqaz1D1R90xeYOzrn+0fAzuv7tfRtr1G4zzTr2giQ8R6kuwbiNqc
         2femU0zzFnHCppWEFYFtS8krIQgvdHUydJnOhXa/imcxjxk68WTnSdf+h30bLY5XGXt4
         jZviG6v156an3UggXmV6+Sb5IY7H1pc/jxgmSSCxF0XVcOUn7h0U7D+1swG2sRb53Q1h
         Y8a3iWIW0BRkHPnhYDBf9gC3NlgEi5aKJGo7ZjxjelNuEDx5J9XWtWo32pGfhLpUX8Zw
         oyHm4k4AO1eM1ih5wMv0C7fEaqtUycHvuyQX4F+SdDjNQqpeW9t65HM99Td34p3V8aUq
         2BNg==
X-Gm-Message-State: AFqh2komfAyF6Z5E3An2t5U8XF90HKuWfULDDpa88YKrfPFdhQqZaDRs
        JI9JrjKLgCB59xsorMZvZ8NW9g==
X-Google-Smtp-Source: AMrXdXv62D+0kWD668M4VSNsQwQ7Zg3qF5p3+nxzuZbn14rakRNZm5NWFlyx0fFyQSPTqMyqC1JQQA==
X-Received: by 2002:a05:6402:43ce:b0:461:2288:6808 with SMTP id p14-20020a05640243ce00b0046122886808mr27684361edc.21.1674491365637;
        Mon, 23 Jan 2023 08:29:25 -0800 (PST)
Received: from [192.168.1.101] (abxi24.neoplus.adsl.tpnet.pl. [83.9.2.24])
        by smtp.gmail.com with ESMTPSA id 24-20020a170906329800b0087190b479c4sm10922617ejw.43.2023.01.23.08.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 08:29:25 -0800 (PST)
Message-ID: <9e69f980-658e-0f06-a2d6-893ad3637d3f@linaro.org>
Date:   Mon, 23 Jan 2023 17:29:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8450: drop incorrect cells
 from serial
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230123125612.154840-1-krzysztof.kozlowski@linaro.org>
 <20230123125612.154840-3-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230123125612.154840-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23.01.2023 13:56, Krzysztof Kozlowski wrote:
> The serial/UART device node does not have children with unit addresses,
> so adderss/size cells are not correct.
> 
> Fixes: f5837418479a ("arm64: dts: qcom: sm8450: add uart20 node")
> Fixes: 5188049c9b36 ("arm64: dts: qcom: Add base SM8450 DTSI")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> Changes since v1:
> 1. None
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index d66dcd8fe61f..395a3a156e24 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -1017,8 +1017,6 @@ uart20: serial@894000 {
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&qup_uart20_default>;
>  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
> -				#address-cells = <1>;
> -				#size-cells = <0>;
>  				status = "disabled";
>  			};
>  
> @@ -1411,8 +1409,6 @@ uart7: serial@99c000 {
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&qup_uart7_tx>, <&qup_uart7_rx>;
>  				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
> -				#address-cells = <1>;
> -				#size-cells = <0>;
>  				status = "disabled";
>  			};
>  		};
