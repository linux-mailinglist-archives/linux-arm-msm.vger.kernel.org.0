Return-Path: <linux-arm-msm+bounces-90114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMSvG/69cWkmLwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 07:04:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A2E62296
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 07:04:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7B4504E6A09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 06:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252D23644C0;
	Thu, 22 Jan 2026 06:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pl8K6l6G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5339A31AAAA
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 06:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769061821; cv=pass; b=FmjZZldyQHkdlPxXfpj9pan44EvDP6gng30Kky3ljBh5dmojJYLwAmPyyePcvTAfVWkuWoNDQwIxyrAAdsnZVXVTVKzu5ldBDxhb+XLE96dGYBrbrjJauRXNrTJ9iqJ8UDZmsTFExNCTHQKAZR5jLptfd6te+0xQVxi0vCXG9jM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769061821; c=relaxed/simple;
	bh=ZK12z7LKXOr+Gp/YhOf7vkytg/ifpKxTvQCqp4g+JxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OzDHnwGZ7bTmRDEjTEdsjfdlUv5H1/oCNqCQ3SdcbFmMApOkmgF0O/Z2Bn4FBqLdBKtpvhFvEk5OFYE2aUMNLzSS8HYwB3gsbLJVuR+DcReD8Sc+xip08EoUZVH8fdG9cgcuh84z+xQauRp0EyaXEpiuh1NZuxOxsBfWM5tBQyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pl8K6l6G; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6494a3d92f5so754340d50.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 22:03:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769061816; cv=none;
        d=google.com; s=arc-20240605;
        b=bWEJqev5ZhaBhXRTnLXgClBzAhGS1HbQy4grCXd3bLDdWMCySmBjxUkThLTODrI/Co
         7H7QpmnVDy40GiVvQyr5C40PB3Eld5TerVdkCjis7lUNIuYhBIL7cmPFXaTfem3fvMsr
         ypjWBpS3pfpqS888ZtVJKklNSYWWYkK6Hcwf55uJcZ3roVrG0N/Wxo7dbAzNYMhX03dl
         +klGEyH61Xts/KKSG+fsldE9r10/EWcXRU7pqKKLl1a0HqGglI/Kl8hbRC3UXRbaG7Vg
         O2aaOfBbtrvha/JvYLFbUOi7E1CfAckdWzyU0pU5YufLPUYhvRF31MYPRolTa+2s8tDi
         JgVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qx6mMtXyKOMz7O/Dvb869tTYqPo6ooYlALfEmNRzEX8=;
        fh=Wd1LOVP6MYyOkc6sSFfnqpmFTpAOvmvp8YR+pH1nXx0=;
        b=bUpewNXOmkADhaVZ+deh0dh9YeLuYjXhaAR+s53BSUCvtDEQOx2raWTEN/xPLpZ4jC
         jwkpgEQvN72BYfWwyBWYlGTnVwpdJCS+vPGwUsvJys6RBRjvweEtbIdgD63xhAF/1w3O
         0xnsE6pqRBEQpDUsAzCZWQCYs681/puj8foh5AeK+RmaYET5S5mi0momsFEJnWSY+Zxo
         gsfjtMRMEerVRjM3WrGhPwulEf00xC4TWLrdZonuDyF7FFKzYj5+X/qMEp4eIYvIxyIj
         FYUwtRBNAYIbH2XzeXIs9P9hnLIwZ1FJULp4ziGIbFgHo3BUXQlBNDBZfLB9nPApSAvM
         umUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769061816; x=1769666616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qx6mMtXyKOMz7O/Dvb869tTYqPo6ooYlALfEmNRzEX8=;
        b=pl8K6l6GcBW/7pJk8zkLxHZ5FwVdVHwfttlfxQF8kuLuDVfMmdPRgoBReXps/ipsSG
         pXwPy+xuwtMo6Uw2rnBsMhpliqMrT9R3FwNHwBCffD9Ve1OSvhm1wKBpTmdienDaRcww
         ECo4L4cUjFCsJexXYHu3CiH34bXq3lOTr05zHcq4U58tBSxcgJ3ywyy3Yx/Ia6h6D+BF
         6xSe1u452J1k8UnDgq1RPC1V2uE/cKjfGJ0xVoscLDjpCWedCwFLpZOFhWHSL7g3LsD5
         tXCO/L8NY/Qt9pX/HkWxWj635kBc9jw1ucbNqlbEU40OFGhM14ltTJ6Tmy3GLq1yLnTM
         dHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769061816; x=1769666616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qx6mMtXyKOMz7O/Dvb869tTYqPo6ooYlALfEmNRzEX8=;
        b=i6qDDvyF5L4jlwNuYbsiqtuBv0wUqJ2QHsLkeiEkPYxsB9qOb2hNLZyUvvynIJA+pb
         O0TtBhjzJKVIDvUHA0vQq3LJJGMgUKKwSGqJHTjWWMbDdiyXggwOTMgJVT6aYXYdSczE
         iFa0UVM6Gv3/UldiV/kpzHG5r7GaNkdMnO6mpLyNwsXlNNU/FXw4NGCPf2B/T7TZ1t/n
         Xu4Je/5Gnj/8xwMxQMIz4HR8ACg4t4eWfKiGasPfOJS/NChnlRJOb8KMO8IFbUhvvx65
         vKdyu3X3yWhJ2SI+i7vKU6Ui2TJdvFRqTG8ZYu52X8fq3ymFQE8wEGAk38nAGDaacacj
         sgxg==
X-Forwarded-Encrypted: i=1; AJvYcCU/zolZq8QNKyRa4N+l5ZU6Q4rr1UXmh49vi3i/NjnrASeP1PWiGwXT+AJehSzEd6JPtENh9I5JZH3Lhg22@vger.kernel.org
X-Gm-Message-State: AOJu0Yw80+vlk26hdmx/yPuk2duXxwHOYMzAcA9gkxCcq+8l3kCcGwhH
	NfB3EmVGldaW+FXLbwEXeaMbXSXQALRu+qYjyRyOCB4PnKGjq42vyzqn1WMef4qsMwY08ua75pF
	BTuUIcsDpCRx8y6sih3j8PXjcl9J+6Cwg/M9VI2t4DA==
X-Gm-Gg: AZuq6aJJ0EQV/TuMOZHmDw7noXmEMeLZ7Eo6DEVxf6kBdrF1+hciZuNc7DcxeSQEVyL
	0gPHo/xG8LoIiwVc00j4apgyNc1a/YwLRi6pwmaJzfame7VO9vIUdGAEoJNYRcq6TxEZtyfLbHx
	06wLtuHCeQ96Mro1m9kLigj1HkozccSZ7IV1LgBFqn+YjDVx48vqfyQ+h0nOZXwapvRK7BMds37
	+3Tx2e+ZpprjXKttq6dS8/L/r/gALKnJRiYlB1aiXJBzJqPzTWpVpFmqeGWFtPPjxiuSGPNZLdy
	ZpI=
X-Received: by 2002:a05:690e:11cc:b0:640:fca9:bfd6 with SMTP id
 956f58d0204a3-6493c849206mr6112260d50.49.1769061816211; Wed, 21 Jan 2026
 22:03:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org> <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
In-Reply-To: <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 22 Jan 2026 14:03:25 +0800
X-Gm-Features: AZwV_Qg1_79Xo68C21Ihi7tRuTlwZn5P1Uonir6pcjTQWXS1ANc_kg4p_DhgV2I
Message-ID: <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC check
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
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90114-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,linaro.org:email,linaro.org:dkim]
X-Rspamd-Queue-Id: 29A2E62296
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 17:30=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> > Currently, plane splitting and SSPP allocation occur during the plane
> > check phase. Defer these operations until dpu_assign_plane_resources()
> > is called from the CRTC side to ensure the topology information from
> > the CRTC check is available.
>
> Why is it important? What is broken otherwise?

I see. Thanks! Will add below lines in next version.

By default, the plane check occurs before the CRTC check.
Without topology information from the CRTC, plane splitting
cannot be properly executed. Consequently, the SSPP
engine starts without a valid memory address, which triggers
an IOMMU warning.

>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   3 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 112 +++++++++++++++++++---=
--------
> >  2 files changed, 71 insertions(+), 44 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 2d06c950e8143..debdbbe6160dd 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1484,8 +1484,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc =
*crtc,
> >                       return rc;
> >       }
> >
> > -     if (dpu_use_virtual_planes &&
> > -         (crtc_state->planes_changed || crtc_state->zpos_changed)) {
> > +     if (crtc_state->planes_changed || crtc_state->zpos_changed) {
> >               rc =3D dpu_crtc_reassign_planes(crtc, crtc_state);
> >               if (rc < 0)
> >                       return rc;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 66f240ce29d07..3c629f4df461d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1119,49 +1119,25 @@ static int dpu_plane_atomic_check(struct drm_pl=
ane *plane,
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
> > +     /*
> > +      * To trigger the callback of dpu_assign_plane_resources() to
> > +      * finish the deferred sspp check
> > +      */
> > +     crtc_state->planes_changed =3D true;
> > +     return 0;
> >  }
> >
> >  static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
> > @@ -1186,10 +1162,6 @@ static int dpu_plane_virtual_atomic_check(struct=
 drm_plane *plane,
> >       if (ret)
> >               return ret;
> >
> > -     ret =3D dpu_plane_split(plane, plane_state, crtc_state);
> > -     if (ret)
> > -             return ret;
> > -
> >       if (!plane_state->visible) {
> >               /*
> >                * resources are freed by dpu_crtc_assign_plane_resources=
(),
> > @@ -1261,9 +1233,9 @@ static int dpu_plane_virtual_assign_resources(str=
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
> > @@ -1273,10 +1245,6 @@ static int dpu_plane_virtual_assign_resources(st=
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
> > @@ -1288,6 +1256,10 @@ static int dpu_plane_virtual_assign_resources(st=
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
> > @@ -1318,14 +1290,59 @@ static int dpu_plane_virtual_assign_resources(s=
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
> > +     if (!plane_state->visible)
> > +             return 0;
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
> > @@ -1334,8 +1351,19 @@ int dpu_assign_plane_resources(struct dpu_global=
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
> >
> > --
> > 2.43.0
> >
>
> --
> With best wishes
> Dmitry

