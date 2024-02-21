Return-Path: <linux-arm-msm+bounces-12091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8741085E6E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 20:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4194F286F46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 19:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC07D86126;
	Wed, 21 Feb 2024 19:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0MVjdiRF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EC48663F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 19:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708542409; cv=none; b=UiTESFXQmXevAn4DiA/zxVEqKJbTHzxyjgaBQYhVmBLcE/UrZT/gE6Qe6dcEM4eEjeGhsWDQXTg/pOvoEh12YZpFES8tzbKiZRbd7zevEVIavNdlBqEBRJ8rVKhKZ4Qdx7FU4GUIwRNZuGtq44HDlVVSPf1bxkQo7+g4OR3YCf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708542409; c=relaxed/simple;
	bh=kcfco0q09KRbXlbQQeEDNzewpUTgOtWvGAGR2Dj8574=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Apixow4fQBL95NoevAqc3guQ7r0XS4IZzRyGDx00HyJ4/3m7TexjgF/1Ejqf1vt1EZu9OFuuKFWkj0YTRqw5tYDxWFogfHnfRvtoCmxVCa/E0ICZt+OzWqatgBoK8eSWaMSOosVDmGT2bOjwZXc3q4fKEi6njwugxWVchYXt3Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0MVjdiRF; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-21e65a6b7f0so329697fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 11:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708542400; x=1709147200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcfco0q09KRbXlbQQeEDNzewpUTgOtWvGAGR2Dj8574=;
        b=0MVjdiRFkK7iaxkbtqqYFe4yEIBb5PtoEdcjfNuNrtwvD9SWc3FAaqy9sVMbI8Mde8
         2EapIlpHpLt72GZBsAOrp5Nr24Z5yGC/Y1fXNy44pHhNx5p6SlqJMMk+CEesLgkfndFT
         eHiT4H74uIxvWvxPava3MyhT2pjFFoqbKxhBh42yrGzKK4ZzHe/V5Embc8NxkBjINGu2
         sp72CwsCNiq1hkr+dpUIuZ6SzZ2VsTYdZ1kC8BGNFSy+eBvQJlGlzmy3kAhpXcuqNa3K
         kuUouSdlBbHF0WaSzKmiF65ROW2yt9xaxJzx/4BwYcWktMKzcWluic5FEBLwaBlnpWk1
         M8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708542400; x=1709147200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcfco0q09KRbXlbQQeEDNzewpUTgOtWvGAGR2Dj8574=;
        b=kZpNcS9LsISRF4LbRgAEtQHrqdxkHkGP9NHqvhHPe/3X4p/ui0vrPg6hFXJusP3Shk
         JSAeacrcTpWD9c+wTqixR0Kc1+LeAncQZwv1EA9iNmn/WsTefVKkOSQJxVb12EI/uEF2
         2DId4M1BfICf8eFAB3V6MIlW25EWudXDCil9inqE66z9RPhITyEgJyAQBzqBaaYwTARo
         h38nf2lRdPkqUA3EE7lhg4cFIBtyemESGrmNkKJYO4tqukF2Xtxt9n4Liv5k8o6c2qOb
         LGMyumZ8sSqorpkaYMWQVYgFvD/+zMNTeUzgtHWiBighYnUCNgfeNmWRdJqYcBPsWa3B
         5rsw==
X-Forwarded-Encrypted: i=1; AJvYcCVw9WtzzRJIHTIA4QH1ZdeZpEXgsuesneZK/0YXeC7v/C+Tzuv/zbmU29J8a8b500UZJoXLoPu1/3GsCapptQBDmON2P5Lcdg4sOlwi5Q==
X-Gm-Message-State: AOJu0Ywpcn7G8ppUCNazGQnbsP46aF1JqduNaX2qo2GL2yApfgISc4YK
	Tdi7hOxJe1B6zuCDVXmnwIbZKFpKnYsMuOOCqbwu0OMazl99sL6QLoNs+HX7X5RLvxIEBuqZ5Jw
	2nhjevGXHKeuxlVDcZRoINBjEcrqBwneEoLSGaA==
X-Google-Smtp-Source: AGHT+IF1SptazV6aoLbwXb6AsvXsynwnTUX/SLIVAEokAiWCqUDqLcGdMHsf9bAktVT4a5reeZ9YGl9B6Z2G2u09Xx0=
X-Received: by 2002:a05:6870:5b15:b0:21e:5f83:e698 with SMTP id
 ds21-20020a0568705b1500b0021e5f83e698mr14255030oab.52.1708542400397; Wed, 21
 Feb 2024 11:06:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205182810.58382-1-brgl@bgdev.pl> <20240205182810.58382-11-brgl@bgdev.pl>
 <7pybw4wxlzxfl65yuqxzks5w7uq52hosyq53etlzas6i6o5l6d@vxd4sykcxora>
In-Reply-To: <7pybw4wxlzxfl65yuqxzks5w7uq52hosyq53etlzas6i6o5l6d@vxd4sykcxora>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 21 Feb 2024 20:06:29 +0100
Message-ID: <CAMRc=MdAG7jehYbF1ZuEzpK5x9QpHNTvzxc6C=5wkCAP3OhGcQ@mail.gmail.com>
Subject: Re: [PATCH v7 10/12] firmware: qcom: tzmem: enable SHM Bridge support
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Guru Das Srinagesh <quic_gurus@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Deepti Jaggi <quic_djaggi@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 18, 2024 at 4:41=E2=80=AFAM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Mon, Feb 05, 2024 at 07:28:08PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add a new Kconfig option for selecting the SHM Bridge mode of operation
>
> The Kconfig option is the least significant bit of this patch. I guess
> there isn't really a problem to describe, but let's at least mention
> that we're switching TZ to shmbridge mode and all.
>
> > for the TrustZone memory allocator.
> >
> > If enabled at build-time, it will still be checked for availability at
> > run-time. If the architecture doesn't support SHM Bridge, the allocator
> > will work just like in the default mode.
>
> "default mode"...SHMBRIDGE is the default mode from this point onwards.
>

Well, it is starting with patch 12/12 and only with arm64 defconfig.
The Kconfig *default* is still the regular non-SHM bridge pool. I'll
work on the naming convention.

Bart

[snip]

