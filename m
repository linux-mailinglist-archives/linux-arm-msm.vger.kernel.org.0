Return-Path: <linux-arm-msm+bounces-78336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BE5BFC2B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C778C19C6AB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 13:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929DD347FCD;
	Wed, 22 Oct 2025 13:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDVnjz5j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7422E347FC7
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 13:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140049; cv=none; b=nbD8ds7Bwt4NykCaykQiED2LSjWNL7aGqUch99/sGbxnxkWrrFWtrzEdGkoczydYYSI6ydKX10Xu5NUkkCGcchCOA28CxaNWYQoTh8wM+Zoxu8Y2Vilmlw+fGEMXfwFORAhchN+2oB/88dmMGOomEIo3MWnJ3edC/BCrkgjjA7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140049; c=relaxed/simple;
	bh=gWtnyZCMZ79lGvtHTyeCn/sxtckldijN3FKie7XpzK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OKgbLI1w79ss/+0/gBTEimd8kcgL1GHORDFDdEOz2Hihd7ZPGmnNtugFcCSfl2xK52PrupbCZ5f6wrB442t7sAemgPs56ih9wKxICfQpNy0lLJ7Yvz+QtKliHS75Oq18MI2pAfK4m9QlCETPoTf4F1XO1kPDEd5rFhOzBHvI1/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CDVnjz5j; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b626a4cd9d6so1357919866b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761140046; x=1761744846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnDab3MvBR9d06ZmEVci9R2LEo8WZZltTef4oKgMrxE=;
        b=CDVnjz5jqOsaNOGf/xUBqTdky530gFLOTueh497tFpB3jkwYJP28o/3s45BjwsT3qr
         lxtZZfaUu9NuRQXrZQus0kZ+fVkvLKEZlTTPAjnn8L1AK83eyuMn7Wafr0Zx2aPo2m7B
         fOksJ515XZEh3M9ikP0Zi6ABQa5qKlirVffuN9zigqowVSbr8nMHixoqdkvTuY6pM1iV
         fQGnCgY4EBxF4s+0B7aI6fKEQq3+tw0kG1+xMoUyanJoZ+Fu6ARAN4wIWfTxh39VwOFr
         Wx5ZbOHMR6GU5w6ATE1Pq8Wi+CVOQETUwWCPGLKBJ6FEJg3fmGgB3Tv6eWF5BzUXgSL9
         dcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140046; x=1761744846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnDab3MvBR9d06ZmEVci9R2LEo8WZZltTef4oKgMrxE=;
        b=Hi32SLDLYxMOEqQg86/6OXCHJVz5UcLBw96l5F0pR5fckR6gDOjmxrkSCc2fMhxzCm
         vkrip+KfLywJEOTXfU55vcyXw14AmGK2H4Eadx/d7wrbdkA1C4bIoQkphzzOz+XrONaQ
         wL0050sDVSFHFUJ+GelZdDMIZD0jsltXseFDAlKHaZ4OtLKAPMfDgaVx5esEwNXQCuNt
         Z9Vij4YNGzu57ashnZ87q43f4HxWBCcKjiBZqUSP24vf46NDngOwPTU5qKO8506BnDnx
         2rFf9aDwt+Mg04kNdJedALCWcCtUJBgyzW38MglrrGls13gi5QAkH9PK7bK1udm3EbWG
         oRow==
X-Forwarded-Encrypted: i=1; AJvYcCVXyjfGcqTRXOBG/HU0bCT9kMfO5hLjPa/nr/oNduFlWBE3/EeEdaU9oAWW1aqy6qiydbeSS5xhJr8W55dj@vger.kernel.org
X-Gm-Message-State: AOJu0YzrzftpKNKUn/LkzhgrOtrUwDcKAyoGzoHy22goA8ZTDvHC6SQb
	VjTNBApHW0SxYX2hsbExyBEPvb9lbk5cKJQPbR/y+zQ1Q61fAn/2kWoLjGTOQlYKvd3mNHZjKQn
	gZMmKsQow6BmCAOrRh7nQcs0MW0OHpok=
X-Gm-Gg: ASbGnctMRFGr9aJKV9Go7hkXH0GND6oXatwWQsKX9ZBbNulaB3Idj0L4duE2Wil30C6
	+o0BrHu60vIghij1lo0bi7tznisyYHfXkiS8sCveGAs88z9qhqJorTH4PQy2ZSxEOdPSsNZs3oI
	DMxO+Q4cDuxwmPvFP2/BNoBfJ/CFJ315OXS4ZeVNjabUREUbRyF5CAo+QPE/45z0+f/XJtk04eN
	IdEe8MUU7pT0nB3ztvU41IyCY0Rn4jk3StXura+KKPFFfxAPsMNyVtKBAg7Y6AbgPPss+Ko
X-Google-Smtp-Source: AGHT+IF+bGnEQc856DkdZpIAOaRV7nKVJQZfv8gn2VCNIJnjHmyCsahfWQqIidtzCF/ZoRQsNWSOtm7llM7J7h8TBP8=
X-Received: by 2002:a17:906:7314:b0:b45:420c:81c0 with SMTP id
 a640c23a62f3a-b6474b36a46mr2340985466b.36.1761140045360; Wed, 22 Oct 2025
 06:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org> <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 Oct 2025 16:33:29 +0300
X-Gm-Features: AS18NWD8eeQXjXIPK4eXDVlSVPojwJxWfrcwXD-jC0yt5VNiNWjvrq9EAmjuWt4
Message-ID: <CAHp75Vewc2OoD7=eoFtrkPrGRuB9ZGT2vu4Z_wdHZUDZ8igUtw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] string: provide strends()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

On Wed, Oct 22, 2025 at 4:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> Implement a function for checking if a string ends with a different
> string and add its kunit test cases.

...

> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -562,4 +562,6 @@ static inline bool strstarts(const char *str, const c=
har *prefix)
>         return strncmp(str, prefix, strlen(prefix)) =3D=3D 0;
>  }
>
> +bool strends(const char *str, const char *suffix);

Why not static inline as strstarts()?

--=20
With Best Regards,
Andy Shevchenko

