Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E289A358E93
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 22:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232413AbhDHUjD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 16:39:03 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:40867 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbhDHUjD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 16:39:03 -0400
Received: by mail-oi1-f171.google.com with SMTP id i3so3544258oik.7;
        Thu, 08 Apr 2021 13:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HWCe0U4N0abGimQ42Yc5ZXL4NKCSfYaXa7P730RECq8=;
        b=m4HomzAF0ERhoiQ746RRh/wb/zp/MoXw7KECSEBr9cWkV76KANMHLH8JpGh3TdWMhU
         ++MIIgL+tZS0skoqD68rw/mXHP2n/plB+n2QLdefKHKX/uX2WtyHudNrfs8A/dWKszkr
         lW7xXQklVPzg40rSHQb1G6T0agVKJxIkOGHTDXSP1gsc66wPvBPjN10iFIRaP+BNVjkH
         fcnczruQhwvuwI9O8JIdYWSQG5fwl7ILvoPVt61XEO8qPR+bjHbWhzH1334ydqyNIlWU
         ZJJkV+3jG/qkKX/WsnKLUoYAa/N/Pg/d1PkdmwnAOJ1f6knYnnhnv6b+THogg2zsdhyp
         hPQQ==
X-Gm-Message-State: AOAM530BiferpXAT8RvokMjEy+BMkroBkqDSZSCPwSJSGaAh4nJ2mm5J
        kS1gYM34Ey0A+mOd5KLQJkv2ca558Q==
X-Google-Smtp-Source: ABdhPJxylA28ePWMM3IKB1y8k5tr8FqvuhjQMMu305Ykn+TXo7lv7hmfYXGx9M728pX8saT23LFYKQ==
X-Received: by 2002:aca:309:: with SMTP id 9mr7607343oid.12.1617914331140;
        Thu, 08 Apr 2021 13:38:51 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y10sm104114oto.18.2021.04.08.13.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 13:38:50 -0700 (PDT)
Received: (nullmailer pid 1920840 invoked by uid 1000);
        Thu, 08 Apr 2021 20:38:49 -0000
Date:   Thu, 8 Apr 2021 15:38:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: separate SDM845 GCC clock
 bindings
Message-ID: <20210408203849.GA1914405@robh.at.kernel.org>
References: <20210408014737.955979-1-dmitry.baryshkov@linaro.org>
 <20210408014737.955979-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408014737.955979-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 08, 2021 at 04:47:35AM +0300, Dmitry Baryshkov wrote:
> Separate qcom,gcc-sdm845 clock bindings from the clock-less
> qcom,gcc.yaml, so that we can add required clocks and clock-names
> properties.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-sdm845.yaml       | 82 +++++++++++++++++++
>  .../devicetree/bindings/clock/qcom,gcc.yaml   |  2 -
>  2 files changed, 82 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> new file mode 100644
> index 000000000000..4099b09ee9dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-sdm845.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Binding
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on SDM845
> +
> +  See also:
> +  - dt-bindings/clock/qcom,gcc-sdm845.h
> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-sdm845
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Board active XO source
> +      - description: Sleep clock source
> +      - description: PCIE 0 Pipe clock source
> +      - description: PCIE 1 Pipe clock source
> +
> +  clock-names:
> +    items:
> +      - const: bi_tcxo
> +      - const: bi_tcxo_ao
> +      - const: sleep_clk
> +      - const: pcie_0_pipe_clk
> +      - const: pcie_1_pipe_clk
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  protected-clocks:
> +    description:
> +      Protected clock specifier list as per common clock binding.
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  # Example for GCC for MSM8960:

I've lost my QCom decoder ring. Is 8960 and 845 the same thing?

> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@100000 {
> +      compatible = "qcom,gcc-sdm845";
> +      reg = <0x100000 0x1f0000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&rpmhcc RPMH_CXO_CLK_A>,
> +               <&sleep_clk>,
> +               <&pcie0_lane>,
> +               <&pcie1_lane>;
> +      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk", "pcie_0_pipe_clk", "pcie_1_pipe_clk";
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> index ee0467fb5e31..490edad25830 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> @@ -32,7 +32,6 @@ description: |
>    - dt-bindings/clock/qcom,gcc-mdm9615.h
>    - dt-bindings/reset/qcom,gcc-mdm9615.h
>    - dt-bindings/clock/qcom,gcc-sdm660.h  (qcom,gcc-sdm630 and qcom,gcc-sdm660)
> -  - dt-bindings/clock/qcom,gcc-sdm845.h
>  
>  properties:
>    compatible:
> @@ -52,7 +51,6 @@ properties:
>        - qcom,gcc-mdm9615
>        - qcom,gcc-sdm630
>        - qcom,gcc-sdm660
> -      - qcom,gcc-sdm845
>  
>    '#clock-cells':
>      const: 1
> -- 
> 2.30.2
> 
