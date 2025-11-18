Return-Path: <linux-arm-msm+bounces-82237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCFFC68A34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E22A0346F67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 09:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F342324B07;
	Tue, 18 Nov 2025 09:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="A/1Yca+Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C4C3112D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 09:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763459247; cv=none; b=QBBoXva0no8rKJkuDvcfEZ7knjq20nOvVdrATzP5+a/v2DiexMNxgfYSCdrnIu61tLWg3Zdp4ccyCkIYKNH1e+xkhfuB/FjBEQcA8zNuWelv28YunUdrdrSi8MiHpih2yKEu8azJ1sDqsw5rII2iD9FX618aEnMlH601qQh4WBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763459247; c=relaxed/simple;
	bh=NSDit/mHJlhkuZyhSitu2JvNgHl8gNj+Tf2PzvgTGRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=msZ0WS+z4dwCmkG4mTokHeVzP78m5prfuxYnjrhIfm5md5b7bbR5A/0FHAkORmqgGnvLBwZ8+GS4GuwN9n9TuQTNaipAbeLNlv+cD671+fLUmjkstNK0BAwca0zUsSS6ZEakM9V+/mLtmE6d4NWHsN1ihMvLgatyGNgdI3DoH28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A/1Yca+Y; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-594285c6509so5434951e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 01:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763459243; x=1764064043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMVWh4fXZBKxZ6isW9HD5sLU8SwmoT7bOn5vyBPfKmg=;
        b=A/1Yca+Y5bkpULFfPr3stAH6qkFPpYmOZF9g0pN09oivIiVCuHTcTYWffNZSm+TzOF
         AICHylCvdWDv9iNeEm9cIijDacJDESboZnCHZOJjgbnCBQ/hC2jLAfwBQ53aEjtAJPEG
         CNPuJHvfCK0U/6ggCowEc7Q1beXkaePeTcJAco/DWn+peaGsS3gCaK4RMdCwqC/s8uMP
         BsRn1LxH/A/9p8iDsZX0d2OR40bqMvaElIfsGecMC/jzGcG7u+3iKGybvrap3YIBFUJt
         DGVOgZLjjCIPhcyVX9TUpUjfp/Z1vS8Wu+xGyXmGTV8n8TBEAuX30hMD4o/MVs/i3Nx3
         jeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763459243; x=1764064043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VMVWh4fXZBKxZ6isW9HD5sLU8SwmoT7bOn5vyBPfKmg=;
        b=hz0fGWXhCgfnuRd/yfC6ow/46LJCaYOGPgL0Nv438QeFApLiE1bDyomVB1codefgP5
         xn4TZgEqkdXoHm8T/Tcn4tbTk6iV1/7hJLpfZ1dnif7nzVr9y+VisMA6/PCN63TRR7Zv
         nuxevZQwTvZUThnrhW9OnPJeLS4TG0nXln8b9Mx2/om7oKNjyHW+cFBXQV/6qESPppn/
         JPY/xPWC+s31tewdWnLSSpOXkB30GvAyNHKc69KL+M7PZVfPdAkWJUPetez1HXcP55ng
         RSRXB4O3tKlMWCQ7FSwQ2xT3DE87MO5fDkmLTllPCbQRnMP8WyBKVID4WCgLRVfupkay
         t+xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSqdc+mILyE41ftK161HM+lWndtSVO567aMD6rIUXNo6HzK/ojUxtNfPVr9WCjfjS5P2xAm1eNFi1SkSGl@vger.kernel.org
X-Gm-Message-State: AOJu0YxG6+xxtBpeniiOgK2nRRQ5EypNc2ka3mc6iN8rCazXPqilEH9n
	IW0duXgf89PoRm7yRieHkgZsvM+Tswm6oybXWMq3fj/3ieVcOP5zMqX8yy8xtl1I2GDjKOSFBUk
	YA1NkBJgZa+LpRZ9OtKr12q+JvJxTOVAKjOh2YGcIAQ==
X-Gm-Gg: ASbGnctZGmkjLbrK76EcCmXVoKCWHfBTOIQrwxuWiQKRp+cgRTDXzLAsj2i1dZZ5wcH
	3Nk3i/bOGU9JgZOcngO9wBVyx4jzwkXNHjXubY0YVMK4F9OxlLcXJM7OQb/ALXtdd8xMrIjBqaJ
	H86VGCcwt8QHIiiJqnjFjfVaZUQ081V7HpHwYPb80OJ4W/++tLrpTFuSA8bZfbWolRrD5I2aKI+
	Efh5I1lmx1WMm42da7wcIyleV8PAiVlgpf4OTaiCv2z6bRQnY/TDN0BJjJz4S+THnFrbIg1PXcg
	0oOcYMSAtwzCSSE8Hl7MyRmjcxOVxX8rpFDZ
X-Google-Smtp-Source: AGHT+IEKSj2qpQvKe0IfkTOGZF1jV6/WKVJLO2A/Txv4rPC3yDvwMdMydDTZhNC5mLXfB6q+qgnbPN4NmYCtJAA3Qgk=
X-Received: by 2002:a05:6512:39cd:b0:594:4b55:d2dc with SMTP id
 2adb3069b0e04-59584217be0mr5314684e87.47.1763459241858; Tue, 18 Nov 2025
 01:47:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-1-b51f97b1abd8@linaro.org> <202511171230.F83EE85D0@keescook>
In-Reply-To: <202511171230.F83EE85D0@keescook>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Nov 2025 10:47:09 +0100
X-Gm-Features: AWmQ_bkhi1H3-46xEmuP3pqCgeKjE8VDjqsBb0GhCZL7ntExaLQpYRSDFU-8VEY
Message-ID: <CAMRc=Mekr=xcGbSBD583nUqR43aLYO9iGakbOSSFEWYdbXW73Q@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] string: provide strends()
To: Kees Cook <kees@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 9:33=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Nov 12, 2025 at 02:55:30PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Implement a function for checking if a string ends with a different
> > string and add its kunit test cases.
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---

Hi Kees!

Thanks for the review. I already queued this for v6.19, so let me
address the issues in a follow-up.

> >  include/linux/string.h   | 18 ++++++++++++++++++
> >  lib/tests/string_kunit.c | 13 +++++++++++++
> >  2 files changed, 31 insertions(+)
> >
> > diff --git a/include/linux/string.h b/include/linux/string.h
> > index fdd3442c6bcbd786e177b6e87358e1065a0ffafc..929d05d1247c76eb9011fe3=
4250b487834b2d3c9 100644
> > --- a/include/linux/string.h
> > +++ b/include/linux/string.h
> > @@ -562,4 +562,22 @@ static inline bool strstarts(const char *str, cons=
t char *prefix)
> >       return strncmp(str, prefix, strlen(prefix)) =3D=3D 0;
> >  }
> >
> > +/**
> > + * strends - Check if a string ends with another string.
> > + * @str - NULL-terminated string to check against @suffix
> > + * @suffix - NULL-terminated string defining the suffix to look for in=
 @str
> > + *
> > + * Returns:
> > + * True if @str ends with @suffix. False in all other cases.
>
> Maybe added "empty strings never match"?
>

But they do, please see the test.

> > + */
> > +static inline bool strends(const char *str, const char *suffix)
>
> These are required to be non-NULL, so we might want to consider marking
> them as such with the "nonnull" attribute. We don't use it much in Linux
> yet, but I do see a few places.
>
> e.g.:
>
> static inline bool __attribute__((nonnull(1,2)))
> strends(const char *str, const char *suffix)
>

Ok.

> > +{
> > +     unsigned int str_len =3D strlen(str), suffix_len =3D strlen(suffi=
x);
> > +
> > +     if (str_len < suffix_len)
> > +             return false;
> > +
> > +     return !(strcmp(str + str_len - suffix_len, suffix));
> > +}
>
> We should probably add it to strlen and strcmp as well. :)
>

Sure but that's outside of the scope of this.

Bart

