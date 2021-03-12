Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF2A3383FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 03:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhCLCtt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 21:49:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231669AbhCLCtc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 21:49:32 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CAE9C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 18:49:32 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id 125-20020a4a1a830000b02901b6a144a417so1200056oof.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 18:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EYVqRVBPVhizjxhXnWF45Gz26g8vdQA3COQqWInRBeA=;
        b=gL3L51OcWU67DmzWlOUOVcXvpiTxuMJpwzzNInvbPku7ZfttNYAc+vJTXP2pwN456X
         ezPUT2byJNG2YyVG7IIik1mPkyz9NjBjzxuYKRiFRa7CvXGRDLVP6zPuKYJCaNJJjd5U
         3unxTI+29QH0F6WNzop7rJz1boWKj7QEAc6b4HaV/Dd7NYx0zPkBHjDvCzFqqPTmfAor
         xsUpYumiFVqeXRvL/F8ckV7rZLXqwWxm0vhgvdOjmOyyi7ZS+QxKPzvGzNyWFjcBgjaf
         0NzS7W+VWwMhsuyYdahNOi3RQC01deewwBLdRixfZDlVZgTn0PPo1t553Ck7RAGtOJPE
         quSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EYVqRVBPVhizjxhXnWF45Gz26g8vdQA3COQqWInRBeA=;
        b=rNOrH+bD5Bfejlo2cDWDJC5aoS7V699umqRBoBIovNwrXHs5J43uLXG7QV7n0G0gAf
         4QQQcpHpK6XYUxl0wX+iFmWflOOASgC/CsPd/FjjCLUz02huaQOO5hCIzJnFRAi06Dek
         tNQ+h8Jz05r5xfxCoVyHwPHtXfqfnEkSKOi7Zpp6Fho2mL7Br9OdKnJMolrwLC8nbtab
         WSqmFtyr8OkxqboxupCo5ocIixEe860uBHbBbT8gnlc9b1OYUC+o9hcTJRjMqOY5Xlx9
         Gp7KZH/NvoVZUjjpPoJOdeomZu3BnjVCLAooOIgB1wjl55ZcqWO4Hw54KjdiPntxu1b+
         2/pQ==
X-Gm-Message-State: AOAM530w6+EMTfyYC47ULbPNCRvCsnqblh2i1gh5WxhcCq3r46T7bDpi
        fQ52Lz2fMNs0UudlHdGrqf4dPQ==
X-Google-Smtp-Source: ABdhPJy05T1NPkkQXB9EoKTWk0BgQA2YbcX/Rl20SMQs0NEdv0PPCLfiCzrohW58ne4IcabfxTDOIA==
X-Received: by 2002:a4a:420d:: with SMTP id h13mr1638857ooj.24.1615517371923;
        Thu, 11 Mar 2021 18:49:31 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 64sm1102682otu.80.2021.03.11.18.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 18:49:31 -0800 (PST)
Date:   Thu, 11 Mar 2021 20:49:29 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/bridge: ti-sn65dsi86: Simplify refclk handling
Message-ID: <YErWuSV02RI4Ci1Y@builder.lan>
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 04 Mar 17:51 CST 2021, Douglas Anderson wrote:

> The clock framework makes it simple to deal with an optional clock.
> You can call clk_get_optional() and if the clock isn't specified it'll
> just return NULL without complaint. It's valid to pass NULL to
> enable/disable/prepare/unprepare. Let's make use of this to simplify
> things a tiny bit.
> 
> NOTE: this makes things look a tad bit asymmetric now since we check
> for NULL before clk_prepare_enable() but not for
> clk_disable_unprepare(). This seemed OK to me. We already have to
> check for NULL in the enable case anyway so why not avoid the extra
> call?
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index f27306c51e4d..942019842ff4 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1261,14 +1261,9 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>  		return ret;
>  	}
>  
> -	pdata->refclk = devm_clk_get(pdata->dev, "refclk");
> -	if (IS_ERR(pdata->refclk)) {
> -		ret = PTR_ERR(pdata->refclk);
> -		if (ret == -EPROBE_DEFER)
> -			return ret;
> -		DRM_DEBUG_KMS("refclk not found\n");
> -		pdata->refclk = NULL;
> -	}
> +	pdata->refclk = devm_clk_get_optional(pdata->dev, "refclk");
> +	if (IS_ERR(pdata->refclk))
> +		return PTR_ERR(pdata->refclk);
>  
>  	ret = ti_sn_bridge_parse_dsi_host(pdata);
>  	if (ret)
> -- 
> 2.30.1.766.gb4fecdf3b7-goog
> 
