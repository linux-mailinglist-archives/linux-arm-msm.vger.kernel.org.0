Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 955BC22990D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 15:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731717AbgGVNOi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 09:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgGVNOi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 09:14:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D06C0619DC;
        Wed, 22 Jul 2020 06:14:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F279329;
        Wed, 22 Jul 2020 15:14:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595423676;
        bh=Yy1kPitq1p4+UT+TJhQ9MFHfEcOUO4nuS8woENFDtKE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iUx5z42nUo41McjzpXcpPYK3kDiTO0mS1R0i5jJXLLU3o3kpDsQg+ihnlOuKkDYxX
         sfXX1nV021EDZeAuXNHMdFQKl2tey7qXoTUZT4lGFnkv5g5LDVx2Vko187/pg+yYdP
         OhB1hAttWuHlUPXd0sIziaSJsIWioKxfeEu5GqWo=
Date:   Wed, 22 Jul 2020 16:14:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
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
Message-ID: <20200722131430.GJ5833@pendragon.ideasonboard.com>
References: <20200708103559.132300-1-vkoul@kernel.org>
 <20200708103559.132300-4-vkoul@kernel.org>
 <20200719171806.GA55541@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200719171806.GA55541@ravnborg.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

On Sun, Jul 19, 2020 at 07:18:06PM +0200, Sam Ravnborg wrote:
> Hi Vinod.
> 
> Three trivial points below.
> The rest looks good.
> 
> With these fixed you can add:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> 	Sam
> 
> On Wed, Jul 08, 2020 at 04:05:58PM +0530, Vinod Koul wrote:
> > Lontium Lt9611 is a DSI to HDMI bridge which supports two DSI ports and
> > I2S port as an input and HDMI port as output
> > 
> > Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Tested-by: John Stultz <john.stultz@linaro.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/gpu/drm/bridge/Kconfig          |   13 +
> >  drivers/gpu/drm/bridge/Makefile         |    1 +
> >  drivers/gpu/drm/bridge/lontium-lt9611.c | 1142 +++++++++++++++++++++++
> >  3 files changed, 1156 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/lontium-lt9611.c
> > 
> > +
> > +#include <drm/drm_probe_helper.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_print.h>
> 
> In alphabetical order. drm_probe_helper needs to be moved.
> 
> > +
> > +#define EDID_SEG_SIZE	256
> > +#define EDID_LEN	32
> > +#define EDID_LOOP	8
> > +#define KEY_DDC_ACCS_DONE 0x02
> > +#define DDC_NO_ACK	0x50
> > +
> 
> > +static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode)
> > +{
> > +	const struct reg_sequence reg_cfg[] = {
> > +		{ 0x830b, 0x01 },
> > +		{ 0x830c, 0x10 },
> > +		{ 0x8348, 0x00 },
> > +		{ 0x8349, 0x81 },
> > +
> > +		/* stage 1 */
> > +		{ 0x8321, 0x4a },
> > +		{ 0x8324, 0x71 },
> > +		{ 0x8325, 0x30 },
> > +		{ 0x832a, 0x01 },
> > +
> > +		/* stage 2 */
> > +		{ 0x834a, 0x40 },
> > +		{ 0x831d, 0x10 },
> > +
> > +		/* MK limit */
> > +		{ 0x832d, 0x38 },
> > +		{ 0x8331, 0x08 },
> > +	};
> > +	const struct reg_sequence reg_cfg2[] = {
> > +			{ 0x830b, 0x03 },
> > +			{ 0x830c, 0xd0 },
> > +			{ 0x8348, 0x03 },
> > +			{ 0x8349, 0xe0 },
> > +			{ 0x8324, 0x72 },
> > +			{ 0x8325, 0x00 },
> > +			{ 0x832a, 0x01 },
> > +			{ 0x834a, 0x10 },
> > +			{ 0x831d, 0x10 },
> > +			{ 0x8326, 0x37 },
> 
> Block above is indented one tab too much.
> 
> > +static int lt9611_bridge_attach(struct drm_bridge *bridge,
> > +				enum drm_bridge_attach_flags flags)
> > +{
> > +	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> > +	int ret;
> > +
> > +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > +		dev_err(lt9611->dev, "Fix bridge driver to make connector optional!");
> > +		return -EINVAL;
> > +	}
>
> This should say that the display driver should be fixed.
> If a display driver expects this bridge to create the connector
> it would not work.

Actually, for new bridge drivers, connector creation should be optional
from the start. We don't want a failure in that case, the feature should
be implemented.

-- 
Regards,

Laurent Pinchart
