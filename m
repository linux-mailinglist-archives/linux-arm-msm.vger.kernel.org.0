Return-Path: <linux-arm-msm+bounces-27407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A312994112B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 13:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FACC282113
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 11:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DB21891DA;
	Tue, 30 Jul 2024 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gU3vBD83"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CD118FC6E
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722340305; cv=none; b=J0dnODHaWH/kXbi4GGj8JE17T9GkeVHnUUQvw37KdZ1ytFX75pEmJTMb1+dxqGkijbDKa0oOuga0D/pFtO8+GmxMkwX60nPrthooIEQ5WpFddTAfyEKAhAsSv0UWt3P6FuxhT/r51qVrTJr95ADB1OxSUWMICF61JrWhrm6k0Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722340305; c=relaxed/simple;
	bh=/LxOA/sf8jUq2ce1URddnOWOpBaWlE7GJFwaYB1FXgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3dEam2kqQmdtY4wznW85SisIWifQBqSMrTImU8LlhvwkKy8BuVTNV3qq4Hbi5mR0aWMtrwIguE/Yq2apx2mnXyEybmoG/AsHINeWA9j0wSO8GmpZuph0bou6qhb2+f9cq7POfsJLX42++eC/FgM3Z5YOwkRBRhn98NbX4hkots=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gU3vBD83; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f0271b0ae9so56967901fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 04:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722340302; x=1722945102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mj9g02teE95oWkxud71FxjRcOnjoY1sRk9LiH0FRY4s=;
        b=gU3vBD83mlKqPTQDWCA65w/sZ09PWnBC06+eKWi+7qg3yKO9jaU8b35MxDfo3LKYyT
         r+I+1E/Ff1/0ZylDIHOv4uWZsQJgHUKOEUgHJBGeglv4roRcrEVPyGd2p2L1UsuaSgQ1
         iJr7ynBRkO5ypG1BhijYiq5J13YmqbA1n2GRDS3CBZwVW3zd9G2CHm9MYZRE7FJ5qhXL
         0PtNyvwollqkxS3Dtol3EWkEzmAY6TvQnpAmFRzfHoMuEoeBQJyLI/I9FVF5VfQTCT/1
         0aNkPNtBI/CpMNeweDN/oZYUrlieaet9rPiJFR+LQlTzltn4/G42eg0dZbmdAfuDEy9y
         wiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722340302; x=1722945102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mj9g02teE95oWkxud71FxjRcOnjoY1sRk9LiH0FRY4s=;
        b=vNA5dEfUgEa/lSFy8cqz4oc3HoHaV7aBGt8/riLnZ7Gw6F8XrtGWNjMtxj08pESvNk
         kCsKDTO17IR7pIuB3zr6gmP2Q54zua+f3QcfQDXANbXtRkOHdvCukIn2JDkNn2U/n1qY
         5xc5t1dJjk6JV8eArB9BIzL7+Z2Onn5JStEM232DE1+yFiXtjzb8KBOVCQyWnK99+Ur7
         7teYOf1bXfxfXyF8CWI6NXstb9/dOSQvtW0FD0e432ryWj78ck/dCxOJ+dVrOReJs42l
         Fd9j9RpFTKjFTECe756NBiOOgQsLN7+dPq94vn9B/Ip1ni3WesyCYBpNQG5aVxety2WZ
         3AtA==
X-Forwarded-Encrypted: i=1; AJvYcCWFtwmuWgZv97/htJu2Os1f9c6JNb3oQSxgxmkQW4RySZMVrvuvx/2UWLtuKxgolqGsguFhDaR8o7v5UYRacLEZt5Qh1bU4QhC9KF3Yqw==
X-Gm-Message-State: AOJu0YysbeF/Jv+Sy0WeaF7icItPa4Eop1x+9f88D9kYRNwUIRLaGNaN
	dUGq5DhDg+RcNAMopLWhBI837/7VRmdNVEL00vLzpKqH2hEf6GG8QqZkv+Yo7qYQkNt/xTD9wOI
	etFovZvafubHfajEufarh6Sjp4QOY2LR3QoCivg==
X-Google-Smtp-Source: AGHT+IGKbiw+jL9QwWM+pv2VMutUmDfrKG8cwt2tgt9Gcf3IMi7/XSU9egzEdXOKkg8uxDSXz6DRPDTvLA5vScLpLBk=
X-Received: by 2002:a05:651c:1541:b0:2ef:2d3d:3cc3 with SMTP id
 38308e7fff4ca-2f12ebc95b8mr81065521fa.4.1722340301491; Tue, 30 Jul 2024
 04:51:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729095542.21097-1-johan+linaro@kernel.org>
 <CAMRc=McuqEv1Sk9O6kn4aHo9wOfzskZS0z2QxzNM=q2N8XZ3zw@mail.gmail.com>
 <Zqduv66H2OczRgaH@hovoldconsulting.com> <CAMRc=MfEkPcKUNb7HbiNrqv+7q1n0wRD9sKQ8WrydoR4grao2A@mail.gmail.com>
 <ZqeP7CqEoC5iWAdL@hovoldconsulting.com> <CAMRc=MecyZU6DBWjg7vtohhxtVoaOR6jCRHdEiAKinqvmEtDyQ@mail.gmail.com>
In-Reply-To: <CAMRc=MecyZU6DBWjg7vtohhxtVoaOR6jCRHdEiAKinqvmEtDyQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 30 Jul 2024 13:51:30 +0200
Message-ID: <CAMRc=Mcwe0nV=pgfk=Wezq5eopJiZZii=BZ162QknT0t1Uf9Rw@mail.gmail.com>
Subject: Re: [PATCH] Revert "firmware: qcom: qseecom: convert to using the TZ allocator"
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Amirreza Zarrabi <quic_azarrabi@quicinc.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Elliot Berman <quic_eberman@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 1:35=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Mon, Jul 29, 2024 at 2:49=E2=80=AFPM Johan Hovold <johan@kernel.org> w=
rote:
> >
> > On Mon, Jul 29, 2024 at 02:35:39PM +0200, Bartosz Golaszewski wrote:
> > > > > On Mon, Jul 29, 2024 at 11:58=E2=80=AFAM Johan Hovold <johan+lina=
ro@kernel.org> wrote:
> > > > > >
> > > > > > This reverts commit 6612103ec35af6058bb85ab24dae28e119b3c055.
> > > > > >
> > > > > > Using the "TZ allocator" for qcseecom breaks efivars on machine=
s like
> > > > > > the Lenovo ThinkPad X13s and x1e80100 CRD:
> > > > > >
> > > > > >         qcom_scm firmware:scm: qseecom: scm call failed with er=
ror -22
> >
> > > How do you reproduce this on x1e?
> >
> > Just boot 6.11-rc1 and you should see the above error (and there are no
> > variables under /sys/firmware/efi/efivars/).
> >
> > Johan
>
> I'm trying to figure out what the difference is with and without
> tzmem. Surprisingly the physical address passed down to the SCM call
> is actually the same in both cases.
>
> I figured that maybe using different struct device for the underlying
> dma_alloc_coherent() would be the culprit but I checked and no.
>
> I'm still on it.
>
> Bart

Nevermind, I found the culprit. I will send a fix proposal shortly.

Bart

