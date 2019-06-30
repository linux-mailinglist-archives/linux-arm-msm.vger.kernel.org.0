Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABFD45B22D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2019 23:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbfF3V6F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jun 2019 17:58:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51898 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbfF3V6F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jun 2019 17:58:05 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69527255;
        Sun, 30 Jun 2019 23:58:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1561931882;
        bh=bKYlTNmqOvfD/Do5/wFG9DgDcZ3okJ4ozjFGaT7II18=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NjdZwHk0ehQgG3Hies1OH3Kq/mNYVosA+lPCM0umbcIl6zSd41M/Rtgq9P3rerb19
         TC0so/zXYByvZ/uOttoXuBDPz0+N3sjb4eLII51Q4TtvryPpH+FyJmDPcjC72i4YNB
         WMHG/l1Agpq906bDV4JWUGPgbyJ2XjJ7ryMM8sIM=
Date:   Mon, 1 Jul 2019 00:57:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: use helper to lookup
 panel-id
Message-ID: <20190630215742.GK7043@pendragon.ideasonboard.com>
References: <20190630203614.5290-1-robdclark@gmail.com>
 <20190630203614.5290-5-robdclark@gmail.com>
 <20190630211726.GJ7043@pendragon.ideasonboard.com>
 <CAF6AEGu7XschmqWz_t9xWk_kFQoE=U-KTSB_+k9-SDAYNDdFww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAF6AEGu7XschmqWz_t9xWk_kFQoE=U-KTSB_+k9-SDAYNDdFww@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On Sun, Jun 30, 2019 at 02:50:59PM -0700, Rob Clark wrote:
> On Sun, Jun 30, 2019 at 2:17 PM Laurent Pinchart wrote:
> > On Sun, Jun 30, 2019 at 01:36:08PM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Use the drm_of_find_panel_id() helper to decide which endpoint to use
> > > when looking up panel.  This way we can support devices that have
> > > multiple possible panels, such as the aarch64 laptops.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > index 2719d9c0864b..56c66a43f1a6 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > @@ -790,7 +790,7 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
> > >                             const struct i2c_device_id *id)
> > >  {
> > >       struct ti_sn_bridge *pdata;
> > > -     int ret;
> > > +     int ret, panel_id;
> > >
> > >       if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> > >               DRM_ERROR("device doesn't support I2C\n");
> > > @@ -811,7 +811,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
> > >
> > >       pdata->dev = &client->dev;
> > >
> > > -     ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, 0,
> > > +     panel_id = drm_of_find_panel_id();
> > > +     ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, panel_id,
> > >                                         &pdata->panel, NULL);
> > >       if (ret) {
> > >               DRM_ERROR("could not find any panel node\n");
> >
> > No, I'm sorry, but that's a no-go. We can't patch every single bridge
> > driver to support this hack. We need a solution implemented at another
> > level that will not spread throughout the whole subsystem.
> 
> it could be possible to make a better helper.. but really there aren't
> *that* many bridge drivers
> 
> suggestions ofc welcome, but I think one way or another we are going
> to need to patch bridges by the time we get to adding ACPI support, so
> really trivial couple line patches to the handful of bridges we have
> isn't really something that worries me

It's only one right now as that's the only one you care about, but
before we'll have time to blink, it will be another one, and another
one, ... Sorry, that's a no-go for me.

-- 
Regards,

Laurent Pinchart
