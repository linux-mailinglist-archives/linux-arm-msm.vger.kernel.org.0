Return-Path: <linux-arm-msm+bounces-76206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 218A9BC1724
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 15:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7982D4E2092
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 13:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35BB2E0909;
	Tue,  7 Oct 2025 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OpkeMj9c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD88F2E03FB
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 13:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759842825; cv=none; b=GdyQqHwD5AFXvL/9DJSRpffygJaM1aNewEqz6gNRekdZG/BIdBxR0Qw7YAsWOCxmvkVZ3+kcyqP9ZKrX2/ZWX5q3oPyaXjh0zVADyWU9D47JFG5rFW9MIJyzpdRqc7xSYORkw9SYUHIMmpDQ5frvQQ86TADZghsfo7AE0O836YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759842825; c=relaxed/simple;
	bh=t0N+x/VGNAQttY2sxorx9dZNMTxHZKG1OWxQ7z8PFso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edu08al1YjEULR/HreqRDyd99b/5pCxf0Anc/7pW+4d0/1zlzYH+MSEGXwzGJH15epM9+SvSxUhXVIiUWZWbTRuEofDwExlNZswY/TeDtaPdv46kYQcqe+nWY4vY/3peaBCQot6oa8geHZf2932NCUJNqR3PF498HJtWpCTeFS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OpkeMj9c; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-36ba647ac9fso50165751fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 06:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759842822; x=1760447622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0N+x/VGNAQttY2sxorx9dZNMTxHZKG1OWxQ7z8PFso=;
        b=OpkeMj9cbEuqd2iTllQwOT9yVdO2fmEEfS/m+hUM0tUHgN48mBoIkT9BLHmLCL7Wlb
         1I4Wl4IqdVR7OrwMlzUdgd2raaJAlK+p0VBkNvpOODbVkbOslgiYx7G5jMQzGM9jdWKF
         FiVgfSs/g3PoEGlT4PO2KF5C0QOpj3sXe4xDurS7S/SlJpbZ9vXXC5lihfFxMDyriyy1
         ooeiOGOPQDcAchF5JGqJzFx0H/4WFsylmkV0hcQnJCR5bOxvJcFA1UxD7SrZ0u+87u90
         ODudjpiY1i3XQEsYtgz7Hog3C8bUp0VzKEpfQJUtinC2s6OpzK6JOSILBD8EsvgMkr74
         dTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759842822; x=1760447622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0N+x/VGNAQttY2sxorx9dZNMTxHZKG1OWxQ7z8PFso=;
        b=ZQapRW1zYCDFYIbuVJqyW4FXVUZljkTAtuYkRVbOn01+CI23lw1bUnJQqVEAtwqDcN
         BSyHaGS2Upzw3cCxcHqy49IaOR8MnFqNoM5fLW5Bm0KmgFUFdwikHFP3Mzyj2zpEMFVN
         gQIu4HFMgEauxSlHh8qECOcbAVwG8LVpO1wKYwNIhV2aiHT2fY6ZqZpJ7l+jbhx4p7tr
         iHcGjDkTJZZ5yzmWmhuQ+HK8JSto4FLbtWKMTkfFCILcJwjB8AgSaKmhjqBC2a5NLdfR
         Nw1ezXcfemN/4kYFf6NJhkf+T6BNIn8iFhwwVzHgJYC62gQHTRwqpVvjACktmhwLR9gm
         7rVg==
X-Forwarded-Encrypted: i=1; AJvYcCVlMkzLr1J5lAag+o0zDPNy3IlXgwmDLcpH/MZIGdZn9OZPIr1TNpipAEcGlBpJwf9Hexvwt3+gpScK/3r+@vger.kernel.org
X-Gm-Message-State: AOJu0YyLe0Bn/BjfnX2IuN1WpZnlEvfo+bglvG9lT0j5fUGUBU5BiDRl
	qfnzOBrhgBNOOuuI/EjRdTl3aRNs4P1AygTtaEHWKrW7/MOkq9ehWlOMzI7ftZNYiMr7ASuUDzA
	dk1XQHl6anX2rIVPx36c8gW7Rj8NpZFOyKRwKKxrWug==
X-Gm-Gg: ASbGncvhh3PeW5qn/TdMHdpvfuq1aJ3sH9E3os9jNiC8ZIVA1C8SWGGMTYt6bbogqtW
	sCfqGL989Co1pkaPzMgR9ac87uN9eTEzSSmSO+0ToGOCe0vr2N4i/PfKvnBPG5rYoCa2/vVXKzh
	6xO6SKNVAbMzm8erRchNK7SzxDk3nXSDKPO57W3dv8qkcnZSfggIMeZ3+QSlP8AdxrsPvLLdTPv
	TwMNOL5izZs5jgdjkuzwNa3SadaClSOh2BCcseTOScVS8058iHGX6cmNTNh0zA=
X-Google-Smtp-Source: AGHT+IG7P5Lsywws5bBPOT8E7JIpupmd0eu9fkYQI1gC/FvLSNAcnVdx2QxXsM+KX1p4mn8AU407934CqwjnV4QazxU=
X-Received: by 2002:a2e:9a14:0:b0:36e:21a0:f212 with SMTP id
 38308e7fff4ca-374c38477a4mr56218171fa.29.1759842821852; Tue, 07 Oct 2025
 06:13:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org> <CAMRc=MfwEHGV-HZQURR3JNg1HatAeWO17qbRmkWUXTSBWj5jSg@mail.gmail.com>
 <80347dcf-419b-489e-9b0e-d901fbacc71a@kernel.org>
In-Reply-To: <80347dcf-419b-489e-9b0e-d901fbacc71a@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 7 Oct 2025 15:13:29 +0200
X-Gm-Features: AS18NWAq4ASQRRUa58ojinY89n-hm2wwAP_Re2fgpRgz7dBtx-tBmKEba_o3nR0
Message-ID: <CAMRc=McaZV=tUkzDGMYxXqkuEYw_KasKcv8QGdjw709UYZuGhg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 11:55=E2=80=AFPM Srinivas Kandagatla <srini@kernel.o=
rg> wrote:
>
> >
> > If they were called "reset-gpios" then we could (and should) use
> > Krzysztof's reset-gpio driver here, but we have many cases where
> > that's not the case and the names (and implied functions) are
>
> Yes, these codec drivers are due to be moved to use reset-gpios.
>

You will still need to keep support for the current "powerdown-gpios"
property in existing device tree sources so that doesn't change
anything. And what about shared pins other than reset? 'dc-gpios' for
display, other 'powerdown' instances, 'enable-gpios', all kinds of
uncommon names like: `dlg,cs`, `wlf,ldo2ena`, `speaker-enable`,
`maxim,enable`? It's not likely we will create a separate abstraction
for each of them. What I'm proposing is a sane, catch-all mechanism
for shared GPIOs that right now use a rather wonky hack. Also: the
drivers have no business knowing that they request GPIOs that can be
shared. This is why I want to hide it inside GPIOLIB.

Bartosz

