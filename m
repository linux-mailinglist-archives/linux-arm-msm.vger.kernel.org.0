Return-Path: <linux-arm-msm+bounces-38866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAA29D6189
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 16:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 499E216040A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 15:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59E582485;
	Fri, 22 Nov 2024 15:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nuos2NN1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4221B134A8;
	Fri, 22 Nov 2024 15:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732290714; cv=none; b=u3XhW+7DGxtLzVpPeH++HvUNq4yJVUV+T+dAzgNuzG4th1nuH4uhPHHykx3hMQtLFD1V5EAO5VI3G60Ft2T/GdRxyRVpShu60zK+Wpg5tIvrE7Ptcwdamws+eIzJxdjWIgk23Hw9jokYC46fYnkinkqquksDFQTfqPcX73oJyls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732290714; c=relaxed/simple;
	bh=8ZTRU8Cvc/aD30bdCV76uipoTv6sEgXfqla/dPLB2rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RPVLEDTzPSvOjTT3dHwkGMpMRfZ1RVBCI6wSb0RhERmm641vL1clN4huGyKMGUbMBbX+/4rDAPQC2UiiESfK6hEF1SSoNdzowH8MEC+Vy76c49PfGCOMxfkjet6jPbJTD6gkOCMYzMDLTnauXErPf7hXHopxjDN3UN8oAPbHZog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nuos2NN1; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-83abf71f244so67645939f.1;
        Fri, 22 Nov 2024 07:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732290712; x=1732895512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3uDWbNNWfkF0p1VhsZQPfqHnOGEpm0encXAZ7Sy8g0=;
        b=Nuos2NN1HCKjLhMifSxZ88xWqCO8C3m5gSVc3N21+XM82zNofjA4P4udDKzqDeEBte
         5ehLCdANSiRJ/t3+2kQVhHovbMnNqThDlIBYyGgkGHCm4sIVg+2mUrlekplTKRJTpSvU
         k5nJqoBbIPq9eNcWlLomUdjxBCS3u08DX2RiingMBi8pkohzrfbhLYEavChsT/ezovks
         +ju+CaSzF8NSCjvncJm+OaHOJns0f4bGM0Bnd0Ffxg8CWiDZW+qoizd05fddOc78/EfK
         3sLQpJVkaWHiMyHBPlTrJKTx3npAe7O/a/Rc57UWMZiXmOjkbnL9AZwXVzfINXvooCTX
         qPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732290712; x=1732895512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3uDWbNNWfkF0p1VhsZQPfqHnOGEpm0encXAZ7Sy8g0=;
        b=CtX5qN2w5gHLhzRwMNYiWibLr7XGYtQqSatAgdy/y62Z6FkdNddXW+mr8A74UsvXaH
         F6cjeBcFrHs9fnn6BwcoG5xsa7RjiujwPageTwT3lrB73v0LhY3gcZvcXD7vr1eT/Vxa
         Wt5738+1VZ1R5adGJuJluu0UcOeoXgun2fE20iClWeYFPMVoSlCMdS9URKKeqJG55xb9
         KwH4ptzZaCJlBzzhlU/hZdlyUTfA7XV/DS/GYdHE0A876ttdPj5lMxKl5RB2CxSKw2LV
         QTFpDGSjf1rZW92LoTsvwvaNKAYvy2at8WJYICrSxo/oxBkVdLHc2qVNww7mMTDVaTat
         OHSg==
X-Forwarded-Encrypted: i=1; AJvYcCU76yEnvMukPD3BQoK0NW3gUsfSqNJ34y+5Q32AkVMcjuu4dPIrVb5mdJxyxPdaI9j3QQ/sb8IUk3ngg9vJ@vger.kernel.org, AJvYcCXJl2+R5YQePvUfoLTCWIJbVhpkTTSRV6JyoOZnkFttfAxWVn5d3ZDQ6kz1rcUSP+q53ng9rihB9JipciDX@vger.kernel.org
X-Gm-Message-State: AOJu0YzzTtJQR4XHAFIP9uOux2g9BYbrHOMvjqAqby0XmcLgx+FdAnqW
	8da/SrlaIGq+/iWkHUcaJIpcQ/sazW4fKy+eUahumE0+12+QD6MtcyH7iu56njVsBvW14iwaE/2
	hqkQeu1InW1szgZ5/Bh9P44RFcVxn4SD8
X-Gm-Gg: ASbGncu79YslBOGKCJEzYbpz1diHV1M575IM11hhA40F0GRCpTLc6rIbg6iaUC7kR3N
	DUfEoVYT7ccDBL4MiAawKct2FmwbYOSz7wp4zSVbjqyg2rlnPn9qo+8jIgvvz6g==
X-Google-Smtp-Source: AGHT+IEmliz4spJROdLvbi9Jn1TCz/7JIiW2hFkXxCknMwyZDt+D+vscIFSEGuewCzsuk6Df/rQ+Qukh9F3P0iKGWrs=
X-Received: by 2002:a05:6602:2cd2:b0:83b:7164:ebb4 with SMTP id
 ca18e2360f4ac-83ecdd13818mr362392539f.14.1732290712314; Fri, 22 Nov 2024
 07:51:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121164858.457921-1-robdclark@gmail.com> <54601d79-4156-41f4-b1b7-250c5c970641@oss.qualcomm.com>
In-Reply-To: <54601d79-4156-41f4-b1b7-250c5c970641@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 22 Nov 2024 07:51:40 -0800
Message-ID: <CAF6AEGtafQM7-mYy163Krry3OHgPNH3e9A=9VEhBpiQTADtULQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: UAPI error reporting
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 4:21=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 21.11.2024 5:48 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Debugging incorrect UAPI usage tends to be a bit painful, so add a
> > helper macro to make it easier to add debug logging which can be enable=
d
> > at runtime via drm.debug.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
>
> [...]
>
> > +/* Helper for returning a UABI error with optional logging which can m=
ake
> > + * it easier for userspace to understand what it is doing wrong.
> > + */
> > +#define UERR(err, drm, fmt, ...) \
> > +     ({ DRM_DEV_DEBUG_DRIVER((drm)->dev, fmt, ##__VA_ARGS__); -(err); =
})
> > +
> >  #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
> >  #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>
> I'm generally not a fan of adding driver-specific debug prints..
>
> Maybe that's something that could be pushed to the drm-common layer
> or even deeper down the stack?

Even if we had something like DRM_DBG_UABI_ERROR() I'd probably still
just #define UERR() to be a wrapper for it, since line length/wrapping
tends to be a bit of a challenge.  And I have a fairly substantial
patch stack on top of this adding sparse/vm_bind support.  (Debugging
that was actually the motivation for this patch.)

I noticed that xe has something similar, but slightly different shape,
in the form of XE_IOCTL_DBG().. but that kinda just moves the line
length problem into the if() conditional.  (And doesn't provide the
benefit of being able to display the incorrect param.)

BR,
-R

