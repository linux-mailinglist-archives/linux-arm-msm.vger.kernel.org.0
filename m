Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BCCBD4159
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 15:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbfJKNdg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 09:33:36 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:39509 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727709AbfJKNdg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 09:33:36 -0400
Received: by mail-yb1-f193.google.com with SMTP id z2so62019ybn.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2019 06:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fUil4PoJuD217jBcYYSLeRYNO6tcCPLO0H6A/GL9Qb8=;
        b=O422ed7PWUyW1Vzn5pbCWtIZZc1J4f5CowakBf6mIxWgN9lTJR9Bju9h4aEOqtMDib
         OE0ugE4UNAj1Gk0cMxFAqvT8TERSZw6QkCvMu8s/3AQM0Du6AqjwC1gCDJcfslECF8RJ
         BIR2qh22F38mzl/j45Vt8KXHdg4B41oZcG1LGffHLAPEh8iWeTTKxShxYSBNM68jmpUY
         PpgC9TvNNBFRNSPXQ/LkDa+RyY66DXN5+Pj7t4qnk5mZrhitRAAHMCiv8dbseYfQqFBd
         2sn/xsnL0JwSd3HiWp27U08UTxx1D/VOr1t83xGEop//1jwsDQe36LUWDaeMoWNUrmgr
         3btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fUil4PoJuD217jBcYYSLeRYNO6tcCPLO0H6A/GL9Qb8=;
        b=G68xIZ/v08s35WhX0/I/V1iKe6X1zTycmmqLBGlbIyDiO+BHYkqEoi50blaOm/utlU
         ZeiKRYerEBbgx3FqlJP8lpVs2E6+GpmteIlR6Cb0zpWqS7XTPOjAdlSvqSjeENgaGtBL
         WbvYrfjBqD5S6aln/z4jNBmRTuYTVvRUtaQrCB41ePsB2JCZvO+d/9wSyux7LaLi13yl
         P0PPrRamNZ73qGadr1sIGKZYBQgeu3URGc+iaj0ymoT9za3/MV6J4qLFMBBhAb1ONqsN
         hfaaaMsTjVMnYLGzi4DY6gLfjBsBujWylj27BcOUPkvdSxye3WKprQUgpLaSa/4RKX/J
         D/AQ==
X-Gm-Message-State: APjAAAW+CVa29UVtHU23fmJ7V4fI+BtQBI/ctkrp1CYdX2/ENEMq6Ogl
        iDVuuSvbz/kMUE8jb1bqyIyKhw==
X-Google-Smtp-Source: APXvYqw0+xpWVbu3xuxTg7yss9b7ljSK7TFA5YBYlmLO0kEY9f0KN3BDNx+lWozZjo2Mvwl2v66Hzw==
X-Received: by 2002:a25:42:: with SMTP id 63mr10100988yba.262.1570800815687;
        Fri, 11 Oct 2019 06:33:35 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id p128sm2279522ywp.80.2019.10.11.06.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 06:33:35 -0700 (PDT)
Date:   Fri, 11 Oct 2019 09:33:34 -0400
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/msm: Sanitize the modeset_is_locked checks in dpu
Message-ID: <20191011133334.GS85762@art_vandelay>
References: <CAKMK7uF2HsM5WrC5j_WNXWDjkXTyK5tP2DuoRt78FeaL5791QA@mail.gmail.com>
 <20191010181801.186069-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010181801.186069-1-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 10, 2019 at 02:17:44PM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> As Daniel mentions in his email [1], non-blocking commits don't hold the
> modeset locks, so we can safely access state as long as these functions
> are in the commit path. So remove the WARN_ON in dpu_kms_encoder_enable.
> 
> In dpu_crtc_get_intf_mode, things are a bit more complicated. So keep
> the WARN_ON, but add a comment explaining the situation and hope someone
> comes along and fixes the issue.
> 
> [1]- https://lists.freedesktop.org/archives/dri-devel/2019-October/239441.html
> 
> Link to v1: https://patchwork.freedesktop.org/patch/msgid/20191010151351.126735-1-sean@poorly.run
> 
> Changes in v2:
> - Restored the WARN_ON in get_intf_mode and added a clarifying comment (Daniel)
> 
> Fixes: 1dfdb0e107db ("drm/msm: dpu: Add modeset lock checks where applicable")
> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Partially-Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Applied to msm-next with danvet's full irc r-b, thanks for the report and
review!

Sean

> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 9 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 1 -
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 0b9dc042d2e22..f197dce545761 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -271,6 +271,15 @@ enum dpu_intf_mode dpu_crtc_get_intf_mode(struct drm_crtc *crtc)
>  		return INTF_MODE_NONE;
>  	}
>  
> +	/*
> +	 * TODO: This function is called from dpu debugfs and as part of atomic
> +	 * check. When called from debugfs, the crtc->mutex must be held to
> +	 * read crtc->state. However reading crtc->state from atomic check isn't
> +	 * allowed (unless you have a good reason, a big comment, and a deep
> +	 * understanding of how the atomic/modeset locks work (<- and this is
> +	 * probably not possible)). So we'll keep the WARN_ON here for now, but
> +	 * really we need to figure out a better way to track our operating mode
> +	 */
>  	WARN_ON(!drm_modeset_is_locked(&crtc->mutex));
>  
>  	/* TODO: Returns the first INTF_MODE, could there be multiple values? */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index b1645ad83a1e1..6c92f0fbeac98 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -316,7 +316,6 @@ void dpu_kms_encoder_enable(struct drm_encoder *encoder)
>  	if (funcs && funcs->commit)
>  		funcs->commit(encoder);
>  
> -	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
>  	drm_for_each_crtc(crtc, dev) {
>  		if (!(crtc->state->encoder_mask & drm_encoder_mask(encoder)))
>  			continue;
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
