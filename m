Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8806D1CC448
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2020 22:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbgEIUAa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 May 2020 16:00:30 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:59920 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727938AbgEIUA3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 May 2020 16:00:29 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id C19D880503;
        Sat,  9 May 2020 22:00:23 +0200 (CEST)
Date:   Sat, 9 May 2020 22:00:22 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>, robdclark@chromium.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] panel: simple: Fix size and bpp of BOE NV133FHM-N61
Message-ID: <20200509200021.GA30802@ravnborg.org>
References: <20200508155859.1.I4d29651c0837b4095fb4951253f44036a371732f@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508155859.1.I4d29651c0837b4095fb4951253f44036a371732f@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=cm27Pg_UAAAA:8 a=OPD-m460KaBGQt86si8A:9
        a=CjuIK1q_8ugA:10 a=xmb-EsYY8bH0VWELuYED:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Douglas

On Fri, May 08, 2020 at 03:59:00PM -0700, Douglas Anderson wrote:
> The BOE NV133FHM-N61 is documented in the original commit to be a
> 13.3" panel, but the size listed in our struct doesn't match.
> Specifically:
> 
>   math.sqrt(30.0 * 30.0 + 18.7 * 18.7) / 2.54 ==> 13.92
> 
> Searching around on the Internet shows that the size that was in the
> structure was the "Outline Size", not the "Display Area".  Let's fix
> it.
> 
> Also the Internet says that this panel supports 262K colors.  That's
> 6bpp, not 8bpp.
> 
> Fixes: b0c664cc80e8 ("panel: simple: Add BOE NV133FHM-N61")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Added to drm-misc-next as I did not think this had to be updated in
mainline right now. Let me know if you expect it to land in mainline
soonish.

	Sam

> ---
> 
>  drivers/gpu/drm/panel/panel-simple.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index d6c29543e510..7219436499f1 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1189,10 +1189,10 @@ static const struct drm_display_mode boe_nv133fhm_n61_modes = {
>  static const struct panel_desc boe_nv133fhm_n61 = {
>  	.modes = &boe_nv133fhm_n61_modes,
>  	.num_modes = 1,
> -	.bpc = 8,
> +	.bpc = 6,
>  	.size = {
> -		.width = 300,
> -		.height = 187,
> +		.width = 294,
> +		.height = 165,
>  	},
>  	.delay = {
>  		.hpd_absent_delay = 200,
> -- 
> 2.26.2.645.ge9eca65c58-goog
