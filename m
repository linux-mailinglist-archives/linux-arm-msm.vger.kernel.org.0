Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 516AC1946F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 20:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbgCZTC5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 15:02:57 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:44828 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgCZTC5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 15:02:57 -0400
Received: by mail-io1-f65.google.com with SMTP id v3so7176758iot.11;
        Thu, 26 Mar 2020 12:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=913nXdxioKFyBXx/HO1CiaF3q6eac3NnTWagXaXe9gM=;
        b=snjMPj4R6k2v144tBuqVK7n2fbKtzR7C/CfEK1EnvNJ8Ue2ef4B4ggiazACpt8aRRc
         v6BwZ0Bf+4z63kE70AFjVoez7RInkXLJcb7h0Ss2OWxizm59ZGvlkV/ybVVpaQodSB+t
         kBZymOuowLGOoAKZO1r0IFo9jqemAM5xI5apSERiKHTMGACmcn4q8MS8gedUGSjJSf52
         Il+g2Gmd8ge8iiKpbcFNegjQgTi67Sfw08M/0WxwfVJGzvpP1pC7Bsl64d1b31XMSQZ9
         /E+xu0PyDAfSi9RDSJm6kEZh00su5oy371nnRoXrdv+cg9PHCNWfHPYNyYtQ4F+w4Rwg
         ywlQ==
X-Gm-Message-State: ANhLgQ2StMlbPnUT85JtDayCNu46N3vEt7Q3PBXULvkBZX6821KWCWyQ
        lkjkAnojPiChzJ8uF5waWDcN480=
X-Google-Smtp-Source: ADFU+vtcHtx/pWLZ5r+4OrJlDvMhktQM3VWwN1mtU/cnSTzgT5KMfVdBgp6bEq0yg6SjHaY9I5/E8g==
X-Received: by 2002:a6b:e316:: with SMTP id u22mr9211014ioc.1.1585249374945;
        Thu, 26 Mar 2020 12:02:54 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id c88sm1079423ill.15.2020.03.26.12.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 12:02:54 -0700 (PDT)
Received: (nullmailer pid 15089 invoked by uid 1000);
        Thu, 26 Mar 2020 19:02:53 -0000
Date:   Thu, 26 Mar 2020 13:02:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org, sean@poorly.run
Subject: Re: [PATCH v9 1/2] dt-bindings: display: add visionox rm69299 panel
 variant
Message-ID: <20200326190253.GA5029@bogus>
References: <20200323050316.32108-1-harigovi@codeaurora.org>
 <20200323050316.32108-2-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323050316.32108-2-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 23, 2020 at 10:33:15AM +0530, Harigovindan P wrote:
> Add bindings for visionox rm69299 panel.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v2:
>     - Removed unwanted properties from description.
>     - Creating source files without execute permissions(Rob Herring).
> Changes in v3:
>     - Changing txt file into yaml
> Changes in v4:
>     - Updating license identifier.
>     - Moving yaml file inside panel directory.
>     - Removing pinctrl entries.
>     - Adding documentation for reset-gpios.
> Changes in v5:
>     - No changes. Updated 2/2 Patch.
> Changes in v6:
>     - Removing patternProperties.
>     - Added " |" after description.
>     - Setting port and reset-gpios to true.
>     - Removing @ae94000 for dsi node.
> Changes in v7:
>     - Added reg property.
> Changes in v8:
>     - Rearranged additionalProperties.
>     - Dropping improper reg property.
> Changes in v9:
>     - Adding additionalProperties at the same level as
>       'properties'
>     - Adding properties for "ports" which includes:
>       -> #address-cells
>       -> #size-cells
>       -> port@0
> 
>  .../display/panel/visionox,rm69299.yaml       | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml

Wrong file mode.

> 
> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> new file mode 100755
> index 000000000000..2dd4d9471fa8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/visionox,rm69299.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Visionox model RM69299 Panels Device Tree Bindings.
> +
> +maintainers:
> + - Harigovindan P <harigovi@codeaurora.org>
> +
> +description: |
> + This binding is for display panels using a Visionox RM692999 panel.
> +
> +allOf:
> + - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: visionox,rm69299-1080p-display
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdda-supply:
> +    description: |
> +      Phandle of the regulator that provides the vdda supply voltage.
> +
> +  vdd3p3-supply:
> +    description: |
> +      Phandle of the regulator that provides the vdd3p3 supply voltage.
> +
> +  ports:
> +    type: object
> +    description: |
> +      A ports node with endpoint definitions as defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:

As I said before, fix the example. You don't need 'ports' nor a unit 
address as there is only 1 port.

All you need instead of 'ports' is 'port: true' because 
panel-common.yaml defines it.

And 'port' should be required.

> +        type: object
> +        description: |
> +          Input endpoints of the controller.
> +
> +  reset-gpios: true
> +
> +  additionalProperties: false

You are defining a property called 'additionalProperties'. Remove the 
indentation.

> +
> +required:
> +  - compatible
> +  - vdda-supply
> +  - vdd3p3-supply
> +  - reset-gpios
> +
> +examples:
> +  - |
> +    panel {
> +        compatible = "visionox,rm69299-1080p-display";
> +
> +        vdda-supply = <&src_pp1800_l8c>;
> +        vdd3p3-supply = <&src_pp2800_l18a>;
> +
> +        reset-gpios = <&pm6150l_gpio 3 0>;
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            port@0 {
> +                reg = <0>;
> +                panel0_in: endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +...
> +
> -- 
> 2.25.1
> 
