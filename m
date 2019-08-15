Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B01808F73C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2019 00:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733242AbfHOWvI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Aug 2019 18:51:08 -0400
Received: from onstation.org ([52.200.56.107]:49700 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730406AbfHOWvH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Aug 2019 18:51:07 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id D89F23E998;
        Thu, 15 Aug 2019 22:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1565909466;
        bh=GlErRnlbnhtp3xOCD8QDuEBNzdpIzm/CEjl/t+YePi4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kbBRmB2Ag3E2vXFKqyIe3P3JBKnDCf2Gw4yfO4jcxecQTEdBlDWG3wDJ+vxPQ+XQN
         a1BNwFsIm8w50ApVariWEfK20tN4ggz3LwN3Ya5I93TAxtpu1h1nThdsONxNN6uX7o
         QkSapavjafeT34+PmnZN/YYXcO0hocqwBz5MLwfA=
Date:   Thu, 15 Aug 2019 18:51:04 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH RFC 06/11] drm/bridge: analogix-anx78xx: add support for
 avdd33 regulator
Message-ID: <20190815225104.GB32072@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-7-masneyb@onstation.org>
 <CACRpkdYdQa+FVfpSjLi0SsBMDT4QC667z1P1dnapz7PXgRoB5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYdQa+FVfpSjLi0SsBMDT4QC667z1P1dnapz7PXgRoB5Q@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 15, 2019 at 10:22:45AM +0200, Linus Walleij wrote:
> On Thu, Aug 15, 2019 at 2:49 AM Brian Masney <masneyb@onstation.org> wrote:
> 
> > Add support for the avdd33 regulator to the analogix-anx78xx driver.
> > Note that the regulator is currently enabled during driver probe and
> > disabled when the driver is removed. This is currently how the
> > downstream MSM kernel sources do this.
> >
> > Let's not merge this upstream for the mean time until I get the external
> > display fully working on the Nexus 5 and then I can submit proper
> > support then that powers down this regulator in the power off function.
> >
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> 
> > +static void anx78xx_disable_regulator_action(void *_data)
> > +{
> > +       struct anx78xx_platform_data *pdata = _data;
> > +
> > +       regulator_disable(pdata->avdd33);
> > +}
> (...)
> > +       err = devm_add_action(dev, anx78xx_disable_regulator_action,
> > +                             pdata);
> 
> Clever idea. Good for initial support, probably later on it would
> need to be reworked using runtime PM so it's not constantly
> powered up.

Yes, that's my plan. I suspect that I may have a regulator disabled
somewhere so I was planning to leave this on all the time for the time
being to match the downstream behavior until I get the hot plug detect
GPIO working.

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks,

Brian
