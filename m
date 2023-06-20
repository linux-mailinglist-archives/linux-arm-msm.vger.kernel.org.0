Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F46E737633
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 22:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbjFTUlx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 16:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbjFTUlt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 16:41:49 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FCA81727
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 13:41:46 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f769c37d26so6927658e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 13:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687293705; x=1689885705;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wpug8VhRP2/VT+JyFchtkKrbhG9HevQQcX4lce3tENI=;
        b=A8w1ZkT3yNt7CK9O+S/xHjWcZXZWRaXyqeeVkXAxXyovhgWLNM1ItEMiCPYqtab/bC
         0+TyODBzpCQ8pd3o2fyL0LbFo5FADVujEaltjqDI/7ZmaxtcANTLPgiiSwA2LflyQWQ7
         LeCZVZntYY/R0vvZzmryloqVEBhUVxF3EYQbgal69GvlUBnNcWZ1OG1SoVgzxTBPmgoW
         6czDds2ebIbuuNtq40h7Ui5GO4vFM7HNvIYAvDLYm7ziLU+FbHmN4s2rJc8KIQ4yPo4t
         EGDVL2BN1i+cWqKQyHg+mccO0B89S+ZrC7HTDbW8KBjtR/yQK76qWu+TLOoZDdwKb75G
         tENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687293705; x=1689885705;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wpug8VhRP2/VT+JyFchtkKrbhG9HevQQcX4lce3tENI=;
        b=PbojGq8dtwL7HQ/znC9RaQcm6VzcVKSnVgUv3XVHSxruDba844Y/cMvsOzbqXAfmTW
         P7GeosYmjPX8akdj12ILwQBjE3dqry11yMPku3BvF8UQX0A+5WVbOBuo1/b5dzntpCXR
         gDEywDxHFJOrUqsLw3bMBrq7+uzdEqqy8NNuASEbfEUkGXc5qXtEhebuz/0nhwX2FoKQ
         mOHpc+8eS3o7TDknh+GubBcKHdYvGsi+DPBsVH8HcWheSYqbUwujQ0sTbGZLsY1BrLPY
         qRpvx/19m2HMLc6R6yw7XKHFWLpl29Qv/EIhk1Mpn2YbcK3dbTCmESCvZvduI09dZYfU
         exLg==
X-Gm-Message-State: AC+VfDzVPl6SuBkAbWqUB0YGpayMWUXUxU2vdVh6vXmCj+riewprWDpZ
        2ElKuTOpUSR/ODWozNTk0tgS7MaQ4lSr4cN51WM=
X-Google-Smtp-Source: ACHHUZ6yH189W7MFWh7b967M1bIkZVxHQdVxLnp/gfp9Jrxu4e9WfcAfJceB3OgIN1robmhVrBqCuw==
X-Received: by 2002:a19:651b:0:b0:4f9:51b7:a19c with SMTP id z27-20020a19651b000000b004f951b7a19cmr1774132lfb.19.1687293704923;
        Tue, 20 Jun 2023 13:41:44 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id l28-20020ac2555c000000b004f867193f17sm496534lfk.39.2023.06.20.13.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 13:41:44 -0700 (PDT)
Message-ID: <2c068a70-65f7-fb55-a95e-0673fb16cb6f@linaro.org>
Date:   Tue, 20 Jun 2023 22:41:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp-crd: Correct vreg_misc_3p3
 GPIO
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230620203915.141337-1-quic_bjorande@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230620203915.141337-1-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20.06.2023 22:39, Bjorn Andersson wrote:
> The vreg_misc_3p3 regulator is controlled by PMC8280_1 GPIO 2, not 1, on
> the CRD.
> 
> Fixes: ccd3517faf18 ("arm64: dts: qcom: sc8280xp: Add reference device")
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> index b566e403d1db..b21b41a066b6 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> @@ -167,7 +167,7 @@ vreg_misc_3p3: regulator-misc-3p3 {
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  
> -		gpio = <&pmc8280_1_gpios 1 GPIO_ACTIVE_HIGH>;
> +		gpio = <&pmc8280_1_gpios 2 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  
>  		pinctrl-names = "default";
> @@ -757,7 +757,7 @@ edp_bl_reg_en: edp-bl-reg-en-state {
>  	};
>  
>  	misc_3p3_reg_en: misc-3p3-reg-en-state {
> -		pins = "gpio1";
> +		pins = "gpio2";
>  		function = "normal";
>  	};
>  };
