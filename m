Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 043DE22BCDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 06:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbgGXEXP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 00:23:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:55226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725813AbgGXEXO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 00:23:14 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 73064206F0;
        Fri, 24 Jul 2020 04:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595564594;
        bh=2WuwIVE5Ma8uYd0/j2K8hRNlXchKIt6B5I4noQ3fduw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WtCOrX4j9CUIcxsBJrltIWdodpQW29uZLDYO7x4qdv6kCIjJhqzfTA3LLmwRygD4p
         +O7RKoC+f+QyHCDsaLAbl+gv/fBPQqbSSCN0y/ZW1sCvUQapqJHspeJ+hRNfTxGg4v
         vckVhbdaBgTPjv9N6jEPn69FKVcd4RLIGBISOwo0=
Date:   Fri, 24 Jul 2020 09:53:10 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bogdan Togorean <bogdan.togorean@analog.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Rob Clark <robdclark@chromium.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: bridge: adv7511: Add missing bridge type
Message-ID: <20200724042310.GF12965@vkoul-mobl>
References: <20200723104523.1006706-1-vkoul@kernel.org>
 <20200724013024.GL21353@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724013024.GL21353@pendragon.ideasonboard.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24-07-20, 04:30, Laurent Pinchart wrote:
> Hi Vinod,
> 
> Thank you for the patch.
> 
> On Thu, Jul 23, 2020 at 04:15:23PM +0530, Vinod Koul wrote:
> > Add bridge type as DRM_MODE_CONNECTOR_HDMIA
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> This has already been submitted: https://lore.kernel.org/dri-devel/20200720124228.12552-1-laurentiu.palcu@oss.nxp.com/

OKay lets drop this one then

-- 
~Vinod
