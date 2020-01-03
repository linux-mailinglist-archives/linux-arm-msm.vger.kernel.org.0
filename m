Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDB3812FD10
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2020 20:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728514AbgACTbl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 14:31:41 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:59110 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728488AbgACTbl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 14:31:41 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 770C720028;
        Fri,  3 Jan 2020 20:31:36 +0100 (CET)
Date:   Fri, 3 Jan 2020 20:31:35 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/panel: Add support for AUO B116XAK01 panel
Message-ID: <20200103193135.GA21515@ravnborg.org>
References: <20200103183025.569201-1-robdclark@gmail.com>
 <20200103183025.569201-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200103183025.569201-2-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=cm27Pg_UAAAA:8
        a=Z6NHpIEtjzRDsLnzokIA:9 a=CjuIK1q_8ugA:10 a=xmb-EsYY8bH0VWELuYED:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob.

On Fri, Jan 03, 2020 at 10:30:24AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 5d487686d25c..895a25cfc54f 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -680,6 +680,35 @@ static const struct panel_desc auo_b116xw03 = {
>  	},
>  };
>  
> +static const struct drm_display_mode auo_b116xak01_mode = {
> +	.clock = 69300,
> +	.hdisplay = 1366,
> +	.hsync_start = 1366 + 48,
> +	.hsync_end = 1366 + 48 + 32,
> +	.htotal = 1366 + 48 + 32 + 10,
> +	.vdisplay = 768,
> +	.vsync_start = 768 + 4,
> +	.vsync_end = 768 + 4 + 6,
> +	.vtotal = 768 + 4 + 6 + 15,
> +	.vrefresh = 60,
> +	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +};
> +
> +static const struct panel_desc auo_b116xak01 = {
> +	.modes = &auo_b116xak01_mode,
> +	.num_modes = 1,
> +	.bpc = 6,
> +	.size = {
> +		.width = 256,
> +		.height = 144,
> +	},
> +	.delay = {
> +		.hpd_absent_delay = 200,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> +	.connector_type = DRM_MODE_CONNECTOR_eDP,
> +};
Entries in alphabetical order - check.
.connector_type specified - check.
.flags and .bus_format specified - check.
.bus_flags not specified but optional - OK.

> +
>  static const struct drm_display_mode auo_b133xtn01_mode = {
>  	.clock = 69500,
>  	.hdisplay = 1366,
> @@ -3125,6 +3154,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "auo,b133htn01",
>  		.data = &auo_b133htn01,
> +	}, {
> +		.compatible = "auo,b116xa01",
> +		.data = &auo_b116xak01,
This entry most also be in alphabetical order.

>  	}, {
>  		.compatible = "auo,b133xtn01",
>  		.data = &auo_b133xtn01,

Please fix and resend.

I am in general holding back on patches to panel-simple.
I hope we can reach a decision for the way forward with the bindings
files sometimes next week.

	Sam
