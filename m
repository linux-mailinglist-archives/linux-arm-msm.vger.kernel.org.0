Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9D15E84D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 23:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbiIWV0a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 17:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232920AbiIWV0S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 17:26:18 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED35713198D
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 14:26:15 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 10so2182996lfy.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 14:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=/aQ24Egg9dbeaeZ6X/ZW0Y0MW1uqAO/UMRzdqkbDm8M=;
        b=cPMsBi7pibMpOKx+mKfGFbF+9bDWsF6ODuWOeC+7aL6PiFUOCls6JRua524swQFmoo
         ZeYewX/nW1Henr2JgEbNw8+MeJKoFh7TifkSV4/ATtiZAdh25NfkeyX3FLUouX7JzG2T
         eXROk7YgbSCbX12DASaoEpNvyOrfqfpfeI3N6p4cFLfnKvmE6mOqaakruYmeqhfeH2uc
         xxAz4IM1OSSY/4qg3mmpsZnMjR/W1ZV5XpQjUU2ShyzmmZ5outwmO0CAzuOjuFeNVPDz
         CmR9WqINRX1OTEwci94H3ixz6X8qUEsTjSiVdYcdQhXTtr9q4CsudWzZRHRGqbfzrQKN
         +y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/aQ24Egg9dbeaeZ6X/ZW0Y0MW1uqAO/UMRzdqkbDm8M=;
        b=T4+UTrePFT+7+mhQ1ncG5Vemq2+5y9RtQDqmCpcqSFqe9iyO54PjcnmBzsUzZ9RuOu
         PuUcZg6W+sIkhxUwtykBCXfAZvvhr8cQo/5k2t1Rqd1dZohJ3dFqt9m4jcvSTfJm6xrC
         KM89Q0/c+40ASAbA5CNyn/qDNGjtRzw9u4qj/No5z53kejC2/xkmumBKGQz4RnZfb2D0
         g/sqUmtBSLd5LMLhyUOQ8kvqfo67uaThhPZFP1Iv4Jsc+PNXjKbEfwQ++pKECNbv44ZH
         lEA2AejiPwyMcp/1gGnmvGEQJth6kMmriZjZFhJmpOBybo9STi103LCEzXcN9pm71ypG
         vsDA==
X-Gm-Message-State: ACrzQf138DQkvQ3RBepHnzVV6S47y8V5dRfp1qs6RwUYE/ksLA6XtdZR
        HdRCmv0LsBIzk4rJtHOPjjcXuA==
X-Google-Smtp-Source: AMsMyM6mI34mz/fSmeVZC0rcmW2MHObqb4Ra4GsnD+kOqSbYGFLre2nBu0aZ9Jl9oPKAGq7uRpaRoQ==
X-Received: by 2002:a05:6512:308f:b0:49a:5a59:aa25 with SMTP id z15-20020a056512308f00b0049a5a59aa25mr3796333lfd.44.1663968374350;
        Fri, 23 Sep 2022 14:26:14 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f3-20020a2e3803000000b0026c04fbb08csm1547229lja.45.2022.09.23.14.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 14:26:13 -0700 (PDT)
Message-ID: <7b066e11-6e5c-c6d9-c8ed-9feccaec4c0c@linaro.org>
Date:   Fri, 23 Sep 2022 23:26:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 1/4] dt-bindings: dma: qcom: gpi: add fallback
 compatible
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20220923210934.280034-1-mailingradian@gmail.com>
 <20220923210934.280034-2-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220923210934.280034-2-mailingradian@gmail.com>
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

On 23/09/2022 23:09, Richard Acayan wrote:
> The drivers are transitioning from matching against lists of specific
> compatible strings to matching against smaller lists of more generic
> compatible strings. Add a fallback compatible string in the schema to
> support this change.

Thanks for the patch. I wished we discussed it a bit more. :)
qcom,gpi-dma does not look like specific enough to be correct fallback,
at least not for all of the devices. I propose either a IP block version
(which is tricky without access to documentation) or just one of the SoC
IP blocks.

> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../devicetree/bindings/dma/qcom,gpi.yaml       | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> index eabf8a76d3a0..25bc1a6de794 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -18,14 +18,15 @@ allOf:


Best regards,
Krzysztof

