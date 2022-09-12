Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F05B85B6131
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 20:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbiILSkl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 14:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbiILSkT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 14:40:19 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD92EBC22
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 11:39:47 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id p1-20020a17090a2d8100b0020040a3f75eso9027344pjd.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 11:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=bs6cY7jsJqoKWWPHSReiAiAq8v2yuiAMDwslSXetISo=;
        b=rcXmXPCVnwCcRVgP2Twc30tTHXUF+WsfGDNbmtzRFUEU9vaxsyXceGBG7JTMjbiT8G
         wkfZapuTCZOuPsq4/c0vPoyL/WNn1DtoJekFDrCwa7zD32zpxvb/S5V9XsbhlNh4+2e3
         WZvOQVtKWg4xyZi7H/rIVhrTbsSIwwwwfvqGra67loAudGAFeB8172IdWwq0crHFiJWm
         eSu9O5l4+zgZHfr3o1bmTbl/dtYwV/o189fTmy0Mh4FxBQgvSAE9kG9sTbjZAt5hj4p+
         /Jg5E+nt4XJDGVEgt3L+Y/EAN+5YdO7CHVTZuK7VVW7m/dtQSPJOS6/Wltq9DZfPAqAy
         Ekmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bs6cY7jsJqoKWWPHSReiAiAq8v2yuiAMDwslSXetISo=;
        b=XDd5jE3Jb3EDf4hpkM3zur92eo7hjX5f2s+zefVBU+2LoEpG2oBd5OJRLwMxcYxIdf
         g80wzzAyPQFQYAgCp+dQC1t/SZ77A6Bm6PyrV/q9uqigzEYHnGXsBqFCGiuQr8CvPcED
         +a7Ip0rLo28nLjOGtEb4SiU5jrGw68/At45bxjcP5n5dbCt8evXCG1ZX5W9vYXTGLJPf
         HcRzL0l79ew2mMwAQaTZJDLnJqjiXRobMLoJw5lw2vu9O6QuwzRI8a20JM97TBZvKtPc
         YlOUI7EN2WD+6gkFbWEDOMNLGvbg3bCJO7CHZmsZvtkAvljkN+VJ4TAi5mlnGujTecsh
         l9Gw==
X-Gm-Message-State: ACgBeo3575hcdW+y/61/U6SY9L2n0qO+6/QiVixs94YOCZlb3xYgUBSE
        TlXDVQV00AcomQagiB/wkvLMUxXRz8glwA==
X-Google-Smtp-Source: AA6agR50Ne1mei+wMUxARhvXYS3lsDFitgnEjrHfsvDUce33WQnq7GF8owQjID6Zrcapn13BcvL+nQ==
X-Received: by 2002:a17:90b:2743:b0:200:9be5:d492 with SMTP id qi3-20020a17090b274300b002009be5d492mr25287793pjb.237.1663007986508;
        Mon, 12 Sep 2022 11:39:46 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c60:5362:9d7f:2354:1d0a:78e3? ([2401:4900:1c60:5362:9d7f:2354:1d0a:78e3])
        by smtp.gmail.com with ESMTPSA id s18-20020a170902c65200b00176d8e33601sm6312937pls.203.2022.09.12.11.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 11:39:46 -0700 (PDT)
Message-ID: <0f98adbf-1786-7212-77e2-22c58484aed1@linaro.org>
Date:   Tue, 13 Sep 2022 00:09:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/4] dt-bindings: net: snps,dwmac: Update interrupt-names
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Miller <davem@davemloft.net>
References: <20220907204924.2040384-1-bhupesh.sharma@linaro.org>
 <20220907204924.2040384-5-bhupesh.sharma@linaro.org>
 <71d970bc-fe6f-91e7-80c1-711af1af5530@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
In-Reply-To: <71d970bc-fe6f-91e7-80c1-711af1af5530@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/8/22 8:13 PM, Krzysztof Kozlowski wrote:
> On 07/09/2022 22:49, Bhupesh Sharma wrote:
>> As commit fc191af1bb0d ("net: stmmac: platform: Fix misleading
>> interrupt error msg") noted, not every stmmac based platform
>> makes use of the 'eth_wake_irq' or 'eth_lpi' interrupts.
>>
>> So, update the 'interrupt-names' inside 'snps,dwmac' YAML
>> bindings to reflect the same.
>>
>> Cc: Bjorn Andersson <andersson@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Vinod Koul <vkoul@kernel.org>
>> Cc: David Miller <davem@davemloft.net>
>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/net/snps,dwmac.yaml | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> index f89ca308d55f..4d7fe4ee3d87 100644
>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> @@ -105,10 +105,12 @@ properties:
>>   
>>     interrupt-names:
>>       minItems: 1
>> -    items:
>> -      - const: macirq
>> -      - const: eth_wake_irq
>> -      - const: eth_lpi
>> +    maxItems: 3
>> +    contains:
>> +      enum:
>> +        - macirq
>> +        - eth_wake_irq
>> +        - eth_lpi
>>   
> 
> This gives quite a flexibility, e.g. missing macirq. Instead should be
> probably a list with enums:
> items:
>    - const: macirq
>    - enum: [eth_wake_irq, eth_lpi]
>    - enum: [eth_wake_irq, eth_lpi]

Ok, will fix in v2.

Thanks.
