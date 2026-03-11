Return-Path: <linux-arm-msm+bounces-96937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHGCFFFAsWmtswIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:13:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EB3261DD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BCBB6301300E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3513B7B7E;
	Wed, 11 Mar 2026 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kUAJLKLC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B053367F5E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773224013; cv=pass; b=XkamJdLfyH+hCs39bucOZejqZIqmsx7AVem3LcwqibBfQJEAAPiDvWNO1Zy7bLgSdSx+QYnOWZnQ4xwqleVnDvVZ0FAJfByAOv9Af6n8wDfwoPW/iTZkYtyqwUhOVZM38f2Qz2LzQAPzF7Lmcf5+7YVqHvBdat6ipU8AscIcV/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773224013; c=relaxed/simple;
	bh=PyepT9rJARLYRKial4qSFGX/BKl7sWZBOgS/F5DBBbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UF4IqrBXHyVQheaW2q5hMFvzlXAZm1ZGEBtloLU4Kf1kXE8WKrDuhNbkbFTSPwZC6xToeEkmo+OY+TUXbIiZi4H6ZY7XvFFu1HpgARHW/R8l2sSHYi11iQCz5vitJyMjREdvROB0d0F+u197t5is9OJjK0BnSOmjrZ/RpHODp+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kUAJLKLC; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7947cf097c1so130663317b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:13:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773224011; cv=none;
        d=google.com; s=arc-20240605;
        b=CGGngX5+rLxXkfqrt6s/5nTeYwcbHVWuRRLAEzNGsycdF+RBrYiriLZhF1MQle65/5
         HOTdAg1ld1pxuUEr5R9iPavihFD4EA9tYXGRzfzxK4+DgGT7Noe82f294nH64JuGVych
         s2BebzZ74eZ1YEeJ5TNbm4HSpIow577QC2uCghOWKrBo3jI1W7necxcDU210FU6uT/qp
         LUftEaVAsg1fNFqjZcemPrHcLJQGgp+9x2qhotDkN3EZNuZG56izgQ0CrjB0eLiaQRaf
         hGEDb4ihwUNmVayI2WCj7yqSFPDkQkHykMCQ0sELiGktFuvKmHDsVVWH7D1LBUxBO0YY
         KXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iSdLoEPm1WjPARqSdEgAbmphAx97zQhnbfUKa1e16Go=;
        fh=YQrlLDyqJbR16gbWatZQ+D9HDmx6A8CwGlRqWkygkcE=;
        b=CJ4XMQSRNmmZAz2YWFviQPhakaToNAuXLyaXyKlwPDKGXbe1pSEUIeafPW8OpQL05m
         DMgUSq69/AClw2mMqdg7CjRSYLGLYdiZMFOKf+i4BaHHZZBBTBNxF2j9ay0/k1Nm7kLy
         h6Zprg/dveqoObos/tBeTDm28p21pWcG08vtfPv8xvt2nACnb/ANoafGQVo5tqS1DTN8
         84nD+mGtp5J1Sh9axbhQCTzF/G2NhKVXjBU1A88HI5ovM25WyxBom+sTLZOHts8r1b3d
         Ads9Ucx0rf72vrdZO5GM7fZxbmdzhO3kG9e1mZr2q4OG6EXVbYUGtLXGkNJao/NSezOC
         0Mqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773224011; x=1773828811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSdLoEPm1WjPARqSdEgAbmphAx97zQhnbfUKa1e16Go=;
        b=kUAJLKLCn3TkVukp7XILeBhYDFYvAnu6bjnVZrsjmwK21tMf+IUz1czQOQ8+4vL69g
         8OpE2bpfUbPtL4MZvUNmP0izbABF9vqUxlb2nljulyvtMXbKFTM8BvDDBC9lEiibiKei
         S8vTcrZif2/g+gmoI1nGf8oDybZO9gTSAsBjew6DqIQfVVOmz0Og+Aay2hDcVcCtX3IN
         MWKAszCN4CsSkWIpG9X+XX26UP5vCYJOs0PJ3fGciF/C9N0maFyP/6ClX7MPtsXtwwLy
         9/b+nz5hXJfNoj/iMX1deHIuWWUjKRGuiUnvDgeNoUk8DsLhO/aH2Ma3B8w9cBrnKYhE
         FAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224011; x=1773828811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iSdLoEPm1WjPARqSdEgAbmphAx97zQhnbfUKa1e16Go=;
        b=duRZW6jwIITKgLUzVv1z2OxfoamP+uHG95Gl/g37hifuGgaU0267kfDGvs5kA3K6KV
         xrBljzYHTTEHM9OqDUBDxaKZSsSZDr615QNhQmPS9cdM+WNtdVj5kmjcvP8BfhwcVZQB
         VC8MLny1va2l5x01ciAvVTJAIEhNcXgQC9EHSv9NeAgE7BsaAF/WEyOJORaL5+KHmDIl
         z2MHzEKXn225CyEv+YbPWCqdycMGhT/M9m9LC7w8farGbii6OEeILOH8v7TsKbsMuKDv
         +IK/Di9CWLXOOUqgNHjjtW4EIY5+OOCJSizHI9v+AIY9djXecemY6L2F8JbzN9PdYXhL
         JhZA==
X-Forwarded-Encrypted: i=1; AJvYcCUwS//sJCemhXhIG74gDFOqcQadUNEVGc3CK2JQ7OtbkTDGLUsl+KCdp5+j202NwKWynkehz/yIhPXmpA5x@vger.kernel.org
X-Gm-Message-State: AOJu0YzOfoLqhsHI1dpkvzVM86pstxl6Q39WZptWl7dJerJqMeALBscM
	PTTp7UgiUd7xVQ4hK0dWitTnYr++tSk9tAI64zaUAVDrG18MXOBnuTlGzbZ88arUWk1gg1MYiLJ
	7FvqYhswUHZ7l53MSxVsOpQvvjEUKgk8OpToNCwVq8g==
X-Gm-Gg: ATEYQzy6GHxmGU6ercP+ebqwX+0t2wJMV7TnDAWPvDcrZN1N4n0B9e6Kz1vH3d3F2By
	E1Z9eU89jFym3xZ1W/on5oMSTGwqfjyrm2oglmCJNf1fCDK4DBFHnhZB1i520jgWph+jKaSThg4
	p0JR6m6TFDjx4UeTeI3kN2fRZSCMgTk+eMFUQAC0mHMYm1d/KDnJJwv/cPy3W70D4iRbmhOGx3e
	fINax05xjA/O1KkzAzNQQjN/YC1Yl2v2VGYntQpgeA7Ch/E6CgXW6KP7B+1+PEYYfGC4U/MRc2G
	r5RJBhUBXuQ=
X-Received: by 2002:a05:690c:660c:b0:798:7b8d:2bb with SMTP id
 00721157ae682-79917ea482cmr15808877b3.5.1773224010979; Wed, 11 Mar 2026
 03:13:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
 <20260213-msm-next-quad-pipe-split-v18-2-5815158d3635@linaro.org> <pufuo7jq4olww3ksyawqkoee34cl4fhtpfh3sh2kfuimajswod@gv4rp6wsnrhx>
In-Reply-To: <pufuo7jq4olww3ksyawqkoee34cl4fhtpfh3sh2kfuimajswod@gv4rp6wsnrhx>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 11 Mar 2026 18:13:19 +0800
X-Gm-Features: AaiRm53nPnYTMwDuR0i_v6f_GugGoJW4W4_XiBlP-4qKJNAq8BJxq87rBTbj8s0
Message-ID: <CABymUCNu99=AYiMoKnFmwkdj6aPvxe+LA0yuC83kn+PMY=5fjg@mail.gmail.com>
Subject: Re: [PATCH v18 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC check
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C0EB3261DD7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96937-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
2=E6=9C=8814=E6=97=A5=E5=91=A8=E5=85=AD 01:03=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Feb 13, 2026 at 10:54:26PM +0800, Jun Nie wrote:
> > Currently, mapping plane to SSPP occurs during the plane check phase fo=
r
> > non-virtual plane case. The SSPP allocation and plane mapping occurs du=
ring
> > crtc check phase for virtual plane case. Defer these SSPP operations un=
til
>
> Nit: CRTC
>
> > CRTC check stage to unify the 2 cases, and ease later revisement for
> > quad-pipe change.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   3 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 155 +++++++++++++---------=
--------
> >  2 files changed, 66 insertions(+), 92 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 6bf7c46379aed..797296b14264e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1534,8 +1534,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc =
*crtc,
> >                       return rc;
> >       }
> >
> > -     if (dpu_use_virtual_planes &&
> > -         (crtc_state->planes_changed || crtc_state->zpos_changed)) {
> > +     if (crtc_state->planes_changed || crtc_state->zpos_changed) {
> >               rc =3D dpu_crtc_reassign_planes(crtc, crtc_state);
>
> dpu_crtc_reassing_planes() starts by freeing all SSPPs. It should not be
> used in a non-virtual-plane case. I'd suggest duplicating the function
> and stripping out all code and data related to virtual planes.
>
> >               if (rc < 0)
> >                       return rc;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 66f240ce29d07..be1a7fcf11b81 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1119,102 +1119,24 @@ static int dpu_plane_atomic_check(struct drm_p=
lane *plane,
> >       struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_pl=
ane_state(state,
> >                                                                        =
        plane);
> >       int ret =3D 0;
> > -     struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> > -     struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane_s=
tate);
> > -     struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> > -     struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> > -     struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> > -     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> > -     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > -     const struct drm_crtc_state *crtc_state =3D NULL;
> > -     uint32_t max_linewidth =3D dpu_kms->catalog->caps->max_linewidth;
> > +     struct drm_crtc_state *crtc_state =3D NULL;
> >
> >       if (new_plane_state->crtc)
> >               crtc_state =3D drm_atomic_get_new_crtc_state(state,
> >                                                          new_plane_stat=
e->crtc);
> >
> > -     pipe->sspp =3D dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > -
> > -     if (!pipe->sspp)
> > -             return -EINVAL;
> > -
> >       ret =3D dpu_plane_atomic_check_nosspp(plane, new_plane_state, crt=
c_state);
> >       if (ret)
> >               return ret;
> >
> > -     ret =3D dpu_plane_split(plane, new_plane_state, crtc_state);
> > -     if (ret)
> > -             return ret;
> > -
> >       if (!new_plane_state->visible)
> >               return 0;
> >
> > -     if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_p=
ipe_cfg,
> > -                                           pipe->sspp,
> > -                                           msm_framebuffer_format(new_=
plane_state->fb),
> > -                                           max_linewidth)) {
> > -             DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RE=
CT_FMT
> > -                             " max_line:%u, can't use split source\n",
> > -                             DRM_RECT_ARG(&pipe_cfg->src_rect),
> > -                             DRM_RECT_ARG(&r_pipe_cfg->src_rect),
> > -                             max_linewidth);
> > -             return -E2BIG;
> > -     }
> > -
> > -     return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > -}
> > -
> > -static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
> > -                                       struct drm_atomic_state *state)
> > -{
> > -     struct drm_plane_state *plane_state =3D
> > -             drm_atomic_get_plane_state(state, plane);
> > -     struct drm_plane_state *old_plane_state =3D
> > -             drm_atomic_get_old_plane_state(state, plane);
> > -     struct dpu_plane_state *pstate =3D to_dpu_plane_state(plane_state=
);
> > -     struct drm_crtc_state *crtc_state =3D NULL;
> > -     int ret, i;
> > -
> > -     if (IS_ERR(plane_state))
> > -             return PTR_ERR(plane_state);
> > -
> > -     if (plane_state->crtc)
> > -             crtc_state =3D drm_atomic_get_new_crtc_state(state,
> > -                                                        plane_state->c=
rtc);
> > -
> > -     ret =3D dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_st=
ate);
> > -     if (ret)
> > -             return ret;
> > -
> > -     ret =3D dpu_plane_split(plane, plane_state, crtc_state);
> > -     if (ret)
> > -             return ret;
> > -
> > -     if (!plane_state->visible) {
> > -             /*
> > -              * resources are freed by dpu_crtc_assign_plane_resources=
(),
> > -              * but clean them here.
> > -              */
> > -             for (i =3D 0; i < PIPES_PER_PLANE; i++)
> > -                     pstate->pipe[i].sspp =3D NULL;
> > -
> > -             return 0;
> > -     }
> > -
> >       /*
> > -      * Force resource reallocation if the format of FB or src/dst hav=
e
> > -      * changed. We might need to allocate different SSPP or SSPPs for=
 this
> > -      * plane than the one used previously.
> > +      * To trigger the callback of dpu_assign_plane_resources() to
> > +      * finish the sspp assignment or allocation and check.
> >        */
> > -     if (!old_plane_state || !old_plane_state->fb ||
> > -         old_plane_state->src_w !=3D plane_state->src_w ||
> > -         old_plane_state->src_h !=3D plane_state->src_h ||
> > -         old_plane_state->crtc_w !=3D plane_state->crtc_w ||
> > -         old_plane_state->crtc_h !=3D plane_state->crtc_h ||
> > -         msm_framebuffer_format(old_plane_state->fb) !=3D
> > -         msm_framebuffer_format(plane_state->fb))
> > -             crtc_state->planes_changed =3D true;
> > -
> > +     crtc_state->planes_changed =3D true;
>
> Why do we need to enforce this? Previously it was limited to the cases
> when the plane has actually changed and required revalidation.
>
> >       return 0;
> >  }
> >
> > @@ -1261,9 +1183,9 @@ static int dpu_plane_virtual_assign_resources(str=
uct drm_crtc *crtc,
> >                                             struct dpu_global_state *gl=
obal_state,
> >                                             struct drm_atomic_state *st=
ate,
> >                                             struct drm_plane_state *pla=
ne_state,
> > +                                           const struct drm_crtc_state=
 *crtc_state,
> >                                             struct drm_plane_state **pr=
ev_adjacent_plane_state)
> >  {
> > -     const struct drm_crtc_state *crtc_state =3D NULL;
> >       struct drm_plane *plane =3D plane_state->plane;
> >       struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> >       struct dpu_rm_sspp_requirements reqs;
> > @@ -1273,10 +1195,6 @@ static int dpu_plane_virtual_assign_resources(st=
ruct drm_crtc *crtc,
> >       const struct msm_format *fmt;
> >       int i, ret;
> >
> > -     if (plane_state->crtc)
> > -             crtc_state =3D drm_atomic_get_new_crtc_state(state,
> > -                                                        plane_state->c=
rtc);
> > -
> >       pstate =3D to_dpu_plane_state(plane_state);
> >       for (i =3D 0; i < STAGES_PER_PLANE; i++)
> >               prev_adjacent_pstate[i] =3D prev_adjacent_plane_state[i] =
?
> > @@ -1288,6 +1206,10 @@ static int dpu_plane_virtual_assign_resources(st=
ruct drm_crtc *crtc,
> >       if (!plane_state->fb)
> >               return -EINVAL;
> >
> > +     ret =3D dpu_plane_split(plane, plane_state, crtc_state);
> > +     if (ret)
> > +             return ret;
> > +
> >       fmt =3D msm_framebuffer_format(plane_state->fb);
> >       reqs.yuv =3D MSM_FORMAT_IS_YUV(fmt);
> >       reqs.scale =3D (plane_state->src_w >> 16 !=3D plane_state->crtc_w=
) ||
> > @@ -1318,14 +1240,56 @@ static int dpu_plane_virtual_assign_resources(s=
truct drm_crtc *crtc,
> >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> >  }
> >
> > +static int dpu_plane_assign_resources(struct drm_crtc *crtc,
> > +                                   struct dpu_global_state *global_sta=
te,
> > +                                   struct drm_atomic_state *state,
> > +                                   struct drm_plane_state *plane_state=
,
> > +                                   const struct drm_crtc_state *crtc_s=
tate,
> > +                                   struct drm_plane_state **prev_adjac=
ent_plane_state)
> > +{
> > +     struct drm_plane *plane =3D plane_state->plane;
> > +     struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> > +     struct dpu_plane_state *pstate =3D to_dpu_plane_state(plane_state=
);
> > +     struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> > +     struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> > +     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> > +     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > +     struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> > +     int ret;
> > +
> > +     pipe->sspp =3D dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > +     if (!pipe->sspp)
> > +             return -EINVAL;
> > +
> > +     ret =3D dpu_plane_split(plane, plane_state, crtc_state);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_p=
ipe_cfg,
> > +                                           pipe->sspp,
> > +                                           msm_framebuffer_format(plan=
e_state->fb),
> > +                                           dpu_kms->catalog->caps->max=
_linewidth)) {
> > +             DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RE=
CT_FMT
> > +                             " max_line:%u, can't use split source\n",
> > +                             DRM_RECT_ARG(&pipe_cfg->src_rect),
> > +                             DRM_RECT_ARG(&r_pipe_cfg->src_rect),
> > +                             dpu_kms->catalog->caps->max_linewidth);
> > +             return -E2BIG;
> > +     }
> > +
> > +     return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > +}
> > +
> >  int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> >                              struct drm_atomic_state *state,
> >                              struct drm_crtc *crtc,
> >                              struct drm_plane_state **states,
> >                              unsigned int num_planes)
> >  {
> > -     unsigned int i;
> >       struct drm_plane_state *prev_adjacent_plane_state[STAGES_PER_PLAN=
E] =3D { NULL };
> > +     const struct drm_crtc_state *crtc_state =3D NULL;
> > +     unsigned int i;
> > +     int ret;
> >
> >       for (i =3D 0; i < num_planes; i++) {
> >               struct drm_plane_state *plane_state =3D states[i];
> > @@ -1334,8 +1298,19 @@ int dpu_assign_plane_resources(struct dpu_global=
_state *global_state,
> >                   !plane_state->visible)
> >                       continue;
> >
> > -             int ret =3D dpu_plane_virtual_assign_resources(crtc, glob=
al_state,
> > +             if (plane_state->crtc)
> > +                     crtc_state =3D drm_atomic_get_new_crtc_state(stat=
e,
> > +                                                                plane_=
state->crtc);
> > +
> > +             if (!dpu_use_virtual_planes)
> > +                     ret =3D dpu_plane_assign_resources(crtc, global_s=
tate,
> > +                                                      state, plane_sta=
te,
> > +                                                      crtc_state,
> > +                                                      prev_adjacent_pl=
ane_state);
>
> This is an overkill for the non-virtual case. We don't need adjancent
> states, we don't need the array of plane state pointers, etc.

Hi Dmitry,

For the array of plane state pointers, I find we have to use it in the
 non-virtual
case too. Because the logic is moved from plane atomic_check.
The goal is to assign SSPP for every plane and atomic_check is called for
every plane before this patch. dpu_assign_plane_resources here is called
from crtc side just once so all SSPP assignments should be done in one call
with plane_state in an array.
Or I misunderstand your comments?

Regards,
Jun

>
> > +             else
> > +                     ret =3D dpu_plane_virtual_assign_resources(crtc, =
global_state,
> >                                                            state, plane=
_state,
> > +                                                          crtc_state,
> >                                                            prev_adjacen=
t_plane_state);
> >               if (ret)
> >                       return ret;
> > @@ -1772,7 +1747,7 @@ static const struct drm_plane_helper_funcs dpu_pl=
ane_helper_funcs =3D {
> >  static const struct drm_plane_helper_funcs dpu_plane_virtual_helper_fu=
ncs =3D {
> >       .prepare_fb =3D dpu_plane_prepare_fb,
> >       .cleanup_fb =3D dpu_plane_cleanup_fb,
> > -     .atomic_check =3D dpu_plane_virtual_atomic_check,
> > +     .atomic_check =3D dpu_plane_atomic_check,
> >       .atomic_update =3D dpu_plane_atomic_update,
> >  };
> >
> >
> > --
> > 2.43.0
> >
>
> --
> With best wishes
> Dmitry

