Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74295399334
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 21:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbhFBTK2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 15:10:28 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:36662 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhFBTK1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 15:10:27 -0400
Received: by mail-ot1-f42.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so3446083otl.3;
        Wed, 02 Jun 2021 12:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BkCqG1dAiRCPOZkLA//JxkLZ0skKFzBq045qNLYtDnA=;
        b=DgOx6tMsTI+lf3etC2gRqzI+egu65UBiF/ug7WpaM6qfz6X5/OWV2/Wn+FeM9dahRk
         D+xJwTQ3m/2OOLlHC/K/0tBqTBehEfNUR/PpulxSvxAEF6uZSMtthKFCq77xhXqzSp5E
         HNb+4X5EHZMd7h0HciZ/jhlYyfBl2nBO4I2b7iQR2HsO6yJJ1dPSA+E+jIild7UmJ9WD
         EHFn/uVQXAul3hTCYDi7j/6/NETgXr8/0yAZBSfxhWPAItdkDicP7UuC8LQ0WsdPvXGu
         qJL31ukvdo7uXm7MIv//QV8t4sO25oKwxUe3q3LPiGvMgQfRgCKFWjlOdTN9E+gf5TQY
         w0LQ==
X-Gm-Message-State: AOAM531Um5jddd9N98LonC4Kasb7kkKDKn/4sBN1T/FYwOALI22JQ4Ll
        oUKaB3XROYqVMOt2D1FDEE2jMz05LQ==
X-Google-Smtp-Source: ABdhPJyZBYzFHf524CKOvQ7e4FR3q7SRD/xQE0MswwXbZqrN7gU1TvZSqLBWdwYei2QeDB/GD7j55Q==
X-Received: by 2002:a9d:7095:: with SMTP id l21mr27520726otj.213.1622660923683;
        Wed, 02 Jun 2021 12:08:43 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n186sm164459oia.1.2021.06.02.12.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 12:08:42 -0700 (PDT)
Received: (nullmailer pid 3797256 invoked by uid 1000);
        Wed, 02 Jun 2021 19:08:41 -0000
Date:   Wed, 2 Jun 2021 14:08:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 1/2] dt-bindings: clk: qcom: gcc-sm6125: Document
 SM6125 GCC driver
Message-ID: <20210602190841.GA3792989@robh.at.kernel.org>
References: <20210526184325.675736-1-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526184325.675736-1-martin.botka@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 26, 2021 at 08:43:20PM +0200, Martin Botka wrote:
> Document the newly added SM6125 GCC driver.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
> Changes in V2:
> Add commit description.
> Changes in V3:
> Use rpmcc.h instead of rpmh.h
>  .../bindings/clock/qcom,gcc-sm6125.yaml       | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
> new file mode 100644
> index 000000000000..f7198370a1b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: GPL-2.0-only

Dual license new bindings please:

GPL-2.0-only OR BSD-2-Clause

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-sm6125.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Binding for SM6125
> +
> +maintainers:
> +  - Konrad Dybcio <konrad.dybcio@somainline.org>
> +
> +description: |
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on SM6125.
> +
> +  See also:
> +  - dt-bindings/clock/qcom,gcc-sm6125.h
> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-sm6125

The normal ordering would be 'qcom,sm6125-gcc'

> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Sleep clock source
> +
> +  clock-names:
> +    items:
> +      - const: bi_tcxo
> +      - const: sleep_clk
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
> +  - clocks
> +  - clock-names
> +  - reg
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +    clock-controller@1400000 {
> +    compatible = "qcom,gcc-sm6125";

Wrong indentation.

> +      reg = <0x01400000 0x1f0000>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +      clock-names = "bi_tcxo", "sleep_clk";
> +      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&sleep_clk>;
> +    };
> +...
> -- 
> 2.31.1
