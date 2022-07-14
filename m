Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89BE55749BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 11:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbiGNJzw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 05:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234453AbiGNJzu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 05:55:50 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3024C606
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:55:49 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bu42so2001575lfb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ex1g5I3eoUQJiOv3dD/PtghCfWhfsmio59xIVAgsJyY=;
        b=bmzEn0AeCHc/TY+avf9KtSU84quEoJL6dmZlyUsuE0l2pZ6iCM/BC8laeeCstgT9pF
         6SuM+wf7pbB7EHkdZTxAJSQW3EDljFcfoY0XrO3BL+1WsFbqMBJ1pXgBrSIw0KbMKPBo
         eOVjl7b0vbvcAnWL/6RJ7nuK2yoiNr2FiwPo5KoXj4p1VGeUMgkYdQiuez71ryLmW8sU
         p7z+1mi7ap9rqEngJm0sdJLZPAU1RnOzVKLqr5aD1l20eYaeKKV3rzHFUbQVP4ZdFEat
         RbVn0mwzV4zuhaPcXwN6ds/oRg/V566TJIkgcxPRYO6fJ2NOv8QxCswHrsRW684j9zU1
         QacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ex1g5I3eoUQJiOv3dD/PtghCfWhfsmio59xIVAgsJyY=;
        b=sUDAubGdFNyllbqD2mXIBFNKEQ0IGw4ZUxleRIb/HgK0yzHrF95ubvVX2pHiC2euHv
         11YK8BBRif610JABudD5r+X6u5JWE9xGKkIm+yTAbPC07fOHnEsT4+3/f4itT5RxU6x+
         xaoNFkJXtcCS2Gv5KpgD3y6k+kCQpIESFxX7tafMaorrQ7comgCT1QlhafgDGYUADURU
         P4rDWbfKC0hoP/y2KibStq69wTTGCqd3iSgAOKsYlI5G8HYG7WUFMRzmIgFBu6ENHG/2
         uUHgGIslovQFkZpSD7IcZryydQM5btwa1GEYljWSRHJ4UIGeTL8gaKVk9M9azTYZhU4y
         282Q==
X-Gm-Message-State: AJIora/K6VhMxJkTmx9RnLV40uwNVqgKc55GzwTOCeNcZYPEp/Z059dO
        RQdoCrwHb+hQO19uImh0Yv6+cQ==
X-Google-Smtp-Source: AGRyM1v6vyxwV1p3JiIAymxRsWpbXrpoNMXbQ26YuOQ8MllzgRe7lttKQ9LdNJ2m25DT//EHrOx7+w==
X-Received: by 2002:a05:6512:3f27:b0:47f:a079:eeec with SMTP id y39-20020a0565123f2700b0047fa079eeecmr4530678lfa.46.1657792547841;
        Thu, 14 Jul 2022 02:55:47 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id s13-20020a056512214d00b0048110fd06c4sm272282lfr.53.2022.07.14.02.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:55:46 -0700 (PDT)
Message-ID: <bcb1e0ec-f0b7-ce45-a63f-7272c1f398c9@linaro.org>
Date:   Thu, 14 Jul 2022 11:55:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/6] ARM: dts: qcom: msm8974: Disable remoteprocs by
 default
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
 <20220712124421.3129206-4-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712124421.3129206-4-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/07/2022 14:44, Stephan Gerhold wrote:
> The remoteproc configuration in qcom-msm8974.dtsi is incomplete because
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 814ad0b46232..35246bd02132 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1172,6 +1172,8 @@ remoteproc_mss: remoteproc@fc880000 {
>  			qcom,smem-states = <&modem_smp2p_out 0>;
>  			qcom,smem-state-names = "stop";
>  
> +			status = "disabled";
> +
>  			mba {
>  				memory-region = <&mba_region>;
>  			};
> @@ -1639,6 +1641,8 @@ remoteproc_adsp: remoteproc@fe200000 {
>  			qcom,smem-states = <&adsp_smp2p_out 0>;
>  			qcom,smem-state-names = "stop";
>  
> +			status = "disabled";
> +
>  			smd-edge {
>  				interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
>  
> diff --git a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
> index 58cb2ce1e4df..8a6b8e4de887 100644
> --- a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
> @@ -147,10 +147,12 @@ wcnss {
>  };
>  
>  &remoteproc_adsp {
> +	status = "okay";

These go to the end of properties.

>  	cx-supply = <&pm8841_s2>;
>  };
>  
>  &remoteproc_mss {
> +	status = "okay";

Ditto

>  	cx-supply = <&pm8841_s2>;
>  	mss-supply = <&pm8841_s3>;
>  	mx-supply = <&pm8841_s1>;
> diff --git a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
> index d6b2300a8223..577cbffad010 100644
> --- a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
> @@ -457,10 +457,12 @@ fuelgauge_pin: fuelgauge-int-pin {
>  };
>  
>  &remoteproc_adsp {
> +	status = "okay";

Ditto

>  	cx-supply = <&pma8084_s2>;
>  };
>  
>  &remoteproc_mss {
> +	status = "okay";
>  	cx-supply = <&pma8084_s2>;
>  	mss-supply = <&pma8084_s6>;
>  	mx-supply = <&pma8084_s1>;


Best regards,
Krzysztof
