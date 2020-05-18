Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 110C81D8311
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 20:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732436AbgERSBx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 14:01:53 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:41594 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732303AbgERSBw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 14:01:52 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 6821980501;
        Mon, 18 May 2020 20:01:49 +0200 (CEST)
Date:   Mon, 18 May 2020 20:01:48 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Sandeep Panda <spanda@codeaurora.org>, seanpaul@chromium.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Clear old error bits before
 AUX transfers
Message-ID: <20200518180148.GB770425@ravnborg.org>
References: <20200508163314.1.Idfa69d5d3fc9623083c0ff78572fea87dccb199c@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508163314.1.Idfa69d5d3fc9623083c0ff78572fea87dccb199c@changeid>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=cm27Pg_UAAAA:8 a=e5mUnYsNAAAA:8
        a=lGb0x8MMmitNw6wfqhgA:9 a=CjuIK1q_8ugA:10 a=xmb-EsYY8bH0VWELuYED:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 08, 2020 at 04:33:29PM -0700, Douglas Anderson wrote:
> The AUX channel transfer error bits in the status register are latched
> and need to be cleared.  Clear them before doing our transfer so we
> don't see old bits and get confused.
> 
> Without this patch having a single failure would mean that all future
> transfers would look like they failed.
> 
> Fixes: b814ec6d4535 ("drm/bridge: ti-sn65dsi86: Implement AUX channel")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Applied.

	Sam

> ---
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 6ad688b320ae..d865cc2565bc 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -827,6 +827,12 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>  				     buf[i]);
>  	}
>  
> +	/* Clear old status bits before start so we don't get confused */
> +	regmap_write(pdata->regmap, SN_AUX_CMD_STATUS_REG,
> +		     AUX_IRQ_STATUS_NAT_I2C_FAIL |
> +		     AUX_IRQ_STATUS_AUX_RPLY_TOUT |
> +		     AUX_IRQ_STATUS_AUX_SHORT);
> +
>  	regmap_write(pdata->regmap, SN_AUX_CMD_REG, request_val | AUX_CMD_SEND);
>  
>  	ret = regmap_read_poll_timeout(pdata->regmap, SN_AUX_CMD_REG, val,
> -- 
> 2.26.2.645.ge9eca65c58-goog
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
