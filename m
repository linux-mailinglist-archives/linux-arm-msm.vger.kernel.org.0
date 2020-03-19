Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17BFE18BFAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 19:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbgCSSwd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 14:52:33 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38217 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgCSSwd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 14:52:33 -0400
Received: by mail-pl1-f193.google.com with SMTP id w3so1440306plz.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2020 11:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KuKb5RMueZTT1lnJz9pwaA1gX0ugph89zpHI1w0owPA=;
        b=h+9QsDlRBnmpOE12ah1YgRXv/UsVmfsvWPnwFf8VyJE8Sm3c40v6+WFtZVx7QjeZ2x
         Mdiq65WGKB68WAAtEaaOxzNTCCEXmAYpWTvHr7PkaoRi5RAHzUssyvo6uqw2QGG659a/
         9FkQKiqXJU/Dr9j/00fyVg0gJoEja4tokK9UUPaSXDmfz8egjDXwJrhrb64YIBwtu1ZA
         fXV5QbzlcZwU+0pUHeYd7mqsxSgz4M18j45soWclZRxFp7f6KVt4v7OZP4llKdbS2p8S
         pxXGVo4Reyx50ILAG/lVSB3icq4JlohprSGNbYE4WPDxf/76GbFhVLokF/NLAu6tcyNu
         4lOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KuKb5RMueZTT1lnJz9pwaA1gX0ugph89zpHI1w0owPA=;
        b=mprPg8jLUvBe+b6556RRcrPzwk/n4YhHKL/uvqyiPIK5I+GC6pcYiXWkQLE1WXNVVE
         nFL1R2BuostHfRr5tgiOoA2kYOifNl/V0xIu7124AkRshYoNpVg882XeY9qkCA8PAJx6
         RzXXZtmyKScgSWaXlL5EB4YH5lvHvAIPxNPgVEWemsRJ2sSvrA+wdlYLQlGEInGtWRa5
         qj/geha8Lm9Zu8G7K5lwHKqYOfwwx0Mnb9jsTwGZa/vuHzeF75MDR6ebQRFgOkwXScOY
         Xg7jcmAQXBsJIsp6dohwTJ2zg/fhGjTb3Wg0fbmGdraSFAiUALptbFtz3Q5fWA4TG8La
         qgGg==
X-Gm-Message-State: ANhLgQ00T58YHdRvkC2i+arydrMXuUHmMCbwteFbUDnvqgAX3flz44A5
        wxdY8vRiJGvjqmwQd2hTMMUyMg==
X-Google-Smtp-Source: ADFU+vvOYGZYLL7ZJs0yQ4lQF5IeEPD2Trmkq1fGXPTW0tnZYKDhDzFBQUa3nppDlC5JAJbmCw77dA==
X-Received: by 2002:a17:902:ac85:: with SMTP id h5mr4715097plr.76.1584643951875;
        Thu, 19 Mar 2020 11:52:31 -0700 (PDT)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o66sm3272257pfb.93.2020.03.19.11.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 11:52:31 -0700 (PDT)
Date:   Thu, 19 Mar 2020 11:52:51 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ilia Mirkin <imirkin@alum.mit.edu>
Cc:     freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] drm/msm: avoid double-attaching hdmi/edp bridges
Message-ID: <20200319185251.GA1038@ripper>
References: <20200312035154.1621-1-imirkin@alum.mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312035154.1621-1-imirkin@alum.mit.edu>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 11 Mar 20:51 PDT 2020, Ilia Mirkin wrote:

> Each of hdmi and edp are already attached in msm_*_bridge_init. A second
> attachment returns -EBUSY, failing the driver load.
> 
> Tested with HDMI on IFC6410 (APQ8064 / MDP4), but eDP case should be
> analogous.
> 
> Fixes: 3ef2f119bd3ed (drm/msm: Use drm_attach_bridge() to attach a bridge to an encoder)
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>

Had to manually apply this, as the drm_bridge_attach() prototype changed
since this patch was written - but this was trivial. This is needed on
db820c as well.

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org> (hdmi part)
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/gpu/drm/msm/edp/edp.c   | 4 ----
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 4 ----
>  2 files changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/edp/edp.c b/drivers/gpu/drm/msm/edp/edp.c
> index ad4e963ccd9b..106a67473af5 100644
> --- a/drivers/gpu/drm/msm/edp/edp.c
> +++ b/drivers/gpu/drm/msm/edp/edp.c
> @@ -178,10 +178,6 @@ int msm_edp_modeset_init(struct msm_edp *edp, struct drm_device *dev,
>  		goto fail;
>  	}
>  
> -	ret = drm_bridge_attach(encoder, edp->bridge, NULL);
> -	if (ret)
> -		goto fail;
> -
>  	priv->bridges[priv->num_bridges++]       = edp->bridge;
>  	priv->connectors[priv->num_connectors++] = edp->connector;
>  
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 1a9b6289637d..737453b6e596 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -327,10 +327,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>  		goto fail;
>  	}
>  
> -	ret = drm_bridge_attach(encoder, hdmi->bridge, NULL);
> -	if (ret)
> -		goto fail;
> -
>  	priv->bridges[priv->num_bridges++]       = hdmi->bridge;
>  	priv->connectors[priv->num_connectors++] = hdmi->connector;
>  
> -- 
> 2.24.1
> 
