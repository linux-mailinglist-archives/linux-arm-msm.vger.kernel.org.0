Return-Path: <linux-arm-msm+bounces-44497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A4BA06BCF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 04:04:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EC197A19F7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 03:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0A41442F3;
	Thu,  9 Jan 2025 03:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7oZqRcY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C937313C918;
	Thu,  9 Jan 2025 03:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736391870; cv=none; b=EWmuOWTVEDmGeopYB6uAmLQ/dENbqs+pvsrtIIIr/qQtxgXEMjG7+yUmN+nl2LJrK5ltuA00xPRWGgbfsuKP5+gK++erJhJyZA6Off+gdyEviEq0hlWKiLa+nrosSlkQ6xbg4ZVezc4SgRSaoYd5yAXMdRiKj1u7CarqcdHayeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736391870; c=relaxed/simple;
	bh=/uL1aTl9Hy93XM1IwZ2oLZQenkBno5D5q7myToG+H7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=InVajpfv3Ob6WxFljyJDeGU5/aoBBI8w+KWYuJMbqTdufvNJ9OffIMuAPBLKcZA4mvpt5AkJwnmAy9IycY3LcEint2B/0w3V/3pNKv9NMucNasVo120qGXNPhMbPN8pHa9m70ikDfVv0Zr6lf+VmcUIBfyqHnx3T2LiWB2AERAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7oZqRcY; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3a813899384so1203205ab.1;
        Wed, 08 Jan 2025 19:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736391868; x=1736996668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkPaEizzVylaqIVJqpAtMxdZUsuN54Vz1Vbvy9dJAp8=;
        b=R7oZqRcYKIyz/16bCBisTl36acBsE87cwCabPbwWlnGlN2jhV+hUwxlgcRZTn0BYLV
         xKjDwWr2r9a5dpZ+SxPxVntguvMo/betMmW1mIIebmJaGGBtqLv8QbC4bKaxFtPQeJyW
         yrn9mtzZHgg7ojfh3wpK6jpC77W4jCyYr/d/Fi/ob+ZigXHrMbcsuBSaZBD7oQvRWvCJ
         EgASbP1/6Pm5HwQh4jxzEZ3Utbx4u4m9bidVFaSnw9DEVNDmLov/Whf5WSTjj6O6zzgY
         /HRFyJO7WUvtj6ODQz8ksyB5JfACazx0Q4pGDSu1iP7DBRHln1/sBbo8DLx3GgP1sRYm
         Blng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736391868; x=1736996668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkPaEizzVylaqIVJqpAtMxdZUsuN54Vz1Vbvy9dJAp8=;
        b=HM3f7CXAO2ouyXVq1P9YMeswhcL32V2oLCMlkeKjEqVUz/WcJxwyvcfYFFa8DT56i2
         mAMXKU10nvfE4kpmnB60PJ8t2XTwLKdXN/0HRFiJSlDtnNSmkCWbZe7Pwb98Up8RP/xV
         cwNqICXIOYW0qRKH/+gFT636kc+YeGXV9u6+SuPkuglIEovPm6L3sdYVdi0EZY2TziG+
         ugMoRYzqOiW97q6tciL9TvRCof6KBiJR2Jy1iAhMa1KjMz5abhkaFYMkV9xhTUuLhP6b
         pqyRl3nmlff7SVrSls0xW9/UyWrUeXq9LZtabQCg7JhZTooHJws8vB0hlD6VKez79jDP
         lTBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWalOTuN3UysmpxZLGpnqlHfTkzMSogH6BwPPZd6/XMLbh/u6WdSzxxFJAFLjLcuAuZxgPZ5K9d4k0eik9W@vger.kernel.org, AJvYcCX/0lafEuAw33ePJ9pYMExtShPumbM/1uHe64SMj+7ci97POMiSv+zz1FoAcO1QPeuqiACElj5LnuVr3dIr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw98UwMzmYYLlvicWFAQUjcyN4fSWNJCuzlp2+R5ikmjp4ZFp31
	K+wmvWMl/5FIEqe5pkbLmZ+rkttEQUST72XEQl/Zww4pJb/Hg4z+tPJgUDWZc4eybIfhCRWYxb0
	CiCL0dcY/0HsojoZSJHnGORRljzo=
X-Gm-Gg: ASbGnctTPcX/z70VaM8z4xWMZFmE+qS5MYKGOi8Ks9yQ7e3h0dtLWjKW7RTlI/9UhsM
	mNZFY6OrQFdeJDnNgbFkXsEAuRmeNImx68nwK7Q==
X-Google-Smtp-Source: AGHT+IGKouW4s0ig1IZFdOJPK75zftIgIAhAggfpl72VYElMCOiKodqi0Waf3EQSOR/7MKpPpbXuI6HMuz9FLcROVp0=
X-Received: by 2002:a92:c248:0:b0:3a7:e732:4713 with SMTP id
 e9e14a558f8ab-3ce3a9c1aa9mr39893615ab.15.1736391867932; Wed, 08 Jan 2025
 19:04:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108-async-disable-fix-v1-1-3f93eb600a3a@quicinc.com>
 <CAF6AEGtksLq5jpizGMj4t248rbNScgDvrxpxv09==b3DmpkLuQ@mail.gmail.com>
 <CAA8EJpqPZc7DNOb6WcRVtH0cFs9mUziL-dPgyakEJGO73=B6gA@mail.gmail.com> <58d9c139-c811-47aa-a527-4b1af110337c@quicinc.com>
In-Reply-To: <58d9c139-c811-47aa-a527-4b1af110337c@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 8 Jan 2025 19:04:16 -0800
X-Gm-Features: AbW1kvZUwRXF-wTU5eTUH3s0B17tGFt4YK3etDC_4Sz_buO1KY-fi-pTtDWhh28
Message-ID: <CAF6AEGuFTW4hVursv-EKQ7GfVuUDJ4C0qWS0F+j1jPi+mP_xnA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Force disabling commits to take non-async path
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@chromium.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 6:22=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicinc=
.com> wrote:
>
>
>
> On 1/8/2025 6:14 PM, Dmitry Baryshkov wrote:
> > On Thu, 9 Jan 2025 at 03:45, Rob Clark <robdclark@gmail.com> wrote:
> >>
> >> On Wed, Jan 8, 2025 at 2:58=E2=80=AFPM Jessica Zhang <quic_jesszhan@qu=
icinc.com> wrote:
> >>>
> >>> Force commit that are disabling a plane in the async_crtc to take the
> >>> non-async commit tail path.
> >>>
> >>> In cases where there are two consecutive async cursor updates (one
> >>> regular non-NULL update followed by a disabling NULL FB update), it i=
s
> >>> possible for the second NULL update to not be queued (due to the
> >>> pending_crtc_mask check) or otherwise not be run before the cursor FB=
 is
> >>> deallocated by drm_atomic_helper_cleanup_planes(). This would cause a
> >>> context fault since the hardware would try to fetch the old plane sta=
te
> >>> with the stale FB address.
> >>>
> >>> Avoid this issue by forcing cursor updates that will disable the curs=
or
> >>> plane to be blocking commits. This will ensure that hardware clears a=
nd
> >>> stops fetching the FB source address before the driver deallocates th=
e FB
> >>>
> >>> Fixes: 2d99ced787e3 ("drm/msm: async commit support")
> >>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>> ---
> >>>   drivers/gpu/drm/msm/msm_atomic.c | 13 +++++++++++++
> >>>   1 file changed, 13 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/m=
sm_atomic.c
> >>> index 9c45d641b5212c11078ab38c13a519663d85e10a..ddc74c68148c643d34ca6=
31dd28d4cdc2b8c7dc0 100644
> >>> --- a/drivers/gpu/drm/msm/msm_atomic.c
> >>> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> >>> @@ -142,6 +142,7 @@ static bool can_do_async(struct drm_atomic_state =
*state,
> >>>          struct drm_connector_state *connector_state;
> >>>          struct drm_connector *connector;
> >>>          struct drm_crtc_state *crtc_state;
> >>> +       struct drm_plane_state *plane_state;
> >>>          struct drm_crtc *crtc;
> >>>          int i, num_crtcs =3D 0;
> >>>
> >>> @@ -162,6 +163,18 @@ static bool can_do_async(struct drm_atomic_state=
 *state,
> >>>                  *async_crtc =3D crtc;
> >>>          }
> >>>
> >>> +       /*
> >>> +        * Force a blocking commit if the cursor is being disabled. T=
his is to
> >>> +        * ensure that the registers are cleared and hardware doesn't=
 try to
> >>> +        * fetch from a stale address.
> >>> +        */
> >>> +       if (*async_crtc) {
> >>> +               plane_state =3D drm_atomic_get_new_plane_state(state,
> >>> +                                                            (*async_=
crtc)->cursor);
> >>> +               if (plane_state && !plane_state->fb)
> >>> +                       return false;
> >>
> >> hmm, I suppose we want the same even if the fb changes?  Or
> >> alternatively somewhere hold an extra ref to the backing obj until hw
> >> has finished scanout?
> >
>
> Hi Rob
>
> Do you mean we need to also check if old_plane_state->fb !=3D
> new_plane_state->fb, then use blocking commit?

yeah, basically.. if we release any outgoing fb the backing bo could
be potentially freed+unmapped leading to the same problem.

idk if this more conservative approach would cause fps issues..
holding an extra ref would avoid potential issues, but offhand I'm not
sure if it would be a perf problem in practice.  Maybe with animated
cursors?

BR,
-R

> We can try that out.
>
> holding extra ref gets tricky IMO. In this way, the calls are balanced
> in places we know.
>
> > I think a more correct approach would be to run a worker, waiting for
> > the commit to happen and then freeing the FBs.
> >
>
> Hi Dmitry
>
> This option was tried . It gets very messy to handle it this way. Then
> we realized that, the worker is going to try to do the same thing a
> blocking commit does which is to wait for hw to finish scanout and then
> cleanup planes. Hence this was preferred and is better IMO.
>
> >>
> >> BR,
> >> -R
> >>
> >>> +       }
> >>> +
> >>>          return true;
> >>>   }
> >>>
> >>>
> >>> ---
> >>> base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
> >>> change-id: 20250108-async-disable-fix-cc1b9a1d5b19
> >>>
> >>> Best regards,
> >>> --
> >>> Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>
> >
> >
> >

