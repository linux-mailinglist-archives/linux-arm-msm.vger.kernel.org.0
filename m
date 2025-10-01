Return-Path: <linux-arm-msm+bounces-75678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7054BB0680
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 15:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58BD71945AEC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 13:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF93F1F4621;
	Wed,  1 Oct 2025 13:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YUX3EtsG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343CE1E834E
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 13:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759323897; cv=none; b=EGHk4bzu9cmtmA7bS8vJuQSbYk963bw77L+98eWAMUdPloWBkdgHp++1rqfHgB4SS+Gds8oOaS+Tze0sfoIcD91GscoAgmmjLiNF1IwMdoTvEMOilg9TXZv18vo8SdQrg+5/A/IOs7sR/LI1lqfL58TPtCfdm0OiHJe751zO92o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759323897; c=relaxed/simple;
	bh=Sd6yCdxS3n5TE903KsbIcaO2lzqa35LHjefQZurCtJE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gbf0cRCmqB9ElbG1LcyekUuNDIvQ056DgOuMSzNID4TSZtjUp40kp1Kf7GFXl6j9Coo84ZILmP9pFYsuG0hnvc3QVQTV1IZf7GpjcAvAeOjtL6KOIJYb6VJ9ZO+hKwZ5csdBGLYFuFmQCFbLBz6RxqbDL+QKO4s1dkaM4S5b1Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YUX3EtsG; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b5506b28c98so4962100a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 06:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759323895; x=1759928695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHbqmA3oKpic6IfyRvOOe8x31ZYEYEaGDwcq5aemMoY=;
        b=YUX3EtsGULfgO3jbr/yyY0xXUjnKvm9KSHwMEvLR29i5AfD8NVcNmxHTaeoWkXqDa2
         +fz7+eZhD0b7REf1FTf57q0trH7Fvmn8i+Xz00LgxDJXUuhmAld99SIhADKnl6XNvefv
         foMuvVWk25cc3qnCJUKOBHJbQXYj0+SFsQipoCqOHKAr6HEpG3RkjEyS0jPcF8Aj77/v
         fUgqNyEzFEiNyF3LKX2KgK10Eq3WxKqM++EwxhtZlYWYCh7/vpK8faKdCXEQTy++eMKW
         IrRhfYSTq2wcv9ODuCIAawLGSAt/tVpfJzXdlo+mJpRjJHQrJpKKvgZ151CeiY0k0Lkg
         jpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759323895; x=1759928695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FHbqmA3oKpic6IfyRvOOe8x31ZYEYEaGDwcq5aemMoY=;
        b=oDguUkL8Q5R0SUYe2fFiZPr2V51drgk+YiyOm72/gmZHumSicsUwMNhPXl3TkIxf4S
         OIF/66tq+vkY3bc76iT6I8gmbx673oUBhWyt7FV6uMxRvVdtp57+A5YtXocz1XdEtQ2B
         I1AU5LCbLh3Ls9t1TDv6588IZin7nur/fZGJnkErMXYT3ks1/KkJgM8SJpwHGpLyRHGX
         Mw0fz2Btr8T9pL+NNDgk6r7B7jCx0i8mnKBEHEMMfEUKgvpxIXPiy3qBoXm7BGqNx9+l
         aoef5GkGbflDSbILOT3Cc93iBCG6r+TntKlFpO8736OrbAByFw6Po32gM+e+7RjDiK33
         8qbw==
X-Forwarded-Encrypted: i=1; AJvYcCXqdHRW7g3Xvi5cCEoxXt+FYIOIlnUG9qHnqT58LiucJ5OXjuhFEi/jkxT//AgnRI4/VJVtnESzR8VuTTmt@vger.kernel.org
X-Gm-Message-State: AOJu0YwetQhxsEOlTLcj5d4SPWK2ZMSKnNzEU8nLuPr7pxUersMNHGBX
	2mZ1+ljtEhUzszzdcnxzDtDm2jvYi5sz5Mp9U/i8T3ZXy2PGM6D6NU2+lOZaPX9tMSqlQ92LNFJ
	HYtZ4enB+uoe7IK7LY95MhScQLO8coz0vVgJPcA/qZg==
X-Gm-Gg: ASbGncsj3kT7PPx1E7ZxI7W1miazY0KT6zRPdRYeCYgo6nMJO4fW9p4/TBX25XNY1cY
	On8ifrAhLF56OaQmxStlFZwFiPk/j1rxWcnlSJvDi1vB89LJyJh/E+VWq3y/Qha+PcqESICbIkI
	A50HgNyPm5B1MaGQv5Tngje/zKUtnOjVnM/Hwso7f3B8akntQJg+6GIHFNWBjAd7dOmJQqL24U0
	rwop3OSrKBGRdBVmCJybDRCIEVtdjOkw1BzK9Mxr0IiWHcbH4bChkHLaMibZJ8=
X-Google-Smtp-Source: AGHT+IHIX0BnzV5QR3ZUNafIRXxWw+fJ+TE74iOPYTO055yiV9YQx881LMKJ8ntEhbIPyMH/yj9fWYf3xbX9jssRLhM=
X-Received: by 2002:a17:903:15cc:b0:26c:e270:6dad with SMTP id
 d9443c01a7336-28e7f43f288mr40560635ad.60.1759323893974; Wed, 01 Oct 2025
 06:04:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Oct 2025 06:04:51 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Oct 2025 06:04:51 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <CACRpkda-ZvrAC4bNLnA+ao0Y8-Nd_-b89N6HU10hhEdaOUYAjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <CACRpkdYcVtJjRHRJ8GgeU7rZDuyaJKu0vgcknb7DsHPjZGKGuA@mail.gmail.com> <CACRpkda-ZvrAC4bNLnA+ao0Y8-Nd_-b89N6HU10hhEdaOUYAjw@mail.gmail.com>
Date: Wed, 1 Oct 2025 06:04:51 -0700
X-Gm-Features: AS18NWB4-ek2de5G39SVs91_zyxyHsKkPvhufhJXGysoQ2YUW53Yv6YTbFeN0M4
Message-ID: <CAMRc=Mdb_cUG+hKq8GyfUP1SYBh0p19J+4dFG7G3JSuZTr4n8Q@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Oct 2025 12:53:07 +0200, Linus Walleij
<linus.walleij@linaro.org> said:
> Replying to self so Bartosz don't have to tell me off...
>
> On Wed, Oct 1, 2025 at 10:49=E2=80=AFAM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
>
>> and every GPIO access on every system will be proxied
>> and then this better be fast.
>
> What about I read the code before I talk :/
>
> Inspecting patch 4/9 it is clear that only GPIOs that actually
> need to be proxied are proxied.
>
>> Two things come to mind, and I bet you have thought of
>> them already:
>>
>> 1. Footprint: all systems using regulators will now have
>>    to compile in all this code as well.
>
> This still holds. It could be a concern if it's a lot of code.

It depends on how we implement this. If we just rip out the enable counting
from regulator core entirely, then it would be transparent from the
regulator's point of view and each platform could still select the new opti=
on
as required.

However there's the issue of regulator consumers who need to know when
something changes on a regulator and to that end subscribe to the regulator
notifer. Regulator core knows then it actually changes the GPIO so it emits
the event. There are several ways to approach it but the best one seems to
be: allow to subscribe for a per-descriptor event notifier (implementation
details may include: only actually creating the notifier for shared GPIOs),
and be notified about an actual change in value and then propagate it to
regulator users. This would still be transparent and allow us to select
HAVE_SHARED_GPIOS on a per-arch basis.

Bartosz

>
>> 2. Performance, I didn't quite get it if every GPIO on the
>>   system will be proxied through a layer of indirection
>>   if you select HAVE_SHARED_GPIOS
>>   but that would not be good, since some users are in
>>   fastpath such as IRQ handlers, and the old way of
>>   sharing GPIOs would just affect pins that are actually
>>   shared.
>
> It is clear from patch 4/9 that this only affects GPIOs
> that are actually shared, and those tend to not be
> performance-critical so this concern is moot.
>
> Yours,
> Linus Walleij
>

