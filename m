Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC7F51D875B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 20:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728490AbgERSfh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 14:35:37 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:45022 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728475AbgERSfg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 14:35:36 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id AA4F58064D;
        Mon, 18 May 2020 20:35:33 +0200 (CEST)
Date:   Mon, 18 May 2020 20:35:32 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Sandeep Panda <spanda@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sean Paul <seanpaul@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix off-by-one error in clock
 choice
Message-ID: <20200518183532.GB862982@ravnborg.org>
References: <20200504213225.1.I21646c7c37ff63f52ae6cdccc9bc829fbc3d9424@changeid>
 <CAF6AEGs0qpzgGW8rYdmFqKW=QBbRxxzCWjO0LXsbm6hA0AJNyQ@mail.gmail.com>
 <CAD=FV=WQ2HtnWFyhachm9QyhkXVhMzRoiR=rWbmukmVYciL3Gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=WQ2HtnWFyhachm9QyhkXVhMzRoiR=rWbmukmVYciL3Gw@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=cm27Pg_UAAAA:8
        a=olxtUhg5vEcEZ2unwIUA:9 a=CjuIK1q_8ugA:10 a=xmb-EsYY8bH0VWELuYED:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Douglas.

On Mon, May 18, 2020 at 11:23:44AM -0700, Doug Anderson wrote:
> Sam,
> 
> On Fri, May 15, 2020 at 2:49 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Mon, May 4, 2020 at 9:32 PM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > If the rate in our table is _equal_ to the rate we want then it's OK
> > > to pick it.  It doesn't need to be greater than the one we want.
> > >
> > > Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > Reviewed-by: Rob Clark <robdclark@gmail.com>
> 
> ...and I think this is the last of the patches I stupidly didn't CC
> you on that's ready to go.

I'm not a bridge maintainer so mostly I am just overstepping
what I in reality have authority to do.
But so far no loud complains...

	Sam
