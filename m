Return-Path: <linux-arm-msm+bounces-50262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8B2A4EE95
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 21:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADA40189512B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 20:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11B9259C83;
	Tue,  4 Mar 2025 20:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vBf6Pt9A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD231F8917
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 20:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741120953; cv=none; b=BzMVCF9zmsKv3KV1Pyypzyi25elh554qWrFXJCx9AfmLU3Xf/HLVGSG8lcp1jL/nVmK4mm+tvo+MJch7vN//oQacevS7GGz9Ue+K/oQrA1eB878ugrJ4WkLmhU0m8f4txLw6p+MpOngCqxYTqoebHKWnByAMEqpQHLdyVpYauI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741120953; c=relaxed/simple;
	bh=0v5TFBbzLfcEsAWXk1S8MU9NiLMkYTPhh1tX83lw89k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7e6EkMGy6+lSWBNXtz5wYNKTiXFkfq+mNvLhsVUCpBMZ8nlOheEoL+Gezx1xvdPK/eNoK/PNbj1MQCfB9GU2L/ktPzN+3OcWSTuclx0mbU74/cMz1kIH3G/roD/7sNudBnDZQSImlPb4mtceKWredIsPf2WyY51Jx0PPSLn3kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vBf6Pt9A; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5439a6179a7so208787e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 12:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741120948; x=1741725748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoTdlqcw6wcTXlWG/Em6UMsBHz7Z+aNoiE8O6gjrQws=;
        b=vBf6Pt9AFMzOPdaIS44XvE44Gf5Nw/H3krGJsnMku6mTsVqwmh36PSmhrjh+cGoR4R
         FqiQH/b8VkkKI0N2aqMBiVHWVcINd3UXiJqlIaTtsa4dS3l33mYOSxV1WLAiKAceZYJc
         Zy63I/78HmPPt5ES8HkXvAdNJa49/GVMiFQpPvfMi2cAyIWrjWBuiPqDXv1d2q/P0GJ7
         GMrcFFmSUB54VCbJkJZs8qZIJAiVc1kaLziHc8jaFTpV4o/1sK9CqsXmOgEsjL3O/S/y
         9+3jxEyjSIyEXCngwoOalv88JDDFcUtgpxUPwhoDkiFcvv23wSfRE2QcOSkbLOVtkRxj
         Uc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741120948; x=1741725748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoTdlqcw6wcTXlWG/Em6UMsBHz7Z+aNoiE8O6gjrQws=;
        b=jaS7eLwYz1EcFjAI96USciqmUh/CSrgbBpSzi3lG95cJcdq6qMY/x/W3mQSB+X+ik1
         ppoyRRHlJjJx7c/WqKXGimIcvL13a/2aYJDc13zxTzQ9zRkGGrLPziWESG8YoBANTBb3
         hptuWZYzbLxIQenTjy4Ug/XAY+oZWjziotdgWU9Peuw8qpPNUXFO4Keb1+tMAj+V6mxq
         oIUSLFqN6jJxj60jzJ4+/4RP+kingHq7p683drmTdR0yT3NbxlD1HJHKPxE/gTMwgEZr
         hJcEROvVVln3t1sG1HO4EsW6zNoDMN60f7lf2A7+QlBM4aXr/OQCWux9tKHeUUni0bml
         t58A==
X-Forwarded-Encrypted: i=1; AJvYcCWPftmuKRLvx4RQcUT0arus9wbM7+/nXsD0hhyjjw9DJiq3bcYeuZJOKy2AivZYez/DjRjWcvQzr8ASYGwP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0x4ntkN3qfAYfhQ10Vit2tFr8PxUmhYglZDW/jwgIDTe/GrsN
	Gzr/czfuc64kJiqeO4QltI8EFTASpJpwjyyX0LCFjGLB2NlFunqj0uQyAQJBqr8=
X-Gm-Gg: ASbGncsZJSKQ6aoWbikVEhSmFsalQFKUUbsMJ9nqBu3KMSkgNEs+8i3o7//ip2q9gtI
	B+3/YGtkzu6Yg9pNvOP9mny5eTcxX5t83cMgzpLIp12UXFVNC8/jaP2L5R9Hh5mOswnApIHenmH
	uFxkoz/UA3KfhVjuT1CMINW59JG0gUAzBByuGKFoLGn/3abEAuKIzx0ESu4T5tvn0cDUPFPnW2v
	CCn3s9AwRQBGpM23P3ImKXYNVElt6OKhNUVgqXkSXB0xooUvQ4chWaNTmefvCobWttAmrwfl9NP
	97vvnDHr6sGtiGH/bxj3Nn2So04pCCjeU0UFVxkll//79ApbddjV758qO+M1Ab3cr/TTyLXsS8R
	hb8Ka1KSZqQzFIvO32sOGT0kP
X-Google-Smtp-Source: AGHT+IHShnKNDydmjewtXjteVCKnFzIueDXZLJW1w6tSlsDu97sap95NxJ7wlQcNQex1dZVLUm3Uyw==
X-Received: by 2002:a05:6512:b0d:b0:545:5d:a5c7 with SMTP id 2adb3069b0e04-5497d58ce76mr149150e87.21.1741120947594;
        Tue, 04 Mar 2025 12:42:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495d268a42sm990011e87.175.2025.03.04.12.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 12:42:26 -0800 (PST)
Date: Tue, 4 Mar 2025 22:42:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] drm/msm/dpu: Force modeset if new CTLs have been
 reserved
Message-ID: <imxktwztfjyh4v6yuldgsluwv7wrx7qhvhgzsllnz3hnmmbc23@pnrfmdnjxg3b>
References: <20250303-force-modeset-hw-ctl-v1-1-9cbf6d4fbf8e@quicinc.com>
 <flc3cyky4wxfin7dlxhukwmhonze3napmuyhl2s6jbsgepco7a@q4l2ndh23lus>
 <4bb1d4a7-dd0b-4565-8d5d-ff8fd4cda20a@quicinc.com>
 <CAA8EJppMV7uj6w1_qr2AMVT7KYJiVqPRWBibqXtf3adLpRKcrw@mail.gmail.com>
 <a098b6f9-547d-42c7-b4f5-91762dc7c631@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a098b6f9-547d-42c7-b4f5-91762dc7c631@quicinc.com>

On Tue, Mar 04, 2025 at 11:38:24AM -0800, Abhinav Kumar wrote:
> 
> 
> On 3/3/2025 9:32 PM, Dmitry Baryshkov wrote:
> > On Tue, 4 Mar 2025 at 03:44, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 3/3/2025 3:49 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Mar 03, 2025 at 10:28:00AM -0800, Jessica Zhang wrote:
> > > > > If new CTLs are reserved by CRTC but atomic_enable() is skipped, the
> > > > > encoders will configure the stale CTL instead of the newly reserved one.
> > > > 
> > > > The CTLs are propagates in .atomic_mode_set(), not in .atomic_enable().
> > > 
> > > Hi Dmitry,
> > > 
> > > Yes, sorry mixed up the two function ops here and in my reply in the CWB
> > > thread.
> > > 
> > > > 
> > > > > 
> > > > > Avoid this by setting mode_changed to true if new CTLs have been
> > > > > reserved by CRTC.
> > > > 
> > > > This looks very strange. First we reserve new CTLs when there is a
> > > > modeset requested. Then on one of the next commits we detect that
> > > > encoder has stale CTLs and try to upgrade the commit to full modeset
> > > > (while the user might not have .allow_modeset set to true for whatever
> > > > reason, e.g. because only ACTIVE is changed).
> > > 
> > > Ah I see what you mean. I think this is an issue with how/when we're
> > > calling dpu_rm_reserve(). Since RM reservation is tied to
> > > atomic_check(), we aren't able to force a modeset based on HW block
> > > reservation. The only reason we were able to avoid this issue with
> > > needs_cdm is because needs_cdm didn't depend on the CDM HW block index.
> > > 
> > > I think there's not really a good way to avoid this other than flipping
> > > the order of the msm_atomic_check to drm_helper_atomic_check ->
> > > dpu_kms.check_mode_changed -> drm_atomic_helper_check_modeset().
> > 
> > No-no-no. This would require a full drm_atomic_helper_check() call
> > again, after the check_mode_changed() callback. But again, this should
> > not be required at all. The whole point of .check_mode_changed() is to
> > be called before performing full atomic_check() chains.
> > 
> 
> Right but the documentation also allows calling
> drm_atomic_helper_check_modeset() again. We are looking at all options even
> moving forward and not just this issue.

It does. But I'd rather not do it. Especially not in this case: we
perfectly know in advance if hw resources were reallocated or not.

> 
> > > 
> > > What do you think? It seems to be valid given the examples in the DRM
> > > docs [1]
> > > 
> > > [1]
> > > https://elixir.bootlin.com/linux/v6.13.5/source/drivers/gpu/drm/drm_atomic_helper.c#L610
> > > 
> > > > 
> > > > Could you please check if the following change fixes the issue: in
> > > > crtc_set_mode() replace the raw !new_crtc_state->mode_changed check with
> > > > the drm_atomic_crtc_needs_modeset() call?
> > > 
> > > This also fixes the DPMS failures. IIRC Abhinav had suggested a similar
> > > change to fix a different issue [2] and you gave some feedback on
> > > avoiding mode_set() for enable/disable calls which don't have mode_changed.
> > 
> > After reading the documentation for
> > drm_encoder_helper_funcs.atomic_mode_set() and looking around, I think
> > the issue is in the handling of the DPMS functions. I might have a fix
> > for the issue.
> > 
> > > Also, while this may fix the CWB CI failures, wouldn't the issue still
> > > remain regarding how to force modeset for changes in HW block reservation?
> > 
> > I think it is the other way around: HW block reservation is only
> > changed if there is a modeset. I'm currently testing my theory :-) We
> > were performing HW reassignment if drm_atomic_crtc_needs_modeset() was
> > true. However this function returns true in one of the cases, where
> > there is no actual modeset happening (and it's even documented this
> > way) - when only DPMS call has happened (in other words, when
> > .active_changed = true, but two other bits are false). It is required
> > not to reassign HW resources in such a case. So, I think, a correct
> > fix is to change the condition in dpu_crtc_atomic_check().
> > 
> 
> Yes, Jessica had also suggested this option. This will work because now the
> resource re-assignment will not happen and hence will avoid the issue. The
> documentation of DPMS was not fully clear. So it said, the same thing you
> mentioned, that when active has changed there is no need to reassign
> hardware resources but I was not sure if that would impact normal
> suspend/resume because across suspend/resume hardware resources need to be
> cleared / re-assigned.

Suspend / resume is handled via the helpers, which commit an
all-disabled state and then commit a previous state. Other than that,
there is no need to clear resource assignments during suspend resume.
They should be disabled, but there is no need to drop the assignment.

> I do still think that, even if this also works, we
> will still run into issues when we will need to force a mode_changed based
> on resource assignment of other encoder based blocks such as DSC or PP etc.

This is what dpu_encoder_needs_modeset() is for. On the other hand,
note, if we reassigned resources, it means that either mode_changes or
connectors_changed is set. And the DRM framework will call encoder's
atomic_mode_set() in such a case.

> 
> > > 
> > > [2] https://gitlab.freedesktop.org/drm/msm/-/issues/59
> > > 
> > > Thanks,
> > > 
> > > Jessica Zhang
> > > 
> > > > 
> > > > > 
> > > > > Note: This patch only adds tracking for the CTL reservation, but eventually
> > > > > all HW blocks used by encoders (i.e. DSC, PINGPONG, CWB) should have a
> > > > > similar check to avoid the same issue.
> > > > > 
> > > > > Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > Closes: https://lists.freedesktop.org/archives/freedreno/2025-February/036719.html
> > > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 13 +++++++++++++
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++++++++++
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  1 +
> > > > >    3 files changed, 26 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > index 4073d821158c0..a1a8be8f5ab9f 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > @@ -1406,19 +1406,32 @@ int dpu_crtc_check_mode_changed(struct drm_crtc_state *old_crtc_state,
> > > > >       struct drm_crtc *crtc = new_crtc_state->crtc;
> > > > >       bool clone_mode_enabled = drm_crtc_in_clone_mode(old_crtc_state);
> > > > >       bool clone_mode_requested = drm_crtc_in_clone_mode(new_crtc_state);
> > > > > +    struct dpu_crtc_state *cstate = to_dpu_crtc_state(new_crtc_state);
> > > > > +    uint32_t enc_ctl_mask = 0;
> > > > > +    uint32_t crtc_ctl_mask = 0;
> > > > > +    struct dpu_crtc_mixer *m;
> > > > > 
> > > > >       DRM_DEBUG_ATOMIC("%d\n", crtc->base.id);
> > > > > 
> > > > > +    for (int i = 0; i < cstate->num_mixers; i++) {
> > > > > +            m = &cstate->mixers[i];
> > > > > +            crtc_ctl_mask |= BIT(m->lm_ctl->idx - CTL_0);
> > > > > +    }
> > > > > +
> > > > >       /* there might be cases where encoder needs a modeset too */
> > > > >       drm_for_each_encoder_mask(drm_enc, crtc->dev, new_crtc_state->encoder_mask) {
> > > > >               if (dpu_encoder_needs_modeset(drm_enc, new_crtc_state->state))
> > > > >                       new_crtc_state->mode_changed = true;
> > > > > +            enc_ctl_mask |= dpu_encoder_get_ctls(drm_enc);
> > > > >       }
> > > > > 
> > > > >       if ((clone_mode_requested && !clone_mode_enabled) ||
> > > > >           (!clone_mode_requested && clone_mode_enabled))
> > > > >               new_crtc_state->mode_changed = true;
> > > > > 
> > > > > +    if (crtc_ctl_mask != enc_ctl_mask)
> > > > > +            new_crtc_state->mode_changed = true;
> > > > > +
> > > > >       return 0;
> > > > >    }
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > > index a61598710acda..2f3101caeba91 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > > @@ -188,6 +188,7 @@ struct dpu_encoder_virt {
> > > > > 
> > > > >       unsigned int dsc_mask;
> > > > >       unsigned int cwb_mask;
> > > > > +    unsigned int ctl_mask;
> > > > > 
> > > > >       bool intfs_swapped;
> > > > > 
> > > > > @@ -707,6 +708,13 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
> > > > >       }
> > > > >    }
> > > > > 
> > > > > +uint32_t dpu_encoder_get_ctls(struct drm_encoder *drm_enc)
> > > > > +{
> > > > > +    struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > > > > +
> > > > > +    return dpu_enc->ctl_mask;
> > > > > +}
> > > > > +
> > > > >    bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state)
> > > > >    {
> > > > >       struct drm_connector *connector;
> > > > > @@ -1155,6 +1163,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > > > >       bool is_cwb_encoder;
> > > > >       unsigned int dsc_mask = 0;
> > > > >       unsigned int cwb_mask = 0;
> > > > > +    unsigned int ctl_mask = 0;
> > > > >       int i;
> > > > > 
> > > > >       if (!drm_enc) {
> > > > > @@ -1245,11 +1254,14 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > > > >                               "no ctl block assigned at idx: %d\n", i);
> > > > >                       return;
> > > > >               }
> > > > > +            ctl_mask |= BIT(phys->hw_ctl->idx - CTL_0);
> > > > > 
> > > > >               phys->cached_mode = crtc_state->adjusted_mode;
> > > > >               if (phys->ops.atomic_mode_set)
> > > > >                       phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
> > > > >       }
> > > > > +
> > > > > +    dpu_enc->ctl_mask = ctl_mask;
> > > > >    }
> > > > > 
> > > > >    static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > > > > index ca1ca2e51d7ea..70b03743dc346 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > > > > @@ -91,6 +91,7 @@ bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_st
> > > > > 
> > > > >    void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
> > > > >               struct drm_writeback_job *job);
> > > > > +uint32_t dpu_encoder_get_ctls(struct drm_encoder *drm_enc);
> > > > > 
> > > > >    void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
> > > > >               struct drm_writeback_job *job);
> > > > > 
> > > > > ---
> > > > > base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
> > > > > change-id: 20250228-force-modeset-hw-ctl-d02b80a2bb4c
> > > > > prerequisite-change-id: 20241222-drm-dirty-modeset-88079bd27ae6:v2
> > > > > prerequisite-patch-id: 0c61aabfcd13651203f476985380cbf4d3c299e6
> > > > > prerequisite-patch-id: c6026f08011c288fd301676e9fa6f46d0cc1dab7
> > > > > prerequisite-patch-id: b0cb06d5c88791d6e4755d879ced0d5050aa3cbf
> > > > > prerequisite-patch-id: fd72ddde9dba0df053113bc505c213961a9760da
> > > > > prerequisite-change-id: 20250209-dpu-c3fac78fc617:v2
> > > > > prerequisite-patch-id: c84d2b4b06be06384968429085d1e8ebae23a583
> > > > > prerequisite-patch-id: fb8ea7b9e7c85fabd27589c6551108382a235002
> > > > > prerequisite-change-id: 20250211-dither-disable-b77b1e31977f:v1
> > > > > prerequisite-patch-id: 079e04296212b4b83d51394b5a9b5eea6870d98a
> > > > > prerequisite-change-id: 20240618-concurrent-wb-97d62387f952:v6
> > > > > prerequisite-patch-id: b52034179741dc182aea9411fd446e270fdc69d1
> > > > > prerequisite-patch-id: bc472765a7d5214691f3d92696cc8b0119f3252e
> > > > > prerequisite-patch-id: c959bc480e96b04297ebaf30fea3a68bbac69da6
> > > > > prerequisite-patch-id: f7db8449b241a41faac357d9257f8c7cb16503ec
> > > > > prerequisite-patch-id: 7beb73131d0ab100f266fcd3c1f67c818a3263f4
> > > > > prerequisite-patch-id: c08cbb5cf4e67e308afd61fdad6684b89429d3b6
> > > > > prerequisite-patch-id: a4e343143b8fbe98ae4aa068cc459c750105eb9d
> > > > > prerequisite-patch-id: 1d09edcf12ef7e7ab43547eefacae5b604b698e9
> > > > > prerequisite-patch-id: 0008f9802bfd3c5877267666cceb7608203e5830
> > > > > prerequisite-patch-id: 49402eb767c97915faf2378c5f5d05ced2dcfdac
> > > > > prerequisite-patch-id: 522be2a6b5fe4e3a2d609526bb1539f9bc6f828f
> > > > > prerequisite-patch-id: 031da00d0fffd522f74d682a551362f3ecda0c71
> > > > > prerequisite-patch-id: 9454cec22231a8f3f01c33d52a5df3e26dd88287
> > > > > prerequisite-patch-id: 7edbeaace3549332e581bee3183a76b0e4d18163
> > > > > 
> > > > > Best regards,
> > > > > --
> > > > > Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > > 
> > > > 
> > > > --
> > > > With best wishes
> > > > Dmitry
> > > 
> > 
> > 
> 

-- 
With best wishes
Dmitry

