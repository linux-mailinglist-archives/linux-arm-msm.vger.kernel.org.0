Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4A0E3C8BCD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 21:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhGNThy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 15:37:54 -0400
Received: from mail-io1-f45.google.com ([209.85.166.45]:38649 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbhGNThy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 15:37:54 -0400
Received: by mail-io1-f45.google.com with SMTP id k11so3557875ioa.5;
        Wed, 14 Jul 2021 12:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I9cbY2zLQFzzSMRYvij/HrHruhuv2+3LhPqCX5tEvf8=;
        b=lrbbwD6HBXdgagHCUvUv4/0QvjkDG9Lvek9202qOLUWEhCZiO4GyMgNEAQRgzOOEMI
         mB1QJOVf1VPf18UBJoS67RlYj6R6n/mczSTBmCQQzM1uPQ5j8x+SQ6PHEgbqBVFjXcZK
         LXm+W0ldeRsEnrZ90OffJS/P2kHH8LYJvbbyhCFcNTQPaYL86s4rzPd/vDzkI1CAwmsM
         qMFESMQoZjr54uXHz7BX9+KxuHI0ncQVa2oASjK1PS7GVeMOhl+q6J7SMiXzVLAw7095
         +EWVKaB7N+CS3w6aXHAQqmo/Hh5qadUlmhcFnq7Ga1fwuwX18rGIFMOcPvruJe3QLxBr
         ft9Q==
X-Gm-Message-State: AOAM533DGhr+LyV6uPhpMPeNMQc5Bm89LodKJeh0VDsBKYb42SiJsrfv
        GwMzvSwtuFPD9RxKSAahPg==
X-Google-Smtp-Source: ABdhPJyWnnBrYi+ysmr1HNE1YFp9NVtkig0vOQZRaegvvQgtileSC2STDqokiGX34V4lb/bBU5VNkQ==
X-Received: by 2002:a05:6638:144e:: with SMTP id l14mr9269698jad.69.1626291300895;
        Wed, 14 Jul 2021 12:35:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c4sm1697467ilq.70.2021.07.14.12.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 12:34:59 -0700 (PDT)
Received: (nullmailer pid 3145390 invoked by uid 1000);
        Wed, 14 Jul 2021 19:34:57 -0000
Date:   Wed, 14 Jul 2021 13:34:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v3 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP
 bindings
Message-ID: <20210714193457.GA3135088@robh.at.kernel.org>
References: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
 <1624560727-6870-3-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624560727-6870-3-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 25, 2021 at 12:21:56AM +0530, Sibi Sankar wrote:
> Add Qualcomm Mailbox Protocol (QMP) binding to replace the power domains
> exposed by the AOSS QMP node.

Not a compatible change. Explain why that's okay for all 
platforms/users.

> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> v3:
>  * Misc. documentation fixes:
>   - Reduce power-domain maxItems due to load_state pd removal
>   - Combine compatibles where possible with the load_state pd removal
>   - Fixup the qcom,qmp ref to phandle type
> 
>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 62 +++++++++++-----------
>  1 file changed, 30 insertions(+), 32 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> index 9ea05e608bc1..ad85617b43fa 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> @@ -75,11 +75,11 @@ properties:
>  
>    power-domains:
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 2
>  
>    power-domain-names:
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 2
>  
>    firmware-name:
>      $ref: /schemas/types.yaml#/definitions/string
> @@ -89,6 +89,10 @@ properties:
>      maxItems: 1
>      description: Reference to the reserved-memory for the Hexagon core
>  
> +  qcom,qmp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Reference to the AOSS side-channel message RAM.
> +
>    qcom,smem-states:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      description: States used by the AP to signal the Hexagon core
> @@ -359,13 +363,11 @@ allOf:
>        properties:
>          power-domains:
>            items:
> -            - description: Load State power domain
>              - description: CX power domain
>              - description: MX power domain
>              - description: MSS power domain
>          power-domain-names:
>            items:
> -            - const: load_state
>              - const: cx
>              - const: mx
>              - const: mss
> @@ -381,43 +383,20 @@ allOf:
>        properties:
>          power-domains:
>            items:
> -            - description: Load State power domain
>              - description: CX power domain
> -        power-domain-names:
> -          items:
> -            - const: load_state
> -            - const: cx
>  
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
> +              - qcom,sdx55-mpss-pas
>                - qcom,sm8150-mpss-pas
>                - qcom,sm8350-mpss-pas
>      then:
>        properties:
>          power-domains:
>            items:
> -            - description: Load State power domain
> -            - description: CX power domain
> -            - description: MSS power domain
> -        power-domain-names:
> -          items:
> -            - const: load_state
> -            - const: cx
> -            - const: mss
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,sdx55-mpss-pas
> -    then:
> -      properties:
> -        power-domains:
> -          items:
>              - description: CX power domain
>              - description: MSS power domain
>          power-domain-names:
> @@ -439,12 +418,10 @@ allOf:
>        properties:
>          power-domains:
>            items:
> -            - description: Load State power domain
>              - description: LCX power domain
>              - description: LMX power domain
>          power-domain-names:
>            items:
> -            - const: load_state
>              - const: lcx
>              - const: lmx
>  
> @@ -458,12 +435,10 @@ allOf:
>        properties:
>          power-domains:
>            items:
> -            - description: Load State power domain
>              - description: CX power domain
>              - description: MXC power domain
>          power-domain-names:
>            items:
> -            - const: load_state
>              - const: cx
>              - const: mxc
>  
> @@ -499,6 +474,29 @@ allOf:
>              - const: mss_restart
>              - const: pdc_reset
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7180-mpss-pas
> +              - qcom,sm8150-adsp-pas
> +              - qcom,sm8150-cdsp-pas
> +              - qcom,sm8150-mpss-pas
> +              - qcom,sm8150-slpi-pas
> +              - qcom,sm8250-adsp-pas
> +              - qcom,sm8250-cdsp-pas
> +              - qcom,sm8250-slpi-pas
> +              - qcom,sm8350-adsp-pas
> +              - qcom,sm8350-cdsp-pas
> +              - qcom,sm8350-mpss-pas
> +              - qcom,sm8350-slpi-pas
> +    then:
> +      properties:
> +        qcom,qmp:
> +          items:
> +            - description: Reference to the AOSS side-channel message RAM.
> +
>  examples:
>    - |
>      #include <dt-bindings/clock/qcom,rpmcc.h>
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
> 
