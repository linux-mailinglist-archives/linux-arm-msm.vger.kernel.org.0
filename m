Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E101D64F99D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 16:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbiLQPF5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Dec 2022 10:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbiLQPF4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Dec 2022 10:05:56 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10A3FB1CD
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:05:55 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id n1so5018025ljg.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aDKViGVh9+W5WPmDnV2q7Qee8glxAs8Q63QQw9bEVcg=;
        b=wzTchKmFb71MMqqOslc59nJ38UV6tVF8XyvPuGqk5GPT9+OcRkZK27fBV903WJ6z/V
         rODCTVUzO4itqGtU2qmQxBGnuW4kpYsKmenwgZ9Wf7jj0yMa9y5JD6A+0eNmtiAAV1hq
         nZ2zKgQUz1qDAZS7/jkW6T0hERBBYhLUoecVH+bHG5TW/jTHFRp1PFRv4O2lEq0Jw6tI
         yAROVgXwE9vbDhVWMtKQMKP4MKf6kgVFyx7hNALg1YZdWeq6UaWlPGThivzQc1GDOTB6
         fOc332WXOtVb1ww4KFnZvBLZRmeWDnUTdfbb2Urmmmaz1eQi32ZhNqVsYbuVxw56LTGU
         Hqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aDKViGVh9+W5WPmDnV2q7Qee8glxAs8Q63QQw9bEVcg=;
        b=h+M6UbIj/0QcdHPm2mNBbyO9HEsBa5nGLesFe9/fMpH2bLPY6PCGoRCLzgK5pZ8DV3
         eULeVlDKxd/vorwaHtn6whvfZymQW3+4G5338vFbRdTGuHyhbe3X0j2KipKPIncyfxhK
         hPMz3kBg88LSuXqKhVEserg/uI82FWQaFrxFMXeFsZE+rvu5yv7POufxSBijgUpIBz+t
         2P8U2nsmfsu4Rpd6BdnZj8LbuWxAHcCHe/m/ngKgPMDI703w10BqfNCCmivFzawu2WQX
         la+H6XR3h7r+IWje8qlD/vwu0svmb2dPW3TvFOICa+KW/RtSIR4xzVK0PkFitHKkwB2S
         3ZAQ==
X-Gm-Message-State: ANoB5pl79o3YIZNYlsYsrwJxhviPBmeqAhBfc+w+/ay5JaBBSQ9DAndW
        hyCDWKrxatP1udhRguXCiMGD1PSmYm5nxzSq
X-Google-Smtp-Source: AA0mqf5iB7QGC7qrd1K2Ofu/KXoe5RS58iQAfQoRRYIIqqWpUACTRH3HUydnOukzJISVYoP1q0ZizA==
X-Received: by 2002:a05:651c:247:b0:277:af4:aa34 with SMTP id x7-20020a05651c024700b002770af4aa34mr9345537ljn.36.1671289553290;
        Sat, 17 Dec 2022 07:05:53 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id e17-20020a05651c039100b0027a09254870sm369920ljp.49.2022.12.17.07.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 07:05:52 -0800 (PST)
Message-ID: <87af9487-5d7d-425c-7b56-8d46217db50b@linaro.org>
Date:   Sat, 17 Dec 2022 16:05:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm8450-hdk: add missing PMIC
 includes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20221217003349.546852-1-dmitry.baryshkov@linaro.org>
 <20221217003349.546852-6-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221217003349.546852-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.12.2022 01:33, Dmitry Baryshkov wrote:
> Add includes for PMICs used on the SM8450-HDK. This makes GPIO blocks
> and thermal sensors available to the user of the platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index c951d7a6d6df..5cf436090b5b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -10,6 +10,10 @@
>  #include "sm8450.dtsi"
>  #include "pm8350.dtsi"
>  #include "pm8350b.dtsi"
> +#include "pm8350c.dtsi"
> +#include "pm8450.dtsi"
> +#include "pmk8350.dtsi"
> +#include "pmr735a.dtsi"
>  #include "pmr735b.dtsi"
>  
>  / {
