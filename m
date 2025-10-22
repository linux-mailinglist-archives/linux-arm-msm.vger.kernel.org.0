Return-Path: <linux-arm-msm+bounces-78367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32570BFCEA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2B3A189F09D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FF1347BBD;
	Wed, 22 Oct 2025 15:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="L12t+1rE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495AC340293
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761147413; cv=none; b=CCXVtbHHs76g/Z17rOQ35JGDS2SOheFkZLtEnIClCQ2zhIYrVcKzauDPDx1ZfV/YL7Pn7rQOOEkWO1JYf6WKWYizpT583K3szUV910ZBqas0Qod6XcNdWJRR88UkimbJBVxIhaikx+dLYRav7F6ZZgqihZMJ4Tzqg3a2KFxvsdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761147413; c=relaxed/simple;
	bh=voJSs7Hw3Wl/EZaQou3RkTgu4VdQyS/EVwb9Mp9QVNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=axcxcJVzAunhZPBenqfhNK3opqADqMRQJuWlCFESNGRDdsqy0977ZpszVIdgFZwGRnGyt8QfneVX95Sj7HoP+eS4OvTA1e6iIOk0w776r+IbnEpBUQqy1Pe0hT3Gmud7m6ccx9H6iYS1/ZFGIccFPZNoBvST5i2Xq/XqrxyGsW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=L12t+1rE; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57e36125e8aso6648619e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761147406; x=1761752206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRzlJtgmeKcllMySQlFgaimNGUEcv2R+GqjiMHEJzN4=;
        b=L12t+1rE+8f9f2Pii8C/PIdRs9UoviXh9nOuNQfciu+K6ySdJHYZaubI8Ar0qund4h
         87cLYIm2isV0LihywDTjrUE33d2U+F+uSNel4OMVteAUWqf0NhsWuZGk//KVBBzthMBJ
         W4fB8wRsqMKZBHbuNv4Rq3PwYFsdylxTWDHSw9FcnkCog+tqej7kEXIUGk9df1LSVmCO
         srJ/y9tNCneiHfOQ4AUrXz6ZT4gF/cjiyLsErvxX4C2dZlZ/o3e9gTtiaz2Nyi7iuszQ
         VuSLCt8QoP762tAXBhLqvElEO/Tszi67Dds/nmxWBVMdZeiozzYZ7buez5BkpisZTuFA
         9tgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761147406; x=1761752206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sRzlJtgmeKcllMySQlFgaimNGUEcv2R+GqjiMHEJzN4=;
        b=THlSLj5ziT4JjodaISiYoxNJVNMksha9VqpfDUihihZYrLyVnhh2q3WQ2VzeQzBICH
         1kwbY8ZZsNWzDNI/mFF2u1Zj/byKWcKFXSdssj9z/Vq1i/uk8e+0ENkY8ul6u6DG9w9O
         cGdR1BGEb41QpRqOSXC0eY0iYyQRFwEXXSacqISOP5HvNxLVBHsjPbqu10qEysLYscVo
         2RJvmoD9C2Zmcl95ZqI8BQgmLCZyehynUWhMoNhaFTLkljsj+85r07nlXU6Qrq5aKkVD
         exSXzDN97jrJh9ATuMEuEHodePUvwMAeW/Js9LhGGT7QnoOjwYhuzjSxYEOPWXjm4E9J
         cT1w==
X-Forwarded-Encrypted: i=1; AJvYcCXq2x7+pTWNN6WR/3JOxukzmj5+flLsatP/5qMo2yX5QDAcyDwHO6z8B7qm1qU+ZptX6sOzFRGttpoRPiY1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt2/q+R6CVruSKRvtNjzorCoxxW4nMGYIz8vW90/XbpQoTBZfw
	073wFM7uQGXWqVNiovR+JzU8gg0gJ1YYVp22U7dtnpQmJjcBd4Dt7rlbL5kNhZvhRTB+wYc0jTD
	GQy3rppcpC7ab1DX2Ua4ZOWA3Ov4UVNYcmgqG8taxdQ==
X-Gm-Gg: ASbGncsNlvCE5c34ECflhINQV23uAQLRaCylhuFhtJDcxS9zZeTpoiKIsKyAbOj4zgG
	1392P9brK1CEU3Ppmimd+K5/vGEfqNmvsLn+xOiYC5WFkdWlPJ4VUgxcPfhlC+rY/pH9uALJ7wN
	GgHQOfhaXBrmnlOJk6Lj8xHciRmTlqkQSTHEMm4SyQF+qX/zlfnfec1zfa7ygsgQ+9/RrPoSdCO
	M1IJl2dPwpA+SV4+XteRFVXlQWCe8D3WJ9D86TcOyXXF5u8fWU2EeZi6Xpjy3oSxjJC7kGiFO+X
	defljwk5sd1AgPpC7t66XlUEkFo=
X-Google-Smtp-Source: AGHT+IEi/irswdy4VVxLlO1hAN0Zsc9fjvuDKRe+i2ePli5jYREx+Bc29gt/0YVceCmzNFvpblDZjtrVlJp1Cz69730=
X-Received: by 2002:a05:6512:33d5:b0:58b:151:bc12 with SMTP id
 2adb3069b0e04-591d85a4b54mr8169026e87.51.1761147405947; Wed, 22 Oct 2025
 08:36:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org> <aPj3fCYj-NQdDSQT@smile.fi.intel.com>
In-Reply-To: <aPj3fCYj-NQdDSQT@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 17:36:33 +0200
X-Gm-Features: AS18NWDr85-ZpXwSC6o2WrSo4j9nQyRJc99PDFWHduyckze-ToGPJ6wk6IRJ840
Message-ID: <CAMRc=MeSFKRo1rHq5ENzKqws+gOAX=-nCsGtw5MXvsOwJr=XpQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] string: provide strends()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
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

On Wed, Oct 22, 2025 at 5:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 22, 2025 at 03:10:40PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Implement a function for checking if a string ends with a different
> > string and add its kunit test cases.
>
> ...
>
> > +static void string_test_strends(struct kunit *test)
> > +{
> > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "bar"));
> > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "-bar"));
> > +     KUNIT_EXPECT_TRUE(test, strends("foobar", "foobar"));
> > +     KUNIT_EXPECT_TRUE(test, strends("foobar", ""));
> > +     KUNIT_EXPECT_FALSE(test, strends("bar", "foobar"));
> > +     KUNIT_EXPECT_FALSE(test, strends("", "foo"));
> > +     KUNIT_EXPECT_FALSE(test, strends("foobar", "ba"));
> > +     KUNIT_EXPECT_TRUE(test, strends("", ""));
> > +}
>
> Have you checked the binary file? If you want this to be properly impleme=
nted,
> generate the suffix. (Actually making the function static inline makes my=
 point
> really visible)
>

Andy, this is bikeshedding. This is literally the least important
piece of this series. It doesn't matter for the big picture whether
this is inlined or not.

Bartosz

