Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAB993EAAC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 21:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233456AbhHLTSR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 15:18:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60898 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233593AbhHLTSP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 15:18:15 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 529A9EE;
        Thu, 12 Aug 2021 21:17:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1628795868;
        bh=TWW79F57UGZaMYBF0Q9p1yrePqna1CBLge7LfxvzIbU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EEqsh/dhGecZeeNNVwxkA393Rb9YQVaeo4a/kr64ON1gPSjK0FxGvvwNcPbcn2Kb5
         0L+eTiIVKnEBlN2K9oAWLl6iUaGk7an/eK+iXBFNdFpvD19BcoqkoLpYOHQPtoyYmX
         ZLfZFxqshDGMumVXqXooOVXR97FRx9pa+NG/wQVI=
Date:   Thu, 12 Aug 2021 22:17:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] drm/bridge: ti-sn65dsi86: Implement
 bridge->mode_valid()
Message-ID: <YRVz2MN4EDyHZYka@pendragon.ideasonboard.com>
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-4-robdclark@gmail.com>
 <YRVr/3A6UJIFiVWj@pendragon.ideasonboard.com>
 <CAF6AEGs8g2miQz=upd0LMPg109JR7gMeEGyd1u1jQ2WYR=oWtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAF6AEGs8g2miQz=upd0LMPg109JR7gMeEGyd1u1jQ2WYR=oWtQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On Thu, Aug 12, 2021 at 12:09:12PM -0700, Rob Clark wrote:
> On Thu, Aug 12, 2021 at 11:44 AM Laurent Pinchart wrote:
> > On Wed, Aug 11, 2021 at 04:52:49PM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > For the brave new world of bridges not creating their own connectors, we
> > > need to implement the max clock limitation via bridge->mode_valid()
> > > instead of connector->mode_valid().
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 24 +++++++++++++++++++-----
> > >  1 file changed, 19 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > index 5d3b30b2f547..38dcc49eccaf 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > @@ -595,6 +595,15 @@ static struct auxiliary_driver ti_sn_aux_driver = {
> > >       .id_table = ti_sn_aux_id_table,
> > >  };
> > >
> > > +static enum drm_mode_status check_mode(const struct drm_display_mode *mode)
> > > +{
> > > +     /* maximum supported resolution is 4K at 60 fps */
> > > +     if (mode->clock > 594000)
> > > +             return MODE_CLOCK_HIGH;
> > > +
> > > +     return MODE_OK;
> > > +}
> > > +
> > >  /* -----------------------------------------------------------------------------
> > >   * DRM Connector Operations
> > >   */
> > > @@ -616,11 +625,7 @@ static enum drm_mode_status
> > >  ti_sn_bridge_connector_mode_valid(struct drm_connector *connector,
> > >                                 struct drm_display_mode *mode)
> > >  {
> > > -     /* maximum supported resolution is 4K at 60 fps */
> > > -     if (mode->clock > 594000)
> > > -             return MODE_CLOCK_HIGH;
> > > -
> > > -     return MODE_OK;
> > > +     return check_mode(mode);
> >
> > Do we need to implement the connector .mode_valid() operation, given
> > that the bridge is linked in the chain ?
> 
> My understanding is that we need to keep it for display drivers that
> are not converted to NO_CONNECTOR..
> 
> But AFAIK snapdragon is the only upstream user of this bridge, so
> after the drm/msm/dsi patch lands we could probably garbage collect
> the connector support.

Even in the !NO_CONNECTOR case, the bridge will still be linked in the
chain, so the atomic helpers should call the bridge .mode_valid() in
addition to the connector .mode_valid(). I think the connector operation
is redundant.

> > >  }
> > >
> > >  static struct drm_connector_helper_funcs ti_sn_bridge_connector_helper_funcs = {
> > > @@ -763,6 +768,14 @@ static void ti_sn_bridge_detach(struct drm_bridge *bridge)
> > >       drm_dp_aux_unregister(&bridge_to_ti_sn65dsi86(bridge)->aux);
> > >  }
> > >
> > > +static enum drm_mode_status
> > > +ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
> > > +                     const struct drm_display_info *info,
> > > +                     const struct drm_display_mode *mode)
> > > +{
> > > +     return check_mode(mode);
> > > +}
> > > +
> > >  static void ti_sn_bridge_disable(struct drm_bridge *bridge)
> > >  {
> > >       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> > > @@ -1118,6 +1131,7 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> > >  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
> > >       .attach = ti_sn_bridge_attach,
> > >       .detach = ti_sn_bridge_detach,
> > > +     .mode_valid = ti_sn_bridge_mode_valid,
> > >       .pre_enable = ti_sn_bridge_pre_enable,
> > >       .enable = ti_sn_bridge_enable,
> > >       .disable = ti_sn_bridge_disable,

-- 
Regards,

Laurent Pinchart
