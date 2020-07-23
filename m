Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B63F222ADE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 13:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbgGWLjW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 07:39:22 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:50804 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgGWLjW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 07:39:22 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 8E93320053;
        Thu, 23 Jul 2020 13:39:14 +0200 (CEST)
Date:   Thu, 23 Jul 2020 13:39:12 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v5 3/4] drm/bridge: Introduce LT9611 DSI to HDMI bridge
Message-ID: <20200723113912.GA535520@ravnborg.org>
References: <20200708103559.132300-1-vkoul@kernel.org>
 <20200708103559.132300-4-vkoul@kernel.org>
 <20200719171806.GA55541@ravnborg.org>
 <20200722131430.GJ5833@pendragon.ideasonboard.com>
 <20200723104151.GY12965@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723104151.GY12965@vkoul-mobl>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=MEg9e8l0tn4fy5IhjskA:9 a=CjuIK1q_8ugA:10
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 23, 2020 at 04:11:51PM +0530, Vinod Koul wrote:
> Hi Sam, Laurent,
> 
> On 22-07-20, 16:14, Laurent Pinchart wrote:
> > > > +static int lt9611_bridge_attach(struct drm_bridge *bridge,
> > > > +				enum drm_bridge_attach_flags flags)
> > > > +{
> > > > +	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> > > > +	int ret;
> > > > +
> > > > +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > > > +		dev_err(lt9611->dev, "Fix bridge driver to make connector optional!");
> > > > +		return -EINVAL;
> > > > +	}
> > >
> > > This should say that the display driver should be fixed.
> > > If a display driver expects this bridge to create the connector
> > > it would not work.
> > 
> > Actually, for new bridge drivers, connector creation should be optional
> > from the start. We don't want a failure in that case, the feature should
> > be implemented.
> 
> Yes this is causing issues for me now !. The patch 4/4 adds support in
> msm/dsi but causes regression on qualcomm laptops with ti-sn65dsi86 eDP
> bridge. I tried to fix that up with changes like Laurent has done for
> adv7511, but it hasnt worked yet for me (remote debug of this is bit
> painful)
> 
> So I am going to drop patch 4 from this series and add support for both
> DRM_BRIDGE_ATTACH_NO_CONNECTOR set and cleared (like we have in adv7511)
> so that it can work in both cases, while I fix all bridge uses of
> msm/dsi and then we can drop these. Does that sound okay to you folks?
Yes, sounds like a good plan.
Only when all display drivers are migrated over can we drop all the
workarounds in the bridge drivers.
I had hoped all users of this bridge was converted - alas that was not
the case.

	Sam
