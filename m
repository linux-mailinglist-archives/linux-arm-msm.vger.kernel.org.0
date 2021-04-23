Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 454723694D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 16:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241013AbhDWOgV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 10:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240868AbhDWOgV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 10:36:21 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7005FC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 07:35:43 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id i81so49371266oif.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 07:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jbbrFFl9vrwv+CdmCwQi0I7Ko+cX89wNgsv/KroPn5Y=;
        b=YND9y+oQTfNuuRE/WdvdMgAirwez9HFLRB+aG9BPoNMwQKu6aALut9FGPg2hbWqD6t
         F3EXvj2ltRdHT+rRBp5KxOD33T91Yf8+200STJMjqxjsGjtAT2Mco+qodmLFAK84pvTZ
         pUdgdf01v4YY3dlbpOm44wrP/0SBpj6zQ5/WiLmZJmaki+i6Gv7/e9AFprsIB+WFtIjs
         7rXn6nIl+MnNEEJBeF1126DPKf+cgZHv1VOGm21NOMzYgtXYQUgVpTlQrebnqj2JMNJ5
         MqWqXre21JazMJNwKEZykbfpWbR7hKiVGO+XzEPwQhZnz6hHcZK2YnPvLk771yIzKt7j
         cbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jbbrFFl9vrwv+CdmCwQi0I7Ko+cX89wNgsv/KroPn5Y=;
        b=oKQgkQL6j1MhuyT4bcSbQFMm6oYnBoKZBq2i6kXEfWXJTHKyY9AuMDez0EXHjZ2pVV
         irAiEa0xBv822/TMNhDPiDFWhG5eHotfSJScZi/U1EbJBOyeJNDy4+a+YEsrf5JX4H0R
         ewdtfh0FdnMybMBV4HfnIWRlOdi5gEioZRrQiOqVahcFmASLOto1REmmAnXuxpD5Cds/
         4zlIEKkntDdiQGEDy7/4V4NBryarMhN/BSCFATI0hOnwOoYjJLKNMyZOG+aue6dQ+HUX
         vpTJAgtPsea1JtZeO25dlaZqBUB6xc752qDVlg2aIoqSdHEeKhlfKI5XtScuKgggaFhc
         pkew==
X-Gm-Message-State: AOAM533CfBQmUikyiINmaOvtQYQCQpgS5X3q8/vIfP8HVXwNovtT2LkZ
        serp6K7VBOSnkRvhuHcy7thZUA==
X-Google-Smtp-Source: ABdhPJxcCUZNBug881o1uVELe/LX/FF4rYn/YAsPBI0cQIVf5vzR30LNv6mS9V2fNTK1QZAX0+vB4w==
X-Received: by 2002:a05:6808:f8e:: with SMTP id o14mr3036405oiw.56.1619188542856;
        Fri, 23 Apr 2021 07:35:42 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c14sm1202484oov.21.2021.04.23.07.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:35:42 -0700 (PDT)
Date:   Fri, 23 Apr 2021 09:35:40 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/27] drm/bridge: ti-sn65dsi86: Clean debugfs code
Message-ID: <YILbPCGC+Wk9Mdxx@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.10.I5fe072753290c6a77eda736ebd5778e17b7cb0fb@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.10.I5fe072753290c6a77eda736ebd5778e17b7cb0fb@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 16 Apr 17:39 CDT 2021, Douglas Anderson wrote:

> Let's cleanup the debugfs code to:
> - Check for errors.
> - Use devm to manage freeing, which also means we don't need to store
>   a pointer in our structure.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 32 +++++++++++++++++----------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 57574132e200..0c6aa99ddc99 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -118,7 +118,6 @@
>   * @aux:          Our aux channel.
>   * @bridge:       Our bridge.
>   * @connector:    Our connector.
> - * @debugfs:      Used for managing our debugfs.
>   * @host_node:    Remote DSI node.
>   * @dsi:          Our MIPI DSI source.
>   * @edid:         Detected EDID of eDP panel.
> @@ -146,7 +145,6 @@ struct ti_sn65dsi86 {
>  	struct drm_dp_aux		aux;
>  	struct drm_bridge		bridge;
>  	struct drm_connector		connector;
> -	struct dentry			*debugfs;
>  	struct edid			*edid;
>  	struct device_node		*host_node;
>  	struct mipi_dsi_device		*dsi;
> @@ -245,18 +243,30 @@ static int status_show(struct seq_file *s, void *data)
>  
>  DEFINE_SHOW_ATTRIBUTE(status);
>  
> -static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
> +static void ti_sn65dsi86_debugfs_remove(void *data)
>  {
> -	pdata->debugfs = debugfs_create_dir(dev_name(pdata->dev), NULL);
> -
> -	debugfs_create_file("status", 0600, pdata->debugfs, pdata,
> -			&status_fops);
> +	debugfs_remove_recursive(data);
>  }
>  
> -static void ti_sn65dsi86_debugfs_remove(struct ti_sn65dsi86 *pdata)
> +static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
>  {
> -	debugfs_remove_recursive(pdata->debugfs);
> -	pdata->debugfs = NULL;
> +	struct device *dev = pdata->dev;
> +	struct dentry *debugfs;
> +	int ret;
> +
> +	debugfs = debugfs_create_dir(dev_name(dev), NULL);
> +	if (IS_ERR(debugfs))
> +		ret = PTR_ERR(debugfs);
> +	else
> +		ret = devm_add_action_or_reset(dev, ti_sn65dsi86_debugfs_remove,
> +					       debugfs);
> +
> +	if (ret) {

You're not supposed to handle errors from debugfs_create_dir(), but I
like what you're doing with devm here and that needs a check.

Also worth mentioning is that at this point in the patch stack the
debugfs "status" file will outlive the activation of pm_runtime, this is
however taken care of in a later patch. Given that it's unlikely to
cause a problem I don't mind this transient issue - but wanted to
mention that I reviewed the end result in this regard.


Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +		dev_warn(dev, "Failed to create debugfs (%d), skipping\n", ret);
> +		return;
> +	}
> +
> +	debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
>  }
>  
>  /* Connector funcs */
> @@ -1310,8 +1320,6 @@ static int ti_sn65dsi86_remove(struct i2c_client *client)
>  
>  	kfree(pdata->edid);
>  
> -	ti_sn65dsi86_debugfs_remove(pdata);
> -
>  	drm_bridge_remove(&pdata->bridge);
>  
>  	pm_runtime_disable(pdata->dev);
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
