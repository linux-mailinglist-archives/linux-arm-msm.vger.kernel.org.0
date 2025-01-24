Return-Path: <linux-arm-msm+bounces-46090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F4FA1B675
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 13:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F24A8188B3C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 12:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A623CA64;
	Fri, 24 Jan 2025 12:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="HCGNZED7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793252E401
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 12:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737723562; cv=none; b=I7JATmCNH1jDhW452QU1ltiOxOMEaP2rnnMmH9GBBbiNb84pHISCqQ6J2+wv8lE2aI5J/kv0XHHWmgMTC7K0voNlecEis1B6tIEMnW0dySH26NMsRZJAllMX3dPzM/g1KLbNhboPW9xlZR3+NIgRSHyWFi03HSHhcb2zNJOpzcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737723562; c=relaxed/simple;
	bh=Hp3BUieXhEe4+2bd7nT4rWPgdu035g8XiQY4GiHowwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFoJVokEs32dyG3NpeQ52DkGswQ3OuJEadx0HINWgrEUpPbKSa/wDxhfyKr3h8TD+lIdI3239EJe4iMMvT61j5yq+ReEL/GQCbD+OAYUnHioU2p0pkFMq8VVEdH+Fbv1qAt3f9jUSJ/urEAWHA3O3qq/cqUD3rJRryTTPVeYrjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=HCGNZED7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so21319465e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 04:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1737723558; x=1738328358; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=33cVwK3grJ8YXxRdY81yOM9y1PRayVf2o7ymGHTooTE=;
        b=HCGNZED7AH1BLW465XHDRXzYxij+cU2r0QKKKFu9C02d/TLuVGo9ykLEFbqsgqTzJO
         mXJvodpBj0llpx2jM34DoFV0Ctq+w9ec2zb61pSHgog13HfZucBzq6NCIXfc7nxKts5k
         rLT9J/EHLFHx92uEswBwHLa1OAiJN79DewtrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737723558; x=1738328358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33cVwK3grJ8YXxRdY81yOM9y1PRayVf2o7ymGHTooTE=;
        b=X7WnH8rsj33t5GSvwFt0qjs/iFUl9GDw6jg1yY2yvLIYZhA5iVAc8rDm6YMGkARY2i
         aDNCL68eMwLrdcX2b5x/mN4oqtw8dRtSnG04rx7YimW9qeh80Ii4zDY9XByfdVGnOPJu
         +5gPser3nt0IfiYiWSfAiJ5mOM/zeUMEKiLpHcldx+kAQMf6SjaCl2ro3B+gcrLOf5is
         Sb07xbotv/ZspCmivJWGi/tLcLYPLKSw+es4qMFOlOAXaT1bWw2yQDpDpR8CdBRNK6Jh
         r2K61Y5JVxqjBmj2/fYOB89Hs61FGS6IKZFq55y9NEJSFPADZ2/AybtWuIAu3aKkarDX
         iWPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPtllZovVxQG19nVW4rsrTfpqd541+zjsCg48bL9zyDHOlmsu0eg5ji1VGIw1FmbPwQK41MDp1U/pY3gkq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa7VICvWs7sfqeSpFwK20dr3JXOkdh+MaLbPPty7TMDxIceVdA
	jp+r7cvX7owguV9+cI2qy4ItDBmW1cYT9KKVziUKJvM3U848LCdWKyn7dXUgZqk=
X-Gm-Gg: ASbGncuZ4eV0im8nylv2Dqt10qOPvVYspkkU15A8AxNb1p2Imfn8aCFJNsvRxdHxJE1
	FaM+SN5Smj6ssVWew+/WtBOb9dMNhfYobVBQb8HhwRcq0ZJ0e6uYYeLO4juzG362cc1xw5WRVRX
	Mm8CxQ+RjbmjRV0sqVzZqphPycIl5Qp4eekpz2azQd2kGz1Mf3HZdOfig51ne++hDN47KmZzDX+
	wQkUoI1Xu4ukF2JwewLmxC7eV3UeYT7T9aY0AK9OE43IpysTsUNP3l9JwJoc8ySEriRG5yxCSwp
	/b2L12yeQWpA+4mg
X-Google-Smtp-Source: AGHT+IFNTwDQcfMPSuAVJYiFiIPNjkS5uD2SP5FpWnu3IjjtuQyF+nl7zo/OPmtqDX93CmpiCmn2bA==
X-Received: by 2002:a05:600c:3b0a:b0:434:9c60:95a3 with SMTP id 5b1f17b1804b1-438913ca93cmr305517245e9.11.1737723557582;
        Fri, 24 Jan 2025 04:59:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4857cesm25611865e9.13.2025.01.24.04.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 04:59:17 -0800 (PST)
Date: Fri, 24 Jan 2025 13:59:15 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dave Airlie <airlied@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Kalyan Thota <quic_kalyant@quicinc.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 0/6] drm: introduce atomic_needs_modeset() callbacks
Message-ID: <Z5OOo9yR7PVXXIj4@phenom.ffwll.local>
Mail-Followup-To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dave Airlie <airlied@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Kalyan Thota <quic_kalyant@quicinc.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
 <Z5ODTg9iTjNKggzN@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5ODTg9iTjNKggzN@intel.com>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Fri, Jan 24, 2025 at 02:10:54PM +0200, Ville Syrj�l� wrote:
> On Fri, Jan 24, 2025 at 01:14:18PM +0200, Dmitry Baryshkov wrote:
> > There are several drivers which attempt to upgrading the commit to the
> > full mode set from their per-object atomic_check() callbacks without
> > calling the drm_atomic_helper_check_modeset() or
> > drm_atomic_helper_check() again (as requested by those functions).
> 
> I don't really understand why any of that is supposedly necessary.
> drm_atomic_helper_check_modeset() is really all about the
> connector routing stuff, so if none of that is changing then there
> is no point in calling it again. Eg. in i915 we call it just at
> the start, and later on we flag internal modesets all over the
> place, but none of those need drm_atomic_helper_check_modeset()
> because nothing routing related will have changed.

i915 doesn't need this because as you say, it doesn't rely on the atomic
helper modeset tracking much at all, but it's all internal. This is for
drivers which rely more or less entirely on
drm_atomic_crtc_needs_modeset().

Also note that it's not just about connector routing, but about adding all
the necessary additional states with
drm_atomic_add_affected_connectors/planes and re-running all the various
state computation hooks for those. Again i915 hand-rolls that all.

So yeah i915 doesn't need this.
-Sima

> 
> > 
> > As discussed on IRC, add separate atomic_needs_modeset() callbacks,
> > whose only purpose is to allow the plane, connector, encoder or CRTC to
> > specify that for whatever reasons corresponding CRTC should undergo a
> > full modeset. The helpers will call these callbacks in a proper place,
> > adding affected objects and calling required functions as required.
> > 
> > The MSM patches depend on the msm-next tree and the series at [1]. The
> > plan is to land core changes through drm-misc, then merge drm-misc-next
> > into msm-next and merge remaining msm-specific patches through the
> > msm-next tree.
> > 
> > [1] https://lore.kernel.org/dri-devel/20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org/
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Dmitry Baryshkov (6):
> >       drm/atomic-helper: add atomic_needs_modeset callbacks
> >       drm/mgag200: move format check to drm_plane_helper.atomic_needs_modeset
> >       drm/msm/dpu: stop upgrading commits by enabling allow_modeset
> >       drm/msm/dpu: move CTM check to drm_crtc_helper.atomic_needs_modeset
> >       drm/msm/dpu: use atomic_needs_modeset for CDM check
> >       drm/msm: drop msm_atomic_check wrapper
> > 
> >  drivers/gpu/drm/drm_atomic_helper.c         | 59 ++++++++++++++++++
> >  drivers/gpu/drm/mgag200/mgag200_drv.h       |  2 +
> >  drivers/gpu/drm/mgag200/mgag200_mode.c      | 27 ++++++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 15 +++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 44 +++++++++-----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 --
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 --------
> >  drivers/gpu/drm/msm/msm_atomic.c            | 29 ---------
> >  drivers/gpu/drm/msm/msm_drv.h               |  1 -
> >  drivers/gpu/drm/msm/msm_kms.c               |  2 +-
> >  drivers/gpu/drm/msm/msm_kms.h               |  7 ---
> >  include/drm/drm_modeset_helper_vtables.h    | 92 +++++++++++++++++++++++++++++
> >  12 files changed, 219 insertions(+), 89 deletions(-)
> > ---
> > base-commit: 0936f0e54426177b0f0263ddf806ed5e13487db6
> > change-id: 20250123-atomic-needs-modeset-8f6a8243a3f7
> > prerequisite-change-id: 20241222-drm-dirty-modeset-88079bd27ae6:v2
> > prerequisite-patch-id: 0c61aabfcd13651203f476985380cbf4d3c299e6
> > prerequisite-patch-id: c6026f08011c288fd301676e9fa6f46d0cc1dab7
> > prerequisite-patch-id: b0cb06d5c88791d6e4755d879ced0d5050aa3cbf
> > prerequisite-patch-id: fd72ddde9dba0df053113bc505c213961a9760da
> > 
> > Best regards,
> > -- 
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> -- 
> Ville Syrj�l�
> Intel

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

