Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5718F6ABD7E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 11:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbjCFK53 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 05:57:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbjCFK53 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 05:57:29 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 793FD25B92
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 02:57:27 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id j11so12077302lfg.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 02:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678100246;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5A+7XB3xlQ1MiIzz+pKhkfRbPt2SlcclA5AdWWmaIkQ=;
        b=lkxSl6IqDfQ+uOJFgXlRW2T42IoSxbgmqwZsA6+HFrONHHvV8x6w7Jqs5ZDdMHbRvi
         PE/yT8tTDko2j4e2gpb/5g4B3+QK6K3wT7Bfu9/sBKsnb8DcV6AHVN472pDf8SzZjNHJ
         Il9q4FjCPtE6JZlidOSZxECWCw9HoAU5Jti7n+Ixt7v5PtWYIyns6IwcV+tsNFRrysE8
         PR5U1MC1UjoiaJO499lenBOLL3TYhsKqveQL330zWtBTkSEf4kU3QAjtRa7SGmlIOzSe
         y0HOibvR9p+OMmoE4ttNTU4GOgSb5gXUcOk+bI091sYlWNmA1UVgP8T9pl8gMClJVatu
         Y2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678100246;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5A+7XB3xlQ1MiIzz+pKhkfRbPt2SlcclA5AdWWmaIkQ=;
        b=jQB4vh3hwy/NCYL1ObT8xCVVPgmNrOMKAuUP9eiEW2DQx1qqKefN1djI5F3TaCpjOf
         ieksO5eZyfsh/+yNVA/iRjPcOFoOTjXOhwMLb976SB3M/TgLCjFSIpHLA6zvjwmwPLQj
         htKjpHZL7dsUKpAyQQEKKtmp9ORLHVe1H4rxMrNJ+c2M8JwQ1wZ31i9gNrcDWbf6guAF
         txVsQ9gjCrGwwZI8p/tg6icjS1TPNPhWZ1bRczDufZHyK7Xpd0AnO2iJcM1l2bPsJd8W
         e+foQ1dNDMuxtikNkUx5IkFBCgF5BDwLlpvoKPj4pBrfKnpeiIV7GyXecPwd0Cf6SEOP
         0WnA==
X-Gm-Message-State: AO0yUKV9DU76MMqZxXmpUHPpgeLGgJJE49Dh6eV3k7GZiDcww9qcYxGI
        ob/ZIMg1KklMkY2O8qNGpG+/9Q==
X-Google-Smtp-Source: AK7set/CBeg7Ml6eFbu2an5xCGcI54TG8cqvQmkoIiELdLmBLeO4J0m2gD35boBtOOyuWmVLQP+oig==
X-Received: by 2002:ac2:44cc:0:b0:4db:25f2:c116 with SMTP id d12-20020ac244cc000000b004db25f2c116mr2850132lfm.18.1678100245756;
        Mon, 06 Mar 2023 02:57:25 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id p12-20020a19f00c000000b004d2199ea23dsm1590234lfc.0.2023.03.06.02.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 02:57:25 -0800 (PST)
Message-ID: <abd7f619-829e-581f-5507-f0bf8d352453@linaro.org>
Date:   Mon, 6 Mar 2023 11:57:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 05/11] arm64: dts: qcom: apq8096-db820c: drop SPI label
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230305125954.209559-1-krzysztof.kozlowski@linaro.org>
 <20230305125954.209559-5-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230305125954.209559-5-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5.03.2023 13:59, Krzysztof Kozlowski wrote:
> The SPI controller nodes do not use/allow label property:
> 
>   apq8096-db820c.dtb: spi@7575000: Unevaluated properties are not allowed ('label' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> index eb18811b2676..842836ed680a 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> @@ -146,7 +146,6 @@ &blsp1_i2c3 {
>  
>  &blsp1_spi1 {
>  	/* On Low speed expansion */
> -	label = "LS-SPI0";
>  	status = "okay";
>  };
>  
> @@ -183,7 +182,6 @@ &blsp2_i2c1 {
>  
>  &blsp2_spi6 {
>  	/* On High speed expansion */
> -	label = "HS-SPI1";
>  	status = "okay";
>  };
>  
