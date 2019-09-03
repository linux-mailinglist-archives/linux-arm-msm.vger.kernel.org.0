Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACCBA7501
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2019 22:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfICUfa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Sep 2019 16:35:30 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:45011 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbfICUfa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Sep 2019 16:35:30 -0400
Received: by mail-yw1-f68.google.com with SMTP id l79so6394952ywe.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2019 13:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Pwr73Ifq5MZWDOqqYWVQ92kOUvydUL8kklQud78eUJs=;
        b=ELdqVliyxeTW51ck6ee9Q2LraeCgUxfmOGv6+fiEQimkCVjhBsD0gEFVO66Dbyfn0g
         G1X3aEEQl4YN95BV8MPCAEv3ZTd2YyFmrTZRumnAQnKdQNuknxSIgNveJ2oosciek7Ay
         5oO3x3M3mQsIuE2ARuQ2ETH5jVeeFB2JftVPut9IGtPxIzpczsosbGc0RBiKc/S8z7iL
         uzmOSJxRb3pFLBTCp49IvcL96BhnVEdcQqC6kG3jOLZtMZxtG52TcqTmnYoSBB38oJ0f
         RX8JxSX/FbNQCz5wI14K1b8itHtewNvBXxteMX8t4BIpBcgFU3qWDHRm7L4ykZm9MZNu
         /siA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Pwr73Ifq5MZWDOqqYWVQ92kOUvydUL8kklQud78eUJs=;
        b=RfUiEbgHShKUfvplBOlZlACugA154SgL15lHi/Hr/KYJkATQ22PaeIk6RuT8Bj69oH
         Aaf2oE0TvfMDPf8cX8Yg+4x93k/3/xvDzkxEPfyLA6ear0RCWGEpIRThLXgsRqFjlyy7
         1g+t4yGiWqpxyaIcxyfcb/MIINKag7SjLRoX8K9RU2CdcDIPE8c0duAZratjPNvegSAJ
         eL018geON0uMwJERRjwZOJJAB7BD4j0f8Z8CdVpNEQF8bet2k4mcs4MC5huFwsJLbjsl
         LSl6Utvvkmugy/85tvogPcZPHLIUrw7wSJuI5G5ZG8FuAtMinzll+6wwvgryKjjDXz2S
         IdGQ==
X-Gm-Message-State: APjAAAWkroSbZTRkMDPB6TbDXoRiZTjDb2ibh129VbMHLe/dhYJSP6NP
        TuwAFguRjIMkGeqzU4zOdfB6/g==
X-Google-Smtp-Source: APXvYqwfJOUxosRmo8V5dxesORSeHIuM6ShnQY1aGpiUXTG5KqY5PTIzvrDeoLFx+EYtGBdQr4va3Q==
X-Received: by 2002:a81:84d4:: with SMTP id u203mr26754902ywf.106.1567542929119;
        Tue, 03 Sep 2019 13:35:29 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id g69sm3777935ywb.97.2019.09.03.13.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 13:35:25 -0700 (PDT)
Date:   Tue, 3 Sep 2019 16:35:24 -0400
From:   Sean Paul <sean@poorly.run>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Allison Randal <allison@lohutok.net>,
        Boris Brezillon <bbrezillon@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 06/10] drm/msm: add kms->flush_commit()
Message-ID: <20190903203524.GJ218215@art_vandelay>
References: <20190829164601.11615-1-robdclark@gmail.com>
 <20190829164601.11615-7-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829164601.11615-7-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 29, 2019 at 09:45:14AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add ->flush_commit(crtc_mask).  Currently a no-op, but kms backends
> should migrate writing flush registers to this hook, so we can decouple
> pushing updates to hardware, and flushing the updates.
> 
> Once we add async commit support, the hw updates will be pushed down to
> the hw synchronously, but flushing the updates will be deferred until as
> close to vblank as possible, so that multiple updates can be combined in
> a single frame.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  6 ++++
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  6 ++++
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  6 ++++
>  drivers/gpu/drm/msm/msm_atomic.c         |  9 ++++--
>  drivers/gpu/drm/msm/msm_kms.h            | 40 ++++++++++++++++++++++--
>  5 files changed, 63 insertions(+), 4 deletions(-)
> 

/snip

> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 10dd171b43f8..bb70c1758c72 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -30,12 +30,47 @@ struct msm_kms_funcs {
>  	irqreturn_t (*irq)(struct msm_kms *kms);
>  	int (*enable_vblank)(struct msm_kms *kms, struct drm_crtc *crtc);
>  	void (*disable_vblank)(struct msm_kms *kms, struct drm_crtc *crtc);
> -	/* modeset, bracketing atomic_commit(): */
> +
> +	/*
> +	 * Atomic commit handling:
> +	 */
> +
> +	/**
> +	 * Prepare for atomic commit.  This is called after any previous
> +	 * (async or otherwise) commit has completed.
> +	 */
>  	void (*prepare_commit)(struct msm_kms *kms, struct drm_atomic_state *state);
> +
> +	/**
> +	 * Flush an atomic commit.  This is called after the hardware
> +	 * updates have already been pushed down to effected planes/
> +	 * crtcs/encoders/connectors.
> +	 */
> +	void (*flush_commit)(struct msm_kms *kms, unsigned crtc_mask);
> +
> +	/* TODO remove ->commit(), use ->flush_commit() instead: */
>  	void (*commit)(struct msm_kms *kms, struct drm_atomic_state *state);
> -	void (*complete_commit)(struct msm_kms *kms, unsigned crtc_mask);
> +
> +	/**
> +	 * Wait for any in-progress flush to complete on the specified
> +	 * crtcs.  This should not block if there is no in-progress
> +	 * commit (ie. don't just wait for a vblank), as it will also
> +	 * be called before ->prepare_commit() to ensure any potential
> +	 * "async" commit has completed.
> +	 */
>  	void (*wait_flush)(struct msm_kms *kms, unsigned crtc_mask);
>  
> +	/**
> +	 * Clean up are commit is completed.  This is called after

s/are/our/?

With that fixed,

Reviewed-by: Sean Paul <sean@poorly.run>



> +	 * ->wait_flush(), to give the backend a chance to do any
> +	 * post-commit cleanup.
> +	 */
> +	void (*complete_commit)(struct msm_kms *kms, unsigned crtc_mask);
> +
> +	/*
> +	 * Format handling:
> +	 */
> +
>  	/* get msm_format w/ optional format modifiers from drm_mode_fb_cmd2 */
>  	const struct msm_format *(*get_format)(struct msm_kms *kms,
>  					const uint32_t format,
> @@ -45,6 +80,7 @@ struct msm_kms_funcs {
>  			const struct msm_format *msm_fmt,
>  			const struct drm_mode_fb_cmd2 *cmd,
>  			struct drm_gem_object **bos);
> +
>  	/* misc: */
>  	long (*round_pixclk)(struct msm_kms *kms, unsigned long rate,
>  			struct drm_encoder *encoder);
> -- 
> 2.21.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
