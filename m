Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABF13D4B55
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jul 2021 06:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhGYDZL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jul 2021 23:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbhGYDZL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jul 2021 23:25:11 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88BAAC061757
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:05:41 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id q6so6844220oiw.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ee+MkrjdHmRANJF9EYBJv/AAOsWCcQDH44cHzKUTFjw=;
        b=lgptSOZtGMPgI/JhKeIfOMl4uUmv+trpyCntqy0HW6mwbqfYTZbQ7rXGAy35oYL5mB
         oqNevPXF6NhbmnXmIhC6951GRMhjO0z4CsqxcLZWXPCMhx5VDptG6lwZzF1JWowfonDJ
         DViMUL7tCLESPuut+PHQT+cY6aX2gqoYehj5DzmLItWhvj5AqpMTw7rLTMLor3JIvSKH
         I5YPPxshM5wYQMxXlTW0/OpMVlZxMKOui0zdsDzH8v973eOpchcmCbCZuzF//bBzBdl/
         O0d45GfWdJPx5fdH93tqFop5pe8b8QwQVzzC4MdfiHhmn77t02hox8QqxLx2RNEDIRTq
         FhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ee+MkrjdHmRANJF9EYBJv/AAOsWCcQDH44cHzKUTFjw=;
        b=jrKDIQxPW8dby6bLIv4rSdaESAcWjBeo09JGnsxCq4eu4CamihXwz733r2RjJPXndF
         N1GatgNWMJLEqiHgi4N0ZHcTa5yyBZ5OafYXYT2BrjKoZLwp42GLgWYkx9NiU0MTAzea
         2Tdq8aCI7ggYioZJPNOu3RDAC3fktjGb+NMoN1ueHrBmQVhYIr7EGXze3q7+/ec5QnE+
         TM7YlNFSr6QCNOjpgGjVDpWtLe4250Zue1N6cd6lUDmn69nWxqmyEmIttMugOb2NFPQG
         Vxj9QTF7VesrUdyN+4ur+jUfBv4D+kimjm6j3mpNpQSgslgH5aAdaM1iLimY/+4htJdv
         bJmQ==
X-Gm-Message-State: AOAM532Tpxsfhhnrvpusr2mvN9pyKyFwop8mt3a5L/5xCI2T2bkKuGLk
        gzj2oi3kCKI60y8WhLtdgJv6gw==
X-Google-Smtp-Source: ABdhPJzD1r6KZD0ZLEktJ0N+OSL+l/9ru3GDVrV0P8XRsbmXhFMsQsHcbuEeiTmmh0T/zatY46SQLg==
X-Received: by 2002:a54:4608:: with SMTP id p8mr13416734oip.110.1627185940927;
        Sat, 24 Jul 2021 21:05:40 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t144sm6977696oih.57.2021.07.24.21.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:05:40 -0700 (PDT)
Date:   Sat, 24 Jul 2021 23:05:38 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 2/7] drm/msm/dsi: add three helper functions
Message-ID: <YPzjEgXTF1RiFo6B@yoga>
References: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
 <20210717124016.316020-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210717124016.316020-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 17 Jul 07:40 CDT 2021, Dmitry Baryshkov wrote:

> Add three helper functions to be used by display drivers for setting up
> encoders.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.c         |  7 +++++++
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 19 +++++++++++--------
>  drivers/gpu/drm/msm/msm_drv.h         | 17 +++++++++++++++--
>  3 files changed, 33 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 75afc12a7b25..5201d7eb0490 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -13,6 +13,13 @@ struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi)
>  	return msm_dsi->encoder;
>  }
>  
> +bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
> +{
> +	unsigned long host_flags = msm_dsi_host_get_mode_flags(msm_dsi->host);
> +
> +	return !(host_flags & MIPI_DSI_MODE_VIDEO);
> +}
> +
>  static int dsi_get_phy(struct msm_dsi *msm_dsi)
>  {
>  	struct platform_device *pdev = msm_dsi->pdev;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index b20645ab279b..27d3b9ebf831 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -216,12 +216,6 @@ static int dsi_mgr_bridge_get_id(struct drm_bridge *bridge)
>  	return dsi_bridge->id;
>  }
>  
> -static bool dsi_mgr_is_cmd_mode(struct msm_dsi *msm_dsi)
> -{
> -	unsigned long host_flags = msm_dsi_host_get_mode_flags(msm_dsi->host);
> -	return !(host_flags & MIPI_DSI_MODE_VIDEO);
> -}
> -
>  void msm_dsi_manager_setup_encoder(int id)
>  {
>  	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> @@ -231,7 +225,7 @@ void msm_dsi_manager_setup_encoder(int id)
>  
>  	if (encoder && kms->funcs->set_encoder_mode)
>  		kms->funcs->set_encoder_mode(kms, encoder,
> -					     dsi_mgr_is_cmd_mode(msm_dsi));
> +					     msm_dsi_is_cmd_mode(msm_dsi));
>  }
>  
>  static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
> @@ -276,7 +270,7 @@ static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
>  	if (other_dsi && other_dsi->panel && kms->funcs->set_split_display) {
>  		kms->funcs->set_split_display(kms, master_dsi->encoder,
>  					      slave_dsi->encoder,
> -					      dsi_mgr_is_cmd_mode(msm_dsi));
> +					      msm_dsi_is_cmd_mode(msm_dsi));
>  	}
>  
>  out:
> @@ -839,3 +833,12 @@ void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi)
>  		msm_dsim->dsi[msm_dsi->id] = NULL;
>  }
>  
> +bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi)
> +{
> +	return IS_BONDED_DSI();
> +}
> +
> +bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
> +{
> +	return IS_MASTER_DSI_LINK(msm_dsi->id);
> +}
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 1a48a709ffb3..9bfd37855969 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -350,7 +350,9 @@ void __exit msm_dsi_unregister(void);
>  int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>  			 struct drm_encoder *encoder);
>  void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi);
> -
> +bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
> +bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
> +bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
>  #else
>  static inline void __init msm_dsi_register(void)
>  {
> @@ -367,7 +369,18 @@ static inline int msm_dsi_modeset_init(struct msm_dsi *msm_dsi,
>  static inline void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
>  {
>  }
> -
> +static inline bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
> +{
> +	return false;
> +}
> +static bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi)

Missing "inline"

> +{
> +	return false;
> +}
> +bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)

Same.

Looks good otherwise!

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +{
> +	return false;
> +}
>  #endif
>  
>  #ifdef CONFIG_DRM_MSM_DP
> -- 
> 2.30.2
> 
