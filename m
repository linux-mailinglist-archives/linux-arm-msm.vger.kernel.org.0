Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B22AD38B439
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 18:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbhETQau (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 12:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233899AbhETQat (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 12:30:49 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC7FC06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 09:29:27 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id i17so18281015wrq.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=7gQAHjRkLz/zMdR9mZ20XGXZokHUiVVILLkWbVKY8vk=;
        b=cfxPfL5fE4np3aef6bq9mbEbsf+V7xoFH7lEgZwO4Pdk/oIevk19Q3UyCSV9vCBR57
         oqDSJZrYGS54dgw1cyxBLzrZ9nUvG4J7evXugn3/Hrkt2MbKDwd4terqRk3pzf997Vak
         U6KAj9L1Il+SoamKwZJ4AlfDNCbUAwVjuKR+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=7gQAHjRkLz/zMdR9mZ20XGXZokHUiVVILLkWbVKY8vk=;
        b=EAtIFACVujOXYF8njtb/3E0JrpViPvY19bqCxAaCSueqkY9+4ley/K4fOntad+aNZ0
         s0WeZqWN/WAkaq39hxESrPun77dKwcEJo8WmTx4VpIy59m6H6vMpLmnIcncKZFnpMWtD
         iII8bbK5Xw/UAdq2AC/8YpVIOXMz5HLCwz/X9GYfGnoYZ9YEL6E0HAJcnOWgpMCTakEu
         9omw6OlrMYAk5I8Yf9DSqNPPIdFvQ01+foywfuuUMtEmx2TGNBFP7dN6XuPDlo1yAafN
         q2Wv5elpjoKEZu5jv+rx1bx7VttGXCvX3hwwP5kLj6Gl0sBgNgR2yFplYcGXdynCoX6z
         jEbQ==
X-Gm-Message-State: AOAM531kXwLMR2jJMynetqf0dA+LGCdjRspT5f9U6jzI2k5VgsDI/AOW
        a0T1t7YfEcSXNuWXcx+Slg3SvE+3UMbWbA==
X-Google-Smtp-Source: ABdhPJx7W+fNXWLlfVnpy0Ca20BF42f6arhZCvq55cuTsYgbnk9UslMHeFLkM6bUwg6sp/BGFgOCqQ==
X-Received: by 2002:a5d:6683:: with SMTP id l3mr5097252wru.398.1621528165809;
        Thu, 20 May 2021 09:29:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id g4sm3156003wmk.45.2021.05.20.09.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 09:29:25 -0700 (PDT)
Date:   Thu, 20 May 2021 18:29:23 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>,
        Matthew Brost <matthew.brost@intel.com>
Subject: Re: [RFC 2/3] drm/atomic: Call dma_fence_boost() when we've missed a
 vblank
Message-ID: <YKaOY3AWgHh5kplS@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        open list <linux-kernel@vger.kernel.org>,
        Matthew Brost <matthew.brost@intel.com>
References: <20210519183855.1523927-1-robdclark@gmail.com>
 <20210519183855.1523927-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519183855.1523927-3-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 19, 2021 at 11:38:53AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 560aaecba31b..fe10fc2e7f86 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1435,11 +1435,15 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
>  	int i, ret;
>  
>  	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
> +		u64 vblank_count;
> +
>  		if (!new_plane_state->fence)
>  			continue;
>  
>  		WARN_ON(!new_plane_state->fb);
>  
> +		vblank_count = drm_crtc_vblank_count(new_plane_state->crtc);
> +
>  		/*
>  		 * If waiting for fences pre-swap (ie: nonblock), userspace can
>  		 * still interrupt the operation. Instead of blocking until the
> @@ -1449,6 +1453,13 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
>  		if (ret)
>  			return ret;
>  
> +		/*
> +		 * Check if we've missed a vblank while waiting, and if we have
> +		 * signal the fence that it's signaler should be boosted
> +		 */
> +		if (vblank_count != drm_crtc_vblank_count(new_plane_state->crtc))
> +			dma_fence_boost(new_plane_state->fence);

I think we should do a lot better here:
- maybe only bother doing this for single-crtc updates, and only if
  modeset isn't set. No one else cares about latency.

- We should boost _right_ when we've missed the frame, so I think we
  should have a _timeout wait here that guesstimates when the vblank is
  over (might need to throw in a vblank wait if we missed) and then boost
  immediately. Not wait a bunch of frames (worst case) until we finally
  decide to boost.

Otherwise I really like this, I think it's about the only real reason i915
isn't using atomic helpers.

Also adding Matt B for this topic.
-Daniel

> +
>  		dma_fence_put(new_plane_state->fence);
>  		new_plane_state->fence = NULL;
>  	}
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
