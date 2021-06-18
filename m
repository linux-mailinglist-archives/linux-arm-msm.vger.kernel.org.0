Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3987C3AD38F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 22:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233089AbhFRU12 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 16:27:28 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:35501 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbhFRU12 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 16:27:28 -0400
Received: by mail-ot1-f54.google.com with SMTP id 7-20020a9d0d070000b0290439abcef697so10930109oti.2;
        Fri, 18 Jun 2021 13:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ENIp1hh6YSjc7R6GTgBDUe9YFY5w8gaakH360LvmcC8=;
        b=gl+2OU8Y8drknV+bBC0ydCbT1bWwNu2ANimQM9lMAHEAs1c/JL2oa6HL5Cl37HLDWY
         CV/uCLD5mfysc4uGLJ3HHZ8y+iRJTgH15DZc/QkQGUzypP1Pzn/gJI1sYAWnxqmn0Sfy
         etlWgKQ/2g1Llr76pjgSgQzJ/X7j1Q6yCIbIenFWM+zIXysPYdSIc8lk3DUXuDsDH+7T
         o10s1Q7QdkjfOonIh/dWFZ/JUzIr4P5OP9XOWANgu4x6jWeM38BPGiX9u1/voLgHRgwl
         DiVMbkcOoDthpCowdAqYHzzg5o//ZNKqvT5Abun2D4fety0kmO6fIU4phiRuOidDGf1O
         VONA==
X-Gm-Message-State: AOAM532Z/1rHCNaV0zJv5lb8THtTZyQw0/i6FXkoiclHitvwL9dCIoVp
        J3KleEsgcZUC4JtDQJPOQQ==
X-Google-Smtp-Source: ABdhPJxNjSV/5PX6l3zNqJSfYMDQ4AkI3unWgkhGrj3aXXptEOv2YRHXLaQKSdch9Ak+T3S/GMa0WQ==
X-Received: by 2002:a05:6830:33ea:: with SMTP id i10mr10666571otu.342.1624047918161;
        Fri, 18 Jun 2021 13:25:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b2sm392618oic.56.2021.06.18.13.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 13:25:17 -0700 (PDT)
Received: (nullmailer pid 2818880 invoked by uid 1000);
        Fri, 18 Jun 2021 20:25:12 -0000
Date:   Fri, 18 Jun 2021 14:25:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        swboyd@chromium.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        rishabhb@codeaurora.org, sidgup@codeaurora.org
Subject: Re: [PATCH v2 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP
 bindings
Message-ID: <20210618202512.GA2811174@robh.at.kernel.org>
References: <1623080372-13521-1-git-send-email-sibis@codeaurora.org>
 <1623080372-13521-3-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623080372-13521-3-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 07, 2021 at 09:09:21PM +0530, Sibi Sankar wrote:
> Add Qualcomm Mailbox Protocol (QMP) binding to replace the power domains
> exposed by the AOSS QMP node.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> v2:
>  * Drop R-b from Rob/Stephen due to yaml conversion.
> 
>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 40 +++++++++++++++-------
>  1 file changed, 27 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> index 9ea05e608bc1..b6396bc07388 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> @@ -89,6 +89,10 @@ properties:
>      maxItems: 1
>      description: Reference to the reserved-memory for the Hexagon core
>  
> +  qcom,qmp:

Is there more than one QMP? If not just search for the QMP node and you 
can avoid the ABI issue at least partially.

> +    $ref: /schemas/types.yaml#/definitions/phandle-array

There's more than 1 cell? What's in them?

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
> @@ -381,12 +383,7 @@ allOf:
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
> @@ -399,12 +396,10 @@ allOf:
>        properties:
>          power-domains:
>            items:
> -            - description: Load State power domain
>              - description: CX power domain
>              - description: MSS power domain
>          power-domain-names:
>            items:
> -            - const: load_state
>              - const: cx
>              - const: mss
>  
> @@ -439,12 +434,10 @@ allOf:
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
> @@ -458,12 +451,10 @@ allOf:
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
> @@ -499,6 +490,29 @@ allOf:
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
