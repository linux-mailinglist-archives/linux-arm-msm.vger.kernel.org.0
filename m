Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1F395F828
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 14:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727744AbfGDMcd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jul 2019 08:32:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53580 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727602AbfGDMcd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jul 2019 08:32:33 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D597C24B;
        Thu,  4 Jul 2019 14:32:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562243552;
        bh=hyNqBrHx03qZNweexbbvyVNGuNrdc6G/wOUnelcohKk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lKijpZ4ho0LfI+wWRhUg90UuEZxjbC5u+oICqyvd9PPLBm9aDB+KtCNHpRJQs9t6N
         ggC5T1EqBan1sA/qIp2Dr6BUaHQokn3K7cwnEigd8TxqbWUOTpciKoubt56FG0rglN
         3c+zDvNd39dQUe4BZ5ygIThqv4roFzLMHh3b93wo=
Date:   Thu, 4 Jul 2019 15:32:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/bridge: ti-sn65dsi86: add link to datasheet
Message-ID: <20190704123211.GF6569@pendragon.ideasonboard.com>
References: <20190702154419.20812-1-robdclark@gmail.com>
 <20190702154419.20812-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190702154419.20812-2-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

Thank you for the patch.

On Tue, Jul 02, 2019 at 08:44:16AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The bridge has pretty good docs, lets add a link to make them easier to
> find.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index bcca9173c72a..f1a2493b86d9 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + * datasheet: http://www.ti.com/lit/ds/symlink/sn65dsi86.pdf

It's in the DT bindings and it's easy to find so I'm not sure it adds
lots of value to mention it here, but I don't feel very strongly about
it, so if you think it can be useful I don't mind. I would however put a
blank line after the copyright line in that case, and
s/datasheet/Datasheet/

>   */
>  
>  #include <linux/clk.h>

-- 
Regards,

Laurent Pinchart
