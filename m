Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15C5111EB8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2019 21:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728896AbfLMUIx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Dec 2019 15:08:53 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51961 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728891AbfLMUIx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Dec 2019 15:08:53 -0500
Received: by mail-wm1-f66.google.com with SMTP id d73so66765wmd.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2019 12:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=H4QwAX578NY4fhI+sexkPafex0WzGNL1MXJ3Dsnaavg=;
        b=ClR4vATi0lm/uR4AjmPvrLE1sJpqCemORzYcQ1ZyCMyMDz9nHE7MjkPPAbq2CwQUh4
         oCFzPzHDk+crtp1Wxw0tE8XY30FJKStbV5hn/qEcio8bHD8pIbcEYMlxJwKeeleN9dY2
         TdkBmKhNDVwIPzaUbzRIdJqvttbpH6SBk6j+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H4QwAX578NY4fhI+sexkPafex0WzGNL1MXJ3Dsnaavg=;
        b=fSipB1J0psY0yjgIOKGds6zRJZbBHQer6vDFl6m8mmu+bdGoVSag3AyRJWzmQgLZ3s
         w+geyzgKO//6aDSHFEBWauaSwz+mMehKfRIaP7IroGTZc72FAdIfGFM1zbPFWtzNqR8D
         eACnizfTPYrLO6sXd3WmK+xtGvh8j344e2fMwEnovEwrbwUl0viDkxbkAkk9wEqRvaI+
         Dti1IJu2aYDSfM91EQb3PsLR46J3bAmfv0vB/hpwEMPsz/irljf4eZNGj7Hi/fu7Tukz
         BR/8HsKonu512YZt2pQp4q8v6cqQBOhy7nESWx85AiFhq2mNLy4BvO5a3HUmsHLyB5pa
         aEag==
X-Gm-Message-State: APjAAAV/buryacHARdqXaBTvj2Ltydm0xQFF1Nxr0cyaraEGob6fWSeq
        Iawl4J5b42hV6vNBDEs0/2jk7U5whd4=
X-Google-Smtp-Source: APXvYqzX6tiAiCD80RNWHMwm27uqrP0XdXvT5VcypsRlEX/9sHkfmDkuq4dAFfmPiG9IIWxysxsJ7A==
X-Received: by 2002:a05:600c:388:: with SMTP id w8mr15123380wmd.177.1576267730921;
        Fri, 13 Dec 2019 12:08:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
        by smtp.gmail.com with ESMTPSA id f1sm11018229wru.6.2019.12.13.12.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 12:08:50 -0800 (PST)
Date:   Fri, 13 Dec 2019 21:08:48 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/msm: Use dma_resv locking wrappers
Message-ID: <20191213200848.GL624164@phenom.ffwll.local>
References: <20191125094356.161941-1-daniel.vetter@ffwll.ch>
 <20191125094356.161941-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191125094356.161941-4-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 25, 2019 at 10:43:55AM +0100, Daniel Vetter wrote:
> I'll add more fancy logic to them soon, so everyone really has to use
> them. Plus they already provide some nice additional debug
> infrastructure on top of direct ww_mutex usage for the fences tracked
> by dma_resv.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org

Ping for some review/acks.

Thanks, Daniel

> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 7d04c47d0023..385d4965a8d0 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -157,7 +157,7 @@ static void submit_unlock_unpin_bo(struct msm_gem_submit *submit,
>  		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
>  
>  	if (submit->bos[i].flags & BO_LOCKED)
> -		ww_mutex_unlock(&msm_obj->base.resv->lock);
> +		dma_resv_unlock(msm_obj->base.resv);
>  
>  	if (backoff && !(submit->bos[i].flags & BO_VALID))
>  		submit->bos[i].iova = 0;
> @@ -180,8 +180,8 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
>  		contended = i;
>  
>  		if (!(submit->bos[i].flags & BO_LOCKED)) {
> -			ret = ww_mutex_lock_interruptible(&msm_obj->base.resv->lock,
> -					&submit->ticket);
> +			ret = dma_resv_lock_interruptible(msm_obj->base.resv,
> +							  &submit->ticket);
>  			if (ret)
>  				goto fail;
>  			submit->bos[i].flags |= BO_LOCKED;
> @@ -202,8 +202,8 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
>  	if (ret == -EDEADLK) {
>  		struct msm_gem_object *msm_obj = submit->bos[contended].obj;
>  		/* we lost out in a seqno race, lock and retry.. */
> -		ret = ww_mutex_lock_slow_interruptible(&msm_obj->base.resv->lock,
> -				&submit->ticket);
> +		ret = dma_resv_lock_slow_interruptible(msm_obj->base.resv,
> +						       &submit->ticket);
>  		if (!ret) {
>  			submit->bos[contended].flags |= BO_LOCKED;
>  			slow_locked = contended;
> -- 
> 2.24.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
