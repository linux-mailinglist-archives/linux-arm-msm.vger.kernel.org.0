Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 352811C63D4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2020 00:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgEEWVY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 18:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbgEEWVX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 18:21:23 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D5DC061A0F
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2020 15:21:23 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id p5so139496vke.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2020 15:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lnXVcC4PmkkaSlygdgSA58xD9NRnNWBO39vWxCfGzbo=;
        b=aE/K4RGCwL5H8pGJiV/vdQLvVaJd9tXpnqvrytbKm6od9bvlfy0siwTVw2G2gAkcMA
         uO3RZAk+bNNenRLYNiW2Jej3t/+oZ7b80undk7JNleUvpaSGcciLBDWp+IQrSI/emWjW
         Y7/hn/eopBxIWfGIF7HgcYXyEboo8UR1BLcL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lnXVcC4PmkkaSlygdgSA58xD9NRnNWBO39vWxCfGzbo=;
        b=SdQfaoouRc2jSV4Jsr0kEN5Rrez2X99TPSrpCxzeLoGCV338EfntUf11LgtCKU8SVH
         lKH7slqC47UJHz/Hn8hFkhy/wc39ipx02mBcdREdjqGetkOjJwg5o54h8MGxohq4yMIw
         V0ACxcFAW9vlV0Y69HD72Ru4lTykXIIrRRhrn7d3HDra/0eGPwbvjoNbd9tslDwMosJ4
         39CGrdRIq0qFf25ct0VWavu/9kSGph0sWP/dRg8EXd36ULWXyBCZYFOcfG3jjvTCro9l
         hhzIMGIISwAdA+A2UuaPwFUpn5T/bzXJzz0ILPbVvoyAo7nFLbNeTuWNc7fFSfZh5/Tg
         bUVQ==
X-Gm-Message-State: AGi0Puag28cK9y2nQzM2K3uR6wYXzB+JjnJvBIa6SXab4NY3V2+WghqU
        T1o3jDkkEXbvdet7WbifQINFX5VsKDI=
X-Google-Smtp-Source: APiQypJyQsxPSlZ1dHH5Ba354jTiYeDdJs294doR1nfQ43wfaaM7V/ckbhoE8GITx7qB3vw1Xo+L4w==
X-Received: by 2002:ac5:ca83:: with SMTP id u3mr4855767vkk.24.1588717282261;
        Tue, 05 May 2020 15:21:22 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id d34sm56297uad.14.2020.05.05.15.21.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 15:21:21 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id m9so1038372uaq.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2020 15:21:20 -0700 (PDT)
X-Received: by 2002:ab0:375a:: with SMTP id i26mr4534579uat.120.1588717280132;
 Tue, 05 May 2020 15:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200430194617.197510-1-dianders@chromium.org>
 <20200430124442.v4.4.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid> <20200505213450.GA8640@pendragon.ideasonboard.com>
In-Reply-To: <20200505213450.GA8640@pendragon.ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 5 May 2020 15:21:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZKJg0TE4nyJY8LifFzMPR3XPzdbY=NuSOBBHBeUmtNw@mail.gmail.com>
Message-ID: <CAD=FV=VZKJg0TE4nyJY8LifFzMPR3XPzdbY=NuSOBBHBeUmtNw@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] dt-bindings: drm/bridge: ti-sn65dsi86: Convert to yaml
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     LinusW <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sandeep Panda <spanda@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Clark <robdclark@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Laurent,

On Tue, May 5, 2020 at 2:35 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> Thank you for the patch.
>
> On Thu, Apr 30, 2020 at 12:46:15PM -0700, Douglas Anderson wrote:
> > This moves the bindings over, based a lot on toshiba,tc358768.yaml.
> > Unless there's someone known to be better, I've set the maintainer in
> > the yaml as the first person to submit bindings.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >
> > Changes in v4: None
> > Changes in v3: None
> > Changes in v2:
> > - specification => specifier.
> > - power up => power.
> > - Added back missing suspend-gpios.
> > - data-lanes and lane-polarities are are the right place now.
> > - endpoints don't need to be patternProperties.
> > - Specified more details for data-lanes and lane-polarities.
> > - Added old example back in, fixing bugs in it.
> > - Example i2c bus is just called "i2c", not "i2c1" now.
> >
> >  .../bindings/display/bridge/ti,sn65dsi86.txt  |  87 ------
> >  .../bindings/display/bridge/ti,sn65dsi86.yaml | 279 ++++++++++++++++++
> >  2 files changed, 279 insertions(+), 87 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
> > deleted file mode 100644
> > index 8ec4a7f2623a..000000000000
> > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
> > +++ /dev/null
> > @@ -1,87 +0,0 @@
> > -SN65DSI86 DSI to eDP bridge chip
> > ---------------------------------
> > -
> > -This is the binding for Texas Instruments SN65DSI86 bridge.
> > -http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=sn65dsi86&fileType=pdf
> > -
> > -Required properties:
> > -- compatible: Must be "ti,sn65dsi86"
> > -- reg: i2c address of the chip, 0x2d as per datasheet
> > -- enable-gpios: gpio specification for bridge_en pin (active high)
> > -
> > -- vccio-supply: A 1.8V supply that powers up the digital IOs.
> > -- vpll-supply: A 1.8V supply that powers up the displayport PLL.
> > -- vcca-supply: A 1.2V supply that powers up the analog circuits.
> > -- vcc-supply: A 1.2V supply that powers up the digital core.
> > -
> > -Optional properties:
> > -- interrupts-extended: Specifier for the SN65DSI86 interrupt line.
> > -
> > -- gpio-controller: Marks the device has a GPIO controller.
> > -- #gpio-cells    : Should be two. The first cell is the pin number and
> > -                   the second cell is used to specify flags.
> > -                   See ../../gpio/gpio.txt for more information.
> > -- #pwm-cells : Should be one. See ../../pwm/pwm.yaml for description of
> > -               the cell formats.
> > -
> > -- clock-names: should be "refclk"
> > -- clocks: Specification for input reference clock. The reference
> > -       clock rate must be 12 MHz, 19.2 MHz, 26 MHz, 27 MHz or 38.4 MHz.
> > -
> > -- data-lanes: See ../../media/video-interface.txt
> > -- lane-polarities: See ../../media/video-interface.txt
> > -
> > -- suspend-gpios: specification for GPIO1 pin on bridge (active low)
> > -
> > -Required nodes:
> > -This device has two video ports. Their connections are modelled using the
> > -OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> > -
> > -- Video port 0 for DSI input
> > -- Video port 1 for eDP output
> > -
> > -Example
> > --------
> > -
> > -edp-bridge@2d {
> > -     compatible = "ti,sn65dsi86";
> > -     #address-cells = <1>;
> > -     #size-cells = <0>;
> > -     reg = <0x2d>;
> > -
> > -     enable-gpios = <&msmgpio 33 GPIO_ACTIVE_HIGH>;
> > -     suspend-gpios = <&msmgpio 34 GPIO_ACTIVE_LOW>;
> > -
> > -     interrupts-extended = <&gpio3 4 IRQ_TYPE_EDGE_FALLING>;
> > -
> > -     vccio-supply = <&pm8916_l17>;
> > -     vcca-supply = <&pm8916_l6>;
> > -     vpll-supply = <&pm8916_l17>;
> > -     vcc-supply = <&pm8916_l6>;
> > -
> > -     clock-names = "refclk";
> > -     clocks = <&input_refclk>;
> > -
> > -     ports {
> > -             #address-cells = <1>;
> > -             #size-cells = <0>;
> > -
> > -             port@0 {
> > -                     reg = <0>;
> > -
> > -                     edp_bridge_in: endpoint {
> > -                             remote-endpoint = <&dsi_out>;
> > -                     };
> > -             };
> > -
> > -             port@1 {
> > -                     reg = <1>;
> > -
> > -                     edp_bridge_out: endpoint {
> > -                             data-lanes = <2 1 3 0>;
> > -                             lane-polarities = <0 1 0 1>;
> > -                             remote-endpoint = <&edp_panel_in>;
> > -                     };
> > -             };
> > -     };
> > -}
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > new file mode 100644
> > index 000000000000..6d7d40ad45ac
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > @@ -0,0 +1,279 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi86.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SN65DSI86 DSI to eDP bridge chip
> > +
> > +maintainers:
> > +  - Sandeep Panda <spanda@codeaurora.org>
> > +
> > +description: |
> > +  The Texas Instruments SN65DSI86 bridge takes MIPI DSI in and outputs eDP.
> > +  http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=sn65dsi86&fileType=pdf
> > +
> > +properties:
> > +  compatible:
> > +    const: ti,sn65dsi86
> > +
> > +  reg:
> > +    const: 0x2d
> > +
> > +  enable-gpios:
> > +    maxItems: 1
> > +    description: GPIO specifier for bridge_en pin (active high).
> > +
> > +  suspend-gpios:
> > +    maxItems: 1
> > +    description: GPIO specifier for GPIO1 pin on bridge (active low).
> > +
> > +  vccio-supply:
> > +    description: A 1.8V supply that powers the digital IOs.
> > +
> > +  vpll-supply:
> > +    description: A 1.8V supply that powers the DisplayPort PLL.
> > +
> > +  vcca-supply:
> > +    description: A 1.2V supply that powers the analog circuits.
> > +
> > +  vcc-supply:
> > +    description: A 1.2V supply that powers the digital core.
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description:
> > +      Clock specifier for input reference clock. The reference clock rate must
> > +      be 12 MHz, 19.2 MHz, 26 MHz, 27 MHz or 38.4 MHz.
> > +
> > +  clock-names:
> > +    const: refclk
> > +
> > +  gpio-controller: true
> > +  '#gpio-cells':
> > +    const: 2
> > +    description:
> > +      First cell is pin number, second cell is flags.  GPIO pin numbers are
> > +      1-based to match the datasheet.  See ../../gpio/gpio.txt for more
> > +      information.
> > +
> > +  '#pwm-cells':
> > +    const: 1
> > +    description: See ../../pwm/pwm.yaml for description of the cell formats.
> > +
> > +  ports:
> > +    type: object
>
> Maybe
>
>     additionalProperties: false
>
> here ?

Ah, this is to keep people from adding "additionalProperties" under
the ports node.  I will hold off on sending v5 for now.  If there
happens to be nothing else wrong I'm happy for this to be added by a
maintainer when landing or I can quickly spin a v5.


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
> > +        description:
> > +          Video port for MIPI DSI input
> > +
> > +        properties:
> > +          reg:
> > +            const: 0
> > +
> > +          endpoint:
> > +            type: object
> > +            additionalProperties: false
> > +
> > +            properties:
> > +              remote-endpoint: true
> > +
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +                items:
> > +                  enum:
> > +                    - 0
> > +                    - 1
> > +                    - 2
> > +                    - 3
> > +                description: See ../../media/video-interface.txt
>
> And maybe
>                 uniqueItems: true
>
> ? Same for port@1.

Sounds good.  Again, I'll hold off on sending v5 for now and (if no
other problems) happy if this gets done when applied.


> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

-Doug
