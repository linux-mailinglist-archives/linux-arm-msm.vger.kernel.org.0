Return-Path: <linux-arm-msm+bounces-36622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B409B84DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 22:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57A841F21D11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 21:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3442F183CAA;
	Thu, 31 Oct 2024 21:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L2qMkCIn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ED41BBBC1
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 21:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730408604; cv=none; b=g9ZQLZN/1W7VgfgYbT6w0LetGWbiusZKlYteMdyaN+KAsg/DogT/KdWgM5SudGGF2k5D1WTTwbcBLNSn64bVHno2Ys2Q2WCFE+RwHQGyue6BeMYu2k3N0K9Jzwj048Bm0X5Bt37lQE9JB2LbkuKMJFmzaXruiFTSwGFxYqNU3U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730408604; c=relaxed/simple;
	bh=1kfQTxA5cHE9hw1Wcu5hlbOGFDdJGUcQdNjr8YvP+XA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hvq/C/g7z1eg6p+rfdxqHikkMJEZdGJAPTc9iFJF7K/nM1DgNFWfYXoI8aGWa+d4TiUczXN03oAoDKV4gWfzzySV8dU7Jl0fxqs545a/9bLgx6mLFoBEjQRunOSa1fNiWKtWE+nlpvHiDXDzoeRwSXbkekW7hNU2W5th5SLGDXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L2qMkCIn; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539fe76e802so1799502e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 14:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730408593; x=1731013393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ua3XEetinmn0T1jFJrO1nWDD/WNcTJhBUdczjt8ERn8=;
        b=L2qMkCInp+Y1oLbCGSUYngiPBlkwH98W2Y6tekQONm/21fZz9ndlsc2AaPIcOPUAxq
         7+2iFvjLc74/N5Ae4FOph/04gbL0J/y4ZLZHJfkjRlfaaYHK9h5JFPsxM3Poek2qhEz5
         CNvQvGH9ZSeyXP6DUXagsgc51Q1vMW18/+WiKm3M14RtFXaupgNBHQqt0CJqrnuCRkDy
         Cm/A+YAi6q5YfXScF3Feli7PxNNjzNvcoeHnksNBpmeZ8/FqqygG8nFpKAUSaK/UezD5
         B/NoNkTEQxfedFjP+spfzkY/JxmydZBZzf5KLahWqf8r7CSjT18mCF1kdU4nvkdB/wXb
         u2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730408593; x=1731013393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ua3XEetinmn0T1jFJrO1nWDD/WNcTJhBUdczjt8ERn8=;
        b=VCPiGRF6jbhIvCcqdy5p9phzq6H/gc3/JRxOWsKDJflaDfTFt0K9sTntfiVXqx/ypZ
         Y5scktIdVd524yBna4dPmENnnM/L/J7Tu/bOSgD2Up2cNs6eI3u49C/pSynee+Y82Z+j
         hLdO64MzVRy8XHVCFauKb+mo0kTBJXQAXGRHm/frMF+0NmQqD9E/4cB7Avo5qbnydnI/
         c7dd2UvIxnm35A4YOGFdINt+1Xgpa77L8AMXfY7wtMe4IFeo1H0UVFfOGDCil86iNDEH
         hxDi4nCNIdF8o7BL/mIs1ZjjQFEW5/FDDrK64+WT55IC1QTzoL9jzB6fB1UmvYo3ywEn
         NSpw==
X-Forwarded-Encrypted: i=1; AJvYcCUgg6ckcT/qpk0socG34sg4Iy32MvpcdLVE4w3iTrgkNSqwpVN+Dhaatp0rOYnPJfzw3Ne5COf52u40wnRl@vger.kernel.org
X-Gm-Message-State: AOJu0YxB0f9a77nRW2UPxi4NWwP8S7QubeSSEawvrLtZRzANtadYHDII
	fgn5iWfoXJeh4xX5PAxothL8K2UT8Hoc7QNSczD77xNw5Jyc3skkNb0Mrr4Jti0=
X-Google-Smtp-Source: AGHT+IGR0jwWrvFZOjZPt/owDwna7QtKEqTc7fDbfIGCG1tqgq28eXCw51x+ZYWAEeoMDthEHiAsvg==
X-Received: by 2002:a05:6512:3b9c:b0:534:3cdc:dbfe with SMTP id 2adb3069b0e04-53d65df271bmr806162e87.28.1730408593280;
        Thu, 31 Oct 2024 14:03:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce5c8sm325015e87.141.2024.10.31.14.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 14:03:11 -0700 (PDT)
Date: Thu, 31 Oct 2024 23:03:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 7/9] drm/msm/dpu: add support for virtual planes
Message-ID: <hjymywkecsbccjq4gzcdwfqp2tss7i7jtbmsg2q4nvy7uapsn4@t5orck7ion7w>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
 <20241025-dpu-virtual-wide-v6-7-0310fd519765@linaro.org>
 <e0f84f35-6d98-45c3-857c-c273820fab69@quicinc.com>
 <xxxedwb2t6xhfzmhpom6dirs2ur2qvmruimdxgvdkh7gmey5tr@qotm7xvbsg5a>
 <14531af0-29c3-40eb-bf52-8202ba155d0b@quicinc.com>
 <CAA8EJppCppQ_jJu4o62prW-Yp2E3WBfqdYgdJs-KB8kgghj0fg@mail.gmail.com>
 <0550a9d0-dfb6-472d-a0c2-68fab78c3afb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0550a9d0-dfb6-472d-a0c2-68fab78c3afb@quicinc.com>

On Thu, Oct 31, 2024 at 01:06:34PM -0700, Abhinav Kumar wrote:
> 
> 
> On 10/31/2024 8:11 AM, Dmitry Baryshkov wrote:
> > Hi Abhinav,
> > 
> > On Wed, 30 Oct 2024 at 21:26, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 10/30/2024 3:48 AM, Dmitry Baryshkov wrote:
> > > > On Tue, Oct 29, 2024 at 02:30:12PM -0700, Abhinav Kumar wrote:
> > > > > 
> > > > > 
> > > > > On 10/24/2024 5:20 PM, Dmitry Baryshkov wrote:
> > > > > > Only several SSPP blocks support such features as YUV output or scaling,
> > > > > > thus different DRM planes have different features.  Properly utilizing
> > > > > > all planes requires the attention of the compositor, who should
> > > > > > prefer simpler planes to YUV-supporting ones. Otherwise it is very easy
> > > > > > to end up in a situation when all featureful planes are already
> > > > > > allocated for simple windows, leaving no spare plane for YUV playback.
> > > > > > 
> > > > > > To solve this problem make all planes virtual. Each plane is registered
> > > > > > as if it supports all possible features, but then at the runtime during
> > > > > > the atomic_check phase the driver selects backing SSPP block for each
> > > > > > plane.
> > > > > > 
> > > > > > As the planes are attached to the CRTC and not the encoder, the SSPP
> > > > > > blocks are also allocated per CRTC ID (all other resources are currently
> > > > > > allocated per encoder ID). This also matches the hardware requirement,
> > > > > > where both rectangles of a single SSPP can only be used with the LM
> > > > > > pair.
> > > > > > 
> > > > > > Note, this does not provide support for using two different SSPP blocks
> > > > > > for a single plane or using two rectangles of an SSPP to drive two
> > > > > > planes. Each plane still gets its own SSPP and can utilize either a solo
> > > > > > rectangle or both multirect rectangles depending on the resolution.
> > > > > > 
> > > > > > Note #2: By default support for virtual planes is turned off and the
> > > > > > driver still uses old code path with preallocated SSPP block for each
> > > > > > plane. To enable virtual planes, pass 'msm.dpu_use_virtual_planes=1'
> > > > > > kernel parameter.
> > > > > > 
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > > >     drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  50 +++++++
> > > > > >     drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  10 +-
> > > > > >     drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h   |   4 +
> > > > > >     drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 237 ++++++++++++++++++++++++++----
> > > > > >     drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  16 ++
> > > > > >     drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    |  68 +++++++++
> > > > > >     drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h    |  27 ++++
> > > > > >     7 files changed, 383 insertions(+), 29 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > index 58595dcc3889..a7eea094aa14 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > @@ -1166,6 +1166,49 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
> > > > > >      return false;
> > > > > >     }
> > > > > > +static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
> > > > > > +{
> > > > > > +   int total_planes = crtc->dev->mode_config.num_total_plane;
> > > > > > +   struct drm_atomic_state *state = crtc_state->state;
> > > > > > +   struct dpu_global_state *global_state;
> > > > > > +   struct drm_plane_state **states;
> > > > > > +   struct drm_plane *plane;
> > > > > > +   int ret;
> > > > > > +
> > > > > > +   global_state = dpu_kms_get_global_state(crtc_state->state);
> > > > > > +   if (IS_ERR(global_state))
> > > > > > +           return PTR_ERR(global_state);
> > > > > > +
> > > > > > +   dpu_rm_release_all_sspp(global_state, crtc);
> > > > > > +
> > > > > > +   if (!crtc_state->enable)
> > > > > > +           return 0;
> > > > > > +
> > > > > > +   states = kcalloc(total_planes, sizeof(*states), GFP_KERNEL);
> > > > > > +   if (!states)
> > > > > > +           return -ENOMEM;
> > > > > > +
> > > > > > +   drm_atomic_crtc_state_for_each_plane(plane, crtc_state) {
> > > > > > +           struct drm_plane_state *plane_state =
> > > > > > +                   drm_atomic_get_plane_state(state, plane);
> > > > > > +
> > > > > > +           if (IS_ERR(plane_state)) {
> > > > > > +                   ret = PTR_ERR(plane_state);
> > > > > > +                   goto done;
> > > > > > +           }
> > > > > > +
> > > > > > +           states[plane_state->normalized_zpos] = plane_state;
> > > > > > +   }
> > > > > > +
> > > > > > +   ret = dpu_assign_plane_resources(global_state, state, crtc, states, total_planes);
> > > > > > +
> > > > > > +done:
> > > > > > +   kfree(states);
> > > > > > +   return ret;
> > > > > > +
> > > > > > +   return 0;
> > > > > > +}
> > > > > > +
> > > > > >     static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> > > > > >              struct drm_atomic_state *state)
> > > > > >     {
> > > > > > @@ -1181,6 +1224,13 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> > > > > >      bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
> > > > > > +   if (dpu_use_virtual_planes &&
> > > > > > +       (crtc_state->planes_changed || crtc_state->zpos_changed)) {
> > > > > > +           rc = dpu_crtc_reassign_planes(crtc, crtc_state);
> > > > > > +           if (rc < 0)
> > > > > > +                   return rc;
> > > > > > +   }
> > > > > 
> > > > > planes_changed is set only for format changes . Will it cover all
> > > > > needs_modeset cases?
> > > > > 
> > > > > OR do we also need to set planes_changed when
> > > > > drm_atomic_crtc_needs_modeset()?
> > > > > 
> > > > > Unless I am missing something, I think we have to otherwise sspp
> > > > > reallocation wont happen in modeset cases.
> > > > 
> > > > I was depending on the planes being included in the state by the client.
> > > > I don't think we really care about the modeset per se. We care about
> > > > plane size changes. And changing the size means that the plane is
> > > > included into the commit.
> > > > 
> > > 
> > > The global state mapping for SSPPs has to be cleared across modesets
> > > IMO. This is no different from us calling dpu_rm_release() today in
> > > dpu_encoder_virt_atomic_check(). I just am not sure whether
> > > planes_changed will cover all modeset conditions.
> > 
> > We clear other resources, because they depend on the CRTC resolution.
> > Planes do not. Well, not until the quadpipe is in play.
> > SSPPs (currently) should be reallocated only if the _plane_'s
> > resolution change. If we have a modeset which involves CRTC resolution
> > change, but not the plane's size change, there is no need to
> > reallocate SSPPs.
> > 
> 
> In dpu_encoder_helper_phys_cleanup(), the SSPPs attached to all LMs are
> removed so clearing all the hardware. If the global state is still going to
> retain the older configuration not reflecting this clear, it seems incorrect
> to me. Thats why I was thinking of clearing all the SSPP mapping in
> disable() or in the modeset prior to the disable as technically thats being
> done in HW today anyway.
> 
> During the next atomic check, the planes in the crtc's current state will
> get re-attached and programmed to the blend stages. So this clearing of
> global state is reflecting the current state of the corresponding hardware.

The global state tracks resource allocation. If we clear the resources
in the disable() path, we have no way to know which SSPP blocks were
assigned to us in the corresponding enable() call path. There is no
guarantee that there will be an atomic_check() between disable() and
enable().

> 
> > > 
> > > Were you able to confirm whether the mapping gets cleared across
> > > hotplugs or suspend/resumes? If so, it would confirm whether
> > > planes_changed covers these aspects. Although, I think clearing should
> > > be more explicit.
> > 
> > I will check that tomorrow.
> > 
> > > Another option could be for you to call dpu_rm_release_all_sspp() in
> > > dpu_crtc_disable(). So that across a disable and enable we have a clear
> > > mapping table. WDYT?
> > 
> > Absolutely no. The RM state should only be changed when other object's
> > state change - in atomic_check(). After that it is mostly r/o.
> > enabling/disabling the resource shouldn't change resource assignment
> > at all.
> > 
> > > 
> > > > > 
> > > > > Overall, mainly we want to make sure SSPPs are re-assigned when:
> > > > > 
> > > > 
> > > > 0) plane size changes
> > > > > > 1) format changes (RGB to YUV and vice-versa)
> > > > > 2) Any modesets
> > > > 
> > > > No
> > > 
> > > I am not able to follow why this is different from any global state
> > > mapping of other HW blocks that we do across modesets.
> > 
> > DIfferent lifecycle requirements, I'd say.
> > 
> > > 
> > > > 
> > > > > 3) Any disable/enable without modeset like connectors changed as SSPPs are
> > > > > changing outputs there.
> > > > 
> > > > Absolutely no, the logic should be the same as active vs enabled for
> > > > CRTCs. Realloc resources only if the plane itself gets disabled or
> > > > enabled. In all other cases the set of SSPP blocks should stay
> > > > untouched.
> > > > 
> > > 
> > > I am going to re-visit this later perhaps but if we incorporate my above
> > > suggestion of clearing the mapping in disable() I will be partially
> > > satisfied.
> > 
> > No, resource mapping can not be cleaned in disable(). We do not do
> > that for any other resource kind.
> > 
> 
> That gets handled with the needs_modeset part today which is calling the
> dpu_rm_release().

In atomic_check() path, not in the disable() path.

> 
> > > 
> > > > > 
> > > > > If we are covered for all these, let me know.
> > > > > 
> > > > > > +
> > > > > >      if (!crtc_state->enable || !drm_atomic_crtc_effectively_active(crtc_state)) {
> > > > > >              DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
> > > > > >                              crtc->base.id, crtc_state->enable,
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > > > > index 15679dd50c66..70757d876cc3 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > > > > @@ -51,6 +51,9 @@
> > > > > >     #define DPU_DEBUGFS_DIR "msm_dpu"
> > > > > >     #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
> > > > > > +bool dpu_use_virtual_planes;
> > > > > > +module_param(dpu_use_virtual_planes, bool, 0);
> > > > > > +
> > > > > >     static int dpu_kms_hw_init(struct msm_kms *kms);
> > > > > >     static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
> > > > > > @@ -814,8 +817,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
> > > > > >                        type, catalog->sspp[i].features,
> > > > > >                        catalog->sspp[i].features & BIT(DPU_SSPP_CURSOR));
> > > > > > -           plane = dpu_plane_init(dev, catalog->sspp[i].id, type,
> > > > > > -                                  (1UL << max_crtc_count) - 1);
> > > > > > +           if (dpu_use_virtual_planes)
> > > > > > +                   plane = dpu_plane_init_virtual(dev, type, (1UL << max_crtc_count) - 1);
> > > > > > +           else
> > > > > > +                   plane = dpu_plane_init(dev, catalog->sspp[i].id, type,
> > > > > > +                                          (1UL << max_crtc_count) - 1);
> > > > > >              if (IS_ERR(plane)) {
> > > > > >                      DPU_ERROR("dpu_plane_init failed\n");
> > > > > >                      ret = PTR_ERR(plane);
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > > > > index 935ff6fd172c..479d4c172290 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > > > > @@ -54,6 +54,8 @@
> > > > > >     #define ktime_compare_safe(A, B) \
> > > > > >      ktime_compare(ktime_sub((A), (B)), ktime_set(0, 0))
> > > > > > +extern bool dpu_use_virtual_planes;
> > > > > > +
> > > > > >     struct dpu_kms {
> > > > > >      struct msm_kms base;
> > > > > >      struct drm_device *dev;
> > > > > > @@ -128,6 +130,8 @@ struct dpu_global_state {
> > > > > >      uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
> > > > > >      uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
> > > > > >      uint32_t cdm_to_enc_id;
> > > > > > +
> > > > > > +   uint32_t sspp_to_crtc_id[SSPP_MAX - SSPP_NONE];
> > > > > >     };
> > > > > 
> > > > > This is the part which now looks odd and can be managed with rebase I guess.
> > > > > 
> > > > > Are you planning to pull in the move resource allocation to crtc_id changes
> > > > > first before this part? IOW, rebase this change on top of that?
> > > > 
> > > > No. I do not. If you remember, several revisions ago the enc_id ->
> > > > crtc_id was a part of the series, but we both agreed to drop it since it
> > > > was not required for virtual planes. As such, I plan to land this one
> > > > first (yes, having some of the resources tracked basing on enc_id and
> > > > SSPP is tracked basing on crtc_id).
> > > > 
> > > 
> > > Yes, I am not asking whether you will be absorbing those changes into
> > > this series. Even I would not suggest doing that.
> > > 
> > > I was asking whether you will merge the crtc_id based tracking first and
> > > then apply this on top of that and not the other way around.
> > > 
> > > Because with this specific line I am certain it will conflict as both
> > > the series touch struct dpu_global_state.
> > 
> > They touch different parts of it. So I'd prefer to land this one first
> > and then land using crtc_id for mapping.
> > 
> 
> I am okay to fixup any other issues which arise later on because we have the
> modparam protection anyway but I think validating suspend/resume and hotplug
> to ensure no black screens is required. If those two cases work fine on your
> end, we can proceed.

I have been validating these changes with hotplug events, yes. I wasn't
checking the suspend/resume, but that's broken anyway, until we land
https://patchwork.freedesktop.org/patch/606931/?series=135908&rev=2

> 
> > > 
> > > > > 
> > > > > That will look clean because if this goes in first now, the crtc_id
> > > > > allocation changes will need to be rebased which I dont know who will do now
> > > > > as Jessica is OOO.
> > > > 
> > > > My plan is to pull this first and then pull patches 3-12 from the CWB
> > > > series. I do not expect significant conflicts there.
> > > > 
> > > 
> > > Please take a look at the part which touches struct dpu_global_state.
> > > 
> > > > > 
> > > > > >     struct dpu_global_state
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > > index 5e230391fabc..125db3803cf5 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > > @@ -878,7 +878,7 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> > > > > >      drm_rect_rotate_inv(&pipe_cfg->src_rect,
> > > > > >                          new_plane_state->fb->width, new_plane_state->fb->height,
> > > > > >                          new_plane_state->rotation);
> > > > > > -   if (r_pipe_cfg->src_rect.x1 != 0)
> > > > > > +   if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
> > > > > >              drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> > > > > >                                  new_plane_state->fb->width, new_plane_state->fb->height,
> > > > > >                                  new_plane_state->rotation);
> > > > > > @@ -1001,8 +1001,13 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> > > > > >              crtc_state = drm_atomic_get_new_crtc_state(state,
> > > > > >                                                         new_plane_state->crtc);
> > > > > > -   pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > > > > > -   r_pipe->sspp = NULL;
> > > > > > +   if (pdpu->pipe != SSPP_NONE) {
> > > > > > +           pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > > > > > +           r_pipe->sspp = NULL;
> > > > > > +   }
> > > > > > +
> > > > > > +   if (!pipe->sspp)
> > > > > > +           return -EINVAL;
> > > > > >      ret = dpu_plane_atomic_check_nosspp(plane, new_plane_state, crtc_state);
> > > > > >      if (ret)
> > > > > > @@ -1019,6 +1024,112 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> > > > > >      return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > > > > >     }
> > > > > > +static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
> > > > > > +                                     struct drm_atomic_state *state)
> > > > > > +{
> > > > > > +   struct drm_plane_state *plane_state =
> > > > > > +           drm_atomic_get_plane_state(state, plane);
> > > > > > +   struct drm_plane_state *old_plane_state =
> > > > > > +           drm_atomic_get_old_plane_state(state, plane);
> > > > > > +   struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
> > > > > > +   struct drm_crtc_state *crtc_state;
> > > > > > +   int ret;
> > > > > > +
> > > > > > +   if (plane_state->crtc)
> > > > > > +           crtc_state = drm_atomic_get_new_crtc_state(state,
> > > > > > +                                                      plane_state->crtc);
> > > > > > +
> > > > > > +   ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
> > > > > > +   if (ret)
> > > > > > +           return ret;
> > > > > > +
> > > > > > +   if (!plane_state->visible) {
> > > > > > +           /*
> > > > > > +            * resources are freed by dpu_crtc_assign_plane_resources(),
> > > > > > +            * but clean them here.
> > > > > > +            */
> > > > > > +           pstate->pipe.sspp = NULL;
> > > > > > +           pstate->r_pipe.sspp = NULL;
> > > > > > +
> > > > > > +           return 0;
> > > > > > +   }
> > > > > > +
> > > > > > +   /* force resource reallocation if the format of FB has changed */
> > > > > > +   if (!old_plane_state || !old_plane_state->fb ||
> > > > > > +       msm_framebuffer_format(old_plane_state->fb) !=
> > > > > > +       msm_framebuffer_format(plane_state->fb))
> > > > > > +           crtc_state->planes_changed = true;
> > > > > > +
> > > > > > +   return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > > > > > +                                         struct dpu_global_state *global_state,
> > > > > > +                                         struct drm_atomic_state *state,
> > > > > > +                                         struct drm_plane_state *plane_state)
> > > > > > +{
> > > > > > +   const struct drm_crtc_state *crtc_state = NULL;
> > > > > > +   struct drm_plane *plane = plane_state->plane;
> > > > > > +   struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> > > > > > +   struct dpu_rm_sspp_requirements reqs;
> > > > > > +   struct dpu_plane_state *pstate;
> > > > > > +   struct dpu_sw_pipe *pipe;
> > > > > > +   struct dpu_sw_pipe *r_pipe;
> > > > > > +   const struct msm_format *fmt;
> > > > > > +
> > > > > > +   if (plane_state->crtc)
> > > > > > +           crtc_state = drm_atomic_get_new_crtc_state(state,
> > > > > > +                                                      plane_state->crtc);
> > > > > > +
> > > > > > +   pstate = to_dpu_plane_state(plane_state);
> > > > > > +   pipe = &pstate->pipe;
> > > > > > +   r_pipe = &pstate->r_pipe;
> > > > > > +
> > > > > > +   pipe->sspp = NULL;
> > > > > > +   r_pipe->sspp = NULL;
> > > > > > +
> > > > > > +   if (!plane_state->fb)
> > > > > > +           return -EINVAL;
> > > > > > +
> > > > > > +   fmt = msm_framebuffer_format(plane_state->fb);
> > > > > > +   reqs.yuv = MSM_FORMAT_IS_YUV(fmt);
> > > > > > +   reqs.scale = (plane_state->src_w >> 16 != plane_state->crtc_w) ||
> > > > > > +           (plane_state->src_h >> 16 != plane_state->crtc_h);
> > > > > > +
> > > > > > +   reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
> > > > > > +
> > > > > > +   pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > > > > > +   if (!pipe->sspp)
> > > > > > +           return -ENODEV;
> > > > > > +
> > > > > > +   return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > > > > > +}
> > > > > > +
> > > > > > +int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> > > > > > +                          struct drm_atomic_state *state,
> > > > > > +                          struct drm_crtc *crtc,
> > > > > > +                          struct drm_plane_state **states,
> > > > > > +                          unsigned int num_planes)
> > > > > > +{
> > > > > > +   unsigned int i;
> > > > > > +   int ret;
> > > > > > +
> > > > > > +   for (i = 0; i < num_planes; i++) {
> > > > > > +           struct drm_plane_state *plane_state = states[i];
> > > > > > +
> > > > > > +           if (!plane_state ||
> > > > > > +               !plane_state->visible)
> > > > > > +                   continue;
> > > > > > +
> > > > > > +           ret = dpu_plane_virtual_assign_resources(crtc, global_state,
> > > > > > +                                                    state, plane_state);
> > > > > > +           if (ret)
> > > > > > +                   break;
> > > > > > +   }
> > > > > > +
> > > > > > +   return ret;
> > > > > > +}
> > > > > > +
> > > > > >     static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
> > > > > >     {
> > > > > >      const struct msm_format *format =
> > > > > > @@ -1331,12 +1442,15 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
> > > > > >      drm_printf(p, "\tstage=%d\n", pstate->stage);
> > > > > > -   drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
> > > > > > -   drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
> > > > > > -   drm_printf(p, "\tmultirect_index[0]=%s\n",
> > > > > > -              dpu_get_multirect_index(pipe->multirect_index));
> > > > > > -   drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
> > > > > > -   drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
> > > > > > +   if (pipe->sspp) {
> > > > > > +           drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
> > > > > > +           drm_printf(p, "\tmultirect_mode[0]=%s\n",
> > > > > > +                      dpu_get_multirect_mode(pipe->multirect_mode));
> > > > > > +           drm_printf(p, "\tmultirect_index[0]=%s\n",
> > > > > > +                      dpu_get_multirect_index(pipe->multirect_index));
> > > > > > +           drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
> > > > > > +           drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
> > > > > > +   }
> > > > > >      if (r_pipe->sspp) {
> > > > > >              drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);
> > > > > > @@ -1429,31 +1543,29 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
> > > > > >              .atomic_update = dpu_plane_atomic_update,
> > > > > >     };
> > > > > > +static const struct drm_plane_helper_funcs dpu_plane_virtual_helper_funcs = {
> > > > > > +   .prepare_fb = dpu_plane_prepare_fb,
> > > > > > +   .cleanup_fb = dpu_plane_cleanup_fb,
> > > > > > +   .atomic_check = dpu_plane_virtual_atomic_check,
> > > > > > +   .atomic_update = dpu_plane_atomic_update,
> > > > > > +};
> > > > > > +
> > > > > >     /* initialize plane */
> > > > > > -struct drm_plane *dpu_plane_init(struct drm_device *dev,
> > > > > > -           uint32_t pipe, enum drm_plane_type type,
> > > > > > -           unsigned long possible_crtcs)
> > > > > > +static struct drm_plane *dpu_plane_init_common(struct drm_device *dev,
> > > > > > +                                          enum drm_plane_type type,
> > > > > > +                                          unsigned long possible_crtcs,
> > > > > > +                                          bool inline_rotation,
> > > > > > +                                          const uint32_t *format_list,
> > > > > > +                                          uint32_t num_formats,
> > > > > > +                                          enum dpu_sspp pipe)
> > > > > >     {
> > > > > >      struct drm_plane *plane = NULL;
> > > > > > -   const uint32_t *format_list;
> > > > > >      struct dpu_plane *pdpu;
> > > > > >      struct msm_drm_private *priv = dev->dev_private;
> > > > > >      struct dpu_kms *kms = to_dpu_kms(priv->kms);
> > > > > > -   struct dpu_hw_sspp *pipe_hw;
> > > > > > -   uint32_t num_formats;
> > > > > >      uint32_t supported_rotations;
> > > > > >      int ret;
> > > > > > -   /* initialize underlying h/w driver */
> > > > > > -   pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
> > > > > > -   if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
> > > > > > -           DPU_ERROR("[%u]SSPP is invalid\n", pipe);
> > > > > > -           return ERR_PTR(-EINVAL);
> > > > > > -   }
> > > > > > -
> > > > > > -   format_list = pipe_hw->cap->sblk->format_list;
> > > > > > -   num_formats = pipe_hw->cap->sblk->num_formats;
> > > > > > -
> > > > > >      pdpu = drmm_universal_plane_alloc(dev, struct dpu_plane, base,
> > > > > >                              0xff, &dpu_plane_funcs,
> > > > > >                              format_list, num_formats,
> > > > > > @@ -1479,7 +1591,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
> > > > > >      supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180;
> > > > > > -   if (pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION))
> > > > > > +   if (inline_rotation)
> > > > > >              supported_rotations |= DRM_MODE_ROTATE_MASK;
> > > > > >      drm_plane_create_rotation_property(plane,
> > > > > > @@ -1487,10 +1599,81 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
> > > > > >      drm_plane_enable_fb_damage_clips(plane);
> > > > > > -   /* success! finalize initialization */
> > > > > > +   DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
> > > > > > +                                   pipe, plane->base.id);
> > > > > > +   return plane;
> > > > > > +}
> > > > > > +
> > > > > > +struct drm_plane *dpu_plane_init(struct drm_device *dev,
> > > > > > +                            uint32_t pipe, enum drm_plane_type type,
> > > > > > +                            unsigned long possible_crtcs)
> > > > > > +{
> > > > > > +   struct drm_plane *plane = NULL;
> > > > > > +   struct msm_drm_private *priv = dev->dev_private;
> > > > > > +   struct dpu_kms *kms = to_dpu_kms(priv->kms);
> > > > > > +   struct dpu_hw_sspp *pipe_hw;
> > > > > > +
> > > > > > +   /* initialize underlying h/w driver */
> > > > > > +   pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
> > > > > > +   if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
> > > > > > +           DPU_ERROR("[%u]SSPP is invalid\n", pipe);
> > > > > > +           return ERR_PTR(-EINVAL);
> > > > > > +   }
> > > > > > +
> > > > > > +
> > > > > > +   plane = dpu_plane_init_common(dev, type, possible_crtcs,
> > > > > > +                                 pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION),
> > > > > > +                                 pipe_hw->cap->sblk->format_list,
> > > > > > +                                 pipe_hw->cap->sblk->num_formats,
> > > > > > +                                 pipe);
> > > > > > +   if (IS_ERR(plane))
> > > > > > +           return plane;
> > > > > > +
> > > > > >      drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
> > > > > >      DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
> > > > > >                                      pipe, plane->base.id);
> > > > > > +
> > > > > > +   return plane;
> > > > > > +}
> > > > > > +
> > > > > > +struct drm_plane *dpu_plane_init_virtual(struct drm_device *dev,
> > > > > > +                                    enum drm_plane_type type,
> > > > > > +                                    unsigned long possible_crtcs)
> > > > > > +{
> > > > > > +   struct drm_plane *plane = NULL;
> > > > > > +   struct msm_drm_private *priv = dev->dev_private;
> > > > > > +   struct dpu_kms *kms = to_dpu_kms(priv->kms);
> > > > > > +   bool has_inline_rotation = false;
> > > > > > +   const u32 *format_list = NULL;
> > > > > > +   u32 num_formats = 0;
> > > > > > +   int i;
> > > > > > +
> > > > > > +   /* Determine the largest configuration that we can implement */
> > > > > > +   for (i = 0; i < kms->catalog->sspp_count; i++) {
> > > > > > +           const struct dpu_sspp_cfg *cfg = &kms->catalog->sspp[i];
> > > > > > +
> > > > > > +           if (test_bit(DPU_SSPP_INLINE_ROTATION, &cfg->features))
> > > > > > +                   has_inline_rotation = true;
> > > > > > +
> > > > > > +           if (!format_list ||
> > > > > > +               cfg->sblk->csc_blk.len) {
> > > > > > +                   format_list = cfg->sblk->format_list;
> > > > > > +                   num_formats = cfg->sblk->num_formats;
> > > > > > +           }
> > > > > > +   }
> > > > > > +
> > > > > > +   plane = dpu_plane_init_common(dev, type, possible_crtcs,
> > > > > > +                                 has_inline_rotation,
> > > > > > +                                 format_list,
> > > > > > +                                 num_formats,
> > > > > > +                                 SSPP_NONE);
> > > > > > +   if (IS_ERR(plane))
> > > > > > +           return plane;
> > > > > > +
> > > > > > +   drm_plane_helper_add(plane, &dpu_plane_virtual_helper_funcs);
> > > > > > +
> > > > > > +   DPU_DEBUG("%s created virtual id:%u\n", plane->name, plane->base.id);
> > > > > > +
> > > > > >      return plane;
> > > > > >     }
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > > > > > index 31ee8b55c4dd..6d310bd9db30 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > > > > > @@ -78,6 +78,16 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
> > > > > >              uint32_t pipe, enum drm_plane_type type,
> > > > > >              unsigned long possible_crtcs);
> > > > > > +/**
> > > > > > + * dpu_plane_init_virtual - create new dpu virtualized plane
> > > > > > + * @dev:   Pointer to DRM device
> > > > > > + * @type:  Plane type - PRIMARY/OVERLAY/CURSOR
> > > > > > + * @possible_crtcs: bitmask of crtc that can be attached to the given pipe
> > > > > > + */
> > > > > > +struct drm_plane *dpu_plane_init_virtual(struct drm_device *dev,
> > > > > > +                                    enum drm_plane_type type,
> > > > > > +                                    unsigned long possible_crtcs);
> > > > > > +
> > > > > >     /**
> > > > > >      * dpu_plane_color_fill - enables color fill on plane
> > > > > >      * @plane:  Pointer to DRM plane object
> > > > > > @@ -94,4 +104,10 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable);
> > > > > >     static inline void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable) {}
> > > > > >     #endif
> > > > > > +int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> > > > > > +                          struct drm_atomic_state *state,
> > > > > > +                          struct drm_crtc *crtc,
> > > > > > +                          struct drm_plane_state **states,
> > > > > > +                          unsigned int num_planes);
> > > > > > +
> > > > > >     #endif /* _DPU_PLANE_H_ */
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > > index 44938ba7a2b7..feeef9d31653 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > > @@ -694,6 +694,74 @@ int dpu_rm_reserve(
> > > > > >      return ret;
> > > > > >     }
> > > > > > +static struct dpu_hw_sspp *dpu_rm_try_sspp(struct dpu_rm *rm,
> > > > > > +                                      struct dpu_global_state *global_state,
> > > > > > +                                      struct drm_crtc *crtc,
> > > > > > +                                      struct dpu_rm_sspp_requirements *reqs,
> > > > > > +                                      unsigned int type)
> > > > > > +{
> > > > > > +   uint32_t crtc_id = crtc->base.id;
> > > > > > +   struct dpu_hw_sspp *hw_sspp;
> > > > > > +   int i;
> > > > > > +
> > > > > > +   for (i = 0; i < ARRAY_SIZE(rm->hw_sspp); i++) {
> > > > > > +           if (!rm->hw_sspp[i])
> > > > > > +                   continue;
> > > > > > +
> > > > > > +           if (global_state->sspp_to_crtc_id[i])
> > > > > > +                   continue;
> > > > > > +
> > > > > > +           hw_sspp = rm->hw_sspp[i];
> > > > > > +
> > > > > > +           if (hw_sspp->cap->type != type)
> > > > > > +                   continue;
> > > > > > +
> > > > > > +           if (reqs->scale && !hw_sspp->cap->sblk->scaler_blk.len)
> > > > > > +                   continue;
> > > > > 
> > > > > We are already requesting a relevant SSPP when scale is needed so is this
> > > > > needed?
> > > > 
> > > > (here and below): yes, it is necessary for platforms like QCM2290, which
> > > > have ViG blocks, but no support for scaling.
> > > > 
> > > 
> > > Ok understood. Ack.
> > > 
> > > > > 
> > > > > > +
> > > > > > +           // TODO: QSEED2 and RGB scalers are not yet supported
> > > > > > +           if (reqs->scale && !hw_sspp->ops.setup_scaler)
> > > > > > +                   continue;
> > > > > > +
> > > > > 
> > > > > same here
> > > > 
> > > > We do not support QSEED2 setup, so it scaling is not possible on QSEED2
> > > > platforms even on ViG layers.
> > > > 
> > > 
> > > Ack. My memory seems a bit weak on the older platforms. But I trust your
> > > judgement with this one :)
> > > 
> > > 
> > > > > 
> > > > > > +           if (reqs->yuv && !hw_sspp->cap->sblk->csc_blk.len)
> > > > > > +                   continue;
> > > > > 
> > > > > same here
> > > > > > +
> > > > > > +           if (reqs->rot90 && !(hw_sspp->cap->features & DPU_SSPP_INLINE_ROTATION))
> > > > > > +                   continue;
> > > > > > +
> > > > > > +           global_state->sspp_to_crtc_id[i] = crtc_id;
> > > > > > +
> > > > > > +           return rm->hw_sspp[i];
> > > > > > +   }
> > > > > > +
> > > > > > +   return NULL;
> > > > > > +}
> > > > > > +struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
> > > > > > +                                   struct dpu_global_state *global_state,
> > > > > > +                                   struct drm_crtc *crtc,
> > > > > > +                                   struct dpu_rm_sspp_requirements *reqs)
> > > > > > +{
> > > > > > +   struct dpu_hw_sspp *hw_sspp = NULL;
> > > > > > +
> > > > > > +   if (!reqs->scale && !reqs->yuv)
> > > > > > +           hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_DMA);
> > > > > > +   if (!hw_sspp && reqs->scale)
> > > > > > +           hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_RGB);
> > > > > 
> > > > > I dont recollect whether RGB SSPPs supported scaling, if you have any source
> > > > > or link for this, that would help me for sure.
> > > > 
> > > > I have to dig further into the old fbdev driver. It looks like
> > > > mdss_mdp_qseed2_setup() is getting called for all plane types on the
> > > > corresponding hardware, but then it rejects scaling only for DMA and
> > > > CURSOR planes, which means that RGB planes should get the scaler setup.
> > > > 
> > > > For now this is from the SDE driver from 4.4:
> > > > 
> > > >    * @SDE_SSPP_SCALER_RGB,     RGB Scaler, supported by RGB pipes
> > > > 
> > > > > But even otherwise, I dont see any chipset in the catalog setting this SSPP
> > > > > type, so do we need to add this case?
> > > > 
> > > > Yes, we do. MSM8996 / MSM8937 / MSM8917 / MSM8953 use RGB planes.
> > > > 
> > > 
> > > Yes those chipsets do have RGB SSPP. My question was whether they have
> > > migrated to dpu and thats why I wanted to know whether we want to
> > > include RGB SSPP handling.
> > > 
> > > I do not even see them in msm_mdp5_dpu_migration.
> > 
> > Ugh, it's a bug then, I'll push a fix.
> > 
> 
> Actually this was part of the 6.13 MR. My apologies, I was on linux-next
> which was a week old.
> 
> Yes, I see this on the latest msm-next. I am fine with this part.

No worries. I also didn't have source code in front of my eyes at that
moment.

-- 
With best wishes
Dmitry

