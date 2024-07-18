Return-Path: <linux-arm-msm+bounces-26594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8BA93516E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 20:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D34F1C222FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 18:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385E4144D3E;
	Thu, 18 Jul 2024 18:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwqhH9rQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2DA4204B;
	Thu, 18 Jul 2024 18:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721325716; cv=none; b=hkItOlHWM8+9Nup81ITy/XLNkz4WoXh742jvBbX5MIz9CHgVCXsg0caeGFZ72EuvixdEO0wrLdZg7R5Rnonpcy/MICWglLy/T9YcngzzHfp80ZWTTwCF3BPTYoOdNDjMmpDBkLqR9WHJ0KXXvVYCCt0AphvE9OfW3hByWn/7Lf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721325716; c=relaxed/simple;
	bh=k2e9FTxMJcmFZ6iRpRLOB26XTkVkpXfMfb52s+UxKaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lzuMx2DB1E+wOZ2VMbzzd3AKfItLSY+yEYmX5z8yFqQ4e+EI6ftkjfvjo2BszkbLBDa7XcUfN/wbLyFb8jM7irmOID2CudzUX6GpQ4oXfC35ON4gugNWpIamFO2DjYnn76OOWgcmTFN2vq4fu09XiKKq6WR60gptD72NBgc0tg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwqhH9rQ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5a22f09d976so178684a12.1;
        Thu, 18 Jul 2024 11:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721325713; x=1721930513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwjCmIgC9amJezzYNa7Vvk7vm/b0+JIIKpP0FzU5Lwk=;
        b=NwqhH9rQbKVCXFazIyOjn7tzc1aeslhoIW/2OaIWNjkQjkzGl0vy+lCrfc+TcCere7
         IV91+Cc1fcD1aSbkDXrjvBU4y8tEJXFHXqSdKnhJvisVdpeAPo3XCPuadQem34lZsWnG
         jctFrcenPgOmnWVQVE8Cnvmj9RRouGWXrpeNCfbNmf6ZI2KqFJfKXRZVfmqWpV8wDfyl
         ihdthVPqtT+mY08nINneTA7mmjeiS7RRzxyYX72J1bYlE33RuoYBRMR32iBRjNIg7W/Q
         Da2wfz5CyUAxC1fVYG3Dh2MAj0Q4G61+RQHr+8tYkYKChulFn5tpDn+wcgu2UU6kj/Ab
         ypGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721325713; x=1721930513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwjCmIgC9amJezzYNa7Vvk7vm/b0+JIIKpP0FzU5Lwk=;
        b=XgSHjS5/2ZI8ZCtLvZMwf+YiB0AXzLMlwRVAW92I4elhl550C4hUs5N92068xZRtvL
         PA9YYqpkw6o6fsPft9AV137Gl9KyBCeQaH8vS4unqjOGwn7MNhBWZtt9rMaylb/R2yKI
         /1mkWShuwIxAdpYhlP3OO041OUVdXbmOCo/mocIurrh0cn/hpAYWNlagWzx/GefsPPEP
         wHvdG1yXRhBqGSO+KwhrareQ0Ia4bzgSgDQnxqZhdBQQaznmC2lAsCmpdG3m4gGTJUj4
         LP77zG5ySsRA4SOcZjCLJCeqcPahjS8uHFiGfk8JAFeO5gCjx2FRA0eidrbTTh+zrdNS
         3koQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjeQD/SvFHJVHVkgo7jG3EoXP/gdLiRKvJGsl3l11e7J2Q3wJKOkv380hlrHza9lWGDlaQeZwzZ8GkDcQ0/YaHtEzf9iXyqPPUS6xyG/s7S72h15GeH7mgJMd4B4kA2wSgDRfvccd7+y0bVA==
X-Gm-Message-State: AOJu0YyuQh6kQwudDLUoF1fyohi+FF4uXzDIEFshJBOTnmYqKbqtisub
	Yrt82q4VUB6JNsVdujHiO4KpwTpwaQhccwiostN3wLRRUGZ8uT28lXX3Qd5iq8ym2GP+5V6iScQ
	WwnTIIt792JPQjx50Nl2O/aCP360=
X-Google-Smtp-Source: AGHT+IHnyhuY0wD7m5Nhg4/s+kP6IlMtQQiwPdS+LG//Il46Tc6q1VnUyZx7kaXZOUYWOB0F5U4b854qcA8dUvrJxkA=
X-Received: by 2002:a50:c05b:0:b0:57d:455:d395 with SMTP id
 4fb4d7f45d1cf-5a2caf4e97fmr70266a12.7.1721325712440; Thu, 18 Jul 2024
 11:01:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717215847.5310-1-robdclark@gmail.com> <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
 <CAF6AEGuBZqV4zg1asUNbMLvq0-i-iyFwfi37uKS3kWNuRSOU+g@mail.gmail.com>
 <CAD=FV=UMiDTLBBEMk3fpg+TfE_K23fyL+JDZj77Fe9fCY8DyjA@mail.gmail.com>
 <CAF6AEGs22brXntJ-eDv_uTZGc2=rH2q2V4y6Vt8K4s+dsO=4-A@mail.gmail.com>
 <CAD=FV=WJQBTjt61ma-CoJQeGYKigEyXpA6j25JSyEfikrLeSNQ@mail.gmail.com> <CAF6AEGvxAVWDC45P3fbmVRO-yq5oV8wgPj0nqC7U0n6c9YuhbQ@mail.gmail.com>
In-Reply-To: <CAF6AEGvxAVWDC45P3fbmVRO-yq5oV8wgPj0nqC7U0n6c9YuhbQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 18 Jul 2024 11:01:40 -0700
Message-ID: <CAF6AEGuKbzXxzUJS58pBomExNOOoPR7T64rBKuCrLYLW0e7MCA@mail.gmail.com>
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

On Thu, Jul 18, 2024 at 9:45=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Thu, Jul 18, 2024 at 9:31=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Thu, Jul 18, 2024 at 9:25=E2=80=AFAM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > On Thu, Jul 18, 2024 at 9:00=E2=80=AFAM Doug Anderson <dianders@chrom=
ium.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Wed, Jul 17, 2024 at 6:09=E2=80=AFPM Rob Clark <robdclark@gmail.=
com> wrote:
> > > > >
> > > > > On Wed, Jul 17, 2024 at 5:19=E2=80=AFPM Doug Anderson <dianders@c=
hromium.org> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > On Wed, Jul 17, 2024 at 2:58=E2=80=AFPM Rob Clark <robdclark@gm=
ail.com> wrote:
> > > > > > >
> > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > >
> > > > > > > Just a guess on the panel timings, but they appear to work.
> > > > > > >
> > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > > ---
> > > > > > > This adds the panel I have on my lenovo yoga slim 7x laptop. =
 I couldn't
> > > > > > > find any datasheet so timings is just a guess.  But AFAICT ev=
erything
> > > > > > > works fine.
> > > > > > >
> > > > > > >  drivers/gpu/drm/panel/panel-edp.c | 2 ++
> > > > > > >  1 file changed, 2 insertions(+)
> > > > > >
> > > > > > Given that this is a Samsung ATNA<mumble>, is there any chance =
it's an
> > > > > > OLED panel? Should it be supported with the Samsung OLED panel =
driver
> > > > > > like this:
> > > > > >
> > > > > > https://lore.kernel.org/r/20240715-x1e80100-crd-backlight-v2-0-=
31b7f2f658a3@linaro.org
> > > > >
> > > > > it is an OLED panel, and I did see that patchset and thought that
> > > > > samsung panel driver would work.  But changing the compat string =
on
> > > > > the yoga dts only gave me a black screen (and I didn't see any of=
 the
> > > > > other mentioned problems with bl control or dpms with panel-edp).=
  So
> > > > > :shrug:?  It could be I overlooked something else, but it _seems_=
 like
> > > > > panel-edp is fine for this panel. Plus, it would avoid awkwardnes=
s if
> > > > > it turned out there were other non-samsung 2nd sources, but so fa=
r
> > > > > with a sample size of two 100% of these laptops have the same pan=
el
> > > >
> > > > Hmm, OK. One question for you: are you using the "enable" GPIO in
> > > > panel-edp? IMO the code handling that GPIO in panel-edp is somewhat
> > > > dodgy, but it predates my deeper involvement with panels. I've neve=
r
> > > > seen an eDP panel that could use panel-edp where it was actually
> > > > required--every instance where someone thought it was required was
> > > > better modeled by using that GPIO as the backlight enable. On the
> > > > other hand, the "enable" GPIO in the Samsung OLED panel driver came
> > > > straight from the panel datasheet and it makes sense for it to be i=
n
> > > > the panel driver since the backlight is handled straight by the
> > > > panel...
> > >
> > > hmm, at least current dts doesn't have an enable gpio.  Which could b=
e
> > > why panel-samsung-atna33xc20 wasn't working.
> > >
> > > It is entirely possible we are relying on something left on by the bo=
otloader.
> >
> > That would be my best guess. Is there any way for you to find out if
> > there's an enable GPIO?
>
> presumably it would be in the ACPI dump (which I've not much of a clue
> what I'm looking for there)
>

Ok, turns out it is wired up the same way as on the crd.. if I copy
those then panel-samsung-atna33xc20 is working

BR,
-R

> >
> > > > In any case, I guess if things are working it doesn't really hurt t=
o
> > > > take it in panel-edp for now...
> > > >
> > >
> > > I wonder if using compatible=3D"edp-panel" everywhere isn't a great i=
dea
> > > if we want to switch drivers later.  But I guess that is already wate=
r
> > > under the bridge (so to speak)
> >
> > For panels that aren't OLED it's all very standard and we're kinda
> > forced to use something generic since manufacturers want lots of 2nd
> > (and 3rd and 4th and ...) sourcing. As far as I've been able to tell
> > you can't do 2nd sourcing between OLED panels and other panels since
> > the wires hooked up to the panels are a little different for the OLED
> > panels and the power sequencing is a bit different. It would also be
> > pretty obvious to an end user if some of their devices had an OLED
> > panel and some didn't. I'm not aware of OLED panels other than the
> > Samsung ones, but I haven't done any real research here...
> >
> > -Doug
> >

