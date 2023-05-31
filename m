Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B65FC717C27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 11:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235241AbjEaJjh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 05:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235641AbjEaJjT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 05:39:19 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC08E48
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:39:09 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2af7081c9ebso59728111fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685525948; x=1688117948;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nQa0P1pqAocYdXm1tauErO8Lb7ADFiz2b+k6LGDHB24=;
        b=Ftr3+LyUBAkEesdGyGfEIDjW78rzoI+l+iw1i/B3OakqulSf2cb0RKzboSNJadykTD
         9fjwkiUo0WcQ/qW9ZMzxz2HCGLUDKVEVOKd1hb6KURaBYNsV0V2nT5BneI90G2oYW7JQ
         SLB3jkK016VDhUhaOFgQ0NGn6lAJ7wW1Kr0mNFpqwNibNUWwKBaaRO3nk349Yyz+PuRG
         rWKGTeIMVIZup31aNJBlV4OfsvWOu1FiLpJg9zrdpgsOnOuxXKRliJydiRdqw5/ad/+J
         o1pXo5Hil/E4EDARtWT/NrmpSRWMQvQ/3CACLsNMijrFWTGA7ayuxV1yHnWRy8KuEs+8
         H/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685525948; x=1688117948;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQa0P1pqAocYdXm1tauErO8Lb7ADFiz2b+k6LGDHB24=;
        b=MxB4qX6J5fzBBvkjOrJc7RS0xLkdZBDY4YSB3xCNuRp0H4JBLLEfgLXJuqJoE8CLgo
         tyAjxUlUFlvg9pOixaygaXFGyv7PchHkZev7WeaKjZ9Bf1rfoZ4M2bD7fE71izEVBbNh
         cNMFoJpLivHnbNQvqNj/guCL+/MRAoTo1opi/3HAKL4t28tHZsvh3JCmf7Pz8ih+qiQf
         PqlvR7n2sLpeHEelZXNz+qkirvK8TZ2h3iDVXiFHRUx/lUhIDOfQbSNd+V2GWETX4et7
         a380TwIBWqDx7mEGG+P7meZQ09t49jqP50kMgzraI6IVVhJ3IgOE3MivbZjC//HFYts5
         uRsw==
X-Gm-Message-State: AC+VfDxUen7YvzzKnH27+rEKCR5YhCmk8AIVYs4wdOR1Yj4CP6NyIELp
        cyMYX9T8BqzbZUKiYssf4/oD/M7RC0C/f0OD7e4=
X-Google-Smtp-Source: ACHHUZ5Ev3J/rsuhXwGMrAbYisMjsNDckXHclbYWT5eZ9t5MeW88hrptBRviT6gpBYOHmc7rV3SaUA==
X-Received: by 2002:a05:651c:13:b0:298:b335:de49 with SMTP id n19-20020a05651c001300b00298b335de49mr2152361lja.25.1685525947954;
        Wed, 31 May 2023 02:39:07 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id s10-20020a2e98ca000000b002aa4713b925sm3236707ljj.21.2023.05.31.02.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 02:39:07 -0700 (PDT)
Message-ID: <d82f5be0-fab5-6427-250d-95195005c60f@linaro.org>
Date:   Wed, 31 May 2023 11:39:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 04/14] arm64: dts: qcom: qrb5165-rb5: remove useless
 enablement of mdss_mdp
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230531011623.3808538-1-dmitry.baryshkov@linaro.org>
 <20230531011623.3808538-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230531011623.3808538-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 31.05.2023 03:16, Dmitry Baryshkov wrote:
> The MDP/DPU device is not disabled by default since the commit
> 0c25dad9f2a7 ("arm64: dts: qcom: sm8250: Don't disable MDP explicitly"),
> so there is not point in enabling it in the board DTS file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index dd924331b0ee..dfcaac266456 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -639,10 +639,6 @@ &mdss {
>  	status = "okay";
>  };
>  
> -&mdss_mdp {
> -	status = "okay";
> -};
> -
>  &pm8150_adc {
>  	xo-therm@4c {
>  		reg = <ADC5_XO_THERM_100K_PU>;
