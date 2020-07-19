Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 370EE2252AE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jul 2020 18:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgGSQDi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jul 2020 12:03:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:36710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbgGSQDh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jul 2020 12:03:37 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 49FFF207EA;
        Sun, 19 Jul 2020 16:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595174617;
        bh=/pbAZENBPjrMYXorA52W5HNHDodFxjYnJsIpzouhsGY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1GP6P1/lo8ECz85mykPgihU5psB+Nx4RgKc1A48vqIllfPQ+RjjRLI2pGnplDzuuA
         FOfsJRDQ6x8Rui1L9osCVzIUHkYkGes37dZADDIys5iTqZEB/4ddZy7mPi5Qg+MARK
         aoK8eMdc1LUCb+sOLlWmy6LXv5MKl/ooRzJ7gUbU=
Date:   Sun, 19 Jul 2020 21:33:32 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 0/4] Add LT9611 DSI to HDMI bridge
Message-ID: <20200719160332.GA12965@vkoul-mobl>
References: <20200708103559.132300-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708103559.132300-1-vkoul@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

On 08-07-20, 16:05, Vinod Koul wrote:
> Hi,
> 
> This series adds driver and bindings for Lontium LT9611 bridge chip which
> takes MIPI DSI as input and HDMI as output.
> 
> This chip can be found in 96boards RB3 platform [1] commonly called DB845c.

Any feedback on this series?

> 
> [1]: https://www.96boards.org/product/rb3-platform/
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
> Vinod Koul (4):
>   dt-bindings: vendor-prefixes: Add Lontium vendor prefix
>   dt-bindings: display: bridge: Add documentation for LT9611
>   drm/bridge: Introduce LT9611 DSI to HDMI bridge
>   drm/msm/dsi: attach external bridge with
>     DRM_BRIDGE_ATTACH_NO_CONNECTOR
> 
>  .../display/bridge/lontium,lt9611.yaml        |  176 +++
>  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
>  drivers/gpu/drm/bridge/Kconfig                |   13 +
>  drivers/gpu/drm/bridge/Makefile               |    1 +
>  drivers/gpu/drm/bridge/lontium-lt9611.c       | 1142 +++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi.c                 |    7 +-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c         |   27 +-
>  7 files changed, 1348 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
>  create mode 100644 drivers/gpu/drm/bridge/lontium-lt9611.c
> 
> -- 
> 2.26.2

-- 
~Vinod
