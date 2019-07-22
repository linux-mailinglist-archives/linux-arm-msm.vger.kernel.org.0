Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3630370850
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 20:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfGVSU2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 14:20:28 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:38223 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbfGVSU2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 14:20:28 -0400
Received: by mail-yb1-f194.google.com with SMTP id j199so15287581ybg.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2019 11:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=i9YD5G8HAMrMrwipZFF5d7e55WgOTsCxcFVl1IuaGhA=;
        b=ak5c6nStqCuj2CKoFKbZr8QeS33wn5Tkzs0ZNi0q36+RLFltvOc0xeXTsHIz3N4UPk
         QJOy5ScCXwQm/3oHhiQaIpuojW2iEccYAtg35XNPm0ZlLjgw08ka4xl+NLI1yhxGKvRH
         j6vEXEAz/p4xsMvBZEflj7DTIX37B05LXzhVk58xGpC2nt+tKbMV5UO2QYXFtxADJcTZ
         0YUjHcpfFssACDyQZD2Pd2K9Emq+rQPEcUhyFCuwv4gM4l86SpyIiOzB215sShGcxpA7
         UtSy4Bplog61zuI3HZX5BnDFxnRFYGq7e2dGsnSFlTGpuk5PKHBcWBEOq9v/k1WxPReP
         E+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i9YD5G8HAMrMrwipZFF5d7e55WgOTsCxcFVl1IuaGhA=;
        b=SDZwgRrD6aV53tK/9sYvYsbZ5NtKMwXfUO6SCALJnNcXHV6IuGPpDKZ8zwgyZH99wK
         69DhXXE3qPabFgskJKHN2myn4Z/7BwsfIvZ5OsMPje+riQH91z7+fhrwaVBNLyn0WdVL
         LdPqhZGaRlMFFs+01b1vgYswTtEcAjQPHa2tOiJrx7qxAZZW30kgqKieFupKlP8Dj1SZ
         qSa8FyvWuhniRZdib3VxB7yzYokIz691v9Spxgoc725GUq0G29BhSkOXRlVbuY1oUKR7
         q9uypkf80L5mvOZtyHbscvhTxldipCHBy8vYH3Cl9i3owu68T2No/l7JZQIXlBxhWJ7m
         35Aw==
X-Gm-Message-State: APjAAAUABlZPlUIa2dtevXhZ8HIkGdS3aRBADrG0ESNGY5rToppG9TIu
        ppdHiRCj9sFfSrOxqvtbmrneNg==
X-Google-Smtp-Source: APXvYqx+kr/znTWvRUNj/wBR92LmePqwvp+IiGg/iAGQJYNSI5XDcmCJwEIZdXRoBik7k6teTSAf5g==
X-Received: by 2002:a5b:405:: with SMTP id m5mr45459571ybp.261.1563819626843;
        Mon, 22 Jul 2019 11:20:26 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id 206sm9444775ywk.44.2019.07.22.11.20.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 11:20:26 -0700 (PDT)
Date:   Mon, 22 Jul 2019 14:20:25 -0400
From:   Sean Paul <sean@poorly.run>
To:     Shubhashree Dhar <dhar@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org, nganji@codeaurora.org,
        jshekhar@codeaurora.org
Subject: Re: drm/msm/dpu: Correct dpu encoder spinlock initialization
Message-ID: <20190722182025.GF104440@art_vandelay>
References: <1561357632-15361-1-git-send-email-dhar@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561357632-15361-1-git-send-email-dhar@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 24, 2019 at 11:57:12AM +0530, Shubhashree Dhar wrote:
> dpu encoder spinlock should be initialized during dpu encoder
> init instead of dpu encoder setup which is part of commit.
> There are chances that vblank control uses the uninitialized
> spinlock if not initialized during encoder init.
> 
> Change-Id: I5a18b95fa47397c834a266b22abf33a517b03a4e
> Signed-off-by: Shubhashree Dhar <dhar@codeaurora.org>

Thanks for your patch.

I've resolved the conflict and tweaked the commit message a bit to reflect
current reality.

Applied to drm-misc-fixes for 5.3

Sean

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 5f085b5..22938c7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2195,8 +2195,6 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>  	if (ret)
>  		goto fail;
>  
> -	spin_lock_init(&dpu_enc->enc_spinlock);
> -
>  	atomic_set(&dpu_enc->frame_done_timeout, 0);
>  	timer_setup(&dpu_enc->frame_done_timer,
>  			dpu_encoder_frame_done_timeout, 0);
> @@ -2250,6 +2248,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>  
>  	drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
>  
> +	spin_lock_init(&dpu_enc->enc_spinlock);
>  	dpu_enc->enabled = false;
>  
>  	return &dpu_enc->base;
> -- 
> 1.9.1
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
