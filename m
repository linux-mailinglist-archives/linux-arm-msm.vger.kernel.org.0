Return-Path: <linux-arm-msm+bounces-26591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8429350D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 18:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 313F5B226CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 16:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7410F1448DF;
	Thu, 18 Jul 2024 16:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyDyzd58"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A527C3B784;
	Thu, 18 Jul 2024 16:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721321117; cv=none; b=ekc9NT5Mph91xWTCAt3wJIT7vWPyIFGZh0eD1/YIHAlaSaZpQg5t4JeLTv7iwcpFymwABQYoSdYB7fuP6CuIM0FTRwRYmQJQLbvVcz9W1y7I1bX7/fU2QPtdhYYcrIBSckyJTPA8/4CpLl2AV9ydqhtl+ffFU/OhSd3CdRLwlGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721321117; c=relaxed/simple;
	bh=lVDX/+QnEfzC03lLByaa7hCwk3fz1v8QaMSfokwCBzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JoQPvgZNm9zNVfOsr+nUzv2Bw+lUu50HHecFD5Jq6x/iDFUurLsmkNbNEpi4sXmCcq7ozXFfqhzdyhzG5PKHRtCoDtyFKl6k2FUJ5T22yIApiy248qSfyKS4mbDXxmuqKvA+mP+Uro4Jl1vLl442mdB7QS5e1+9YZ/82aY6eIlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyDyzd58; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5a1c49632deso34626a12.2;
        Thu, 18 Jul 2024 09:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721321114; x=1721925914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVzXycChnKr63nEwcjziKm5NEqOOi3cFRrHO2p0Rnx0=;
        b=iyDyzd580D7GO6L0S4nd/an41dR3PF8z+NEo1VKsbbD2MxoVvhGydrHzAld3LvekKB
         1ZorcUJti3EbBnv6IFdeNV3luY/HD8e070iWgft1DaY7wivk3MZ8l70MhXuVey9UG3Oe
         E0VH5ro20NTWdcTcnH5PiEfpXnqnUlPVrRI/q8IeG5sQvjrXrJvIvimFmPAmcYXKZ5Tv
         0hYAKUFkiIDqDF+hwfssAwuSbqf+EQGi/UpBBYZZDSJAdhs3vDOLtIQ+2TofNr9QJ0Rd
         0OxRh9yTPzYcgq0DiLtnAZJLdkDBASy/mWMpfFKptliCwIdySgk74ysv/6OUwAnVlmWf
         a+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721321114; x=1721925914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVzXycChnKr63nEwcjziKm5NEqOOi3cFRrHO2p0Rnx0=;
        b=s38Uvcb//ESqG4EgIu2uS3l0vkOT4UgVYp1ztma3oFFE+pLsznklqinFw86nhwFqBd
         MV1UvFEqg1vAslxlgnI3HcmNuGTtxcnOHcx0ef9u8Ha32QIoytEwX37LSQ3GimNO8owC
         akNaxgIK5QCqRA/NWYiAxBkvw8lzaEVz8UJ0PKPEDJMB5EEGXKoGUiTuOllKQEC2735l
         3MGsO5jJYCSfdi5MXJm+XOiVkd+CEHmvbnALhgkCeta8Hi2YcDM2ALZWfy2W0WlQOq9c
         y/VGTWC7eD3lT20zULHMnBds+/ipPEKryaCCXXRzwgTNhFn5+yFFv3x0p6h5oK3Mq74e
         j/BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJpb9h8M4sfnQCXhHbH8UDxMXbFWkM5/OwRpL/v3lpwUVIXkykScgv47jr+iUK7F76XRATcSbjItHjVctNPMMMABhBpStg+1XSVKHPKtrhdFK35eRP/Iawm8pjlFih7uxtSJ3vKFVGMZoa8Q==
X-Gm-Message-State: AOJu0YwuQzPtDr26U2qLi0TVksTcCNlV6Znt3SwOeoRJVoBnyjE8b1HA
	MrvVNcU4HC0Ln6Nhn0DT+tKQzTdrc0oOGrlQZcGkTPg/8aKyUogtOEX2YNH0dMtF7MhtkzSLGrJ
	n7u40CwngsPB+PZ6iemjNP4QNH48=
X-Google-Smtp-Source: AGHT+IGuTcqmmeJDdC8he/jrXxZHods4xE5TAOJqnQw6+GlV83nW2Pca/3os5Hoj6/X5RM55Q56rhdNym2wbZFaOuhU=
X-Received: by 2002:a50:99d7:0:b0:584:a6f8:c0c5 with SMTP id
 4fb4d7f45d1cf-5a0589c99c0mr3821440a12.0.1721321113717; Thu, 18 Jul 2024
 09:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717215847.5310-1-robdclark@gmail.com> <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
 <CAF6AEGuBZqV4zg1asUNbMLvq0-i-iyFwfi37uKS3kWNuRSOU+g@mail.gmail.com>
 <CAD=FV=UMiDTLBBEMk3fpg+TfE_K23fyL+JDZj77Fe9fCY8DyjA@mail.gmail.com>
 <CAF6AEGs22brXntJ-eDv_uTZGc2=rH2q2V4y6Vt8K4s+dsO=4-A@mail.gmail.com> <CAD=FV=WJQBTjt61ma-CoJQeGYKigEyXpA6j25JSyEfikrLeSNQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WJQBTjt61ma-CoJQeGYKigEyXpA6j25JSyEfikrLeSNQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 18 Jul 2024 09:45:01 -0700
Message-ID: <CAF6AEGvxAVWDC45P3fbmVRO-yq5oV8wgPj0nqC7U0n6c9YuhbQ@mail.gmail.com>
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

On Thu, Jul 18, 2024 at 9:31=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Jul 18, 2024 at 9:25=E2=80=AFAM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > On Thu, Jul 18, 2024 at 9:00=E2=80=AFAM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > >
> > > Hi,
> > >
> > > On Wed, Jul 17, 2024 at 6:09=E2=80=AFPM Rob Clark <robdclark@gmail.co=
m> wrote:
> > > >
> > > > On Wed, Jul 17, 2024 at 5:19=E2=80=AFPM Doug Anderson <dianders@chr=
omium.org> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Wed, Jul 17, 2024 at 2:58=E2=80=AFPM Rob Clark <robdclark@gmai=
l.com> wrote:
> > > > > >
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > Just a guess on the panel timings, but they appear to work.
> > > > > >
> > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > ---
> > > > > > This adds the panel I have on my lenovo yoga slim 7x laptop.  I=
 couldn't
> > > > > > find any datasheet so timings is just a guess.  But AFAICT ever=
ything
> > > > > > works fine.
> > > > > >
> > > > > >  drivers/gpu/drm/panel/panel-edp.c | 2 ++
> > > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > Given that this is a Samsung ATNA<mumble>, is there any chance it=
's an
> > > > > OLED panel? Should it be supported with the Samsung OLED panel dr=
iver
> > > > > like this:
> > > > >
> > > > > https://lore.kernel.org/r/20240715-x1e80100-crd-backlight-v2-0-31=
b7f2f658a3@linaro.org
> > > >
> > > > it is an OLED panel, and I did see that patchset and thought that
> > > > samsung panel driver would work.  But changing the compat string on
> > > > the yoga dts only gave me a black screen (and I didn't see any of t=
he
> > > > other mentioned problems with bl control or dpms with panel-edp).  =
So
> > > > :shrug:?  It could be I overlooked something else, but it _seems_ l=
ike
> > > > panel-edp is fine for this panel. Plus, it would avoid awkwardness =
if
> > > > it turned out there were other non-samsung 2nd sources, but so far
> > > > with a sample size of two 100% of these laptops have the same panel
> > >
> > > Hmm, OK. One question for you: are you using the "enable" GPIO in
> > > panel-edp? IMO the code handling that GPIO in panel-edp is somewhat
> > > dodgy, but it predates my deeper involvement with panels. I've never
> > > seen an eDP panel that could use panel-edp where it was actually
> > > required--every instance where someone thought it was required was
> > > better modeled by using that GPIO as the backlight enable. On the
> > > other hand, the "enable" GPIO in the Samsung OLED panel driver came
> > > straight from the panel datasheet and it makes sense for it to be in
> > > the panel driver since the backlight is handled straight by the
> > > panel...
> >
> > hmm, at least current dts doesn't have an enable gpio.  Which could be
> > why panel-samsung-atna33xc20 wasn't working.
> >
> > It is entirely possible we are relying on something left on by the boot=
loader.
>
> That would be my best guess. Is there any way for you to find out if
> there's an enable GPIO?

presumably it would be in the ACPI dump (which I've not much of a clue
what I'm looking for there)

BR,
-R

>
> > > In any case, I guess if things are working it doesn't really hurt to
> > > take it in panel-edp for now...
> > >
> >
> > I wonder if using compatible=3D"edp-panel" everywhere isn't a great ide=
a
> > if we want to switch drivers later.  But I guess that is already water
> > under the bridge (so to speak)
>
> For panels that aren't OLED it's all very standard and we're kinda
> forced to use something generic since manufacturers want lots of 2nd
> (and 3rd and 4th and ...) sourcing. As far as I've been able to tell
> you can't do 2nd sourcing between OLED panels and other panels since
> the wires hooked up to the panels are a little different for the OLED
> panels and the power sequencing is a bit different. It would also be
> pretty obvious to an end user if some of their devices had an OLED
> panel and some didn't. I'm not aware of OLED panels other than the
> Samsung ones, but I haven't done any real research here...
>
> -Doug
>

