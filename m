Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC7D865DB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 18:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728308AbfGKQmp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 12:42:45 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43533 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727956AbfGKQmp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 12:42:45 -0400
Received: by mail-pg1-f196.google.com with SMTP id f25so3197735pgv.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2019 09:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=18XBM/Uxq1n8M6vF5U0L1qdSxRCs/oAYuJM9KehE1vY=;
        b=WyJV15NvacCmw+Xd8p6fSr2QmTKFTkIPgRPTnZFpABHqBbr/ObqoSn/va4KydoVGts
         A04oaT1qsZEhIYSmx6gk8/9H6VN5YZvuqoqlDhS4VXRn7ok6tU6TutCcOb0oSSLs09uU
         f5OMuRdn2KtEku2O4akOsSASylLhEmfT6fyMt+0WzJxeKqys4FuZxcnahZEuxCMr5Osp
         bkg7YBrKoNyHq5+uvEiN1NnoU8Q1YgvPlIbkD3ya8VAkrJ1i438gvKPwbsvFVFkSR+nU
         Tfs9s0bfWyQm/Mx5WL1LYqgQzvhYCd21W6/XY/8ARYh025bJ9gU7MSe3nfVGeYrKIDcx
         X6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=18XBM/Uxq1n8M6vF5U0L1qdSxRCs/oAYuJM9KehE1vY=;
        b=fa5d91fs5Ebn2JllDwJrwk5S68NjUGLv3boGVe9Pfj07wkWXlN01Ue30pcv7F3o5zZ
         Nyg6K232P63hhfeSRdsaVdQomHR40pcnoGqOs6tw0SGF9tFiJxyzan8q+xufP1IJRfly
         ussH26BXTbzAsoHT8UHvBQ3p1/g1R8EKl+lfyMDgyXVakyS8X+juy8hf/MtfflbH+8Xa
         q0nPBmtegtMb6YL4YI+32r6NJpYopGhMfcat8joYnayNDY6q8gKJeN1uWe7T6sMwDw/X
         JYaByW7YM9o/VtQEQ6SINNDpPZUdi8t4lF7FGCI2GbOROXjlBRC8mn03lEZI6Bh30YiH
         PAOA==
X-Gm-Message-State: APjAAAWfL3TFvZm6jWUzGA2mnroXtUmulf2ud/mMoCCwV+mgnwZqIfAm
        RD0fB9/HjYVwyOnv0DICHdKsmg==
X-Google-Smtp-Source: APXvYqwVsFsXq2rVTXBYSQQYx/k0XvZbO/pX70yjpkzK17qL7aRhtOd1lp6eZ7oTP7Mfl7gpZQsU0Q==
X-Received: by 2002:a17:90a:35e5:: with SMTP id r92mr6039610pjb.34.1562863364249;
        Thu, 11 Jul 2019 09:42:44 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e5sm8999607pfd.56.2019.07.11.09.42.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 09:42:43 -0700 (PDT)
Date:   Thu, 11 Jul 2019 09:43:53 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: use dev name for debugfs
Message-ID: <20190711164353.GS7234@tuxbook-pro>
References: <20190706203105.7810-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190706203105.7810-1-robdclark@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 06 Jul 13:31 PDT 2019, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> This should be more future-proof if we ever encounter a device with two
> of these bridges.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index c8fb45e7b06d..9f4ff88d4a10 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -204,7 +204,7 @@ DEFINE_SHOW_ATTRIBUTE(status);
>  
>  static void ti_sn_debugfs_init(struct ti_sn_bridge *pdata)
>  {
> -	pdata->debugfs = debugfs_create_dir("ti_sn65dsi86", NULL);
> +	pdata->debugfs = debugfs_create_dir(dev_name(pdata->dev), NULL);
>  
>  	debugfs_create_file("status", 0600, pdata->debugfs, pdata,
>  			&status_fops);
> -- 
> 2.20.1
> 
