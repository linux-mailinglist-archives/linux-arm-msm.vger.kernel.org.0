Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCEBD173ED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 10:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfEHIfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 04:35:25 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42736 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbfEHIfY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 04:35:24 -0400
Received: by mail-ed1-f67.google.com with SMTP id l25so21290082eda.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2019 01:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=O82OgpfzeDh2UEeB/vmic+hMxc9DH+yp719HK/Iv7xI=;
        b=bI+OTnFQBhAMy/Fosn0WFLRAjME86sn9+AY2pJSC/YisVJpsAi3ITxRhfc+MXIkAcO
         2xPP+zbqNdgib/BoAt3L0GfsYBQ5EAC4h+HB97Ud18Rm8WZSEl1Jala96sRo/86WW6BW
         NLiHu2roFj/eR4y3VgLe5lQ3BFFna8Yrm2nvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=O82OgpfzeDh2UEeB/vmic+hMxc9DH+yp719HK/Iv7xI=;
        b=gIwFU/nS33pA9rK10VBOI2gyr75zeiSWlWulhiAzvPX+20ZZ+aNHcH8xqvB22yq8cq
         6lLishDV498sig6it3G1UmL2tkejKeBLD6RDyWR6634qQOG6oCfNBi261Qsb+dzEDF8g
         rj7kl9geOh5enkO42viJ2JK4HKBvlmCODNx7HwC0/CGmrhlIarNYlOzMvtUHbVHIYcUx
         cei4oZUdNv0/mP0KNlevOhePaRPFVkIHCndY7W8wn4eEu/xiDye/k8hfBETSWYk4ASyd
         SPkXsbH4Jlc9P7XuDZhwIhd03bXUvzOOFpTt0Rrzx3dl4vcHyiqrx/8vmCM4G8jxDjuu
         GkrA==
X-Gm-Message-State: APjAAAXo2up7PUpy6CO3w/Tp6iraLT1y9SOyf6kddISPeiUigJFnU8HA
        gSHwcalvMDrQ36r6qN1HszExdVtVMBg=
X-Google-Smtp-Source: APXvYqxGx8OsiIdz2sy8/idKb8APDa8zpodaXm0vDZ+ekASTAgEhxUCZYEn7hnen6RqRvgXKmM2T6g==
X-Received: by 2002:a50:87ab:: with SMTP id a40mr36539324eda.188.1557304523070;
        Wed, 08 May 2019 01:35:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id y13sm3739593edp.77.2019.05.08.01.35.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 01:35:22 -0700 (PDT)
Date:   Wed, 8 May 2019 10:35:19 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/atomic: Check that the config funcs exist
 drm_mode_alloc
Message-ID: <20190508083519.GS17751@phenom.ffwll.local>
Mail-Followup-To: Jordan Crouse <jcrouse@codeaurora.org>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>
References: <1557256451-24950-1-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557256451-24950-1-git-send-email-jcrouse@codeaurora.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 07, 2019 at 01:14:11PM -0600, Jordan Crouse wrote:
> An error while initializing the msm driver ends up calling
> drm_atomic_helper_shutdown() without first initializing the funcs
> in mode_config. While I'm not 100% sure this isn't a ordering
> problem in msm adding a check to drm_mode_alloc seems like
> a nice and safe solution.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

Hm yeah this looks a bit too much like ducttape. I think Noralf started
working on some ideas of devm-like automatic cleanup for drm stuff (we
cannot use devm, that has the wrong lifetimes, despite all the drivers
using it).

Simple fix would be to move up the assignment of config.funcs to be much
earlier in your driver load I guess.
-Daniel

> ---
> 
>  drivers/gpu/drm/drm_atomic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 5eb4013..1729428 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -114,6 +114,9 @@ drm_atomic_state_alloc(struct drm_device *dev)
>  {
>  	struct drm_mode_config *config = &dev->mode_config;
>  
> +	if (!config->funcs)
> +		return NULL;
> +
>  	if (!config->funcs->atomic_state_alloc) {
>  		struct drm_atomic_state *state;
>  
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
