Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4974138F444
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 22:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbhEXUXz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 16:23:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44826 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232900AbhEXUXy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 16:23:54 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FA5445E;
        Mon, 24 May 2021 22:22:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621887744;
        bh=6/JgaUC+uqJrfLfFJiluCN1zWQh+xIAcm7wr4Ji1UNg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z/lN2rd7M5BPbXhmULtcNwVVHXg43hCshuaP0dAkJ9dEcfS3+3p1DJWn0aIrMqeVZ
         5DmSNfoGIUN1gwwKC+UvYTCjVHjQupIVJGzbHxBQC10ludk8u7sIl1kcNq2+U+kFE4
         /ZHOvvxA1tEvLuzGlms7YHw0UZPiZVDfkxeZSgyA=
Date:   Mon, 24 May 2021 23:22:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, robdclark@chromium.org,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Steev Klimaszewski <steev@kali.org>,
        Thierry Reding <treding@nvidia.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 01/10] drm/panel: panel-simple: Add missing
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <YKwK+lkcHMwAosLn@pendragon.ideasonboard.com>
References: <20210517200907.1459182-1-dianders@chromium.org>
 <20210517130450.v7.1.I9e947183e95c9bd067c9c1d51208ac6a96385139@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210517130450.v7.1.I9e947183e95c9bd067c9c1d51208ac6a96385139@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

Thank you for the patch.

On Mon, May 17, 2021 at 01:08:58PM -0700, Douglas Anderson wrote:
> The PM Runtime docs specifically call out the need to call
> pm_runtime_dont_use_autosuspend() in the remove() callback if
> pm_runtime_use_autosuspend() was called in probe():
> 
> > Drivers in ->remove() callback should undo the runtime PM changes done
> > in ->probe(). Usually this means calling pm_runtime_disable(),
> > pm_runtime_dont_use_autosuspend() etc.

~/src/kernel/linux $ git grep pm_runtime_use_autosuspend -- drivers | wc -l
209
~/src/kernel/linux $ git grep pm_runtime_dont_use_autosuspend -- drivers | wc -l
80

Seems like a lost battle :-(

The fix is right, but I wonder if this shouldn't be handled
automatically by the runtime PM core. The runtime PM API is notoriously
difficult to use correctly.

> We should do this. This fixes a warning splat that I saw when I was
> testing out the panel-simple's remove().
>
> Fixes: 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare / prepare")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Changes in v7:
> - pm_runtime_dont_use_autosuspend() fix new for v7.
> 
>  drivers/gpu/drm/panel/panel-simple.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9be050ab372f..21939d4352cf 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -798,6 +798,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  	return 0;
>  
>  disable_pm_runtime:
> +	pm_runtime_dont_use_autosuspend(dev);
>  	pm_runtime_disable(dev);
>  free_ddc:
>  	if (panel->ddc)
> @@ -814,6 +815,7 @@ static int panel_simple_remove(struct device *dev)
>  	drm_panel_disable(&panel->base);
>  	drm_panel_unprepare(&panel->base);
>  
> +	pm_runtime_dont_use_autosuspend(dev);
>  	pm_runtime_disable(dev);
>  	if (panel->ddc)
>  		put_device(&panel->ddc->dev);

-- 
Regards,

Laurent Pinchart
