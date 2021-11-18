Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE2645654F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 23:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbhKRWHP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 17:07:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbhKRWHO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 17:07:14 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C14C061748
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 14:04:14 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b1so32867510lfs.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 14:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L0AvJo2aJBbrB3dZVIskeL0rHyePfIbTkm816pl2LgU=;
        b=znUbm10k4Aj1WViktuUfGcUCMGRUEEb5lB4X2U7OAC1UrIkIsvEGjCJfbSQwLOS8Qa
         EuCUqx/jIRkIkNsgje5bVdyU7qA0iAkt31OHVhAHkVYSIpSBLtbgbehvX7JwrGCMg2kG
         svx1jVtlFdR071C2+bQHY8iWEnjz0l/8kQNtq7lfKlEQuhfRbz2XXWc2/3n2XWuos1vf
         C36d+pT/ceIWns2awlPncj5rA1ytJN5V8vXH8OF6iNiojQnl309WaHoAb6Lb+afWoUEk
         n/+cgG3mPvqaP7Lc3yz8ZaDs0qaDO7r8Mg99byOpUFdghymUDSIgepoDPpWPNMCocqnD
         Fd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L0AvJo2aJBbrB3dZVIskeL0rHyePfIbTkm816pl2LgU=;
        b=rG33Arehd99bThKmoC3ZITr5U/374HTt6V0HbeUB4vVQg5AxTH4D9tPSRDbzap5Fvd
         hYfQBGeigKmAPP3OxbLSX9RgC0nwNJez/JyO99dn02RQvpUcnt92LPn35qsrCo2tuQmc
         1C2PqaVxyWg7PDMZMKYToaPkPeuTiEub5D9GV88MTQ3SmpBeD9o+KohqRXfmz0DToGK2
         /qSxJIKLF9Jmg7sNKruakVRKOaijv7gBtUI7zyICr4gcNlB596Kt/AWbdT2rBGlxuntd
         9cmi5wB7EER2vBbGiNr5lNJSV0+fvXzybTu2mkM6T4MCnhgvagTsf8M10suQPmtZrcks
         C5rA==
X-Gm-Message-State: AOAM531/B6lkWAocWr82ivWwBB3xtrV3KbG17/9JPsxWqlS9vY83JigU
        xcQ732t9JH+/ImGCqKwWDfWliA==
X-Google-Smtp-Source: ABdhPJzxAEkNvGMDQNYy2kP/IaqUK5twgUN5jc36G/89hitn46O6fpu1RKLzKdxGzUMWIO4YRsheJg==
X-Received: by 2002:a05:6512:38c4:: with SMTP id p4mr18851005lft.248.1637273052220;
        Thu, 18 Nov 2021 14:04:12 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t5sm153021lfd.80.2021.11.18.14.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 14:04:11 -0800 (PST)
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: pm8998: Add ADC Thermal Monitor
 node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210923212311.2877048-1-bjorn.andersson@linaro.org>
 <20210923212311.2877048-4-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <4335a136-35a5-48b4-5b3c-cf094a8241b0@linaro.org>
Date:   Fri, 19 Nov 2021 01:04:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210923212311.2877048-4-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/09/2021 00:23, Bjorn Andersson wrote:
> Add a node for the ADC Thermal Monitor found in the PM8998 PMIC. This is
> used to connect thermal zones with ADC channels.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> 
> Changes since v1:
> - New patch
> 
>   arch/arm64/boot/dts/qcom/pm8998.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> index 6f5bb6b37ec2..d09f2954b6f9 100644
> --- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> @@ -84,6 +84,16 @@ adc-chan@6 {
>   			};
>   		};
>   
> +		pm8998_adc_tm: adc-tm@3400 {
> +			compatible = "qcom,spmi-adc-tm-hc";
> +			reg = <0x3400>;
> +			interrupts = <0x0 0x34 0x0 IRQ_TYPE_EDGE_RISING>;
> +			#thermal-sensor-cells = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>   		rtc@6000 {
>   			compatible = "qcom,pm8941-rtc";
>   			reg = <0x6000>, <0x6100>;
> 


-- 
With best wishes
Dmitry
