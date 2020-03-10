Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFA318058C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 18:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbgCJRyG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 13:54:06 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:38022 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgCJRyG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 13:54:06 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 4ACE0804CE;
        Tue, 10 Mar 2020 18:54:01 +0100 (CET)
Date:   Tue, 10 Mar 2020 18:53:59 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        sean@poorly.run, seanpaul@chromium.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: add visionox rm69299 panel
 variant
Message-ID: <20200310175359.GD3785@ravnborg.org>
References: <20200306103628.8998-1-harigovi@codeaurora.org>
 <20200306103628.8998-2-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306103628.8998-2-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=LpQP-O61AAAA:8
        a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=qHcGuR0XRKw0n3oAY_QA:9
        a=CjuIK1q_8ugA:10 a=pioyyrs4ZptJ924tMmac:22 a=sptkURWiP4Gy88Gu7hUp:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Harigovindan

Thanks for the follow-up. There are still a few things to improve.
See below.

	Sam

On Fri, Mar 06, 2020 at 04:06:27PM +0530, Harigovindan P wrote:
> Add bindings for visionox rm69299 panel.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v2:
> 	- Removed unwanted properties from description.
> 	- Creating source files without execute permissions(Rob Herring).
> Changes in v3:
> 	- Changing txt file into yaml
> Changes in v4:
> 	- Updating license identifier.
> 	- Moving yaml file inside panel directory.
> 	- Removing pinctrl entries.
> 	- Adding documentation for reset-gpios.
> 
>  .../display/panel/visionox,rm69299.yaml       | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> new file mode 100644
> index 000000000000..93cae431207c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> @@ -0,0 +1,85 @@
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
> +patternProperties:
> +  "^(panel|panel-dsi)@[0-9]$":
> +    type: object

This looks wrong. None of the other panels needs to specify
a patternProperties, and neither do we need to do so for this panel.


> +    properties:
> +      compatible:
> +        const: visionox,rm69299-1080p-display
The compatible is what we use to match this binding.


> +
> +      reg:
> +        maxItems: 1
> +
> +      vdda-supply:
> +        description:
> +          Phandle of the regulator that provides the vdda supply voltage.
> +
> +      vdd3p3-supply:
> +        description:
> +          Phandle of the regulator that provides the vdd3p3 supply voltage.
> +
> +      ports:
> +        type: object
> +        description:
> +          A node containing DSI input & output port nodes with endpoint
> +          definitions as documented in
> +          Documentation/devicetree/bindings/media/video-interfaces.txt
> +          Documentation/devicetree/bindings/graph.txt

I think you miss as " |" after "description:"
Again, see other panel bindings.


> +        properties:
> +          port@0:

Please just use
            port: true

port is already documented in panel-common.yaml.

> +            type: object
> +            description:
> +              DSI input port node.
> +
> +      reset-gpios:
reset-gpios is part of panel-common.
So specify only:
         reset-gpios: true

No description, as it is in panel-common.


> +        description:
> +          a GPIO spec for the reset pin.
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdda-supply
> +  - vdd3p3-supply
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +- |
> +    dsi@ae94000 {
No @ae94000 - this will warn with upcoming dt_binding_check
improvements.

> +        panel@0 {
> +            compatible = "visionox,rm69299-1080p-display";
> +
> +            vdda-supply = <&src_pp1800_l8c>;
> +            vdd3p3-supply = <&src_pp2800_l18a>;
> +
> +            reset-gpios = <&pm6150l_gpio 3 0>;
reg property is required, but missing in the example.


> +            ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    port@0 {
> +                            reg = <0>;
> +                            panel0_in: endpoint {
> +                                remote-endpoint = <&dsi0_out>;
> +                            };
> +                    };
> +            };
> +        };
> +    };
> +...
> +
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
