Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D9C33C25D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 17:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232228AbhCOQmK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 12:42:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38342 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234587AbhCOQmI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 12:42:08 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03A2F316;
        Mon, 15 Mar 2021 17:42:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615826527;
        bh=meXW2nUOk1RhrSoua6G9ceJqPGOfpSiHqaAKI/AhfkY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Oicu7Ws0tGr32dBM25amrfw3RQnN4L1Un074PDc4TwcfPIytxaUZYATbMN8/+borr
         UlDf9fDDiLQhM7K0RDO+YoG6jU5/f83kqULjHX1dziNEsBLJ4H3nZbbVi6lRModJs5
         DfGB9WgmcW/PxEXRS5YiQ0Wnkx9NwXUIMsWnVU9k=
Date:   Mon, 15 Mar 2021 18:41:31 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/bridge: ti-sn65dsi86: Move code in prep for EDID
 read fix
Message-ID: <YE+OO0m8iW8oS3cq@pendragon.ideasonboard.com>
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
 <20210304155144.2.Id492ddb6e2cdd05eb94474b93654b04b270c9bbe@changeid>
 <YE0qyYedS0NilsCy@pendragon.ideasonboard.com>
 <CAD=FV=X_HAdNkvZ7NGKDH9KapRRLgOfN23OZyy3VyaX+ywjRkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=X_HAdNkvZ7NGKDH9KapRRLgOfN23OZyy3VyaX+ywjRkQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

On Mon, Mar 15, 2021 at 09:31:41AM -0700, Doug Anderson wrote:
> On Sat, Mar 13, 2021 at 1:13 PM Laurent Pinchart wrote:
> > On Thu, Mar 04, 2021 at 03:52:00PM -0800, Douglas Anderson wrote:
> > > This patch is _only_ code motion to prepare for the patch
> > > ("drm/bridge: ti-sn65dsi86: Properly get the EDID, but only if
> > > refclk") and make it easier to understand.
> >
> > s/make/makes/
> 
> I was never an expert at grammar, but I think either "make" or "makes"
> are fine. Simple version with parenthesis:
> 
> Mine:
> 
> This patch is <blah> to (prepare for the patch <blah>) and (make it
> easier to understand).
> 
> Yours:
> 
> This patch is <blah> (to prepare for the patch <blah>) and (makes it
> easier to understand).
> 
> I suppose also valid would be:
> 
> This patch is <blah> (to prepare for the patch <blah>) and (to make it
> easier to understand).

Your absolutely right. Both versions are fine, and your preferred
version is best :-)

> In any case if/when I spin this patch I'm fine changing it to your
> version just because (as I understand) it's equally valid and maybe
> looks slightly better?
> 
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks for the reviews!

-- 
Regards,

Laurent Pinchart
