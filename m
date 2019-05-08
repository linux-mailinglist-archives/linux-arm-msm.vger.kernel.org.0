Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D90601810E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 22:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729150AbfEHU1Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 16:27:24 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:39350 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729144AbfEHU1Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 16:27:24 -0400
Received: by mail-qt1-f193.google.com with SMTP id y42so5359059qtk.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2019 13:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y1oAL2e+nDxNSlN8Pn+qOcIb2+7Ea2X17YXpRqljKsI=;
        b=JYS8nhvWxAfBtVu9xdrLwq3zymLBJolq7Z9h0ZdiIgsCPff2mlXK3P72whWTnh4qGo
         Ovg1aPAs0W8mSKgvaqdCikqOluGa84/dKcPAijH55blUXF4x6wpB06Gv7KbwF80938Wm
         XLa66QvaPs8fLJ/hTq3p38J3z9RxOCvASvTkW3wDhvZVGQRRP+YAd6Lo3RZywh5rIWIS
         +kpbU+4YKEaRU+N8OXKOx6Fx+ldPmplcErXwrt05qb3uuzpzvUSppLHPCPWX+4XRXvMP
         Iw5H+K1Em7mb34jBBW3APKQTwZr5vmROWfBMkWt6Ga/vrZ57PaRmMhjTJ88APBbAOYDj
         99+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y1oAL2e+nDxNSlN8Pn+qOcIb2+7Ea2X17YXpRqljKsI=;
        b=Si7RIXRHfcTbxVaDtKx0b3S578H28UT44VLmsqf2oHRO63IEgwCTSc2oRpNYsJPl7N
         WZNCRoLqycJdCYfA/V7p5FvI+hV5LM/KrniJomBQP97SzPlAnS2AbISi9Q3jB5Ce6KXb
         gnHHlkj1gt9b7PQh9x3uXB4F5MxHKJqHz5/wSojVJJKticB5gN1wjz0k/EHb2XkQCeqO
         aebHoR6BHahfnwl45L11Ru3PYbG/c7do4IetC6kKObwNIWRQe9FqvooQc9VDf1tfDaTX
         L7ACbBxtEfufarYv7NQMWgHHwGrx7LPnMsLEjPXeJt4quNQnr1TC2S4me1ROzU5T9ZnV
         j/ZA==
X-Gm-Message-State: APjAAAXWANdmX8m0zLUwvllnnc8LgsgKKjwLTVAD6plcEl1HvYdD9MWw
        xAC1AMWKES1RP5jnfjqs2i8Smw==
X-Google-Smtp-Source: APXvYqxI348a5G44Us1OX3HYd/MQ95CBhXbRtWT/DUszb4SCQek/YD2KQUahgddFgYiOum1m0aUGCA==
X-Received: by 2002:ad4:4587:: with SMTP id x7mr164380qvu.192.1557347243293;
        Wed, 08 May 2019 13:27:23 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id n66sm9721679qkc.36.2019.05.08.13.27.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 13:27:22 -0700 (PDT)
Date:   Wed, 8 May 2019 16:27:21 -0400
From:   Sean Paul <sean@poorly.run>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a6xx: No zap shader is not an error
Message-ID: <20190508202721.GL17077@art_vandelay>
References: <20190508130726.27557-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190508130726.27557-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 08, 2019 at 06:06:52AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Depending on platform firmware, a zap shader may not be required to take
> the GPU out of secure mode on boot, in which case we can just write
> RBBM_SECVID_TRUST_CNTL directly.  Which we *mostly* handled, but missed
> clearing 'ret' resulting that hw_init() returned an error on these
> devices.
> 
> Fixes: abccb9fe3267 drm/msm/a6xx: Add zap shader load
> Signed-off-by: Rob Clark <robdclark@chromium.org>

As discussed on IRC, I've stuffed this in -misc-next-fixes for the next PR I'm
sending out.

Sean

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index ec24508b9d68..e74dce474250 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -527,6 +527,7 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>  		dev_warn_once(gpu->dev->dev,
>  			"Zap shader not enabled - using SECVID_TRUST_CNTL instead\n");
>  		gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> +		ret = 0;
>  	}
>  
>  out:
> -- 
> 2.20.1
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
