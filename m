Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55C69D30D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 20:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbfJJSqW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 14:46:22 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:34980 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727195AbfJJSpq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 14:45:46 -0400
Received: by mail-yb1-f193.google.com with SMTP id f4so2282884ybm.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2019 11:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=A/ttt3bFmMs3oe08RcmXuhu4LizkiCyYFIE0laa45So=;
        b=IyjR386BAgPPWowRuqUZTRmePv2ormX4YmToHCVqZVPMdy7A3ol3aZwvXdIydzup9K
         przYrp1X0Hv1wH8j6k0fnoNR5Pl9UkSctcdX23cXDOxQ6R54KO/UfVG7tOVLbwdpuls5
         oxPa8TshABAWqRdYX5+QCIONLi/e3rSqLbVNV2+bsjDegRpDiCYXWUFhnrD/YsPxXc6l
         kMw8l9PgWqLd+n+Aqv3piQLUzjoywgzTh7ISxEKBTfPvQQDF5B4Jtfi/qRxqTT42N1cW
         fJZW3r8z7gW9RgQcC8KX+qOHw9k3xrwWRaXWPBPtauKpuV2lr0qgjs/CMsahE6havdRp
         qAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=A/ttt3bFmMs3oe08RcmXuhu4LizkiCyYFIE0laa45So=;
        b=YdSp2kx6Lv9nKa2QMUDtCBRnKTpLkDgjfaXb3IfoWlJ+kYog1IONk4pjyl0+vb8dAw
         h2z+TQWD3DSMmkZwzq6uydn83OJtMTN/gQBpbJf5uTJF0JYwUhrjhpJfDTRy5On8WnTx
         XUwQVDJpUffY6nV4Gxmou4JtZhQ3wK1OF+6yPnzpdCAJ21SDya+8Zej7yPdBT+RAUy8w
         5SEqh73iwgQ0eKyJqPWh3EpZbEE28WIDSv4rGbjwkxilsew/ZbMMJ8tMWEs9ZRQTrhrv
         AOQMH+ELObSAXMGIdgCrCXpWSaYWyxMQU7hVTl7FxxdP7VkZKvTmaHwDXCeDIdCRkDlZ
         Mr4w==
X-Gm-Message-State: APjAAAW5kTMR/9tDrccJU0pEHmtFe/C/8mlsR2iMkJubg65g72spB/BM
        XylyhYqou0jRHTaIaWV4dyeRkw==
X-Google-Smtp-Source: APXvYqyh33T1BNbWlgbA1o9hie13mRU+C4O0G5oOi8OvRSwg6vQv6oB4PiTNCKeHDoJbj82grAWYzw==
X-Received: by 2002:a25:84ce:: with SMTP id x14mr7606863ybm.437.1570733145768;
        Thu, 10 Oct 2019 11:45:45 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id y129sm1682398ywy.41.2019.10.10.11.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 11:45:45 -0700 (PDT)
Date:   Thu, 10 Oct 2019 14:45:44 -0400
From:   Sean Paul <sean@poorly.run>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: Implement reset correctly
Message-ID: <20191010184544.GK85762@art_vandelay>
References: <20191009213454.32891-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009213454.32891-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 09, 2019 at 02:34:54PM -0700, Jeffrey Hugo wrote:
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
> ---
> 
> Rob et al, is it possible for this to go into a 5.4-rc?
> 
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 663ff9f4fac9..68ded9b4735d 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -986,7 +986,7 @@ static void dsi_sw_reset(struct msm_dsi_host *msm_host)
>  	wmb(); /* clocks need to be enabled before reset */
>  
>  	dsi_write(msm_host, REG_DSI_RESET, 1);
> -	wmb(); /* make sure reset happen */
> +	msleep(20); /* make sure reset happen */

Could you please pull this out into a #define used for both in case we decide to
tweak it? I don't want these 2 values to drift.

Thanks,
Sean

>  	dsi_write(msm_host, REG_DSI_RESET, 0);
>  }
>  
> @@ -1396,7 +1396,7 @@ static void dsi_sw_reset_restore(struct msm_dsi_host *msm_host)
>  
>  	/* dsi controller can only be reset while clocks are running */
>  	dsi_write(msm_host, REG_DSI_RESET, 1);
> -	wmb();	/* make sure reset happen */
> +	msleep(20);	/* make sure reset happen */
>  	dsi_write(msm_host, REG_DSI_RESET, 0);
>  	wmb();	/* controller out of reset */
>  	dsi_write(msm_host, REG_DSI_CTRL, data0);
> -- 
> 2.17.1
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
