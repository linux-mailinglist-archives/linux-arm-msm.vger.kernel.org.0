Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA6AE2F7EBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 16:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbhAOO7v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 09:59:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727716AbhAOO7v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 09:59:51 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBDE5C061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 06:59:10 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id b24so8792562otj.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 06:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BgP0/6eUZBd02FT4Yca7Ri+xdr/2QbRxZxHfgskufLU=;
        b=RIbhpeGpWe759rgFYc+tr07bnXRAiFhqtWEfQ0U9aKt+UKqZdiiP5V0I0c4wySr6+n
         d2R6rcawvn2giKZxoRnFhURFvXZfwN9xtfgm1WBhQxc8Bezx11/UmnckQwmPYUiqhY8d
         AJu2c+sXoeQGbcLtBNMINVrWN6fiF/m7tWpYrIodNCd44CnSb1aXARbJOjpjiJKnrTdG
         OA70uX3y0ak73kkz3LXBiRYEKY2Nim3ONjGlrLs+RUrrpnuS2nOm87BXpcgE/oHmTWCA
         1mH/bBhPfNy5c9cojup9ln5wKQIvNsasAbDUee7EKH/e6dOZFixvYzFzhMnuIHu3JArg
         Aa5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BgP0/6eUZBd02FT4Yca7Ri+xdr/2QbRxZxHfgskufLU=;
        b=dAdvSP//QvOMkVDXiBdAu6vURyKndebnQZsRVntBT9LOfn15r2C61L9tOvpB0A8rBw
         nFkp9K2rANmE+wJRaMDwpE+PIKXu530SS/JXQO18y5G2o/sGkERhn19R6PIUrhERhWhT
         jWUbIvGoAv20uWSpLCQPhxwnIvH24FLNWrLccpBSJe/LMzKlRNbj3Vj50xictHnkEAcV
         vm+6b/qf0SIJhcZuPEE2KvmvIs5/IWVQ6pYtXrYGHwDJmJJLzdlA682xndKc3p6QhCMj
         q55fWcidR9H8BoYoBLXZuDLRQjaBko+kRRrbMxSxRABAf/CE7Pc7h6JrWER9eBDew4MW
         65Ow==
X-Gm-Message-State: AOAM530QqTYs+P6hJnhQJTs4MbWneMsLpOhav67gSrKqEiFdWsWByWTB
        ZEzL1VGu26dDjaXal+EkgmcEhg==
X-Google-Smtp-Source: ABdhPJyGMhf/hePzRXY2gpEmcb/cM8zoxN5bkOxhQgTyF6SZyoif8C/0rHizikN2InILdX/QDDLx1A==
X-Received: by 2002:a05:6830:10a:: with SMTP id i10mr1753711otp.5.1610722750197;
        Fri, 15 Jan 2021 06:59:10 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z38sm1808320ooi.34.2021.01.15.06.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 06:59:09 -0800 (PST)
Date:   Fri, 15 Jan 2021 08:59:07 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 2/3] drm/bridge/lontium-lt9611uxc: fix get_edid return
 code
Message-ID: <YAGtu9GYuphys1GF@builder.lan>
References: <20210115110225.127075-1-dmitry.baryshkov@linaro.org>
 <20210115110225.127075-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115110225.127075-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 15 Jan 05:02 CST 2021, Dmitry Baryshkov wrote:

> Return NULL pointer from get_edid() callback rather than ERR_PTR()
> pointer, as DRM code does NULL checks rather than IS_ERR(). Also while
> we are at it, return NULL if getting EDID timed out.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index a59e811f1705..b708700e182d 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -505,7 +505,10 @@ static struct edid *lt9611uxc_bridge_get_edid(struct drm_bridge *bridge,
>  	ret = lt9611uxc_wait_for_edid(lt9611uxc);
>  	if (ret < 0) {
>  		dev_err(lt9611uxc->dev, "wait for EDID failed: %d\n", ret);
> -		return ERR_PTR(ret);
> +		return NULL;
> +	} else if (ret == 0) {
> +		dev_err(lt9611uxc->dev, "wait for EDID timeout\n");
> +		return NULL;
>  	}
>  
>  	return drm_do_get_edid(connector, lt9611uxc_get_edid_block, lt9611uxc);
> -- 
> 2.29.2
> 
