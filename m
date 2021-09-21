Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B53E4137F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 19:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbhIUREV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 13:04:21 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:19906 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbhIURDa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 13:03:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632243721; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JVbNHBTbqGlyvcI9UWa1875Y6AZEumrY3iqK6OLeT7M=;
 b=QcGp6bI6U1ulukkezdaZlyg5npqJugr1WPdbA2E2aqKfRFtmZR6RShqXUZyspWFGgYllgkSE
 YC3x3Zcwd1JugfgGrH1F2LyOVz43yYB+elSrQWyOxHATQTOK2GQ1+ZP1KPv5ro8TSB4Sr/HW
 lm3lALk1OULPXcC/NHOFohNkQfI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 614a0fbf65c3cc8c6352f411 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 17:00:47
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 33F93C4360D; Tue, 21 Sep 2021 17:00:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 408F2C4338F;
        Tue, 21 Sep 2021 17:00:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 21 Sep 2021 10:00:46 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        David Heidelberg <david@ixit.cz>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: do not install irq handler
 before power up the host
In-Reply-To: <20210921162258.1858223-1-dmitry.baryshkov@linaro.org>
References: <20210921162258.1858223-1-dmitry.baryshkov@linaro.org>
Message-ID: <0c275df228a1925e43a4dc59ceeab6b7@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-21 09:22, Dmitry Baryshkov wrote:
> The DSI host might be left in some state by the bootloader. If this
> state generates an IRQ, it might hang the system by holding the
> interrupt line before the driver sets up the DSI host to the known
> state.
> 
> Move the request/free_irq calls into msm_dsi_host_power_on/_off calls,
> so that we can be sure that the interrupt is delivered when the host is
> in the known state.
> 
> Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

This is a valid change and we have seen interrupt storms in downstream 
happening
when like you said the bootloader leaves the DSI host in unknown state.
Just one question below.

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e269df285136..cd842347a6b1 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1951,15 +1951,6 @@ int msm_dsi_host_modeset_init(struct 
> mipi_dsi_host *host,
>  		return ret;
>  	}
> 
> -	ret = devm_request_irq(&pdev->dev, msm_host->irq,
> -			dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> -			"dsi_isr", msm_host);
> -	if (ret < 0) {
> -		DRM_DEV_ERROR(&pdev->dev, "failed to request IRQ%u: %d\n",
> -				msm_host->irq, ret);
> -		return ret;
> -	}
> -
>  	msm_host->dev = dev;
>  	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>  	if (ret) {
> @@ -2413,6 +2404,16 @@ int msm_dsi_host_power_on(struct mipi_dsi_host 
> *host,
>  	if (msm_host->disp_en_gpio)
>  		gpiod_set_value(msm_host->disp_en_gpio, 1);
> 
> +	ret = devm_request_irq(&msm_host->pdev->dev, msm_host->irq,
> +			dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +			"dsi_isr", msm_host);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(&msm_host->pdev->dev, "failed to request IRQ%u: %d\n",
> +				msm_host->irq, ret);
> +		return ret;
> +	}
> +
> +

Do you want to move this to msm_dsi_host_enable()?
So without the controller being enabled it is still in unknown state?
Also do you want to do this after dsi0 and dsi1 are initialized to 
account for
dual dsi cases?

>  	msm_host->power_on = true;
>  	mutex_unlock(&msm_host->dev_mutex);
> 
> @@ -2439,6 +2440,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host 
> *host)
>  		goto unlock_ret;
>  	}
> 
> +	devm_free_irq(&msm_host->pdev->dev, msm_host->irq, msm_host);
> +
>  	dsi_ctrl_config(msm_host, false, NULL, NULL);
> 
>  	if (msm_host->disp_en_gpio)
