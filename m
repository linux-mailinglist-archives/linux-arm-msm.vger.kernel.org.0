Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917981B1E0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 07:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbgDUFN6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 01:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725881AbgDUFN6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 01:13:58 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA63C061A0F
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 22:13:57 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id 1so7633215vsl.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 22:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cyE4uJUY781S/AV9GAhN+v2PTCIT5hQyV5TBszxGCsU=;
        b=me45Z7nqemEaz7ZDroicQdP0ONTXizV1DJIcfxqyma8Ejr+VYXLiUrr0+sawjb4NfY
         KrIQomyniyy700OCDE5nc/6+88az+udoZFEfC9U5SW8xphpQ93AOzWnaWwfhNE11chtO
         4+0wjI2emdSTQlBaT2ubrnupyY2+U3/o+mw38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cyE4uJUY781S/AV9GAhN+v2PTCIT5hQyV5TBszxGCsU=;
        b=dhxomjbGhP+aE4023YW/seGV5mvc9xrQ3DAc1ZJMCC9fBzUeF8HLgZOeietTSgUhx6
         +BdYd38KrZZ//S2COETl2ypdmXF2Lvzdp8xcDPbG+yyymm3cJvDUi/GCIJqUsXNg8KIE
         NEK5cRTxMmz4Oe0M3TlOxVI20L8lVnHrKQGE2wV7XTKr6rWR6H0UfT3NRbluadHWXj2l
         SIMbX/PRyeUkprJIaYOExnoLD3EwMGhevQ9g9HtHvHx30VUZuc1vQER6pUf3vAC/I3rw
         SlAA1wOZi+8XrqLnQYc9m8UzbgtwzEj0ucltkM5JCF2WockNIoMzFhtS/YnDelTEr1uy
         fBKQ==
X-Gm-Message-State: AGi0Pua16ZlPRmFMEuHUvq+Evx6TOqesSk9BDsdMJKH6ZWUCpWhorYKL
        ylebgLYURg7q76iW+1t8/4iB6vX8DNo=
X-Google-Smtp-Source: APiQypLYm/6vwOTTCLVwe07BChhBymcmJm7b9udCr6dNtvuuVG3XkFrNRNSPHT9WYAmR+ACVSv+d5A==
X-Received: by 2002:a67:fb06:: with SMTP id d6mr4921367vsr.66.1587446035844;
        Mon, 20 Apr 2020 22:13:55 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id u5sm480657vkk.16.2020.04.20.22.13.55
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 22:13:55 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 10so3278781vkr.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 22:13:55 -0700 (PDT)
X-Received: by 2002:a67:fc46:: with SMTP id p6mr3963910vsq.169.1587445684013;
 Mon, 20 Apr 2020 22:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
 <20200415203103.GO4758@pendragon.ideasonboard.com>
In-Reply-To: <20200415203103.GO4758@pendragon.ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 20 Apr 2020 22:07:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UyxkBAm=7RL--1zWniHGsXao__3jE_+o5UKEDs44+fQA@mail.gmail.com>
Message-ID: <CAD=FV=UyxkBAm=7RL--1zWniHGsXao__3jE_+o5UKEDs44+fQA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: drm/bridge: ti-sn65dsi86: Convert to yaml
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sandeep Panda <spanda@codeaurora.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Stephen Boyd <sboyd@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 15, 2020 at 1:31 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Douglas,
>
> Thank you for the patch.
>
> On Wed, Apr 15, 2020 at 08:48:39AM -0700, Douglas Anderson wrote:
> > This moves the bindings over, based a lot on toshiba,tc358768.yaml.
> > Unless there's someone known to be better, I've set the maintainer in
> > the yaml as the first person to submit bindings.
>
> You can also add your name ;-)

Sure, though I spend most of my days flitting from subsystem to
subsystem, always a noob everywhere I go.  I'm not sure I'd really be
qualified.  ;-)  If you want, I can add myself though I'd rather not
be solely responsible for this file since I probably won't be the best
at keeping track of it...

I left this as-is for v2 but can change it if you want.


> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  .../bindings/display/bridge/ti,sn65dsi86.txt  |  87 --------
> >  .../bindings/display/bridge/ti,sn65dsi86.yaml | 188 ++++++++++++++++++
> >  2 files changed, 188 insertions(+), 87 deletions(-)
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
>
> Where has suspend-gpios gone ? :-)

Oops.  Added it back.


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
> > index 000000000000..8cacc6db33a9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > @@ -0,0 +1,188 @@
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
> > +    description: GPIO specification for bridge_en pin (active high).
> > +
> > +  vccio-supply:
> > +    description: A 1.8V supply that powers up the digital IOs.
> > +
> > +  vpll-supply:
> > +    description: A 1.8V supply that powers up the DisplayPort PLL.
> > +
> > +  vcca-supply:
> > +    description: A 1.2V supply that powers up the analog circuits.
> > +
> > +  vcc-supply:
> > +    description: A 1.2V supply that powers up the digital core.
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description:
> > +      Specification for input reference clock. The reference clock rate must
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
> > +  data-lanes:
>
> Should this have
>
>         minItems: 1
>         maxItems: 4
>         items:
>           enum:
>             - 0
>             - 1
>             - 2
>             - 3

Interestingly this seemed to be at totally the wrong location in the
old ".txt" file and in my v1.  I moved it to the right place now by
making sure I put the old example back in, not just the example of
what's currently in the tree.


> > +    description: See ../../media/video-interface.txt
> > +
> > +  lane-polarities:
> > +    description: See ../../media/video-interface.txt
>
> And something similar here,
>
>         minItems: 1
>         maxItems: 4
>         items:
>           enum:
>             - 0
>             - 1
>         uniqueItems: false
>
> I'm not entirely sure where uniqueItems should be placed.

I left this out of v2.  "uniqueItems: false" appears to be the default
so it would only be needed if you were trying to override someone who
had already made this "true".  I tested this by setting it to true and
seeing the error, then removing the set to true and seeing the error
gone.


> I'm also not
> sure how to specify that both data-lanes and lane-polarities need to
> have the same number of items, maybe
>
> dependencies:
>   data-lanes: [lane-polarities]

The opposite of that is interesting, that is:

dependencies:
  data-lanes: [lane-polarities]

...that seems to say that specifying "lane-polarities" without
"data-lanes" is an error.

...but that doesn't specify that data-lanes and lane-polarities need
to have the same number of items.  If someone wants to provide the
syntax I'm happy to add it, otherwise it feels like it could be
something to improve in the future.  In general I haven't seen people
get to this level of detail in yaml.


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
> > +        description:
> > +          Video port for MIPI DSI input
> > +
> > +        properties:
> > +          reg:
> > +            const: 0
> > +
> > +        patternProperties:
> > +          endpoint:
>
> If there's a single endpoint, you don't need patternProperties, it can
> be specified in properties.

Done.
