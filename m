Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 368471E5350
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 03:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725849AbgE1Bs4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 21:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgE1Bs4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 21:48:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0213C05BD1E;
        Wed, 27 May 2020 18:48:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C59812A3;
        Thu, 28 May 2020 03:48:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590630532;
        bh=U4kq/jSbwNGuKVGeEHlzWvc3R7NEee14LdRS0610D+0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sdVgaQBICro/JkQEixC7dLVChef2a3hJuZPkokvJZsnUfJam/kJl/yhEOuU6HqF5K
         sACsXGtsSlhkcr+GTq6mlcw04pdgZ2qXhQD+yzwVIMRr3ocYdxVDKbzxfGkKOlXm/+
         rnuP7/X2gLmOLmoMh33OLsGIZh49vnc5EbSVBmvc=
Date:   Thu, 28 May 2020 04:48:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] dt-bindings: display: bridge: Add documentation for
 LT9611
Message-ID: <20200528014837.GD4670@pendragon.ideasonboard.com>
References: <20200513100533.42996-1-vkoul@kernel.org>
 <20200513100533.42996-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200513100533.42996-3-vkoul@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vinod,

Thank you for the patch.

On Wed, May 13, 2020 at 03:35:32PM +0530, Vinod Koul wrote:
> Lontium LT9611 is a DSI to HDMI bridge which supports 2 DSI ports
> and I2S port as input and one HDMI port as output
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../display/bridge/lontium,lt9611.yaml        | 178 ++++++++++++++++++
>  1 file changed, 178 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> new file mode 100644
> index 000000000000..77ee8cc35cd8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> @@ -0,0 +1,178 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lontium LT9611 2 Port MIPI to HDMI Bridge
> +
> +maintainers:
> +  - Vinod Koul <vkoul@kernel.org>
> +
> +description: |
> +  The LT9611 is a bridge device which converts DSI to HDMI
> +
> +properties:
> +  compatible:
> +    enum:
> +      - lontium,lt9611
> +
> +  reg:
> +    maxItems: 1
> +    description: base I2C address of the device.
> +
> +  "#sound-dai-cells":
> +    const: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description: interrupt line for the chip

I think you could drop the descriptions for the reg and interrupt
properties, they don't add much.

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO connected to active high RESET pin.
> +
> +  vdd-supply:
> +    description: Regulator for 1.8V MIPI phy power.
> +
> +  vcc-supply:
> +    description: Regulator for 3.3V IO power.
> +
> +  ports:
> +    type: object
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        additionalProperties: false
> +
> +        description: |
> +          HDMI port for HDMI output

The usual practice is to have the input ports first, followed by the
output ports. Is there a reason not to follow that rule ?

> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +        patternProperties:
> +          endpoint:

If you want to use patternProperties, this should be

          "^endpoint@[0-9]+$":

(including the quotes). Same below.

> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              remote-endpoint: true

How about

              remote-endpoint:
                $ref: /schemas/types.yaml#/definitions/phandle

and the same below ?

You also need a reg property if multiple endpoints are present.

> +
> +        required:
> +          - reg
> +
> +      port@1:
> +        type: object
> +        additionalProperties: false
> +
> +        description: |
> +          MIPI port-1 for MIPI input
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +        patternProperties:
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              remote-endpoint: true
> +
> +        required:
> +          - reg
> +
> +      port@2:
> +        type: object
> +        additionalProperties: false
> +
> +        description: |
> +          MIPI port-2 for MIPI input

A description of how the two MIPI inputs differ would be useful. In
particular, are both mandatory, or is it valid to connect only one of
the two ? If using a single input is supported, can it be either, or
does it have to be the first one ? When using both inputs, what should
be connected to them ?

> +
> +        properties:
> +          reg:
> +            const: 2
> +
> +        patternProperties:
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              remote-endpoint: true
> +
> +        required:
> +          - reg
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - vdd-supply
> +  - vcc-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c10 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      lt9611_codec: hdmi-bridge@3b {

Please drop unused labels.

> +        compatible = "lontium,lt9611";
> +        reg = <0x3b>;
> +
> +        reset-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
> +        interrupts-extended = <&tlmm 84 IRQ_TYPE_EDGE_FALLING>;
> +
> +        vdd-supply = <&lt9611_1v8>;
> +        vcc-supply = <&lt9611_3v3>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            lt9611_out: endpoint {
> +              remote-endpoint = <&hdmi_con>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +            lt9611_a: endpoint {
> +              remote-endpoint = <&dsi0_out>;
> +            };
> +          };
> +
> +          port@2 {
> +            reg = <2>;
> +            lt9611_b: endpoint {
> +              remote-endpoint = <&dsi1_out>;
> +            };
> +          };
> +        };
> +      };
> +    };

It's customary to end YAML schema files with ... on a separate line.

-- 
Regards,

Laurent Pinchart
