Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85C2E35FF9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 03:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbhDOBbU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 21:31:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39934 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbhDOBbT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 21:31:19 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2009C51E;
        Thu, 15 Apr 2021 03:30:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618450256;
        bh=EZIFa8zmYfQaeGAmxib5xuU9akWCJGo2jrN3oYBFs+8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DWs6kVZ7ZZ3ThgWZVlMdzL+nD5e6NDG5oyq+HwlqR5WIyOsXoQLhRUyrj+70XCtSo
         20evL/nSJG1npQ9wexaNwFWvki6qkrOCuX1AI6IbxSEaTqSDNSrCYi8SWZZP2p+n/k
         vkjehNJRnxeoy1BZ04as2bGkjWK4CD/Q+4dpQ8/U=
Date:   Thu, 15 Apr 2021 04:30:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 12/12] drm/panel: panel-simple: Use runtime pm to
 avoid excessive unprepare / prepare
Message-ID: <YHeXTsGkDCAToqwP@pendragon.ideasonboard.com>
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.12.I9e8bd33b49c496745bfac58ea9ab418bd3b6f5ce@changeid>
 <YHePsQgqOau1V5lD@pendragon.ideasonboard.com>
 <CAD=FV=X=XixXONS9D4CRxku4VuKa2pYniSjzSoX_NXkDW-J15g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=X=XixXONS9D4CRxku4VuKa2pYniSjzSoX_NXkDW-J15g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

On Wed, Apr 14, 2021 at 06:22:57PM -0700, Doug Anderson wrote:
> On Wed, Apr 14, 2021 at 5:58 PM Laurent Pinchart wrote:
> > On Fri, Apr 02, 2021 at 03:28:46PM -0700, Douglas Anderson wrote:
> > > Unpreparing and re-preparing a panel can be a really heavy
> > > operation. Panels datasheets often specify something on the order of
> > > 500ms as the delay you should insert after turning off the panel
> > > before turning it on again. In addition, turning on a panel can have
> > > delays on the order of 100ms - 200ms before the panel will assert HPD
> > > (AKA "panel ready"). The above means that we should avoid turning a
> > > panel off if we're going to turn it on again shortly.
> > >
> > > The above becomes a problem when we want to read the EDID of a
> > > panel. The way that ordering works is that userspace wants to read the
> > > EDID of the panel _before_ fully enabling it so that it can set the
> > > initial mode correctly. However, we can't read the EDID until we power
> > > it up. This leads to code that does this dance (like
> > > ps8640_bridge_get_edid()):
> > >
> > > 1. When userspace requests EDID / the panel modes (through an ioctl),
> > >    we power on the panel just enough to read the EDID and then power
> > >    it off.
> > > 2. Userspace then turns the panel on.
> > >
> > > There's likely not much time between step #1 and #2 and so we want to
> > > avoid powering the panel off and on again between those two steps.
> > >
> > > Let's use Runtime PM to help us. We'll move the existing prepare() and
> > > unprepare() to be runtime resume() and runtime suspend(). Now when we
> > > want to prepare() or unprepare() we just increment or decrement the
> > > refcount. We'll default to a 1 second autosuspend delay which seems
> > > sane given the typical delays we see for panels.
> > >
> > > A few notes:
> > > - It seems the existing unprepare() and prepare() are defined to be
> > >   no-ops if called extra times. We'll preserve that behavior.
> >
> > The prepare and unprepare calls are supposed to be balanced, which
> > should allow us to drop this check. Do you have a reason to suspect that
> > it may not be the case ?
> 
> No, it was just code inspection. The old code definitely made an
> effort to make enable of an already enabled panel a no-op and disable
> of an already disabled panel a no-op. This is even before my
> (somewhat) recent patch to make things timing based, though I did
> touch the code.
> 
> Can I maybe suggest that getting rid of the extra check should be a
> separate patch after this one? Then if it breaks someone it's easy to
> just revert that one and we can still keep the runtime pm?

Sounds good to me.

> > > - This is a slight change in the ABI of simple panel. If something was
> > >   absolutely relying on the unprepare() to happen instantly that
> > >   simply won't be the case anymore. I'm not aware of anyone relying on
> > >   that behavior, but if there is someone then we'll need to figure out
> > >   how to enable (or disable) this new delayed behavior selectively.
> > > - In order for this to work we now have a hard dependency on
> > >   "PM". From memory this is a legit thing to assume these days and we
> > >   don't have to find some fallback to keep working if someone wants to
> > >   build their system without "PM".
> >
> > Sounds fine to me.
> >
> > The code looks good to me. Possibly with the prepared check removed,
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
