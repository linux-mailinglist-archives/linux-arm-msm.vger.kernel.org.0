Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFAC3386EF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 03:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237735AbhERBPK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 21:15:10 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:42549 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233019AbhERBPJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 21:15:09 -0400
Received: by mail-ot1-f45.google.com with SMTP id g15-20020a9d128f0000b02902a7d7a7bb6eso7221669otg.9;
        Mon, 17 May 2021 18:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gXuTarCdRG4FbjRrNapQDnR239Kr+miYeEbp6zyWB6c=;
        b=mH9YW0abx4shOszs3oz9qUbpkaC7FgFhNalGu0MNrPpF9oR2/qz4W1AeAunMoZyQUV
         Ln57HdYtH/wmapD2wifWqkX8UGo36y0hnHqfkyyDULBCyulzJK9MDcZZtGkhqZzNUuUX
         smWHrWcDC2a1MwjTzreyXyQKqX7bmFji0jRvCKxsB3qWWDGlCTR0dy9i5Q+sraxqq2ha
         9So/Bu4WgTuiNt9aK9cpoyMq8mcBJ8qSTtF7SiJNEG9tQJPkxN1NlJmmLGX+F1WTVxGl
         MIxCRHowCBW3Tf/ePVkucEDicvPSw4/tbPZ7gZwvZNcnDLqzzsNtKbSZO11Tx5L2xpYj
         w3XA==
X-Gm-Message-State: AOAM532Pj5n+tmjxIsvDM1vkdaP52p7RtYNbF05jqsWsnv1YDPDPRVZ1
        xL/J5OAV1DZEhAsPC/XlCw==
X-Google-Smtp-Source: ABdhPJyL1wO9aEqmdKo5tddche8pqdnryM1GTTtRhSdCQJ8TEUL1zX/wDjU6RBuPXliYnEcH40/zdA==
X-Received: by 2002:a9d:2aaa:: with SMTP id e39mr2076189otb.169.1621300432211;
        Mon, 17 May 2021 18:13:52 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a14sm3441985otl.52.2021.05.17.18.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 18:13:51 -0700 (PDT)
Received: (nullmailer pid 3577552 invoked by uid 1000);
        Tue, 18 May 2021 01:13:50 -0000
Date:   Mon, 17 May 2021 20:13:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: Document qcom,cpss-acc
Message-ID: <20210518011350.GA3572037@robh.at.kernel.org>
References: <20210513153442.52941-1-bartosz.dudziak@snejp.pl>
 <20210513153442.52941-2-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513153442.52941-2-bartosz.dudziak@snejp.pl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 13, 2021 at 05:34:41PM +0200, Bartosz Dudziak wrote:
> The CPSS ACC binding describes the clock, reset, and power domain
> controller for a Cortex-A7 CPU.
> 
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---
>  .../devicetree/bindings/arm/cpus.yaml         |  7 ++--
>  .../bindings/arm/msm/qcom,cpss-acc.yaml       | 41 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,cpss-acc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index 26b886b20b..f391e15184 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -204,6 +204,7 @@ properties:
>            - marvell,mmp3-smp
>            - mediatek,mt6589-smp
>            - mediatek,mt81xx-tz-smp
> +          - qcom,cpss-acc

This should not be the same as the compatible below.

>            - qcom,gcc-msm8660
>            - qcom,kpss-acc-v1
>            - qcom,kpss-acc-v2
> @@ -276,7 +277,7 @@ properties:
>        Specifies the SAW* node associated with this CPU.
>  
>        Required for systems that have an "enable-method" property
> -      value of "qcom,kpss-acc-v1" or "qcom,kpss-acc-v2"
> +      value of "qcom,kpss-acc-v1", "qcom,kpss-acc-v2" or "qcom,cpss-acc"
>  
>        * arm/msm/qcom,saw2.txt
>  
> @@ -286,9 +287,9 @@ properties:
>        Specifies the ACC* node associated with this CPU.
>  
>        Required for systems that have an "enable-method" property
> -      value of "qcom,kpss-acc-v1" or "qcom,kpss-acc-v2"
> +      value of "qcom,kpss-acc-v1", "qcom,kpss-acc-v2" or "qcom,cpss-acc"
>  
> -      * arm/msm/qcom,kpss-acc.txt
> +      * arm/msm/qcom,kpss-acc.txt or arm/msm/qcom,cpss-acc.yaml
>  
>    rockchip,pmu:
>      $ref: '/schemas/types.yaml#/definitions/phandle'
> diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,cpss-acc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,cpss-acc.yaml
> new file mode 100644
> index 0000000000..54efbc5e3d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/msm/qcom,cpss-acc.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/msm/qcom,cpss-acc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cortex-A7 Processor Sub-system (CPSS) Application Clock Controller (ACC)
> +
> +maintainers:
> +  - Kumar Gala <galak@codeaurora.org>

Not an active email nor is Kumar maintaining QCom stuff any more.

> +
> +description: |
> +  The CPSS ACC provides clock, power domain, and reset control to a Cortex-A7
> +  processor. There is one ACC register region per CPU within the PSS remapped
> +  region as well as an alias register region that remaps accesses to the ACC
> +  associated with the CPU accessing the region.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,cpss-acc

This needs to be SoC specific.

> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description: ACC base register region
> +      - description: optional ACC alias register region
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@f9088000 {
> +      compatible = "qcom,cpss-acc";
> +      reg = <0xf9088000 0x1000>, <0xf9008000 0x1000>;
> +    };
> -- 
> 2.25.1
> 
