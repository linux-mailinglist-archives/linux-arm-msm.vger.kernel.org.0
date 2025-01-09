Return-Path: <linux-arm-msm+bounces-44640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 483C2A07C33
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 16:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 790313A3847
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 15:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8AE321D581;
	Thu,  9 Jan 2025 15:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFODO1wm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8C721CA1E;
	Thu,  9 Jan 2025 15:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736437478; cv=none; b=fn/9mmr2+W0D9rImrJfqZxeTQbHBtHPn8wiv95t6lGxroILAxtY3a7JJ8b9J7E3jPVfSWDK6GtjaPSwksVIHZYaLxl/rNmZqadJfc/v4YzCSqEGxJ/+hkh1fQnMQFifFJTr+WVbj3dQiC4sQRe1R05DvrJUs0JpcTwOtZzJEeAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736437478; c=relaxed/simple;
	bh=3vlIT8/N7aGs7OHHQwxZj2br9iWtsfW8KogIkZ43YfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PfZpqXWN+KTpXgaqPX/6Zx/VjnKow/PUx4GzG7ZE3CGh7KxYmVasYogDCl/EQS2Vsb1POFq0/05KpC5g9YGuu86iKrcwzw/LOm+jQ3pqXjnTEqFuZKx93Gb1BxOWqm32Og9E2CxVFqUt7BvVT/bWc6Kmf2rPDMOTFIrvYChe0mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFODO1wm; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3a9d9c86920so2527155ab.2;
        Thu, 09 Jan 2025 07:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736437476; x=1737042276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyvHFgAQemGUxOtGmKefldysG5aDz/1ceoYMUjX+3Nc=;
        b=ZFODO1wm3ZFnIGk6PasuhE6BOQ1W8Le5xClbBnY5MkZH2lrEYuPRa3X1SgyPyY7s7Z
         FO3BDUbjtE6vkQIObSt9RCT/wZaxsEPOvsSTJXe67tvFHaTbJj+P2u/VLODSZyZaVc1+
         Xl2e/9YyZAUBRJaCFhnf6e5B4bqkUskOY4v4a9W0kcbGpjeSyJi1jfE92NHDRXI4yrYN
         wgDZfDnWWwCgCbtV+UVGepkk/7ftwBRFpn4DECFG/1g/CsrSWK80pf5rSFcnetHDdIkz
         6iv+6xEehwcEN6TpIWr2cPDAUVv0I/7Vt3WmSbeTO6o/sEH3wsdIJ5KdvAVm15b6u4Ho
         Xkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437476; x=1737042276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyvHFgAQemGUxOtGmKefldysG5aDz/1ceoYMUjX+3Nc=;
        b=ZsKgDmCxOMsc3aOVS9icQFMOJk6ZuULyGY95Rw3WlWA2UgRmZSdKK1iKLyqLyBhwUP
         ZPTF7O/LodYciHEHl/M5RL7/FAHy4LDjrRwX+hKKM8mEbL9oO886LaNNrOjM6L06LNjT
         xpEoH0uueZgPajcsKkn9slVEt7F6ltS9sLzedRh7Y8tk6GMc0yhpCLCQ4EsvcltIFyzD
         lf0RXnWDSupYq8wfe5YuBloJzDdvqBzeIvP6MOLLSncpOE+BHpkR3uhu3zNy+TB1Ijh2
         wmYQifyllvA0qVTehnUwn9kuFC1qM9GcWGPn1STL52PklfIHbBpDArjPPQLrFNR2TGI4
         hXyg==
X-Forwarded-Encrypted: i=1; AJvYcCX+cFYcuEUP8YHxoWMRJbgd+WQGla8jVERxdZJRgzUUNP0///2IF7gWx960gzr3XnvMTW47uYUKvB6E3efg@vger.kernel.org, AJvYcCX93E47RZKlhrTGVyd0CwhbN/EIjBCUAa3cldYnwLpen+PgNxHkyHLT8ggWhcO7+gHrTXPaTvQld2hzRP+M@vger.kernel.org
X-Gm-Message-State: AOJu0YzJJJyUeNADvWkzVSPoZGTBlsq2p+fccfYhPzDhSjeM03puiaqG
	NdYCfnMGkUsDTdr3w3/NsArhwbpAuhXdsbHhYXdPVrTVbWj6TvBUzPI9L5idZw6gZIv/WbmFI3+
	XTJKwVQ8OTm6bMuWYmuqriltKHP3qOUeq
X-Gm-Gg: ASbGncsx4Z5hrfUtfjaqt749EdVlpHkR6Q/uAPmSG0HlAV3brzvgszXLmBZuQNpcNE6
	euiVztXB76MOEe4WjnHc66NsfdzNh73mW2DtOZ4Fv7ydNlOKfVnUKEEOXYvID7uaZsbId
X-Google-Smtp-Source: AGHT+IH1uHRChV+q9fG3nQmU9PjOCTRBD0DeSzOQ4/o+oVqmyFmooEnJ9LKjoMSqbPXYgcjXxVq5cgZ+OAqRKJgySXs=
X-Received: by 2002:a05:6e02:1d84:b0:3a7:6c5c:9aa4 with SMTP id
 e9e14a558f8ab-3ce3a888392mr56333685ab.12.1736437476062; Thu, 09 Jan 2025
 07:44:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108-async-disable-fix-v1-1-3f93eb600a3a@quicinc.com>
 <CAF6AEGtksLq5jpizGMj4t248rbNScgDvrxpxv09==b3DmpkLuQ@mail.gmail.com>
 <CAA8EJpqPZc7DNOb6WcRVtH0cFs9mUziL-dPgyakEJGO73=B6gA@mail.gmail.com>
 <58d9c139-c811-47aa-a527-4b1af110337c@quicinc.com> <CAF6AEGuFTW4hVursv-EKQ7GfVuUDJ4C0qWS0F+j1jPi+mP_xnA@mail.gmail.com>
 <f9863c54-ca35-476b-b6aa-0eb1c18ec29e@quicinc.com>
In-Reply-To: <f9863c54-ca35-476b-b6aa-0eb1c18ec29e@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 9 Jan 2025 07:44:24 -0800
X-Gm-Features: AbW1kvZyFraHcis8-8bS-LzWqZzHknSnK9_IGXuJYlkQtzj04wvflqCRVla3TE4
Message-ID: <CAF6AEGu26n2LELtkGYJnUNahNqvwhZnUDeoyZaSC3dPRg75K+w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Force disabling commits to take non-async path
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@chromium.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 7:14=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicinc=
.com> wrote:
>
>
>
> On 1/8/2025 7:04 PM, Rob Clark wrote:
> > On Wed, Jan 8, 2025 at 6:22=E2=80=AFPM Abhinav Kumar <quic_abhinavk@qui=
cinc.com> wrote:
> >>
> >>
> >>
> >> On 1/8/2025 6:14 PM, Dmitry Baryshkov wrote:
> >>> On Thu, 9 Jan 2025 at 03:45, Rob Clark <robdclark@gmail.com> wrote:
> >>>>
> >>>> On Wed, Jan 8, 2025 at 2:58=E2=80=AFPM Jessica Zhang <quic_jesszhan@=
quicinc.com> wrote:
> >>>>>
> >>>>> Force commit that are disabling a plane in the async_crtc to take t=
he
> >>>>> non-async commit tail path.
> >>>>>
> >>>>> In cases where there are two consecutive async cursor updates (one
> >>>>> regular non-NULL update followed by a disabling NULL FB update), it=
 is
> >>>>> possible for the second NULL update to not be queued (due to the
> >>>>> pending_crtc_mask check) or otherwise not be run before the cursor =
FB is
> >>>>> deallocated by drm_atomic_helper_cleanup_planes(). This would cause=
 a
> >>>>> context fault since the hardware would try to fetch the old plane s=
tate
> >>>>> with the stale FB address.
> >>>>>
> >>>>> Avoid this issue by forcing cursor updates that will disable the cu=
rsor
> >>>>> plane to be blocking commits. This will ensure that hardware clears=
 and
> >>>>> stops fetching the FB source address before the driver deallocates =
the FB
> >>>>>
> >>>>> Fixes: 2d99ced787e3 ("drm/msm: async commit support")
> >>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>>> ---
> >>>>>    drivers/gpu/drm/msm/msm_atomic.c | 13 +++++++++++++
> >>>>>    1 file changed, 13 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm=
/msm_atomic.c
> >>>>> index 9c45d641b5212c11078ab38c13a519663d85e10a..ddc74c68148c643d34c=
a631dd28d4cdc2b8c7dc0 100644
> >>>>> --- a/drivers/gpu/drm/msm/msm_atomic.c
> >>>>> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> >>>>> @@ -142,6 +142,7 @@ static bool can_do_async(struct drm_atomic_stat=
e *state,
> >>>>>           struct drm_connector_state *connector_state;
> >>>>>           struct drm_connector *connector;
> >>>>>           struct drm_crtc_state *crtc_state;
> >>>>> +       struct drm_plane_state *plane_state;
> >>>>>           struct drm_crtc *crtc;
> >>>>>           int i, num_crtcs =3D 0;
> >>>>>
> >>>>> @@ -162,6 +163,18 @@ static bool can_do_async(struct drm_atomic_sta=
te *state,
> >>>>>                   *async_crtc =3D crtc;
> >>>>>           }
> >>>>>
> >>>>> +       /*
> >>>>> +        * Force a blocking commit if the cursor is being disabled.=
 This is to
> >>>>> +        * ensure that the registers are cleared and hardware doesn=
't try to
> >>>>> +        * fetch from a stale address.
> >>>>> +        */
> >>>>> +       if (*async_crtc) {
> >>>>> +               plane_state =3D drm_atomic_get_new_plane_state(stat=
e,
> >>>>> +                                                            (*asyn=
c_crtc)->cursor);
> >>>>> +               if (plane_state && !plane_state->fb)
> >>>>> +                       return false;
> >>>>
> >>>> hmm, I suppose we want the same even if the fb changes?  Or
> >>>> alternatively somewhere hold an extra ref to the backing obj until h=
w
> >>>> has finished scanout?
> >>>
> >>
> >> Hi Rob
> >>
> >> Do you mean we need to also check if old_plane_state->fb !=3D
> >> new_plane_state->fb, then use blocking commit?
> >
> > yeah, basically.. if we release any outgoing fb the backing bo could
> > be potentially freed+unmapped leading to the same problem.
> >
>
> Yeah true, this case also we can hit this. Will add it and check.
>
> > idk if this more conservative approach would cause fps issues..
> > holding an extra ref would avoid potential issues, but offhand I'm not
> > sure if it would be a perf problem in practice.  Maybe with animated
> > cursors?
> >
>
> hmmm.... we did not see any significant lags or drops when we tested
> this (that was also our major concern to make sure we dont)

It's tricky because it is very much at the mercy of what userspace
does.. and different userspace does different things.

I remember issues back in the gtk2 days with something (gdm?) trying
to update a spinning cursor at 1000fps.  When that was clamped at
60fps it would literally take 5min to login!

> If we do have to hold an extra ref, we will have to do something like bel=
ow:
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 098abc2c0003..97d9e056038c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -649,8 +649,10 @@ static int dpu_plane_prepare_fb(struct drm_plane
> *plane,
>          struct dpu_kms *kms =3D _dpu_plane_get_kms(&pdpu->base);
>          int ret;
>
> -       if (!new_state->fb)
> +       if (!new_state->fb) {
> +               refcount_inc(&msm_fb->dirtyfb);
>                  return 0;
> +       }
>
>          DPU_DEBUG_PLANE(pdpu, "FB[%u]\n", fb->base.id);
>
> @@ -682,8 +684,10 @@ static void dpu_plane_cleanup_fb(struct drm_plane
> *plane,
>          struct dpu_plane *pdpu =3D to_dpu_plane(plane);
>          struct dpu_plane_state *old_pstate;
>
> -       if (!old_state || !old_state->fb)
> +       if (!old_state || !old_state->fb) {
> +               refcount_dec(&msm_fb->dirtyfb);
>                  return;
> +       }
>
>          old_pstate =3D to_dpu_plane_state(old_state);
>
> I dont know if this is clean though. WDYT?

The dirtyfb ref is not what you want.  It is tracking if any attached
display changes need dirtyfb to flush changes to the panel.  See [1]

The other issue is that cleanup_fb will be called when drm core
_thinks_ the atomic commit is completed, not when it _actually_ has.

Probably the dpu_plane should hold a ref of the scanout bo until
vblank, rather than rely on the plane state holding a ref to the fb
(which holds a ref to the bo)?  drm_flip_work might be helpful for
this sort of thing.

BR,
-R

[1] https://lore.kernel.org/all/20220223191118.881321-1-robdclark@gmail.com=
/

>
>
> > BR,
> > -R
> >
> >> We can try that out.
> >>
> >> holding extra ref gets tricky IMO. In this way, the calls are balanced
> >> in places we know.
> >>
> >>> I think a more correct approach would be to run a worker, waiting for
> >>> the commit to happen and then freeing the FBs.
> >>>
> >>
> >> Hi Dmitry
> >>
> >> This option was tried . It gets very messy to handle it this way. Then
> >> we realized that, the worker is going to try to do the same thing a
> >> blocking commit does which is to wait for hw to finish scanout and the=
n
> >> cleanup planes. Hence this was preferred and is better IMO.
> >>
> >>>>
> >>>> BR,
> >>>> -R
> >>>>
> >>>>> +       }
> >>>>> +
> >>>>>           return true;
> >>>>>    }
> >>>>>
> >>>>>
> >>>>> ---
> >>>>> base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
> >>>>> change-id: 20250108-async-disable-fix-cc1b9a1d5b19
> >>>>>
> >>>>> Best regards,
> >>>>> --
> >>>>> Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>>>
> >>>
> >>>
> >>>

