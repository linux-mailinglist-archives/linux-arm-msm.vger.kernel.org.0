Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385BE1EDDEB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 09:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727881AbgFDHTI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 03:19:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:51642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726987AbgFDHTH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 03:19:07 -0400
Received: from localhost (unknown [122.179.53.240])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DFF3206DC;
        Thu,  4 Jun 2020 07:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591255146;
        bh=nCkSZ5YI8jHz/QYFJheERHTTJHELbWC5BLEjucaQ9dc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MeXPWyDH7J9jG4fhQpfPg/I89NkjW170cIj6TEKj1Gy8E4bbhSDxec5FPn/jXuQGj
         AKd6o3Tnj2qDlAjxOEMXCm7+Hemp0D6eMu/N56HGSceFVM4rfcLe3+V93f/AAh6JqH
         iDEzrbcE86JD4QauX+JMe4LHC+a3tNZ0LCc8Tpr8=
Date:   Thu, 4 Jun 2020 12:48:59 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <20200604071859.GD3521@vkoul-mobl>
References: <20200513100533.42996-1-vkoul@kernel.org>
 <20200513100533.42996-3-vkoul@kernel.org>
 <20200528014837.GD4670@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528014837.GD4670@pendragon.ideasonboard.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Laurent,

Sorry for late reply, I was out last week.

On 28-05-20, 04:48, Laurent Pinchart wrote:
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description: interrupt line for the chip
> 
> I think you could drop the descriptions for the reg and interrupt
> properties, they don't add much.

Sure, will do

> > +  reset-gpios:
> > +    maxItems: 1
> > +    description: GPIO connected to active high RESET pin.
> > +
> > +  vdd-supply:
> > +    description: Regulator for 1.8V MIPI phy power.
> > +
> > +  vcc-supply:
> > +    description: Regulator for 3.3V IO power.
> > +
> > +  ports:
> > +    type: object
> > +
> > +    properties:
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +      port@0:
> > +        type: object
> > +        additionalProperties: false
> > +
> > +        description: |
> > +          HDMI port for HDMI output
> 
> The usual practice is to have the input ports first, followed by the
> output ports. Is there a reason not to follow that rule ?

I was not aware of this rule, is it documented somewhere?
Nevertheless will update..

> > +
> > +        properties:
> > +          reg:
> > +            const: 0
> > +
> > +        patternProperties:
> > +          endpoint:
> 
> If you want to use patternProperties, this should be
> 
>           "^endpoint@[0-9]+$":
> 
> (including the quotes). Same below.

Ok

> 
> > +            type: object
> > +            additionalProperties: false
> > +
> > +            properties:
> > +              remote-endpoint: true
> 
> How about
> 
>               remote-endpoint:
>                 $ref: /schemas/types.yaml#/definitions/phandle
> 
> and the same below ?

Ok

> 
> You also need a reg property if multiple endpoints are present.

Will update
> 
> > +
> > +        required:
> > +          - reg
> > +
> > +      port@1:
> > +        type: object
> > +        additionalProperties: false
> > +
> > +        description: |
> > +          MIPI port-1 for MIPI input
> > +
> > +        properties:
> > +          reg:
> > +            const: 1
> > +
> > +        patternProperties:
> > +          endpoint:
> > +            type: object
> > +            additionalProperties: false
> > +
> > +            properties:
> > +              remote-endpoint: true
> > +
> > +        required:
> > +          - reg
> > +
> > +      port@2:
> > +        type: object
> > +        additionalProperties: false
> > +
> > +        description: |
> > +          MIPI port-2 for MIPI input
> 
> A description of how the two MIPI inputs differ would be useful. In
> particular, are both mandatory, or is it valid to connect only one of
> the two ? If using a single input is supported, can it be either, or
> does it have to be the first one ? When using both inputs, what should
> be connected to them ?

Sure I will add details. port-1 is mandatory and port-2 optional. port-2
is used in combination with port-1 to drive displays for higher
resolution like 4k

> > +
> > +        properties:
> > +          reg:
> > +            const: 2
> > +
> > +        patternProperties:
> > +          endpoint:
> > +            type: object
> > +            additionalProperties: false
> > +
> > +            properties:
> > +              remote-endpoint: true
> > +
> > +        required:
> > +          - reg
> > +
> > +    required:
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - vdd-supply
> > +  - vcc-supply
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c10 {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      lt9611_codec: hdmi-bridge@3b {
> 
> Please drop unused labels.

ok

> 
> > +        compatible = "lontium,lt9611";
> > +        reg = <0x3b>;
> > +
> > +        reset-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
> > +        interrupts-extended = <&tlmm 84 IRQ_TYPE_EDGE_FALLING>;
> > +
> > +        vdd-supply = <&lt9611_1v8>;
> > +        vcc-supply = <&lt9611_3v3>;
> > +
> > +        ports {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +
> > +          port@0 {
> > +            reg = <0>;
> > +            lt9611_out: endpoint {
> > +              remote-endpoint = <&hdmi_con>;
> > +            };
> > +          };
> > +
> > +          port@1 {
> > +            reg = <1>;
> > +            lt9611_a: endpoint {
> > +              remote-endpoint = <&dsi0_out>;
> > +            };
> > +          };
> > +
> > +          port@2 {
> > +            reg = <2>;
> > +            lt9611_b: endpoint {
> > +              remote-endpoint = <&dsi1_out>;
> > +            };
> > +          };
> > +        };
> > +      };
> > +    };
> 
> It's customary to end YAML schema files with ... on a separate line.

Will update

Thanks for the review
-- 
~Vinod
