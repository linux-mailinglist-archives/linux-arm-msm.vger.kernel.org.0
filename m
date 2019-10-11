Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F973D4731
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 20:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728706AbfJKSHZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 14:07:25 -0400
Received: from mail-yb1-f195.google.com ([209.85.219.195]:45944 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728472AbfJKSHZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 14:07:25 -0400
Received: by mail-yb1-f195.google.com with SMTP id q143so3373033ybg.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2019 11:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ae+CRQiYhqHuHpTU1rVoJFXnmT5FdFQC0MsNbt69cOk=;
        b=DtiL00gBcmYanmOmHkuFkkt3VtSEhqSZpbvoOK/nOgtBfawkdPlD/l6vqcb3QOhbwo
         gwJKpz3ZOl0/VeGVB2rK7f0iRxJ5D2PgFe7RQwCq9v2cZIED9opjcMvvw6doH7QaAKtc
         vuaqOUEGZgridO5wAwIxVfgsid/a/Va3CJWPHd54HjHQDIIK72ChQEXuadADhkyqYeZ4
         vJLYZwN+V1K1DK4m1uc71eSsRDkZThgN75mKpXBTQ4XHfGImxVhH7ZxiN9g3xyIe1xIx
         +hC3Aq1Mw3lztzwedCBnYvYC5npK59SBnSxUtBTi1khNAEFToTyo+DSo+LrhXAcrtWvH
         IemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ae+CRQiYhqHuHpTU1rVoJFXnmT5FdFQC0MsNbt69cOk=;
        b=bsTj76dPe0lU/zL/Jr9GwAx+Ry9UEyLxnvMce6DrIANafPStJD8Rsd3FngW0oYp972
         hx20smp+td+1TL+Cii21LLLl4X+qrhqtDzFE+VncYs6KZLq1d4TpLL93YTSBe/Hq5TFh
         kRMyrrDxm1nFbwsuxr3fGhB0y/qKvZP85vUJTw/3QsdKLkEy31KIMTvUxUpdhjDygIuX
         HxxeWTAio+FvEfrWMhSGAJ9QOd/n0SyBBjnbX3WRMDGldSx+Gw1VSWIv8sjDPEeWqON2
         MjY6pZ/iK6MQWonDD9shzVRX9eoGTIYU2vfKUoDHEaFwI23+G/AKONf8J0G7OTkew6ux
         S2IQ==
X-Gm-Message-State: APjAAAUa+fnsZ/Nb2JaZaXKHc+DAUCvOWAoW7ZqHVtbscUGfzCFPeVpg
        fiyHTiQOdHD3TNqSxQGXKEeofA==
X-Google-Smtp-Source: APXvYqyLFQRkBuuFsPRJRvEzimdiSeDDu7y4rtmiy717/O74e9n4vUvEF72u5cL+4a7xJET3hyXLEg==
X-Received: by 2002:a25:2313:: with SMTP id j19mr10529925ybj.400.1570817244160;
        Fri, 11 Oct 2019 11:07:24 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id g128sm2293047ywb.13.2019.10.11.11.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 11:07:23 -0700 (PDT)
Date:   Fri, 11 Oct 2019 14:07:22 -0400
From:   Sean Paul <sean@poorly.run>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dsi: Implement reset correctly
Message-ID: <20191011180722.GU85762@art_vandelay>
References: <20191011133939.16551-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011133939.16551-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 11, 2019 at 06:39:39AM -0700, Jeffrey Hugo wrote:
> On msm8998, vblank timeouts are observed because the DSI controller is not
> reset properly, which ends up stalling the MDP.  This is because the reset
> logic is not correct per the hardware documentation.
> 
> The documentation states that after asserting reset, software should wait
> some time (no indication of how long), or poll the status register until it
> returns 0 before deasserting reset.
> 
> wmb() is insufficient for this purpose since it just ensures ordering, not
> timing between writes.  Since asserting and deasserting reset occurs on the
> same register, ordering is already guaranteed by the architecture, making
> the wmb extraneous.
> 
> Since we would define a timeout for polling the status register to avoid a
> possible infinite loop, lets just use a static delay of 20 ms, since 16.666
> ms is the time available to process one frame at 60 fps.
> 
> Fixes: a689554ba6ed (drm/msm: Initial add DSI connector support)
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

Pushed to drm-misc-fixes for 5.4

Thanks!

Sean

> Reviewed-by: Sean Paul <sean@poorly.run>
> ---
> 
> v2:
> -make a DEFINE for the delay
> 
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 663ff9f4fac9..9a81705301c6 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -26,6 +26,8 @@
>  #include "dsi_cfg.h"
>  #include "msm_kms.h"
>  
> +#define RESET_DELAY 20
> +
>  static int dsi_get_version(const void __iomem *base, u32 *major, u32 *minor)
>  {
>  	u32 ver;
> @@ -986,7 +988,7 @@ static void dsi_sw_reset(struct msm_dsi_host *msm_host)
>  	wmb(); /* clocks need to be enabled before reset */
>  
>  	dsi_write(msm_host, REG_DSI_RESET, 1);
> -	wmb(); /* make sure reset happen */
> +	msleep(RESET_DELAY); /* make sure reset happen */
>  	dsi_write(msm_host, REG_DSI_RESET, 0);
>  }
>  
> @@ -1396,7 +1398,7 @@ static void dsi_sw_reset_restore(struct msm_dsi_host *msm_host)
>  
>  	/* dsi controller can only be reset while clocks are running */
>  	dsi_write(msm_host, REG_DSI_RESET, 1);
> -	wmb();	/* make sure reset happen */
> +	msleep(RESET_DELAY);	/* make sure reset happen */
>  	dsi_write(msm_host, REG_DSI_RESET, 0);
>  	wmb();	/* controller out of reset */
>  	dsi_write(msm_host, REG_DSI_CTRL, data0);
> -- 
> 2.17.1
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
