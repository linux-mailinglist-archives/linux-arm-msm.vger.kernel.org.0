Return-Path: <linux-arm-msm+bounces-48618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47758A3D457
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 10:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26E483A3392
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 09:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441361EDA0B;
	Thu, 20 Feb 2025 09:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rPJbbMWg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649C61EC01B
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 09:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740042875; cv=none; b=eksIkJsvqYAWeWIJng4teuDtFB/o5XX6ZWOwCm588/d+llNgA0WHidyDoSxUizDuxss+owjPz+Hb+YU54f+ZSkaf7E26NJFWQqLAmByZ1SQuyRx51U+oEUdnsJqp828s5e3zbkZYx6usidsJ6EqrLC3EJ+GuVDeMisIlhCIOzZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740042875; c=relaxed/simple;
	bh=om7yOLIM4Ad44rWX04vkNnR2zDaq3Mg4yJhaSd/Zw78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFD6PoI+5oPE7qButcIuvwZTjLiCArahRmHBbRYHU7Gz30/a4ca6GDDrqkUqWLRC6jIzamBgLVYHVjTc9tmk64B87i7XwaM4xH0KwK5lVMci0SQ2S0CBP7Ys5ZSvLLkM4XOI467fVvLfcKdnVQDQWRpZcwOPIxJH/wDLBlhBKU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rPJbbMWg; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30797730cbdso6632451fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 01:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740042871; x=1740647671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAr22/D1YzPwh7QCkaq5V8bcpDKGDV5/adht3f1OxvU=;
        b=rPJbbMWgp6xlSGg4MwxwGM7WfWEWw1WzxxhSMPxQDQHSmf9yzJ5GTZ01RuzfBWhNb6
         /9omKBlASAwDQBL6jrFXS93MhpRvc9SNjLPRa+0EIeUtfsP/KJ2T38BPTTi8haUhxOU1
         HpWJTkocYUZefcQ3utJsst3rv+MgTJ03NJGURM4mN2XWGcdfvMF3863KQb4nhGiy/7G2
         5NEve38fYDJG9xOJ2ZJJNOBP+nT1E6BMJPmVt5xae9dScGWPKc4JYy6C+UW8jQcdyKQB
         tDbOqYvLTYYZ+VnTuBOj0NENdf3pjiYK90oZhTq0oq14+dCil0d5kOeFkW0lw3iFSh68
         Hq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740042871; x=1740647671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAr22/D1YzPwh7QCkaq5V8bcpDKGDV5/adht3f1OxvU=;
        b=JsfzKgOIHLipIWh7OJ0Z5+zxIyATS6dNbkVxmCnGUBlcvKC1eHkaOkov2uD/COkC3b
         GeApvl+d85FABRw5rnn8Elzb8zIBJpi1CEhdEBttv0A6pEApymtbz/qjq566iwl37m8z
         5ytRnJbWl8d2/xVCoqmQ2nEyCHI+cGos34bauXhzXT8FyGKxkhq2hurvKOe8WYtIWGsd
         5M1cj41Pf9D7I2uvvg6KFnhvLPf7aWWqOykgqUpq8QdkPgUDG5ENsxPukYLa2l8/c6LN
         tZbRw2lVAr/UARu5h8a4FMlwoSOAOz++44piA6bdZtGjysDZd0trqGRRQVUGl/D2+Rtr
         lMtA==
X-Forwarded-Encrypted: i=1; AJvYcCWZaKgSe2qtPPnubKA1JdJqjxZmc3ZESpKgqyTU7uHsQolUAWdkT3GCwO61Qh+z/MInAysE0YtOdJK+Zraj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3YTmm/82qgZ4zzLOLn0NFLFS5RL67gb4BGAkohX/B/aWbZuZ6
	aIPcVDkbMcvcyS9O5C6f3Z8ENaNZKSnReG+iGKc+xjjKy4onhGPJgyg9BvnTauPbfMglxDVcMzF
	K2VLi/DirMeBVP/cvS/5otaBbphfXp8Uc4H1PmA==
X-Gm-Gg: ASbGncvJGt0nntET0cX33kYyvGUsLYwwghDnnGezZAodZH9AdIaqajYFDru4Fosa+vK
	R4f6jpkphaBazEA3wcOWFn+3rlZ5j5eItCpRw59fOsz3f4HLvsPpxeLdSmzZ992Z3vmGPucgmWi
	LWHldoOmFPCmq5ydE0Gl3qJPeW1YU=
X-Google-Smtp-Source: AGHT+IHSPk6Oq0kN0bLQwT6LYgMpvGNXVM8z3YJ10Sgvpi/62DQHM13T2sWJ5hnnJGbM2z7QUetZC0ghr5VjffIw3AQ=
X-Received: by 2002:a05:6512:3d15:b0:545:a2f:22bd with SMTP id
 2adb3069b0e04-5462ef23810mr3094783e87.48.1740042871206; Thu, 20 Feb 2025
 01:14:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>
 <20241203-crypto-qce-refactor-v1-9-c5901d2dd45c@linaro.org>
 <d6220576-eaf5-4415-b25f-b5984255ab78@linaro.org> <CAMRc=MevaM4tUNQUs_LjFYaUtDH=YqE-t2gBponGqtK5xE9Gpw@mail.gmail.com>
 <20250118080604.GA721573@sol.localdomain> <CAMRc=MeFMYzMY4pU9D6fEpg9bQuuzqg4rQhBU8=z_2eMU+Py-g@mail.gmail.com>
 <20250118175502.GA66612@sol.localdomain> <CAMRc=MdR-8AnwAsMzHn8zj2awZUumO32C_S1-CkjBEqbuKPdeg@mail.gmail.com>
In-Reply-To: <CAMRc=MdR-8AnwAsMzHn8zj2awZUumO32C_S1-CkjBEqbuKPdeg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 10:14:20 +0100
X-Gm-Features: AWEUYZnkjAHblurQfFOh0krxMz1j95KqvuePKe-B0dN-covm1P8mMeq0vp8hQYU
Message-ID: <CAMRc=MetohPUcxRLO0qS-LYyzZhiAMAHzLm0xqX8_TXdTgBnVA@mail.gmail.com>
Subject: Re: [PATCH 9/9] crypto: qce - switch to using a mutex
To: Eric Biggers <ebiggers@kernel.org>
Cc: neil.armstrong@linaro.org, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Stanimir Varbanov <svarbanov@mm-sol.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 2:46=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Sat, Jan 18, 2025 at 6:55=E2=80=AFPM Eric Biggers <ebiggers@kernel.org=
> wrote:
> >
> > On Sat, Jan 18, 2025 at 10:28:26AM +0100, Bartosz Golaszewski wrote:
> > > I was testing with kcapi-speed and cryptsetup benchmark. I've never
> > > seen any errors.
> > >
> > > Is this after my changes only or did it exist before? You're testing
> > > with the tcrypt module? How are you inserting it exactly? What params=
?
> >
> > Those are all benchmarks, not tests.  The tests run at registration tim=
e if you
> > just enable the kconfig options for them:
> >
> >     # CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
> >     CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=3Dy
> >
> > The test failures and KASAN error occur on mainline too, so yes they oc=
cur
> > before your patchset too.
> >
> > > >
> > > > I personally still struggle to understand how this driver could pla=
usibly be
> > > > useful when the software crypto has no issues, is much faster, and =
is much
> > > > better tested.  What is motivating having this driver in the kernel=
?
> > >
> > > We want to use it in conjunction with the upcoming scminvoke (for
> > > loading TAs and invoking objects - used to program the keys into the
> > > QCE) to support the DRM use-case for decrypting streaming data inside
> > > secure buffers upstream.
> >
> > Notably lacking is any claim that any of the current features of the dr=
iver are
> > actually useful.
> >
>
> Noted. I'm still quite early into working on the upstream-bound code
> supporting the streaming use-case but I will consider a proposal to
> remove existing features that are better provided by ARM CE.
>
> Thanks,
> Bartosz

Just an FYI, I was informed by Qualcomm that upcoming platforms will
contain an upgrade to this IP and it will be up to 3x faster than ARM
CE. In this case we'll keep this driver around and I will focus on
fixing existing issues.

Bart

