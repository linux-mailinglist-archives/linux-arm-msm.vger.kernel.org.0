Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE2359E679
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 18:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243986AbiHWQCg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 12:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244610AbiHWQBQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 12:01:16 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58A615C35E
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 05:12:55 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id q18so12299114ljg.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 05:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=RqLntbgr87ZXnDAaGtw56/VeicV3/dPpzlNFnX4+aVo=;
        b=tFQYXO1T4mol7WFkzuOQYwrk3X8YwKTb6/JwVTkfkEtSD4Vp/BsSh/GHX6Vk5VYKwC
         jqKoUas/15Z9Ye93D7jFhIB/7nqolvpCOqZjuzzBKXSpRHIyOaFLGLy5elltR2u8/389
         6bxn7zmwXr/sQ6MgFTDq14912utQtYMszXysgQTiX3lUe6S4WGoZcGe0UVCgFppLU8kh
         QWsNuylFBrq1CIV3PCv0zGh9IazKP1TeqVlzRzpQcmUjP26H61UeJpERVNNGmntnD9kS
         aSzuCLQNDe/2HWH/nCxNJOHbnuJMOKJBaasg0AtOBI5eIaBl/eTUYa11DvTWUuiZ/XyR
         3XFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=RqLntbgr87ZXnDAaGtw56/VeicV3/dPpzlNFnX4+aVo=;
        b=Au0ZnuvmUdFNTRaMp58Aap/LOrs7mNVrVItgpNM7ptIYuu+TpThGV585TFBMB9NpPA
         xhztov4qClGC6LCKzsSnAIywnIts7SqliXTef62rRFi1aMRHcV3PaRoOi+jleGGmHjNt
         2SeZhXOrxzj2S96Si0z7nmvx5dzfTU+hWZE0J/cw9aIYX++H3+lZmS6bHoLhg3SsZaLT
         zX0wA67OmfBCViMFaFEsJIJ5wQE6v9sqTQe+rbiWA9GkRMt5ezvpQv0e8TQDSE8QlQkf
         Gj+KELZhplDls/Sppn5dKrJHFI69A+0luvqrZIT++jDfN3Mb0rgh14uLIWmX6XXNHhq4
         ypNg==
X-Gm-Message-State: ACgBeo3QAwXZ/8Xd/USZbYS4n1l3L/oKKVULTCmzVJ2bY3ZwHY1On4vw
        BDC1qYoyJepwcYmCFsbmX5uQiQ==
X-Google-Smtp-Source: AA6agR46X1sh2j6PKuZuWumqRDe2v/sHRPCwmJHJpxnSwPfHmlc8KCq7q6VF6F+arn9+fqoEAdZjqA==
X-Received: by 2002:a05:651c:10cf:b0:261:cbd0:1c06 with SMTP id l15-20020a05651c10cf00b00261cbd01c06mr3071605ljn.278.1661256749636;
        Tue, 23 Aug 2022 05:12:29 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id y25-20020a056512045900b0048a8b6914d2sm108380lfk.155.2022.08.23.05.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 05:12:29 -0700 (PDT)
Message-ID: <9022126c-2cd7-44c9-28dc-338e36a3346d@linaro.org>
Date:   Tue, 23 Aug 2022 15:12:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] arm64: dts: qcom: pm8916: Fix pwm declaration
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220822120300.2633790-1-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220822120300.2633790-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/08/2022 15:03, Bryan O'Donoghue wrote:
> We need to define pwm@bc000 to stop dtbs_check from making the following
> complaint, text pruned.
> 
> pmic@1: 'pwm' does not match any of the regexes:  'pwm@[0-9a-f]+$'
> 
> Fixes: e79a1385ab74 ("arm64: dts: qcom: Add LPG to pm8916, pm8994, pmi8994 and pmi8998")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8916.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> index 606c2a6d1f0fc..d6922379729cb 100644
> --- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> @@ -124,7 +124,7 @@ pm8916_1: pmic@1 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -		pm8916_pwm: pwm {
> +		pm8916_pwm: pwm@bc00 {
>  			compatible = "qcom,pm8916-pwm";

This does not look like proper fix.
1. It requires a reg.
2. reg is not allowed by pwm bindings.

See also other wrong commit:
https://lore.kernel.org/all/20220719205058.1004942-1-bhupesh.sharma@linaro.org/


Best regards,
Krzysztof
