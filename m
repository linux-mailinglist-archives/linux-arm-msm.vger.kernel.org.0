Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32AE26298C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 10:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730085AbgIIIGe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 04:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730205AbgIIIFO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 04:05:14 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D0FC061756
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 01:05:07 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g4so1870139wrs.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 01:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:autocrypt:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GnsN9VJxY2tWMcKN+d2gl2RPXIURHKHn7BhArmMdOJI=;
        b=lfKOkywn+OMumynjOSboeiWzYwjpSrRwiZF0r8UPdpuS3uS3zpTW59Pt/PBoW5QHFa
         DJER2fIQFOyE9wzQN6aA+/Els4t3WcyQUyHvDU9+/uQ7ZloBA3Z9/JirgD6vL+RYkWZz
         LSjSpwSGgColoMJ86ms2+elDXr8clJTOUSaD/7RdQ1KIqC8VpoVExaQnjjgct1c6XH9t
         XQ60Hym3Tvj4BHL2FFmSxIZov18XfaMpS/KyQFLj+M+FqRRTeNhT6WOQDGKJI/m3sv2U
         yjbKRXLiNhEjKFKk8bqWNQw9O7hjQi9AVHuovVIUw9pX/NkPGAMLYJv6PsHGMjswCxFG
         Zqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GnsN9VJxY2tWMcKN+d2gl2RPXIURHKHn7BhArmMdOJI=;
        b=XxT4C5Xwr3zehKdiPenRW3Z65bb1+wjZ1FNXIRI1CamCKaPzmD0QJjn8lN/eDund8V
         hNfu9+OgilDhkVRW19a67ncffp1empGTd6S/racM0GFjzd7URLxGxlLX2LxtenBSthcZ
         jiHSLmFIaz4GxjYDk1fI5kY9+O6vqe8kJOUNt9yUpT/3qRLgHYqJAOxgzfs8YomL2TwA
         DWnvFfsICEyqtP+a3YXSp6ZJHuAzJDqOhRrntqjGYYMZr5j+O9f6K9xtHL0yo0kVaMkJ
         nUF0oXtir1eilfY+ZOcyMRMps0QOwybDDvfPfPhxbcq9HKSdm+rDrpTY22hE4QAI3zLn
         CCLA==
X-Gm-Message-State: AOAM533qXwocP0CSGgCxONdszBe0agyRsyvKOLecv2QYnBkdj+8NfxUJ
        qm/Z6bX9g5ILvpUgl9dhBwjJNA==
X-Google-Smtp-Source: ABdhPJw506zvow+7wjAknSFSUGWBL7dX5e7fDsg4nFHoFvxq0CUMBc0bPk4o5X9Jg0/wogGwq5TZgA==
X-Received: by 2002:a5d:4e02:: with SMTP id p2mr2913549wrt.276.1599638706440;
        Wed, 09 Sep 2020 01:05:06 -0700 (PDT)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id g143sm2695680wme.0.2020.09.09.01.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 01:05:05 -0700 (PDT)
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8150: Add OSM L3 interconnect
 provider
To:     bjorn.andersson@linaro.org
Cc:     Sibi Sankar <sibis@codeaurora.org>, robh+dt@kernel.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jonathan@marek.ca, linux-pm@vger.kernel.org
References: <20200801123049.32398-1-sibis@codeaurora.org>
 <20200801123049.32398-7-sibis@codeaurora.org>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <a60ab579-baaf-06bd-02c7-ac584aeac3e4@linaro.org>
Date:   Wed, 9 Sep 2020 11:05:03 +0300
MIME-Version: 1.0
In-Reply-To: <20200801123049.32398-7-sibis@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/1/20 15:30, Sibi Sankar wrote:
> Add Operation State Manager (OSM) L3 interconnect provider node on
> SM8150 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Acked-by: Georgi Djakov <georgi.djakov@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 0f6d84e8fd299..8563afd205ee9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,gcc-sm8150.h>
> +#include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/interconnect/qcom,sm8150.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
> @@ -1184,6 +1185,16 @@ apps_bcm_voter: bcm_voter {
>  			};
>  		};
>  
> +		osm_l3: interconnect@18321000 {
> +			compatible = "qcom,sm8150-osm-l3";
> +			reg = <0 0x18321000 0 0x1400>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
> +			clock-names = "xo", "alternate";
> +
> +			#interconnect-cells = <1>;
> +		};
> +
>  		cpufreq_hw: cpufreq@18323000 {
>  			compatible = "qcom,cpufreq-hw";
>  			reg = <0 0x18323000 0 0x1400>, <0 0x18325800 0 0x1400>,
> 
