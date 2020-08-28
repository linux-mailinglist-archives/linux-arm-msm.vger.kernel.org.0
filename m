Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA9DA255D4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 17:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgH1PFJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 11:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726579AbgH1PFI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 11:05:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 742C2C061264;
        Fri, 28 Aug 2020 08:05:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31207303;
        Fri, 28 Aug 2020 17:05:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598627101;
        bh=0v4eZV8ZAE1A/ChssqWCAp7iG83FRlBL6XKIV9CuTCE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X/lreL1kYD8nPn6hA+N+ICP/iZyI46SPTg43FgLhPO36P64PpQC2daiWKIkOWH/tL
         5AMoIui2lCTsO5urQ3LvEzrsTPRN9t90tdxYarJF+ev7zrnEi2xZ4xLNh5Rvizl5r7
         8baKVovt4I2c4Hf73e6nej8gQCR8OMmsS7mSeMCI=
Date:   Fri, 28 Aug 2020 18:04:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v1 2/2] drm: bridge: add support for lontium LT9611UXC
 bridge
Message-ID: <20200828150440.GA10034@pendragon.ideasonboard.com>
References: <20200828120431.1636402-1-dmitry.baryshkov@linaro.org>
 <20200828120431.1636402-3-dmitry.baryshkov@linaro.org>
 <20200828141848.GX2639@vkoul-mobl>
 <20200828143300.GA6310@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200828143300.GA6310@pendragon.ideasonboard.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 28, 2020 at 05:33:00PM +0300, Laurent Pinchart wrote:
> On Fri, Aug 28, 2020 at 07:48:48PM +0530, Vinod Koul wrote:
> > On 28-08-20, 15:04, Dmitry Baryshkov wrote:
> > 
> > > +#define EDID_BLOCK_SIZE	128
> > > +#define EDID_NUM_BLOCKS 2
> > 
> > tab or space either one, not both ;)
> > 
> > > +static struct mipi_dsi_device *lt9611uxc_attach_dsi(struct lt9611uxc *lt9611uxc,
> > > +						 struct device_node *dsi_node)
> > 
> > Please align this with open parenthesis of preceding line (checkpatch
> > with --strict option will check this)
> > 
> > > +static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
> > > +				enum drm_bridge_attach_flags flags)
> > > +{
> > > +	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
> > > +	int ret;
> > > +
> > > +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > > +		dev_err(lt9611uxc->dev, "Fix bridge driver to make connector optional!");
> > 
> > Can we support both modes as I have done in lt9611, that way once the
> > conversion is done we can drop the init part and support conversion.
> 
> I was going to mention that :-) New drivers should support the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.

Please ignore this comment, I just realized that the driver supports
DRM_BRIDGE_ATTACH_NO_CONNECTOR, it's the !DRM_BRIDGE_ATTACH_NO_CONNECTOR
case that is not supported, and that's totally fine.

> > I have patch for msm driver to set DRM_BRIDGE_ATTACH_NO_CONNECTOR, you
> > can use that to test
> > 
> > > +static int lt9611uxc_hdmi_hw_params(struct device *dev, void *data,
> > > +				 struct hdmi_codec_daifmt *fmt,
> > > +				 struct hdmi_codec_params *hparms)
> > > +{
> > > +	/*
> > > +	 * LT9611UXC will automatically detect rate and sample size, so no need
> > > +	 * to setup anything here.
> > > +	 */
> > > +	return 0;
> > > +}
> > 
> > Do we need dummy function?

-- 
Regards,

Laurent Pinchart
