Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAED7BE80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 12:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbfGaKkU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 06:40:20 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:54500 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbfGaKkU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 06:40:20 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id E4FE120020;
        Wed, 31 Jul 2019 12:40:08 +0200 (CEST)
Date:   Wed, 31 Jul 2019 12:40:07 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        David Airlie <airlied@linux.ie>,
        Liviu Dudau <liviu.dudau@arm.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
        linux-samsung-soc@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
        Kukjin Kim <kgene@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Dave Airlie <airlied@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        linux-mediatek@lists.infradead.org,
        Maxime Ripard <mripard@kernel.org>,
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
Subject: Re: Review required [Was: Associate ddc adapters with connectors]
Message-ID: <20190731104007.GA23138@ravnborg.org>
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <20190726183520.GA22572@ravnborg.org>
 <20190726185538.GD14981@ravnborg.org>
 <6560f93c-a48f-2a8c-afeb-d5e8e200480d@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6560f93c-a48f-2a8c-afeb-d5e8e200480d@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=MKLiDCnLOtWFweQeVuoA:9 a=CjuIK1q_8ugA:10
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Neil.

On Wed, Jul 31, 2019 at 10:00:14AM +0200, Neil Armstrong wrote:
> Hi Sam,
> 
> On 26/07/2019 20:55, Sam Ravnborg wrote:
> > Hi all.
> > 
> > Andrzej have done a good job following up on feedback and this series is
> > now ready.
> > 
> > We need ack on the patches touching the individual drivers before we can
> > proceed.
> > Please check your drivers and get back.
> 
> I can apply all core and maintainer-acked patches for now :
> 1, 2, 7, 10, 11, 16, 17, 18, 19, 20, 21, 22, 23
> 
> and Andrzej can resend not applied patches with Yours and Emil's Reviewed-by,
> so we can wait a few more days to apply them.

Sounds like a good plan.
Thanks for thaking care of this.

	Sam
