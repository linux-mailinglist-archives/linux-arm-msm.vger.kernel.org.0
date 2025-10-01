Return-Path: <linux-arm-msm+bounces-75696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB80BB0ABE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 16:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E5D93B1B22
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 14:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6838D1ADC97;
	Wed,  1 Oct 2025 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p753WmTg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436AF2AEE4
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759328355; cv=none; b=Va683Hf8ri6PPrkaDshMxfZGllfWR0RQ3atww5gQDRxdtWWMm0+NzWxdIuxxpv+9DKIcSiLnk6ySgFwLmTcRMHg3xkyg3mq5TW7yPfGEaOLlx+wB8gKj0IJy+NpJb3SlXcYa3jcoQ846CG8AS7hlarKMhWAIzn6YVU8z2j81MZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759328355; c=relaxed/simple;
	bh=yMblZnDjqlbOR4ZLBbmTC5UUDDnK/Eg2kXIyzuIRACE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTb+NI4mMQh/372n4qsn+Idw4ylUqwdN/FiBC+O1vT4YRj4EtXYUcnvB/C+hI1mfay70p8ol98b8CvdQ1WUHHi0Z2lnjqmwcragxbFBlI798rEUwmceCMdtfzv3nxrHGvdN/w9ewegOOUYMPXENByMqouac3Px6HmfA2kvasG+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p753WmTg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2334FC4AF09
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 14:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759328355;
	bh=yMblZnDjqlbOR4ZLBbmTC5UUDDnK/Eg2kXIyzuIRACE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p753WmTg2pMUqfgH+1weZ5z+4hJWHKycasXcafvyOFQfcxS/vbHQXtBv//tOGA8SY
	 G7oNIwpa8EJNfeeaYiO3TMP0Z0HeITObbwTEUJOGvyx5aj4+P7GjLk3G7i5iPA51l7
	 giPY7RTis9f7xeWjjdYewAe7Ot8NwgYrH+nL5+p5oNnp8EOSHWoJKmpzHtFUIFRAze
	 84pvlGoMftDJL5rSWA6etnuLNLRrkFNj/szH3fZPYLW3YMZb+OvF9j6tUs18oMv23H
	 Ye4LhkzPkPQBMr/7psdxU4rSZvJ6uL/sywIAa4u3C9atnKL/OfZNEDBHcYr5kNCWAR
	 3E/4nyp49nQrA==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-62fc28843ecso10036158a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 07:19:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXHBOdBrB/PQ7wl1vEkqnCZeaBO8lanVnZ1nLMZpigHvfLMs1jzZqlfXbIqznJh3c2X2h/ETM9YAS5vAQLa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7V3zzSW6EUAWWJ7neeG0l3qlHaSYq3F2GWWJ5SxWsZ33T0oIi
	sJtx5+kQ0prHISlbZ8Nt53V8dcXjZRb1cEJua+QXN6QEdj5Xy8HQGLRPRVzL+olmZX8QD1Qxjd1
	4W8Um3C0V1H7u+D1KNHzPl5++7gc6fA==
X-Google-Smtp-Source: AGHT+IEib3WTgGYwGHEPa4ulr4/SbwtLGnJ8FYdVRNdQ4ERtJxf58Nv2Gj/CunqC+JHaW9i70nNh/81x9NCsd62GAPA=
X-Received: by 2002:a17:907:94d5:b0:b3e:580a:184f with SMTP id
 a640c23a62f3a-b46e0cb30f8mr494888066b.4.1759328353696; Wed, 01 Oct 2025
 07:19:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
 <CAL_JsqKG+dcMgp1QF4F3Oxh5Shvagg6cSde=g1JMcEAquZhH_Q@mail.gmail.com>
 <990cb5af-3846-44a3-b373-ded62d3309b9@oss.qualcomm.com> <CAL_Jsq+zC91GPdzQQa9F8KEw5UL4xc13u5U_5vTyQG1WeJa5rw@mail.gmail.com>
 <82906e08-9583-4f4c-91ad-d5b53b2dffd6@kernel.org> <CAL_JsqLtLbCqzHzcaGAuYwxqr=e9HZFX8X20tndx7US-XjhH3Q@mail.gmail.com>
In-Reply-To: <CAL_JsqLtLbCqzHzcaGAuYwxqr=e9HZFX8X20tndx7US-XjhH3Q@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 1 Oct 2025 09:19:02 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLcinpeJyib+JG7UFspUqXDTzCLguF3Nt4JJY9YncTb9A@mail.gmail.com>
X-Gm-Features: AS18NWA7ezyHf-quZ8SAVzOquJtCbJ4iMZCy1XnnFDJCGg9M-CxsvZzGUG7jqiA
Message-ID: <CAL_JsqLcinpeJyib+JG7UFspUqXDTzCLguF3Nt4JJY9YncTb9A@mail.gmail.com>
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
To: Srinivas Kandagatla <srini@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+Greg

On Fri, Sep 19, 2025 at 12:25=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Fri, Sep 5, 2025 at 12:30=E2=80=AFAM Srinivas Kandagatla <srini@kernel=
.org> wrote:
> >
> >
> >
> > On 9/5/25 12:08 AM, Rob Herring wrote:
> > > On Tue, Aug 19, 2025 at 8:44=E2=80=AFAM Srinivas Kandagatla
> > > <srinivas.kandagatla@oss.qualcomm.com> wrote:
> > >>
> > >> Thanks Rob for reporting this,
> > >>
> > >> On 8/19/25 2:35 PM, Rob Herring wrote:
> > >>> On Thu, Jul 24, 2025 at 8:28=E2=80=AFAM <srinivas.kandagatla@oss.qu=
alcomm.com> wrote:
> > >>>>
> > >>>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> > >>>>
> > >>>> Qcom Slimbus controller driver is totally unused and dead code, th=
ere is
> > >>>> no point in keeping this driver in the kernel without users.
> > >>>>
> > >>>> This patch removes the driver along with device tree bindings.
> > >>>>
> > >>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualco=
mm.com>
> > >>>> ---
> > >>>>  .../bindings/slimbus/qcom,slim.yaml           |  86 --
> > >>>>  drivers/slimbus/Kconfig                       |   7 -
> > >>>>  drivers/slimbus/Makefile                      |   3 -
> > >>>>  drivers/slimbus/qcom-ctrl.c                   | 735 -------------=
-----
> > >>>>  4 files changed, 831 deletions(-)
> > >>>>  delete mode 100644 Documentation/devicetree/bindings/slimbus/qcom=
,slim.yaml
> > >>>>  delete mode 100644 drivers/slimbus/qcom-ctrl.c
> > >>>
> > >>> This adds warnings to dt_binding_check:
> > >>>
> > >>> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> > >>> /example-0/soc/slim@28080000: failed to match any schema with
> > >>> compatible: ['qcom,apq8064-slim', 'qcom,slim']
> > >>
> > >> Will replace this example with slim-ngd and fold it in the original =
patch.
> > >
> > > Still warning in linux-next...
> > Its done now!
>
> Now I get this:
>
> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> slim@28080000 (qcom,slim-ngd-v1.5.0): 'audio-codec@1,0' does not match
> any of the regexes: '^pinctrl-[0-9]+$', '^slim@[0-9a-f]+$'
>         from schema $id:
> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> slim@28080000 (qcom,slim-ngd-v1.5.0): #address-cells: 1 was expected
>         from schema $id:
> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> slim@28080000 (qcom,slim-ngd-v1.5.0): 'dmas' is a required property
>         from schema $id:
> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> slim@28080000 (qcom,slim-ngd-v1.5.0): 'dma-names' is a required
> property
>         from schema $id:
> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#

Still failing in linux-next.

Rob

