Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66F3D5B5EB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 19:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbiILRAW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 13:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbiILRAU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 13:00:20 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 097F711C23
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 10:00:18 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d82so9199479pfd.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 10:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=sfYBJC32ETGyteiWg3YC9wQpy2EzrGHLM+DajwGhI4I=;
        b=b9P3PVEQ9u6tuw4txhn443NBSCEH8tCVzgKr4rmIdZFsA7TJUheFOKJC7L39lri40z
         4NKkxjzd8vuOT7w+CY7VVC18Frtz41ldO3BbwB9sK6olTDNV6ACrIw2EDDG6MAesNhe1
         HoyK7EUtVSQBKgfpLvJ8kxwvN9xIbYqR/OLJuC4F9TzSeEbDUck+kq6bHLY1Zny2exPt
         IqNkab7JEGth4ZT2EjQRjbbVSNUHFK+XAKjKitJzYTRglRw4sIjKlqmebilPV/ZI3+tg
         st2WDmMsWFCwxApJhzVm9K0UYRehYXzLWdGzitqjmizle8lMy5vaj7DGoHakP4Eam9LX
         Kr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=sfYBJC32ETGyteiWg3YC9wQpy2EzrGHLM+DajwGhI4I=;
        b=r7Tr3S8NzrWsXb/E1Myznq1in4PBvxkFNnXzFHZiJCzD7vXdN0g8l731RGP9qyeiZi
         u597jxiygAFn4/fuCpM3UFgekUPO9q299+1PiS7cUXJV0lpjKLYP71ddZy3B38JNogjW
         OfkPZI6BjmBTEbNO07bMeTjguwIKCQ8/YGewivbsE3ltQggtO4oyi1xItz/q9jU5DNA9
         MKPEVkyMAofYGoqMVQRbItohooJRx7iR2ojYAlMh9buMpJi/sXzJ5Gu3qL9bzQWxjdfK
         q8gv36ngKN8FQlLPsOkqH4ro5bv3xfgmctDiX5aaZNZamppe1ojlWrT1MHw5imSWK4ih
         VloA==
X-Gm-Message-State: ACgBeo0pC2fFIeRlHyUxJR7vbXW+nSDduYJNNqloeKKoYPj5DGyPAM6o
        +YIvWjqztueV937yz8XcyxYe/Q==
X-Google-Smtp-Source: AA6agR4X4xWoT+7YRcOdp1xsn8Z9iuWeLxFphBLc3/8KNvPhY5ySw4xeAoZBvddlZJmKeRi76+goxQ==
X-Received: by 2002:a63:fc13:0:b0:42b:890d:5954 with SMTP id j19-20020a63fc13000000b0042b890d5954mr24154219pgi.200.1663002017237;
        Mon, 12 Sep 2022 10:00:17 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c60:5362:9d7f:2354:1d0a:78e3? ([2401:4900:1c60:5362:9d7f:2354:1d0a:78e3])
        by smtp.gmail.com with ESMTPSA id pg2-20020a17090b1e0200b001fd7fe7d369sm5442265pjb.54.2022.09.12.10.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 10:00:16 -0700 (PDT)
Message-ID: <333abaaa-4e56-7a4e-a4a1-f3f54970a21e@linaro.org>
Date:   Mon, 12 Sep 2022 22:30:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 5/9] dt-bindings: mmc: sdhci-msm: Add pinctrl-1
 property
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220910143213.477261-1-iskren.chernev@gmail.com>
 <20220910143213.477261-6-iskren.chernev@gmail.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
In-Reply-To: <20220910143213.477261-6-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/10/22 8:02 PM, Iskren Chernev wrote:
> Most mmc blocks contain two pinctrls, default and sleep. But then
> dt-schema complains about pinctrl-1 not being defined.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>   Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index a792fa5574a0..775476d7f9f0 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -97,6 +97,10 @@ properties:
>       description:
>         Should specify pin control groups used for this controller.
>   
> +  pinctrl-1:
> +    description:
> +      Should specify sleep pin control groups used for this controller.
> +
>     resets:
>       maxItems: 1
>   

Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Thanks.
