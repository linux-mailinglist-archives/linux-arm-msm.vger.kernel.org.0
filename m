Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8D24745BA2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 13:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbjGCLwd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 07:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjGCLwc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 07:52:32 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7D85E8
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 04:52:31 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b69dcf45faso69560861fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 04:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688385150; x=1690977150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=20GlBc85v1FwrTmdhH/mgqthKR06RQ3/X0wm5P3u7x8=;
        b=tF4vbQdgxaofa7U671GBXWM6AT5zR57cpPw+3UKr3fYRL9tQAdsnGDAkoW8azeAxsl
         itpDccL3wysZgG3tN7KzucQ4GY4alTzfADU+mkCW9Q1BHd2/teSv3E7yaHoiJhsVtUuF
         OpR66/kvAu4un/YxE4Up6DHZuYqAOkNtHlRYVXl4lbkHnXRlWVjPxFVKcMcOnL3Cgx1H
         dCaT6MMH0q7BSP8ipMwMWoyxig8vq9c5+Q5bOj0d4y5QG/jFnCUPl1erIXUnEEMaJSaJ
         yBMPHCRD+7Kr938HdWhrs2NeQHUVNjicUjYAV7KKK1O844Ay1o8J1Y7AMe+/Hi4H4jox
         cH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688385150; x=1690977150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=20GlBc85v1FwrTmdhH/mgqthKR06RQ3/X0wm5P3u7x8=;
        b=JlpF31vE0gdSVv2sS1ljf+MnIVQp8/DDAxWBUorSBuT6Pvd1pmvj930cOqOzwoh5tq
         JKMd0Ljdqz55kkOmA6B3ZU9XNVnoVLvtKnziSV2eI9Mol/g6IKW1pDK0HOOmcdDr4yl1
         Qaw6aa1aDWeOSKyQ6wHxfpNGDR4MXquMXRSE+9Lq00ZONXp88geYs/tM7IniGD3atFom
         FmNna1MdMl+o/ULlOcPD5ttUghPVLvKa40gDyz9fljsSmRa62NgGtD8oum1QIx28Dx3a
         KY7vFeRfxBHHHu5iRZNeQKfJIHz3kqnmpbXC32xOs1vzVbVh21eiUlG0In+6EJry39GQ
         G3Gw==
X-Gm-Message-State: ABy/qLYjIbGB7bcCv+P49M8u6xwPXc849F+KLBszXhnQJ0xJS2VVsmgU
        sMEBU97tjFjE2l8uU+TF4GA3LA==
X-Google-Smtp-Source: APBJJlGBrSFw60tfUkOICnu1wP1nGi8gmJ3D0uc5VK3FJjrqczROW7Sc/GcI9CU5f7VNZyF/SNECaQ==
X-Received: by 2002:a2e:8885:0:b0:2b5:80e0:f18e with SMTP id k5-20020a2e8885000000b002b580e0f18emr6735244lji.3.1688385149856;
        Mon, 03 Jul 2023 04:52:29 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id p15-20020a2e804f000000b002b6ad323248sm3828504ljg.10.2023.07.03.04.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 04:52:29 -0700 (PDT)
Message-ID: <779b83d9-eba3-619e-423f-ca6ecfea2055@linaro.org>
Date:   Mon, 3 Jul 2023 13:52:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 17/27] ARM: dts: qcom: pm8018: move reg property
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
 <20230702134320.98831-18-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230702134320.98831-18-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2.07.2023 15:43, Dmitry Baryshkov wrote:
> Move reg property to come after compatible.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/pm8018.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/pm8018.dtsi b/arch/arm/boot/dts/qcom/pm8018.dtsi
> index c602544900b2..85ab36b6d006 100644
> --- a/arch/arm/boot/dts/qcom/pm8018.dtsi
> +++ b/arch/arm/boot/dts/qcom/pm8018.dtsi
> @@ -27,9 +27,9 @@ pwrkey@1c {
>  
>  		pm8018_mpps: mpps@50 {
>  			compatible = "qcom,pm8018-mpp", "qcom,ssbi-mpp";
> +			reg = <0x50>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> -			reg = <0x50>;
>  			gpio-controller;
>  			#gpio-cells = <2>;
>  			gpio-ranges = <&pm8018_mpps 0 0 6>;
> @@ -37,9 +37,9 @@ pm8018_mpps: mpps@50 {
>  
>  		rtc@11d {
>  			compatible = "qcom,pm8018-rtc", "qcom,pm8921-rtc";
> +			reg = <0x11d>;
>  			interrupt-parent = <&pm8018>;
>  			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
> -			reg = <0x11d>;
>  			allow-set-time;
>  		};
>  
