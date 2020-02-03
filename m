Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15EDC15133B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 00:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgBCXcV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 18:32:21 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:35790 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgBCXcU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 18:32:20 -0500
Received: by mail-pj1-f65.google.com with SMTP id q39so506301pjc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 15:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bjBRbkXuM7e+Yrzus99X2qOeClLGUq0mOk80jUroNTQ=;
        b=f11sHAV3jAvM1bXJOrw/YZciwLMyi3wr8lABIITSLW+QDro1s9kpixO7CW7BE4GVsX
         BVISOC4A3wqtR0ig3nCNQwxS1bCKCdK0Fyk34s/E4BgKiInBGxLTgJeTqoywVTIB/OLR
         RxrphSseNxUG25/4OUfed2Boef5lf+FvaHdvRkgksQwDCAfwUtz0LOwKQLI9xdMIry5F
         pwn2wIL5N2oiL18XRU0V0q6dK/U/owXMNzyy6YbGGSxhQbnPqOb9pVCGJHd5Y6wnlrTI
         Y5UTeiANrjyKMFfce3YrKcKCtSRNC4XS6KBwuswld7HIA1RRWLjiDVG33Yve1wH26Ib9
         jT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bjBRbkXuM7e+Yrzus99X2qOeClLGUq0mOk80jUroNTQ=;
        b=FeZNHGSfMjFhPhJFg0wo95zJulUHcmoEOn+1xxrViF94f0G7Qy0ZalAxXDEIgTp8Gb
         h6EySSk2VirF6k6M/yuOkfQ7YFQioYaFn2xHR/lPvqfDoNR5ECV4r6jNIQehym0+S49L
         S0y618HZ4W4R/UNw4A64gRhhvQcD5yefv99RS7adhToba8bSF9abMAYdLoS6xn2IGHda
         bxYcDPpEhOvMFcDlLhoROImaWEe+nNQqGYn3vOJ3h/Si95MCZwHp/Cp6+xPpovUO0yX+
         hbNhgLyBc70Dtz/cHRkttsxoF8dTcJd0bXg4TenjbC2KeBJpsG+bydQuatDe184yGUdw
         ZZFA==
X-Gm-Message-State: APjAAAW58mIkqOj/gNm5H8OdWu1q8F1mMi/2J7xslc0laOKr9npTzw8d
        y6yEC0H+tZmuyKsnBsPOxGYQ/w==
X-Google-Smtp-Source: APXvYqzQD/Xl43wlQXkOagtDcoO4afR50u0nYFhmCaIdIGafU52lJE7MBsFBXcyYsNMf6Wtyriy2iw==
X-Received: by 2002:a17:902:bd88:: with SMTP id q8mr24818096pls.13.1580772740218;
        Mon, 03 Feb 2020 15:32:20 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e2sm536341pjs.25.2020.02.03.15.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 15:32:19 -0800 (PST)
Date:   Mon, 3 Feb 2020 15:32:17 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        robdclark@chromium.org, linux-arm-msm@vger.kernel.org,
        seanpaul@chromium.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 2/9] drm/bridge: ti-sn65dsi86: zero is never greater
 than an unsigned int
Message-ID: <20200203233217.GB311651@builder>
References: <20191218223530.253106-1-dianders@chromium.org>
 <20191218143416.v3.2.Id445d0057bedcb0a190009e0706e9254c2fd48eb@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218143416.v3.2.Id445d0057bedcb0a190009e0706e9254c2fd48eb@changeid>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 18 Dec 14:35 PST 2019, Douglas Anderson wrote:

> When we iterate over ti_sn_bridge_dp_rate_lut, there's no reason to
> start at index 0 which always contains the value 0.  0 is not a valid
> link rate.
> 
> This change should have no real effect but is a small cleanup.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Rob Clark <robdclark@gmail.com>
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 2fb9370a76e6..7b596af265e4 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -458,7 +458,7 @@ static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
>  	/* set DP data rate */
>  	dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
>  							DP_CLK_FUDGE_DEN;
> -	for (i = 0; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
> +	for (i = 1; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
>  		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
>  			break;
>  
> -- 
> 2.24.1.735.g03f4e72817-goog
> 
