Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A70713E96EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 19:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhHKRiJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 13:38:09 -0400
Received: from mail-pj1-f53.google.com ([209.85.216.53]:38774 "EHLO
        mail-pj1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbhHKRiI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 13:38:08 -0400
Received: by mail-pj1-f53.google.com with SMTP id lw7-20020a17090b1807b029017881cc80b7so10782667pjb.3;
        Wed, 11 Aug 2021 10:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LoybAd5sHCpogBbkvPiZHgRz3J1+CJcAGwXd1p0kfEA=;
        b=id1DC+YhCePIB3mt8SXtR1ZH+PjYoBJh3fyYeN4LB/u8CN8EkFb2sfLHV+1w/uQs6s
         GUXIEh7EC1+G6WOOGiCmMagL+hzTkB4bECkjGB9uMVIPz8tVYCHYYGnbtkTflNghzBXB
         kfSjwJXRiq1cUSZ3Wntc3VLglpxBXCeBfXwl1DxSaZxTwfnhzlwUumFs9ELIK5p62t4b
         CzmiY+fRt4Rm3lgYuli8+6Uqy+tPRGrdFYhRb0RbgP+hnq2EMGLaKLQ+8AzmRSZtb+ZS
         +j+0u5BkPytQPaHVUqyvtnzlaBJYSE4Ve3UU9/REZ0UfR+pmENGY3tvbxaSXG9RqEzvx
         6wJw==
X-Gm-Message-State: AOAM531DW5wIyyqAe8q2z4c1hMwKCxE96Mb39T7KfipVQe0IVIOJV+q0
        JPkicfr94fCdgkTgQ2NK0g==
X-Google-Smtp-Source: ABdhPJzSoy3yDNPff3jDteYw59XJCtZCU80BKNbY3DzC9F3qQY7IG14H4MAq67eel9fY/L2w37r12Q==
X-Received: by 2002:a17:90a:a42:: with SMTP id o60mr11780394pjo.191.1628703464404;
        Wed, 11 Aug 2021 10:37:44 -0700 (PDT)
Received: from robh.at.kernel.org ([208.184.162.215])
        by smtp.gmail.com with ESMTPSA id z20sm124823pfr.121.2021.08.11.10.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 10:37:43 -0700 (PDT)
Received: (nullmailer pid 4096083 invoked by uid 1000);
        Wed, 11 Aug 2021 17:37:39 -0000
Date:   Wed, 11 Aug 2021 11:37:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibis@codeaurora.org,
        sboyd@kernel.org, mpubbise@codeaurora.org
Subject: Re: [PATCH v2 2/3] dt-bindings: remoteproc: qcom: Add SC7280 WPSS
 support
Message-ID: <YRQK4xgxTAD2ALME@robh.at.kernel.org>
References: <1628618483-664-1-git-send-email-pillair@codeaurora.org>
 <1628618483-664-3-git-send-email-pillair@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1628618483-664-3-git-send-email-pillair@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 10, 2021 at 11:31:22PM +0530, Rakesh Pillai wrote:
> Add WPSS PIL loading support for SC7280 SoCs.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,hexagon-v56.yaml      | 79 ++++++++++++++++++++--
>  1 file changed, 74 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml
> index 5f3558e..9ae433c6 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,qcs404-cdsp-pil
> +      - qcom,sc7280-wpss-pil
>        - qcom,sdm845-adsp-pil
>  
>    reg:
> @@ -26,25 +27,30 @@ properties:
>  
>    interrupts-extended:
>      minItems: 5
> -    maxItems: 5
> +    maxItems: 6
>  
>    interrupt-names:
>      minItems: 5
> -    maxItems: 5
> +    maxItems: 6
>  
>    clocks:
> -    minItems: 7
> +    minItems: 3

Patch 1 shows 3 clocks are valid...

>      maxItems: 8
>      description:
>        List of phandles and clock specifier pairs for the Hexagon,
>        per clock-names below.
>  
>    clock-names:
> -    minItems: 7
> +    minItems: 3
>      maxItems: 8
>  
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  power-domain-names:
> +    minItems: 1
> +    maxItems: 2
>  
>    resets:
>      minItems: 1
> @@ -92,6 +98,7 @@ required:
>    - clocks
>    - clock-names
>    - power-domains
> +  - power-domain-names

It's not backwards compatible to add a required property.

>    - qcom,halt-regs
>    - memory-region
>    - qcom,smem-states
> @@ -129,6 +136,31 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,sc7280-wpss-pil
> +    then:
> +      properties:
> +        interrupts-extended:
> +          items:
> +            - description: Watchdog interrupt
> +            - description: Fatal interrupt
> +            - description: Ready interrupt
> +            - description: Handover interrupt
> +            - description: Stop acknowledge interrupt
> +            - description: Shutdown acknowledge interrupt
> +        interrupt-names:
> +          items:
> +            - const: wdog
> +            - const: fatal
> +            - const: ready
> +            - const: handover
> +            - const: stop-ack
> +            - const: shutdown-ack

The items lists can go in the main section with 'minItems: 5' and just 
'minItems: 6' here.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
>                - qcom,sdm845-adsp-pil
>      then:
>        properties:
> @@ -211,6 +243,26 @@ allOf:
>          power-domains:
>            items:
>              - description: CX power domain
> +        power-domain-names:
> +          items:
> +            - const: cx
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7280-wpss-pil
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: CX power domain
> +            - description: MX power domain
> +        power-domain-names:
> +          items:
> +            - const: cx
> +            - const: mx

As 'cx' is always the first entry, the 'items' lists here can be moved 
to the main section and you just need minItems or maxItems in the 
if/then.

>  
>    - if:
>        properties:
> @@ -244,6 +296,23 @@ allOf:
>            items:
>              - const: restart
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7280-wpss-pil
> +    then:
> +      properties:
> +        resets:
> +          items:
> +            - description: AOSS restart
> +            - description: PDC SYNC
> +        reset-names:
> +          items:
> +            - const: restart
> +            - const: pdc_sync
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> -- 
> 2.7.4
> 
> 
