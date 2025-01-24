Return-Path: <linux-arm-msm+bounces-46105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43462A1BA28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 17:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23B74188ECDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 16:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAAFE18E057;
	Fri, 24 Jan 2025 16:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qwwZg5/c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B19156649
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 16:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737735382; cv=none; b=HcZ4kenAoXIvgtRO46j+7TV/ZKcm6Y0Mc9Sust7YLBdMDGQn5gZotc1a4TVEFvFHY48+0FgAuRZpUKIaWj1PbKristqwFnw7mQ9/NtLH2Q7XIRma+4WlbRvhI/sq2AqKqXB+kuY0XR+c3swFRDgMOglyjyqGctZANebiaUhHJes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737735382; c=relaxed/simple;
	bh=tPiKxvdW4QIfgwE1yL88PQ8mPjsbrvlWdVp5z2N7i7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oub1xJCVdbdENVYxd6Cd42vvpftlpVv43QKu4sUV++UZzZTSLa9NFiPJNJlaLjHWv860Ia21zxaeUISkwgqXZ2evuVQiBenWIOMzHMhUR5P0kgV8jiHdC4aD+w6eeKbqbHPKuzfeuuhaX+TgHZVkn0KR5nFwOo+MZqnjSmpo44k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qwwZg5/c; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30762598511so23409211fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 08:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737735378; x=1738340178; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oYp13GB+TgpIfTeDyYURucWo4oKSuneBn3ZxtgkJtuA=;
        b=qwwZg5/cmVVICuRf6U4bwaOQ/ixZSG2Gt1pnlhDW2QPL/9se4yp+9TCwhPx5T1tv9M
         5oncN+s22oJdr4P0cGaCiN1QDg2/GpzpfFsOYjbvbCe0uV10LvMiydgc6FqNgNkTGn12
         0PkaaACl9ByyNQGtII6CeqUHeU+ParQ8vT7tRDyqH6BnkYPLS59ceh1PsXQJcilpHwxO
         XYBu/soqddeOHxDb5VdEhQafeJAUVIcyYOpjYAcSoAlACX7CL6XKXXwkKa+yDNaMED4+
         eg4+K2TpJN1mGfLt+u9UZL7awNEpLyKmN4Y2frUu3f2mZ69GphfIm9aDWyWZ63JCkVoF
         4Nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737735378; x=1738340178;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYp13GB+TgpIfTeDyYURucWo4oKSuneBn3ZxtgkJtuA=;
        b=OZbFFTwKqLebkoWQ0z1Nl8THCiyH5jXP6M8N1flJsgWXs/SFz2b77386tIVGuULyLO
         9qXrJV9olvA0gxUL6E60hl63uHrWEktKkbAXmJkcHSE9yfQhhvk/xqVZWHYY9sc1wDjO
         Lk9arrTmsf5ecIv7gBMzmAS0XZ1idO2c5OVLgfbuhoRzujdS+09u8QS4XzJQMkvZ4iYs
         Z/+0kBoXVrsEtLpRZAZ6gJVjeVOaj4PdVIH/HgNrPjCQ9zoRuXx/PtRLcctPKJBOLA5g
         m7WxnKIoOHSpD3rV17TOO+dDG2zqz8jjDeOhNBrhhXUGpV4/6pK5QTFcWbEpYZC3O0iG
         agTg==
X-Forwarded-Encrypted: i=1; AJvYcCXcSmOwK4GZixjfav2tNav024NVO33hK+3TMxY5Msq2qlaV2e6xXanfNFEpXx54f2T36BaG5i2gAdyBMcl2@vger.kernel.org
X-Gm-Message-State: AOJu0YxRMNPy478JLbFoaFKnZ2b1VU5oOvBNGDTeKC0+rzQDfW+QkZqg
	QBRwXo781QizcM3RlGlzExnZ+yDcopRIgje2LNoXGxXyjFTw9FZYU1ZEAXwk8y4=
X-Gm-Gg: ASbGncv01gg136+sirvwjYvdW3qKAOK/wjYK3XZi3wo/tQaypjWXvGBKFaEeJcvrMFL
	ylEFh5xlPr3D/wz39cHGoFh4R3AUyBvTY73HYkBAAKSuFrSIRWDd4LjneQLGCAKwBG0L7/2qWpe
	J/xdepAVlAoGyIP2DoTKjuD6cosMsTqJl+YSQGXs0Pp5lcXjQRHMkJx8M8MiG+7xUjkee9U7sdF
	oGJg/+qATbW6mrw06AzxtzEpP2Xp+TUDLpgl4pLeSUOzrtm6IxKM5pLIyMezDP13OhKrXes1rnV
	/fo/dO8H342BP61qvgSB1Wi3hZzXxn0wvGMfvtB7OB4+VpEunX6OejU88/GU
X-Google-Smtp-Source: AGHT+IE05LEIYAGdtPAyN3h4mkJG1nuHtfXByoOnPKvKHQpV53DUp8K1ls1Oh3PCeiaUvWPtS22Glg==
X-Received: by 2002:a05:651c:2126:b0:2ff:e5fa:1ae7 with SMTP id 38308e7fff4ca-3072caa15a3mr113430121fa.21.1737735378457;
        Fri, 24 Jan 2025 08:16:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1981esm4111411fa.75.2025.01.24.08.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 08:16:17 -0800 (PST)
Date: Fri, 24 Jan 2025 18:16:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 0/6] drm: introduce atomic_needs_modeset() callbacks
Message-ID: <it2puzcitkui2inz4tmvkpig47jyz2efeq3udzffnqwomf3r3v@5sylpgnvqdxk>
References: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
 <Z5ODTg9iTjNKggzN@intel.com>
 <Z5OOo9yR7PVXXIj4@phenom.ffwll.local>
 <Z5ORyQ_49ZNmAxtq@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5ORyQ_49ZNmAxtq@intel.com>

On Fri, Jan 24, 2025 at 03:12:41PM +0200, Ville Syrjälä wrote:
> On Fri, Jan 24, 2025 at 01:59:15PM +0100, Simona Vetter wrote:
> > On Fri, Jan 24, 2025 at 02:10:54PM +0200, Ville Syrjälä wrote:
> > > On Fri, Jan 24, 2025 at 01:14:18PM +0200, Dmitry Baryshkov wrote:
> > > > There are several drivers which attempt to upgrading the commit to the
> > > > full mode set from their per-object atomic_check() callbacks without
> > > > calling the drm_atomic_helper_check_modeset() or
> > > > drm_atomic_helper_check() again (as requested by those functions).
> > > 
> > > I don't really understand why any of that is supposedly necessary.
> > > drm_atomic_helper_check_modeset() is really all about the
> > > connector routing stuff, so if none of that is changing then there
> > > is no point in calling it again. Eg. in i915 we call it just at
> > > the start, and later on we flag internal modesets all over the
> > > place, but none of those need drm_atomic_helper_check_modeset()
> > > because nothing routing related will have changed.
> > 
> > i915 doesn't need this because as you say, it doesn't rely on the atomic
> > helper modeset tracking much at all, but it's all internal. This is for
> > drivers which rely more or less entirely on
> > drm_atomic_crtc_needs_modeset().
> > 
> > Also note that it's not just about connector routing, but about adding all
> > the necessary additional states with
> > drm_atomic_add_affected_connectors/planes and re-running all the various
> > state computation hooks for those. Again i915 hand-rolls that all.
> 
> IIRC it only runs the connectors' atomic_check(),
> nothing else really. But maybe that's changed since I last
> looked at it.

It also calls encoder's atomic_check() or mode_fixup() callbacks (see
the mode_fixup() call at the end of the helper). And the other function,
drm_atomic_helper_check() calls drm_atomic_helper_check_modeset() and
then calls atomic_check() for the planes and for the CRTCs that are a
part of the state.

For example, if the the encoder requires a modeset change on the CRTC,
then that CRTC (and all connected planes) should also be added to the
state. However with the default code flow it's already too late. Even if
we just split those functions, it's still too late, as mode_fixup()
comes after adding of the CRTC and planes.

Likewise, if the plane wants to upgrade the commit, then all other
planes blended on the corresponding CRTC must also be added to the
state.

> Anyways it feels like we're throwing everything and the
> kitchen sink into a single function here. Maybe it should be
> split into two or more functions with clear responsibilities?

I'm not sure, what do you mean. Do you mean splitting those two
drm_atomic_helper functions? It is possible, but it will also result in
a higher amount of boilerplate code (and still being easy to break). For
example, the mentioned depdency series adds this kind of 'oh, do we need
a modeset?' call to the DPU driver. But then each other driver needs
similar code.

I did a quick non-comprehensive grepping (also I skipped i915 and AMDGPU
drivers, too complicated to analyse):

+ malidp, malidp_crtc_atomic_check_gamma(),
	manually calls drm_atomic_helper_check_modeset() again
		good citizen

+ GUD: gud_pipe_check(),
	plane setting mode_changed,
		pardoned, single plane on a CRTC
+ mcde, mcde_display_check(),
	plane setting mode_changed
		pardoned, single plane on a CRTC
+ mgag200, mgag200_primary_plane_helper_atomic_check(),
	plane setting mode_changed
		pardoned, single plane on a CRTC
+ tilcdc, tilcdc_plane_atomic_check()
	plane setting mode_changed
		pardoned, single plane on a CRTC
+ pl111, pl111_display_check(),
	plane setting mode_changed
		pardoned, single plane on a CRTC
+ tve200, tve200_display_check(),
	plane setting mode_changed
		pardoned, single plane on a CRTC

+ IPUv3, ipu_plane_atomic_check(),
	plane setting mode_changed
		no excuse, it can come from the overlay plane
+ ingenic, ingenic_ipu_plane_atomic_check()
	plane setting mode_changed
		no idea
+ ingenic, ingenic_drm_plane_atomic_check(),
	plane setting mode_changed
		no idea

+ nouveau/nv50, nv50_outp_atomic_check_view(),
	encoder setting mode_changed
		no idea of the possible impact
+ msm, dpu_encoder_virt_atomic_check()
	encoder setting mode_changed
		possible issues once resource allocation is moved to
		CRTC

+ imx/lcdcl: imx_lcdc_pipe_update(),
	ignores crtc_state->mode_changed,
	forces mode_set on its own
		no excuse? needs to be refactored anyway?

+ meson, meson_encoder_hdmi_atomic_check()
	bridge setting mode_changed
		no idea of the possible impact
+ nwl-dsp, nwl_dsi_bridge_atomic_check()
	bridge upgrading active_changed to mode_changed
		no idea of the possible impact

+ drm_atomic_helper_connector_tv_check()
	connector setting mode_changed
		should be okay...
+ drm_atomic_helper_connector_hdmi_check()
	connector setting mode_changed
		should be okay...
+ cadence, cdns_mhdp_connector_atomic_check()
	connector setting mode_changed
		should be okay...
+ synopsis, dw_hdmi_connector_atomic_check
	connector setting mode_changed
		should be okay...
+ vc4, vc4_hdmi_connector_atomic_check()
	connector setting mode_changed
		should be okay...
+ vmwgfx, vmw_stdu_connector_atomic_check()
	connector setting mode_changed
		should be okay...

+ msm, dpu_crtc_atomic_check()
	CRTC upgrading active_changed to mode_changed
		patch pending

+ drm_dp_mst_add_affected_dsc_crtcs()
	when is it supposed to be called at all?

Please note, that those 'pardoned' or 'should be okay' drivers are
breaking the defined function API and might stop functioning at some
point.

> 
> > 
> > So yeah i915 doesn't need this.
> > -Sima
> > 
> > > 
> > > > 
> > > > As discussed on IRC, add separate atomic_needs_modeset() callbacks,
> > > > whose only purpose is to allow the plane, connector, encoder or CRTC to
> > > > specify that for whatever reasons corresponding CRTC should undergo a
> > > > full modeset. The helpers will call these callbacks in a proper place,
> > > > adding affected objects and calling required functions as required.
> > > > 
> > > > The MSM patches depend on the msm-next tree and the series at [1]. The
> > > > plan is to land core changes through drm-misc, then merge drm-misc-next
> > > > into msm-next and merge remaining msm-specific patches through the
> > > > msm-next tree.
> > > > 
> > > > [1] https://lore.kernel.org/dri-devel/20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org/
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > > Dmitry Baryshkov (6):
> > > >       drm/atomic-helper: add atomic_needs_modeset callbacks
> > > >       drm/mgag200: move format check to drm_plane_helper.atomic_needs_modeset
> > > >       drm/msm/dpu: stop upgrading commits by enabling allow_modeset
> > > >       drm/msm/dpu: move CTM check to drm_crtc_helper.atomic_needs_modeset
> > > >       drm/msm/dpu: use atomic_needs_modeset for CDM check
> > > >       drm/msm: drop msm_atomic_check wrapper
> > > > 
> > > >  drivers/gpu/drm/drm_atomic_helper.c         | 59 ++++++++++++++++++
> > > >  drivers/gpu/drm/mgag200/mgag200_drv.h       |  2 +
> > > >  drivers/gpu/drm/mgag200/mgag200_mode.c      | 27 ++++++---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 15 +++++
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 44 +++++++++-----
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 --
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 --------
> > > >  drivers/gpu/drm/msm/msm_atomic.c            | 29 ---------
> > > >  drivers/gpu/drm/msm/msm_drv.h               |  1 -
> > > >  drivers/gpu/drm/msm/msm_kms.c               |  2 +-
> > > >  drivers/gpu/drm/msm/msm_kms.h               |  7 ---
> > > >  include/drm/drm_modeset_helper_vtables.h    | 92 +++++++++++++++++++++++++++++
> > > >  12 files changed, 219 insertions(+), 89 deletions(-)
> > > > ---
> > > > base-commit: 0936f0e54426177b0f0263ddf806ed5e13487db6
> > > > change-id: 20250123-atomic-needs-modeset-8f6a8243a3f7
> > > > prerequisite-change-id: 20241222-drm-dirty-modeset-88079bd27ae6:v2
> > > > prerequisite-patch-id: 0c61aabfcd13651203f476985380cbf4d3c299e6
> > > > prerequisite-patch-id: c6026f08011c288fd301676e9fa6f46d0cc1dab7
> > > > prerequisite-patch-id: b0cb06d5c88791d6e4755d879ced0d5050aa3cbf
> > > > prerequisite-patch-id: fd72ddde9dba0df053113bc505c213961a9760da
> > > > 
> > > > Best regards,
> > > > -- 
> > > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > 
> > > -- 
> > > Ville Syrjälä
> > > Intel
> > 
> > -- 
> > Simona Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> -- 
> Ville Syrjälä
> Intel

-- 
With best wishes
Dmitry

