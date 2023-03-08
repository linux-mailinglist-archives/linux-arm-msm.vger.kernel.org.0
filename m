Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 069D96B0381
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 10:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbjCHJ6J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 04:58:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbjCHJ6H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 04:58:07 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A89F8231E3
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 01:58:05 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id h3so15950956lja.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 01:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678269484;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tv/8YOLiQRoypHIqyZmgFR2uGkDG18nd8saVW6UuBcY=;
        b=LJX9LcrK1wiUKZBc+oOQm9vzteSDXpcd8ybi5xlXfvwCc3ZoWEG6V4SUGKsGRXWkGW
         kV/EPA4mNr80Y5aCaZx2Kdkh8fOiKNlX2W+F/fWCn78dYjeIcun2WQ0o2+t7k33B9VSl
         GPbWqahSEU8fTD+hSwNeZffUQPupggmwXuL93Mf5ML+xhPRbbV8ju3/yBMhAHXSvISR/
         aEGPOulV5rutp6RI+M8KDKgrITOWHI1IqbbJYuS6e/JWUXAIvOMvew8I2czUEl8O44Qe
         wHKZz0kbnUhNFU4swQnoktUtZYsLAxlYNFGaTZhZZg9i7ImTYb92XXQT/odvYfc376tf
         r2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678269484;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tv/8YOLiQRoypHIqyZmgFR2uGkDG18nd8saVW6UuBcY=;
        b=m6CT4PxMtKznkNXYcIcsgN3jFjFTsechwqRq6XNWXTJb6F2bvR6dU9oaDjKCX9qdG9
         pmbgi5UiYxYgSXju3rIEHfD/yeK9Ebe9F62ZUC7YoJjCF2HdvpmWDmyQlCrnxRIR4T+D
         D/2VhLX9lGV4ZEwJuGMFqUYTyP+tAqGE8qBji6XJZ80hTuIM0SQI27/ft+fUY/8vXhAb
         Tu++WeWQznFka/ndDQpzGdbPgyHTj80SwQla+XAQstBhWM9r0KDpQ7lJhcLE0mplkJx5
         OR2tqJzN7+U8oCOvVk+eFkPj1EmnLvIIbje0h7/i0yakpoWEeoE51KzNb5H1YxY3Glcw
         +uSg==
X-Gm-Message-State: AO0yUKW5TpizM0q+2p8/2oDpyCBSTSEscA6Pzkd0NLB9DrfytFSUbVo8
        vNuVh+xoo75h/2wvQN08fUiLRQ==
X-Google-Smtp-Source: AK7set+JHvejSD/1BhfGK57zWfMjqghF0kSklXO9qmSdj9gDiIvICaJwl5ykJjsVRW0bCJTa7avihQ==
X-Received: by 2002:a05:651c:92:b0:295:9d2c:c967 with SMTP id 18-20020a05651c009200b002959d2cc967mr5628634ljq.23.1678269483971;
        Wed, 08 Mar 2023 01:58:03 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id m16-20020ac24290000000b004e1b880ba20sm2284345lfh.292.2023.03.08.01.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 01:58:03 -0800 (PST)
Message-ID: <83a8caff-2bfa-3a82-eac3-3b4568d477ae@linaro.org>
Date:   Wed, 8 Mar 2023 10:58:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8550: fix qup_spi0_cs node
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230308-topic-sm8550-upstream-dt-fixups-v1-0-595b02067672@linaro.org>
 <20230308-topic-sm8550-upstream-dt-fixups-v1-2-595b02067672@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230308-topic-sm8550-upstream-dt-fixups-v1-2-595b02067672@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.03.2023 09:32, Neil Armstrong wrote:
> The node is incomplete and doesn't need a subnode, add the missing
> properties and move everything to the root of qup-spi0-cs-state node.
> 
> Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index fe8b92954550..c25c68257412 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2807,10 +2807,10 @@ qup_i2c15_data_clk: qup-i2c15-data-clk-state {
>  			};
>  
>  			qup_spi0_cs: qup-spi0-cs-state {
> -				cs-pins {
> -					pins = "gpio31";
> -					function = "qup1_se0";
> -				};
> +				pins = "gpio31";
> +				function = "qup1_se0";
> +				drive-strength = <6>;
> +				bias-disable;
>  			};
>  
>  			qup_spi0_data_clk: qup-spi0-data-clk-state {
> 
