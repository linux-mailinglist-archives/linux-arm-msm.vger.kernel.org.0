Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA4742FBF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 21:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238335AbhJOT00 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 15:26:26 -0400
Received: from ip-16.mailobj.net ([213.182.54.16]:53378 "EHLO msg-6.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242695AbhJOT0Z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 15:26:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
        t=1634325849; bh=LHI6ADKUuEjRgd/13zbEVoP8yqLJTf3ZSPQveWR4Xeg=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
        b=UJkcX3Tm6RHULPirG9jbEdfFYGGJ66I9KBQKuzi98ISfle+pBczUkzMcwmIzRVLdT
         MAh0MVlf/AYndTRFTFK655yY2Mgf5bP1nrEWc/pBXWK9J27FJZxPow/BYvc+lLN2ir
         EtHptpAEuwYVBB73L+5SXGwDanjW0SDVYPlyj5SQ=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Fri, 15 Oct 2021 21:24:09 +0200 (CEST)
X-EA-Auth: U6CSUQYVFt3UVX/XYpcq7X1KrM+JbBDIgrc/Xwcsszd8MPNiA5z5prKhMOKAhZFdLHqNfioDKmq9YtwQVNP17+FoeAaZQdMb
Date:   Fri, 15 Oct 2021 21:24:06 +0200
From:   Claudio Suarez <cssk@net-c.es>
To:     Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
        Maxime Ripard <mripard@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Chen-Yu Tsai <wens@csie.org>, Sandy Huang <hjc@rock-chips.com>,
        heiko@sntech.de, Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 01/15] gpu/drm: make drm_add_edid_modes() consistent when
 updating connector->display_info
Message-ID: <YWnVVoCipTXxx8NW@gineta.localdomain>
References: <20211015113713.630119-1-cssk@net-c.es>
 <20211015113713.630119-2-cssk@net-c.es>
 <YWluAX6LA2DupE+E@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YWluAX6LA2DupE+E@intel.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 15, 2021 at 03:03:13PM +0300, Ville Syrj�l� wrote:
> On Fri, Oct 15, 2021 at 01:36:59PM +0200, Claudio Suarez wrote:
> > According to the documentation, drm_add_edid_modes
> > "... Also fills out the &drm_display_info structure and ELD in @connector
> > with any information which can be derived from the edid."
> > 
> > drm_add_edid_modes accepts a struct edid *edid parameter which may have a
> > value or may be null. When it is not null, connector->display_info and
> > connector->eld are updated according to the edid. When edid=NULL, only
> > connector->eld is reset. Reset connector->display_info to be consistent
> > and accurate.
> > 
> > Signed-off-by: Claudio Suarez <cssk@net-c.es>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 6325877c5fd6..6cbe09b2357c 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -5358,10 +5358,12 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
> >  
> >  	if (edid == NULL) {
> >  		clear_eld(connector);
> > +		drm_reset_display_info(connector);
> >  		return 0;
> >  	}
> >  	if (!drm_edid_is_valid(edid)) {
> >  		clear_eld(connector);
> > +		drm_reset_display_info(connector);
> 
> Looks easier if you pull both of those out from these branches and
> just call them unconditionally at the start.

After looking at the full code, I am not sure. This is the code:
==================
int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
{
        int num_modes = 0;
        u32 quirks;

        if (edid == NULL) {
                clear_eld(connector);
                drm_reset_display_info(connector); <--- added by me
                return 0;
        }
        if (!drm_edid_is_valid(edid)) {
                clear_eld(connector);
                drm_reset_display_info(connector); <--- added by me
                drm_warn(connector->dev, "%s: EDID invalid.\n",
                         connector->name);
                return 0;
        }

        drm_edid_to_eld(connector, edid);

        quirks = drm_add_display_info(connector, edid);
	etc...
=================

If we move those out of these branches and edid != NULL, we are executing an
unnecessary clear_eld(connector) and an unnecessary drm_reset_display_info(connector)
because the fields will be set in the next drm_edid_to_eld(connector, edid) and
drm_add_display_info(connector, edid)

Do we want this ?

BR
Claudio Suarez



