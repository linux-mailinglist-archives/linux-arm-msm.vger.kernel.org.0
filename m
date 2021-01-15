Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC2DA2F7108
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 04:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728215AbhAODe2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 22:34:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726311AbhAODe0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 22:34:26 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C27AC061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:33:46 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id j12so7329179ota.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fRczbUbBhyeMbRNGSVxv3+jG6ocVKICkYf8hNaQiA40=;
        b=WwM8HsQenb0RHqPUfHN8HlIOusKmws4CAUPzJUQKgPTivnrm+e/L/o6SRP8uxsqKSW
         wu8AKrlTSeL33CdsxW7+Q2IuHLzuFq+SOyBoLVex2SzB4Jaws37irmyUnn0whudzEvYb
         qqN9y6aDMXodpMw7Fie8WNBDAbCDZuixL/H2NbOfd/+uKfjCzGbleHgTdfblmwHrYjof
         jjLNo68t4xnYQnzXMYRUvWq5nGwS3ux+iQ0dWarO9b9tlzzSfe/MWrkjEVdTkPnZYP+6
         xNd6Gc+HOuA+oWvRHVLSn7WPJpNkkTb2+X9vs5lE3sEaQv0hY8VpvrOP21f0hI/I7TfY
         gdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fRczbUbBhyeMbRNGSVxv3+jG6ocVKICkYf8hNaQiA40=;
        b=efKHay+AL3rnGvgLzNUoBW9Bv0leobVP8phSmyBh7Nhfz1W/DaKT55WFWtyruB6hxz
         WcYQn98GHH6uNBcsEyKTSjZt2AGTmIqfYcx6zoVziNqRx6Ia5Lj/9Csef7NxZZDAv00F
         gmoxsMi3BKQvpYlCOI8iGNdz4dFifFoMgeMhWwZpWqKuiBq3NpeIGWXL6gua6Oapt+eb
         PI2JSDD9ut7z0cxFcNiUQQnCf5QV/5o4uas3HbximFo0cClk93ueEgRrn2SUlFfsYxgn
         xNRhQg3RAtogQfYXDFmsGhi8ebVnFY56HLQ3zdFRt2OJWEOZ9DduH6ofVWYyvjnujwHI
         18Kg==
X-Gm-Message-State: AOAM530MSvT2FejNw4UcUWByORABMm0b3h4B3LGlevGeNcnq9ZwQVgLK
        orHNF7YlqMt0x6gxhIBNsgq0JQ==
X-Google-Smtp-Source: ABdhPJzFL6cdTF4R58GGCBOQmQ22buEMMhKJfkQk0vF8xh2lAjnh5m3SIuBeuBCg/rEWwlp7yGqgUQ==
X-Received: by 2002:a9d:7c82:: with SMTP id q2mr6777669otn.205.1610681625635;
        Thu, 14 Jan 2021 19:33:45 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 94sm1548656otw.41.2021.01.14.19.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 19:33:44 -0800 (PST)
Date:   Thu, 14 Jan 2021 21:33:43 -0600
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
Subject: Re: [PATCH 2/2] drm/bridge/lontium-lt9611uxc: move HPD notification
 out of IRQ handler
Message-ID: <YAENF3G66CGFRQ68@builder.lan>
References: <20201127092316.122246-1-dmitry.baryshkov@linaro.org>
 <20201127092316.122246-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127092316.122246-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 27 Nov 03:23 CST 2020, Dmitry Baryshkov wrote:

> drm hotplug handling code (drm_client_dev_hotplug()) can wait on mutex,
> thus delaying further lt9611uxc IRQ events processing.  It was observed
> occasionally during bootups, when drm_client_modeset_probe() was waiting
> for EDID ready event, which was delayed because IRQ handler was stuck
> trying to deliver hotplug event.
> Move hotplug notifications from IRQ handler to separate work to be able
> to process IRQ events without delays.
> 

I see a couple of other drivers doing the same, and the patch looks
good.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 30 +++++++++++++++++-----
>  1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index b708700e182d..88630bc2921f 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -14,6 +14,7 @@
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/wait.h>
> +#include <linux/workqueue.h>
>  
>  #include <sound/hdmi-codec.h>
>  
> @@ -36,6 +37,7 @@ struct lt9611uxc {
>  	struct mutex ocm_lock;
>  
>  	struct wait_queue_head wq;
> +	struct work_struct work;
>  
>  	struct device_node *dsi0_node;
>  	struct device_node *dsi1_node;
> @@ -52,6 +54,7 @@ struct lt9611uxc {
>  
>  	bool hpd_supported;
>  	bool edid_read;
> +	bool hdmi_connected;
>  	uint8_t fw_version;
>  };
>  
> @@ -151,15 +154,26 @@ static irqreturn_t lt9611uxc_irq_thread_handler(int irq, void *dev_id)
>  	}
>  
>  	if (irq_status & BIT(1)) {
> -		if (lt9611uxc->connector.dev)
> -			drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
> -		else
> -			drm_bridge_hpd_notify(&lt9611uxc->bridge, !!(hpd_status & BIT(1)));
> +		lt9611uxc->hdmi_connected = !!(hpd_status & BIT(1));
> +		schedule_work(&lt9611uxc->work);
>  	}
>  
>  	return IRQ_HANDLED;
>  }
>  
> +void lt9611uxc_hpd_work(struct work_struct *work)
> +{
> +	struct lt9611uxc *lt9611uxc = container_of(work, struct lt9611uxc, work);
> +
> +	if (lt9611uxc->connector.dev)
> +		drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
> +	else
> +		drm_bridge_hpd_notify(&lt9611uxc->bridge,
> +				      lt9611uxc->hdmi_connected ?
> +				      connector_status_connected :
> +				      connector_status_disconnected);
> +}
> +
>  static void lt9611uxc_reset(struct lt9611uxc *lt9611uxc)
>  {
>  	gpiod_set_value_cansleep(lt9611uxc->reset_gpio, 1);
> @@ -447,7 +461,7 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
>  	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
>  	unsigned int reg_val = 0;
>  	int ret;
> -	int connected = 1;
> +	bool connected = true;
>  
>  	if (lt9611uxc->hpd_supported) {
>  		lt9611uxc_lock(lt9611uxc);
> @@ -457,8 +471,9 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
>  		if (ret)
>  			dev_err(lt9611uxc->dev, "failed to read hpd status: %d\n", ret);
>  		else
> -			connected  = reg_val & BIT(1);
> +			connected  = !!(reg_val & BIT(1));
>  	}
> +	lt9611uxc->hdmi_connected = connected;
>  
>  	return connected ?  connector_status_connected :
>  				connector_status_disconnected;
> @@ -931,6 +946,8 @@ static int lt9611uxc_probe(struct i2c_client *client,
>  	lt9611uxc->fw_version = ret;
>  
>  	init_waitqueue_head(&lt9611uxc->wq);
> +	INIT_WORK(&lt9611uxc->work, lt9611uxc_hpd_work);
> +
>  	ret = devm_request_threaded_irq(dev, client->irq, NULL,
>  					lt9611uxc_irq_thread_handler,
>  					IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
> @@ -967,6 +984,7 @@ static int lt9611uxc_remove(struct i2c_client *client)
>  	struct lt9611uxc *lt9611uxc = i2c_get_clientdata(client);
>  
>  	disable_irq(client->irq);
> +	flush_scheduled_work();
>  	lt9611uxc_audio_exit(lt9611uxc);
>  	drm_bridge_remove(&lt9611uxc->bridge);
>  
> -- 
> 2.29.2
> 
