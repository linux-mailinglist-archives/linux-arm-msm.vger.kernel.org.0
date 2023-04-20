Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF6506E90A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 12:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234637AbjDTKp1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 06:45:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234676AbjDTKpJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 06:45:09 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4809A4EE3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:44:06 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4edcdfa8638so462665e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681987441; x=1684579441;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e6ih+HsH0pAp9Q3/f2wnWH7H46pTLR3yfHB28WjWmHU=;
        b=eEb/8ENhqxVaL5RWRxzdRNXVnDqx8ZRK1B5BHdnom3vImjJD4A0HeQaAr9JIKKYL7F
         iJDeOJe3VMeRi62Cav7vIIVUI6uKD6/v+41Tyokwnn6Y0kEqGm4SRlBsv0Dn0/X7WTyK
         j6gPSWHgAVjbwpsVDpzWWUd1Smq+eYjAdXvzzoGl1xn1LR4e+ha3Ny7S00Hg5TvEOYK5
         IyYQ79Y/ZF+eQI+tpLnes4p5FBvYflSg7bkzlJ41kjidXmSNg9XYyNVkPolGAVOXlwp3
         19N71bCwGDNXEm1I/2ZNVKIcq4kwlPzrL+YpgGMrG5QIdjo03S0ONDtMhteKfEIPwM+F
         4/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681987441; x=1684579441;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e6ih+HsH0pAp9Q3/f2wnWH7H46pTLR3yfHB28WjWmHU=;
        b=ONHw47VA/FvxDOyxhBCCKpDhmsZnqceYOE89xlt6icqJ1bS7LGg2P+OVraG1uow6+M
         d8Qceji73+QbYzyCcimDiRdqhR4Xel/j+AzAPaoc7MG02MAmA1CLhv6TRg9Ix1lF8uNm
         pP9Ym62lbdlWy8aTw65GysU9hY7Scw9m4OH4Q5uVGujy2LG1liSC4b/brp7N2/Q5q1aE
         Vhi3nwtcvLEqdzAWZ7WAbI+j+Jhg2SRyCbChtnJcCuJ/a5hhdZpYLw6nVsClEpISnZ2t
         5OISrKkhNEJh1uSd6/bGItP0GWCrGTIPcvWn632oZxSIatB0o7DWVvnMq9hh5clPOvn+
         43FQ==
X-Gm-Message-State: AAQBX9eN6J/Csr0fBwquGz84LThOyWFF1WFoGWhi4/j1ntj2/wcyCQJ/
        QYU8W4LuQ7tpcoSJvNnSSFGFjw==
X-Google-Smtp-Source: AKy350bOaV0BjDP+/jBPZmy/TkbbV3Py1QgzX3747RA5qDjEJdn2/yjMBmnoBEETw08/gvVHKeR3pA==
X-Received: by 2002:ac2:41cf:0:b0:4ea:f632:4738 with SMTP id d15-20020ac241cf000000b004eaf6324738mr275834lfi.6.1681987440972;
        Thu, 20 Apr 2023 03:44:00 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id f11-20020ac2508b000000b004ec634b0e26sm172971lfm.307.2023.04.20.03.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:44:00 -0700 (PDT)
Message-ID: <1ef2e4ae-0be2-30c5-679d-f49f33929282@linaro.org>
Date:   Thu, 20 Apr 2023 12:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] ARM: dts: qcom: msm8974: drop unit addresses from USB
 phys
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230420065318.23503-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230420065318.23503-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.04.2023 08:53, Krzysztof Kozlowski wrote:
> The ulpi node does not allow children to have unit address:
> 
>   Warning (unit_address_vs_reg): /soc/usb@f9a55000/ulpi/phy@a: node has a unit name, but no reg or ranges property
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> Actual way of fixing it depends on bindings change, so apply only if
> bindings got Acked/Reviewed:
> https://lore.kernel.org/linux-devicetree/20230420065051.22994-1-krzysztof.kozlowski@linaro.org/T/#u
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 6310f635197f..939449a0c695 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -676,7 +676,7 @@ usb: usb@f9a55000 {
>  			#reset-cells = <1>;
>  
>  			ulpi {
> -				usb_hs1_phy: phy@a {
> +				usb_hs1_phy: phy-0 {
>  					compatible = "qcom,usb-hs-phy-msm8974",
>  						     "qcom,usb-hs-phy";
>  					#phy-cells = <0>;
> @@ -687,7 +687,7 @@ usb_hs1_phy: phy@a {
>  					status = "disabled";
>  				};
>  
> -				usb_hs2_phy: phy@b {
> +				usb_hs2_phy: phy-1 {
>  					compatible = "qcom,usb-hs-phy-msm8974",
>  						     "qcom,usb-hs-phy";
>  					#phy-cells = <0>;
