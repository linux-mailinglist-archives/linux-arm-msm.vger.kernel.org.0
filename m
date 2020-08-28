Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDDFB255C91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 16:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgH1Od1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 10:33:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42314 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgH1Od1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 10:33:27 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83DF5303;
        Fri, 28 Aug 2020 16:33:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598625203;
        bh=V2KbZ+khCwU5DRL1qS3xAAINuAFQarAWgsYTYr8jl9M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=horyy3iD5C7yeDn9i1x2mP8fGfEt33e8c/3V7SjnPIjNAT7KmYK8RDit4ldRD5EGy
         ziktUeL4Jt7vm01o190Hc6d4y5xouxDC4qcFNZ35aWhmumbjURAmrconyCiiONaOow
         N0LIUqPDNq6HVgn4UFxjpU9jksTsspYPeRZtbBzU=
Date:   Fri, 28 Aug 2020 17:33:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH v1 2/2] drm: bridge: add support for lontium LT9611UXC
 bridge
Message-ID: <20200828143300.GA6310@pendragon.ideasonboard.com>
References: <20200828120431.1636402-1-dmitry.baryshkov@linaro.org>
 <20200828120431.1636402-3-dmitry.baryshkov@linaro.org>
 <20200828141848.GX2639@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200828141848.GX2639@vkoul-mobl>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 28, 2020 at 07:48:48PM +0530, Vinod Koul wrote:
> On 28-08-20, 15:04, Dmitry Baryshkov wrote:
> 
> > +#define EDID_BLOCK_SIZE	128
> > +#define EDID_NUM_BLOCKS 2
> 
> tab or space either one, not both ;)
> 
> > +static struct mipi_dsi_device *lt9611uxc_attach_dsi(struct lt9611uxc *lt9611uxc,
> > +						 struct device_node *dsi_node)
> 
> Please align this with open parenthesis of preceding line (checkpatch
> with --strict option will check this)
> 
> > +static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
> > +				enum drm_bridge_attach_flags flags)
> > +{
> > +	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
> > +	int ret;
> > +
> > +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > +		dev_err(lt9611uxc->dev, "Fix bridge driver to make connector optional!");
> 
> Can we support both modes as I have done in lt9611, that way once the
> conversion is done we can drop the init part and support conversion.

I was going to mention that :-) New drivers should support the
DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.

> I have patch for msm driver to set DRM_BRIDGE_ATTACH_NO_CONNECTOR, you
> can use that to test
> 
> > +static int lt9611uxc_hdmi_hw_params(struct device *dev, void *data,
> > +				 struct hdmi_codec_daifmt *fmt,
> > +				 struct hdmi_codec_params *hparms)
> > +{
> > +	/*
> > +	 * LT9611UXC will automatically detect rate and sample size, so no need
> > +	 * to setup anything here.
> > +	 */
> > +	return 0;
> > +}
> 
> Do we need dummy function?

-- 
Regards,

Laurent Pinchart
