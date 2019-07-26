Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74FAB771AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 20:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388052AbfGZSzr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jul 2019 14:55:47 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:44222 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387743AbfGZSzr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jul 2019 14:55:47 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id CB69020127;
        Fri, 26 Jul 2019 20:55:39 +0200 (CEST)
Date:   Fri, 26 Jul 2019 20:55:38 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Liviu Dudau <liviu.dudau@arm.com>,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, linux-samsung-soc@vger.kernel.org,
        Jyri Sarha <jsarha@ti.com>,
        Vincent Abriou <vincent.abriou@st.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
        Kukjin Kim <kgene@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Dave Airlie <airlied@redhat.com>,
        intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
        linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        linux-mediatek@lists.infradead.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sean Paul <sean@poorly.run>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        amd-gfx@lists.freedesktop.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-kernel@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Huang Rui <ray.huang@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Gerd Hoffmann <kraxel@redhat.com>
Subject: Review required [Was: Associate ddc adapters with connectors]
Message-ID: <20190726185538.GD14981@ravnborg.org>
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <20190726183520.GA22572@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190726183520.GA22572@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=e5mUnYsNAAAA:8 a=nTBMXhx45H-Va90dJ2EA:9 a=CjuIK1q_8ugA:10
        a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all.

Andrzej have done a good job following up on feedback and this series is
now ready.

We need ack on the patches touching the individual drivers before we can
proceed.
Please check your drivers and get back.

	Sam

> Hi Andezej.
> 
> On Fri, Jul 26, 2019 at 07:22:54PM +0200, Andrzej Pietrasiewicz wrote:
> > It is difficult for a user to know which of the i2c adapters is for which
> > drm connector. This series addresses this problem.
> > 
> > The idea is to have a symbolic link in connector's sysfs directory, e.g.:
> > 
> > ls -l /sys/class/drm/card0-HDMI-A-1/ddc
> > lrwxrwxrwx 1 root root 0 Jun 24 10:42 /sys/class/drm/card0-HDMI-A-1/ddc \
> > 	-> ../../../../soc/13880000.i2c/i2c-2
> > 
> > The user then knows that their card0-HDMI-A-1 uses i2c-2 and can e.g. run
> > ddcutil:
> > 
> > ddcutil -b 2 getvcp 0x10
> > VCP code 0x10 (Brightness): current value =    90, max value =   100
> > 
> > The first patch in the series adds struct i2c_adapter pointer to struct
> > drm_connector. If the field is used by a particular driver, then an
> > appropriate symbolic link is created by the generic code, which is also added
> > by this patch.
> > 
> > Patch 2 adds a new variant of drm_connector_init(), see the changelog
> > below.
> > 
> > Patches 3..24 are examples of how to convert a driver to this new scheme.
> > 
> ...
> > 
> > v5..v6:
> > 
> > - improved subject line of patch 1
> > - added kernel-doc for drm_connector_init_with_ddc()
> > - improved kernel-doc for the ddc field of struct drm_connector
> > - added Reviewed-by in patches 17 and 18
> > - added Acked-by in patch 2
> > - made the ownership of ddc i2c_adapter explicit in all patches,
> > this made the affected patches much simpler
> 
> Looks good now.
> Patch 1 and 2 are:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> The remaining patches are:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> 	Sam
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
