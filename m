Return-Path: <linux-arm-msm+bounces-76094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB897BBE991
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 18:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57A7D1899A46
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 16:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A5A2D9ECF;
	Mon,  6 Oct 2025 16:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VLrtECs6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D048C2D8377
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 16:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759767075; cv=none; b=i503h1R+vn3MNOixgIT1aD2rEWdJPYk1u18W0STAEiRP5DVwejDtsebxsaJ6ELm7D37x+xo6ZujtkRwxq1+uxdI5SFkVlzazd2/ThaeI4wjZ8rGCqBDSeBqGunP46Y12L0tB1c3Nt1SIHN2cqnf/VUmGL2+rQkVs/WoY/B3jh0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759767075; c=relaxed/simple;
	bh=bAAmP6Vor3+frUWo9VM5DAgXz95oSL+3FrW7uk1ufUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C54AKwPhD4a1opc1OCAzYyRf1kud1heaTQNmL2ECc2t6qtN6Z5WNRiVoaSn/eehbcJ48VAbC4bA/sbWiv5wS1AgeODVlZsRVnq+Ir7I5TfUujB5dRVpJukEikdCdbHKzSss0aEA+y08W0a3S89/E+ZxXuoq3pyFkGDBWKUiOovY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VLrtECs6; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-33ca74c62acso44411721fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 09:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759767071; x=1760371871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAAmP6Vor3+frUWo9VM5DAgXz95oSL+3FrW7uk1ufUM=;
        b=VLrtECs6+aeEeZz+5cjvV6B/jGEJBVfEd/gTDAJD2K2FcF7e15k3LADejBcX6p7l0Y
         KrHQ10WvOU1U3EUD5RcMEz1+TNFrUT96t6wuLEOm0yM9HD5ZeC+Qbnq/dP94FHbyrUGt
         gfhhf9RCiTUsVzFIExZhtsKkDZl9osqBoiCb85qDZL2GVxeRfdDl7Q9rp9pjQAUsufYy
         g0exd8nmbboKMV/CVUjzM8ohVf4ACv63d0TDNGV7PweeyWSwQtX3Bf4ec3v81SXKkEe7
         OYNkWKFno8CxXi1kQuCtjz0uTO6mmN03TBYF2aBQjubIfGOmDZaZqLhIoW72Wc5q/mmL
         0/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759767071; x=1760371871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAAmP6Vor3+frUWo9VM5DAgXz95oSL+3FrW7uk1ufUM=;
        b=HsxLVTA+5uk0KzXe1Xf07ZVBa0Z50e1o4y2+oI/XddSJbOXoW7B7hyoyJsZtET5lZg
         oks+OMWyyZD24MeH/CLVIyeFBfWP8eKvunE/dwngqKLQM7QMGuQBgMCH9MLa6dDe7/az
         95b4zBbfs0OprapseA+5vEqzoFM+KhGNhk7rnR7CYgYUbfoPx/xJzNkLSjAseYqgscj2
         12cnR5xDgT9r1u227osMqWnXVeob4yTH9FJle8s9AiTa6GkvuwhjYD7skoFt1cq/ZS4e
         K46VHUCk2wQ/nC3zt39vgWRuoARfAhNf0hEi9AzN4a6zqSW3rq6L0aeKvGSmrmldbVAJ
         +bow==
X-Forwarded-Encrypted: i=1; AJvYcCVGt8yFDKycH72TgwBlOHHjuyiY7rFeiMgl2y01NOO9IoAZ45B3j7Fj2U+GSJkJGbmDjK5q74bAwZXSSkMr@vger.kernel.org
X-Gm-Message-State: AOJu0YxofstXXVUjdh5mJNajHt3ElU8IZmL9XklaZlSHTHPgENnPvXHX
	7jGAZPa/35G4VKQAxpEpXNkDMyC07R059xU9n/4GihsZrEGPXhoa2x343Li+d7kotiGgWAsz2Df
	/vhuMq14D0oTaurwhvR2Cyp5eZkMMY+qXd2QjCx4fQQ==
X-Gm-Gg: ASbGncsq0d7EpTVZdWDW0ZJNi1zrjYYHR5zBlKBeFhuORQCapM65hd9hikrUdmj/tiR
	+7iCOB+6+tT2/TZeuER66Qfg1WFf0WOysE1ju7MYJkQlzgwXFA6yNIfCX0WOB9v0SUssXWJ3tye
	EDb+s97gO72rHBIyad49FbxQMNiJHQyFy4nYnEjpVjO1drAVUjB481wW6+XZbTdZ+POVUaJ732J
	pQNZ19BaSIyftZce4uyP63MkvD31TSGyT+q5/2F9LHnT8Ap7SydumXpxUwt7rQ=
X-Google-Smtp-Source: AGHT+IHQni+hoN/f23d0O8IX74fUFomrJ9gkJXQ0jq6YVPXYNOJtNrLGQEvHZJ8/WlypXR2ARa7kU4bjK03qJXmCeP8=
X-Received: by 2002:a2e:bcc6:0:b0:36e:35c8:3dc4 with SMTP id
 38308e7fff4ca-374c37fc6f8mr39619951fa.21.1759767070653; Mon, 06 Oct 2025
 09:11:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e> <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
In-Reply-To: <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 6 Oct 2025 18:10:59 +0200
X-Gm-Features: AS18NWDSntYY-tS0LWjCm4WwdgxQdqQ5RgzeqJofTletfEADJXVbDbVNAU36cIY
Message-ID: <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 5:43=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.o=
rg> wrote:
>
> On Wed, Sep 24, 2025 at 11:25:12AM -0700, Dmitry Torokhov wrote:
> > Hi Bartosz,
> >
> > >
> > > The practical use-case for this are the powerdown GPIOs shared by
> > > speakers on Qualcomm db845c platform, however I have also extensively
> > > tested it using gpio-virtuser on arm64 qemu with various DT
> > > configurations.
> >
> > How is this different from the existing gpio-backed regulator/supply?
> > IMO GPIOs are naturally exclusive-use resources (in cases when you need
> > to control them, not simply read their state), and when there is a need
> > to share them there are more appropriate abstractions that are built on
> > top of GPIOs...
> >
>
> Not always... For something like shared reset line, consumers request the=
 line
> as GPIO and expect gpiolib to do resource manangement.
>

They could use the reset API and it would implicitly create a virtual
device that requests the reset GPIO and controls its enable count.
Except that some devices also do a specific reset sequence with delays
etc. That would require some additional logic in reset-gpio.

Bart

