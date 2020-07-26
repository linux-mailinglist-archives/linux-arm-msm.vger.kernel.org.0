Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137F222E04B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jul 2020 17:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgGZPFY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jul 2020 11:05:24 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:47240 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbgGZPFX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jul 2020 11:05:23 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 17F2E20020;
        Sun, 26 Jul 2020 17:05:17 +0200 (CEST)
Date:   Sun, 26 Jul 2020 17:05:15 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Vinod Koul <vkoul@kernel.org>
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
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v6 0/3] Add LT9611 DSI to HDMI bridge
Message-ID: <20200726150515.GA2170375@ravnborg.org>
References: <20200723163442.1280414-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723163442.1280414-1-vkoul@kernel.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=zpOVymEVAAAA:8 a=e5mUnYsNAAAA:8
        a=jmOTV2X5wWLMYQ6YnoIA:9 a=CjuIK1q_8ugA:10 a=LCD48ZUe64JR9pieE8wa:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vinod.

On Thu, Jul 23, 2020 at 10:04:39PM +0530, Vinod Koul wrote:
> Hi,
> 
> This series adds driver and bindings for Lontium LT9611 bridge chip which
> takes MIPI DSI as input and HDMI as output.
> 
> This chip can be found in 96boards RB3 platform [1] commonly called DB845c.
> 
> [1]: https://www.96boards.org/product/rb3-platform/
> 
> Changes in v6:
>  - Drop msm/dsi patch as we need to get more bridges fixed before we add that
>  - Bring back support for DRM_BRIDGE_ATTACH_NO_CONNECTOR not set, now driver
> 	supports both
>  - Fix nits found by Sam
> 
> Changes in v5:
>  - make symbol static, reported by kbuild-bot
> 
> Changes in v4:
>  - Add msm/dsi patch to create connector and support DRM_BRIDGE_ATTACH_NO_CONNECTOR
>  - Fix comments provided by Sam
> 
> Changes in v3:
>  - fix kbuild reported error
>  - rebase on v5.8-rc1
> 
> Changes in v2:
>  - Add acks by Rob
>  - Fix comments reported by Emil and rename the file to lontium-lt9611.c
>  - Fix comments reported by Laurent on binding and driver
>  - Add HDMI audio support
> 
> Vinod Koul (3):
>   dt-bindings: vendor-prefixes: Add Lontium vendor prefix
>   dt-bindings: display: bridge: Add documentation for LT9611
>   drm/bridge: Introduce LT9611 DSI to HDMI bridge

Fixed prototype for lt9611_bridge_mode_valid() and applied the
series to drm-misc-next.

	Sam

> 
>  .../display/bridge/lontium,lt9611.yaml        |  176 +++
>  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
>  drivers/gpu/drm/bridge/Kconfig                |   13 +
>  drivers/gpu/drm/bridge/Makefile               |    1 +
>  drivers/gpu/drm/bridge/lontium-lt9611.c       | 1229 +++++++++++++++++
>  5 files changed, 1421 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
>  create mode 100644 drivers/gpu/drm/bridge/lontium-lt9611.c
> 
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
