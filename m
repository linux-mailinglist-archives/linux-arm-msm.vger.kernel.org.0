Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4DD76004BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 03:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbiJQBKd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 21:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbiJQBKa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 21:10:30 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E982BB00
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 18:10:29 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id g16so2097232qtu.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 18:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u37Oc8Xrxoc/KwYwTXixeQOuxbzurVoYLNJ9kGdS1Zo=;
        b=fRfMawN2iik541nYnkVavvjZWI7Cf44Q2jUlAKJyQNcnuFAuA4DO+i81W9tqdFOiou
         qmT/qSOLkw0xA0q0mMCkJsXTZG4yhIoWxDgOgVCgx9Q4oXDo2VM0rQYBpR906FptR2G2
         of60mBGXhk6VweX7lxH5nW063qtbCpNCFV/eyEz/H18kZfHiRJl/A4jycu5C2ldYvbnq
         0tXbOMubsFqrUJRxNQSsvjEiRwmQAomCTuoiY1P+Gj/zB5Dky6WgFygur88h7d0c1dNJ
         ZOKTjjWLsLUm8081UwJ1hqNbl8NHDCcD+DrGMgv8/NH/Dc8JPhx05fvTe3xcNulRicHT
         xJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u37Oc8Xrxoc/KwYwTXixeQOuxbzurVoYLNJ9kGdS1Zo=;
        b=0ZXihjr8WQu1Fxqc0faEQZxmFteQes5fM6Yx+idZ+w2SB2CL8nMnPntkfeBq+uQU4u
         qG7nFXzrogR+sjLPooFE0mD9MB4CLXRd5FfTFqVwJpdrkq0F62cwnKBNjSc1LBXbRmFS
         lFlEb2K58GjT1E49/auoaNhgTfoCpxPIHg4Lh4DrecEDCSU0URZdsrwFQekU9M7eqP0u
         C3xov1nQ5+rUKSaECHTqQxMTHdN3jQeyDtekAt9IDQjGeI5Uk586uFZl8yTENHI66gqv
         1k7dPBWg4ksPcvnCw0tyNnvuiLAA+vlH8CFS26H5L5y3mdNzA5Oxq77gkekGw1xZbDG7
         513Q==
X-Gm-Message-State: ACrzQf26LbbfMveJgLufn9yr9gx/CcXa0pY0ePqHbcfAHTxfdKdED+JM
        ZWr9lpX8v9FpYoEf6jE6QOpdzQ==
X-Google-Smtp-Source: AMsMyM691uEuJd3rwOenpPlDO1LeLgZascRVEtwjX9N1DX7KDNpEo4KIjr28XnRmc957SBjt/YEefg==
X-Received: by 2002:a05:622a:90:b0:39c:e637:912 with SMTP id o16-20020a05622a009000b0039ce6370912mr3847331qtw.109.1665969028353;
        Sun, 16 Oct 2022 18:10:28 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:bb7d:1aa4:bef8:ec27? ([2601:42:0:3450:bb7d:1aa4:bef8:ec27])
        by smtp.gmail.com with ESMTPSA id f1-20020ac84701000000b00397101ac0f2sm6558051qtp.3.2022.10.16.18.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 18:10:27 -0700 (PDT)
Message-ID: <5929051d-d2be-5b51-0cf9-294affa51df2@linaro.org>
Date:   Sun, 16 Oct 2022 21:10:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 1/5] arm64: dts: qcom: pmi8998: add rradc node
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
References: <20221016180330.1912214-1-caleb.connolly@linaro.org>
 <20221016180330.1912214-2-caleb.connolly@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221016180330.1912214-2-caleb.connolly@linaro.org>
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

On 16/10/2022 14:03, Caleb Connolly wrote:
> Add a DT node for the Round Robin ADC found in the PMI8998 PMIC.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pmi8998.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> index 6d3d212560c1..5a479259c041 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> @@ -18,6 +18,14 @@ pmi8998_gpio: gpios@c000 {
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  		};
> +
> +		pmi8998_rradc: adc@4500 {
> +			compatible = "qcom,pmi8998-rradc";
> +			reg = <0x4500>;
> +			#io-channel-cells = <1>;
> +
> +			status = "disabled";

Why disabling it? It does not need any external/board resources, so
maybe it should be just like other adcs - enabled by default? What does
it measure? What is its input?

Best regards,
Krzysztof

