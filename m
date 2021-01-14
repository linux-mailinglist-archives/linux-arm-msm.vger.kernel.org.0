Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3502F5A92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 07:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbhANGPM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 01:15:12 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46866 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbhANGPM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 01:15:12 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D77C3279;
        Thu, 14 Jan 2021 07:14:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610604870;
        bh=cHUnt2NLQz5i6ENRuyZKCOjdVJGgi4OXH1YMsBfgXHs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mwYitn9hq/qHo2Pyxc4Dyuy5Lvm3KSzJlmKGu3QvxBtwAZfQNBll1/3Hxiz3ukU3j
         OT2VmJzdK11iE9UIoKNkWJezcSeTOEfhWVWk/dc5OWRyu3ERVqHpo3cX9zriInoY24
         lHehRjV68wF3hTxBS1JFWSc7PwNpVH9PG9RBu3kk=
Date:   Thu, 14 Jan 2021 08:14:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/2] drm/bridge/lontium-lt9611uxc: fix waiting for EDID
 to become available
Message-ID: <X//hNDIH2taZrH+W@pendragon.ideasonboard.com>
References: <20201127092316.122246-1-dmitry.baryshkov@linaro.org>
 <CAA8EJpoetah-BHxe1Xao=8R3rR4CocdA9AXLERTjc-yKJ+Z0UQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAA8EJpoetah-BHxe1Xao=8R3rR4CocdA9AXLERTjc-yKJ+Z0UQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Tue, Jan 05, 2021 at 08:20:39PM +0300, Dmitry Baryshkov wrote:
> Gracious ping for these two patches

I'm afraid I have very little time for DRM bridge maintenance at the
moment :-S Judging by the lack of replies, it seems the other
maintainers are also AWOL. We seem to have a shortage of maintainers for
this part of the subsystem.

> On Fri, 27 Nov 2020 at 12:23, Dmitry Baryshkov wrote:
> >
> > - Call wake_up() when EDID ready event is received to wake
> >   wait_event_interruptible_timeout()
> >
> > - Increase waiting timeout, reading EDID can take longer than 100ms, so
> >   let's be on a safe side.
> >
> > - Return NULL pointer from get_edid() callback rather than ERR_PTR()
> >   pointer, as DRM code does NULL checks rather than IS_ERR().
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > index 0c98d27f84ac..b708700e182d 100644
> > --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > @@ -145,8 +145,10 @@ static irqreturn_t lt9611uxc_irq_thread_handler(int irq, void *dev_id)
> >
> >         lt9611uxc_unlock(lt9611uxc);
> >
> > -       if (irq_status & BIT(0))
> > +       if (irq_status & BIT(0)) {
> >                 lt9611uxc->edid_read = !!(hpd_status & BIT(0));
> > +               wake_up_all(&lt9611uxc->wq);
> > +       }
> >
> >         if (irq_status & BIT(1)) {
> >                 if (lt9611uxc->connector.dev)
> > @@ -465,7 +467,7 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
> >  static int lt9611uxc_wait_for_edid(struct lt9611uxc *lt9611uxc)
> >  {
> >         return wait_event_interruptible_timeout(lt9611uxc->wq, lt9611uxc->edid_read,
> > -                       msecs_to_jiffies(100));
> > +                       msecs_to_jiffies(500));
> >  }
> >
> >  static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
> > @@ -503,7 +505,10 @@ static struct edid *lt9611uxc_bridge_get_edid(struct drm_bridge *bridge,
> >         ret = lt9611uxc_wait_for_edid(lt9611uxc);
> >         if (ret < 0) {
> >                 dev_err(lt9611uxc->dev, "wait for EDID failed: %d\n", ret);
> > -               return ERR_PTR(ret);
> > +               return NULL;
> > +       } else if (ret == 0) {
> > +               dev_err(lt9611uxc->dev, "wait for EDID timeout\n");
> > +               return NULL;
> >         }
> >
> >         return drm_do_get_edid(connector, lt9611uxc_get_edid_block, lt9611uxc);

-- 
Regards,

Laurent Pinchart
