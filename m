Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 591332F7126
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 04:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730645AbhAODtq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 22:49:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728452AbhAODtq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 22:49:46 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C07C061575
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:49:05 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id r9so7326593otk.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BWxsOOk11ALTjpUo3gLg8gd+IkymuxCP/NKNZLVJFbA=;
        b=ewezM9RxdGM/uSiiRAmWujXTI9dtfQm5Dmu9UdJcEiy8HT9tl8JJeuU5m67GTdKBJL
         Ff9VlozGfXlzOC3F1CtcxO7+6chjpke5sgbirzJtr/eDnv0X3ehy2d2exQlI9V93xdGP
         l4rCRcW7QV8UI2Z901kzIeqNObCbHDm55Beum1Y71lNJ+Mo80pUe52nOrvhTwdSZnnFp
         ofNKEEh1z/Do75c4V8wyZojW1ktPPCLkIpp1bpEOhNhHbssWHheLTiTOhci0XbrbxUMf
         Rrqlm9jNZ36dnoolclqOhgLhu2557Q6o8fA6Fp9YfhZl7DxZfKxKXnuQ9R4ttaCMnEXP
         Xm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BWxsOOk11ALTjpUo3gLg8gd+IkymuxCP/NKNZLVJFbA=;
        b=RJyOE2AYyheaSp81qgIRSZJ09uY3dekgzoqLHOxe/1Nc0UXHAUJmLR/Lt5sw9ZMk3G
         rS467FdLLelZyEoso3tZpNr53+dCJSlm/TVWUW0us4LrMTq55SOr+h+8T8zuoMUSihbr
         w1ylw/FcXYo5jMX+MHgp3dTommIK3h5CjEjRBBBuIyxcGEEQwwb+qxY/GuFrQs8Ic2Ic
         Gc7oFRCZJYgA8EAM/RM8K6xt9gcF/ad8MN23CJbXSyKJ33fjjl++BXLso7KpCV28cijd
         pWTDfxJr4qoxFIDAt3B9fFo13I/PEMQCon38sBg8GuEf8Fm4juTldlG5eJVD++qN/7Z0
         qYmg==
X-Gm-Message-State: AOAM530AEvGmnCy2Z/RK2bYR/DJZjnU22900EFL6Jpt2SsOQnRuK0EH0
        9G737+HATdNWFU7HRbaox0wTjg==
X-Google-Smtp-Source: ABdhPJzwnCONBKp/lWmJdpN0ixlFfOCGdbrjs3S8aglD1bPkpwcVl3PyK0rfxg+yKpN6SYy8wBzmgw==
X-Received: by 2002:a05:6830:214c:: with SMTP id r12mr6909580otd.208.1610682545010;
        Thu, 14 Jan 2021 19:49:05 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h26sm1577280ots.9.2021.01.14.19.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 19:49:04 -0800 (PST)
Date:   Thu, 14 Jan 2021 21:49:02 -0600
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
Subject: Re: [PATCH 1/2] drm/bridge/lontium-lt9611uxc: fix waiting for EDID
 to become available
Message-ID: <YAEQrnlHA+Z8YTij@builder.lan>
References: <20201127092316.122246-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127092316.122246-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 27 Nov 03:23 CST 2020, Dmitry Baryshkov wrote:

> - Call wake_up() when EDID ready event is received to wake
>   wait_event_interruptible_timeout()
> 
> - Increase waiting timeout, reading EDID can take longer than 100ms, so
>   let's be on a safe side.
> 
> - Return NULL pointer from get_edid() callback rather than ERR_PTR()
>   pointer, as DRM code does NULL checks rather than IS_ERR().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 0c98d27f84ac..b708700e182d 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -145,8 +145,10 @@ static irqreturn_t lt9611uxc_irq_thread_handler(int irq, void *dev_id)
>  
>  	lt9611uxc_unlock(lt9611uxc);
>  
> -	if (irq_status & BIT(0))
> +	if (irq_status & BIT(0)) {
>  		lt9611uxc->edid_read = !!(hpd_status & BIT(0));
> +		wake_up_all(&lt9611uxc->wq);

This seems like a really good idea :)

> +	}
>  
>  	if (irq_status & BIT(1)) {
>  		if (lt9611uxc->connector.dev)
> @@ -465,7 +467,7 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
>  static int lt9611uxc_wait_for_edid(struct lt9611uxc *lt9611uxc)
>  {
>  	return wait_event_interruptible_timeout(lt9611uxc->wq, lt9611uxc->edid_read,
> -			msecs_to_jiffies(100));
> +			msecs_to_jiffies(500));
>  }
>  
>  static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
> @@ -503,7 +505,10 @@ static struct edid *lt9611uxc_bridge_get_edid(struct drm_bridge *bridge,
>  	ret = lt9611uxc_wait_for_edid(lt9611uxc);
>  	if (ret < 0) {
>  		dev_err(lt9611uxc->dev, "wait for EDID failed: %d\n", ret);
> -		return ERR_PTR(ret);
> +		return NULL;
> +	} else if (ret == 0) {
> +		dev_err(lt9611uxc->dev, "wait for EDID timeout\n");
> +		return NULL;

This looks like it should be a separate patch.

Regards,
Bjorn

>  	}
>  
>  	return drm_do_get_edid(connector, lt9611uxc_get_edid_block, lt9611uxc);
> -- 
> 2.29.2
> 
