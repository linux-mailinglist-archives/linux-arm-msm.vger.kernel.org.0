Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9331F4998
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 00:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728540AbgFIWwl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 18:52:41 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35853 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728108AbgFIWwk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 18:52:40 -0400
Received: by mail-io1-f68.google.com with SMTP id r77so49137ior.3;
        Tue, 09 Jun 2020 15:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VtUNO0RmXUCA0lM/iTrqVIo0l7phzdy2MwUWXH663v4=;
        b=aWwtPXBuCRCv1YWHuOeGu2xJCXjCZBtDNiicPUv+Y22oRRcsWjZTsnC0dXmmCcWBfc
         ovywz7EJ5uw1fBgZnq2WcVDw2JH/D7Jsm3iMEPwSaJQn5U4JInlHH4EouOfCBJm/KgAb
         rMFbuB7rIhmx9pPtzFBJhxoVrNmd4FRGw3AOZeZvtawZ6xao5gAo3HaF/F1jDHGoh/5i
         WGx4w/Az9iX+pd+k+Tm6CnLQbWyw/9+aJu+rwurusu0vDYbXWu7LsJr4nJ0hQ8oQkijj
         7CdkUugoV0TnLQeRtaF8Br2BHvkyKed7OfFuUfz53zDFC3swpXviwdYhkX/MeKbezLcr
         xU/Q==
X-Gm-Message-State: AOAM532ckY1e8nWANi6xlxRXk38qq0i7MUsNyPZYrcTi8DKvJD/sq/q5
        YeEGDgn+0UbAQDQBEyz1fQ==
X-Google-Smtp-Source: ABdhPJzAotuZigWCyKFS6KAx6Vd4f0JyrR9Qil5qXs28rQHD2OfKl7pATvicvO/4G8BEE8Bm7aqXkA==
X-Received: by 2002:a05:6602:228c:: with SMTP id d12mr388575iod.43.1591743159407;
        Tue, 09 Jun 2020 15:52:39 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id v16sm9833676ilo.47.2020.06.09.15.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 15:52:38 -0700 (PDT)
Received: (nullmailer pid 1655191 invoked by uid 1000);
        Tue, 09 Jun 2020 22:52:37 -0000
Date:   Tue, 9 Jun 2020 16:52:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, nishakumari@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH v4 2/5] dt-bindings: regulator: Add labibb regulator
Message-ID: <20200609225237.GA1647191@bogus>
References: <20200602100924.26256-1-sumit.semwal@linaro.org>
 <20200602100924.26256-3-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602100924.26256-3-sumit.semwal@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 02, 2020 at 03:39:21PM +0530, Sumit Semwal wrote:
> From: Nisha Kumari <nishakumari@codeaurora.org>
> 
> Adding the devicetree binding for labibb regulator.
> 
> Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
>  [sumits: cleanup as per review comments and update to yaml]
> --
> v2: updated for better compatible string and names.
> v3: moved to yaml
> v4: fixed dt_binding_check issues
> ---
>  .../regulator/qcom-labibb-regulator.yaml      | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> new file mode 100644
> index 000000000000..178820ec04c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: GPL-2.0-only

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/qcom-labibb-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm's LAB(LCD AMOLED Boost)/IBB(Inverting Buck Boost) Regulator
> +
> +maintainers:
> +  - Sumit Semwal <sumit.semwal@linaro.org>
> +
> +description:
> +  LAB can be used as a positive boost power supply and IBB can be used as a
> +  negative boost power supply for display panels. Currently implemented for
> +  pmi8998.
> +
> +allOf:
> +  - $ref: "regulator.yaml#"

I think you want this under each child as this schema applies to each 
regulator. But you aren't using any of the regulator properties, so not 
even needed? Or the example is not complete?

> +
> +properties:
> +  compatible:
> +    const: qcom,pmi8998-lab-ibb
> +
> +  lab:
> +    type: object
> +
> +    properties:
> +
> +      interrupts:
> +        maxItems: 1
> +        description:
> +          Short-circuit interrupt for lab.
> +
> +      interrupt-names:
> +        const: sc-err

You don't really need a name if there's only 1.

> +
> +    required:
> +    - interrupts
> +    - interrupt-names
> +
> +  ibb:
> +    type: object
> +
> +    properties:
> +
> +      interrupts:
> +        maxItems: 1
> +        description:
> +          Short-circuit interrupt for lab.
> +
> +      interrupt-names:
> +        const: sc-err
> +
> +    required:
> +    - interrupts
> +    - interrupt-names
> +
> +required:
> +  - compatible

unevaluatedProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    labibb {
> +      compatible = "qcom,pmi8998-lab-ibb";
> +
> +      lab {
> +        interrupts = <0x3 0x0 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "sc-err";
> +      };
> +
> +      ibb {
> +        interrupts = <0x3 0x2 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "sc-err";
> +      };
> +    };
> +
> +...
> -- 
> 2.26.2
> 
