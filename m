Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58EED5006FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 09:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240416AbiDNHi4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 03:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240433AbiDNHiu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 03:38:50 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 691865620A
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 00:36:23 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id i27so8371640ejd.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 00:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=I08MYbmwCgj672tZNAB4iBcbAhXpDOOP8jOuTMDXcxE=;
        b=xC0mNjbcvnq1Ou090vpGtEyf/JNmAAqopzUB8R5qRblpAX0AXOaTlvMd52f4TxIlgH
         PCjoH3qxD0PG4oO0PKcWLPD75N6x/q24CyzaT2yyXjFGekLcf5TCwU1TWP6pkazeftX3
         p3YMc3P6ICx1e3g/Bgu14FuaWMo9F66pdTTmO+txflvH1KLkDdTf5sESkkym7fmMJkQh
         QLrzTOlxRRtCMv0se/rP6LISrU1f9w89+SYXxYRwlgfialzgm5RjV4MIOjietLGkGx1S
         po0lng2rSxKnoeqE3Q5NijJ/vkpOENLqQztqO1lIj+Aqkzb2daACvfx66qMC2zpD0NPD
         gdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=I08MYbmwCgj672tZNAB4iBcbAhXpDOOP8jOuTMDXcxE=;
        b=0IjlyBSxBPEW4RzMllUEpReeRzHgMcaRzM3T0WnKTUV0hLbyDGaKL58AwCjcfoSMIl
         JJYb7oS7Kuy8yleWrFbDNbJ7+ttCdNCdstPSGQiNwsYwsq/v48TfRJOUdnFAUOjVFgDU
         sMReF8XbYuspBGbEr0WqBw/g5wZLf5bkEmch0DqU1eFqUu7sF+0xASoykmmteweXIw2+
         82jDuD0JJfMWiUI2WPuhrDMsUKAldtwxsYQCXva/Dk36ryYg7k3KhOzEtQcJWhTE3pRB
         PGwaHyKaUj1FDir9utLRQ1MlxKkKDFocMoRFheCkJIKzT9s7pybcmZo5ry1EOvII0rx5
         z5vA==
X-Gm-Message-State: AOAM5324PZ5hjjAANDIAPSKfnChtHoZ4kV2bVRq939Rs0v/KvKYhnq7G
        obIoLnOVqaSe3G3aNoW48afI8A==
X-Google-Smtp-Source: ABdhPJw9UXjI9+jbhL/tFdNvzNFLdlGFRWM/OL0aA7R3lIQwwl9pVB+ilW7uG/3DORr2fspKHtyMbw==
X-Received: by 2002:a17:907:eaa:b0:6e8:9105:b3c7 with SMTP id ho42-20020a1709070eaa00b006e89105b3c7mr1248966ejc.26.1649921781804;
        Thu, 14 Apr 2022 00:36:21 -0700 (PDT)
Received: from [192.168.0.209] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id w6-20020a170906184600b006e8914a0a9fsm370288eje.88.2022.04.14.00.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 00:36:21 -0700 (PDT)
Message-ID: <0598d1bb-cd7c-1414-910c-ae6bedc8295d@linaro.org>
Date:   Thu, 14 Apr 2022 09:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: dmaengine: qcom: gpi: Add minItems for
 interrupts
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220414064235.1182195-1-vkoul@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220414064235.1182195-1-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/04/2022 08:42, Vinod Koul wrote:
> Add the minItems for interrupts property as well. In the absence of
> this, we get warning if interrupts are less than 13
> 
> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb:
> dma-controller@800000: interrupts: [[0, 588, 4], [0, 589, 4], [0, 590,
> 4], [0, 591, 4], [0, 592, 4], [0, 593, 4], [0, 594, 4], [0, 595, 4], [0,
>   596, 4], [0, 597, 4]] is too short
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> index 8a790ffbdaac..7d2fc4eb5530 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -32,6 +32,7 @@ properties:
>    interrupts:
>      description:
>        Interrupt lines for each GPI instance
> +    minItems: 1

This should be some real case minimum, not just 1. Unless really only
one interrupt is also possible in existing variations?


Best regards,
Krzysztof
