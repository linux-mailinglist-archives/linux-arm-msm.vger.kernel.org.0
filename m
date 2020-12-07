Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBB02D1C5F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Dec 2020 22:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbgLGVxY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 16:53:24 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44478 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbgLGVxY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 16:53:24 -0500
Received: by mail-oi1-f193.google.com with SMTP id y74so17136989oia.11;
        Mon, 07 Dec 2020 13:53:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BF1tW52ALryUZKid8lBVkGB4okYZtkPfb/JX9FH4Smo=;
        b=Q82z6j07Ap3V8mDNV2I8nawvK4cZ5PGiZtanhuYYv1yVnF4h1SecqP2a9JBh/9N5ou
         7ldFuLO++LPc7y1YUZ1ZLDeFLQeMrirdOOnzzYwXvK2vyHKKiuGUkDU3469vYaVJqkaB
         4NNWW10GpdAwAdfb3oqBsYXsbThYo4iMYkPt9bYR3jFSSxyG7iHEAdzRtFMWyDNTTEpY
         rX9zOD4QBJTEkm9uFHibBq4umYquzR9AZbNiYyrPo+qqiT/SQJSBIlnQ2/RA5NMQ8FcR
         NBOcmH0sfdOTT68FgbJqu6zpOcU5ugtZ8g1C+CMbyNZ5gk6gZBNht6m3+gzfeM6M8JgU
         A27w==
X-Gm-Message-State: AOAM533a6aZqsU2flQ3mevKb4hVU4tQzrwBq8JGF68pZ2sGxUk8O/qtp
        p4YJEiArbSwNSQsWakpwZg==
X-Google-Smtp-Source: ABdhPJzBabPROxUsAAgxBwNPRqzXMt8tXAiikj8ao9VyU4y4TZD60k59EMloR0FVVTnixBGqZFonog==
X-Received: by 2002:aca:cf4a:: with SMTP id f71mr627363oig.157.1607377957848;
        Mon, 07 Dec 2020 13:52:37 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f10sm2605122oti.11.2020.12.07.13.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 13:52:37 -0800 (PST)
Received: (nullmailer pid 896927 invoked by uid 1000);
        Mon, 07 Dec 2020 21:52:36 -0000
Date:   Mon, 7 Dec 2020 15:52:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: mtd: partitions: Add binding for
 Qcom SMEM parser
Message-ID: <20201207215236.GB892840@robh.at.kernel.org>
References: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
 <20201119071308.9292-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119071308.9292-2-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 19, 2020 at 12:43:05PM +0530, Manivannan Sadhasivam wrote:
> Add YAML binding for Qualcomm Shared Memory (SMEM) Flash partition
> parser.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../mtd/partitions/qcom,smem-part.yaml        | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> new file mode 100644
> index 000000000000..cf3f8c1e035d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> @@ -0,0 +1,33 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/qcom,smem-part.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SMEM NAND flash partition parser binding
> +
> +maintainers:
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +
> +description: |
> +  The Qualcomm SoCs supporting the NAND controller interface features a Shared
> +  Memory (SMEM) based partition table scheme. The maximum partitions supported
> +  varies between partition table revisions. V3 supports maximum 16 partitions
> +  and V4 supports 48 partitions.

V3 vs. V4 (and any other version for that matter) is discoverable?

> +
> +properties:
> +  compatible:
> +    const: qcom,smem-part
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    flash {
> +        partitions {
> +            compatible = "qcom,smem-part";
> +        };
> +    };
> -- 
> 2.17.1
> 
