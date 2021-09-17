Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 508E240FC51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 17:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238756AbhIQPbY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 11:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237217AbhIQPbX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 11:31:23 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27E8C061766
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Sep 2021 08:30:00 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id 62so6623491qvb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Sep 2021 08:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KHwshkfOobpUiyWJGT/sc1wahk7nb4ZeHc0Yrl5d/XE=;
        b=POwr8Ra8WFfBSIMITD2RubEZl7eQfdxtM2iafMf/fkRw/O+0FXSaT37UzJjFF6WEfY
         r/ZBrJdjRnRpamNC9aRJ1AE5ZJoSZE9Obu1M9D22mRc3d3BpvR/jtVTFwXIisu23LpFJ
         XEp9DzMqgBGkEUNDJVJE+6YIG7tSVb73g5w5svj0+P+FLbCtLlpMctxdT0U/eNwgyXnb
         2mgatcLE6eh+reSYTc3tuviRvzBcIVL1EiSNkOtKAdGurf/Y8jyfmW5/isZj5/RHXrfL
         ZbD/JWXYuzDApDVyj9fuAE+huZIcVgoKOl335Rq4RQYhkcxZ5YO7qEOulnJhbrJKy8Ri
         jVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KHwshkfOobpUiyWJGT/sc1wahk7nb4ZeHc0Yrl5d/XE=;
        b=XEL3mzcEaYyUmwNubWQ2ZVHbzjlsSfIRiBOHW3+jYYsb2a7AmOrG0Y0OlML/IMSNtM
         D+ZncLk9wjC7a1wHEg21+IVr5uDTPlaBw8COzd27PPyux8g3JITTwYnMNH2zBX5u5PpR
         lSWSCr7P+NfhP3VXWKhKDq0sHJdbumaYmEXH2SNSlpn5ZL9U28tr2lUPk0DbXvEwghep
         aqdWBIKX3p/flR539zhkAXjYrmQBZxYyj5WxBM05gQ0P5RkQV6b0RQTs0ssgADdu9/WZ
         ctguChfG+KoWzxU4mW24xFAAkBpGLOEfZcJaH487gqY5kuW3X5QeGrPUleccVrxo1Cl6
         iJyw==
X-Gm-Message-State: AOAM533mvhDjGp6eWTkFfdi1gYk+gldFz492an2hH7y6hMp8WbHhp4kv
        F9q30piNxG0BXAwHaiHUE05c2Q==
X-Google-Smtp-Source: ABdhPJxcvW7W0tARlYdMMJe31mvKvNKzlAuHtXTRLEKdzmQR28z2qSx8xt0LJQWOFiPpYF3QvOWqdw==
X-Received: by 2002:a0c:dc12:: with SMTP id s18mr11664646qvk.67.1631892600201;
        Fri, 17 Sep 2021 08:30:00 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id s10sm4855841qko.134.2021.09.17.08.29.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Sep 2021 08:29:59 -0700 (PDT)
Date:   Fri, 17 Sep 2021 11:29:58 -0400
From:   Sean Paul <sean@poorly.run>
To:     Fernando Ramos <greenfoo@u92.eu>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        sean@poorly.run, linux-doc@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 03/15] dmr/msm: cleanup: drm_modeset_lock_all_ctx() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <20210917152958.GB2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-4-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-4-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 16, 2021 at 11:15:40PM +0200, Fernando Ramos wrote:
> As requested in Documentation/gpu/todo.rst, replace the boilerplate code
> surrounding drm_modeset_lock_all_ctx() with DRM_MODESET_LOCK_ALL_BEGIN()
> and DRM_MODESET_LOCK_ALL_END()
> 

With the subject fixed (s/dmr/drm/),

Reviewed-by: Sean Paul <sean@poorly.run>

> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
> ---
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> index cabe15190ec1..c83db90b0e02 100644
> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> @@ -99,20 +99,18 @@ static void msm_disp_capture_atomic_state(struct msm_disp_state *disp_state)
>  {
>  	struct drm_device *ddev;
>  	struct drm_modeset_acquire_ctx ctx;
> +	int ret;
>  
>  	disp_state->timestamp = ktime_get();
>  
>  	ddev = disp_state->drm_dev;
>  
> -	drm_modeset_acquire_init(&ctx, 0);
> -
> -	while (drm_modeset_lock_all_ctx(ddev, &ctx) != 0)
> -		drm_modeset_backoff(&ctx);
> +	DRM_MODESET_LOCK_ALL_BEGIN(ddev, ctx, 0, ret);
>  
>  	disp_state->atomic_state = drm_atomic_helper_duplicate_state(ddev,
>  			&ctx);
> -	drm_modeset_drop_locks(&ctx);
> -	drm_modeset_acquire_fini(&ctx);
> +
> +	DRM_MODESET_LOCK_ALL_END(ddev, ctx, ret);
>  }
>  
>  void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state)
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
