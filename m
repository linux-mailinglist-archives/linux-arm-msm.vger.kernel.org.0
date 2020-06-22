Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82CA6203055
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 09:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731334AbgFVHJj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 03:09:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:48702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726850AbgFVHJj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 03:09:39 -0400
Received: from localhost (unknown [171.61.66.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A54F25440;
        Mon, 22 Jun 2020 07:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592809778;
        bh=oQfZYFEK5TzA58baDfjiFR4quEk2JmrbUpxr4Y4OY1k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=obWIgoG2HbCErNH6CrWpyWHVaLgzv5zgbpsfOH3hgbjA+565FWwDlEoYCjC9nSFA9
         pbGbOncwMUBZZMefktQmKx5Ne9W1PweltyIuiadv9bE2zKOzi+3D3VhjL9B52+b0v6
         aUQk7bKDsaHi0h+KGL7BJiwxi7c14Zd7LpaLOdE0=
Date:   Mon, 22 Jun 2020 12:39:34 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>, devicetree@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 3/3] drm/bridge: Introduce LT9611 DSI to HDMI bridge
Message-ID: <20200622070934.GG2324254@vkoul-mobl>
References: <20200617105950.3165360-1-vkoul@kernel.org>
 <20200617105950.3165360-4-vkoul@kernel.org>
 <20200620180516.GA27870@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200620180516.GA27870@ravnborg.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Sam,

On 20-06-20, 20:05, Sam Ravnborg wrote:
> Hi Vinod.
> 
> Looks good but some some of small nits.

Great :)

> And a few larger things in the following.
> The larger things is releated to prepare the bridge driver to live in a
> world with chained bridges.

Sure, so that entails adding the callbacks specified below right or is
there anything else required to do?

> > +#include <linux/gpio/consumer.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/module.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <sound/hdmi-codec.h>
> > +#include <drm/drm_probe_helper.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_print.h>
> Please add empty lines between each group of includes.
> They are already sorted within each group and in preferred order - good.

Okay if that is the preference, sure

> > +static int lt9611_mipi_input_analog(struct lt9611 *lt9611)
> > +{
> > +	const struct reg_sequence reg_cfg[] = {
> > +		{ 0x8106, 0x40 }, /*port A rx current*/
> > +		{ 0x810a, 0xfe }, /*port A ldo voltage set*/
> > +		{ 0x810b, 0xbf }, /*enable port A lprx*/
> > +		{ 0x8111, 0x40 }, /*port B rx current*/
> > +		{ 0x8115, 0xfe }, /*port B ldo voltage set*/
> > +		{ 0x8116, 0xbf }, /*enable port B lprx*/
> > +
> > +		{ 0x811c, 0x03 }, /*PortA clk lane no-LP mode*/
> > +		{ 0x8120, 0x03 }, /*PortB clk lane with-LP mode*/
> Add space after "/*" and before closing "*/".
> Like is done a few lines up in lt9611_modes[]

Oops seems to have missed these, will fix this and others if any

> > +static int lt9611_mipi_input_digital(struct lt9611 *lt9611,
> > +				     const struct drm_display_mode *mode)
> > +{
> > +	struct reg_sequence reg_cfg[] = {
> > +		{ 0x8300, LT9611_4LANES },
> > +		{ 0x830a, 0x00 },
> > +		{ 0x824f, 0x80 },
> > +		{ 0x8250, 0x10 },
> > +		{ 0x8302, 0x0a },
> > +		{ 0x8306, 0x0a },
> > +	};
> > +
> > +	if (mode->hdisplay == 3840)
> > +		reg_cfg[1].def = 0x03;
> Please check if some of these constants be replaced by something readable
> from the datasheet.
> Same goes for other places where constants are used.

The problem is that the datasheet I have doesn't define register names.
Worse some of them are not even documented. I did give it a shot to
define these, but gave up half way due to lack on inventive names :(

I would like to keep the registers and replace them in future if we get
a good spec from vendor.. or i can define REG_1...REG_N!

> > +static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
> > +				    const struct drm_display_mode *mode)
> > +{
> > +	u32 h_total, h_act, hpw, hfp, hss;
> > +	u32 v_total, v_act, vpw, vfp, vss;
> > +
> > +	h_total = mode->htotal;
> > +	v_total = mode->vtotal;
> > +
> > +	h_act = mode->hdisplay;
> > +	hpw = mode->hsync_end - mode->hsync_start;
> > +	hfp = mode->hsync_start - mode->hdisplay;
> > +	hss = (mode->hsync_end - mode->hsync_start) +
> > +	      (mode->htotal - mode->hsync_end);
> > +
> > +	v_act = mode->vdisplay;
> > +	vpw = mode->vsync_end - mode->vsync_start;
> > +	vfp = mode->vsync_start - mode->vdisplay;
> > +	vss = (mode->vsync_end - mode->vsync_start) +
> > +	      (mode->vtotal - mode->vsync_end);
> Using the names from display_timings would make this easier to recognize
> for the reader.
> Examples:
> vfp versus vfront_porch
> vss versus vsync_len
> 
> I do not say the names from display_timing are much better, only that they
> are more recognizeable.

okay will do

> > +static irqreturn_t lt9611_irq_thread_handler(int irq, void *dev_id)
> > +{
> > +	struct lt9611 *lt9611 = dev_id;
> > +	unsigned int irq_flag0 = 0;
> > +	unsigned int irq_flag3 = 0;
> > +
> > +	regmap_read(lt9611->regmap, 0x820f, &irq_flag3);
> > +	regmap_read(lt9611->regmap, 0x820c, &irq_flag0);
> > +
> > +	pr_debug("%s() irq_flag0: %#x irq_flag3: %#x\n",
> > +		 __func__, irq_flag0, irq_flag3);
> debug artifact you can delete now?

Okay, will remove this and rest

> 
> > +
> > +	 /* hpd changed low */
> Drop extra space in indent of this comment and following comments as
> well.

Ok

> > +static int lt9611_bridge_attach(struct drm_bridge *bridge,
> > +				enum drm_bridge_attach_flags flags)
> > +{
> > +	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> > +	int ret;
> > +
> > +	dev_dbg(lt9611->dev, "bridge attach\n");
> > +
> > +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> > +		DRM_ERROR("Fix bridge driver to make connector optional!");
> > +		return -EINVAL;
> > +	}
> Please fix bridge so connector creation is optional.
> for new bridge driver this is mandatory.

Can you elaborate what is means by fixing bridge here, what are the
things that should be done and are expected for new bridge drivers

> > +static const struct drm_bridge_funcs lt9611_bridge_funcs = {
> > +	.attach = lt9611_bridge_attach,
> > +	.detach = lt9611_bridge_detach,
> > +	.mode_valid = lt9611_bridge_mode_valid,
> > +	.enable = lt9611_bridge_enable,
> > +	.disable = lt9611_bridge_disable,
> > +	.post_disable = lt9611_bridge_post_disable,
> > +	.mode_set = lt9611_bridge_mode_set,
> 
> Add relevant bridge functions - .get_edid, .detect looks like
> candidates.
> See other bridge drivers for inspiration.

Any good examples?
-- 
~Vinod
