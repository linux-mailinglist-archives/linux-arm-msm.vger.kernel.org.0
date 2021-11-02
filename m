Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69FE7442FAE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 15:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbhKBODs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 10:03:48 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:45724 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230257AbhKBODs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 10:03:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
        t=1635856506; bh=86oBTMpnXN2rssnmOQ7LA61tTu8gU4eFEfOZP78RisE=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
        b=arAXsp3pJle1r6nOqeqtDf2GduQBJSJKdxquDfPAglkotW2p8bd9ev6Y1hBR3zQtg
         IuyMT4zYDmmlvKXOVjKcAlGccOqgCOyTr7jvZCiwWUwgT/UAfqSpkdsL+5jWMX7OiY
         9iniW7IyoDqfGYNxRqVLIjAV6dqoTLdd5QORxuSQ=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Tue,  2 Nov 2021 13:34:38 +0100 (CET)
X-EA-Auth: FKr0z78nEI7fK18kQiJqc8cm6AQzx1MLFVMzYMgk3A7ptvyPhNNicmEOsJfefFwiU43Mj4ZkxeU8iS9dGsGDy7tpZekUHCqR
Date:   Tue, 2 Nov 2021 13:34:35 +0100
From:   Claudio Suarez <cssk@net-c.es>
To:     Inki Dae <inki.dae@samsung.com>
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
        Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
        ville.syrjala@linux.intel.com
Subject: Re: [PATCH v2 06/13] drm/exynos: replace drm_detect_hdmi_monitor()
 with drm_display_info.is_hdmi
Message-ID: <YYEwWwZY/D7ylVuN@gineta.localdomain>
References: <20211016184226.3862-1-cssk@net-c.es>
 <CGME20211016193513epcas1p4e354183520df0aa4c381b19eb2863262@epcas1p4.samsung.com>
 <20211016184226.3862-7-cssk@net-c.es>
 <ee6b3bac-4762-fd8f-c12a-c0a7ea7b56e9@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee6b3bac-4762-fd8f-c12a-c0a7ea7b56e9@samsung.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 27, 2021 at 07:28:45AM +0900, Inki Dae wrote:
> Hi,
> 
> 21. 10. 17. 오전 3:42에 Claudio Suarez 이(가) 쓴 글:
> > Once EDID is parsed, the monitor HDMI support information is available
> > through drm_display_info.is_hdmi. Retriving the same information with
> > drm_detect_hdmi_monitor() is less efficient. Change to
> > drm_display_info.is_hdmi
> > 
> > Signed-off-by: Claudio Suarez <cssk@net-c.es>
> > ---
> >  drivers/gpu/drm/exynos/exynos_hdmi.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(
> > 
> > diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> > index 7655142a4651..a563d6386abe 100644
> > --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> > @@ -893,12 +893,14 @@ static int hdmi_get_modes(struct drm_connector *connector)
> >  	if (!edid)
> >  		return -ENODEV;
> >  
> > -	hdata->dvi_mode = !drm_detect_hdmi_monitor(edid);
> > +	/* This updates connector->display_info */
> > +	drm_connector_update_edid_property(connector, edid);
> > +
> > +	hdata->dvi_mode = !connector->display_info.is_hdmi;
> 
> Thanks for correcting this. Yeah, we should use drm_display_info.is_hdmi parsed from EDID.
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/gpu/drm/drm_edid.c?h=v5.14.14#n4725
> 
> Signed-off-by: Inki Dae <inki.dae@samsung.com>


Thank you, Inki.

Best regards
Claudio Suarez


