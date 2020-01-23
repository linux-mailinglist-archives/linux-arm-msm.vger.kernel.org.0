Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 787B714719C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 20:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbgAWTQj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 14:16:39 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38464 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728709AbgAWTQj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 14:16:39 -0500
Received: by mail-pg1-f193.google.com with SMTP id a33so1858151pgm.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 11:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6wtdQZE06z+aORJTnpPZKoEwjECFJKRvpZenOyG2pbs=;
        b=fTwlNQnSmBYcTlW2X4DkUAm58zuHxoeu1OEc1vVlBWKcW7LfEspLDnJ4HX4efyba1l
         uObRu4eaRbt9SL8oC69dLx0ZzK8f0kGqGgDXBigb4khY/TnOqcOfpmpj0x3bKD/JteV6
         Jwk1lWXngMbf/5avCtsxAskWpmpWiUPoVg32g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6wtdQZE06z+aORJTnpPZKoEwjECFJKRvpZenOyG2pbs=;
        b=mAvfruo5JhGIVUhc/y3oZutQc8uU2C1POU4MFOkgYCWDrOEFUDekT2U25CkWLwLMuL
         kZqpx8jyRj/UaYrilQIEcCB7+yiUGxMQHxQcoQ0f62CdeoZEaORS1vG9E+oZ4rodhyAy
         2VzrzzQA+JMzvVN/icaVWHUax7iGXQNJ9UrhBqB+FxtXXWaCrTlu98oS0Q6V2jp50nOj
         tycGmPZ5g6O+/g0Ee2MVcY6xb5ty8HWCIk41saBBFnbvuHNfp/oX1GJloNoR7u2OYb4T
         Y0goc9boscbstjp3bArjt1Ear3eIsKvQLZSKVQi4H7+cSnMB13TtcZo7KZnRbrLmhOKt
         nCXA==
X-Gm-Message-State: APjAAAW3mZvsWWgdEDwH5CYmQZoPNl1uhG7bjQCvomQtOK9WNYInsVwm
        tqu3aiomMHpTPTPXflunNOXezA==
X-Google-Smtp-Source: APXvYqw0a9ZjVf1aQi0SykCpNbX3nRr/2knF42uGFzUQInRewtmQbXeOhyiUEjTVPoGuKU6GqXuSJg==
X-Received: by 2002:a65:4d0b:: with SMTP id i11mr336402pgt.340.1579806998644;
        Thu, 23 Jan 2020 11:16:38 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id w8sm3323441pfn.186.2020.01.23.11.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2020 11:16:38 -0800 (PST)
Date:   Thu, 23 Jan 2020 11:16:36 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/msm: Fix a6xx GMU shutdown sequence
Message-ID: <20200123191636.GY89495@google.com>
References: <1579797756-10292-1-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1579797756-10292-1-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jordan,

On Thu, Jan 23, 2020 at 09:42:36AM -0700, Jordan Crouse wrote:
> Commit e812744c5f95 ("drm: msm: a6xx: Add support for A618") missed
> updating the VBIF flush in a6xx_gmu_shutdown and instead
> inserted the new sequence into a6xx_pm_suspend along with a redundant
> GMU idle.
> 
> Move a6xx_bus_clear_pending_transactions to a6xx_gmu.c and use it in
> the appropriate place in the shutdown routine and remove the redundant
> idle call.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 36 +++++++++++++++++++++++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 43 -----------------------------------
>  2 files changed, 31 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 983afea..f371227 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>
> ...
>
>  /* Gracefully try to shut down the GMU and by extension the GPU */
>  static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
>  {
> @@ -819,11 +849,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
>  			return;
>  		}
>  
> -		/* Clear the VBIF pipe before shutting down */
> -		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0xf);
> -		spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) & 0xf)
> -			== 0xf);
> -		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0);
> +		a6xx_bus_clear_pending_transactions(adreno_gpu);

With this the variable 'gpu' isn't used anymore in a6xx_gmu_shutdown(),
please remove it.
