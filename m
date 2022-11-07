Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB86161EFC5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 10:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbiKGJ6d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 04:58:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231602AbiKGJ6c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 04:58:32 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A3C63AD
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 01:58:31 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id x2so16666533edd.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 01:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUa6HW68fheuL+kIhQiIAAuFJdv0M0P61DVZhNzckog=;
        b=ueUMFBOUv+MW7vv1rRBzfEBo1f9GE2Dv4dP2W4/HCQ3tg8U/CtyfoO7EOeq5meiFLF
         qF48np9Oa1heFZeCPJXBvRJEdJ0A05lI37HtFZ5mGqX5ttwTiylQDL7PbJ+zhI9pb7bO
         jAYCuF8JEmK6ynje/lFKGYRaMIRe9la16zmou41A1m146s8B+cMlPkYI8ZBoo8yfDij5
         rWEife5V4Aaey0etZAuP5bF21hv1VibFsSXEnX2jnTFLlLn4X9MEzjLHAVB66dHzqHuz
         +1H+a9FU89ETx5pPqeozEbX2JRL0CBDodvEe+/9ufPeFHhMyR55/QpahrPlZT2EEv3gl
         wiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NUa6HW68fheuL+kIhQiIAAuFJdv0M0P61DVZhNzckog=;
        b=eLWVe6xquDf3liGLqj26xaxWEZSHjhlDNoRnOnuhFo3MScjGkavlC9kYApfbHZHBXR
         Uc85Qf1LSUVHA9HmJ4memt64PbPNnS+6Mzpo1zW9YuPE9Pew/qYeUw3V44KGbGZdqF6e
         R00EkvVypaSaQK8LwqLr0i9kMLH3Zi7b9I7lsW3QS7UeAl0sYP3qCFeZcv27Rua2WeSS
         mE1jUGuabk34LFob9pk7PH8DH8kF5BWertJKF2elN1RHpHBHdxi4x1MnP9DWpaWdwa+i
         K38IppE/bRhn7zTxuQNDi/B1guWe05ZL7GjICwyPCu8Y+BeDahKxnuQEiFi/b5BkJGHA
         JoOg==
X-Gm-Message-State: ACrzQf1ZZGo2pzj1ZLhdLLbw1hwNO4Mf+SRws1Gu6WURi15ZhQnVqDm5
        iCh10OjwRfOGGflo9WpGdFe+tg==
X-Google-Smtp-Source: AMsMyM7iRFWJbt1Gs3mcIM8sFNhwkhYTdsX5B2ky4KtAaU+8LM2K4nCYRUBufOIb33TUNQz8fXIOHg==
X-Received: by 2002:a05:6402:12d1:b0:463:3f0c:be02 with SMTP id k17-20020a05640212d100b004633f0cbe02mr42942541edx.239.1667815109461;
        Mon, 07 Nov 2022 01:58:29 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id q8-20020aa7da88000000b004619f024864sm3908353eds.81.2022.11.07.01.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 01:58:29 -0800 (PST)
Message-ID: <8dcc223d-48ab-f11d-5cc3-7fe129b9186d@linaro.org>
Date:   Mon, 7 Nov 2022 10:58:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 2/3] arm64: dts: qcom: hk10: use GPIO flags for tlmm
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221107092930.33325-1-robimarko@gmail.com>
 <20221107092930.33325-2-robimarko@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221107092930.33325-2-robimarko@gmail.com>
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



On 07/11/2022 10:29, Robert Marko wrote:
> Use respective GPIO_ACTIVE_LOW/HIGH flags for tlmm GPIOs instead of
> harcoding the cell value.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

KOnrad
>   arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
> index 262b937e0bc6..651a231554e0 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
> @@ -5,6 +5,7 @@
>   /dts-v1/;
>   
>   #include "ipq8074.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>   
>   / {
>   	aliases {
> @@ -39,12 +40,12 @@ &blsp1_uart5 {
>   
>   &pcie0 {
>   	status = "okay";
> -	perst-gpios = <&tlmm 58 0x1>;
> +	perst-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
>   };
>   
>   &pcie1 {
>   	status = "okay";
> -	perst-gpios = <&tlmm 61 0x1>;
> +	perst-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
>   };
>   
>   &pcie_phy0 {
