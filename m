Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3954745BAB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 13:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjGCLxI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 07:53:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbjGCLxH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 07:53:07 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CCBDE8
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 04:53:06 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b69ea3b29fso68738431fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 04:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688385185; x=1690977185;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQK/EgphHo8VcPndBLz2Bcr8GGWlz7K8hpgCL5Xo65A=;
        b=E9Z+nFDvN5K9W1IjTPxG4FHIFOG0PpEFUL5BntL8uLoi8LjKQ36Id44Mh2DO+JewQj
         GoX4B6EY3fMoxgNfvMLfykuZpV+P8kCSVeibq2h//vuT9uVJYH8R9skJ0i7WHszNYYzM
         N0cihmusiehVqnOG/w9XhNZth9gpuZdO8j0lKoxByUTOu6+vd9zkqJKfwNrBNECzQDaT
         kTq68UJS/+uDsMuOXX2CBazKM9YFlm+lRh5kzCUMBKBWxXECBrwQ0YEvMbnWuGRE3tJ+
         ytpsiheOYi3RSAJosLoDcGNqFbZLYLevcPEDFCTanQesBhNn6+hjgPhLyMeX8ecXSuvu
         xBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688385185; x=1690977185;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQK/EgphHo8VcPndBLz2Bcr8GGWlz7K8hpgCL5Xo65A=;
        b=PWV1eIw8zukP+XUkVMFDXs+EV2UhD42Ya7LbYNKDUvTxIqa0iE9nvPMYEvS+w/AqEm
         DjcKqSrV4mKSd7lfHc4XmFCWkX2Xh/WqxgDC9rxv0JGXbjqO5XzN5XqByVZGk1ZIB6oS
         SyswBaiopDW9h3sQFbFcok6AhvhNbid78IHFAm29Np8gWQ8w4METrldVGRpQ05e/a2iU
         fMYbWpjia2ASYvuYx0DZwXbmTQzcOz61DXjT32KO9dJMiOtay9xU9uExxiVnSRiGqXkO
         tN2ly6DnqirjpkXEl93q+iOEQzT7m8CbU4H8rc3b/7mtfDqg+AsTO6gQ6/De/0reUO3d
         V3kw==
X-Gm-Message-State: ABy/qLaJmhBzVGXMW2IOhY9F7UHOfAXx4eOfQcw+5s54BOH9xFFFCAuu
        oJiqSVrijwrplAVJfZk4LUFYBg==
X-Google-Smtp-Source: APBJJlFIBoe3UgDn2QrbGHb9cv9iG4mqHI4wJNpXNGoOw/iaJzl/MibNEc/5nYnSZheOtRCNid5S6w==
X-Received: by 2002:a05:6512:2115:b0:4fa:3a0:2257 with SMTP id q21-20020a056512211500b004fa03a02257mr5840494lfr.5.1688385184783;
        Mon, 03 Jul 2023 04:53:04 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id i26-20020ac2523a000000b004fba5fc7ed8sm1940695lfl.278.2023.07.03.04.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 04:53:04 -0700 (PDT)
Message-ID: <165cc1e2-5604-3ae5-b303-fdfe8119bfcd@linaro.org>
Date:   Mon, 3 Jul 2023 13:53:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 19/27] ARM: dts: qcom: pm8058: use defined IRQ flags
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
 <20230702134320.98831-20-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230702134320.98831-20-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2.07.2023 15:43, Dmitry Baryshkov wrote:
> Use symbolic names for IRQ flags instead of using the numeric values.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/pm8058.dtsi | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/pm8058.dtsi b/arch/arm/boot/dts/qcom/pm8058.dtsi
> index 913a511719fa..3683d7b60918 100644
> --- a/arch/arm/boot/dts/qcom/pm8058.dtsi
> +++ b/arch/arm/boot/dts/qcom/pm8058.dtsi
> @@ -12,7 +12,8 @@ pwrkey@1c {
>  			compatible = "qcom,pm8058-pwrkey";
>  			reg = <0x1c>;
>  			interrupt-parent = <&pm8058>;
> -			interrupts = <50 1>, <51 1>;
> +			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
> +				     <51 IRQ_TYPE_EDGE_RISING>;
>  			debounce = <15625>;
>  			pull-up;
>  		};
> @@ -61,7 +62,8 @@ pm8058_keypad: keypad@148 {
>  			compatible = "qcom,pm8058-keypad";
>  			reg = <0x148>;
>  			interrupt-parent = <&pm8058>;
> -			interrupts = <74 1>, <75 1>;
> +			interrupts = <74 IRQ_TYPE_EDGE_RISING>,
> +				     <75 IRQ_TYPE_EDGE_RISING>;
>  			debounce = <15>;
>  			scan-delay = <32>;
>  			row-hold = <91500>;
> @@ -135,7 +137,7 @@ rtc@1e8 {
>  			compatible = "qcom,pm8058-rtc";
>  			reg = <0x1e8>;
>  			interrupt-parent = <&pm8058>;
> -			interrupts = <39 1>;
> +			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
>  			allow-set-time;
>  		};
>  	};
