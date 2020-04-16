Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E66B1AB4EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 02:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405315AbgDPAyb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 20:54:31 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44858 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405272AbgDPAy3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 20:54:29 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FE639CE;
        Thu, 16 Apr 2020 02:54:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586998462;
        bh=dZMu091chEyqroFKiISuS3a3zyFSmf1eCaPuRd8WZVY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=locygWHL2WF1Ca6qoSa6yVUf3P0xH4QJioRzvG/rX2BlbeKwenhKLMB6syGrJAIYh
         561P+rcQu4eJrG8FDeUW3A5XHYuOw3K+vfGhLgI0/MoeWeABHwQFwPTIZu4+Fg694D
         hlbQ9RnS3NKvnX8hMsjovvOtfdJ34+YTwwOogorU=
Date:   Thu, 16 Apr 2020 03:54:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Doug Anderson <dianders@chromium.org>
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
Subject: Re: [PATCH 2/3] dt-bindings: drm/bridge: ti-sn65dsi86: Add hpd-gpios
 to the bindings
Message-ID: <20200416005409.GR4758@pendragon.ideasonboard.com>
References: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
 <20200415084758.2.Ic98f6622c60a1aa547ed85781f2c3b9d3e56b734@changeid>
 <158698038289.105027.2860892334897893887@swboyd.mtv.corp.google.com>
 <20200415203256.GP4758@pendragon.ideasonboard.com>
 <CAD=FV=U1U7y_U4+zySzA9e_uYE0ECdM1Bd-ew0OxG3ciqjRVSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=U1U7y_U4+zySzA9e_uYE0ECdM1Bd-ew0OxG3ciqjRVSA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

On Wed, Apr 15, 2020 at 04:49:00PM -0700, Doug Anderson wrote:
> On Wed, Apr 15, 2020 at 1:33 PM Laurent Pinchart wrote:
> > On Wed, Apr 15, 2020 at 12:53:02PM -0700, Stephen Boyd wrote:
> > > Quoting Douglas Anderson (2020-04-15 08:48:40)
> > > > Allow people to specify to use a GPIO for hot-plug-detect.  Add an
> > > > example.
> > > >
> > > > NOTE: The current patch adding support for hpd-gpios to the Linux
> > > > driver for hpd-gpios only adds enough support to the driver so that
> > > > the bridge can use one of its own GPIOs.  The bindings, however, are
> > > > written generically.
> > > >
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > >
> > > >  .../bindings/display/bridge/ti,sn65dsi86.yaml          | 10 +++++++++-
> > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > > index 8cacc6db33a9..554bfd003000 100644
> > > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > > @@ -60,6 +60,10 @@ properties:
> > > >      const: 1
> > > >      description: See ../../pwm/pwm.yaml for description of the cell formats.
> > > >
> > > > +  hpd-gpios:
> > > > +    maxItems: 1
> > > > +    description: If present use the given GPIO for hot-plug-detect.
> > >
> > > Shouldn't this go in the panel node? And the panel driver should get the
> > > gpio and poll it after powering up the panel? Presumably that's why we
> > > have the no-hpd property in the simple panel binding vs. putting it here
> > > in the bridge.
> >
> > Same question really, I think this belongs to the panel (or connector)
> > node indeed.
> 
> Hrm.
> 
> To me "no-hpd" feels OK in the panel because the lack of a connection
> is somewhat symmetric.  Thus it's OK to say either "HPD isn't hooked
> up to the panel in this system" or "HPD isn't hooked up to the bridge
> in this system" and both express the same thing (AKA that there is no
> HPD connection between the bridge and the panel).  In the case of
> "no-hpd" it's more convenient to express it on the panel side because
> the panel driver is the one whose behavior has to change if HPD isn't
> hooked up.  The panel datasheet is the one that says how long of a
> delay we need if HPD isn't hooked up.
> 
> ...but when you're talking about where the bridge driver should look
> to find the HPD signal that it needs, that really feels like it should
> be described as part of the bridge.  Specifically imagine we were
> using our bridge for DP, not for eDP.  In that case simple-panel
> wouldn't be involved because we could get any type of display plugged
> in.  Thus it couldn't go in the panel node.  Here it feels clearer
> that hpd-gpio needs to be a property of the bridge driver.

If you were using it for DP, you would need a DT node for the DP
connector (with bindings to be added to
Documentation/devicetree/bindings/display/connector/, similar to the
ones we already have for other connectors). That DT node should
reference the HPD pin GPIO. The bridge driver for the connector
(drivers/gpu/drm/bridge/display-connector.c) would then handle HPD. The
good news is that it already does :-)

> Looking at other usages of "hpd-gpio" in the kernel, it seems like the
> usage I'm proposing is also common.  Grepping for "hpd-gpios" shows
> numerous examples of "hpd-gpios" being defined at the display
> controller level and (effectively) I believe the bridge is at the
> equivalent level.

Bridge drivers should only implement support for features available from
the corresponding hardware. If an HPD signal is connected to a dedicated
pin of the bridge, and the bridge can generate an interrupt and expose
the HPD status through I2C, then it should implement HPD-related
operations. If the HPD pin from the connector is hooked up to a GPIO of
the SoC, it should be handled by the connector bridge driver.

-- 
Regards,

Laurent Pinchart
