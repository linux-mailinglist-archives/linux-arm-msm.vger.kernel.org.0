Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70C9067E4B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 13:10:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233425AbjA0MKL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 07:10:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233730AbjA0MJu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 07:09:50 -0500
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14ABC2B087
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 04:03:30 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id u21so4528342edv.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 04:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M/a9I3LIRSC8agto3aucyqpK39VOpxqKC3BVsINP0Zc=;
        b=jgkg/CrqVBcsNRJ3tc0CtB4G6N1t3Kl4cDuN+0xVd0hQIeh9huvmtUw4Sb9B3hmBWQ
         762qTdTLunos6q32cOylKfUwuBuU0NRo6ySJb3+hY16J8IEPJMLJU54/zwFp9Os9l1G4
         PcHyIms+2diOwpdmAjI3n8foo1MHlx6NXJEjsAlgWgfdk3LcvL8PkpV2HmOiEzvp6E+N
         gjnfH/pB8IRHBoZuL6OhmrLzD0JIk8twQbR4klH+YcuyIfqdTl258CZVo7p2D6jXg59v
         +FSel3TUCwJVffxEmzuPxruJbc+MA7zHRkWHspIh2iJfMuoa1FVXVlzn7OuSrJ289xLv
         Uk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M/a9I3LIRSC8agto3aucyqpK39VOpxqKC3BVsINP0Zc=;
        b=Gq2lr15524s9r2TQlM1QpuPTbbFuAP6Mw5OCtOMnWDQAogF8sGEpsB8xBMlcCvigao
         0Ot+qAEDXWWpFVx2+CBk2Q/CT3puq6i37j1qfY4hjKQULKQEAdxAw9PPXukRekTbrVS+
         VLFySfLVJeg62eBB26P0y3uFHWySQIp9c8TDTWMDWqpv0F3S03MBwMCSjKUl/n9LgPKU
         m7RNJnEe3PW/lu1WOTosvSXBw3VK4WZ6WfPAB0S3Dx2wOZen8DI2lLE8nuije3l9nRVF
         YmBsOTOYLQhS5nf3ioO39e3SvGRq7lWN15cJELlmcUTG4oW4Ic44CPtObCwDwNgejY2l
         2a5w==
X-Gm-Message-State: AO0yUKXBQmMCB4vElcM0Um17EpQihIaTSxVGseZ9RQbR0Buag22iGLW2
        drKgpbzHRoM05oaBjBwSQbyYvA==
X-Google-Smtp-Source: AK7set9hFp6A9w6EIN1yid0D1rh/Anzuep95TJOUgaOTGWqGmnF6H9Y9g3h107sqRhCzoI0yoUrgQA==
X-Received: by 2002:a50:ce54:0:b0:4a0:e039:e911 with SMTP id k20-20020a50ce54000000b004a0e039e911mr6044844edj.12.1674820635125;
        Fri, 27 Jan 2023 03:57:15 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709067c0600b008776e2fccfesm2169999ejo.72.2023.01.27.03.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 03:57:14 -0800 (PST)
Message-ID: <277a50ae-deac-0cf0-4023-18376f229137@linaro.org>
Date:   Fri, 27 Jan 2023 12:57:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 09/11] arm64: dts: qcom: sm8250: align RPMh regulator
 nodes with bindings
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230127114347.235963-1-krzysztof.kozlowski@linaro.org>
 <20230127114347.235963-9-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230127114347.235963-9-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 27.01.2023 12:43, Krzysztof Kozlowski wrote:
> Device node names should be generic and bindings expect certain pattern
> for RPMh regulator nodes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts             | 6 +++---
>  arch/arm64/boot/dts/qcom/sm8250-hdk.dts              | 6 +++---
>  arch/arm64/boot/dts/qcom/sm8250-mtp.dts              | 6 +++---
>  arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 6 +++---
>  4 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index 8c64cb060e21..e96aa5ccb679 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -238,7 +238,7 @@ &adsp {
>  };
>  
>  &apps_rsc {
> -	pm8009-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8009-1-rpmh-regulators";
>  		qcom,pmic-id = "f";
>  
> @@ -284,7 +284,7 @@ vreg_l7f_1p8: ldo7 {
>  		};
>  	};
>  
> -	pm8150-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pm8150-rpmh-regulators";
>  		qcom,pmic-id = "a";
>  
> @@ -417,7 +417,7 @@ vreg_s6a_0p95: smps6 {
>  		};
>  	};
>  
> -	pm8150l-rpmh-regulators {
> +	regulators-2 {
>  		compatible = "qcom,pm8150l-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> index 632e98193d27..0aee7f8658b4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> @@ -65,7 +65,7 @@ key-vol-up {
>  };
>  
>  &apps_rsc {
> -	pm8150-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8150-rpmh-regulators";
>  		qcom,pmic-id = "a";
>  
> @@ -199,7 +199,7 @@ vreg_l18a_0p92: ldo18 {
>  		};
>  	};
>  
> -	pm8150l-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pm8150l-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> @@ -310,7 +310,7 @@ vreg_l11c_3p3: ldo11 {
>  		};
>  	};
>  
> -	pm8009-rpmh-regulators {
> +	regulators-2 {
>  		compatible = "qcom,pm8009-rpmh-regulators";
>  		qcom,pmic-id = "f";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> index 0991b34a8e49..0de8f2320b01 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> @@ -187,7 +187,7 @@ &adsp {
>  };
>  
>  &apps_rsc {
> -	pm8150-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8150-rpmh-regulators";
>  		qcom,pmic-id = "a";
>  
> @@ -321,7 +321,7 @@ vreg_l18a_0p9: ldo18 {
>  		};
>  	};
>  
> -	pm8150l-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pm8150l-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> @@ -432,7 +432,7 @@ vreg_l11c_3p3: ldo11 {
>  		};
>  	};
>  
> -	pm8009-rpmh-regulators {
> +	regulators-2 {
>  		compatible = "qcom,pm8009-rpmh-regulators";
>  		qcom,pmic-id = "f";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> index e76d0ef5aec9..b9c982a059df 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> @@ -123,7 +123,7 @@ &adsp {
>  };
>  
>  &apps_rsc {
> -	pm8150-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8150-rpmh-regulators";
>  		qcom,pmic-id = "a";
>  
> @@ -247,7 +247,7 @@ vreg_l18a_0p9: ldo18 {
>  	 * ab: 4600000-6100000
>  	 * ibb: 800000-5400000
>  	 */
> -	pm8150l-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pm8150l-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> @@ -360,7 +360,7 @@ vreg_l11c_3p0: ldo11 {
>  		};
>  	};
>  
> -	pm8009-rpmh-regulators {
> +	regulators-2 {
>  		compatible = "qcom,pm8009-rpmh-regulators";
>  		qcom,pmic-id = "f";
>  
