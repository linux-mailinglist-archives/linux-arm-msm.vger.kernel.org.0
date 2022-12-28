Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3B77657766
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 14:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232967AbiL1NmH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 08:42:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232951AbiL1Nlz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 08:41:55 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D35F5AC
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:41:54 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bf43so23669926lfb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I99sMjDsAea5G8B1JlCQSCo9peQ47lkvT7dfS54M45M=;
        b=eV9isvizueOy1vXXFpMk7UnDoGDerHmnCOZXWfLhABxUKkg2szl1Z1xkKDkfUN04La
         Lj+FGfAadQSmWh9ZErCcHRxw6epcIsRUZF+2ZxD/JwEG9ZxVvPfudeBMfbhCGwN3Q2Md
         DA7KCApdzo/H+RvT6YgRFp7i9eSEH3vpval+2/hee1PGJtxE0odlUUloRr/IsFgyduKB
         ekAmIV7B7mxjknjvkYfRk+AlU1vy6JgCyGpeyavTYHPKRw9TjcncQ8vfBAr9dUlBmbzQ
         bvBVreKUF4zOnsk1h9ZMiCQOyDmE2Y2/k5kn66WvYxru2qsJ66JJMb0jEAVmBbcllrAI
         1RbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I99sMjDsAea5G8B1JlCQSCo9peQ47lkvT7dfS54M45M=;
        b=KCjO7gf8kM8Ia1a+P6Ivz5FgXHjgfVfQeaJQ4JGs4j5jDk+c/ir/hSZSD+T5DHJTL8
         cUmvWcXJS403obpd/eqkiNdvt19fsAfve7efKUkg0y5lmh3ErVKcOnB8VkU/Ldjj7McW
         h/UPE7F2knK2qEC3ZRL4i5nep1INmfBkmgvhDAYxFIdz2PiZrYozljbVOw9ueRG8Z4Gp
         OWm1OSgXUpIRjVYf8SOtOGu5g92ySPcLRFGtPiq3XD4M4rq1drspj/NL2Hy4kLe1Ussd
         G9/TwLNtkXrgQsfNWuItH4RiIQGpa7O8dpgHsiujWdvnMyXl7AW7I2ZGnds2fyhmTWBp
         o2dQ==
X-Gm-Message-State: AFqh2koR9XNn3caAxri+n4ODSg6j2GgO6HyHUOcxjYQFiwv6UVHw84Fi
        YlXzGTT3wD/t7TGhiJl8AeHKCA==
X-Google-Smtp-Source: AMrXdXssihIaszrUcuTU8eNLzMHzUZ/xpoVxxYeRNpQn2Q6binlVJqVyxvuNZCFdmZU8cwkUlR4PIQ==
X-Received: by 2002:a05:6512:3e10:b0:4a4:68b8:f4f0 with SMTP id i16-20020a0565123e1000b004a468b8f4f0mr7868369lfv.54.1672234913056;
        Wed, 28 Dec 2022 05:41:53 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id s4-20020a056512202400b004b5979f9ba8sm2651230lfs.210.2022.12.28.05.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 05:41:52 -0800 (PST)
Message-ID: <6a45ded9-5a61-fec6-d1b8-91fbad4b0a04@linaro.org>
Date:   Wed, 28 Dec 2022 14:41:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 16/16] arm64: dts: qcom: msm8998: get rid of test clock
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
 <20221228133243.3052132-17-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221228133243.3052132-17-dmitry.baryshkov@linaro.org>
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



On 28.12.2022 14:32, Dmitry Baryshkov wrote:
> The test clock apparently it's not used by anyone upstream. Remove it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 18cc149b6be4..6d69dce14dba 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -2398,8 +2398,7 @@ mmcc: clock-controller@c8c0000 {
>  				      "dsi1byte",
>  				      "hdmipll",
>  				      "dplink",
> -				      "dpvco",
> -				      "core_bi_pll_test_se";
> +				      "dpvco";
>  			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>  				 <&gcc GCC_MMSS_GPLL0_CLK>,
>  				 <0>,
> @@ -2408,7 +2407,6 @@ mmcc: clock-controller@c8c0000 {
>  				 <0>,
>  				 <0>,
>  				 <0>,
> -				 <0>,
>  				 <0>;
>  		};
>  
