Return-Path: <linux-arm-msm+bounces-78633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E7FC030B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 20:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26EB3188F8CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 18:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A16286D56;
	Thu, 23 Oct 2025 18:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="s0yNVa/e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF070280A51
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 18:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761245044; cv=none; b=Uf3ND2SDN6xuKjxtClNEKBrdtncRsY4Nn7fb1UFc3zHQGnRF1COu4PZotEHvkdGf6MXcbY1rqFd7I/8HMrSm8CJX5wHHqo+7Ptd9qXgQgp85XNIvgQ92Mk0f/iAoLVVaw2MY3GLaTtq4dbCLAZsgISGjXYRlKvLhlU6hAo5lYEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761245044; c=relaxed/simple;
	bh=PYp52JdL1zIXM3tFl6ymQmTmBEsgbvGo+/rL6L5cfGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LuKZx41SvJdprYgcWejQm14IVZiIBfbqqCArTfgU0cP+p3MZoCcQAVyejRmk5ow3IjWSdBm3lRFjVEsBCvzLo7INurSEcxO0VJlm3fD1zL4DOfsEbN6X78oxkR1LVOxvpNVZ6AE6t6y8l5s0ajZRcBCHJiPupnIWbzzXtNyzdS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=s0yNVa/e; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso1094301e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761245041; x=1761849841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FILWuJP7z4ne8yyln1112yG3l4Q4g1VKcs5bhTHsJnM=;
        b=s0yNVa/eJZhfoD3bMLT1xWtZBJPc1t8A/Zn2xYvJEgb/5MtqNO0u6wsuFrM8+isO8U
         a8RqaMEzvq4KU+ucS1pGmFbO1lJkh200XIxtI+uKBrtnG6LYvmZhKlbST26f1dgZKE1G
         dOKkExTkR8MKfeKYs7aXi148bX5ANT4YL2UKuU8MsQpC5zW3VrySCfAv6AqUxxr4U7+w
         YLQx0lhCkihrCpKURL10BMLreCwmNrK2c+SVDNma9CEgKoPeWpeXS4Dtfjcr7DRXw/5I
         R22ChlayhU94emhkIFIMNElmKGF4HJbaff2HtFXiz2ZXhy5tspL9shNNfuFjMpURLrzh
         TvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761245041; x=1761849841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FILWuJP7z4ne8yyln1112yG3l4Q4g1VKcs5bhTHsJnM=;
        b=kv6mgpdL+8m8bNms1d91E9yg7MrFwUoieJGxxNnXCyD+ukaUXwxzoW/sstt/n4RyGQ
         APEXzhASjMnSk8ShneIkchEz6d01fn1BPsN0tU9uNHKcHDwgZqSfkiTeW0m/Z1IWm8mY
         cXwif0+QMUBUaDTqgotrO731l9w8M6alaBDMkTWJzU33XocUeHJSgDnx4gwbnpMc4A32
         VhCmg9r6HB9gx9DTzXFY8zUXA2EVry4dKhkqvrdSc477KmQZIf2w3uApzUzI89dAvRaK
         yEHa0y2ibAsPmDwVmnfPi4pD5t65FAzMPNO7eo8NEwoUGG1Fl1fkBGGkeNypzvOpgGpE
         Cu+w==
X-Forwarded-Encrypted: i=1; AJvYcCWWZZDggvnHFJOJafD2wQhhuYM73PQhTVVQ1giHVm/XOKd5SRniMwkeTRcuAVexSb3Uglcfn1VO4uZtXLkI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ZpBi3rFMddD0smHumatg3OxTfXBVkdoa9PPusXzoNkw4FNty
	YjgDzwuhRS7Zykq22L1jhvOwtYRsbiJ8b9S90IgRhQgNUzVf/krNHSS27aZIN/I2o9GFnnsg5IH
	k5yauHiHdcKsCsfliWXKiCe20qOdA8K2wGCMnGaOEkQ==
X-Gm-Gg: ASbGnctJ6Hg0vhlFYpLL4GtiFNGjirBw6sGDo3+rb5kKaXpHGPsTLEICWQedMimtfJ6
	4o8xHCVH6sgb48A8C2spXX5ylIBWQOMttI36Qwg18SvBjXN7sHDmQx0S42vghwegZHkDzTqkJ08
	Mt6YlLuP2a7FYBld7nbnQwhEXEPfYxJjb+UK8ig9A4nIcDhzCbcXhcuz32wtA0pJZbzr6STbmQG
	enaWWD1mJIZpFiPtTWxOfU7bNCF3cU8Kat50M/d9L5ruD78wSqTTba4kHQoKe3KMx2N0NzDXmBq
	1alU+u8RKHMny0WtTyLKd912Cg==
X-Google-Smtp-Source: AGHT+IHraJus61bT3Hr2N07s+Ur3YCVMAET0C9pakpGhymtxfywdhGOWwy5gv3wy+GpPvNZ0Z7OpA/pQbI51BbDb264=
X-Received: by 2002:a05:6512:3b1e:b0:58a:fc55:883a with SMTP id
 2adb3069b0e04-591d84eb531mr9214189e87.4.1761245040819; Thu, 23 Oct 2025
 11:44:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org> <aPj3fCYj-NQdDSQT@smile.fi.intel.com>
 <CAMRc=MeSFKRo1rHq5ENzKqws+gOAX=-nCsGtw5MXvsOwJr=XpQ@mail.gmail.com> <aPkQi_Zn-17JKG0s@smile.fi.intel.com>
In-Reply-To: <aPkQi_Zn-17JKG0s@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 23 Oct 2025 20:43:47 +0200
X-Gm-Features: AS18NWCf9BHk3M78U-yTtMgDQhhnI1g2CI7k-KfJvPnPOvApY9tkkzNXTL8vud4
Message-ID: <CAMRc=Mdah6ve68h=d93VHXGij7KAQiGWuOGtzX_7VSPsCi=bbQ@mail.gmail.com>
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

On Wed, Oct 22, 2025 at 7:12=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 22, 2025 at 05:36:33PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Oct 22, 2025 at 5:25=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Wed, Oct 22, 2025 at 03:10:40PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > > > +static void string_test_strends(struct kunit *test)
> > > > +{
> > > > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "bar"));
> > > > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "-bar"));
> > > > +     KUNIT_EXPECT_TRUE(test, strends("foobar", "foobar"));
> > > > +     KUNIT_EXPECT_TRUE(test, strends("foobar", ""));
> > > > +     KUNIT_EXPECT_FALSE(test, strends("bar", "foobar"));
> > > > +     KUNIT_EXPECT_FALSE(test, strends("", "foo"));
> > > > +     KUNIT_EXPECT_FALSE(test, strends("foobar", "ba"));
> > > > +     KUNIT_EXPECT_TRUE(test, strends("", ""));
> > > > +}
> > >
> > > Have you checked the binary file? If you want this to be properly imp=
lemented,
> > > generate the suffix. (Actually making the function static inline make=
s my point
> > > really visible)
> >
> > Andy, this is bikeshedding. This is literally the least important
> > piece of this series. It doesn't matter for the big picture whether
> > this is inlined or not.
>
> It's definitely not a bikeshedding. I try to keep a bit consistency here =
and
> I don't see the point of bloating a kernel (binary as well) for the funct=
ion
> that just a couple of lines with simple basic calls.
>
> Also note that with inlined version strlen() for string literals will be
> calculated at _compile-time_! This is clear benefit.
>
> Really, library code is not as simple as dropping something to somewhere.=
..
>

Ok, whatever I'll make it static inline.

Bart

