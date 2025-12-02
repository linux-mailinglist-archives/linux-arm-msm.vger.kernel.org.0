Return-Path: <linux-arm-msm+bounces-84026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F28C99FD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 05:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CD0F84E041C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 04:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034AC2F5313;
	Tue,  2 Dec 2025 04:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFb7H2GG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046B5176ADE
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 04:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764649122; cv=none; b=DMsxFvUrqbEIhKzoM4AJynpYNVaPCLXp9pZPkuITJY7aBCjgS3V/ucKNWoQpXwfnp76kOa5IRKB36FdazT+EEa/zzgil26Cnn+t1n9iSwwW7IzWYAW1WILxfXCRRgMNslZmEQFLQhIf9DCuDoV82TUod584y2T1x5s+G1mZjPNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764649122; c=relaxed/simple;
	bh=ATRXWbqhb0zHrS1FLcweU+gyrDb1S9QyLnq9k9s7GjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lLiodg33B4NPGzvyKYkR/vASSRmZcdhET36BKXlhqAKCxO8i3QNElXERkcvmXU00aRUbWU4fIpR7BY1qcYzbQ4WvCgiUCLi8vi6wISH87W44QQEMw+VYaX1UBN/knyrEr3zX51OOs03pfc2IVP44qtXHyLQkoTMODwMZpiwXc5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RFb7H2GG; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78a712cfbc0so51512917b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 20:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764649120; x=1765253920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAi2upxQHqXV6w3YAiIFw0Ei8pBZRTlw4L7PGEXhfmk=;
        b=RFb7H2GGAWeT7hc2pClb5m07clVktSzvEQrEjhzb51Q+cf5CAFuId9RwSSg9EDAQ5g
         NwLxgaALl1sd9IF67peSi85QAAsh3y3t00/cV+uF/QEHn4qoNcR5kSqxPsCoIrl9XBC4
         6P2g1UP40SG7h70ii8x9gLHlP7H2Wk1XXBUhYGxG6eWe1plZb8w1oFDRQYd6b8hx8yU9
         RjMipUGuiIq96iKSiZT4DAoWIwpYQo/poznPhxkwd67d2x6r/3IoJiX0/Fd1E0/zNodE
         aGsrI4Jq3ztI1UmlHSuix+sbcVUcOH4i1qFL46OeGJkNOkWGTqKUuApugbeSJbVYzG5C
         1vpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764649120; x=1765253920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JAi2upxQHqXV6w3YAiIFw0Ei8pBZRTlw4L7PGEXhfmk=;
        b=q9jqk7wyyI6kR94jtHOkhjFoXawpNET4ZOICgAfkstvTDymTaAwZvPv96xTrcFQyHc
         gSwreUHX+5QS0peHvyLipPAa3eq2mAPA/3No2+lPpFQeR0WQoxtqZ5/Iv+pqMg4MTfXf
         qWJ2/0U3XAGdKu8tS0JwH3BBkckdoNqQvLmqPiMDbgm8uLaSVOhkWn6EvlRp7X4Nfzws
         e3o5UxfCYch78F0ucEwucgoRmUr4zUypubOXGJardqYxMxT8DxEGFXxUIRpcR+8WF/nw
         4dIR0Y9QWEAd3F1o1TQHSBLpURhB7R7u10VFkunUsI8uNEgHcMZubHbw9DyiaAUHCrz3
         YAYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcI2lSMbf4nJ0bJs+sq9bC4O47CKoJgKKqfJWNBr5/J4trxewJ0wKkpxEwaLl3N8ofovy1jvAJZWL7AwgO@vger.kernel.org
X-Gm-Message-State: AOJu0YwcID4WF7VYAKeOef01PxZvrcvGNeLDarwcIKrwUaIMdF2SyWRi
	k++xX/40p0NselKris9u93Gic9N+aWr8YoQmo8y5Iowcb4y7n8P+O841Y/C/mFH7ESp6uEWLZy6
	xljgplM0dIT2qUtrXg3X366lF7Dtrbo2VueQbZ7UVFQ==
X-Gm-Gg: ASbGnctjlFEIdJMHGB6Zk9I3AbPK7fTOaMkNu041OZs03cG8uOkd6Rmm0y2dPH1oAae
	K8QATuXzkvQmyVql64TmK+0BUgy4lu7XEGnWfYzfIJCrb20oLXD1Ajr8q4wAAEx5Z6r3BWDMPBz
	FnodFYwh5tyV+bRiV7fV3BqtpC0dpJu1+swRIiVelro3fGksRPhYRtJP6SYX6RpBIunKVsejbrH
	YV+GoTdFh0vZYDImsDCt3Gp6sIJDwf3krrcXOEJXR/o2G6UJKrqd+G+eChZz8+Xzo8f9FljAPL7
	ZyeMv9BJtYwauKlr
X-Google-Smtp-Source: AGHT+IHm2Lb3KR5gVidXp7FW07QIkyqamhFjHbL15N5fpaAs7gMhEGz5ghkqWBZy6gX1AwwN7GcT9+/zubzA9ATXx70=
X-Received: by 2002:a05:690c:e3e6:b0:788:7f:9a5 with SMTP id
 00721157ae682-78a8b495634mr334380197b3.20.1764649119895; Mon, 01 Dec 2025
 20:18:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-10-ff6232e3472f@linaro.org> <tjakx64c25gyakblncsvuoj2iquoknx4ngwujt2uf2clhhfvfl@lbvhrimf6gwp>
In-Reply-To: <tjakx64c25gyakblncsvuoj2iquoknx4ngwujt2uf2clhhfvfl@lbvhrimf6gwp>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 2 Dec 2025 12:18:28 +0800
X-Gm-Features: AWmQ_bmh31LDDZhLcB5X5diPs4fQyKerYqoKD4tX0pSTR_6U-SSLi0GjQw-lPdA
Message-ID: <CABymUCN2rwfbBbSVe9oSWr9mio-ie38JzgcdvSxV-87aan7Nrg@mail.gmail.com>
Subject: Re: [PATCH v16 10/10] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Marijn Suijten <marijn.suijten@somainline.org> =E4=BA=8E2025=E5=B9=B411=E6=
=9C=8830=E6=97=A5=E5=91=A8=E6=97=A5 00:37=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2025-09-18 21:29:02, Jun Nie wrote:
> > To support high-resolution cases that exceed the width limitation of
> > a pair of SSPPs, or scenarios that surpass the maximum MDP clock rate,
> > additional pipes are necessary to enable parallel data processing
> > within the SSPP width constraints and MDP clock rate.
> >
> > Request 4 mixers and 4 DSCs for high-resolution cases where both DSC
> > and dual interfaces are enabled. More use cases can be incorporated
> > later if quad-pipe capabilities are required.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 27 ++++++++++++++++=
+------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++--------=
--------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
> >  6 files changed, 35 insertions(+), 32 deletions(-)
>
> With this patch applied, I get the following crash on the Sony Xperia 1 I=
II, a
> dual-DSI dual-DSC device:
>
>         Unable to handle kernel NULL pointer dereference at virtual addre=
ss 0000000000000020
>         Mem abort info:
>           ESR =3D 0x0000000096000004
>           EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>           SET =3D 0, FnV =3D 0
>           EA =3D 0, S1PTW =3D 0
>           FSC =3D 0x04: level 0 translation fault
>         Data abort info:
>           ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
>           CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
>           GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
>         user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000012d4e1000
>         [0000000000000020] pgd=3D0000000000000000, p4d=3D0000000000000000
>         Internal error: Oops: 0000000096000004 [#1]  SMP
>         Modules linked in: msm drm_client_lib ubwc_config drm_dp_aux_bus =
gpu_sched drm_gpuvm drm_exec
>         CPU: 5 UID: 0 PID: 3081 Comm: (sd-close) Tainted: G     U        =
      6.18.0-rc7-next-20251127-SoMainline-12422-g10b6db5b056d-dirty #21 NON=
E
>         Tainted: [U]=3DUSER
>         Hardware name: Sony Xperia 1 III (DT)
>         pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
>         pc : dpu_plane_atomic_check_sspp.isra.0+0x88/0x3f4 [msm]
>         lr : dpu_plane_atomic_check_sspp.isra.0+0x84/0x3f4 [msm]
>         sp : ffff800081e23940
>         x29: ffff800081e23950 x28: ffff0000bf2700d0 x27: 0000000000000a00
>         x26: ffff0000bf270000 x25: 0000000000000a00 x24: ffff0000bd0e5c18
>         x23: ffff000087a6c080 x22: 0000000000000224 x21: ffff00008ce88080
>         x20: 0000000000000002 x19: ffff0000bf270138 x18: ffff8000818350b0
>         x17: 000000040044ffff x16: ffffc488ae2e37e0 x15: 0000000000000005
>         x14: 0000000000000a00 x13: 0000000000000000 x12: 0000000000000138
>         x11: 0000000000000000 x10: 0000000000000012 x9 : 0000000000000000
>         x8 : 0000000000000a00 x7 : 0000000000000000 x6 : 0000000000000000
>         x5 : 0000000000000002 x4 : 0000000000000000 x3 : ffffc48897741db0
>         x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
>         Call trace:
>          dpu_plane_atomic_check_sspp.isra.0+0x88/0x3f4 [msm] (P)
>          dpu_plane_atomic_check+0x100/0x1a0 [msm]
>          drm_atomic_helper_check_planes+0xd8/0x224
>          drm_atomic_helper_check+0x50/0xb4
>          msm_atomic_check+0xd0/0xe0 [msm]
>          drm_atomic_check_only+0x4e0/0x928
>          drm_atomic_commit+0x50/0xd4
>          drm_client_modeset_commit_atomic+0x200/0x260
>          drm_client_modeset_commit_locked+0x64/0x180
>          drm_client_modeset_commit+0x30/0x60
>          drm_fb_helper_lastclose+0x60/0xb0
>          drm_fbdev_client_restore+0x18/0x38 [drm_client_lib]
>          drm_client_dev_restore+0xac/0xf8
>          drm_release+0x124/0x158
>          __fput+0xd4/0x2e4
>          fput_close_sync+0x3c/0xe0
>          __arm64_sys_close+0x3c/0x84
>          invoke_syscall.constprop.0+0x44/0x100
>          el0_svc_common.constprop.0+0x3c/0xe4
>          do_el0_svc+0x20/0x3c
>          el0_svc+0x38/0x110
>          el0t_64_sync_handler+0xa8/0xec
>          el0t_64_sync+0x1a0/0x1a4
>         Code: 2a1403e5 52800082 94008e28 f9400380 (f940101b)
>         ---[ end trace 0000000000000000 ]---
>         pstore: backend (ramoops) writing error (-28)
>         [drm:dpu_encoder_frame_done_timeout:2726] [dpu error]enc33 frame =
done timeout
>
> I don't see any thought given to it in the extremely terse patch descript=
ion,
> but this patch seems to unconditionally select 4 DSCs and 4 LMs on this d=
evice
> because the underlying SM8350 SoC has 4 available in its catalog - while =
it
> was previously affixed to 2:2:2 matching the downstream and known-working
> configuration of this device - and I can only imagine things are rolling
> downhill from there.

This patch expands pipe array size from 2 to 4, and changes the
topology decision making.
There is an assumption that 2 stages(4LMs) should be allocated in case
of 2 interfaces with
DSC enabled, because it is a very high resolution use case. This fails
for your 2:2:2 use case.
But I still expect there are only 2 pipes info filled for your case,
and the later 2 pipes shall be
 bypassed in dpu_plane_atomic_check_sspp() and does not introduce
panic. So there is
bug in SSPP handling.

What's your IRC ID and timezone? IRC shall be much more efficient, if
you want to discuss
more detail and debug support.
>
> faddr2line seems to be failing for me, but this is the line
> `dpu_plane_atomic_check_sspp.isra.0+0x88` seems to be referring to:
>
>         aarch64-linux-gnu-objdump .output/drivers/gpu/drm/msm/msm.ko -dS =
| grep dpu_plane_atomic_check_sspp.isra.0\> -A80
>         00000000000671ac <dpu_plane_atomic_check_sspp.isra.0>:
>         static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>         ...
>            67234:       f940101b        ldr     x27, [x0, #32]
>                 if (!(sblk->scaler_blk.len && pipe->sspp->ops.setup_scale=
r) &&
>
> Please help resolve this issue, as I am not understanding the thought pro=
cess
> behind this patch and unsure how to solve this issue short of just revert=
ing it.
>
> Looking forward to some assistance, thanks;
> - Marijn

