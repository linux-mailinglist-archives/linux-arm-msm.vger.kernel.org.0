Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E58581AD23A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 23:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbgDPVxi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 17:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725960AbgDPVxf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 17:53:35 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D4AC061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 14:53:35 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id j65so3442733vsd.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 14:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=814JGthUk/YabO1gw9XXqlof1UFNQbsz/oEaoCLr82U=;
        b=Wtuk7UK36lHfAPHC698xwSQ4wlP6YpxHLvGOw5rhwgz8PxqJnpzubA3rFkAXfGo4An
         3Ct2HCofULvJwBkH5m7W2sWTQljLdoy++R5GtKfiu478bC77mO1IalsNElpSIsJty3wP
         nKh7Afqxvuqzclu0Ghc+K1xvYqQ15qklreZLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=814JGthUk/YabO1gw9XXqlof1UFNQbsz/oEaoCLr82U=;
        b=W2HrOoeP7ZcAE/cHIUhPHHzC+KSEWK9tQwE5D+JUqBNZgN43xX+fHOkEbRx6BbZeae
         j/mwpKplALpBwMdxWsmjYx05DGZI878ZVQ237RG+CBbt9CxZhbM+zeSQFbhedHnTDvyG
         NYaWLvLDqPpBDK2ls0ShVdOrE1WxGmjSR3YHL8q+NdWeY7y4ggBhYDkphwXMOvOduEOy
         oKE3LXRCBwNCexwi/oy4gUPHuet0YBva261GUpO66EgPntXoCXrfBcv3N0Cu/2bSuY0U
         CEe3WOXlR7lSc8fKIBnhGjIx9LjvCG/s0AdvZ+/aWGXjOxcp+E23JVfiCA31xMCAIYKW
         8t2A==
X-Gm-Message-State: AGi0PubF8NLInyBVkV80hPxZb5vnof/J/Vzu4cvOyc4Gzio2zliYkmdR
        tEHh3bzOKcvWZnMWOTT6HuhjJ+HqedU=
X-Google-Smtp-Source: APiQypII1tPLJpLfqQxv6kycp9kHi0ViTM82x4bvnRqPumb8hwvSVLjko+2tsEvE9SsyRNZBoH96sw==
X-Received: by 2002:a67:d892:: with SMTP id f18mr11502947vsj.201.1587074014233;
        Thu, 16 Apr 2020 14:53:34 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id r7sm562898vko.19.2020.04.16.14.53.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2020 14:53:31 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a6so3449188uao.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 14:53:31 -0700 (PDT)
X-Received: by 2002:ab0:559a:: with SMTP id v26mr56188uaa.22.1587074010267;
 Thu, 16 Apr 2020 14:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
 <20200415084758.2.Ic98f6622c60a1aa547ed85781f2c3b9d3e56b734@changeid>
 <158698038289.105027.2860892334897893887@swboyd.mtv.corp.google.com>
 <20200415203256.GP4758@pendragon.ideasonboard.com> <CAD=FV=U1U7y_U4+zySzA9e_uYE0ECdM1Bd-ew0OxG3ciqjRVSA@mail.gmail.com>
 <20200416005409.GR4758@pendragon.ideasonboard.com>
In-Reply-To: <20200416005409.GR4758@pendragon.ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 16 Apr 2020 14:53:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WWZ1txHYOQZuCASbspLUP-Ds6OtrzetbJLHySpUyW6YQ@mail.gmail.com>
Message-ID: <CAD=FV=WWZ1txHYOQZuCASbspLUP-Ds6OtrzetbJLHySpUyW6YQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: drm/bridge: ti-sn65dsi86: Add hpd-gpios
 to the bindings
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Panda <spanda@codeaurora.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 15, 2020 at 5:54 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> On Wed, Apr 15, 2020 at 04:49:00PM -0700, Doug Anderson wrote:
> > On Wed, Apr 15, 2020 at 1:33 PM Laurent Pinchart wrote:
> > > On Wed, Apr 15, 2020 at 12:53:02PM -0700, Stephen Boyd wrote:
> > > > Quoting Douglas Anderson (2020-04-15 08:48:40)
> > > > > Allow people to specify to use a GPIO for hot-plug-detect.  Add an
> > > > > example.
> > > > >
> > > > > NOTE: The current patch adding support for hpd-gpios to the Linux
> > > > > driver for hpd-gpios only adds enough support to the driver so that
> > > > > the bridge can use one of its own GPIOs.  The bindings, however, are
> > > > > written generically.
> > > > >
> > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > ---
> > > > >
> > > > >  .../bindings/display/bridge/ti,sn65dsi86.yaml          | 10 +++++++++-
> > > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > > > index 8cacc6db33a9..554bfd003000 100644
> > > > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > > > @@ -60,6 +60,10 @@ properties:
> > > > >      const: 1
> > > > >      description: See ../../pwm/pwm.yaml for description of the cell formats.
> > > > >
> > > > > +  hpd-gpios:
> > > > > +    maxItems: 1
> > > > > +    description: If present use the given GPIO for hot-plug-detect.
> > > >
> > > > Shouldn't this go in the panel node? And the panel driver should get the
> > > > gpio and poll it after powering up the panel? Presumably that's why we
> > > > have the no-hpd property in the simple panel binding vs. putting it here
> > > > in the bridge.
> > >
> > > Same question really, I think this belongs to the panel (or connector)
> > > node indeed.
> >
> > Hrm.
> >
> > To me "no-hpd" feels OK in the panel because the lack of a connection
> > is somewhat symmetric.  Thus it's OK to say either "HPD isn't hooked
> > up to the panel in this system" or "HPD isn't hooked up to the bridge
> > in this system" and both express the same thing (AKA that there is no
> > HPD connection between the bridge and the panel).  In the case of
> > "no-hpd" it's more convenient to express it on the panel side because
> > the panel driver is the one whose behavior has to change if HPD isn't
> > hooked up.  The panel datasheet is the one that says how long of a
> > delay we need if HPD isn't hooked up.
> >
> > ...but when you're talking about where the bridge driver should look
> > to find the HPD signal that it needs, that really feels like it should
> > be described as part of the bridge.  Specifically imagine we were
> > using our bridge for DP, not for eDP.  In that case simple-panel
> > wouldn't be involved because we could get any type of display plugged
> > in.  Thus it couldn't go in the panel node.  Here it feels clearer
> > that hpd-gpio needs to be a property of the bridge driver.
>
> If you were using it for DP, you would need a DT node for the DP
> connector (with bindings to be added to
> Documentation/devicetree/bindings/display/connector/, similar to the
> ones we already have for other connectors). That DT node should
> reference the HPD pin GPIO. The bridge driver for the connector
> (drivers/gpu/drm/bridge/display-connector.c) would then handle HPD. The
> good news is that it already does :-)

I'm having a really hard time following, but maybe it's because my
knowledge of the DRM terminology is feeble at best?

Looking at it from a DRM driver perspective and thus looking in
'drm/bridge/ti-sn65dsi86.c' I see that the driver for this bridge chip
effectively is both the bridge and the connector.  The struct
encapsulating the driver data has both:

  struct drm_bridge bridge;
  struct drm_connector connector;

...in ti_sn_bridge_attach() the code calls drm_connector_init() for
the connector.

Looking at it from a device tree point of view, there is no separate
node representing an eDP connector for one mainline user of
'ti,sn65dsi86' (sdm845-cheza).  The device tree node has one input
port (from "dsi0_out") and one output port (to "panel_in_edp").  There
is no separate connector node as I can see with "hdmi-connector".
...and, as far as I can tell, sdm845-cheza is using the bindings as
documented.  The bindings say that the 'ti,sn65dsi86' node needs two
ports:
- Video port 0 for DSI input
- Video port 1 for eDP output

So, though I'm probably terribly confused, I would tentatively say that:

- I'd guess that the 'ti,sn65dsi86' bindings were written / approved
back before people were encouraged to model the connector as a
separate node.

- In the case of 'ti,sn65dsi86' the current dts node is both the node
for the bridge and the connector.

- If we want to try to deprecate the way that 'ti,sn65dsi86' works it
feels like a big-ish effort.  This would include adding a new "eDP"
connector class and trying to figure out how to deal with backward
compatibility for old dts files (assuming folks care).

Did I get that right?  If so, maybe my "hpd-gpios" is already part of
the "connector" node?


> > Looking at other usages of "hpd-gpio" in the kernel, it seems like the
> > usage I'm proposing is also common.  Grepping for "hpd-gpios" shows
> > numerous examples of "hpd-gpios" being defined at the display
> > controller level and (effectively) I believe the bridge is at the
> > equivalent level.
>
> Bridge drivers should only implement support for features available from
> the corresponding hardware. If an HPD signal is connected to a dedicated
> pin of the bridge, and the bridge can generate an interrupt and expose
> the HPD status through I2C, then it should implement HPD-related
> operations. If the HPD pin from the connector is hooked up to a GPIO of
> the SoC, it should be handled by the connector bridge driver.

So the case I'm trying to deal with is a little odd.  I tried to spell
it all out in patch #3 [1] but to talk about it here too:

1. The 'ti,sn65dsi86' does have a hardware HPD pin.  That pin can
generate an interrupt.

2. For reasons described in patch #3 (and the other commit it
references, c2bfc223882d), the hardware HPD pin on 'ti,sn65dsi86' is
nearly useless for eDP.  Specifically, eDP panels are usually
(always?) not removable and thus HPD isn't a signal that needs
debouncing.  ...yet the signal is debounced in hardware on
'ti,sn65dsi86' and that means a delay of 100 - 200ms before you can
see the true value of HPD.  That's an extra 100 - 200ms before the
panel can turn on.

3. Even if eDP panels aren't actually hot plugged, HPD is still a
useful concept for eDP.  It can be used to avoid hardcoded delays
since panels use it to signal when they're ready.  ...but if HPD is
debounced that doesn't work so well.

4. 'ti,sn65dsi86' has some pins that can be used as GPIOs.  These are
ideal places to route HPD since they are not debounced and pretty much
a perfect fit for this signal (don't waste SoC GPIOs, routing signals
on your board is easier, pins are powered exactly when you need them).

5. The GPIOs on 'ti,sn65dsi86' cannot generate IRQs and can only be
polled.  ...but this is OK.  I'm specifically trying to support the
case of a panel that is always connected and I just want HPD to be the
signal that the panel is ready for me to talk to it.  Polling is fine.
Specifically the bridge driver doesn't try to poll HPD to decide if we
have something connected--it always returns
'connector_status_connected'.  ...and this is the correct behavior for
eDP because you know the hardware is always there and HPD won't even
be asserted until you start to power up the panel.

6. My current implementation in patch #3 actually doesn't fully
implement a Linux GPIO provider in the bridge driver.  See that patch
for justification.  While I could do the work to do this and I'll do
it if folks insist, I think the current simpler code is nice.  If
there was a separate "edp-connector" driver then presumably I'd have
to add the complexity of implementing the GPIO provider API.


I guess to summarize my understanding of all the above:

- I think designing and adding a separate 'edp-connector' driver and
device tree node and migrating existing users over would be a big
chunk of work and is out of scope for me.

- I'm hoping that the current approach is still OK.

- If people really like the edp-connector concept and want to try to
adapt old code later there's nothing here that prevents it--it's just
a bunch of extra code.


[1] https://lore.kernel.org/r/20200415084758.3.Ia50267a5549392af8b37e67092ca653a59c95886@changeid
