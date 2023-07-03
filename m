Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AAEC745B76
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 13:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjGCLqS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 07:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjGCLqS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 07:46:18 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C15CB115
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 04:46:16 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b6c5ede714so52602811fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 04:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688384775; x=1690976775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B6G6Ky/4Q6tdtkuvpD0vESp+VehNcwpR4HNp9O/62/Y=;
        b=ki1XEJ26HqXwyXReNeFunARRos0LLX3LVvMWdfe84Q6SllOzXniFRotaH7/0RkchHd
         aSUmYk4E6vew4tydsaCKiv/ebyrDsoym/xk2lpePJOtmPXLrtA7XD0kQvyxS/WlubS2P
         RZiedoOHKRz3c0K30PvjT3XsgknWRMSBwiBwjn/vnNhlexwHArj0oj5AsbNP//A7qKqS
         Acov8iOZe8olOGL3iQdcn/EISwSz74RT/uswyMEP1L7KVeqZp3mZH+2HCZUKwOmA4yu6
         cCpaL5TdCcq8AlrSz6aD5lQGchdVGAbfqChOY18ynSM4oTnZ/ueDIvncp/qdC6tNT8yt
         Z5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688384775; x=1690976775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6G6Ky/4Q6tdtkuvpD0vESp+VehNcwpR4HNp9O/62/Y=;
        b=Kn6AcjF++HdHiZcUIQExA1C+m7zJNkyvQhAXUEzy9bTm2Z0oywkcQVYAbU4qPHw6D+
         +Tz//T1daCgAEOBJrDZiuPErHzGS4zP8Yp9gtBJSvYPjUtpT2O1gj55dDMq4uzP2/pNP
         D0DeHs2kCvoa3yC3OtyFJ1w/gYHAWZ4lrooaazVRsYNq4LrUJughDIf9Rjod5+Pr3dog
         Fp5i4dBDau4KY+j7GEz3MvHzk9BcTO3Pr1LHVOo0g0tt7901zDBsvO3n1tOIya+JOmqV
         NvzonVfQ28zevNs99PVn6rjyCzL/H86YUwDIZMzj7O2aRvPAL4ydmfnXJk9C2i73wcqz
         7ZOg==
X-Gm-Message-State: ABy/qLZUycKNtkZeVmZn71PA8UPrsS72rXRTPLJbufJS1QtEeRFhiy0i
        CG57c8n1ky0Soyyneb+GqwDnRw==
X-Google-Smtp-Source: APBJJlHPtGZmmmizHCC6N3MEZmPaZfAyhUAp/9tJCgAcKUwm1hAtGjXA1zOCVv/7PXLNbb1Ja0LyIA==
X-Received: by 2002:ac2:4ec7:0:b0:4fb:94c3:5149 with SMTP id p7-20020ac24ec7000000b004fb94c35149mr2996420lfr.31.1688384775056;
        Mon, 03 Jul 2023 04:46:15 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id w14-20020ac2598e000000b004fb7d1149e1sm3373739lfn.290.2023.07.03.04.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 04:46:14 -0700 (PDT)
Message-ID: <e3c508a2-7b66-6be6-5aa9-4aa34aa29465@linaro.org>
Date:   Mon, 3 Jul 2023 13:46:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 07/27] ARM: dts: qcom: apq8064: fix PMIC node labels
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
 <20230702134320.98831-8-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230702134320.98831-8-dmitry.baryshkov@linaro.org>
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
> Change PM8921 node labels to start with pm8921_ prefix, following other
> Qualcomm PMIC device nodes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index 4f4393e11580..5ffb960d09b4 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -332,13 +332,13 @@ scm {
>  	 */
>  	iio-hwmon {
>  		compatible = "iio-hwmon";
> -		io-channels = <&xoadc 0x00 0x01>, /* Battery */
> -			    <&xoadc 0x00 0x02>, /* DC in (charger) */
> -			    <&xoadc 0x00 0x04>, /* VPH the main system voltage */
> -			    <&xoadc 0x00 0x0b>, /* Die temperature */
> -			    <&xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
> -			    <&xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
> -			    <&xoadc 0x00 0x0e>; /* Charger temperature */
> +		io-channels = <&pm8921_xoadc 0x00 0x01>, /* Battery */
> +			      <&pm8921_xoadc 0x00 0x02>, /* DC in (charger) */
> +			      <&pm8921_xoadc 0x00 0x04>, /* VPH the main system voltage */
> +			      <&pm8921_xoadc 0x00 0x0b>, /* Die temperature */
> +			      <&pm8921_xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
> +			      <&pm8921_xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
> +			      <&pm8921_xoadc 0x00 0x0e>; /* Charger temperature */
>  	};
>  
>  	soc: soc {
> @@ -714,7 +714,7 @@ ssbi@500000 {
>  			reg = <0x00500000 0x1000>;
>  			qcom,controller-type = "pmic-arbiter";
>  
> -			pmicintc: pmic {
> +			pm8921: pmic {
>  				compatible = "qcom,pm8921";
>  				interrupt-parent = <&tlmm_pinmux>;
>  				interrupts = <74 8>;
> @@ -749,7 +749,7 @@ pm8921_mpps: mpps@50 {
>  
>  				rtc@11d {
>  					compatible = "qcom,pm8921-rtc";
> -					interrupt-parent = <&pmicintc>;
> +					interrupt-parent = <&pm8921>;
>  					interrupts = <39 1>;
>  					reg = <0x11d>;
>  					allow-set-time;
> @@ -758,16 +758,16 @@ rtc@11d {
>  				pwrkey@1c {
>  					compatible = "qcom,pm8921-pwrkey";
>  					reg = <0x1c>;
> -					interrupt-parent = <&pmicintc>;
> +					interrupt-parent = <&pm8921>;
>  					interrupts = <50 1>, <51 1>;
>  					debounce = <15625>;
>  					pull-up;
>  				};
>  
> -				xoadc: xoadc@197 {
> +				pm8921_xoadc: xoadc@197 {
>  					compatible = "qcom,pm8921-adc";
>  					reg = <0x197>;
> -					interrupts-extended = <&pmicintc 78 IRQ_TYPE_EDGE_RISING>;
> +					interrupts-extended = <&pm8921 78 IRQ_TYPE_EDGE_RISING>;
>  					#address-cells = <2>;
>  					#size-cells = <0>;
>  					#io-channel-cells = <2>;
