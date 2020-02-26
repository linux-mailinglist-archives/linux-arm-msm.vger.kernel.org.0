Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEA1B170477
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 17:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727249AbgBZQdp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 11:33:45 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44961 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgBZQdp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 11:33:45 -0500
Received: by mail-ot1-f67.google.com with SMTP id h9so3484525otj.11;
        Wed, 26 Feb 2020 08:33:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lbFvo5HuT3obVT0xk8fNIbu0p3dI4t+br6icB8M92zo=;
        b=lq1hcc27//EHILMiQihpJH943Ti1+3StL/a9MLJbF71YcpcYzbqXCNxO7Zazorl3h7
         9I9KVkMWujkf1lgAMhisB6iI5JBUFdIMXZyfW4gTgcyZ7bQ84EABln3ETze6v4R9oyWb
         Q7fCUapMgvX0dc9M6S1sDRc4OxagDE6xMF0OzI88p7/gOfh9RPZsWyOHKAeEFeUc3x0Y
         65m5/TtD7yVviw2G0VBhzL7PFaoVcuimBuepY7cOCuN/Lh5HjAmw9tmApLbpnxbKvbAI
         rsXqRaW1w9YVBM/PSTncFTSCCStWOd+OJKnzgBTFjOjQ84cePy/P/MhZvsk9m315bHQK
         MmNw==
X-Gm-Message-State: APjAAAWjWXUp7t0GThvesLRHi1o2HbXVjPoLYNUajVUkkUytthj5Odvq
        Ok+eY7xP7CJUtUHevFRUuQ==
X-Google-Smtp-Source: APXvYqxAh2WjxmOlqFeKqAx/quOrMLgdoA8tQvbTL8tmC9NEpFZlnmrg8hnVq+U0peeFAT+su5Ug4A==
X-Received: by 2002:a9d:7c95:: with SMTP id q21mr1668568otn.278.1582734823559;
        Wed, 26 Feb 2020 08:33:43 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i7sm970117oib.42.2020.02.26.08.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 08:33:42 -0800 (PST)
Received: (nullmailer pid 30554 invoked by uid 1000);
        Wed, 26 Feb 2020 16:33:42 -0000
Date:   Wed, 26 Feb 2020 10:33:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
        John Stultz <john.stultz@linaro.org>,
        Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Mark Rutland <mark.rutland@arm.com>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: msm: Convert GMU bindings
 to YAML
Message-ID: <20200226163342.GA26694@bogus>
References: <1582223216-23459-1-git-send-email-jcrouse@codeaurora.org>
 <1582223216-23459-2-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582223216-23459-2-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 20, 2020 at 11:26:53AM -0700, Jordan Crouse wrote:
> Convert display/msm/gmu.txt to display/msm/gmu.yaml and remove the old
> text bindings.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  .../devicetree/bindings/display/msm/gmu.txt        | 116 ------------------
>  .../devicetree/bindings/display/msm/gmu.yaml       | 130 +++++++++++++++++++++
>  2 files changed, 130 insertions(+), 116 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/gmu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/gmu.yaml


> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> new file mode 100644
> index 0000000..776ff92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Copyright 2019-2020, The Linux Foundation, All Rights Reserved
> +%YAML 1.2
> +---
> +
> +$id: "http://devicetree.org/schemas/display/msm/gmu.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Devicetree bindings for the GMU attached to certain Adreno GPUs
> +
> +maintainers:
> +  - Rob Clark <robdclark@gmail.com>
> +
> +description: |
> +  These bindings describe the Graphics Management Unit (GMU) that is attached
> +  to members of the Adreno A6xx GPU family. The GMU provides on-device power
> +  management and support to improve power efficiency and reduce the load on
> +  the CPU.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,adreno-gmu-630.2
> +      - const: qcom,adreno-gmu
> +
> +  reg:
> +    items:
> +      - description: Core GMU registers
> +      - description: GMU PDC registers
> +      - description: GMU PDC sequence registers
> +
> +  reg-names:
> +    items:
> +      - const: gmu
> +      - const: gmu_pdc
> +      - const: gmu_pdc_seq
> +
> +  clocks:
> +    items:
> +     - description: GMU clock
> +     - description: GPU CX clock
> +     - description: GPU AXI clock
> +     - description: GPU MEMNOC clock
> +
> +  clock-names:
> +    items:
> +      - const: gmu
> +      - const: cxo
> +      - const: axi
> +      - const: memnoc
> +
> +  interrupts:
> +    items:
> +     - description: GMU HFI interrupt
> +     - description: GMU interrupt
> +
> +
> +  interrupt-names:
> +    items:
> +      - const: hfi
> +      - const: gmu
> +
> +  power-domains:
> +     items:
> +       - description: CX power domain
> +       - description: GX power domain
> +
> +  power-domain-names:
> +     items:
> +       - const: cx
> +       - const: gx
> +
> +  iommus:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Already has a type. Just need to define how many entries (maxItems).

> +    description:
> +       Phandle to a IOMMU device and stream ID. Refer to ../../iommu/iommu.txt
> +       for more information.

Drop. That's all iommus entries.

> +
> +  operating-points-v2:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the OPP table for the available GMU frequencies. Refer to
> +      ../../opp/opp.txt for more information.

Just 'true' is enough here.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - power-domains
> +  - power-domain-names
> +  - iommus
> +  - operating-points-v2
> +
> +examples:
> + - |
> +   #include <dt-bindings/clock/qcom,gpucc-sdm845.h>
> +   #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +   #include <dt-bindings/interrupt-controller/irq.h>
> +   #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +   gmu: gmu@506a000 {
> +        compatible="qcom,adreno-gmu-630.2", "qcom,adreno-gmu";
> +
> +        reg = <0x506a000 0x30000>,
> +              <0xb280000 0x10000>,
> +              <0xb480000 0x10000>;
> +        reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
> +
> +        clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +                 <&gpucc GPU_CC_CXO_CLK>,
> +                 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +                 <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
> +        clock-names = "gmu", "cxo", "axi", "memnoc";
> +
> +        interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "hfi", "gmu";
> +
> +        power-domains = <&gpucc GPU_CX_GDSC>,
> +                        <&gpucc GPU_GX_GDSC>;
> +        power-domain-names = "cx", "gx";
> +
> +        iommus = <&adreno_smmu 5>;
> +        operating-points-v2 = <&gmu_opp_table>;
> +   };
> -- 
> 2.7.4
> 
