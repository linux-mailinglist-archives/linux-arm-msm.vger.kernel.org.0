Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE1A745BB1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 13:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbjGCLyN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 07:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjGCLyM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 07:54:12 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81A5C9B
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 04:54:11 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso3507149e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 04:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688385250; x=1690977250;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bXNzRd3jR5JPFmpeTiXWdVfFXAjxU+F5vLbqYF9b+/8=;
        b=oYn14Z7Ibwkul7KPYWZeUcbnpKKX/F+FFhzC1vfBC6FT0itpam8xVxU6UgVFhOYB5B
         QHg5sq8MlOb3MNSHUzkkTCKrSrQgp/E4zY2P+B/JBq+nm5uMgUlf6I+rA0Y6dP9ZcUUF
         yQtspkwaUDZC9gu8158mT3jdjPdNHjxkfhHKeGc4lP6S2uNMk4wADugpw/6Fxdv8tY88
         0qIHZGMuL8vIzrT5lf/6Hk2RvfzL/oQ78usVog2Pjq2vSMZV7oi4Rdqxsh0oEQkG9eDj
         uzK5lM0PMFF9sWEUYkuCMdkC+jEltH4tAdvQ6wxEyeEYw8EcD68pAgVXaa8tS2r88/U7
         K1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688385250; x=1690977250;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bXNzRd3jR5JPFmpeTiXWdVfFXAjxU+F5vLbqYF9b+/8=;
        b=XqASUThpGwITynT0Imy5AvmGV++Zp0kaDkuemsYtXdoWUwaLaoqGJhXysec3JrhI89
         1QkndSVvIxrkgKe4LX0yC01lTvgyHPtRuthUwpNtj71RXifn8BWmhscJ/bKxn4VW2P4Z
         g6t0TzZ6b9eimVglmt6Sq2z5mQBXOigsUpo6WYOB8lF8PJ8FE1gZwmybUApow8djJCuB
         PUboRVtCcSi0bCM751kNJCQvzU5+WgQCQs1IUzE2fIBOtDL8TtPL9DHomGZXAsllok5Z
         1+Z3jawPTu7dDujfuHhe9uqY4t96F8I9qgaIYBwQ1NNak25YcVXzibUYpB0TIXAYYwNe
         607w==
X-Gm-Message-State: ABy/qLZaPngxmLK2DhkMyqd2RQEHbr9WqLQf054HHLIT0ni8102iqPUm
        A37dJQd60VD4fLvsoS0c6PCoDg==
X-Google-Smtp-Source: APBJJlGGpcU0CVrLkKNj6VTl3fcyaH8gB9svHaSByztWdsn5cjniHPgxrb5zbhxcL4Tks/rRyN1tEw==
X-Received: by 2002:a05:6512:360a:b0:4f7:55e4:4665 with SMTP id f10-20020a056512360a00b004f755e44665mr5759684lfs.56.1688385249861;
        Mon, 03 Jul 2023 04:54:09 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id r11-20020ac25a4b000000b004fb7da93c24sm3340292lfn.273.2023.07.03.04.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 04:54:09 -0700 (PDT)
Message-ID: <115b2e2d-f2b2-f96b-a586-3bcbaee47586@linaro.org>
Date:   Mon, 3 Jul 2023 13:54:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 22/27] ARM: dts: qcom: pm8058: switch to
 interrupts-extended
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
 <20230702134320.98831-23-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230702134320.98831-23-dmitry.baryshkov@linaro.org>
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
>  arch/arm/boot/dts/qcom/pm8058.dtsi | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/pm8058.dtsi b/arch/arm/boot/dts/qcom/pm8058.dtsi
> index 3683d7b60918..984b79777984 100644
> --- a/arch/arm/boot/dts/qcom/pm8058.dtsi
> +++ b/arch/arm/boot/dts/qcom/pm8058.dtsi
> @@ -11,9 +11,8 @@ pm8058: pmic {
>  		pwrkey@1c {
>  			compatible = "qcom,pm8058-pwrkey";
>  			reg = <0x1c>;
> -			interrupt-parent = <&pm8058>;
> -			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
> -				     <51 IRQ_TYPE_EDGE_RISING>;
> +			interrupts-extended = <&pm8058 50 IRQ_TYPE_EDGE_RISING>,
> +					      <&pm8058 51 IRQ_TYPE_EDGE_RISING>;
>  			debounce = <15625>;
>  			pull-up;
>  		};
> @@ -61,9 +60,8 @@ pm8058_led133: led@133 {
>  		pm8058_keypad: keypad@148 {
>  			compatible = "qcom,pm8058-keypad";
>  			reg = <0x148>;
> -			interrupt-parent = <&pm8058>;
> -			interrupts = <74 IRQ_TYPE_EDGE_RISING>,
> -				     <75 IRQ_TYPE_EDGE_RISING>;
> +			interrupts-extended = <&pm8058 74 IRQ_TYPE_EDGE_RISING>,
> +					      <&pm8058 75 IRQ_TYPE_EDGE_RISING>;
>  			debounce = <15>;
>  			scan-delay = <32>;
>  			row-hold = <91500>;
> @@ -136,8 +134,7 @@ ref_muxoff: adc-channel@f {
>  		rtc@1e8 {
>  			compatible = "qcom,pm8058-rtc";
>  			reg = <0x1e8>;
> -			interrupt-parent = <&pm8058>;
> -			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
> +			interrupts-extended = <&pm8058 39 IRQ_TYPE_EDGE_RISING>;
>  			allow-set-time;
>  		};
>  	};
