Return-Path: <linux-arm-msm+bounces-9222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 002AF843DBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 12:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9D1C290A83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 11:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B29279943;
	Wed, 31 Jan 2024 11:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="joG4RRyh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1187BAE8
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 11:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706699068; cv=none; b=Mf+rO9lWvWb0YE5rM27ExkMuPiCXP8VTjoI7l6gyoiG8yvXQ1Ka8q1iPS8rPlCVN99YPdQ+c4wFkRQOlTB7hTIw1BE6sSsMkUc+CItcZp+zoHp9fhfsP6sgY+CS9icGK3e+Y4Lx94ziMV8igVsGl7ILCZMeulu/RKkd9XdfUmvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706699068; c=relaxed/simple;
	bh=o/Kom3bZBaVWt7LhWRqqnq1GfgqDQALX9EwXOIxB6jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWcgcQyGUJwEXs+Dok4WB7EVUNOFVF9aVz8viXLRuwEitCR2uXVEVve5obkXcs8stJcHbBowGfQ4UEmpquG2/p1TK7CqsR6UlgocHJS3WQGzrKYePcvz+Ur5gIVDb04t3S9p2hJguRkwusZG53Xc+Jt+fry94wZIgnDF7tAm/bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=joG4RRyh; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4bdc3d5512eso511028e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 03:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706699065; x=1707303865; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2HD72KRJ6aj0nhRWc+R0OuPJi8YzqJpg5vATYXzxug=;
        b=joG4RRyhkYtmVlHszov1Xox8vEMUQb8ETUKWjt6HhpjDFqP2olRzg4/hRz8ptLbAqE
         69eBi3g1/Mub7xPrWsIYHluCI+nkVKTjauRW/UT5YjGl3njyqN/fxeVvm0B5vUPGjGLJ
         2SD+uu7O3Rb8hX2N+f0WaOhfE0HNR6+9VwGbMfioRNe9JdjDxsL9cT/nW1TQz6W0qggD
         eJBmVMDat/iQ4SkLtPLjxAXqkZ6rt4YiGWSOhjSw8IlCtaxnV0eWbPXFYefZsqyJrJ1P
         PhBhfNdhdx5CWzdHAonQu7h/q3dw8IIQqwgZKT0+BnG3oxa37hunJ6QiJCwKah5Yua7R
         TLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706699065; x=1707303865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2HD72KRJ6aj0nhRWc+R0OuPJi8YzqJpg5vATYXzxug=;
        b=jCt8WlZWgzvDBgQP800SXMZGgkaoMbEUCVEUNN5MY99wRQ9EFAJf08uWbUEG6TvtCe
         yE1HMgwPrtofTnBkMTfhqWdvrZnT44wIeAo2Yy+PZJdFe9PamdQv1AOSlc9h5P2MT8WN
         1l2lsReIhyiFFR4AKenA2BEBAQny4OeagkOn094tpyfHam5j5WKGjOTwIvSmgGbqYBXM
         h+SBivjcbkFOk+Z45nnrODzP5/y6bTv21OWxNeTV4eCBZGY+M/vxd6PkTRpLSkgJ6wGH
         BQwGY4QCbeR4gszZtHMLZ9e7lI5e6q3QD32KIZwA9azx0oIhniR+XCjtzBipaGSrSkk4
         wGSw==
X-Gm-Message-State: AOJu0YyGIW4FGYaFdKPTiNmFYS7ghZAVZQGk3fcE8xGlhhAnYLnxtQtw
	cPl/4ZdQ4tUc0PK31/+qiqysDMWp9euqzYF4Q3WOwU3UBxQRlI2DMIPCd8WYl+OEdJ1rEEtz5gw
	YmLq6RUmcXUNRBgRPTj7REbfPfpQCuk79cIKTKw==
X-Google-Smtp-Source: AGHT+IEy0t8aQ/0foP3lUPEuTTrCzJxzcZdG9B4tfmtYi+GsJo9plBZulGoXIEHFkjck4RlX43MJn/wu1f8FAMUSvqI=
X-Received: by 2002:a05:6122:4d1c:b0:4b7:2382:b4 with SMTP id
 fi28-20020a0561224d1c00b004b7238200b4mr2151457vkb.6.1706699065586; Wed, 31
 Jan 2024 03:04:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240117160748.37682-1-brgl@bgdev.pl> <20240117160748.37682-5-brgl@bgdev.pl>
 <2024011707-alibi-pregnancy-a64b@gregkh> <CAMRc=Mef7wxRccnfQ=EDLckpb1YN4DNLoC=AYL8v1LLJ=uFH2Q@mail.gmail.com>
 <2024011836-wok-treadmill-c517@gregkh> <d2he3ufg6m46zos4swww4t3peyq55blxhirsx37ou37rwqxmz2@5khumvic62je>
In-Reply-To: <d2he3ufg6m46zos4swww4t3peyq55blxhirsx37ou37rwqxmz2@5khumvic62je>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 31 Jan 2024 12:04:14 +0100
Message-ID: <CAMRc=MeXJjpJhDjyn_P-SGo4rDnEuT9kGN5jAbRcuM_c7_aDzQ@mail.gmail.com>
Subject: Re: Re: [PATCH 4/9] PCI: create platform devices for child OF nodes
 of the port node
To: Bjorn Andersson <andersson@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kalle Valo <kvalo@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chris Morgan <macromorgan@hotmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Peng Fan <peng.fan@nxp.com>, 
	Robert Richter <rrichter@amd.com>, Dan Williams <dan.j.williams@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Terry Bowman <terry.bowman@amd.com>, 
	Lukas Wunner <lukas@wunner.de>, Huacai Chen <chenhuacai@kernel.org>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 10:54=E2=80=AFPM Bjorn Andersson <andersson@kernel.=
org> wrote:
>
> On Thu, Jan 18, 2024 at 12:15:27PM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Jan 18, 2024 at 11:58:50AM +0100, Bartosz Golaszewski wrote:
> > > On Wed, Jan 17, 2024 at 5:45=E2=80=AFPM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Wed, Jan 17, 2024 at 05:07:43PM +0100, Bartosz Golaszewski wrote=
:
> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > >
> > > > > In order to introduce PCI power-sequencing, we need to create pla=
tform
> > > > > devices for child nodes of the port node.
> > > >
> > > > Ick, why a platform device?  What is the parent of this device, a P=
CI
> > > > device?  If so, then this can't be a platform device, as that's not=
 what
> > > > it is, it's something else so make it a device of that type,.
> > > >
> > >
> > > Greg,
> > >
> > > This is literally what we agreed on at LPC. In fact: during one of th=
e
> > > hall track discussions I said that you typically NAK any attempts at
> > > using the platform bus for "fake" devices but you responded that this
> > > is what the USB on-board HUB does and while it's not pretty, this is
> > > what we need to do.
> >
> > Ah, you need to remind me of these things, this changelog was pretty
> > sparse :)
> >
>
> I believe I missed this part of the discussion, why does this need to be
> a platform_device? What does the platform_bus bring that can't be
> provided by some other bus?
>

Does it need to be a platform_device? No, of course not. Does it make
sense for it to be one? Yes, for two reasons:

1. The ATH11K WLAN module is represented on the device tree like a
platform device, we know it's always there and it consumes regulators
from another platform device. The fact it uses PCIe doesn't change the
fact that it is logically a platform device.
2. The platform bus already provides us with the entire infrastructure
that we'd now need to duplicate (possibly adding bugs) in order to
introduce a "power sequencing bus".

Bart

> (I'm not questioning the need for having a bus, creating devices, and
> matching/binding them to a set of drivers)
>
> Regards,
> Bjorn
>

[snip]

