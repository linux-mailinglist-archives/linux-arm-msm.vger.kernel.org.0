Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF8AC6FA12F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 09:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233140AbjEHHjb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 03:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233057AbjEHHj2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 03:39:28 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D8665BBA
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 00:39:26 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ac7c59665bso48354521fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 00:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683531564; x=1686123564;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9k0qgttr5Up7iAyIPphi4B567oHqC6JpudOloSY/+vo=;
        b=rHRBvzxEsDefFVSyf6IfBF9XvXiZEEdnaEsXGiOgJ1T2YUZnCK7j6SF6ClrpW2M6sk
         zpGh//3TnTbmGQv8v6YBeuOcAUIsttN5Wh/07VqT1O50lYALptWfRpxs6simVsv7KcoW
         REzcXPHenOxTRuIexLhbkrxMLPhb6uZ81MKPXwq3I46f4gDU83G8IL1ClfaFNT8SIkLX
         hXFAMEQdUtKSwJT0kwtHTc5MBYJCPfx1aThvOHBbAH+1h/7MKHpIPVjvrffPGAVaE30j
         aF7h93eTBQfsRk1GLzLz2d2hASy0EVJDuJfrcVD/Z8zydHeGafds3bYb0uR7I0kRs7mm
         9DjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683531564; x=1686123564;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9k0qgttr5Up7iAyIPphi4B567oHqC6JpudOloSY/+vo=;
        b=BxwPoBtYitoOY7JPYvB3EC73EvRU2mVbThv3d+HO7ldZhLzMpovWlFB/wD/vGcjMgl
         Fv88Ms6mDJ6Rd91ZGRBSZefvPU8KV0YaUjAkGHG/3PbuIgn6XnJdv4w4HkpW+bF5vzXr
         lyU1hdOjyGXEaReJAs+3SgDSZJBP7OGc9IL5Zq+6s9n67rBkan8873yFK5rai/gRYfXE
         fJ08e2y62gKgnneYdE5DDS00OPHG7vCifbUF7jaWBpq8xS7ZI01USReMf5Hezk5c3ekD
         T1Mc054Dtsp1hX/BXaDUCuRTt6Mkh0zzExLR4t8smX1/MhF28Kc1mHMExzZ7rj/HA1fm
         5x7w==
X-Gm-Message-State: AC+VfDz9vxbnzgb3Hx9mMq1+lWLjWFVWQ84Ie31qhiGzJOYOC7j0W/hF
        bB/9RxhmCUiHgmEAjI3UwsYh6A==
X-Google-Smtp-Source: ACHHUZ4c6jDmtALnyu5a2ovUvWgZSzq07sEu8jW66qjVplGw7vJZ0tNRQukEatHSlG/RDA+xO5Qt6g==
X-Received: by 2002:a2e:8553:0:b0:2ad:2d76:5e0a with SMTP id u19-20020a2e8553000000b002ad2d765e0amr1750661ljj.34.1683531564555;
        Mon, 08 May 2023 00:39:24 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id h13-20020a2e900d000000b002a9f022e8bcsm1060413ljg.65.2023.05.08.00.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 00:39:24 -0700 (PDT)
Message-ID: <29d1d210-8752-56b4-34be-8b078c639d36@linaro.org>
Date:   Mon, 8 May 2023 09:39:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 4/6] dt-bindings: sram: qcom,ocmem: Add msm8226 support
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230506-msm8226-ocmem-v1-0-3e24e2724f01@z3ntu.xyz>
 <20230506-msm8226-ocmem-v1-4-3e24e2724f01@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230506-msm8226-ocmem-v1-4-3e24e2724f01@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7.05.2023 11:12, Luca Weiss wrote:
> Add the compatible for the OCMEM found on msm8226 which compared to
> msm8974 only has a core clock and no iface clock.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  Documentation/devicetree/bindings/sram/qcom,ocmem.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
> index 4bbf6db0b6bd..515f0d8ec641 100644
> --- a/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
> +++ b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
> @@ -15,7 +15,9 @@ description: |
>  
>  properties:
>    compatible:
> -    const: qcom,msm8974-ocmem
> +    enum:
> +      - qcom,msm8226-ocmem
> +      - qcom,msm8974-ocmem
Any chance you could read the revision field on both and add comments
like:

- qcom,msm8974-ocmem # vX.Y

>  
>    reg:
>      items:
> @@ -28,11 +30,13 @@ properties:
>        - const: mem
>  
>    clocks:
> +    minItems: 1
>      items:
>        - description: Core clock
>        - description: Interface clock
allOf: if: properties: compatible: 8974 / then: clock(s|-names): minItems: 2

Konrad
>  
>    clock-names:
> +    minItems: 1
>      items:
>        - const: core
>        - const: iface
> 
