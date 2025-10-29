Return-Path: <linux-arm-msm+bounces-79457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A81C1A73B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 032E3357858
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 13:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190C23233F5;
	Wed, 29 Oct 2025 12:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hyjqqwMK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1BE34DB44
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 12:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761741688; cv=none; b=nvuQ7ApF8yA/ifg5JZ864AiQgwFD46wCDwsATXdDEkYuhbCCHP6VaxRwyM/F6Iv0KbJsBb8B9m0c15Z1AYBZDSgxrztuzOsHIMwcTPMT9pOki34+4vg5nIeMsMxzx+jGijsWoK8itOqEh3Z2KBJQqrwAkDx1IdftZ7IqEr49pVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761741688; c=relaxed/simple;
	bh=4GfXeQTTcxSpcQZ8VLho/amPI/XMfZn1ZR5wbT6W4Qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PdZggZFPbw7ZNIhbmB6IuK2A7kmTxoCd2zTStna2uc1NJ/3GunG0CfRX4i0WsFKJYywdRGltK1SPdM8fKFSoHUA6iUne3mPq4z8j2RleUzHOG37W9SyEzbjcOD9xUeCiG8rZ0LMuHrSwGZXI70kjZAJ7Z+gYP90BqajLH7e/uOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hyjqqwMK; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59052926cf9so3298352e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 05:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761741684; x=1762346484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GfXeQTTcxSpcQZ8VLho/amPI/XMfZn1ZR5wbT6W4Qw=;
        b=hyjqqwMKlVbrsrlesNjru6EvotES6SrhMga7FgYCG0XewJxKvoiDPxx2ycrLRo3Lqe
         IW40iMZQYr0LfAf6nSu/98u2A1l1wfVszqz7PPr1Z3SmTtUoBpSnRXdGf3L8Trs8SzPD
         vSqunM7aZBP6O0ZpRLA36J4FFq+lBhpESQ8xn4Phlbf/BjTrcsYvHHRjczJAuzdWVTT0
         xSMl4FkByJ2JulSrmfkn07inXE4sk5ineQaXOonfrrO/3dkTSmjfUTcG5xEWCCdY30RK
         DJEm2NqnOzr8JM2CVjlNuf8s0E1aPlCyxoHfRPqXH+JJjhF6DdrwcpoC3rzKbnA9pIeU
         wenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761741684; x=1762346484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GfXeQTTcxSpcQZ8VLho/amPI/XMfZn1ZR5wbT6W4Qw=;
        b=MVx8paGBgll1/XtD9hPJ41wkzRtC9j5pC1e6xCOqb5GpahE7TUUmlpD9IZiESUR9QJ
         5wvQEA9bZipo+SCK6CPqgqrqJzBjw9NsY6wCwH9RtihzPiXsC+l3bPzmfpc69ZaF0beZ
         Baj34zvMGeFCiS7Lv6wb41Mal3jh58O7vADskPMZGJcZNdqfBIKOCRaIQ5J8ThPyCgho
         e6RUQDr6D18k9qSwVROhGDkf4eUzOwtJnJCGHoLoIDP+oxqtBxdZOBk5wtRUlZ4f6P9G
         UXYCxL+cZ9slL55zi2lH9ESc3BtDGmb/iXpPJy1slZolZnNqtkMWk5eqK6CTRHrWcWqT
         d5mg==
X-Forwarded-Encrypted: i=1; AJvYcCWg+QAjHlBPlYqJBsF8724wuWSy31g6bYqeOxU/tbw5vVdNa4PNwdVoo6ItoNRG1tLPbkDqWUmKYTznQvb9@vger.kernel.org
X-Gm-Message-State: AOJu0YxbSWanHqk+EJWeJYBx1zL1qONs/7idyz6YQiJqcCe5ENia6cOk
	hODpvQ/RktUwWI4srBq3+Nxb84s9U8SKZ4TKpnASCOJ/ymeVbkAW/jpuyWdRbExPhIeWi5VXzBT
	Q22ItJQPB3e72pqpl1/Un/gwafCR01MRwltBKfIv82g==
X-Gm-Gg: ASbGncsSmQDsTjAfqqWD41Q3RPCGqbh6PYYi5VcABrh3COE737scj1eeITlrzaTEJO0
	4P0QeMZBrFdsmUCzvp7vaqa+QsvlJ2ziNJgXzkZYW3gRznlz2fi9Eg0OOLKHDYsxjo9ZqesrspF
	GDOq34r40q9xo0ixytAvqn0buVvOrNSVoecYLWOObA+LjMlZ5NH8XvSfuJt4edCLtmVnFhYqqML
	Hc4riM6mGB6hofd02jD2Y+Gt9gtRR07n+WS/EEBfcWzPrDsau3HTfNLCifQbZhSMjuZVNTvJbAL
	48OPqmK3dO3Jartm
X-Google-Smtp-Source: AGHT+IHlRZvbfo/SYNZZ4o30tnBaAGKMcvTAo3NYRcGh1EJ9OHd3AuMhXHkwK8JOue6As+3lLZ2qXnJTw5y6BaOTrIQ=
X-Received: by 2002:a05:6512:3d05:b0:580:dda2:5318 with SMTP id
 2adb3069b0e04-59412a36b93mr989969e87.8.1761741684202; Wed, 29 Oct 2025
 05:41:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-10-71c568acf47c@linaro.org> <aQIAXO1hUrw4Yp9V@smile.fi.intel.com>
In-Reply-To: <aQIAXO1hUrw4Yp9V@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 13:41:10 +0100
X-Gm-Features: AWmQ_blYolUjn6HNVFswcXKBY7oowKsMMcCgguiaK5B1Up7lgJHjEAFObXA-S34
Message-ID: <CAMRc=McT+HinKvajHmBYPcQKoboapAf2E3ErJSP=2jXW9B0omA@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] regulator: make the subsystem aware of shared GPIOs
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

On Wed, Oct 29, 2025 at 12:54=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 29, 2025 at 12:20:46PM +0100, Bartosz Golaszewski wrote:
> >
> > GPIOLIB is now aware of shared GPIOs and - for platforms where access t=
o
> > such pins is managed internally - we don't need to keep track of the
> > enable count.
> >
> > Once all users in the kernel switch to using the new mechanism, we'll b=
e
> > able to drop the internal counting of users from the regulator code.
>
> I am wondering if you took into account the layering violation (or others
> put it as "transferring of ownership") in the regulator core for the plat=
form
> based GPIO regulators? This popped up during the discussion of
> https://lore.kernel.org/platform-driver-x86/20251024050537.92440-1-qiuwen=
bo@gnome.org/
>

I am aware of this weird ownership transfer in regulator but these
changes don't affect it. The layering is still being violated though.

This should be fixed and I've looked into it but it's not trivial so
it's another big rework for the future.

Bart

