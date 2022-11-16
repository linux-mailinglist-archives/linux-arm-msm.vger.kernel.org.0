Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E244962BCBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233588AbiKPL5r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:57:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239277AbiKPL5Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 06:57:25 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312B22CE3F
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:49:33 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id z24so21514139ljn.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D4yQuD++gHc/GHIwBktSITQt5Jig/BfC/opKH/PnkSM=;
        b=BX2kZt1rlLhnmA9uX9tCVWARUnGOnsUT/L56si9opqSB0mmmkQ+Rgd0KfWXSOMl0zO
         vZW57IhT79BFGGV0yfoKw7Cra9dYPt6soKnGIA+D+HA9OvXSxm+c7TE4o6bs5kGVtA0L
         5dJavtQwH+jaPJdV8X74Gbb5OwAYFQxf7cTnbQ1oLGKaZuJivFaSt37yjZ8y3RW8jMdh
         10hVfO+993wwv6bJ3K6L4zmbL2nXwOTPtXHDGJgjWjmjRT7pDRWFPaw3sImKXAkAReOd
         U6Na5K2H7pXhWAXb9XWnPGk/aQDy1ctat+OCF5Tu2GwbWV/MovuiaPLqlacF0AQ0QOat
         fKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4yQuD++gHc/GHIwBktSITQt5Jig/BfC/opKH/PnkSM=;
        b=b4Syff04BZc9o5Ee19xWP4a1LoGKQeZp5MpU3NQjD21Ovujh2hqIY3gS3fVcM+8bXM
         1pwdkzktc/K0huZgZvM2y4u/vRkx8wPZmX8WeJXYcBDnomqQeWejHKR+muvStWobB0/Y
         +/2XKlEiTaRyeJkh9VBDNk0InzYPNo/XYrzHCyzDukF479MNtVUwWPv4TAcmzVTxg8Eg
         JLslb4RBFTfMQEZaKBo1NZB4GgLzOUqqTqKcCk+ZkRfoAUu93NMf+6OlZJrbAKgC2XA4
         beSCIXkOMN/yEXDcCsExiXVIS5E+n3Ah3qyepdyXu8PUlm5zvbH6SEv6ZumL9bUJtT0k
         TtMw==
X-Gm-Message-State: ANoB5plNrugKPHlrsyQDkYO3d+oNGDc/YfbPskfAT78Mb7xIGs7a8UJA
        B7gcd/xpAtpbCxxVxQTSLlcieA==
X-Google-Smtp-Source: AA0mqf76HRCov0FT6yjAI+NG83nlIDMQsyrRZ3GksITd7qJmgy2BlU2UzFWnoblRuWHCEm/1/NrGVg==
X-Received: by 2002:a05:651c:1308:b0:277:70fb:8576 with SMTP id u8-20020a05651c130800b0027770fb8576mr7038093lja.106.1668599371557;
        Wed, 16 Nov 2022 03:49:31 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 24-20020ac24838000000b004a2550db9ddsm2543692lft.245.2022.11.16.03.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 03:49:31 -0800 (PST)
Message-ID: <97cd880f-c51c-67f5-eb33-4c211e862e73@linaro.org>
Date:   Wed, 16 Nov 2022 12:49:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] dt-bindings: dma: qcom,bam-dma: Add 'interconnects'
 and 'interconnect-names'
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-qce-v1-0-31b489d5690a@linaro.org>
 <20221114-narmstrong-sm8550-upstream-qce-v1-1-31b489d5690a@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-qce-v1-1-31b489d5690a@linaro.org>
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

On 16/11/2022 11:23, Neil Armstrong wrote:
> From: Abel Vesa <abel.vesa@linaro.org>

Subject is precious, so after prefixes (these are good) just "Add
interconnects".

> 
> Add 'interconnects' and 'interconnect-names' as optional properties
> to the device-tree binding documentation for BAM DMA IP.
> 
> These properties describe the interconnect path between BAM and main
> memory and the interconnect type respectively.

Where is the type described? What is an "interconnect type"?

> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
Best regards,
Krzysztof

