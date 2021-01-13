Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5666C2F4280
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 04:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbhAMD2f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 22:28:35 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:38020 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbhAMD2f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 22:28:35 -0500
Received: by mail-oi1-f179.google.com with SMTP id x13so694187oic.5;
        Tue, 12 Jan 2021 19:28:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=slEzrGNA4kdUyiamf2I44u1Nkx8BiRwusAekuEA0O4g=;
        b=eXyFfMceEVaTls2O1BC8a3Rw28EpYrJcKDKyTj7dsAS7xqThq6Ml8PG0TNrUikT1PC
         +VKR3VRniIQArQ11eba4T3BeBS0P+h+frI/iRC9H/n81mhWlGpSLylwXbqrGPmgqiTt+
         j8EDmbC8363RngAyiEMQD3Nr3n9xnFtZBpArgDPcvkniQOr4V6SoqCkVllKFnnI9/a2d
         nXUfFaCiRo8EICXfvdV3eKIRtMoAy+7U9pqT+h1ruQc4QZokn0JxQPFkwtsahgPFcqcF
         BxEFFzaWc6KHP4pvHewKIrz1gUgqZfHjLQrLQy8kf4qcH5GiHGhEN+t6Sul8RtPJE4Tq
         icwA==
X-Gm-Message-State: AOAM533w64A1CH7/2Cu+B4RZO/oXfk5sqnCWcpk3i3/WO/j+8nxAtozP
        wBFPgqu6tNxOlBQJoY5UYA==
X-Google-Smtp-Source: ABdhPJzIH9Ah9EsFqJBtr56qrwsRUef/QvPW3xzgU4qgXt6BCVltIgoO4BJeGbL7X7/0Oj8ep0lQIA==
X-Received: by 2002:aca:4355:: with SMTP id q82mr127313oia.132.1610508474095;
        Tue, 12 Jan 2021 19:27:54 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f201sm176766oig.21.2021.01.12.19.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 19:27:53 -0800 (PST)
Received: (nullmailer pid 1475163 invoked by uid 1000);
        Wed, 13 Jan 2021 03:27:52 -0000
Date:   Tue, 12 Jan 2021 21:27:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, viresh.kumar@linaro.org,
        ulf.hansson@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: mailbox: Add binding for SDX55 APCS
Message-ID: <20210113032752.GA1472520@robh.at.kernel.org>
References: <20210108113233.75418-1-manivannan.sadhasivam@linaro.org>
 <20210108113233.75418-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108113233.75418-2-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 08, 2021 at 05:02:29PM +0530, Manivannan Sadhasivam wrote:
> Add devicetree YAML binding for SDX55 APCS GCC block. The APCS block
> acts as the mailbox controller and also provides a clock output and
> takes 3 clock sources (pll, aux, ref) as input.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../mailbox/qcom,apcs-kpss-global.yaml        | 59 ++++++++++++++++---
>  1 file changed, 50 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index ffd09b664ff5..3c75ea0b6040 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -27,26 +27,24 @@ properties:
>        - qcom,sdm660-apcs-hmss-global
>        - qcom,sdm845-apss-shared
>        - qcom,sm8150-apss-shared
> +      - qcom,sdx55-apcs-gcc
>  
>    reg:
>      maxItems: 1
>  
> -  clocks:
> -    description: phandles to the parent clocks of the clock driver
> -    items:
> -      - description: primary pll parent of the clock driver
> -      - description: auxiliary parent

Keep this here and add the 3rd item and:

minItems: 2

Then the if/then can just restrict things to 2 or 3 items.

> -
>    '#mbox-cells':
>      const: 1
>  
>    '#clock-cells':
>      const: 0
>  
> +  clocks:
> +    minItems: 2
> +    maxItems: 3
> +
>    clock-names:
> -    items:
> -      - const: pll
> -      - const: aux
> +    minItems: 2
> +    maxItems: 3
>  
>  required:
>    - compatible
> @@ -55,6 +53,49 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,ipq6018-apcs-apps-global
> +            - qcom,ipq8074-apcs-apps-global
> +            - qcom,msm8916-apcs-kpss-global
> +            - qcom,msm8994-apcs-kpss-global
> +            - qcom,msm8996-apcs-hmss-global
> +            - qcom,msm8998-apcs-hmss-global
> +            - qcom,qcs404-apcs-apps-global
> +            - qcom,sc7180-apss-shared
> +            - qcom,sdm660-apcs-hmss-global
> +            - qcom,sdm845-apss-shared
> +            - qcom,sm8150-apss-shared
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Primary PLL parent of the clock driver
> +            - description: Auxiliary parent
> +        clock-names:
> +          items:
> +            - const: pll
> +            - const: aux
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,sdx55-apcs-gcc
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Primary PLL parent of the clock driver
> +            - description: Auxiliary parent
> +            - description: Reference clock
> +        clock-names:
> +          items:
> +            - const: pll
> +            - const: aux
> +            - const: ref
>  examples:
>  
>    # Example apcs with msm8996
> -- 
> 2.25.1
> 
