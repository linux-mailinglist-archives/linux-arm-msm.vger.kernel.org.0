Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39EFE562E59
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 10:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234753AbiGAIdl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 04:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234899AbiGAIdk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 04:33:40 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF3624BE7
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Jul 2022 01:33:38 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id c65so2030182edf.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Jul 2022 01:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zcyeyug8N5POp+3jt+1UqliyhOpxyagkLr/iLfovg0Q=;
        b=gYtlT963/Z6mi/VhzzIocugVatvlQipb8905qqzzqduECW/jCqUE8gUcsn4Glji28x
         05fZ12pMnwHkMbJYCQLTrOQOvRR2C7nLtZpX2PwsG0cqGa68jSGybvO+eRnMoRrDb5iq
         j7WZVIjil1liqg8EBMJQOV781GQPOftNEEmTkk1U3LyoLN3KPbMkwnAdlDITA4QAIx0D
         v4LP+ZQp3zfADpjJrY3uHTH49c6lvQnq5KDTJPz0+Slcz/rqXivhmCWXJAZvaQMMNzIk
         cIslbw4ZdmwMY5yH6TyV9qhvmwluY26XQIlDW8FI41QBI9Wi5y8FzadfmjY+dt0qH23c
         4Hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zcyeyug8N5POp+3jt+1UqliyhOpxyagkLr/iLfovg0Q=;
        b=5xXXB2PICL7sFY3bYB0vRcaUMATLc0MWKhSYaKnAhvdXoNyzjEuFpZuPXcMfqxVOCe
         Wfl3/oZ9H0yuK86oQaVZ8R/zAAIE1oIEghLZm3hn+xNLhP2VGVjuW+4336+k24Qn9cKd
         VqwDTGEBQoYeKDcE9DHF3YoE7f1pU7qN7s9dGoDzTMJlOaPW8dcHLo6HRW5GLO3WxkO7
         mrNTR5Y68mUlUDvI0ZZk8+4P7RUGTCpxAezU2IWmMHqdK93Aim19tWnRCJfHNglchCqG
         vqC3ZeSkAozjXLcE0vJTi2fvjaIckEyw9z3OobpNILjgsXKeXpMoo4WJ1Up3gwQS2q1H
         EP/Q==
X-Gm-Message-State: AJIora+yWvZkFI4ieIGWbsM4xjMQiOW2Jkj/MOR6yqgebCVSv7y27pcv
        XAERunxdxP4DZf7B836wL037Ew==
X-Google-Smtp-Source: AGRyM1vvvzQ7PqwrAL7vOdGWHHfWG7Dx96ZnyzSBQFpZo0/VK6hwnKrYxGxaG7XKf4RAolcyGIle4w==
X-Received: by 2002:a05:6402:2548:b0:437:62de:668 with SMTP id l8-20020a056402254800b0043762de0668mr17174670edb.143.1656664417062;
        Fri, 01 Jul 2022 01:33:37 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g3-20020a1709061c8300b0070759e37183sm10133834ejh.59.2022.07.01.01.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 01:33:36 -0700 (PDT)
Message-ID: <c20ba06c-b37a-e91c-84c6-6d2147bb2478@linaro.org>
Date:   Fri, 1 Jul 2022 10:33:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 03/10] dt-bindings: PCI: qcom: Enumerate platforms with
 single msi interrupt
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220629141000.18111-1-johan+linaro@kernel.org>
 <20220629141000.18111-4-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629141000.18111-4-johan+linaro@kernel.org>
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

On 29/06/2022 16:09, Johan Hovold wrote:
> Explicitly enumerate the older platforms that have a single msi host
> interrupt. This allows for adding further platforms without resorting
> to nested conditionals.
> 
> Drop the redundant comment about older chipsets instead of moving it.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

This does not exist in linux-next, so it should be squashed it with the
previous series.

> ---
>  .../devicetree/bindings/pci/qcom,pcie.yaml      | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> index a1b4fc70e162..8560c65e6f0b 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> @@ -625,7 +625,6 @@ allOf:
>          - reset-names
>  
>      # On newer chipsets support either 1 or 8 msi interrupts
> -    # On older chipsets it's always 1 msi interrupt
>    - if:
>        properties:
>          compatible:
> @@ -660,7 +659,21 @@ allOf:
>                  - const: msi5
>                  - const: msi6
>                  - const: msi7
> -    else:
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,pcie-apq8064
> +              - qcom,pcie-apq8084
> +              - qcom,pcie-ipq4019
> +              - qcom,pcie-ipq6018
> +              - qcom,pcie-ipq8064
> +              - qcom,pcie-ipq8064-v2
> +              - qcom,pcie-ipq8074
> +              - qcom,pcie-qcs404

Otherwise I cannot even check the context...

> +    then:
>        properties:
>          interrupts:
>            maxItems: 1


Best regards,
Krzysztof
