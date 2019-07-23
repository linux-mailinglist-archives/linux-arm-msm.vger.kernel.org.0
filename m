Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0701571B70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 17:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729772AbfGWPTu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 11:19:50 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:51539 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728591AbfGWPTu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 11:19:50 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 54655200D5;
        Tue, 23 Jul 2019 17:19:41 +0200 (CEST)
Date:   Tue, 23 Jul 2019 17:19:39 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
        linux-samsung-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, Sean Paul <sean@poorly.run>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
        Kukjin Kim <kgene@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Dave Airlie <airlied@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        linux-mediatek@lists.infradead.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Vincent Abriou <vincent.abriou@st.com>,
        linux-arm-kernel@lists.infradead.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        amd-gfx@lists.freedesktop.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Douglas Anderson <dianders@chromium.org>,
        Todor Tomov <todor.tomov@linaro.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Huang Rui <ray.huang@amd.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        freedreno@lists.freedesktop.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 14/23] drm/tilcdc: Provide ddc symlink in connector
 sysfs directory
Message-ID: <20190723151939.GA13718@ravnborg.org>
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <d1d415022c598fb7acd033f0f322dd67250adaa9.1562843413.git.andrzej.p@collabora.com>
 <20190723090532.GA787@ravnborg.org>
 <3ad60be5-49cf-4017-4b74-53a2d6272deb@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ad60be5-49cf-4017-4b74-53a2d6272deb@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=QX4gbG5DAAAA:8
        a=6mu-9OIm9KcVJ4iDVDwA:9 a=wPNLvfGTeEIA:10 a=AbAUZ8qAyYyZVLSsDulk:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Andrej.

On Tue, Jul 23, 2019 at 02:44:50PM +0200, Andrzej Pietrasiewicz wrote:
> Hi Sam,
> 
> W dniu 23.07.2019 o 11:05, Sam Ravnborg pisze:
> > Hi Andrzej
> > 
> > On Thu, Jul 11, 2019 at 01:26:41PM +0200, Andrzej Pietrasiewicz wrote:
> > > Use the ddc pointer provided by the generic connector.
> > > 
> > > Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> > > ---
> > >   drivers/gpu/drm/tilcdc/tilcdc_tfp410.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/gpu/drm/tilcdc/tilcdc_tfp410.c b/drivers/gpu/drm/tilcdc/tilcdc_tfp410.c
> > > index 62d014c20988..c373edb95666 100644
> > > --- a/drivers/gpu/drm/tilcdc/tilcdc_tfp410.c
> > > +++ b/drivers/gpu/drm/tilcdc/tilcdc_tfp410.c
> > > @@ -219,6 +219,7 @@ static struct drm_connector *tfp410_connector_create(struct drm_device *dev,
> > >   	tfp410_connector->mod = mod;
> > >   	connector = &tfp410_connector->base;
> > > +	connector->ddc = mod->i2c;
> > >   	drm_connector_init(dev, connector, &tfp410_connector_funcs,
> > >   			DRM_MODE_CONNECTOR_DVID);
> > 
> > When reading this code, it looks strange that we set connector->ddc
> > *before* the call to init the connector.
> > One could risk that drm_connector_init() used memset(..) to clear all
> > fields or so, and it would break this order.
> 
> I verified the code of drm_connector_init() and cannot find any memset()
> invocations there. What is your actual concern?
My concern is that drm_connector_init() maybe sometime in the future
will init all fileds in drm_connector, so we loose any assingments
done to drm_connector from *before* we called the init function.

Moving the assignment to after drm_connector_init() would not
let us depend on the actual implmentation of drm_connector_init().

	Sam
