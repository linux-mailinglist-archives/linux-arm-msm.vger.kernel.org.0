Return-Path: <linux-arm-msm+bounces-92850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGspHqZikGlQZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 12:55:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0B813BC77
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 12:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 01B2730065F1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 11:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34352DC792;
	Sat, 14 Feb 2026 11:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PwA80EWF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3B825CC6C
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Feb 2026 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771070115; cv=pass; b=KaNmq6ItsdkjX+PHEjEqT2vA/3469GfooTS7PhSQRE+Ch0DERQ9Q0Er24Ft9yy2/tmk29yCjRyM7ESgod3pVxSlOkzpEjl3IWdf/pOY5fpmralMVx+1/fjEfee6jXqLk5yZkNEg6RoF3OzXyEl4ABNuSgQ5ax9PgAeUo46kdJ+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771070115; c=relaxed/simple;
	bh=o+R+pXMLHxaMG0kVkK40fDjY2+nrfDhTscLlh6Rzf+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYNuEoYv3E6NxTmfI+SeOigKYadPeEn/IQSlvtOq/YBthXJNzpRQ/itW4q38L4H/HD4Ect4ms9SLIB1HaZ/67h4vxz2ZWcilDgqvuZUM3tNtSKOUCihiVVXryYrVazTy5dmtaUr8l5vu4VFk3v1Mo222br4RsYimEDYeo+iWViI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PwA80EWF; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64aefa98fe6so1720623d50.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Feb 2026 03:55:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771070113; cv=none;
        d=google.com; s=arc-20240605;
        b=hSobnE1MiVByoQ722XnQDV8NBV9TbLT7VwQT5hyMy+oazPgP8UoEBtHZUVxY6Opqoi
         zqHoXcE8p9hHG29KK72oLvrhPSnKJMUreqQvk1vuQjli/u5UafaBTYIWD1khfu4O5AKd
         ukEgccBkaC+JcqQI2OcJtUThpVlKA8LX6JPI9rzjT0GjL50PnMoevBIibDbnjJI2AHVZ
         UvoCM7gLxz9pN/nqhd6Mmkm/7WRtfbzLZDrWd4XX6QbzDJOBTdL0VB2EsfVBgcDQ5UD3
         HVyGQ6GzMlyMZ1ucaTW7CWM6bOmdAl2QKglvWcUodXv+WuDtHqMxExNrSTC43MbTxaQn
         I/kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sfC50XSQItSsLfF856D24b0b0ZI/QZxB3Dst2QZCTGg=;
        fh=/vH3NUOge4jsxBuXiIe+O5ulqYPe1ZHilcAgQTLpVVw=;
        b=A4HQ7QORdyWR1bgHfH75FQksY9yxEV7OEacBQiqYC2mDmA+hl2nSAmSedIao08SvPQ
         USPu4DO+HZ5Bdn7rSEc5rQaA+cA9hGZwnyrVYC71W9hvAdtMq8GfayBCt+hLA28aD0HH
         Ug/YLRO9cGIF1UtREgHUfq6qGzScGw/ReH4zZeYXQFJvrKGYrBX+lXsmuym1c8HXl41K
         W7UIUjhWZ1dYcCI7aV2Scvv1lNWyxH4GNSxTzw4zbWXcr8SF2ydFzYXfmjqmZtk+y446
         3oYX9YAhsNlveipyOGjsi0PSqatPrG77sb9OUqwZCnirJOsMTOuD0fDGA9R33n8teRFZ
         cilg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771070113; x=1771674913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfC50XSQItSsLfF856D24b0b0ZI/QZxB3Dst2QZCTGg=;
        b=PwA80EWFrjdx12uTiUFWQAj9DlD8OHEaRmqwA79CChw7JtyTcBj433pDTvkx5I9qZk
         dVNdYy68yq2MroP/148aN/fW9aMU5q0yBetzxc2FfPIbHeN8gd4qCz+8qQtysIkyVIqa
         B5aaGLTqq76n8yHVBploFy028nM1W5GuAkJdBXtLUHj7MbCtojazY26lg084CVE858gu
         OpwlB5eshhEuJGUeIkqGYJIpM/2D1G/ZSLbk3IOf6ayhpgKAob4P2AsgGkbG/V9wsa/A
         gCgnH86KPhZVR+s6moB3P84kFE6drPRi1T00SmsJVkkBHBkB4MJGdoRO7ayvd5bSUOXY
         x9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771070113; x=1771674913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sfC50XSQItSsLfF856D24b0b0ZI/QZxB3Dst2QZCTGg=;
        b=CJW/huQuRtiPUJi2aIkyQh/20WEgqDRDlMzMSPnoRE8R81tVAFeTZlX7QyTQQZKeoa
         K9cZ+ASB7r2zhjsofZaqS9wxlAoNqNeGu7be7vCpPQSEUaqoyfuEkdq/EX6VdufeAD8Y
         jqmEHG+ddFbwXWEoHi+7DMZI36zDo0Zg6wwdOKqnM0PZ581nsPw9AWIKoLIHKjgc2Gn5
         JC2gRo/v/VDHJR45nQR75CpakxK8g2ZHqEVjiOG/AU84Vss6O06H4OMxly7YNUUE1O/Y
         ziAwIV41B7xDskQnzHUtES0Fhl3EciAxkwIGvBNVXScw/aBjYGsBxYS4KwsJZ7IJPnl6
         YhFA==
X-Forwarded-Encrypted: i=1; AJvYcCX+rXVmBYP+eRuMJ1FdV5U+fVVmuEeNSq97wrmAsYAdamFxwxwspnSCo5Q8p4ZKYSOJZdRiwA2cGAu5Or3R@vger.kernel.org
X-Gm-Message-State: AOJu0YwFUYs2h9qQmURpQ7GO/B/Os/JT1nnOdP/CFvwDKfEBhDSQYZeK
	tFtDHMI6S1DMOETRHXZ9Lpyg4HKpHmdPEWgPgIL1Lvur+EqTfxT8Qoyf0+EeRhTy9xP0AAHRYE/
	HfYPnxDDrXOQSRrOL3egRJzSkjwjJeY38sH+uJT0VbQ==
X-Gm-Gg: AZuq6aJpdueX+srgNn6qEqgi41ds/4oSlttEhUmqNiKlWG/HML3LnHDG9HCnsEwgzPn
	uMAYRPfaP+nU5nAHjjLrVIeWe2D4OzU95GsZxeN+tK+W6IiIO+2L9dzU5QNRRAfGpWNn4tGhqFF
	xmlgGdEU9ijsf1iMLtWZrvUJq9oJb4Nny5rvH3S1Men8DSENb+g2A9vlrCnqBfy54YG5O3I3Z3U
	AlyXGVmQ4ODqv3IhtOp7N3KbcKY+vvHQPb31KgYDjcIpk1vq/wvw2oHW5URaxgzUs2L9hv5BUYE
	Ir0gxn+MtqLKlGtdzQ==
X-Received: by 2002:a05:690c:9990:b0:78f:a615:2724 with SMTP id
 00721157ae682-797a0cca0cdmr83696787b3.48.1771070113134; Sat, 14 Feb 2026
 03:55:13 -0800 (PST)
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
Date: Sat, 14 Feb 2026 19:55:02 +0800
X-Gm-Features: AZwV_Qigv3G7TrMHGxexVDebiOQwk_U6GNZ8jgGeUNvo9OZcvzyb-L5nKUd2Gxs
Message-ID: <CABymUCMba4C0g+TPzWAT_eXTyxDbJDgWjTw3WgXu9=voOyZONQ@mail.gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92850-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1B0B813BC77
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

OK, will duplicate the function to customize non-virtual-plane version.
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

It is just for safety to ensure derferring the SSPP handling into CRTC
check stage.
The planes_changed is set in drm_atomic_helper_plane_changed() as below
call tree for every frame in kmscube test. So this enforcement does
not introduce
redundant calling. I can use another variable to trigger the deferred
SSPP handling.
But we still need to optimize drm framework or msm_atomic_check to
avoid redundant
asserting crtc_state->planes_changed later.

drm_atomic_check_only
  -> msm_atomic_check
     -> drm_atomic_helper_check
        -> drm_atomic_helper_check_planes
            -> drm_atomic_helper_plane_changed  =3D>
crtc_state->planes_changed is asserted.
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

dpu_plane_assign_resources just include the SSPP assignment, which
is moved from dpu_plane_atomic_check(). The adjancent state is handled
in dpu_plane_virtual_assign_resources()
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

