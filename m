Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA34A34EAAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 16:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbhC3Ol1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 10:41:27 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:37680 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231803AbhC3Ok4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 10:40:56 -0400
Received: by mail-oi1-f170.google.com with SMTP id k25so16712336oic.4;
        Tue, 30 Mar 2021 07:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y1Evx61OkBzrHrrfzozkEcf/eWAaX8rU2OAh9rojrnE=;
        b=gwuMqIA+aHfrGO5HhnVHIKkKxqAs9mYhk2JtjthH5XNbM0hCmt+kW5udna6JrfNY1E
         HOiNfLw5rkZSuW9FuXcDe+vd7Xo9R3tgW4kxdhokgibqAR2RM/X+X/b9Ny6JK0aoipe9
         HsLu9BfTjYwSGuXQBwfSfQEbpumoQJZPo2S+Purmaw2fjvO6zPVjM14HsVluqP/WRFeM
         e5Cx7VflbYTvQYsgeX0pqVrW8pF4lJ28RzGb8j4eN+gr3Ilz4dk6Tay3uoqcYLX4TMGy
         ZrbfLzcd3ErFVUAAuhXoSsX50vuW1QIiCqdLJwmw1sR3uj5aj6H9vmIKiyONR5Of/2hA
         PWiw==
X-Gm-Message-State: AOAM530LEUObxX7birJE0q7i3sJOJvghzD0QTobspH8jCx8NVK9MTov6
        IXU369d9DJ5H//PcTlPAxQ==
X-Google-Smtp-Source: ABdhPJxsyDl3OVC+WJBzK4d/PxwDIBHDKlV/PVCFdJDROCZ7IHQuAZpOTAL7bKxNXIeEhe+qHw0mGQ==
X-Received: by 2002:aca:2104:: with SMTP id 4mr3512045oiz.124.1617115255209;
        Tue, 30 Mar 2021 07:40:55 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.136])
        by smtp.gmail.com with ESMTPSA id c9sm4454800ooq.31.2021.03.30.07.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 07:40:53 -0700 (PDT)
Received: (nullmailer pid 277051 invoked by uid 1000);
        Tue, 30 Mar 2021 14:40:48 -0000
Date:   Tue, 30 Mar 2021 09:40:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     nikitos.tr@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: Add bindings for Qualcomm
 Memshare service
Message-ID: <20210330144048.GA264685@robh.at.kernel.org>
References: <20210319172321.22248-1-nikitos.tr@gmail.com>
 <20210319172321.22248-2-nikitos.tr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319172321.22248-2-nikitos.tr@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 19, 2021 at 10:23:20PM +0500, nikitos.tr@gmail.com wrote:
> From: Nikita Travkin <nikitos.tr@gmail.com>
> 
> Add DT bindings for memshare: QMI service that allocates
> memory per remote processor request.
> 
> Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
> ---
>  .../bindings/soc/qcom/qcom,memshare.yaml      | 109 ++++++++++++++++++
>  include/dt-bindings/soc/qcom,memshare.h       |  10 ++
>  2 files changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,memshare.yaml
>  create mode 100644 include/dt-bindings/soc/qcom,memshare.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,memshare.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,memshare.yaml
> new file mode 100644
> index 000000000000..ebdf128b066c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,memshare.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/qcom/qcom,memshare.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm QMI Shared Memory Service

How many shared memory interfaces does Qcom have...

> +
> +description: |
> +  This driver provides a QMI service that allows remote processors (like modem)
> +  to request additional memory. It is used for applications like GPS in modem.

If the memory region is defined in reserved-memory, how are you 
allocating additional memory? 

> +
> +maintainers:
> +  - Nikita Travkin <nikitos.tr@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: qcom,memshare
> +
> +  qcom,legacy-client:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to a memshare client node used for legacy requests.
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^.*@[0-9]+$":
> +    type: object
> +
> +    properties:
> +      reg:
> +        description: Proc-ID for clients in this node.

What's Proc-ID?

> +
> +      qcom,qrtr-node:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Node from which the requests are expected.
> +
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      "^.*@[0-9]+$":
> +        type: object
> +
> +        properties:
> +          reg:
> +            description: ID of this client.

How does one determine the ID?

> +
> +          memory-region:
> +            $ref: /schemas/types.yaml#/definitions/phandle
> +            description: |
> +              Reserved memory region that should be used for allocation.
> +
> +        required:
> +          - reg
> +
> +    required:
> +      - reg
> +      - qcom,qrtr-node
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/soc/qcom,memshare.h>
> +
> +    reserved-memory {
> +
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      gps_mem: gps@93c00000 {
> +        reg = <0x0 0x93c00000 0x0 0x200000>;
> +        no-map;

We support 'compatible' in reserved-memory nodes, can you simplify the 
binding and put everything in here?

> +      };
> +    };
> +
> +    memshare {
> +      compatible = "qcom,memshare";
> +      qcom,legacy-client = <&memshare_gps>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      mpss@0 {
> +        reg = <MEMSHARE_PROC_MPSS_V01>;
> +        qcom,qrtr-node = <0>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        memshare_gps: gps@0 {
> +          reg = <0>;
> +          memory-region = <&gps_mem>;
> +        };
> +      };
> +    };
> +
> +...
> diff --git a/include/dt-bindings/soc/qcom,memshare.h b/include/dt-bindings/soc/qcom,memshare.h
> new file mode 100644
> index 000000000000..4cef1ef75d09
> --- /dev/null
> +++ b/include/dt-bindings/soc/qcom,memshare.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __DT_QCOM_MEMSHARE_H__
> +#define __DT_QCOM_MEMSHARE_H__
> +
> +#define MEMSHARE_PROC_MPSS_V01 0
> +#define MEMSHARE_PROC_ADSP_V01 1
> +#define MEMSHARE_PROC_WCNSS_V01 2
> +
> +#endif /* __DT_QCOM_MEMSHARE_H__ */
> -- 
> 2.27.0
> 
