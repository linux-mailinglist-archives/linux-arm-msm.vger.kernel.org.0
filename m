Return-Path: <linux-arm-msm+bounces-26581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ADA935050
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 17:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50A07B2153C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 15:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399AC1448F6;
	Thu, 18 Jul 2024 15:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LBnt4bVA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDA1144D11
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 15:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721318291; cv=none; b=UcTIw3GmqoEmZGkmV/dl2hWiKlK0gz0VFf51v4gw8ie22qBVNw0XXEkYWSt9/JC9TTE6s7Cezq1iLdT+avkx3NYktTe3bBBw7BoRH6+B5L8nwazo49/plA5iPVssoux8zNJZrMqmCz5aQGcdWFr9n2XU6LM3aei9crFq5AnjQ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721318291; c=relaxed/simple;
	bh=9in/nxqI6rP0aldY+QBnsVwMEb3YdRvMqSwnuwcXguo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kBA1pw/1ndcv5iQ/1XHjjtqlKlsvfsCRbGEJb59jFGbFqmOinciwGe6/JvumEMYmW9kzCVGRaDaokTMs2zdrgL4Kal7+APEGWgVHGzChW19dBgirzEetzsvABHKalV+e5i8YnmJNdHQcvc+vY2xxB/iznHpJqZmH858k4T/2lt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LBnt4bVA; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-79f323f084eso30151985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 08:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721318287; x=1721923087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KI6+OUVJCzVw8+deYC/JOskjFnoamUOWD+xEmu+wUIw=;
        b=LBnt4bVAqBd7xyNVZhtnhsC15RqAm3gZF5uZOuvT2fOgCYDcjOZFb7RbOny3ecmbNb
         sOskZsI6SNN7tQ7ZAmjhPvG1EW86G/7Xeu8xRu0xTR2v+KX2fJmprJvLr06d+2Jk0/kG
         Ry3JTdC+e+9hMPPcSaJqJKrmsOpxoTzWkDOUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721318287; x=1721923087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KI6+OUVJCzVw8+deYC/JOskjFnoamUOWD+xEmu+wUIw=;
        b=M3RWynVRQoGRhARhYkqiDw2M0trRvTzJpVjnOoxUYA80uLLCyLE6i66GH49U+1Cy8i
         d6e1cnidnQZ6/4XoYrCwd0IocFZgHLHr4x8YVykrWiadLODn3Qn0u8jrbySl+NRMy/gb
         227b9RVa0a8jcTSbE2aJJCWoj288Ahcn4i0+Wr/7zlhb6yb2yoq4rbTm3YgY87Al3PMA
         Z5fAXEAGYWUY1HgrjQlz1ICwaQD/k+kJsCcixDHm0Atx/NECm+NIPeJ25fxgnbTUoLj1
         D3dh+m5y6fVXZC6kQwHG3yDmz7MyR6ChZ349jEXHQgfygpdx5NQoFBHTYlt6fs12N57X
         DxOw==
X-Forwarded-Encrypted: i=1; AJvYcCUKDDOsgFjO1wDEDNXgq3Tf8Arzad/7jrB/0ooWGDBAVuLS+ayQLeNY8Bap+Yt9b2dq7NDlWd8Y0nUJmhlsr5n9yq1gCLr+wGDAyeQPTg==
X-Gm-Message-State: AOJu0YwB5foNcHxePDl5LggbstAMBpd95jQeIhDD7M8n847RYsuikE9y
	8W5phOxAEYkeP+ueKL1Jno6q+S7JMnCQUkaP9IQL/4XbXIDzf884XmyiuIDrbB2CP8tSxcx2p/w
	=
X-Google-Smtp-Source: AGHT+IGLx0at1RJUsYH2HtQme1Cvb2syq5XvE1yNMXkP1l+UUqb+Evs242/G9rU4rTODUjVoPe2lbA==
X-Received: by 2002:a05:620a:28c9:b0:79d:61da:ba3e with SMTP id af79cd13be357-7a1938e9202mr136181285a.21.1721318286805;
        Thu, 18 Jul 2024 08:58:06 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1938b3f3asm38152785a.21.2024.07.18.08.58.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 08:58:06 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-44a8b140a1bso132041cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 08:58:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVfpshyovxdj8Itgf0vdGxygptax5Bb31bPV/LEnDq/e4SMg8wTUF4KLUgUfTT8bFI9DKX175eeHgabcMGntwW0X87NOffLlhDzAjA1oQ==
X-Received: by 2002:a05:622a:4116:b0:447:e01a:de95 with SMTP id
 d75a77b69052e-44f9681efaemr1462911cf.0.1721318285517; Thu, 18 Jul 2024
 08:58:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717215847.5310-1-robdclark@gmail.com> <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
 <CAF6AEGuBZqV4zg1asUNbMLvq0-i-iyFwfi37uKS3kWNuRSOU+g@mail.gmail.com>
In-Reply-To: <CAF6AEGuBZqV4zg1asUNbMLvq0-i-iyFwfi37uKS3kWNuRSOU+g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Jul 2024 08:57:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UMiDTLBBEMk3fpg+TfE_K23fyL+JDZj77Fe9fCY8DyjA@mail.gmail.com>
Message-ID: <CAD=FV=UMiDTLBBEMk3fpg+TfE_K23fyL+JDZj77Fe9fCY8DyjA@mail.gmail.com>
Subject: Re: [RFC] drm/panel/simple-edp: Add Samsung ATNA45DC02
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 17, 2024 at 6:09=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Wed, Jul 17, 2024 at 5:19=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Wed, Jul 17, 2024 at 2:58=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Just a guess on the panel timings, but they appear to work.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > > This adds the panel I have on my lenovo yoga slim 7x laptop.  I could=
n't
> > > find any datasheet so timings is just a guess.  But AFAICT everything
> > > works fine.
> > >
> > >  drivers/gpu/drm/panel/panel-edp.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> >
> > Given that this is a Samsung ATNA<mumble>, is there any chance it's an
> > OLED panel? Should it be supported with the Samsung OLED panel driver
> > like this:
> >
> > https://lore.kernel.org/r/20240715-x1e80100-crd-backlight-v2-0-31b7f2f6=
58a3@linaro.org
>
> it is an OLED panel, and I did see that patchset and thought that
> samsung panel driver would work.  But changing the compat string on
> the yoga dts only gave me a black screen (and I didn't see any of the
> other mentioned problems with bl control or dpms with panel-edp).  So
> :shrug:?  It could be I overlooked something else, but it _seems_ like
> panel-edp is fine for this panel. Plus, it would avoid awkwardness if
> it turned out there were other non-samsung 2nd sources, but so far
> with a sample size of two 100% of these laptops have the same panel

Hmm, OK. One question for you: are you using the "enable" GPIO in
panel-edp? IMO the code handling that GPIO in panel-edp is somewhat
dodgy, but it predates my deeper involvement with panels. I've never
seen an eDP panel that could use panel-edp where it was actually
required--every instance where someone thought it was required was
better modeled by using that GPIO as the backlight enable. On the
other hand, the "enable" GPIO in the Samsung OLED panel driver came
straight from the panel datasheet and it makes sense for it to be in
the panel driver since the backlight is handled straight by the
panel...

In any case, I guess if things are working it doesn't really hurt to
take it in panel-edp for now...


> But that was the reason for posting this as an RFC.  I was hoping
> someone had some hint about where to find datasheets (my google'ing
> was not successful), etc.

I don't personally have any hints.

-Doug

