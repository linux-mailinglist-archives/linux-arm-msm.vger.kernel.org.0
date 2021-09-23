Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA384154BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 02:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238725AbhIWAlB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 20:41:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33644 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238709AbhIWAlA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 20:41:00 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC11CE52;
        Thu, 23 Sep 2021 02:39:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632357568;
        bh=4UEyTbgR066Ho9YbI93ApbZXYxIqsDF3qkQxyZHju14=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uBn7ytQjXpMpe88Ll7Fv8HeHmShJbp4daT3UeIbkTxAXIqBxE/r6C1FK4etK+zL5c
         gdEEB6FzX1mHMlrOeUFJGVrFZgfjIrz4EjcHut7eipe2S0i6X60IK/OWh+kbvqSQye
         a+qXn04klzLzhRSSMvJnegiqRxa1FwW38Fvp+z9o=
Date:   Thu, 23 Sep 2021 03:39:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Doug Anderson <dianders@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
Message-ID: <YUvMv+Y8tFcWPEHd@pendragon.ideasonboard.com>
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-5-robdclark@gmail.com>
 <YRV10ew/Lr8GPzEv@pendragon.ideasonboard.com>
 <CAD=FV=Xd9fizYdxfXYOkpJ_1fZcHp3-ROJ7k4iPg0g0RQ_+A3Q@mail.gmail.com>
 <CAF6AEGt8K=iy8=dn+GJxt7ybfPtGDPy9w3StqWDwyOv_CKLNVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAF6AEGt8K=iy8=dn+GJxt7ybfPtGDPy9w3StqWDwyOv_CKLNVg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob and Doug,

On Mon, Sep 20, 2021 at 11:32:02AM -0700, Rob Clark wrote:
> On Thu, Aug 12, 2021 at 1:08 PM Doug Anderson wrote:
> > On Thu, Aug 12, 2021 at 12:26 PM Laurent Pinchart wrote:
> > > On Wed, Aug 11, 2021 at 04:52:50PM -0700, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Slightly awkward to fish out the display_info when we aren't creating
> > > > own connector.  But I don't see an obvious better way.
> > >
> > > We need a bit more than this, to support the NO_CONNECTOR case, the
> > > bridge has to implement a few extra operations, and set the bridge .ops
> > > field. I've submitted two patches to do so a while ago:
> > >
> > > - [RFC PATCH 08/11] drm/bridge: ti-sn65dsi86: Implement bridge connector operations ([1])
> >
> > Rob asked me about this over IRC, so if he left it out and it's needed
> > then it's my fault. However, I don't believe it's needed until your
> > series making this bridge chip support full DP. For the the eDP case
> > the bridge chip driver in ToT no longer queries the EDID itself. It
> > simply provides an AUX bus to the panel driver and the panel driver
> > queries the EDID. I think that means we don't need to add
> > DRM_BRIDGE_OP_EDID, right?

That's right.

> > I was also wondering if in the full DP case we should actually model
> > the physical DP jack as a drm_bridge and have it work the same way. It
> > would get probed via the DP AUX bus just like a panel. I seem to
> > remember Stephen Boyd was talking about modeling the DP connector as a
> > drm_bridge because it would allow us to handle the fact that some TCPC
> > chips could only support HBR2 whereas others could support HBR3. Maybe
> > it would end up being a fairly elegant solution?

Physical connectors are already handled as bridges, see
drivers/gpu/drm/bridge/display-connector.c. I however don't think it
should handle EDID retrieval, because that's really not an operation
implemented by the connector itself.

> > > - [RFC PATCH 09/11] drm/bridge: ti-sn65dsi86: Make connector creation optional ([2])
> > >
> > > The second patch is similar to the first half of this patch, but misses
> > > the cleanup code. I'll try to rebase this and resubmit, but it may take
> > > a bit of time.
> >
> > Whoops! You're right that Rob's patch won't work at all because we'll
> > just hit the "Fix bridge driver to make connector optional!" case. I
> > should have noticed that. :(
> 
> Yes, indeed.. once I fix that, I get no display..
> 
> Not sure if Laurent is still working on his series, otherwise I can
> try to figure out what bridge ops are missing

I am, but too slowly. I don't mind fast-tracking the changes you need
though.

-- 
Regards,

Laurent Pinchart
