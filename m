Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7584C1F727B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 05:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbgFLDfT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 23:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbgFLDfT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 23:35:19 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830BDC03E96F
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 20:35:17 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id e12so5429667eds.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 20:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JI0DNPn0mw2LeMlZNFJRm1edlcByvB+ztrobwB0kc+E=;
        b=mdLTSaXFlWPjeajIEmpqRY79+v8n+HTgR1ixiGuHs6QowIsjXdzilsXizLL+GazUcG
         L0WBxq2M56fbGgeki9m3OVbU09IzsSHmNA01mr4WtAf0ESZG0a/cDv4u0ncwf4oVjrup
         7Jxsoj5gDHfefQ+3nOSTiJM1SncSGePaZrIhMMoixML/d2XVI28BF40AjeQULB/YLxoQ
         XXqWLzW2y+NoB5Lh2uzgk3tNsOXwtVFjbBZph14hxsOAJnC9ZzCNANqjAxIXOBNvfV0r
         +dGtEnU4XenQZP/X//lu00UwSIsIKGRfEp36uNzzsexNnQQ6lHRsKmZ8oJb+layfj1BW
         1wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JI0DNPn0mw2LeMlZNFJRm1edlcByvB+ztrobwB0kc+E=;
        b=jYv4DMQfaJtUr13iRr+0XzWngK3epfTpnSIvKuoMSerL66/HwbbiWS2q0lUGDKrKwb
         ytBnkjGObjIQep+EEWGOXPRfrkfNj0YSLp2LtEcUif8D6mLhnXJ0m9hEEypUfBq5UDmv
         IC5aIc6CQUR/f9xX4dEmol8Q5HaKdlhfDEPCUs0yLuaAm5LZP8GBQTi8LpJMWqa/mez/
         FN+0/33SayYZ/tAxRy5ajKddT4bGfKHyppuWTSVVycEymYxJTkluYtwOJJVttqMho4/x
         Y6PuIbR9suLqcbDZ+NaydXA7mbMYXFA8X/EWOce1O1Dk3mAKFmYJFcc3PkW91/0/4vOq
         1r9g==
X-Gm-Message-State: AOAM530DAFpdl4UREJjO29jJq9I7BuVsmagCn4nlW+ykrYgfWcQjOdp+
        +ysLekWfRPKYRXTJuomaoPWx/sZ75DAkP+NoANM=
X-Google-Smtp-Source: ABdhPJyKpe0ygVRxt8U4uiWEZG2UakTSkk+OREQUkSZTXvJKUzlUUdzylujk0khPi5w2RtnMhnW2lccL8SConn8oCsE=
X-Received: by 2002:a50:98c1:: with SMTP id j59mr9971040edb.120.1591932916015;
 Thu, 11 Jun 2020 20:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200610004659.10401-1-abhinavk@codeaurora.org>
In-Reply-To: <20200610004659.10401-1-abhinavk@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 11 Jun 2020 20:35:41 -0700
Message-ID: <CAF6AEGsOX_QoOnMhqKuUHhhNjL_PgxF_5O7sYKi1Hkj5FmRpGw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: call drm_mode_config_reset before drm_dev_register
To:     Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>, nganji@codeaurora.org,
        aravindh@codeaurora.org, pdhaval@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 9, 2020 at 5:47 PM Abhinav Kumar <abhinavk@codeaurora.org> wrote:
>
> As per the documentation of drm_dev_register, all drivers should
> call drm_dev_register after all the initialization is completed.
> This also means that drm_mode_config_reset should be done before
> drm_dev_register.
>
> Change the sequence to align with this documentation.
>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>

I assume this is just a cleanup you noticed, and not fixing a bug you
are hitting (in which case I'll pick it up next merge window, rather
than -fixes)

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/msm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 29295dee2a2e..9e77cc7f1fa4 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -538,12 +538,12 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
>                 }
>         }
>
> +       drm_mode_config_reset(ddev);
> +
>         ret = drm_dev_register(ddev, 0);
>         if (ret)
>                 goto err_msm_uninit;
>
> -       drm_mode_config_reset(ddev);
> -
>  #ifdef CONFIG_DRM_FBDEV_EMULATION
>         if (kms && fbdev)
>                 priv->fbdev = msm_fbdev_init(ddev);
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
