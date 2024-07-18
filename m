Return-Path: <linux-arm-msm+bounces-26586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C178D9350AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 18:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 336AFB22BEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 16:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3700144D2F;
	Thu, 18 Jul 2024 16:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8PfQs6j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB976144D22;
	Thu, 18 Jul 2024 16:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721319956; cv=none; b=iyOGuquPD4pg/5nF22eyW34dfjFm5+b6XqysTwb+d19IFz6NGVgfaIKXJ3p8zJuYTETJmSPzw9UFryTX95IbTcoGj+aZzotBnwNJS4gQMAVfsgUrH/wJsH9O5DBeVXpl45T/Nj2QQqsQa3G+GQkJG9zWdcIgYMYTrSSAWTa7eIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721319956; c=relaxed/simple;
	bh=+cPFQlWhiHlbsYRp3wmTrvUckoL0T/pu/UurO73Cwww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxDX4968Dhk3x0WWbcQjMt25t+0wyXE1cxx+o6U+NtJf9o94cOo2YAOQogZ8/HAbTzLLp0o1lciN0sbqE3jJOEKAHm3IoKJisR1286Zz/9bZ/MVfV0TGbuQ8EMnnzGaEFJDU1SfiyuN26kBXNsrzWI/i4gJa8cUVGWwjRr3p3Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8PfQs6j; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ee91d9cb71so11940441fa.0;
        Thu, 18 Jul 2024 09:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721319953; x=1721924753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJQIRnbTYy2sGZ5gk+HAHZWSmrPa0UShn83IpJ2tEh4=;
        b=I8PfQs6jojt5XLoZhtVQn7P8zfAhHv0TmX98lA4lh9l22rGUS2X6YvOqVMvcLiDkbg
         crjCevElxSF9GaSmVJJYcgG5OwBqs5GV7e+r5mfzjl7Ys2lMfplFqtBM5wF1NagpzcKH
         K+7uM5ureVqh36GaLm01NNCTH54z1ekFV5KapJGCcTsCj8x4cx0X0eoJJLBFfEkxbd9r
         LUC+kN8YEMIpMpgIxiMtP0Fjw8gA40I/p1mqmivi3WNcf6PLzSFCWrL0FFAaEQA5WDzk
         PxSfmmUsYO+HQboNbzjjCICz2Vbw3lxjI99XE5QholiSEZYHxMi6aVMYBbk1BUTTJUUM
         SwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721319953; x=1721924753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJQIRnbTYy2sGZ5gk+HAHZWSmrPa0UShn83IpJ2tEh4=;
        b=FLRRtCU392wZrUttRIOYj34Gv0yxWAJqHlWC7/igPy3vfP1iT3WvwenqMEFEvl0Q1I
         0l7+1aUsChpPrbF2Q3WzPoczqA4p4MdJhD+cioobTJ+fKlpqKeBJ9zV86ZK8KEKdqx0u
         lyl8OcsdWtqEH/8ub/B59NZZbP8SuRrcfviNAHCUWZpVe0PmrGnZlx03ibi76Mt+OuAd
         pqSPB9qhRRv/XVYCcda+MHaqg2HeeuY2d5AsrksYJ05XTtM4FmzXT7dMNvLnWXSl0qk0
         7ORT0uXKr7ZWIpHryCpLg/Vc9Sq+kSIdOSD/ijt+Wo2fVbIkkr59iyq+eDw7cSOjxVJ+
         n9kA==
X-Forwarded-Encrypted: i=1; AJvYcCVbl8B2bdNWRRMCTD1BxbhIijncfvWWPUjsNtDV2U2UoVcj/fLZVRZBo/TCCMhVjONuXSZyC75h5pNGZwSJVj1C8X1dSEolZZJoYCEr+ZV/HzwZIe2h7Vhs8vC7dElwLLQ7GBllvT2SDD+53w==
X-Gm-Message-State: AOJu0YyuIeswxE9ZJlEJqSSkCxHoVnmbez/2oOF9D9gsigvYKnWAXdX3
	ESJJ8G78vpX13Lb9UZkfXCBSzMN1acwkibZJDX0+sFhsqA9Fn6P8kceWg1QfzpVH/56U0yqt+48
	cXnp7mP3k/KmcICnqaP4LcdppgDQ=
X-Google-Smtp-Source: AGHT+IG+LN9SE1sQOAD4WTHQhFN5BbXkqVEFuPvsEPI+d/27gk+W67iADV6K6CnQBlGKixrjKAEdN1ZkXxCckNCAcNU=
X-Received: by 2002:a2e:a541:0:b0:2ee:7dfe:d99c with SMTP id
 38308e7fff4ca-2ef05d2ed3fmr24920861fa.31.1721319952621; Thu, 18 Jul 2024
 09:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717215847.5310-1-robdclark@gmail.com> <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
 <CAF6AEGuBZqV4zg1asUNbMLvq0-i-iyFwfi37uKS3kWNuRSOU+g@mail.gmail.com> <CAD=FV=UMiDTLBBEMk3fpg+TfE_K23fyL+JDZj77Fe9fCY8DyjA@mail.gmail.com>
In-Reply-To: <CAD=FV=UMiDTLBBEMk3fpg+TfE_K23fyL+JDZj77Fe9fCY8DyjA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 18 Jul 2024 09:25:39 -0700
Message-ID: <CAF6AEGs22brXntJ-eDv_uTZGc2=rH2q2V4y6Vt8K4s+dsO=4-A@mail.gmail.com>
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

On Thu, Jul 18, 2024 at 9:00=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Jul 17, 2024 at 6:09=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > On Wed, Jul 17, 2024 at 5:19=E2=80=AFPM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > >
> > > Hi,
> > >
> > > On Wed, Jul 17, 2024 at 2:58=E2=80=AFPM Rob Clark <robdclark@gmail.co=
m> wrote:
> > > >
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Just a guess on the panel timings, but they appear to work.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > > This adds the panel I have on my lenovo yoga slim 7x laptop.  I cou=
ldn't
> > > > find any datasheet so timings is just a guess.  But AFAICT everythi=
ng
> > > > works fine.
> > > >
> > > >  drivers/gpu/drm/panel/panel-edp.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > >
> > > Given that this is a Samsung ATNA<mumble>, is there any chance it's a=
n
> > > OLED panel? Should it be supported with the Samsung OLED panel driver
> > > like this:
> > >
> > > https://lore.kernel.org/r/20240715-x1e80100-crd-backlight-v2-0-31b7f2=
f658a3@linaro.org
> >
> > it is an OLED panel, and I did see that patchset and thought that
> > samsung panel driver would work.  But changing the compat string on
> > the yoga dts only gave me a black screen (and I didn't see any of the
> > other mentioned problems with bl control or dpms with panel-edp).  So
> > :shrug:?  It could be I overlooked something else, but it _seems_ like
> > panel-edp is fine for this panel. Plus, it would avoid awkwardness if
> > it turned out there were other non-samsung 2nd sources, but so far
> > with a sample size of two 100% of these laptops have the same panel
>
> Hmm, OK. One question for you: are you using the "enable" GPIO in
> panel-edp? IMO the code handling that GPIO in panel-edp is somewhat
> dodgy, but it predates my deeper involvement with panels. I've never
> seen an eDP panel that could use panel-edp where it was actually
> required--every instance where someone thought it was required was
> better modeled by using that GPIO as the backlight enable. On the
> other hand, the "enable" GPIO in the Samsung OLED panel driver came
> straight from the panel datasheet and it makes sense for it to be in
> the panel driver since the backlight is handled straight by the
> panel...

hmm, at least current dts doesn't have an enable gpio.  Which could be
why panel-samsung-atna33xc20 wasn't working.

It is entirely possible we are relying on something left on by the bootload=
er.

> In any case, I guess if things are working it doesn't really hurt to
> take it in panel-edp for now...
>

I wonder if using compatible=3D"edp-panel" everywhere isn't a great idea
if we want to switch drivers later.  But I guess that is already water
under the bridge (so to speak)

BR,
-R

> > But that was the reason for posting this as an RFC.  I was hoping
> > someone had some hint about where to find datasheets (my google'ing
> > was not successful), etc.
>
> I don't personally have any hints.
>
> -Doug
>

