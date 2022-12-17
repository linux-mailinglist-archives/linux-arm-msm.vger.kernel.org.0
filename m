Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECD8664F99B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 16:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbiLQPFo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Dec 2022 10:05:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbiLQPFn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Dec 2022 10:05:43 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B974BE5C
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:05:41 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bf43so7723162lfb.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E7g3yvT+PwAZd/friwJveY7oxMrGvF9dCCxrC9PLKEw=;
        b=OIewvWaQ/jYQmt8p8js9TN81oqbegWtTWUUKrrp3R9WuNx4kyj0NFVoLG4xVHOekMn
         0ndfpcp7rYtJpqk2QVO9YxC6sp+7nTo8dCpN1SDdxs/djOcSpnLFhn2T8FJ7vMHLfEcD
         vd1QRmzZLcJHL8WHhI/LjY4exklqXHVTKY3ePRf+IG5nOa8l4IJ5i754GKIK/HU6I5Zr
         5TIqWiIRu3EW24WTu7eeh44HaWdlOIRk9T00UsIQ/wuWKq752hNhQLCKbRcC9y6yaqR+
         4UOgyc3DWPu4s+Epllb0Rz2+8z3APJ1l/jRIHbjhyyYqU/vvpt/JuO9McihI66O8W74n
         1LNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E7g3yvT+PwAZd/friwJveY7oxMrGvF9dCCxrC9PLKEw=;
        b=feWDmaR0O7blGtRus18hFGzrzK6FFV7R80e845XaR8df6DtTCWdGfUsSBM8tgDyCuD
         y25QsOEqru+txUeEmMdIpWW7F6crlICEJ3xqm1JFxNNcY4wUus70547kx4Uw7FcM8+Zs
         NdKYKtwW+RdsBOG+xT83fTZ7J+3MilEkEGt109qbICQnGUknxxHIDreG6/AGQjrClWmZ
         tOOHg9Xl1jvaASWBqavKulKB2KeKafke4+wkak6RZoM6FAbuTsHapXy+YCXjGXp3pe9a
         AoIblwY9w/nTADxxZg3Pg35VZE1Xbd6ghfRNzVamJnAdGfyEAer8SzeKADur6L54g6rK
         hL+A==
X-Gm-Message-State: AFqh2kp8Uomf1RWtGXVOUI0FCWKVpKamCmwk95TlqBkD7ATFtdipxRHz
        0LGtidGOmflW0bUTq4N7gLWlpQ==
X-Google-Smtp-Source: AMrXdXsjT+cuJlyVOw+mPAr5eck+h2aL+UA52g1c6Qy7ZpGU1uUjEI5LirRFdbJcqOrZTD3PmsyiFw==
X-Received: by 2002:a05:6512:a94:b0:4b6:f22c:7dc9 with SMTP id m20-20020a0565120a9400b004b6f22c7dc9mr5520108lfu.57.1671289541348;
        Sat, 17 Dec 2022 07:05:41 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id c14-20020a056512074e00b004b572ad14b2sm533208lfs.251.2022.12.17.07.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 07:05:41 -0800 (PST)
Message-ID: <8418af38-e231-80dc-f3e4-6852a51a5ac7@linaro.org>
Date:   Sat, 17 Dec 2022 16:05:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm8450-hdk: add pmic files
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
References: <20221217003349.546852-1-dmitry.baryshkov@linaro.org>
 <20221217003349.546852-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221217003349.546852-5-dmitry.baryshkov@linaro.org>
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
> From: Vinod Koul <vkoul@kernel.org>
> 
> SM8450 HDK features bunch of PMICs, add the PMICs which we have already
> upstream files
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index 4de3e1f1c39c..c951d7a6d6df 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -8,6 +8,9 @@
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  #include "sm8450.dtsi"
> +#include "pm8350.dtsi"
> +#include "pm8350b.dtsi"
> +#include "pmr735b.dtsi"
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. SM8450 HDK";
