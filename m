Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2303F6AA9A5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 13:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjCDM5g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 07:57:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjCDM5e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 07:57:34 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180D320065
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 04:57:18 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id t11so6988178lfr.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 04:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677934638;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wPOGNGSxpOef32KPTSDLqHKntHHLrommHkmw5uSDC/E=;
        b=k7tvPZ687F128O/rQJ4psXWcIFMe8NHLj3KdsFr+bI/mghUihG2LLUqcfp6JCnTQQT
         vxP3DSggtaucYyIsL1S9AQzVoxMpLAWWRpVSmpFQdC7AuLALdYeMyTG+V75VQkJ3J5Gq
         pT0+xNji5kfZHt1hQW54tlh/JlOjUFC1pFrNycBSukoVrtkGbkr+nDEaVwBHkovtw2Bz
         QSMEQxcqwqk5sMpceFQVEThjhC8ZhXv/dJLEsTezguZWEQMkSvqeFb2Yy+PpnQToNzsQ
         f4ffMxgz11qF8aoOFAx6zMgkV8YjRT8JM5tQwXkReZBlMw6nGiyteuKmS63VEYtu+e4E
         J4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677934638;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wPOGNGSxpOef32KPTSDLqHKntHHLrommHkmw5uSDC/E=;
        b=JfGSy4TBclcl7tsG8+5CtGUevBanR+JLXEfHD4YSwgMsuLZJwvrDb1hcIjVphHOnN+
         wHjJjxR0G+z46tXxksW2/9YlOpKzHNXj8FEYa9lrWg1u3PDLMCf6E5FgxadIBnR4CBQd
         tK8k6MWKO3ZFEHzIKRVL3NzWx15XwEOa91bEMYQ5/rxiWtrlQmroRMYci4a8zgmodIpq
         qe/zAFgdCaLbaosOK8jLboI9sF1ag7QLtpqGm6O3yu0/XYzB7/Nez4bjTpIG2l/Edcmf
         wLeEzn6Znm3HY0badJTfs+2tZyCLuTWHk0PwaktT4hnLRTyyuycOsDqU+WJH7K3G+WGG
         ijcQ==
X-Gm-Message-State: AO0yUKWEEG/bH0VbR0tIZApuZoBfw5zcsQBHVh4aMBzu4setChX50lCX
        WxVr/7ZLSBiw1K1GSmtNxIqglA==
X-Google-Smtp-Source: AK7set+4g0DYlqNzzn80AXk3mqjncOuKBfkRtvxXYv9ZFP4AzTBbeGE/Kn255t0kcxoIO+h+JTaQ2Q==
X-Received: by 2002:ac2:5210:0:b0:4dd:aefe:c647 with SMTP id a16-20020ac25210000000b004ddaefec647mr1558460lfl.22.1677934638322;
        Sat, 04 Mar 2023 04:57:18 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id q10-20020a19a40a000000b004d58e782886sm822031lfc.303.2023.03.04.04.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 04:57:18 -0800 (PST)
Message-ID: <8184ca39-6cdf-8ac2-aafb-0ab4741da8dc@linaro.org>
Date:   Sat, 4 Mar 2023 13:57:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/8] arm64: dts: qcom: sc7280-idp: correct GPIO keys
 wakeup
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230304123358.34274-1-krzysztof.kozlowski@linaro.org>
 <20230304123358.34274-4-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230304123358.34274-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4.03.2023 13:33, Krzysztof Kozlowski wrote:
> gpio-keys,wakeup is a deprecated property:
> 
>   sc7280-idp.dtb: gpio-keys: key-volume-up: Unevaluated properties are not allowed ('gpio-key,wakeup' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index cff0e0d31c15..b4b9d5e5cbd6 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -70,7 +70,7 @@ key-volume-up {
>  			gpios = <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
>  			linux,input-type = <1>;
>  			linux,code = <KEY_VOLUMEUP>;
> -			gpio-key,wakeup;
> +			wakeup-source;
>  			debounce-interval = <15>;
>  			linux,can-disable;
>  		};
