Return-Path: <linux-arm-msm+bounces-83919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5724BC9593D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 03:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F404B3A1AB5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 02:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF32146D53;
	Mon,  1 Dec 2025 02:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJvtvl5a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6343421348
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 02:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764555927; cv=none; b=lJDSJEY/kseXovObYhFvF/pXwdRVdDs9APFB77YBzAkrr2YZov3cYqWCxj7yNI+2cQzLCIUtUZuqH6YkJZmF371CwnLZX9AH6VddZsKiUoW3eHO+ZOazpYWNlTd9PSgNdZKPch6WbU4H9v9XjcswqgLTffs8wb1eT8p7L4CIZc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764555927; c=relaxed/simple;
	bh=om49OYvgDAfSrmmC6qejgj5k+MoC43n1qX8G7M9zkB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IeWAPreSmBBjHTd0AuEQJjfXo9WrNIx1QI/Yvl/ELZGdP6phP18fD/SCYKegkrx7lA/UBYeCGZbE4VXe6D3LMfN7uepmq96onzSY/9n3zKU6onf+vmcHKzLmKu6yMglalBFLVmM2nxLR2hRoMH1lMKy1Ih6ubk5z4eej/VFL2E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJvtvl5a; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-63f97ab5cfcso2797910d50.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 18:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764555925; x=1765160725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbiDFDafiEp67ttSmcQHfLRRWo+MM5BzHhb0MRB/fnI=;
        b=CJvtvl5aewt1J4Dq26ZECCcCvfx8s/jpLUKMBJtzNFHFD38/90d2bEevNZYTqAc+Uy
         0uH6afKPBDH8cs7GH018fgmdVl6v7Frrw29oKAqZ0+HV5iCWUCfSGjH2qU1Fcf/9kyiQ
         BTWEsjTiKZNWKJ+sSkQ7vHAAgvwwLwqOVkGFdBIZ1/k01YIFEiQITKmKZ9ZCh9FmkXop
         mhffQP/IGt9lS4RqLKwAtY8UmZ2YRMQYnJR4n2JtGBir9sE2sl43vrDo1XqMS+bdbUpU
         gyq6KY8KIj4LhO/5hLo6AN7WuulRoYvfLieJm3ma+YOSJb+jF8qeT2pj8jcEKGp4eE2f
         iqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764555925; x=1765160725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YbiDFDafiEp67ttSmcQHfLRRWo+MM5BzHhb0MRB/fnI=;
        b=ZR68q8tU9rMc/So8HXnoC3uQX9eBP20HlR94zAVNFsMGBWehJzuLmT8b8Iva8wBQ37
         AAYa2zkIVSkkcYTpe+IBPSnAyRcdWUr44KtmmBOn6aO/a+6SKxPyA3JqkRHUZtytBx7J
         OjGxO8C5JEWM/PGqyqNCJoKQRIT0Fuw9BjAWbxVYfVUM2iSRhoVPWEax7iaCj7UZxH2q
         6V3LhDqe+ar7meRB/YCWK1+NXKuw89dZB9s5cLMkS0adP0ewrfK9UUVzIboMU5hhxU2i
         vLHAfxJjMnYFK3Kzi5fUldkh/naquh076Z3YZQReokdQrb4SeAwLE622lYjOW9MiW7+r
         J45w==
X-Forwarded-Encrypted: i=1; AJvYcCUFYJXZJZ/nWwK3fjiwk8tU9/QslVVvnBWkUhmNLvSedy8t3m/9RcfB2I8YdNXaCz6FwgAqlDZRQsoi2jU5@vger.kernel.org
X-Gm-Message-State: AOJu0YyM1h74sHjW0/5CLJ0vrivr8zqYjQ4MP/Us2F30CV66HRrzMnJ6
	EQJf+RAVj6wSNjzzpyEeqvjKjKzw8ZjW3oT6hkCgandzfOl9SBqbOertAtOGkZZ+x1blZqx0y48
	SQdAuihADByae2NHgBUr8TEcmEjUIgCY=
X-Gm-Gg: ASbGncsvaQJYc/DhHc0rnCNPjmnWHi3s+yTejqrf734p9kkYTxO0lnB91zhek15mSfn
	x20HKpY45B6reF/CVCjXREUNl5YhZikFGt+b5FgV/b6unqzqx0mvnqiSaaxgbRRCa79bwDBEioL
	3P3Ta4WU7SwCDhuwPURvsUHTj/gbrxrfV/y41kJ6va/STwOFEcj3+t5EFPxgvaq1Icjpn4PCOyv
	v/PAQpwnfcjDmnxO8sSQAJlBACGQsmhOj/eYZqoPJ8WFZwR1hcEbdoplEFSBDhN793MIqNx3OaV
	GnelFSQ=
X-Google-Smtp-Source: AGHT+IHNrdBTSsVZw1TVMN6aUclbLeTK9pfKC0PQSp7u6i4tFVERxY4MvuCzD/zi6W+3QTtsOjlisTpAKjTSyK6idr4=
X-Received: by 2002:a05:690c:260a:b0:787:cad1:bdbf with SMTP id
 00721157ae682-78ab6f7f310mr185477697b3.53.1764555925356; Sun, 30 Nov 2025
 18:25:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <35615ad4-5b86-577f-4695-c6cd85206334@marek.ca>
 <20251201001353.9852-1-threeway@gmail.com> <4e3c1c5d-fee9-d4d8-8b06-d33210c5819e@marek.ca>
In-Reply-To: <4e3c1c5d-fee9-d4d8-8b06-d33210c5819e@marek.ca>
From: Steev Klimaszewski <threeway@gmail.com>
Date: Sun, 30 Nov 2025 20:25:17 -0600
X-Gm-Features: AWmQ_bkIJ2Th3UmmrTX0Dkua98Xe2UIze9xOsU13YQ3ZW2NZe4Hpii3OtfGV0FU
Message-ID: <CAOvMTZhartq70YBCkGHbNNYd4MK1RqCjwoV3-WhrHoEqEtgLTA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
To: Jonathan Marek <jonathan@marek.ca>
Cc: abel.vesa@linaro.org, andersson@kernel.org, christopher.obbard@linaro.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, konradybcio@kernel.org, 
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_rjendra@quicinc.com, robh@kernel.org, 
	sibi.sankar@oss.qualcomm.com, stephan.gerhold@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

On Sun, Nov 30, 2025 at 8:07=E2=80=AFPM Jonathan Marek <jonathan@marek.ca> =
wrote:
>
> I was curious about this so I tried booting EL1
> - 32GB CRD boots fine
> - 64GB T14S boots with CONFIG_ARM64_VA_BITS_39 (except display driver
> didn't probe, because it depends on adsp firmware, lol). without
> CONFIG_ARM64_VA_BITS_39 it resets

Weird, I definitely have CONFIG_ARM64_VA_BITS_39 set here.

>
> Anyway making things worse for "64GB+EL1+broken firmware" shouldn't
> block this patch, because "64GB+EL1+broken firmware" needs workarounds
> anyway and this change is needed to use 64GB without issues otherwise.

I'm not sure I follow this logic; most users when they first get the
system will be stuck in el1 until they get el2 set up, which also
requires workarounds in order to set up.  I don't at all disagree that
the fix is more correct, but I don't like users having broken things
just because the vendor hasn't fixed their firmware yet.
Additionally, distro kernels will default to BITS_52 for arm64
kernels, not 39 because most of them run more places than just
Qualcomm laptops.

>
> On 11/30/25 7:13 PM, Steev Klimaszewski wrote:
> > Hi All,
> >
> > On my Thinkpad T14S OLED with 64GB, with this patch applied, I am unabl=
e to boot
> > the laptop anymore.  It doesn't matter whether I have mem=3D30GB, nor i=
f I set
> > CONFIG_ARM64_VA_BITS_39, or not limiting the ram - shortly after loadin=
g the
> > device tree, the laptop just resets.
> >
> > I have tried over 20 boots with it applied, as well as trying both boot=
ing a
> > working kernel, and then rebooting as well as cold boots.
> >
> >
> > -- steev
> >
> .

