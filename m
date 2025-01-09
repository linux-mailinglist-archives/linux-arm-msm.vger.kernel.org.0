Return-Path: <linux-arm-msm+bounces-44492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40481A06A66
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 02:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33D4F16645B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 01:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40772BA38;
	Thu,  9 Jan 2025 01:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buwOwBq3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5578837;
	Thu,  9 Jan 2025 01:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736387149; cv=none; b=OU0DS8+b6tCxGCdnKXPRSJqxzDo5bQy06/yajFBmFUT9OzU7faA34QiPJWAPlHxbJD3Gx94SdQs9ybO4ChDgBWANxVH+PPLF2VPlbVcFCxGpBIS6tnJh8q1owyXz0+IEqNuiqw7CTw90idDUEg0QaZzlYULk+dkNvV5w5fFweJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736387149; c=relaxed/simple;
	bh=v1K8QZ+Jb2eiSwctjPW08hwdL2mbIL033qctmYbCc3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b67PJ9mNKIYJpbjNS+grMslbvUz5OJLF0umToOKsCYZVkRf7mRhs98yTtMbJ6DM3frKfD8XnmcIrsDlmskXPvf6WzdCJZVRME20li07294IqhnmDkPGVZnPRd0ikhhOY3ifsqguyk7ZAoG/44XmxanVIl0Msff720kYC6XttLGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buwOwBq3; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3a7d7db4d89so1014135ab.1;
        Wed, 08 Jan 2025 17:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736387146; x=1736991946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTQXQ88z6zCYwAtzCdJiZfz8OLcokO/zYH3FfJ1Du5Q=;
        b=buwOwBq3j4q7FiVk+DGkSodD7NdSLn54oXvIQESX/8dcsP1D2wFBm9sChxBAtdvKL0
         HmpGUKzqTpjuMxokIFtBXvvaoaZ0GSnj/PC2QYoiktjMlcwcR/rpeKkt/z8S4hJA8TQr
         jEgsqK9yUySMYPBo/KtRGjCHy8nhIvVKnf1+fhgE4r1NQIgD+ta5dpPPfMOeBpvLNo53
         nYF4TXtm2hdXfvNmmYH8vgiCMKy+T3qL3kXlvz1zZ6ihBcboMyTHnPKHy9UuX6BAzxUr
         GNEU+aM1yWjDp4LnqA1vEwmekgSYOb3ZwB68ovtwhf7Lw8IlVcDogf6KQt19cTSNyGbH
         lzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736387147; x=1736991947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTQXQ88z6zCYwAtzCdJiZfz8OLcokO/zYH3FfJ1Du5Q=;
        b=izw3xR1sIcq006QASiv6Cu36R+96kb4PAI+776t/zpdksjtYBu/pDcz80WA6NsGEEn
         EAN81wUz11AQuVjY+ATnXKecfABtDJF+vFX0Hxyb8S9xxlzLSaU6wIG19cyOHAPR5wCi
         IiTFxt27uofxMdAsL+hpBc505xTGyBEqoY+t60097KfoXG+kevTkZNzNjl12i7votJOP
         pl3THIsxmdbjV9zM5x9E5Du22wxEcP7qlP1reGGnQmmSLaWDQkk8lBqYzgFsAlsxTYz7
         2NaD+7mtFbvWe/Wab709jfoa1/NtnAbb+YCfo8WJrzPotNKzcCCP8ix6MSXOTSzhkYXU
         wxxg==
X-Forwarded-Encrypted: i=1; AJvYcCULWnLlr56ySWUteE7ro2yqOfE8pdRwiDg54jioxV+5fPC1f2E0v8ptIJmqx0XL4dI3pw58kJc84aVCmLs+@vger.kernel.org, AJvYcCXOHX3PsNux8yCGpDBdfr9z3tjOjsLWjV7qwgHWqq3MmSI4tG2ye+mM1Ntbylxp3Q94wDxnydKysfDVRPGz@vger.kernel.org
X-Gm-Message-State: AOJu0YyBclczSiKHMz6MvQNr9I/fCwukgv/OsgXb7AR1lNtEl2+9/00e
	nv6L/EqURKKsMnqusyQ65jedO/p7FKLvdzWl1WFbvZVZvjaFh/5HHSNbM202XyzDElleCTBG0xJ
	Ld31S+OfH6w0HKsBxmMfar2pj/Bc=
X-Gm-Gg: ASbGnctnBHSP0h38Gobc53vqjW+Iaegjgpu2P+e1CGuXziK5IQYLsfNGel7PkMyfLJi
	QGTcwGGuylWxeGfTHlQNXUNKLNt0CgkG88ZFo6Q==
X-Google-Smtp-Source: AGHT+IGBEnxLiqQwEwqCLiJMvA30J+8yT00wj3VykLNsaPq0HBxMd+8svgTY3q2CD3uP4yGSIaNaRv07o8fUgHbMTz4=
X-Received: by 2002:a05:6e02:12ce:b0:3a7:e0c0:5f0d with SMTP id
 e9e14a558f8ab-3ce3a9a4fd2mr43044545ab.3.1736387146356; Wed, 08 Jan 2025
 17:45:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108-async-disable-fix-v1-1-3f93eb600a3a@quicinc.com>
In-Reply-To: <20250108-async-disable-fix-v1-1-3f93eb600a3a@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 8 Jan 2025 17:45:34 -0800
X-Gm-Features: AbW1kvb-J3B0kavNpLCK8O885MCz48UcexWGb0twwfPbSZkvjRUax-a3vTyGwW8
Message-ID: <CAF6AEGtksLq5jpizGMj4t248rbNScgDvrxpxv09==b3DmpkLuQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Force disabling commits to take non-async path
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com, 
	Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 2:58=E2=80=AFPM Jessica Zhang <quic_jesszhan@quicinc=
.com> wrote:
>
> Force commit that are disabling a plane in the async_crtc to take the
> non-async commit tail path.
>
> In cases where there are two consecutive async cursor updates (one
> regular non-NULL update followed by a disabling NULL FB update), it is
> possible for the second NULL update to not be queued (due to the
> pending_crtc_mask check) or otherwise not be run before the cursor FB is
> deallocated by drm_atomic_helper_cleanup_planes(). This would cause a
> context fault since the hardware would try to fetch the old plane state
> with the stale FB address.
>
> Avoid this issue by forcing cursor updates that will disable the cursor
> plane to be blocking commits. This will ensure that hardware clears and
> stops fetching the FB source address before the driver deallocates the FB
>
> Fixes: 2d99ced787e3 ("drm/msm: async commit support")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_a=
tomic.c
> index 9c45d641b5212c11078ab38c13a519663d85e10a..ddc74c68148c643d34ca631dd=
28d4cdc2b8c7dc0 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -142,6 +142,7 @@ static bool can_do_async(struct drm_atomic_state *sta=
te,
>         struct drm_connector_state *connector_state;
>         struct drm_connector *connector;
>         struct drm_crtc_state *crtc_state;
> +       struct drm_plane_state *plane_state;
>         struct drm_crtc *crtc;
>         int i, num_crtcs =3D 0;
>
> @@ -162,6 +163,18 @@ static bool can_do_async(struct drm_atomic_state *st=
ate,
>                 *async_crtc =3D crtc;
>         }
>
> +       /*
> +        * Force a blocking commit if the cursor is being disabled. This =
is to
> +        * ensure that the registers are cleared and hardware doesn't try=
 to
> +        * fetch from a stale address.
> +        */
> +       if (*async_crtc) {
> +               plane_state =3D drm_atomic_get_new_plane_state(state,
> +                                                            (*async_crtc=
)->cursor);
> +               if (plane_state && !plane_state->fb)
> +                       return false;

hmm, I suppose we want the same even if the fb changes?  Or
alternatively somewhere hold an extra ref to the backing obj until hw
has finished scanout?

BR,
-R

> +       }
> +
>         return true;
>  }
>
>
> ---
> base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
> change-id: 20250108-async-disable-fix-cc1b9a1d5b19
>
> Best regards,
> --
> Jessica Zhang <quic_jesszhan@quicinc.com>
>

