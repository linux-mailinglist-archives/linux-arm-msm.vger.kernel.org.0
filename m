Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8A1574B27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 12:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbiGNKug (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 06:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238147AbiGNKue (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 06:50:34 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34919550A9
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:50:32 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id bx13so1721387ljb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Z7MLNfS7kpF23MkCCTVtj5YNhoPMRTO751pyRtCbFcs=;
        b=oET52dqA3ro7HwCzr2WcBcKO6o1/fBPd/rcBiOt9K2M5jPMq4rMwltCwIvWbavm28h
         ccDK8+zQgmZudlq4j+GdwJgXIWeewY6n/Iy1QMITPTmwcJRxQMJIekmV08IqhErEKdPY
         SVZZjIDNwKae4bA4MaGJNQesOrWCfsQhKCSKzBPTNwuxsANFEYpAt/ClUtET/BSezuYs
         W8HtUx5g0Kiyco6n/mVJEKcWJka9DXieT/GIHFeSwUCQ0f4dngjT87kDV5HmsDZp6f2S
         JaJ8Vw9qgAmgwn6+fHzt0+yYNNDPP6rRmQpiIcCJR8bWddVa/ZF1A7ASGPQNE+D346eC
         xaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Z7MLNfS7kpF23MkCCTVtj5YNhoPMRTO751pyRtCbFcs=;
        b=nVhB3rusfdRdn3WYyAx35KOs/UFzyhy0vx2VmXTudfopbXiRE6MnT8lp72l7WtH8sg
         W+R0I+4hEffPZ871xGoTtFNxHQ5nJuwwuh25alvn7xeO06Xu7gNH2FQ3ALs4OTGD1bYY
         gh2JkTmffoccahLzbGJqq65EjHTMa7xKmRl92dQCWLucIVYeqrBwV9RMqpcz1O31eYcq
         C1mi7XuzS3XJSsj09yVsib0d+i4Fiq/NLfrT5PxntQZmBBbiqsdqShqbQdC4W9QKA08j
         +JDNm8lqkdygXTQxSTpQdMEdV6plPnQFiInlIGVf7qRrRVCROlKz3piY9lVgH09reydt
         pbtg==
X-Gm-Message-State: AJIora/CHwRVQ/SgET7B1h1nrW4QWDE1BBasRjstLh3y30Uxg7XalSDy
        FQzs46SKtu5M5f11FwCeVMsxOQ==
X-Google-Smtp-Source: AGRyM1sQ37UwVB00AS/TuBt9WhFKv6nkOywtjL2/GJD2YMpDoX5RAV3WYiT85/7MfbOftTAHsEvD3A==
X-Received: by 2002:a05:651c:1061:b0:25d:6302:68a2 with SMTP id y1-20020a05651c106100b0025d630268a2mr4091981ljm.212.1657795830591;
        Thu, 14 Jul 2022 03:50:30 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id y10-20020a0565123f0a00b00489ec0d7636sm292350lfa.110.2022.07.14.03.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 03:50:29 -0700 (PDT)
Message-ID: <18d4d8f6-ae5d-382c-e23f-1630bda42c37@linaro.org>
Date:   Thu, 14 Jul 2022 12:50:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/7] dt-bindings: usb: qcom,dwc3: refine interrupt
 requirements
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220713131340.29401-1-johan+linaro@kernel.org>
 <20220713131340.29401-3-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220713131340.29401-3-johan+linaro@kernel.org>
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

On 13/07/2022 15:13, Johan Hovold wrote:
> Not all platforms have all of the four wakeup interrupts currently
> described by the bindings.
> 
> Specifically, MSM8953/6/8 and SDM660 do not use the DP/DM interrupts,
> while the SS PHY interrupt is optional on SDM660 and SC7280.
> 
> Note that no devicetree in mainline specify any wakeup interrupts for
> 
>   - qcom,ipq4019-dwc3
>   - qcom,ipq6018-dwc3
>   - qcom,ipq8064-dwc3
>   - qcom,ipq8074-dwc3
>   - qcom,msm8994-dwc3
>   - qcom,qcs404-dwc3
> 
> but let's keep the schema warnings about that for now.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  .../devicetree/bindings/usb/qcom,dwc3.yaml    | 60 +++++++++++++++++--
>  1 file changed, 55 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index c991d9103f87..fea3e7092ace 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -94,9 +94,11 @@ properties:
>        - const: apps-usb
>  
>    interrupts:
> +    minItems: 1
>      maxItems: 4
>  
>    interrupt-names:
> +    minItems: 1
>      maxItems: 4
>  
>    qcom,select-utmi-as-pipe-clk:
> @@ -333,14 +335,9 @@ allOf:
>                - qcom,ipq6018-dwc3
>                - qcom,ipq8064-dwc3
>                - qcom,ipq8074-dwc3
> -              - qcom,msm8953-dwc3
>                - qcom,msm8994-dwc3
> -              - qcom,msm8996-dwc3
> -              - qcom,msm8998-dwc3
>                - qcom,qcs404-dwc3
>                - qcom,sc7180-dwc3
> -              - qcom,sc7280-dwc3
> -              - qcom,sdm660-dwc3
>                - qcom,sdm845-dwc3
>                - qcom,sdx55-dwc3
>                - qcom,sdx65-dwc3
> @@ -369,6 +366,59 @@ allOf:
>              - const: dm_hs_phy_irq
>              - const: dp_hs_phy_irq
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8953-dwc3
> +              - qcom,msm8996-dwc3
> +              - qcom,msm8998-dwc3
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 2
> +        interrupt-names:
> +          items:
> +            - const: hs_phy_irq
> +            - const: ss_phy_irq
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sdm660-dwc3
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 1
> +          maxItems: 2
> +        interrupt-names:
> +          minItems: 1
> +          items:
> +            - const: hs_phy_irq
> +            - const: ss_phy_irq
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7280-dwc3
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 3
> +          maxItems: 4
> +        interrupt-names:
> +          minItems: 3
> +          items:
> +            - const: hs_phy_irq
> +            - const: dp_hs_phy_irq
> +            - const: dm_hs_phy_irq
> +            - const: ss_phy_irq

OK, I see now that you used SC8280XP order matching this one.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> +
>    - if:
>        properties:
>          compatible:


Best regards,
Krzysztof
