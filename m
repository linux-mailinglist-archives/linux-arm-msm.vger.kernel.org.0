Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C56316AA9B1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 13:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjCDM6h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 07:58:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjCDM6d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 07:58:33 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9D8E1CF66
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 04:58:09 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id by8so5022852ljb.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 04:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677934686;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FYMSRHuwQ2B7MwRzgsUDljDGS2/5eJ+xWvfbQY7oaIc=;
        b=ZpLvFvH5zhAljbMeZiYKIvHzWc0tG0Vdi5QZLtItWn3/QjpxR9HsGVtAtpU8ZzUgCo
         wdAydY7pvJmAygX7FPoe3H689tK2sNsEP7ObNdjCNrfPr+s6/LlN7dUYgntGKM7e1HyD
         R09tvodfghxVnYKxBmE+geUR1P9Fnt2wLAyEGici7elkFZSmPg71JIwYLJwZ4TNvIHiQ
         0YYZjOixo/xqwfBCQ6p2tx8w2Fv39UYN4Nb9H9VO/jO5XxTN1Nx/+Npcgi9n8z4PZoFK
         XezUkw+mrh71gFdu+2ogr7KYWDj6TVCR+vFQtHTaCID7Ph1b19uga0E3XFpOeottTufP
         kLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677934686;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FYMSRHuwQ2B7MwRzgsUDljDGS2/5eJ+xWvfbQY7oaIc=;
        b=h08jvtiMJzLPvz7UA9YRGkVxFEPoBYihLyc/HkYOBj2FjmieWRP6359TJ+IDRIit2B
         6eaC8KvEa4A0B5nZSqRL+KyMMjwYIyHydRIgoLaUXQ8/MW1Oaj0sWZmI2e6G6DHxYPyV
         yx4f6ymEz8kBSjYcFhiC+IXeHrbKqJ1KiAN4H9wbEwQ67T8baHxH5+Hc7Py4NEiFj0Ku
         mzThoZOLJkgzCA4LwkCuAyZVSPSKvV2rLM+BvZOM6tC6b6luM8jAGFBXyc/qC5Za11dP
         hK0vEKy4bDhLTh2bxNnay+eIrIEQosI0ZLjyN2Hnc0KEq1FOGfF/F6r4cFDV+0KvbDQy
         sB+w==
X-Gm-Message-State: AO0yUKWFSnRv0sDEQ4TLASW6hmMQNerBwZYcsyXtA3pO/2EO+HX+4LeW
        4NuFSjZEUi8wa6HVf7qNaUhTmg==
X-Google-Smtp-Source: AK7set+MqSpaYnExC/GfExY9FLU6cDEaWnLREbxw83VXS64ntfpMuRjFjEnxxwZl0iUb6g5sGJz1Mg==
X-Received: by 2002:a05:651c:84:b0:293:4b96:1b6b with SMTP id 4-20020a05651c008400b002934b961b6bmr1480411ljq.25.1677934686555;
        Sat, 04 Mar 2023 04:58:06 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id y26-20020a2e979a000000b002934b5c5c67sm774283lji.32.2023.03.04.04.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 04:58:06 -0800 (PST)
Message-ID: <d05d7005-9c22-4548-0c65-261e575b9195@linaro.org>
Date:   Sat, 4 Mar 2023 13:58:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 8/8] arm64: dts: qcom: sm8250-xiaomi-elish: correct GPIO
 keys wakeup
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230304123358.34274-1-krzysztof.kozlowski@linaro.org>
 <20230304123358.34274-8-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230304123358.34274-8-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4.03.2023 13:33, Krzysztof Kozlowski wrote:
> gpio-keys,wakeup is a deprecated property:
> 
>   sm8250-xiaomi-elish.dtb: gpio-keys: key-vol-up: Unevaluated properties are not allowed ('gpio-key,wakeup' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts
> index acaa99c5ff8b..24fc29f0ee5e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts
> @@ -95,7 +95,7 @@ key-vol-up {
>  			linux,code = <KEY_VOLUMEUP>;
>  			debounce-interval = <15>;
>  			linux,can-disable;
> -			gpio-key,wakeup;
> +			wakeup-source;
>  		};
>  	};
>  
