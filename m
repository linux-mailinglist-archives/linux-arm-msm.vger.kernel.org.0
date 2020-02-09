Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEAE1569AD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2020 09:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgBIIbo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Feb 2020 03:31:44 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:41096 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgBIIbn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Feb 2020 03:31:43 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 843EF20022;
        Sun,  9 Feb 2020 09:31:39 +0100 (CET)
Date:   Sun, 9 Feb 2020 09:31:38 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        sean@poorly.run, seanpaul@chromium.org
Subject: Re: [PATCHv3 1/2] dt-bindings: display: add visionox rm69299 panel
 variant
Message-ID: <20200209083138.GC5321@ravnborg.org>
References: <1580907990-32108-1-git-send-email-harigovi@codeaurora.org>
 <1580907990-32108-2-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1580907990-32108-2-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=LpQP-O61AAAA:8
        a=gEfo2CItAAAA:8 a=rUAlzMgn7VfAsfAmY-cA:9 a=2aNtAtRbR_R-ZWdM:21
        a=at3rOJuKAjAUH52G:21 a=CjuIK1q_8ugA:10 a=pioyyrs4ZptJ924tMmac:22
        a=sptkURWiP4Gy88Gu7hUp:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Harigovindan

On Wed, Feb 05, 2020 at 06:36:29PM +0530, Harigovindan P wrote:
> Add bindings for visionox rm69299 panel.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v1:
> 	- Added a compatible string to support sc7180 panel version.
> Changes in v2:
> 	- Removed unwanted properties from description.
> 	- Creating source files without execute permissions(Rob Herring).
> Changes in v3:
> 	- Changing txt file into yaml
Thanks for changing to DT Schema.


> 
>  .../bindings/display/visionox,rm69299.yaml         | 109 +++++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/visionox,rm69299.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/visionox,rm69299.yaml
> new file mode 100644
> index 0000000..bfcd46d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/visionox,rm69299.yaml

This is a binding for a panel - and thus belongs in the panel/
directory.

> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: GPL-2.0-only
The preferred license for new bindings are (GPL-2.0-only or BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/visionox,rm69299.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Visionox model RM69299 Panels Device Tree Bindings
> +
> +maintainers:
> +  - Harigovindan P <harigovi@codeaurora.org>
> +  - Kalyan Thota <kalyan_t@codeaurora.org>
> +  - Vishnuvardhan Prodduturi <vproddut@codeaurora.org>
> +
> +description:
> +  This binding is for display panels using a Visionox RM692999 panel.
> +

Use:
allOf:
  - $ref: panel-common.yaml#

Then you have access to all properties described there.


> +patternProperties:
> +  "^(panel|panel-dsi)@[0-9]$":
> +    type: object
> +    description:
> +      A node containing the panel or bridge description as documented in
> +      Documentation/devicetree/bindings/display/mipi-dsi-bus.txt

The panel shall not document the parent node.
See how other panels do it.
In general - start with the compatible.

This will also simplify your list of required properties.

> +    properties:
> +      compatible:
> +        const: visionox,rm69299-1080p-display
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
> +      pinctrl-names:
> +        items:
> +          - const: default
> +          - const: suspend
> +
> +      pinctrl-0:
> +        items:
> +          - const: Display default pin
> +          - const: Display default pin

pinctrl are not needed for the panel. They belong to the display driver.

> +
> +      ports:
> +        type: object
> +        description:
> +          A node containing DSI input & output port nodes with endpoint
> +          definitions as documented in
> +          Documentation/devicetree/bindings/media/video-interfaces.txt
> +          Documentation/devicetree/bindings/graph.txt
> +        properties:
> +          port@0:
> +            type: object
> +            description:
> +              DSI input port node.
> +
A
       port: true
should do the trick here.




> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
Not required.
> +
> +required:
> +  - "#address-cells"
> +  - "#size-cells"
> +  - compatible
> +  - reg
> +  - vdda-supply
> +  - vdd3p3-supply
> +  - pinctrl-names
> +  - pinctrl-0
> +  - pinctrl-1
> +  - reset-gpios

reset-gpios are not documented in the above.

Add
      reset-gpios: true


Please give it a spin more.
And preferably give it a "make dt_binding_check" whirl.
If you cannot get this part working I can do so for you in next
reviision.

	Sam
