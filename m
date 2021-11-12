Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E68C44E915
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 15:39:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235157AbhKLOmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 09:42:19 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:45870 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235197AbhKLOmQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 09:42:16 -0500
Received: by mail-ot1-f47.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso6994972otf.12;
        Fri, 12 Nov 2021 06:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B6njGCOtAPdSNAuOe7swnVsW9oevSWDdaggrotGskeo=;
        b=TJlypDzU95i4mocSVb0wvRQ5JPUWEaTkufTZoG7Aimq+/ghlSyvb+3NpSDyJL9Am/h
         x2+C3GpB5S81OOmEH12rhaUoSWkgxQmNRVE0W8dCUnDMiBK4n/nip4RkwL3N/mZ1wquA
         FXG4ttsF0Pg/X9jAZGnMLk58aE5nzNJqAhSkhji4fRS/QQp5+3aHYa+ZHvXWeVfggUly
         7tBDvX3JeCMmrkRBTR7syhJzAIjfgMR1nVi0L/vSlYMRLfAvtFplLdrfq7QxE5DAcfv+
         CxiRBOk+MoRLy6pXqPdZ1vfROYeUstbVcYIkUOWAeWdD3yXvScaUHzgfC+m9fwkKOHPI
         o0Sg==
X-Gm-Message-State: AOAM530SYBMePfvUzsIYCM0XvriQ2WYZkWCbUXiDN/6yDSuSH49QUEIX
        cTB8W7en9HP52xkZSJstJA==
X-Google-Smtp-Source: ABdhPJy2mKElAbOQoGe6LCLJxhUph8grG9DKPpaNJvjDqBm7dGdTlzYH+4C8eQ/v1DQl+h1S1uKjQw==
X-Received: by 2002:a9d:6e0d:: with SMTP id e13mr13236285otr.10.1636727965575;
        Fri, 12 Nov 2021 06:39:25 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id y9sm1092440oon.8.2021.11.12.06.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 06:39:25 -0800 (PST)
Received: (nullmailer pid 2679482 invoked by uid 1000);
        Fri, 12 Nov 2021 14:39:24 -0000
Date:   Fri, 12 Nov 2021 08:39:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jarrett Schultz <jaschultzms@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Jarrett Schultz <jaschultz@microsoft.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: platform: microsoft: Document
 surface xbl
Message-ID: <YY58nB3XjEbTFBzT@robh.at.kernel.org>
References: <20211108164449.3036210-1-jaschultz@microsoft.com>
 <20211108164449.3036210-2-jaschultz@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108164449.3036210-2-jaschultz@microsoft.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 08, 2021 at 08:44:45AM -0800, Jarrett Schultz wrote:
> Introduce yaml for surface xbl driver.
> 
> Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>

Author and Sob emails need to match.

> 
> ---
> 
> Changes in v2:
>  - Removed json-schema dependence
>  - Elaborated on description of driver
>  - Updated example
> 
> ---
> 
>  .../platform/microsoft/surface-xbl.yaml       | 57 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++
>  2 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml b/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
> new file mode 100644
> index 000000000000..09f806f373bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/platform/microsoft/surface-xbl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Surface Extensible Bootloader for Microsoft Surface Duo
> +
> +maintainers:
> +  - Jarrett Schultz <jaschultzMS@gmail.com>
> +
> +description: |
> +  Exposes the following device information to user space via sysfs -

What's sysfs? :) Linux details don't go in bindings.

> +    * board_id
> +    * battery_present
> +    * hw_init_retries
> +    * is_customer_mode
> +    * is_act_mode
> +    * pmic_reset_reason
> +    * touch_fw_version
> +    * ocp_error_location
> +  See sysfs documentation for more information.
> +
> +properties:
> +  compatible:
> +    const: microsoft,sm8150-surface-duo-xbl
> +
> +  reg:
> +    maxItems: 1
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +examples:
> +  - |
> +    xbl@146bfa94 {
> +      compatible = "microsoft,sm8150-surface-duo-xbl";
> +      reg = <0x00 0x146bfa94 0x00 0x100>;
> +    };
> +  - |
> +    imem@146bf000 {
> +      compatible = "simple-mfd";

'simple-mfd' needs a specific compatible for the block.

> +      reg = <0x0 0x146bf000 0x0 0x1000>;
> +      ranges = <0x0 0x0 0x146bf000 0x1000>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      xbl@a94 {
> +        compatible = "microsoft,sm8150-surface-duo-xbl";
> +        reg = <0xa94 0x100>;
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eeb4c70b3d5b..8643546f8fab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12423,6 +12423,13 @@ F:	Documentation/driver-api/surface_aggregator/clients/dtx.rst
>  F:	drivers/platform/surface/surface_dtx.c
>  F:	include/uapi/linux/surface_aggregator/dtx.h
>  
> +MICROSOFT SURFACE DUO XBL DRIVER
> +M:	Jarrett Schultz <jaschultz@microsoft.com>
> +L:	linux-arm-msm@vger.kernel.org
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
> +
>  MICROSOFT SURFACE GPE LID SUPPORT DRIVER
>  M:	Maximilian Luz <luzmaximilian@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
> -- 
> 2.25.1
> 
> 
