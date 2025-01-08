Return-Path: <linux-arm-msm+bounces-44437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C22A0634F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 18:26:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BC8A7A2BC7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 17:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129131FF7D5;
	Wed,  8 Jan 2025 17:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ZUkeGw/f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FCF1FCFE7
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 17:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736357183; cv=none; b=ih8BVHth3PDBnXqHhGPq6sxBhOv4EGto909RhV53vzc0fYt2wBhipe/x+jXEy/7uMNz89ed0KQPjoNLQ/z8PAdbUVPq4wdnfULD4KUh2HJ/WXpfY2MVz5UqreGPZlNJYrNoYEzHAbNGfSFIO/39Bd1JUTwHVZvM40Cu5AA+MQAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736357183; c=relaxed/simple;
	bh=D9gSl7xx8gFqjv9ydwHVxZnnvqbCRMlKn8BH+hmDzq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCs8Amg2pHK9uMKBaS1EeiwQ394MQumfgVHNlEvR7Nc9DXM9gCtFuFxWyEAUrBeq0KuNi1I8/mhzAkqncCROMBY4tH1icqGIRDJEOrBrGODYMBcqNrzQYvIzdD8y9ZKxRQGIo99ZtiZMfGCcK+8GkvVVtm9+EZTwwisUZiWnAjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=ZUkeGw/f; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so22425f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 09:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736357180; x=1736961980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bI5BkTsr1Rej7kPzTQ7NrBrtLjPHANabm0Md7VMapXI=;
        b=ZUkeGw/f24vFVeYgi7L0veV1Gi8nWeb71r+MZxlqwhx+3xkRXcEpWste/LVvxgCPIE
         pFpZRmFjjfAgdjT2l0jI52bQ5Cp867q4fR3wwdOOCNluIaRvwDgpO58NNNFL0HZ2WKBC
         s1MCanfljU8twmxkv14x/0Xh2QJWQC4kXJ2zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736357180; x=1736961980;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bI5BkTsr1Rej7kPzTQ7NrBrtLjPHANabm0Md7VMapXI=;
        b=wa6BpWXpuNb5E1D8pE6IJNoQMOBK1JU/KacxKZZ1uUzd4eV2C1c/gX2T6qnBEAkGiU
         s51aBCNl6ppL1tRaCOGLPqA7R5TEBEX53o0EWxPXrfYCFDm/sphb6r2LekJuwUXDe8w6
         eXzld6mpxc+ow85f88geEfv+vAglkK6uB7swtND+bdnzS+Nl1E9hd+qMGcoNetsVfwdT
         74LSS3gYeN1buhZgyFB7N3HO/zM/jdzy5PN8AqYILLaj+J84w0tNYuQdHn25CbV9eoQF
         azRJeANnXON8phwsolhOlubTacET+aqPOl/aj7QfQJW/ZUg93KpGDBRrc81IHMbsLulo
         s9Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUHhQ9TRW/+tp/pfZu34lxitYPhlF+zpUkoP5EDzRNquEJcbiHVUrK0KZJEKrF4x6A7SxsnGoMHgcxBrAo3@vger.kernel.org
X-Gm-Message-State: AOJu0YzSZQ9IuqQUhgBY1QNBMG71j1tVvVVVoQKUDhdEIsVb12pYWabU
	6Xi+ugBnPBHADIMWUsWe/Zlq69XaAKTQtC3+qzasfbpC7dskfVj4ubdBY4OtBeg=
X-Gm-Gg: ASbGncuWzrVDPPGXL+JnFPnvlVLhkYMYyP9dxou29wGVGlv0gRsNzDtSNKiUL/GBlMm
	6Rkqbuy6bmb+/dHIAZMWFffONrw9pt/IdyI4wJMy5G8cRWLKYf2LM4uPTYHwOhA9TD4lz0EAtGj
	/gCKXqzVwcP7e6wr5NJ1JRDAn0UAhzgef6rbBqPefHlPIOVp5L99rFaQ7JuVKj2eBlxC80VJotx
	VmIc6HLZaCTIX2Vg3mDuOnthmhG3OMsvTWXMxGwdAU1zuAEVP7aIluuESLBPegQAXWu
X-Google-Smtp-Source: AGHT+IHIG8gIkIZLnGTj2vm2ov4/i2vQzdBqNMlxt0wme6qkxMsRJFFigfl4B+bpgLZ7xuYAvDMDEg==
X-Received: by 2002:a05:6000:1446:b0:385:d7f9:f169 with SMTP id ffacd0b85a97d-38a872f6d09mr3033928f8f.12.1736357179644;
        Wed, 08 Jan 2025 09:26:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8334aasm53404544f8f.41.2025.01.08.09.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 09:26:19 -0800 (PST)
Date: Wed, 8 Jan 2025 18:26:17 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Chandan Uddaraju <chandanu@codeaurora.org>,
	Jeykumar Sankaran <jsanka@codeaurora.org>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Sravanthi Kollukuduru <skolluku@codeaurora.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Archit Taneja <architt@codeaurora.org>,
	Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 1/6] drm/atomic-helper: document
 drm_atomic_helper_check() restrictions
Message-ID: <Z361OTdcwtPvN17P@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Chandan Uddaraju <chandanu@codeaurora.org>,
	Jeykumar Sankaran <jsanka@codeaurora.org>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Sravanthi Kollukuduru <skolluku@codeaurora.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Archit Taneja <architt@codeaurora.org>,
	Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-1-0e76a53eceb9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222-drm-dirty-modeset-v1-1-0e76a53eceb9@linaro.org>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Sun, Dec 22, 2024 at 07:00:41AM +0200, Dmitry Baryshkov wrote:
> The drm_atomic_helper_check() calls drm_atomic_helper_check_modeset()
> insternally. Document that corresponding restrictions also apply to the
> drivers that call the former function (as it's easy to miss the
> documentation for the latter function).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 5186d2114a503701e228e382cc45180b0c578d0c..f26887c3fe8b194137200f9f2426653274c50fda 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1059,6 +1059,15 @@ EXPORT_SYMBOL(drm_atomic_helper_check_planes);
>   * For example enable/disable of a cursor plane which have fixed zpos value
>   * would trigger all other enabled planes to be forced to the state change.
>   *
> + * IMPORTANT:
> + *
> + * As this function calls drm_atomic_helper_check_modeset() internally, its
> + * restrictions also apply:
> + * Drivers which set &drm_crtc_state.mode_changed (e.g. in their
> + * &drm_plane_helper_funcs.atomic_check hooks if a plane update can't be done
> + * without a full modeset) _must_ call drm_atomic_helper_check_modeset()
> + * function again after that change.
> + *
>   * RETURNS:
>   * Zero for success or -errno
>   */
> 
> -- 
> 2.39.5
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

