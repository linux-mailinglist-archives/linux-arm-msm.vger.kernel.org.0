Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 938D73D4B60
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jul 2021 06:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbhGYD2N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jul 2021 23:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbhGYD2N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jul 2021 23:28:13 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55711C061757
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:08:43 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id z26so6834491oih.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4EjfvfsCnIfJzIDqvMiXOdpA/RzqpY5JQx4yaoDus44=;
        b=Jm+R2TZ+MdhwPbsYW1kVKkQA6nDkRYzbmlD/yofrxgzHwLK7t19MpoIKD6uOoWemxp
         sm65mjbLVqTScU1C4waH/P/YysQdP8QiBNTI4tWLlfoA6SpAHm1pPLAY4SnV1PDKnnzF
         aBiL9AnCApEOXZBP262szkx3jtCSS4jPdpZgK1Dgpr/F4Fiias0ZDuumQH7tIHmP6pPj
         u5ax97GViXY0U4UOja9medD97eN8NHfhORYWoABvzB8dd/zN+Qogv2Ar61uuB+8cCSSi
         fP23+PnBtvCu7lQMqfx0fo4X9zgn4Zk+I+Mtol3KKMAb7XOxTn+xXVE3OA2rkcEG5gy5
         SLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4EjfvfsCnIfJzIDqvMiXOdpA/RzqpY5JQx4yaoDus44=;
        b=RM2AbdBrY6c7uSjgHW7VyfoVVYZr3zCRwxsFSBEMWaNXZ7XKxPf8DjwA20BO7xiDJM
         ICS3czrFVCc4b191Cv4WmEyMq08vzeLdDGap4zq5bil7wT+3AwF3PQz+yfyBx0U6hIPY
         PWQaREwds0H74x3fKeuxBDbslo7uQrR54jxPqSHnZrcH1DtPHPuEP89K0RK6+Ml26A6g
         nrzZVcAbb2FjnV2ly3bC1P65YeHNgThAdfe5XQTJhuo5RD+ilOKa4CDl/dkdbBV5FyOK
         3Psb2ezdgh9gVlzZLOrj3n+q6TMRqQm55MEFMF0RyTzbz/UbkTrnR1OWCj+Xc6oi2EuZ
         bJuA==
X-Gm-Message-State: AOAM533BbpmknoDsXXm6vdRDP2dxt9oiFt2HvoSZxOM2pR18bWworDCW
        OK2timgDEn+AKqEnVFGAm3MOuA==
X-Google-Smtp-Source: ABdhPJyB37DGqI8iRmzu9V40UiIvFN1SGDEs+M+0N/hhyYA86IxgTCxFn3+xl2//CQoduQBQIB4wtQ==
X-Received: by 2002:a54:468d:: with SMTP id k13mr353628oic.100.1627186122781;
        Sat, 24 Jul 2021 21:08:42 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r1sm1510858ooc.16.2021.07.24.21.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:08:42 -0700 (PDT)
Date:   Sat, 24 Jul 2021 23:08:40 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 6/7] drm/msm/dsi: stop calling set_encoder_mode
 callback
Message-ID: <YPzjyF0M6IzFVqh3@yoga>
References: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
 <20210717124016.316020-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210717124016.316020-7-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 17 Jul 07:40 CDT 2021, Dmitry Baryshkov wrote:

> None of the display drivers now implement set_encoder_mode callback.
> Stop calling it from the modeset init code.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/gpu/drm/msm/dsi/dsi.c         |  2 --
>  drivers/gpu/drm/msm/dsi/dsi.h         |  1 -
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 12 ------------
>  3 files changed, 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 5201d7eb0490..77c8dba297d8 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -251,8 +251,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>  		goto fail;
>  	}
>  
> -	msm_dsi_manager_setup_encoder(msm_dsi->id);
> -
>  	priv->bridges[priv->num_bridges++]       = msm_dsi->bridge;
>  	priv->connectors[priv->num_connectors++] = msm_dsi->connector;
>  
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 856a532850c0..e0c3c4409377 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -80,7 +80,6 @@ struct drm_connector *msm_dsi_manager_connector_init(u8 id);
>  struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id);
>  int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
>  bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
> -void msm_dsi_manager_setup_encoder(int id);
>  int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
>  void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
>  bool msm_dsi_manager_validate_current_config(u8 id);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 27d3b9ebf831..693078e68fd4 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -216,18 +216,6 @@ static int dsi_mgr_bridge_get_id(struct drm_bridge *bridge)
>  	return dsi_bridge->id;
>  }
>  
> -void msm_dsi_manager_setup_encoder(int id)
> -{
> -	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> -	struct msm_drm_private *priv = msm_dsi->dev->dev_private;
> -	struct msm_kms *kms = priv->kms;
> -	struct drm_encoder *encoder = msm_dsi_get_encoder(msm_dsi);
> -
> -	if (encoder && kms->funcs->set_encoder_mode)
> -		kms->funcs->set_encoder_mode(kms, encoder,
> -					     msm_dsi_is_cmd_mode(msm_dsi));
> -}
> -
>  static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
>  {
>  	struct msm_drm_private *priv = conn->dev->dev_private;
> -- 
> 2.30.2
> 
