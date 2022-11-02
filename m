Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B68746160F0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 11:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbiKBKg2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 06:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbiKBKgT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 06:36:19 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E712934E
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 03:36:17 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id a14so23871557wru.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 03:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CM8x/Qx9/7RS3amQWGrUYxIRVWFO9lZpv2GsrWNqh4k=;
        b=DX7fI6DTEHCPP/FVpQSEGpuaDtv379glLpKQ99iQOBYWUcuRnqav21lq0Ws5AEai4/
         NeXQskc8/8TfrU4peWK3RUITh1rR7UtvOMi/2YQn/HwelqRQlQ8+MRD25CfDK7+PN1+L
         U2irnsKKYweKZTZuieps9wnV5yNNWwe6G4ytl9GRZtODSnK/T8zlb1KPdpCSy+5duOGf
         wScyrAFvIrVqwoPLidO52ucF8x0maD+Yy171AM+qkGfsJqgoS7o+Fr2nYZA+Bu3YsQpR
         ymp7pdfSkFPGzX6BRLri/PsOpLvgT2kg7IT7EUYQDYfZ9nIo7hGRmEE9zi9SVHbY+Aqk
         WOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CM8x/Qx9/7RS3amQWGrUYxIRVWFO9lZpv2GsrWNqh4k=;
        b=MnnhCKm4P+LReJEtYF/dr9IO2uMqrpj9eNNtabLRFJ5JF9mwCVx9w8TUNr/MCFWhwi
         25LLuPdGJrd7poMzYdJo5od5PO6A67gg3d4sxE7R/9GsDfBzy1YqVo6wQs7vq8iGJCB8
         npelhqwo/4mhdRoT7s5KX4a2ygHJtIdi5jD6hihMW3XwAk1JOPEWq0j8cFUiGfWy7P/n
         gIJ8P74pqsUQFJ0yOC51pwqANiyZFrn83b70PzOJNQaqx/CTMNz8nJCdPMkucZHTzlfr
         GoNj02kV8T8aehxJL+SwFQ/1qd3W5HyVKpgOcisKMECuYcEQkeAOHCcyluHXAFOBeqI3
         5URg==
X-Gm-Message-State: ACrzQf3O8Bz7bvBvuagEAc6hNQJtzYjATtcL45+1zgBPLRhgopnSZU/6
        7nyumkZkyyG5+XBDf6xg/mwX+SIL3fTFZpQL
X-Google-Smtp-Source: AMsMyM4kw9f2DyP33KZdpJA2QqtXKrqv4z8u4KP2BVpfVbsc/7mzK7syC0R11W6S6qsmbbBLyTQxsQ==
X-Received: by 2002:a5d:4f09:0:b0:236:a983:ae5c with SMTP id c9-20020a5d4f09000000b00236a983ae5cmr14099973wru.708.1667385375804;
        Wed, 02 Nov 2022 03:36:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6bae:ac40:a798:cbb4? ([2a01:e0a:982:cbb0:6bae:ac40:a798:cbb4])
        by smtp.gmail.com with ESMTPSA id x21-20020a1c7c15000000b003b492753826sm1539798wmc.43.2022.11.02.03.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 03:36:15 -0700 (PDT)
Message-ID: <46019893-5c27-086b-1a78-90f6ed1e8af7@linaro.org>
Date:   Wed, 2 Nov 2022 11:36:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 3/3] ARM: dts: qcom: pm8941: rename misc node name
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afd@ti.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221031175717.942237-1-luca@z3ntu.xyz>
 <20221031175717.942237-3-luca@z3ntu.xyz>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221031175717.942237-3-luca@z3ntu.xyz>
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

On 31/10/2022 18:57, Luca Weiss wrote:
> The spmi-pmic bindings is now using usb-detect@ for this node, so adjust
> the dts to match.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   arch/arm/boot/dts/qcom-pm8941.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
> index 7a4467e03aa1..863e598591b7 100644
> --- a/arch/arm/boot/dts/qcom-pm8941.dtsi
> +++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
> @@ -27,7 +27,7 @@ pwrkey@800 {
>   			bias-pull-up;
>   		};
>   
> -		usb_id: misc@900 {
> +		usb_id: usb-detect@900 {
>   			compatible = "qcom,pm8941-misc";
>   			reg = <0x900>;
>   			interrupts = <0x0 0x9 0 IRQ_TYPE_EDGE_BOTH>;


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
