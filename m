Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7197C34DDCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 03:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbhC3BwT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 21:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbhC3BwE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 21:52:04 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54461C061762
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 18:52:04 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id k23-20020a17090a5917b02901043e35ad4aso8631025pji.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 18:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=+Cpe14PwtL8vIUpx0dzGsw3Ka3M5f1GgIApZ0rRvA/g=;
        b=oIp3r0zJ4FEkjG/TIz3OMayXIb3PX9+/n1mCnMVGrWZSbWvbO5suX5t3s3oJMBAefp
         kGfwCG0FpEIFzFWq+aF80ldxe8US/FdLKz/DnS+P7Cl0rdlML39ht1/w31VYPGa+6naq
         WRUkqdlp81lqC1baoM8Qe5Ey4jfwxQUYRdWSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=+Cpe14PwtL8vIUpx0dzGsw3Ka3M5f1GgIApZ0rRvA/g=;
        b=BuIj8LKq/gvfR5S12fP6eqNMUUME7SRP0Z7vtXvm+k/+3K57zcIk8L3IX2aIOzd1Eo
         1pEVcs4A8JrQ1gpO+7vYJsn6stR4icKDUrDChgTN+1qlb/NNApsl3jBh+fEjh0etx+KC
         tHKeMjlTjUJZY0RBjMiPL3KBASikMTKNm3uqflrYJVmCBb+roryq1lfTMxYGSaAfW4pJ
         Qb7LbD3ShVyjYtwFUMzE/AOjnbqwIKXmbGef76xkzMudjrDnJBuBu87CNR8j66uu3jZ3
         oBUuLHUpwmiAyYW2G3dtqxYhGyL2VZWbs4dt/U4fui6JpG95cfjbJgrROxTEX0yR+YlF
         8XEQ==
X-Gm-Message-State: AOAM531vtObmaDtkYmvvwYC/xDs4dhg1efqNpWK5DlQThO26gd0RQ/n9
        rigc6m8XHZ7Bbg1bxoJrOZuFjg==
X-Google-Smtp-Source: ABdhPJyvaXWUQUyIW3y2W3D2lyK/Nk8RADybL4nEpzcpJxiDOoLQLbonvJydNGKL5kjDt5jh0FqtLA==
X-Received: by 2002:a17:902:eac5:b029:e6:34e2:8378 with SMTP id p5-20020a170902eac5b02900e634e28378mr30720652pld.35.1617069123644;
        Mon, 29 Mar 2021 18:52:03 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:4091:2b37:966b:1fca])
        by smtp.gmail.com with ESMTPSA id bg16sm893875pjb.43.2021.03.29.18.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 18:52:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210219120032.260676-10-maxime@cerno.tech>
References: <20210219120032.260676-1-maxime@cerno.tech> <20210219120032.260676-10-maxime@cerno.tech>
Subject: Re: [PATCH v3 10/11] drm: Use state helper instead of the plane state pointer
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
To:     Maxime Ripard <maxime@cerno.tech>
Date:   Mon, 29 Mar 2021 18:52:01 -0700
Message-ID: <161706912161.3012082.17313817257247946143@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Trimming Cc list way down, sorry if that's too much.

Quoting Maxime Ripard (2021-02-19 04:00:30)
> Many drivers reference the plane->state pointer in order to get the
> current plane state in their atomic_update or atomic_disable hooks,
> which would be the new plane state in the global atomic state since
> _swap_state happened when those hooks are run.

Does this mean drm_atomic_helper_swap_state()?

>=20
> Use the drm_atomic_get_new_plane_state helper to get that state to make it
> more obvious.
>=20
> This was made using the coccinelle script below:
>=20
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
>=20
> (
>  static const struct drm_plane_helper_funcs helpers =3D {
>         ...,
>         .atomic_disable =3D func,
>         ...,
>  };
> |
>  static const struct drm_plane_helper_funcs helpers =3D {
>         ...,
>         .atomic_update =3D func,
>         ...,
>  };
> )
>=20
> @ adds_new_state @
> identifier plane_atomic_func.func;
> identifier plane, state;
> identifier new_state;
> @@
>=20
>  func(struct drm_plane *plane, struct drm_atomic_state *state)
>  {
>         ...
> -       struct drm_plane_state *new_state =3D plane->state;
> +       struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_st=
ate(state, plane);
>         ...
>  }
>=20
> @ include depends on adds_new_state @
> @@
>=20
>  #include <drm/drm_atomic.h>
>=20
> @ no_include depends on !include && adds_new_state @
> @@
>=20
> + #include <drm/drm_atomic.h>
>   #include <drm/...>
>=20
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c       | 3 ++-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c      | 4 +++-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c      | 3 ++-
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/=
msm/disp/dpu1/dpu_plane.c
> index 31071f9e21d7..e8ce72fe54a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1244,7 +1244,8 @@ static void dpu_plane_atomic_update(struct drm_plan=
e *plane,
>                                 struct drm_atomic_state *state)
>  {
>         struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> -       struct drm_plane_state *new_state =3D plane->state;
> +       struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_st=
ate(state,
> +                                                                        =
  plane);
> =20
>         pdpu->is_error =3D false;
> =20

This is oopsing for me. It turns out that 'new_state' is NULL. According
to the comments drm_atomic_get_new_plane_state() can return NULL if the
plane isn't part of the global state. I haven't looked much further but
wanted to report it here in case that type of return value makes sense.

If I revert this patch from linux-next my display works and doesn't
crash the system. Or I can check for NULL in the if below and it also
works.

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/ms=
m/disp/dpu1/dpu_plane.c
index df7f3d3afd8b..f31b89531f6a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1251,7 +1251,7 @@ static void dpu_plane_atomic_update(struct drm_plane =
*plane,
=20
 	DPU_DEBUG_PLANE(pdpu, "\n");
=20
-	if (!new_state->visible) {
+	if (new_state && !new_state->visible) {
 		_dpu_plane_atomic_disable(plane);
 	} else {
 		dpu_plane_sspp_atomic_update(plane);
