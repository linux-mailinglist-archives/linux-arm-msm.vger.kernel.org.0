Return-Path: <linux-arm-msm+bounces-79511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEA6C1BDA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 260B21886E2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338AF32E139;
	Wed, 29 Oct 2025 15:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ThiVxIBM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B1B33F8BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 15:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761753438; cv=none; b=mCS0kHjoo3mqzwlYABCz+1ADAmDjKb/M8djvQYZiOsP8rMUjCZtZCd4jihyLcHB3ZC8JpR21nQeDqjEZu9Teo6RMKqOvZR6tLfNg2iKUoLBgtrLQE6XtzHxOz9deIUbBcRFTfsLMs9KjvLRWXtAFxRbizW+G/wKeQcW0fC1nIXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761753438; c=relaxed/simple;
	bh=YwDgrJ1PHv1+Z/jYYOmoTTQu/BLRyS0iXW4M5TIKQkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oDf6Gzwn3EG6NLcd3BZV4N0M5vR3RqEwxCeFMhJtshTmHoNMntRafeLVVdqtKogq+0bl+XIwPb/ZSn/ZLF1WtmUmZYr6OkA7QEjwues6IwS9OkHF0Ce4AD35G5+IjgTfpAduUmBdBrbwfJPJPBwPrUq+qOhZDYrOF5/PvEK2IAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ThiVxIBM; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37775ed97daso12042571fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761753434; x=1762358234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwDgrJ1PHv1+Z/jYYOmoTTQu/BLRyS0iXW4M5TIKQkY=;
        b=ThiVxIBMYZM2FlNXtqxzVDlQv78F7l7LtYRw3PpWGAR1WKUWrw93sdUni+f9QNgKsm
         dOJ6ONzdE8VSWuqFtIzf3AWEdnweJFJjx4DoaqOTQn4Toa4YKMJNjDhZd/TLjOYY+lik
         yihMHqXipU6m9WWeDBq2rYLbrLFofCvHq5mDdLUYgZoNnOzbqR3uZ3dhpsMyB28s8FMb
         TPZZVPj7q+fL6Wt5mD9SQB8gA0TJ0Ia2217hD0r1x7sgZ9q70NYHyF5YgOSaslpzhfvo
         /t5hMqEW4pYdI7CdueNd7WDJyjulsrXSZCDQK9zBepsLxAbkg8sE0aW0m+1vOtTdX8id
         0QoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753434; x=1762358234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwDgrJ1PHv1+Z/jYYOmoTTQu/BLRyS0iXW4M5TIKQkY=;
        b=g+GRAn3OuN6Q2CggdimXsdREuaMZ5sdR7741z55MOMbafRMi6Jm3BWtz2bPUxb2cBo
         tDvP4Z0OL3vu/YAD78E/5g6+BOB7FzCjVc5vccxJpWWzKHTthu+ikfvHCHsQ7uTMvFSA
         Sz5M+7JKmJ0sFtXs5ip3NE0r9eLN3cfjmw6bRBvH9XxwX71s3YovWhH4ff3ru6ypNDa7
         TdIQWTMI0sfu+skQOI2mmwoAs/jImtBs9d0QgO8bHLE7MYFBcu18A8muJ+D7KOKjLLI8
         T2cLKDXqc/w3OIRxgbViFGOZXSq9ZkoaCB5P21fc1BOLqVXL2GxyYIYDcoBd157XdD8f
         OxbA==
X-Forwarded-Encrypted: i=1; AJvYcCXLUTGu1OEegLAwXGa4CY2OQ6QLMUp92qkVb0tGz8PYbgK2FIVHkK4dKw9L3BY1KuB64sAsom16ybeDFSZX@vger.kernel.org
X-Gm-Message-State: AOJu0YwScBXr6reC2E0xSNKmYr9iXulzrNRnJH/Ywy3jfaRvTx7flnIk
	0W3e+4FcCIm8bPAlgDNb/NblUAuk5YcT9E4UfQ9fi0mSI6rbUSX3y1YO4c+M6qorcq/yDCxG+g3
	LYJx8PO+gAvjWo1iNP+YpPPLyqBH1ZgEceWTx5rF78A==
X-Gm-Gg: ASbGncuurUQQ2cnvweqHUiGL3j+N0haHRDaawV4xNtjrGrqAHuIEZ1cpVNIEDq8J7s9
	3U6lFjHR0oDHpDKm5Fk8vGbQP0ypfMwa/q01T6ikxE6dNwRUTv5T1N4L99JbJjOg85tgaE6/MX8
	9WsBwfFdposI6kUIKtFAFXDVjn5I2A9J+uScrYmKInf2YRVFLqNgU++BVSrTFH676+Jze5dz5Ir
	qLIuIrAzNtyFnXHkWpjTcAhdCD/wewTB6scAxZNkANuOy6MAt2c3fDzmpYC8VjcHE6sv73EOGd9
	UK/YxcmZfRsMVFTdJIM0fVw61eY=
X-Google-Smtp-Source: AGHT+IFY1i/xx25cv6Ui/VCi3uSKIAy54H7ItoaBFtAYqTtPocNBBoyPi6yJvvk6xxRW45U/aC0bt+x56RpHt48kapg=
X-Received: by 2002:a05:6512:3a8f:b0:592:f912:c890 with SMTP id
 2adb3069b0e04-59416d1b67bmr30458e87.7.1761753433905; Wed, 29 Oct 2025
 08:57:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-3-71c568acf47c@linaro.org> <aQH-NcXry6_IlqXQ@smile.fi.intel.com>
 <CAMRc=Me5qPS2PhLK5hpK8BbTS8b9q3T-+86mq6rVDpyKZZUfoA@mail.gmail.com> <aQIwWXM8BfjQs7kv@smile.fi.intel.com>
In-Reply-To: <aQIwWXM8BfjQs7kv@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 16:57:02 +0100
X-Gm-Features: AWmQ_blmdCXVfDmCuctOcWac3U7ocspMQ35GR3eCIvgTpPWEqk3le8O9ZO4wqZM
Message-ID: <CAMRc=Mfz+Se0Wq4cXjgP=DBOMkTqSBdoV-CcC-+Ma0hfELARzA@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] gpiolib: implement low-level, shared GPIO support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 4:19=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 29, 2025 at 01:39:34PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Oct 29, 2025 at 12:45=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Wed, Oct 29, 2025 at 12:20:39PM +0100, Bartosz Golaszewski wrote:
> > > >
> > > > This module scans the device tree (for now only OF nodes are suppor=
ted
> > > > but care is taken to make other fwnode implementations easy to
> > > > integrate) and determines which GPIO lines are shared by multiple u=
sers.
> > > > It stores that information in memory. When the GPIO chip exposing s=
hared
> > > > lines is registered, the shared GPIO descriptors it exposes are mar=
ked
> > > > as shared and virtual "proxy" devices that mediate access to the sh=
ared
> > > > lines are created. When a consumer of a shared GPIO looks it up, it=
s
> > > > fwnode lookup is redirected to a just-in-time machine lookup that p=
oints
> > > > to this proxy device.
> > > >
> > > > This code can be compiled out on platforms which don't use shared G=
PIOs.
> > >
> > > Besides strcmp_suffix() that already exists in OF core, there are als=
o some
> > > existing pieces that seems being repeated here (again). Can we reduce=
 amount
> > > of duplication?
> >
> > I'm afraid you need to be more specific here.
>
> You can simply browse the file, it's not long to find and think about it.
> I'm _thinking_ that it's possible to improve the situation overall by
> try our best of deduplicating (or rather not duplicating) things.
>

Sorry, but this is not how reviewing works. You can't just say: "I
think this can be improved, go figure out what can and fix it, you can
browse this file for reference". You need to specifically point out
issues in code and propose alternatives.

> ...
>
> > > > +#if IS_ENABLED(CONFIG_OF)
> > > > +static int gpio_shared_of_traverse(struct device_node *curr)
> > > > +{
> > >
> > > I believe parts of this code may be resided somewhere in drivers/of/p=
roperty.c
> > > or nearby as it has the similar parsing routines.
> >
> > I don't think this is a good idea, I want to keep it within the
> > confines of drivers/gpio/ and the use-case is so specific, there's
> > really no point in putting parts of it under drivers/of/.
> >
> > If I could only iterate over all properties of an fwnode, I'd have
> > skipped using OF-specific routines altogether.
>
> The problem is that every subsystem considers "it's not a good idea" or
> "historical reasons" or other excuses. Since you are adding OF-specific
> stuff that has something already done inside OF specific code, why to
> spread it over the kernel by duplicating in another place(s)?
>

Well, point me to the things that have been done already and I'll see
about reusing them.

Bartosz

