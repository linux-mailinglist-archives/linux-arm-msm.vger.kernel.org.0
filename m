Return-Path: <linux-arm-msm+bounces-85074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA49CB6632
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 16:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D70943007FCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 15:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7076F156C6A;
	Thu, 11 Dec 2025 15:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jU8Dydv+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A62131327A
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 15:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765468395; cv=none; b=mv2r7bi/eVkcjd86T7dtgOmNC6yabo+7VQCz1KBsd2x45xFHZTv+CdQHB2Hbwqd6Ij8Hqeb+lKAzFNrUTZg70/i1a3ijX1gIc7C340+fdlyaONlLFi73/Z5FysXjEpr8I3umP6FWxlMpUi3F+I32h1bgsdZSptXBQxACnSvZFLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765468395; c=relaxed/simple;
	bh=K1RaK1bR7O8Ts+hbAX1tL+28v/ZNF3oBX8L6bzC1E+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PrU5Ww5FAJ5n70UHGmJs+tKmnAh8F9yLnGLx3UpHAvMYIm5AFNYe4JzcwIGVIkYUz7zL2IPV82Wk6unUdZDS5K5Gl5MerKHjEO1hIrMcsD8buVy1ZvkVOLjK7L6+iKpeZ7s312CAbeWueehbOghHyXcLbJHWq/RlJops+IdpeE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jU8Dydv+; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78c2e5745bdso2606667b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 07:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765468392; x=1766073192; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dBGjpPP9YE4qDIRAWgDomHdulI38A9FYt2FyWSnbZc=;
        b=jU8Dydv+KP6otMCTBGCY76d9TAFPvVLu9BlYb2AoAB6pz6GuhVZmOhgYnIMRd9fN1i
         8z505TYLIiaoZ9L00KD5OBuLLYraWBhUbuj0cB56kEMgyZaGas3WyH2d6QQHDY5l8f+7
         xNeiO1FaVlspqqVq7uZbl+vEH2KtrRekhNFc09+wCePQ8Zxn7gxe0vtkG/q/o5gE+w/c
         LAe1IBolEAsI9qvP1VIKHEReRta0iKUmD4FbUlKcs2baMUCObElTdOGpMzSvq5HIo4nb
         pAz/HJFMvMmWozHwnYGNbKw9bQcbRS47uivj7DEqyUdyTD2hYucCjLzFWezb4CuwqnlB
         6Aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765468392; x=1766073192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+dBGjpPP9YE4qDIRAWgDomHdulI38A9FYt2FyWSnbZc=;
        b=a74b30rH1dhAhDiBwq1QLfeY73Wz/M5GxTcr3VNR3JxoKNGec0KkHndHiEStwqSiI2
         BgIravI6pylBUaR6tnZPxUXmF7zU3L2OJo/HNg8Q+4IoWgtCUEU0q5UaEeBsTpbO7+yV
         jhWv6JdrqJRK2qkGC40iR+tiSOZ1Eu8CkGUwZ9GxRYllpbayyoVIyL7aeWJJ4jkIbDvQ
         xCQJd6YoOEdJWUhmmG3OVgr8ZNWF99b2prxgOYflU+AyihBWeaWoEbODnllBlVcf7ZyD
         +qcItBHjBGupmsD2+X1Q1+qpBYBv+hVzJQ6SXQ30J6MYCMU9XQK8LEixkMuUPgO6sS8S
         /QNg==
X-Forwarded-Encrypted: i=1; AJvYcCWfca1lrLbdc0it4Xf7nMxEcysW4qiFDhAtWSLFWnSrDYwY0m9eqmWC9A7UA4afe4wZpCkN/RRyA86ZhfVF@vger.kernel.org
X-Gm-Message-State: AOJu0YwhFivaYGw7y8ouGiS1Pf3evS16KfpcWHDwHoorGMVzK/KqB9Kp
	NOfkDMz1SeukLxXOJA0iXTU9seeBduayBc2lTEngkcawMxS6Nr8YRcHsJy4WspfZT6OmWcAJSx3
	vZq7L4g/verCQHLNJdoddYTcBdy3vt/lofU/yNuzUfQ==
X-Gm-Gg: AY/fxX6vAQ5Zo7xcy5GS7IHi8no5l7YVi7ii9zj5ZXK/nW2eeGYNRWsbXOih6q4LKV2
	rNC0xHpuh5MA21qWQHoTOKmk+LorKZzkbemhwZR1aGnMSaIdtp5z4Bt8hV4x6YU3u/YTw9EBHE6
	M7BBZudOXSNxmJq7uXBAFd/b30ZaNrYVDOlMvOytDPxmfxqVb9b3UJpKz+QoUB/WJbrFjRjyLhZ
	fzYSPz1s/CjjRMw2Re+GUOsKVLdbYeg3hixu7Ed1UnGkp4zcAsCnH7Dz2ET6QS5HVfJ0+ja
X-Google-Smtp-Source: AGHT+IGUsgtLkKLPoU+swAXCvd5pN2AtL71+QRCilZtTLV74Ki6ExMqENzFZ32j2du28KaBbdflguLNUhqYGK/g3wsw=
X-Received: by 2002:a05:690c:48c9:b0:787:e3c0:f61f with SMTP id
 00721157ae682-78c9d79d6damr110404867b3.57.1765468391890; Thu, 11 Dec 2025
 07:53:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-10-ff6232e3472f@linaro.org>
 <tjakx64c25gyakblncsvuoj2iquoknx4ngwujt2uf2clhhfvfl@lbvhrimf6gwp> <i234zyh7ajsxdvbkzindyk5h6wilds226jqmh32kml4aweesav@frlk2l7zgmg4>
In-Reply-To: <i234zyh7ajsxdvbkzindyk5h6wilds226jqmh32kml4aweesav@frlk2l7zgmg4>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 11 Dec 2025 23:53:00 +0800
X-Gm-Features: AQt7F2owJprXjxEiZG8aZ_nuD-7s3hT0ej3bNeUC-m6nLc4sVw6LJdRemDoFFrU
Message-ID: <CABymUCNm5fpFN-Zpw7WkqP4EdBGXR9JCFyppOkuWs-r9MFx3dg@mail.gmail.com>
Subject: Re: [PATCH v16 10/10] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
12=E6=9C=8811=E6=97=A5=E5=91=A8=E5=9B=9B 03:30=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sat, Nov 29, 2025 at 05:37:43PM +0100, Marijn Suijten wrote:
> > On 2025-09-18 21:29:02, Jun Nie wrote:
> > > To support high-resolution cases that exceed the width limitation of
> > > a pair of SSPPs, or scenarios that surpass the maximum MDP clock rate=
,
> > > additional pipes are necessary to enable parallel data processing
> > > within the SSPP width constraints and MDP clock rate.
> > >
> > > Request 4 mixers and 4 DSCs for high-resolution cases where both DSC
> > > and dual interfaces are enabled. More use cases can be incorporated
> > > later if quad-pipe capabilities are required.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 27 ++++++++++++++=
+++------
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++------=
----------
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
> > >  6 files changed, 35 insertions(+), 32 deletions(-)
> >
> > With this patch applied, I get the following crash on the Sony Xperia 1=
 III, a
> > dual-DSI dual-DSC device:
> >
> >       Unable to handle kernel NULL pointer dereference at virtual addre=
ss 0000000000000020
> >       Mem abort info:
> >         ESR =3D 0x0000000096000004
> >         EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> >         SET =3D 0, FnV =3D 0
> >         EA =3D 0, S1PTW =3D 0
> >         FSC =3D 0x04: level 0 translation fault
> >       Data abort info:
> >         ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
> >         CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> >         GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> >       user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000012d4e1000
> >       [0000000000000020] pgd=3D0000000000000000, p4d=3D0000000000000000
> >       Internal error: Oops: 0000000096000004 [#1]  SMP
> >       Modules linked in: msm drm_client_lib ubwc_config drm_dp_aux_bus =
gpu_sched drm_gpuvm drm_exec
> >       CPU: 5 UID: 0 PID: 3081 Comm: (sd-close) Tainted: G     U        =
      6.18.0-rc7-next-20251127-SoMainline-12422-g10b6db5b056d-dirty #21 NON=
E
> >       Tainted: [U]=3DUSER
> >       Hardware name: Sony Xperia 1 III (DT)
> >       pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> >       pc : dpu_plane_atomic_check_sspp.isra.0+0x88/0x3f4 [msm]
> >       lr : dpu_plane_atomic_check_sspp.isra.0+0x84/0x3f4 [msm]
> >       sp : ffff800081e23940
> >       x29: ffff800081e23950 x28: ffff0000bf2700d0 x27: 0000000000000a00
> >       x26: ffff0000bf270000 x25: 0000000000000a00 x24: ffff0000bd0e5c18
> >       x23: ffff000087a6c080 x22: 0000000000000224 x21: ffff00008ce88080
> >       x20: 0000000000000002 x19: ffff0000bf270138 x18: ffff8000818350b0
> >       x17: 000000040044ffff x16: ffffc488ae2e37e0 x15: 0000000000000005
> >       x14: 0000000000000a00 x13: 0000000000000000 x12: 0000000000000138
> >       x11: 0000000000000000 x10: 0000000000000012 x9 : 0000000000000000
> >       x8 : 0000000000000a00 x7 : 0000000000000000 x6 : 0000000000000000
> >       x5 : 0000000000000002 x4 : 0000000000000000 x3 : ffffc48897741db0
> >       x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
> >       Call trace:
> >        dpu_plane_atomic_check_sspp.isra.0+0x88/0x3f4 [msm] (P)
> >        dpu_plane_atomic_check+0x100/0x1a0 [msm]
> >        drm_atomic_helper_check_planes+0xd8/0x224
> >        drm_atomic_helper_check+0x50/0xb4
> >        msm_atomic_check+0xd0/0xe0 [msm]
> >        drm_atomic_check_only+0x4e0/0x928
> >        drm_atomic_commit+0x50/0xd4
> >        drm_client_modeset_commit_atomic+0x200/0x260
> >        drm_client_modeset_commit_locked+0x64/0x180
> >        drm_client_modeset_commit+0x30/0x60
> >        drm_fb_helper_lastclose+0x60/0xb0
> >        drm_fbdev_client_restore+0x18/0x38 [drm_client_lib]
> >        drm_client_dev_restore+0xac/0xf8
> >        drm_release+0x124/0x158
> >        __fput+0xd4/0x2e4
> >        fput_close_sync+0x3c/0xe0
> >        __arm64_sys_close+0x3c/0x84
> >        invoke_syscall.constprop.0+0x44/0x100
> >        el0_svc_common.constprop.0+0x3c/0xe4
> >        do_el0_svc+0x20/0x3c
> >        el0_svc+0x38/0x110
> >        el0t_64_sync_handler+0xa8/0xec
> >        el0t_64_sync+0x1a0/0x1a4
> >       Code: 2a1403e5 52800082 94008e28 f9400380 (f940101b)
> >       ---[ end trace 0000000000000000 ]---
> >       pstore: backend (ramoops) writing error (-28)
> >       [drm:dpu_encoder_frame_done_timeout:2726] [dpu error]enc33 frame =
done timeout
> >
> > I don't see any thought given to it in the extremely terse patch descri=
ption,
> > but this patch seems to unconditionally select 4 DSCs and 4 LMs on this=
 device
> > because the underlying SM8350 SoC has 4 available in its catalog - whil=
e it
> > was previously affixed to 2:2:2 matching the downstream and known-worki=
ng
> > configuration of this device - and I can only imagine things are rollin=
g
> > downhill from there.
> >
> > faddr2line seems to be failing for me, but this is the line
> > `dpu_plane_atomic_check_sspp.isra.0+0x88` seems to be referring to:
> >
> >       aarch64-linux-gnu-objdump .output/drivers/gpu/drm/msm/msm.ko -dS =
| grep dpu_plane_atomic_check_sspp.isra.0\> -A80
> >       00000000000671ac <dpu_plane_atomic_check_sspp.isra.0>:
> >       static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> >       ...
> >          67234:       f940101b        ldr     x27, [x0, #32]
> >               if (!(sblk->scaler_blk.len && pipe->sspp->ops.setup_scale=
r) &&
>
> I think it is:
>
>         pipe_hw_caps =3D pipe->sspp->cap;
>     14bc:       f9401018        ldr     x24, [x0, #32]
>
>
> So, please check why pipe->sspp becomes NULL (or where do we miss the
> NULL check for pipe->sspp).

Yeah, per panic log and objdump, it should be due to this line. But no
clue is found
with code analysis.
Did you reproduce it? If so, what's the platform and git commit id? I
tested with
HDK8650 dual-DSI HDMI bridged monitor, but kernel does not panic.

resource mapping:
        pingpong=3D104 104 # # # # - - # # # # -
        mixer=3D104 104 # # # # - -
        ctl=3D104 # # # # # - -
        dspp=3D# # # # - - - -
        dsc=3D# # # # # # - -
        cdm=3D#
        sspp=3D# # # # - - - - 104 # # # # # - -
        cwb=3D# # # #


Hi Marijn,
Could you help collect debug info with this change? Thanks!
BTW: my irc id: niej

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d07a6ab6e7ee1..fc61c2fbb0699 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -886,6 +886,7 @@ static int dpu_plane_atomic_check_nosspp(struct
drm_plane *plane,
                        new_plane_state->fb->width, new_plane_state->fb->he=
ight,
                        new_plane_state->rotation);

+       memset(&pstate->pipe_cfg[0], 0, PIPES_PER_PLANE *
sizeof(struct dpu_sw_pipe_cfg));
        /*
         * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer p=
air
         * configs for left and right half screen in case of 4:4:2 topology=
.
@@ -1055,6 +1056,13 @@ static int dpu_plane_atomic_check_sspp(struct
drm_plane *plane,
                if (!drm_rect_width(&pipe_cfg->src_rect))
                        continue;
                DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i=
);
+               if(!pipe->sspp) {
+                       WARN(1, "%svirtual plane pipe %d is null with
width %d height %d!!\n",
+                               dpu_use_virtual_planes ? " " : "non-",
+                               i,
+                               drm_rect_width(&pipe_cfg->src_rect),
+                               drm_rect_height(&pipe_cfg->src_rect));
+               }
                ret =3D dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
                                                  &crtc_state->adjusted_mod=
e,
                                                  new_plane_state);
>
>
> --
> With best wishes
> Dmitry

