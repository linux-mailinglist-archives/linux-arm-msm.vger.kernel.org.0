Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24B58745BAF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 13:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbjGCLxy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 07:53:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbjGCLxx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 07:53:53 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D9EE59
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 04:53:50 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b69ed7d050so68934841fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 04:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688385229; x=1690977229;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y7usuPUVen89FXxQjJ0r6siNHOeEWF2y6IE7I/8VmeU=;
        b=dCC++3vpB9hMLu3VAyG/OXDezHyiCzbfsOmIk0z/Ted+gewjfHrn6XIn32gvObCqga
         FoC9jgY39okPqZO+8TZQMxt73112Dm9kJxMRWsgB6RoNthBY+XkoSIKuGksczHaqkC1l
         5TryykDxsu8BEu+fRz7Ac6t8q39pkIGGuAvFOEOt5VT1s5BSjwTQBYStz9HuQ1aJSbWl
         mpehUi2KeHcDzbvFfaBTZMQHvmmBwF+1H99IzrP5H1h/OHDlPQUysE4mGxBAre5kBMLJ
         oBURRIFkU30xRAJO4O0Nl5LvQGDie4tcbOlKdOgeUsE4Y8IAFB3OYinUt5qgoU2rpvlg
         BLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688385229; x=1690977229;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y7usuPUVen89FXxQjJ0r6siNHOeEWF2y6IE7I/8VmeU=;
        b=Lg8fZX60kqgNWHEOEaJh3ecOBK5t6Vc+uZCNUYmp27OE52KdreTli6/avgo1Sry6du
         F32VQAmGOet+fC+PmTyF5rhJznDllOnGFfSQKnos79eTuX+Pj1puFmosNHOwIIQZe1NG
         AN1zKHXBS6vOWhYzcrjkT4UiU2qQ6aDjyEHv5Fac0dVBD/nFEYUBz+sVXMrerbwo+85Y
         VszK+IPwZveROCxho31zVZ8/qGHI0UY/O1vo6PKdc5vVyuUEsW2z+X4A61aSx6uI4TvX
         zgIBIz8sU2dKizoBVyLJYxZXcrrin3vgGvxB76HPPqnQ0D4xgmbxiBcagouhnGMe56jp
         8pjg==
X-Gm-Message-State: ABy/qLbKHZvyufTNcyxVFJvemIckvZVNXad6Fe4OQzQXxQoB0HWauMnC
        Mey/+GTBJ7QRzUi6PFU4KHyjzg==
X-Google-Smtp-Source: APBJJlH2i4M0RKSeYKmcxCnr6hMmvon9g/f3R6DCZ25ajn483qb0ExK+mEeTBf7aH1BhxQz0mKuxqQ==
X-Received: by 2002:a2e:978e:0:b0:2b4:79c3:ce04 with SMTP id y14-20020a2e978e000000b002b479c3ce04mr5988618lji.50.1688385228929;
        Mon, 03 Jul 2023 04:53:48 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9556000000b002b6daf32c7csm1848580ljh.97.2023.07.03.04.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 04:53:48 -0700 (PDT)
Message-ID: <cde2d5e2-88b6-04c3-187c-c2110df741d9@linaro.org>
Date:   Mon, 3 Jul 2023 13:53:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 21/27] ARM: dts: qcom: pm8018: switch to
 interrupts-extended
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
 <20230702134320.98831-22-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230702134320.98831-22-dmitry.baryshkov@linaro.org>
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
> Merge interrups and interrupt-parent properties into a single
> interrupts-extended property.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/pm8018.dtsi | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/pm8018.dtsi b/arch/arm/boot/dts/qcom/pm8018.dtsi
> index 85ab36b6d006..22f3c7bac522 100644
> --- a/arch/arm/boot/dts/qcom/pm8018.dtsi
> +++ b/arch/arm/boot/dts/qcom/pm8018.dtsi
> @@ -18,9 +18,8 @@ pwrkey@1c {
>  			compatible = "qcom,pm8018-pwrkey",
>  				     "qcom,pm8921-pwrkey";
>  			reg = <0x1c>;
> -			interrupt-parent = <&pm8018>;
> -			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
> -				     <51 IRQ_TYPE_EDGE_RISING>;
> +			interrupts-extended = <&pm8018 50 IRQ_TYPE_EDGE_RISING>,
> +					      <&pm8018 51 IRQ_TYPE_EDGE_RISING>;
>  			debounce = <15625>;
>  			pull-up;
>  		};
> @@ -38,8 +37,7 @@ pm8018_mpps: mpps@50 {
>  		rtc@11d {
>  			compatible = "qcom,pm8018-rtc", "qcom,pm8921-rtc";
>  			reg = <0x11d>;
> -			interrupt-parent = <&pm8018>;
> -			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
> +			interrupts-extended = <&pm8018 39 IRQ_TYPE_EDGE_RISING>;
>  			allow-set-time;
>  		};
>  
