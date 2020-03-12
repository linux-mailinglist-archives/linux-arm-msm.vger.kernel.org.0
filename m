Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04A38183674
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 17:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgCLQoi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 12:44:38 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44514 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgCLQoh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 12:44:37 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 746EC296B45;
        Thu, 12 Mar 2020 16:44:35 +0000 (GMT)
Date:   Thu, 12 Mar 2020 17:44:32 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Ilia Mirkin <imirkin@alum.mit.edu>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: avoid double-attaching hdmi/edp bridges
Message-ID: <20200312174432.316e0e1d@collabora.com>
In-Reply-To: <CAF6AEGt4hnMJE=DSAx1754DTV4TJG5L8YocqMjAE1NpNJZaJMg@mail.gmail.com>
References: <20200312035154.1621-1-imirkin@alum.mit.edu>
        <CAF6AEGt4hnMJE=DSAx1754DTV4TJG5L8YocqMjAE1NpNJZaJMg@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 12 Mar 2020 09:19:58 -0700
Rob Clark <robdclark@gmail.com> wrote:

> On Wed, Mar 11, 2020 at 8:52 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> >
> > Each of hdmi and edp are already attached in msm_*_bridge_init. A second
> > attachment returns -EBUSY, failing the driver load.
> >
> > Tested with HDMI on IFC6410 (APQ8064 / MDP4), but eDP case should be
> > analogous.
> >
> > Fixes: 3ef2f119bd3ed (drm/msm: Use drm_attach_bridge() to attach a bridge to an encoder)
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>  
> 
> Thanks
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com>


Sorry for the regression. Looks like encoder->bridge was assigned twice
before my patch, and I didn't check if there were other
drm_bridge_attach() calls in the driver :-/.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>


> 
> > ---
> >  drivers/gpu/drm/msm/edp/edp.c   | 4 ----
> >  drivers/gpu/drm/msm/hdmi/hdmi.c | 4 ----
> >  2 files changed, 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/edp/edp.c b/drivers/gpu/drm/msm/edp/edp.c
> > index ad4e963ccd9b..106a67473af5 100644
> > --- a/drivers/gpu/drm/msm/edp/edp.c
> > +++ b/drivers/gpu/drm/msm/edp/edp.c
> > @@ -178,10 +178,6 @@ int msm_edp_modeset_init(struct msm_edp *edp, struct drm_device *dev,
> >                 goto fail;
> >         }
> >
> > -       ret = drm_bridge_attach(encoder, edp->bridge, NULL);
> > -       if (ret)
> > -               goto fail;
> > -
> >         priv->bridges[priv->num_bridges++]       = edp->bridge;
> >         priv->connectors[priv->num_connectors++] = edp->connector;
> >
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > index 1a9b6289637d..737453b6e596 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > @@ -327,10 +327,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
> >                 goto fail;
> >         }
> >
> > -       ret = drm_bridge_attach(encoder, hdmi->bridge, NULL);
> > -       if (ret)
> > -               goto fail;
> > -
> >         priv->bridges[priv->num_bridges++]       = hdmi->bridge;
> >         priv->connectors[priv->num_connectors++] = hdmi->connector;
> >
> > --
> > 2.24.1
> >  

