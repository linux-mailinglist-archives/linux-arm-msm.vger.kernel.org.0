Return-Path: <linux-arm-msm+bounces-82709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D68C755D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 17:31:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 64B224E102C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 16:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF55B3644BF;
	Thu, 20 Nov 2025 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJqg5gsj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1863644B2
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763655750; cv=none; b=rAtfsghRW/wQQQOw/EkIXFONqYnTzBcq/pLnWENF6aAa5yjMVyQOQQJSJPpXUVisQhhwkCAYR7DpKZbfZYfr2LnAIlj4ZGTbgPTdQpcqOAFHmEwIwIQacjLUp3yqdJmQByLR/a3J4nEIN/LaK0CaWnqxM6MROlNGd4IHY26fJmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763655750; c=relaxed/simple;
	bh=bi/Po0AgpnEbGaYHxKxOmZ9YXa7BiIdYeqc0S3my3Xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M20pQxpvHkhkuqWvfRXs5TIfkXuBb3PlnyYn7CWrh8l5HEBrJmIvH+MerYobPlLCMQzv2PQ5Iy5Iubh+gwuJQEw2P6z3sywpd6rXj6FnWpISp20WIM+7LnR/C7ILKtTSAZSEkYmn+Y/XtH3PEw7MimMlRoEK9gcxvyMVTY6CtJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJqg5gsj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BF3C19424
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 16:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763655750;
	bh=bi/Po0AgpnEbGaYHxKxOmZ9YXa7BiIdYeqc0S3my3Xo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OJqg5gsj68ksFZN0GbvCUrDOmfrmRxVknpZNcMdToGVZVvl4EawqQiK/RQ7e58ifU
	 vwvTkArvsYgKhaFbPDYTNrAswmZJS94eTfPRPPhrE1hIJ7kn6kr7CgGow1eRsLVwh+
	 Ubqao6grr+Ox/P33v8nvayEXUjcRzbzY/otv9qQWV46zE7hCP268zEkixGSjcQLuT1
	 OM/SURl1hDHKSZYhO5shJ+N0LjpXKnP9vMougYMgUBNotoEzcNREMrmw3cuW13QsDJ
	 nodPtUgFwQD7zQ1PbtHPPWCL9CX+kRLzBEnh0p3TRHH7doP1PaMme5cuOgaUtzKZJQ
	 QD3VK61BRe7rg==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64166a57f3bso1692406a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 08:22:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXryhQ4vG+wb5Ys/3Euh6BbNmiO7tV4PapRAMfTygEDMT3okWPhuN342DMOodCiVh2CXCB1Tem14GWYAmH9@vger.kernel.org
X-Gm-Message-State: AOJu0YzCATdW3zSBfrhxQ/b9K+7MQ6QQssIG7BpiY9dIY4lGzKPyDxzw
	II03fippCvkDLss2MCT0mOVBEgZ4mDJVtAzW17NZ9rdqdyDITn0gYtQhATwk55u05p1bgGhVLCP
	/6c3FYkly3XSlUUrXGDpLngllynIQyQ==
X-Google-Smtp-Source: AGHT+IEWkCgWatcHpdXr/OIRJiRj/QCEmSn/C4yEQfCtXou2e73E372BAB9bX3hhR6qzcGe6jCZ9JRVO/S+7C6PFF8E=
X-Received: by 2002:a17:907:db16:b0:b72:d001:7653 with SMTP id
 a640c23a62f3a-b7654de0b58mr374078966b.19.1763655748985; Thu, 20 Nov 2025
 08:22:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-pci-m2-e-v1-0-97413d6bf824@oss.qualcomm.com>
 <20251112-pci-m2-e-v1-6-97413d6bf824@oss.qualcomm.com> <CAL_JsqKBcXH0EWguto3EFY2cJ5p=8VUZczMHz1u5fNFocv-AmA@mail.gmail.com>
 <cjtnoqjr3v5o64caa6unllb2e2csyvybr6vnzwuqqrl453bgz7@drqmfkfbn5xg>
In-Reply-To: <cjtnoqjr3v5o64caa6unllb2e2csyvybr6vnzwuqqrl453bgz7@drqmfkfbn5xg>
From: Rob Herring <robh@kernel.org>
Date: Thu, 20 Nov 2025 10:22:16 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLoD5GiiGgWTEa6-g8VwyuPTko-ewe5CKPBWMgHDnKaHg@mail.gmail.com>
X-Gm-Features: AWmQ_blvWXZ3OwaL5ikiIPwr7cVeDcTz_uslr7dP8flZZyL49YRBC5MiFZDf9vA
Message-ID: <CAL_JsqLoD5GiiGgWTEa6-g8VwyuPTko-ewe5CKPBWMgHDnKaHg@mail.gmail.com>
Subject: Re: [PATCH 6/9] serdev: Skip registering serdev devices from DT is
 external connector is used
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 7:33=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Tue, Nov 18, 2025 at 07:03:51AM -0600, Rob Herring wrote:
> > On Wed, Nov 12, 2025 at 8:45=E2=80=AFAM Manivannan Sadhasivam via B4 Re=
lay
> > <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
> > >
> > > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > >
> > > If an external connector like M.2 is connected to the serdev controll=
er
> > > in DT, then the serdev devices will be created dynamically by the con=
nector
> > > driver. So skip registering devices from DT node as there will be no
> > > statically defined devices.
> >
> > You could still have statically defined devices. You are just choosing
> > to probe them later from the connector driver.
> >
>
> The point of coming up with the M.2 binding is to avoid hardcoding the de=
vices
> in DT. So static devices are ruled out IMO.

Until you have any one of the reasons we have PCIe devices described
even when in a standard slot. Take your pick. An ethernet adapter that
omits an EEPROM for the MAC address.

Rob

