Return-Path: <linux-arm-msm+bounces-26514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 192979345A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 03:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46F211C2118A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 01:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CA610F2;
	Thu, 18 Jul 2024 01:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHNtXVNM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904E7620;
	Thu, 18 Jul 2024 01:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721264988; cv=none; b=aPIn+F373rFRo1KUh/3sYabIHEkLw58bh/bT3kPMPQmIS1V9TC+fwWsgy7oSNd91mmdym9YR+EGuuvlAIJwaqTOr9vWdquzm5c8Qxh/0A/BjU2WYYUcIsKtMd9XdcLmVRoyRlFgy5f53G4KXWNed/GV6Uda2yTRBDIa1WeXqTfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721264988; c=relaxed/simple;
	bh=MSIYf7rIVMhbod8tcCJbQKU94YpPrpB4YDyZcQYA3RE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t9sbotJGuU7Yy1Uo82WJiO4ssnuLn3z++50u8M16T7chYiZWDO4vKEppTWhP1vX+qsT5Z7edwBGaWVjWYEEdfT4ukwaAHGYpGrzGFyHUbIjR/j4pN5UX3LNiPkT5vSxI5jcMqIAz2ogKqqL3UXiqj+7pmW5idKXS+mVGlsPRHDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHNtXVNM; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5a1c496335aso64305a12.1;
        Wed, 17 Jul 2024 18:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721264982; x=1721869782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a24lA42kj1IKUpXd+h7uBNc53/x1IhEKAp0DRNXWxaA=;
        b=WHNtXVNMQjtPc5u1ZIb2FKr6bMis2FoIN6A2Uhf0ENGCcL+vu7/WMTXSPi1rp32o/Q
         q7NBG2aewVfMSmZXXATEcPdmN1Ix2V0ASx3f9G+ceySx90XS+0pLpAnGDyIzWuElSUie
         BaFOeOn48tmIOdoWTFnHigllwgck0Z/R77mo2SFpcy/B4PO/esKD/KlB0bTTjE4k9Mkw
         qA8jaj9Qh+i1W7u0J0UJ3Kcrf2r0yP3SLLoagEMeWM7GlyXkigAogBeoz+Zm54kudKLV
         bKY312s3eqEug6eSu8qJKK5zNlIZL2Qn8lfABdEmOBzdvrWx65RpelAThH0ILcJU6khx
         TPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721264982; x=1721869782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a24lA42kj1IKUpXd+h7uBNc53/x1IhEKAp0DRNXWxaA=;
        b=mSn24CHw24t9mHt61PapjbjQwHmBzOGSIFzoCPMqNDm92zN2bTuYyrHunxvPT+WEiI
         cgZyUh3kpmu1I/ZnDPU6t4ZAkMFFVy8BWxeixPGBWSrhg7U4u2kkjJi1IOzvXEcDiBNP
         CInvN4fY1rlX2gG1bsipiNaccnA//2Qo6+HB8lphja4OMkVB+uSjvj9Cy7N8vzZBjbrj
         5NRgmzDRYTA8zPr3W/cY3Dd+obPWFz336nT5jnDxbPdf7CesMMBWwNtEzjTODsh3pb44
         ndpaQjwSa857t8cZbTElnqTNbVZPaLytsNWEE1jR4B24wsM9snzE+zZD47vhlGxlsXgV
         Tp0w==
X-Forwarded-Encrypted: i=1; AJvYcCXsKpYPCm/OwOvSutgLHGeUj6JzQdLNHed9c096JxMLrJUB+QL85QV8HBurXJMaR0Mc7SVRW2lGYqDFARIlomO3WCO/JzeyQitLhelqUxSenzuSOzyd4toVZjKfwlCPE7740OWekw4A1goaFw==
X-Gm-Message-State: AOJu0YzlR+bYEXLOw6A2LnwL4kH6Z6WnTeOeFitNNT/2x8omTQUF6unS
	Smp+RXTXnLnBUyV01WV7cml1a+7BBZrLK25qeCgRcEWsnk6hk/I1BvLNJusmzvuXB5BgC9x93ft
	ylmb4cnRrUC/hPFfRS+PbB1+Pw+U=
X-Google-Smtp-Source: AGHT+IEkQ1X1zBYds0LOtzFbshmU1UkroOPkGrUOvyXXeF3zQwEuX9vynegPp0P6goCLWVTcWk2q9FcIS4AwlVNjHmY=
X-Received: by 2002:a05:6402:40c9:b0:57c:5f77:1136 with SMTP id
 4fb4d7f45d1cf-5a05bcc9a88mr3575667a12.24.1721264981722; Wed, 17 Jul 2024
 18:09:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717215847.5310-1-robdclark@gmail.com> <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 17 Jul 2024 18:09:29 -0700
Message-ID: <CAF6AEGuBZqV4zg1asUNbMLvq0-i-iyFwfi37uKS3kWNuRSOU+g@mail.gmail.com>
Subject: Re: [RFC] drm/panel/simple-edp: Add Samsung ATNA45DC02
To: Doug Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 5:19=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Jul 17, 2024 at 2:58=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Just a guess on the panel timings, but they appear to work.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> > This adds the panel I have on my lenovo yoga slim 7x laptop.  I couldn'=
t
> > find any datasheet so timings is just a guess.  But AFAICT everything
> > works fine.
> >
> >  drivers/gpu/drm/panel/panel-edp.c | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Given that this is a Samsung ATNA<mumble>, is there any chance it's an
> OLED panel? Should it be supported with the Samsung OLED panel driver
> like this:
>
> https://lore.kernel.org/r/20240715-x1e80100-crd-backlight-v2-0-31b7f2f658=
a3@linaro.org

it is an OLED panel, and I did see that patchset and thought that
samsung panel driver would work.  But changing the compat string on
the yoga dts only gave me a black screen (and I didn't see any of the
other mentioned problems with bl control or dpms with panel-edp).  So
:shrug:?  It could be I overlooked something else, but it _seems_ like
panel-edp is fine for this panel. Plus, it would avoid awkwardness if
it turned out there were other non-samsung 2nd sources, but so far
with a sample size of two 100% of these laptops have the same panel
;-)

But that was the reason for posting this as an RFC.  I was hoping
someone had some hint about where to find datasheets (my google'ing
was not successful), etc.

BR,
-R

