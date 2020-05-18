Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEBC11D876C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 20:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728761AbgERSmk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 14:42:40 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:45612 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728514AbgERSmk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 14:42:40 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 8E39480642;
        Mon, 18 May 2020 20:42:36 +0200 (CEST)
Date:   Mon, 18 May 2020 20:42:35 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sean Paul <seanpaul@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: ti-sn65dsi86: Implement lane
 reordering + polarity
Message-ID: <20200518184235.GD862982@ravnborg.org>
References: <20200506140208.v2.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
 <CAF6AEGvXkeOrHGMHo=C1zXhDc9rquQJc8oGDB4VDfhTfdtqyTg@mail.gmail.com>
 <CAD=FV=V9Aphv=sV36CcK=ka2zNh7Hwiog4qiUEC7wpgjqYSi5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=V9Aphv=sV36CcK=ka2zNh7Hwiog4qiUEC7wpgjqYSi5Q@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=cm27Pg_UAAAA:8
        a=gaDAzqFsDMoa8Jq105UA:9 a=CjuIK1q_8ugA:10 a=xmb-EsYY8bH0VWELuYED:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Douglas.

On Mon, May 18, 2020 at 11:22:22AM -0700, Doug Anderson wrote:
> Sam,
> 
> On Fri, May 15, 2020 at 2:43 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Wed, May 6, 2020 at 2:03 PM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > The ti-sn65dsi86 MIPI DSI to eDP bridge chip supports arbitrary
> > > remapping of eDP lanes and also polarity inversion.  Both of these
> > > features have been described in the device tree bindings for the
> > > device since the beginning but were never implemented in the driver.
> > > Implement both of them.
> > >
> > > Part of this change also allows you to (via the same device tree
> > > bindings) specify to use fewer than the max number of DP lanes that
> > > the panel reports.  This could be useful if your display supports more
> > > lanes but only a few are hooked up on your board.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >
> > Reviewed-by: Rob Clark <robdclark@gmail.com>
> 
> I guess get_maintainer is somehow not tagging you and I haven't got it
> through my thick skull to CC you each time.  If you're willing, I
> think this patch is ready too.  Happy to re-post it with you in the To
> list if it helps.

I have long lost the original patch, so shall I apply then please
re-send.

	Sam
