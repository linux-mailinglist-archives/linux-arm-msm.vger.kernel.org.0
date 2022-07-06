Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9955681E0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 10:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232454AbiGFIji (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 04:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232439AbiGFIjg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 04:39:36 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D2D24975
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 01:39:35 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t24so24717045lfr.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 01:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ld8cIYsdzjIDnkCt1ktjOPlaDX6VLGU5kv/wSF9GY8k=;
        b=aA808w1NUKJcg7JJsrdqlHpCDKYmWzmtV6KSh5jWXGbUJ/+XdNQ6YCM7BvMtvVyZqq
         TptE/zqZ01WFZ/iNjtJtCWth6hqrxarBuczyyytBbPT3J/nVqGnQRHl0fokNwrbhTEgz
         ENXvWYxPjJwOXmDdlVLxhg84kHL2AuDh8aMtjhb5sDjqXe60fv+KVyZRdoJ53jr/Ty7w
         OPq6QNGVNeRs3IWLs8BmRqEfNVReABTM+qO3XSQ+UUzEFzVZLwqg9tBzXOeYkXx0bMwE
         /WR1kHnIlIqf+cUqbnVGBxu19//em1i110dudwgPIArGv3DP9Ctr4trQJ41TcCt9FYWf
         NzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ld8cIYsdzjIDnkCt1ktjOPlaDX6VLGU5kv/wSF9GY8k=;
        b=CeclYeZYQQx3Rd3+IKSDTijVnKqbNDtOCMSq7rSdrwd4QN7WyxLTAnQ3bjzZi2Vtgl
         k3tGySL5gzKVDjJ+FHPoXb/Saq0IuW4f5Er2RtA48wAqIOvPjjBlGWJioxE/r2mgWIaC
         dTFNMIjB5VJKxzAtk0Fu/hRG1AYbtfPFQD0jeWnuPTctAPyHO91O66Rho/6kPFvTG+t8
         B/OF69FEfdiFio+fN6PSG4HBtIbvNphii0or7MOboffcyJfsc7KgPdVgGwqJ66qSiHhE
         ICCngyxAky74dqZJNHrV92WfqakRQxTp4/IpQ3vjGZOygGozdxQgVx4B86fhn59+RemC
         cv3Q==
X-Gm-Message-State: AJIora/JszYBY+48o27UadRO1SMM34u4Ng8R1MHbanSnTh/7xcxxCMtY
        Swq2tYop7UHweDJk1VpS+JeJ6Q==
X-Google-Smtp-Source: AGRyM1tJZYtxnASCsxqK+7V49arOq5yF0QjZMg3KFV9qbbpzWtrgkfnbJu59YMD0iexUSexYY4hWBQ==
X-Received: by 2002:a05:6512:2205:b0:484:e296:62fa with SMTP id h5-20020a056512220500b00484e29662famr3118429lfu.142.1657096773723;
        Wed, 06 Jul 2022 01:39:33 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id q10-20020a056512210a00b00477a287438csm6176592lfr.2.2022.07.06.01.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 01:39:33 -0700 (PDT)
Message-ID: <5cc844ea-0853-16be-785e-2b08dbbb8493@linaro.org>
Date:   Wed, 6 Jul 2022 10:39:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 10/13] ARM: dts: qcom: add sic non secure node for ipq8064
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jonathan McDowell <noodles@earth.li>
References: <20220705133917.8405-1-ansuelsmth@gmail.com>
 <20220705133917.8405-11-ansuelsmth@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705133917.8405-11-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 15:39, Christian Marangi wrote:
> Add missing sic non secure node for ipq8064.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Tested-by: Jonathan McDowell <noodles@earth.li>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 98527a7d885e..ef8faee6dfd4 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -543,6 +543,11 @@ saw1: regulator@2099000 {
>  			regulator;
>  		};
>  
> +		sic_non_secure: sic-non-secure@12100000 {
> +			compatible = "syscon";

syscon alone is not allowed

> +			reg = <0x12100000 0x10000>;
> +		};
> +
>  		gsbi2: gsbi@12480000 {
>  			compatible = "qcom,gsbi-v1.0.0";
>  			cell-index = <2>;


Best regards,
Krzysztof
