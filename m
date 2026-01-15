Return-Path: <linux-arm-msm+bounces-89197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 713F7D23D88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 11:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C40BA30034B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7832E2665;
	Thu, 15 Jan 2026 10:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C2yXOFAm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EAD33A9E2
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768471851; cv=none; b=GS1LYjPzCPZrQIScg18IS3MIUp0inQqsZXRuGWpjKVGRg+buuRGroROCkT0ZpdmoxQYtVrtkU5M//COHHDJxoY5nUY3TXGw7yr4r/6mAIRHr49iIBkQh5nO7p9eD/jMtDaRnUEzjEzJDHzIAUWnBEop28zDYUe665K5uC7/O3ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768471851; c=relaxed/simple;
	bh=AuW+Xi8drOKrKzA0wsUuq3A+Km9jiJIgjeeTU7wBBpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RuVpGftaFcIg/iGGmX+syhxY8Yq3OaQYbuOqFMj/Tzw3wdhZ9rmPEYDtB3jWx+2NMojwcQ2bO95alf4ZyZqaifvASvTjye+jkED2S/+gnxlYuH3dGAJ6F0hEDKywgwsBBDMau5iCTMhbqZyfpQ6JHQC34qRcfQhZ6TrbBcI5n0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C2yXOFAm; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-790b7b3e594so6267887b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 02:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768471848; x=1769076648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rkv8ikQUARN/N/Kkx850hQ4m0bkxMdUFAMwwE3tHVbI=;
        b=C2yXOFAmP7qbmln3/Sq/ecQlUzadySgOOo9SuN+ufu2gw8mgaz2pSAWaQYZ/Njj0fB
         NCMjKNrklgEwAOAo/FQpnP1LHPUSCv2fzX+qFoJAIa+pxhFaQjoEWVdp103xvLWVDZMK
         Rv5AqNjvEG6P2auN4AvqUDdvoPkVztJAJ9JdqZ/UfsNEpYcLYLOLVPpTXEvoyuavhi9R
         Y0yp1Llet0odfbcEZbKFQJBjKg8NCEW9Z2oB7XEN6R70Q7SQyvZs5fEUtUQn2iE1FLfI
         e18m6yRfV2wx0df1CjmxnvBVe3TM0iSZEiiOmGwmBZDuxyd4ohW5lhqMIAloVHn4i04s
         6BMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768471848; x=1769076648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rkv8ikQUARN/N/Kkx850hQ4m0bkxMdUFAMwwE3tHVbI=;
        b=h3MboAXGGrtsRveYZVib/LYpH+nPMJ7K7EMnp3fFV6oKA8odlh6I//hmYjayMkruY4
         OdK3beqwkE1yx4LAqrop7ohjX27b1YNOlvkwrQ8FiiTz4jAD2cdxQI4H52KHk7QL6Z1R
         ymyMhjH4Y0rq2fJQexIEzUE+vgVkwjYio3gj3ZithM+YqZCgI74CJ0/sIYjFsBlgAsjH
         MW1Dk9QriDAz/SFpQ0dMcr+jAn5enJrvUYe6Ur7SAxbo1vOkFreUqaRFjhEEv8gP1n5C
         FdT51/TzRj/3Q0CcTwQ7cvAkO4zES554IJ9IyXcIhIh5K/q+PWAq8OReiX3IUBDRgTUY
         kyqw==
X-Forwarded-Encrypted: i=1; AJvYcCUvUcw3iWh7Sp8rw1veaL2TlKyh45tLTUmHu2kB7+r4eC2d+1atD7CdT10VFncpDuOt14JHHuDc/4/w3knW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx23H9eMFdm4BqB0oAcMy1qpEBKL8gM6YsHE5tORkkLLN2raPIi
	TiqeS62R42ydYBL1rzKylmtxZ2di+dflsjZqA5gvj41KmMju/TY0ewx0GRAFyZspNKXhCog6wsK
	Jp4J6E2STmC/zJCD3qddGTZbz95Ub7lEBf02NJn0FRg==
X-Gm-Gg: AY/fxX48IG6qUKdCMsRJV1gpwPZN+xhlz7bm+wkaou1n8701q/bHW8z7sbv8mXQTjWB
	3Rx7ibHIFN2IsGVOwVE1+0xjhNaIrCG4L8PiuGmDJednqDrJ/nHLhk2aBx20/h7UW6RczMj37Vq
	vLmOME4ZUM6Ruxx+EOqgvDYNOvB3tGH9x5IYtvH7hdS5wNY3mUguCH2IaOxfMwDOnVJNqJSR7lT
	b6PvkIgrPBLq6hN/Wfc/wOhCV6MUT2lNJfJp/poKJuxYKihtyCPfGZzEZU5TbwEwFc8GQsVA6Vf
	LX4=
X-Received: by 2002:a05:690e:1898:b0:63f:b366:98c9 with SMTP id
 956f58d0204a3-64903b45c7fmr3328872d50.46.1768471848192; Thu, 15 Jan 2026
 02:10:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org>
 <CABymUCNY9uo0Cm0KgM9yChuxJ22=Y-4JjHj7cEh5ByX8Nr3y-w@mail.gmail.com>
 <nvd4eksgcmeqlfwp4jc27fpuzi6otdhzcefdbmj7a2xgv2bqwr@r6rytxs7ibj3>
 <CABymUCP2yAQptCGCBX0X75iRSkKkfctiEaxUH7_eOpspR55_Kg@mail.gmail.com>
 <uh75cutkn4opgjbwebpqvhq4xfzep3jnsblaevpgs3gchg264k@gzgydmui2653> <CABymUCPkfYHhtxEqN7KgBPHEvYh=NRotutJ=eiLm=ZUB85t-Qw@mail.gmail.com>
In-Reply-To: <CABymUCPkfYHhtxEqN7KgBPHEvYh=NRotutJ=eiLm=ZUB85t-Qw@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 15 Jan 2026 18:10:36 +0800
X-Gm-Features: AZwV_QgmurEtZGqCC-J87iEhyC8ARZYKkLKMsRCGKhZjRYi4rTUDAlAEEHYZ7nE
Message-ID: <CABymUCM_KAAunMSUSXXUWMy45y4yTv4iV5WGo4DG-xv=ExMahA@mail.gmail.com>
Subject: Re: [PATCH v16 09/10] drm/msm/dpu: support plane splitting in
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jun Nie <jun.nie@linaro.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=8815=E6=97=A5=E5=
=91=A8=E5=9B=9B 17:57=E5=86=99=E9=81=93=EF=BC=9A
>
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=
=B41=E6=9C=8815=E6=97=A5=E5=91=A8=E5=9B=9B 17:39=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, Jan 15, 2026 at 05:34:28PM +0800, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8815=E6=97=A5=E5=91=A8=E5=9B=9B 00:12=E5=86=99=E9=81=93=EF=BC=
=9A
> > > >
> > > > On Wed, Jan 14, 2026 at 10:48:17PM +0800, Jun Nie wrote:
> > > > > Jun Nie <jun.nie@linaro.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=8818=
=E6=97=A5=E5=91=A8=E5=9B=9B 21:30=E5=86=99=E9=81=93=EF=BC=9A
> > > > > >
> > > > > > The content of every half of screen is sent out via one interfa=
ce in
> > > > > > dual-DSI case. The content for every interface is blended by a =
LM
> > > > > > pair in quad-pipe case, thus a LM pair should not blend any con=
tent
> > > > > > that cross the half of screen in this case. Clip plane into pip=
es per
> > > > > > left and right half screen ROI if topology is quad pipe case.
> > > > > >
> > > > > > The clipped rectangle on every half of screen is futher handled=
 by two
> > > > > > pipes if its width exceeds a limit for a single pipe.
> > > > > >
> > > > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 ++++++++++++++=
+++++++---------
> > > > > >  3 files changed, 110 insertions(+), 40 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers=
/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > index d825eb8e40ae8bd456ede6269951339e3053d0d3..e925d93b38feac0=
594d735fdc2c5b9fd5ae83e6a 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > @@ -1604,6 +1604,17 @@ int dpu_crtc_vblank(struct drm_crtc *crt=
c, bool en)
> > > > > >         return 0;
> > > > > >  }
> > > > > >
> > > > > > +/**
> > > > > > + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipelin=
e
> > > > > > + * @state: Pointer to drm crtc state object
> > > > > > + */
> > > > > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *=
state)
> > > > > > +{
> > > > > > +       struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(sta=
te);
> > > > > > +
> > > > > > +       return cstate->num_mixers;
> > > > > > +}
> > > > > > +
> > > > > >  #ifdef CONFIG_DEBUG_FS
> > > > > >  static int _dpu_debugfs_status_show(struct seq_file *s, void *=
data)
> > > > > >  {
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers=
/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > > > index 94392b9b924546f96e738ae20920cf9afd568e6b..6eaba5696e8e6bd=
1246a9895c4c8714ca6589b10 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > > > @@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu=
_crtc_get_client_type(
> > > > > >
> > > > > >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event)=
;
> > > > > >
> > > > > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *=
state);
> > > > > > +
> > > > > >  #endif /* _DPU_CRTC_H_ */
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/driver=
s/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > > index 5ae58352cbee1251a0140879f04fc7c304cae674..89a5feb6308bcac=
537562c3dc4e61c16c92e460c 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > > @@ -824,8 +824,12 @@ static int dpu_plane_atomic_check_nosspp(s=
truct drm_plane *plane,
> > > > > >         struct dpu_plane_state *pstate =3D to_dpu_plane_state(n=
ew_plane_state);
> > > > > >         struct dpu_sw_pipe_cfg *pipe_cfg;
> > > > > >         struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > > > > > +       struct dpu_sw_pipe_cfg init_pipe_cfg;
> > > > > >         struct drm_rect fb_rect =3D { 0 };
> > > > > > +       const struct drm_display_mode *mode =3D &crtc_state->ad=
justed_mode;
> > > > > >         uint32_t max_linewidth;
> > > > > > +       u32 num_lm;
> > > > > > +       int stage_id, num_stages;
> > > > > >
> > > > > >         min_scale =3D FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > > > > >         max_scale =3D MAX_DOWNSCALE_RATIO << 16;
> > > > > > @@ -848,13 +852,10 @@ static int dpu_plane_atomic_check_nosspp(=
struct drm_plane *plane,
> > > > > >                 return -EINVAL;
> > > > > >         }
> > > > > >
> > > > > > -       /* move the assignment here, to ease handling to anothe=
r pairs later */
> > > > > > -       pipe_cfg =3D &pstate->pipe_cfg[0];
> > > > > > -       r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > > > > > -       /* state->src is 16.16, src_rect is not */
> > > > > > -       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_stat=
e->src);
> > > > > > +       num_lm =3D dpu_crtc_get_num_lm(crtc_state);
> > > > > >
> > > > > > -       pipe_cfg->dst_rect =3D new_plane_state->dst;
> > > > > > +       /* state->src is 16.16, src_rect is not */
> > > > > > +       drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_=
state->src);
> > > > > >
> > > > > >         fb_rect.x2 =3D new_plane_state->fb->width;
> > > > > >         fb_rect.y2 =3D new_plane_state->fb->height;
> > > > > > @@ -879,35 +880,94 @@ static int dpu_plane_atomic_check_nosspp(=
struct drm_plane *plane,
> > > > > >
> > > > > >         max_linewidth =3D pdpu->catalog->caps->max_linewidth;
> > > > > >
> > > > > > -       drm_rect_rotate(&pipe_cfg->src_rect,
> > > > > > +       drm_rect_rotate(&init_pipe_cfg.src_rect,
> > > > > >                         new_plane_state->fb->width, new_plane_s=
tate->fb->height,
> > > > > >                         new_plane_state->rotation);
> > > > > >
> > > > > > -       if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidt=
h) ||
> > > > > > -            _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pi=
pe_cfg) > max_mdp_clk_rate) {
> > > > > > -               if (drm_rect_width(&pipe_cfg->src_rect) > 2 * m=
ax_linewidth) {
> > > > > > -                       DPU_DEBUG_PLANE(pdpu, "invalid src " DR=
M_RECT_FMT " line:%u\n",
> > > > > > -                                       DRM_RECT_ARG(&pipe_cfg-=
>src_rect), max_linewidth);
> > > > > > -                       return -E2BIG;
> > > > > > +       /*
> > > > > > +        * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topolog=
y, 2 mixer pair
> > > > > > +        * configs for left and right half screen in case of 4:=
4:2 topology.
> > > > > > +        * But we may have 2 rect to split wide plane that exce=
eds limit with 1
> > > > > > +        * config for 2:2:1. So need to handle both wide plane =
splitting, and
> > > > > > +        * two halves of screen splitting for quad-pipe case. C=
heck dest
> > > > > > +        * rectangle left/right clipping first, then check wide=
 rectangle
> > > > > > +        * splitting in every half next.
> > > > > > +        */
> > > > > > +       num_stages =3D (num_lm + 1) / 2;
> > > > >
> > > > > Hi Dmitry,
> > > > > Because the plane is checked before crtc is checked in the drm fr=
amework. While
> > > > > the topology is decided in crtc check. Thus num_lm is 0 when this=
 function is
> > > > > called for the first time. As a result, the below iteration is no=
t run
> > > > > at all and leads
> > > > >  to iommu warning.
> > > >
> > > > How does it lead to IOMMU warnings?
> > >
> > > Because the pipe is not configured with width/height etc when the ite=
ration is
> > > skipped. I have not found the root cause so far. But per the null IOM=
MU iova
> > > value, suppose it is due to DMA buffer not being prepared when DMA is=
 started.
> >
> > I'd think, that corresponding SRC regs are either garbage or zero progr=
ammed.
>
> You are right in that. Sorry for my words is not accurate. I mean the
> DMA buffer is not
> feed to DMA engine correctly.
> >
> > >
> > > >
> > > > > Do you suggest to change drm framework with adding extra crtc che=
ck before
> > > > > plane check, or you prefer the below line here?
> > > > >
> > > > > num_stages =3D max(1, (num_lm + 1) / 2);
> > > >
> > > > DRM framework provides enough hooks to be able to influence the ord=
er or
> > > > operations without changing the framework. But, I'd like to point o=
ut
> > > > that for the virtual plane case we already perform plane operations
> > > > from dpu_crtc_atomic_check(). You can employ the same approach.
> > >
> > > Thanks for the suggestion! I see dpu_assign_plane_resources() is call=
ed
> > > from crtc side, which avoids the plane splitting before topology deci=
sion.
> > > To use this method, it looks like we are enabling the virtual plane b=
y default.
> > > Because the virtual plane differs from the traditional method only wi=
th the
> > > plane splitting and resource preparation. Can we just enable the virt=
ual
> > > plane by default in this situation?
> >
> > In which situation? It is a global switch. And we need to be able to
> > work with it turned off, until corresponding code is dropped.
>
> I mean the situation that the plane SSPP allocation and related resource
> preparation shall be deferred until crtc calling the plane API. In this w=
ay,
> the traditional plane management is almost identical with the virtual
> plane method. Or could you point out what shall differ for the two method=
s
> after we deferred the preparation? Thanks!

You just want to have different SSPP number limit for the 2 methods?
>
> Jun
> >
> > >
> > > Jun
> > >
> > > >
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> >
> > --
> > With best wishes
> > Dmitry

