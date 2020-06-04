Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 259BC1EDDF8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 09:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgFDHZx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 03:25:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:53562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726802AbgFDHZx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 03:25:53 -0400
Received: from localhost (unknown [122.179.53.240])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BFC192072E;
        Thu,  4 Jun 2020 07:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591255552;
        bh=di37sGDCYHMc3A4Vdisqu1TrAtBl0pQcAk8AXEtxa7U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UODKefC7sdxWAUwSX2MxmkpjPIWOQK0v9A8UKUYTl3YMqqCkYTykmfc+ATMC/rsl8
         AGIx3djZ4Mb7C/QCZ5rmVDj/XYpII1SWtYBHnK2Gx8xdk5FbEAsmlV3qGZmgxWX5tM
         WZ7l2EDnz78yw6PEySGrAkHT9Ctk2iBYH2xdwTBE=
Date:   Thu, 4 Jun 2020 12:55:48 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/bridge: Introduce LT9611 DSI to HDMI bridge
Message-ID: <20200604072548.GE3521@vkoul-mobl>
References: <20200513100533.42996-1-vkoul@kernel.org>
 <20200513100533.42996-4-vkoul@kernel.org>
 <20200528015205.GE4670@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528015205.GE4670@pendragon.ideasonboard.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Laurent,

On 28-05-20, 04:52, Laurent Pinchart wrote:

> > +static int lt9611_bridge_attach(struct drm_bridge *bridge,
> > +				enum drm_bridge_attach_flags flags)
> > +{
> > +	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> > +	int ret;
> > +
> > +	dev_dbg(lt9611->dev, "bridge attach\n");
> 
> 
> Connector creation in bridge drivers is deprecated. Please at least add

Okay what is the right way for connector creation? I can add support for
that.

> support for the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, to make connector
> creation optional. Ideally the !DRM_BRIDGE_ATTACH_NO_CONNECTOR case

will add that

> should not be implemented at all. This will require the display
> controller driver to use DRM_BRIDGE_ATTACH_NO_CONNECTOR. Which display
> controller(s) do you use this driver with ?

I am using with msm display driver, this was tested on dragon-board
db845c board.

Thanks
-- 
~Vinod
