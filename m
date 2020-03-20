Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A826D18D589
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2020 18:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgCTRRK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Mar 2020 13:17:10 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:40485 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgCTRRK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Mar 2020 13:17:10 -0400
Received: by mail-il1-f195.google.com with SMTP id p12so6296857ilm.7;
        Fri, 20 Mar 2020 10:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9OK3///UPiMOnkmWOFd8fgSlK68ma0DB6jw3LiUD5r8=;
        b=dJyi6EdUqBluxU6RqaTnmlv4VVmD9TQfEznijETGv4rG8uBscdBW9Q+H5lgnCzMLb0
         dUkAKUrD2KwjaUMBUqhIlcHlbpFODB55GXHs3tL2Ml+cQ2uen7Y7P4DPyYkoXF/OBI1A
         1ualSssjlMatx+hD8l1LPAEnmidjTaVFTylepdxeLCdvKzo46cj3Ie2CoeuUI5L2Q1Bx
         4tqD+svFy86sYhe/PABOBXH5Bj7uvhEBbbRXZs6+0DKAvf7IsG63CzLNDuxe9VjV6iSI
         gPYSZBUdDiLW4W6TJE2dhnnH6JjaVkjC/OmGNB5dgzLHnFWqBYVEUWHK4N79/cWcbw6f
         0suQ==
X-Gm-Message-State: ANhLgQ2BeZcT++7ZyXc7tpq19atNlC1sqDVTxu8WXGkfC3eb0cwZWrxp
        mdYn86pnPlx+Utxzeu7ZpQH6Fi8=
X-Google-Smtp-Source: ADFU+vvZUodp/Fin0OQjreZzAxRNuiORq055kbbShVYM1dF8DDhPkidm1KJGDzgmqULC2WS38SU3/A==
X-Received: by 2002:a92:608:: with SMTP id x8mr8994332ilg.120.1584724628885;
        Fri, 20 Mar 2020 10:17:08 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id r9sm1933289ioa.44.2020.03.20.10.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 10:17:08 -0700 (PDT)
Received: (nullmailer pid 15045 invoked by uid 1000);
        Fri, 20 Mar 2020 17:17:06 -0000
Date:   Fri, 20 Mar 2020 11:17:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org, sean@poorly.run
Subject: Re: [PATCH v8 1/2] dt-bindings: display: add visionox rm69299 panel
 variant
Message-ID: <20200320171706.GA15934@bogus>
References: <20200320054409.32509-1-harigovi@codeaurora.org>
 <20200320054409.32509-2-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320054409.32509-2-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 20, 2020 at 11:14:08AM +0530, Harigovindan P wrote:
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

Still not right...

>     - Dropping improper reg property.
> 
>  .../display/panel/visionox,rm69299.yaml       | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> new file mode 100644
> index 000000000000..5fd277602a66
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> @@ -0,0 +1,73 @@
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
> +      A node containing DSI input & output port nodes with endpoint
> +      definitions as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +      Documentation/devicetree/bindings/graph.txt
> +      properties:
> +        port: true

This is not taking effect because it's just description. You need to 
indent 2 fewer spaces.

'port' is not equal to 'port@0' which the example has. So fix the 
example.

And you need to add 'additionalProperties: false' here at the same level 
as 'properties'.

> +
> +  reset-gpios: true
> +
> +additionalProperties: false
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
> -- 
> 2.25.1
> 
