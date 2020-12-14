Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B532DA3A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 23:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441092AbgLNWsi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 17:48:38 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46370 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441017AbgLNWs3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 17:48:29 -0500
Received: by mail-oi1-f196.google.com with SMTP id q205so8385162oig.13;
        Mon, 14 Dec 2020 14:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aEFjuWtqoM0ATTyLjOQNU3+GbAE81IYdrRjGkxStK9M=;
        b=r8jqdkbRzuGFsCOI4apLGwspvO78R3JlDDiWnfB5Y/pNOQehR5SkaUym+k8XavNYhj
         iiSlEI94T8o+FnNnx37OKXUNpAaAlc3RKc/omY0uCnKuwb6euve/pzGIR98xm3Rhg1bc
         ECwSQD6D5R3JylOSAwrLaH1c9xnzudD4EstdmAhCd3JMZbdYp+QZGnPksYz7//3Zwmm1
         se4sBeqVdG/l8NLIp1r0ugwEZXeE0mwinIvvRoi5Ao6uxyRILWel8XoG9dxrkD4n8UX6
         /tS37mYBog7OABRos1gP3Xs45OG6rNvYSXlRNsb6Hx0ixQgnOio5Mk4c0HnpgvyyiMG2
         p4VA==
X-Gm-Message-State: AOAM531OXxCgUMlv22VeCqnTqkOv8lr159Abe84z4SR6xc0UuY2iQpI9
        Tc36KS3Fpcy1U4fQ556S0qH11sCSww==
X-Google-Smtp-Source: ABdhPJyL12CMyXO2v2moazJcNjZfHEabEtohBs2McYS3pbozlIuehtcnLOfH9NpDoIpVGaR8ugCJzQ==
X-Received: by 2002:aca:d6c5:: with SMTP id n188mr19575852oig.131.1607986068360;
        Mon, 14 Dec 2020 14:47:48 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x72sm4574161oia.16.2020.12.14.14.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 14:47:47 -0800 (PST)
Received: (nullmailer pid 2525029 invoked by uid 1000);
        Mon, 14 Dec 2020 22:47:46 -0000
Date:   Mon, 14 Dec 2020 16:47:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: soc: qcom: convert qcom,smem bindings to
 yaml
Message-ID: <20201214224746.GA2519699@robh.at.kernel.org>
References: <20201211001057.3041604-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211001057.3041604-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 11, 2020 at 03:10:56AM +0300, Dmitry Baryshkov wrote:
> Convert soc/qcom/qcom,smem.txt bindings to YAML format.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/soc/qcom/qcom,smem.txt           | 57 ---------------
>  .../bindings/soc/qcom/qcom,smem.yaml          | 73 +++++++++++++++++++
>  2 files changed, 73 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml


> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> new file mode 100644
> index 000000000000..832bf54239c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/qcom/qcom,smem.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Shared Memory Manager binding
> +
> +maintainers:
> +  - Andy Gross <agross@kernel.org>
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description: |
> +  This binding describes the Qualcomm Shared Memory Manager, used to share data
> +  between various subsystems and OSes in Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: "qcom-smem"

Don't need quotes and the the string is wrong. Makes validation easy to 
pass because it never matches.

> +
> +  memory-region:
> +    maxItems: 1
> +    description: handle to memory reservation for main SMEM memory region.
> +
> +  hwlocks:
> +    $ref: /schemas/types.yaml#/definitions/phandle

hwlocks has a type already. You just need to define how many.

> +    description: reference to a hwspinlock used to protect allocations from the shared memory

Isn't that every hwlocks?

> +
> +  qcom,rpm-msg-ram:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: handle to RPM message memory resource
> +
> +required:
> +  - compatible
> +  - memory-region
> +  - hwlocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    reserved-memory {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        smem_region: smem@fa00000 {
> +            reg = <0xfa00000 0x200000>;
> +            no-map;
> +        };
> +    };
> +
> +    smem {
> +        compatible = "qcom,smem";
> +
> +        memory-region = <&smem_region>;
> +        qcom,rpm-msg-ram = <&rpm_msg_ram>;
> +
> +        hwlocks = <&tcsr_mutex 3>;
> +    };
> +
> +    soc {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        rpm_msg_ram: sram@fc428000 {
> +            compatible = "qcom,rpm-msg-ram";
> +            reg = <0xfc428000 0x4000>;
> +        };
> +    };
> +
> +...
> -- 
> 2.29.2
> 
