Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5765867E4C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 13:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233421AbjA0MM2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 07:12:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbjA0MML (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 07:12:11 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67A0787166
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 04:06:35 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id j17so3319029wms.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 04:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2tF4rjZ12tEdnTliQEfRgs62X19a3HSEDnDwGDGszE=;
        b=TUOe7508cKd0U0SQ+PBADL19fF3ZYWtaDV1w0CnFQQM3rJg9pq7I3Bzw9pUiRn+Uyq
         fcvWeMVNBRh53WTXbNSxFAabUewjHf4jnMqDjzaSvnbTLezOMCoN4t8TICIHviNlmNOu
         SThYTeyCGH276rSaA2OKFSy5FjQ6EZgFWCjQxsGmQoKH5cl8+Ys6IeyP3THd82DHUiwA
         BPWLG6PBefh5n7cUp7vmzWmEUCqxmorlejq6R91fWUp7R4zxtkmaXpbq7cRdHN5L5eL7
         hWWf8VTvCzdnf+x/FWzHSJ53ojEEvW0vqh+r60mXivELXRBFdR5nS5Z2BASXLnOGraGC
         KSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G2tF4rjZ12tEdnTliQEfRgs62X19a3HSEDnDwGDGszE=;
        b=kIoCegWnd/5BdXTNVZ+38kZtc0aLzOhyXjsk1KDPkclK+u6xL9PwaFteloDVnJa4Dv
         kcEj/8LQ1kWF010H1Dz0KcYLeQF0jjszXrRxxC/QXhuxhuO/Prd252dck5TkCyomLqU0
         C/BGgiUcL43m0Gy3ZkFDsXhqS2WAZugqXWHaY2H5kTWdjF0nvXBJSGYBQ6fvWYgFbZN3
         hvwppCjoAUNcCOkdwaftU4rvUFfhv+4wNNDZbxW7+NLpqKmTVCWk5PUENoS1nd0ziokp
         +5spMOqjIBij7qbBlMsbfWKpCfK+eabZFzNEYMcL8oSOH1seHDcDdOzGD82i2+2J3mXw
         ALew==
X-Gm-Message-State: AFqh2krgSIp9b3iISDda6u9siwexVQCkSz5i2GYFREBVHHF8AD0I7jvy
        6JqEF2O3YGBeE75imrOIVbu26EicwhUCPfes
X-Google-Smtp-Source: AMrXdXvc1jtmCy5ngc6VwfTLlj4/PdQpdWrSYb1hvzRLdhX1VCoyuqXq3TDoCXjBQnqZcVd4LJJo1Q==
X-Received: by 2002:a05:6402:28cb:b0:49e:db43:1722 with SMTP id ef11-20020a05640228cb00b0049edb431722mr25993245edb.18.1674820304263;
        Fri, 27 Jan 2023 03:51:44 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id s9-20020aa7c549000000b004a0afea4c9csm2178592edr.18.2023.01.27.03.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 03:51:43 -0800 (PST)
Message-ID: <9e805614-8d21-4f8b-1b31-790686c95aa5@linaro.org>
Date:   Fri, 27 Jan 2023 12:51:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 01/11] ARM: dts: qcom-sdx55: align RPMh regulator nodes
 with bindings
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230127114347.235963-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230127114347.235963-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
> 
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> See:
> https://lore.kernel.org/all/20230112203653.23139-1-quic_molvera@quicinc.com/
> ---
>  arch/arm/boot/dts/qcom-sdx55-mtp.dts             | 2 +-
>  arch/arm/boot/dts/qcom-sdx55-t55.dts             | 2 +-
>  arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
> index 6f8909731faf..7e97ad5803d8 100644
> --- a/arch/arm/boot/dts/qcom-sdx55-mtp.dts
> +++ b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
> @@ -75,7 +75,7 @@ vreg_s7e_mx_0p752: pmx55-s7e {
>  };
>  
>  &apps_rsc {
> -	pmx55-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pmx55-rpmh-regulators";
>  		qcom,pmic-id = "e";
>  
> diff --git a/arch/arm/boot/dts/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom-sdx55-t55.dts
> index ccf2b8b42b16..d5343bb0daee 100644
> --- a/arch/arm/boot/dts/qcom-sdx55-t55.dts
> +++ b/arch/arm/boot/dts/qcom-sdx55-t55.dts
> @@ -98,7 +98,7 @@ vreg_vddpx_2: vddpx-2 {
>  };
>  
>  &apps_rsc {
> -	pmx55-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pmx55-rpmh-regulators";
>  		qcom,pmic-id = "e";
>  
> diff --git a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
> index db7b3d5b0bd0..ad74ecc2a196 100644
> --- a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
> +++ b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
> @@ -98,7 +98,7 @@ vreg_vddpx_2: vddpx-2 {
>  };
>  
>  &apps_rsc {
> -	pmx55-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pmx55-rpmh-regulators";
>  		qcom,pmic-id = "e";
>  
