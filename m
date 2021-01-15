Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2EC02F7EB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 15:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731315AbhAOO7U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 09:59:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731286AbhAOO7T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 09:59:19 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A318DC0613C1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 06:58:39 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id d8so8761337otq.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 06:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k6zq/oTDBPEVQXeNZprpbOkQyyC64uIYxfSBvN3TmvM=;
        b=oOF/c9xBVldXUxxpi5Nc9ut3B7Nh2a3hdjV57iOvIg45toFBIufjv13Ie7fe6Wj1RA
         o9ljw7wuQ+Y+htcKPGPjQCLM2KcCDAzugoe1ixiWaTOBV/zO2UDAYoFQZtiKzbp4Cm5K
         z+0Gdd7wgrXztPZ3WX/wUg1TmWHop0b432ag5WCu8IHI8zWgSjysAksx1aqXBPTX2N6i
         5PxYf2r3QumTuVL/C7wUQrxRB70MHx2CwOzYjUlYuBwLNCCl0ZKPeCkK8BFTkt/oeCrh
         CJ50pKjmnbfcmNHTbAwAr+XBlETGaCQ2xVVClNoqptOrz2gPT5noNs11dnN0dy76t8ib
         dvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k6zq/oTDBPEVQXeNZprpbOkQyyC64uIYxfSBvN3TmvM=;
        b=jRg8g1J12yZ3D38tg43A/qheF/SJmo4t9DcHx2wzjSbM9p17JIIX3DMgqWp/X8IbgF
         U55+K8E1M8uvh4f9E7OFZBm5qtxKuRfkLrXsL+TdKsJlNzk0LhrODqyVhUdqU5SUdMzA
         M5ybs57RV9Hgu+M8nk4ApvGeHSGbOq61Q5frbCwg3+TaEjj45UTZktPs8LrEIvaBldy3
         7LzHDG8vTlfD8eYsSvy/Y2wARs4GGc/hhmadVWcG4Y1lxVxuZPsDipIRBjvJl1H4W/CL
         lwdxyizlIy056I+S2jlm8M+Frq0q2aQFy0/wSnvCfvWkgDkcrEYCbaZ7QUFKnlcgiahl
         uRKA==
X-Gm-Message-State: AOAM533jHQ2ohZ1qwNgX4KfndX+z4MiDmV3MJbW4Sf1fa/ZjLVqxso0H
        0z94AL/2IX55LgS7deDiuUFjtw==
X-Google-Smtp-Source: ABdhPJzrz6ko7/CrZVI8YHHgYTiqBb6tK1nxWMvciQsEf/hPcvcxI/0P3D2Mc94/pd9tQ0qfn6xkTA==
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr8487364otc.145.1610722718969;
        Fri, 15 Jan 2021 06:58:38 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x20sm1796368oov.33.2021.01.15.06.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 06:58:38 -0800 (PST)
Date:   Fri, 15 Jan 2021 08:58:36 -0600
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
Subject: Re: [PATCH v2 1/3] drm/bridge/lontium-lt9611uxc: fix waiting for
 EDID to become available
Message-ID: <YAGtnPqxe90wj+8K@builder.lan>
References: <20210115110225.127075-1-dmitry.baryshkov@linaro.org>
 <20210115110225.127075-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115110225.127075-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 15 Jan 05:02 CST 2021, Dmitry Baryshkov wrote:

> - Call wake_up() when EDID ready event is received to wake
>   wait_event_interruptible_timeout()
> 
> - Increase waiting timeout, reading EDID can take longer than 100ms, so
>   let's be on a safe side.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 0c98d27f84ac..a59e811f1705 100644
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
> -- 
> 2.29.2
> 
