Return-Path: <linux-arm-msm+bounces-35108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD4F9A4EC1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 16:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE2B2B257F8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 14:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B735186616;
	Sat, 19 Oct 2024 14:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tWh5D1vc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F99170A0C
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 14:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729348842; cv=none; b=KabhaW6qTEaNcfBriSdmBxDO2mpVJoKi5ZdMQd82IF0I+zcPYZvxD/iNHjGFqQbpwYh07uvoM2eUmnMnsVAHEqK0WA5iRKKmYTd6qvAX/B6bi4KXm+5Hf3b4ID2hf+K32M//+kzZcgFdXldK0DsI3SHiVHsBla/V15Sd8jjiRF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729348842; c=relaxed/simple;
	bh=vYcLiI3IuK/ccfFwkPpMjzaA+I7DIut0fI5zAhFMpZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LF3FIUYGjekE4HNCEq5IA+MXaBLUMgHbpkpZQctEbZwIWAI8NuFWtGJNdMbMhG6mYeLv9N6qNHlsGBWHejA/uoroHdTsPqrLZ9Sm1Gk5OdrtIPYUdTpLUdwczTuzkmoU1GRvZTGddqRRX+UJAqjFt57SeJmIUmW6FoZ+lM6SBP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tWh5D1vc; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e38fc62b9fso31632037b3.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 07:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729348839; x=1729953639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAsb3dViYkYUK08mSbBFYucBIF4FBJQvNLZYivX9oYQ=;
        b=tWh5D1vcwYv51Pe4GcctrtaSnhsXBiJeDx7u6Fxxo2v/v3prGPQNMyhdmNvPsREeyY
         IgmxrNlrzH6cQNBHSnayst483JUsiAhLKXG3BpFHXZIh+7J2j9UrOV7ssHUcfvLmFpc9
         GdvEZquxwg0O02c+5HlfRVI2KApS9hQpqpGMJqrjMUToZCYCUTeT+DXMtBIcLXKCByaj
         UOUjSgJEPKSX4K/oPdEijSnvSn6G2geDYnF+k8q77/SMg07AZYOy6PK5e9mQGpxWGVMt
         0tr95A0EACwtnbgtCUJatD9khaoRkTYfejMLod9XU3NjVL9Q0WvyTJ8yZPp9y/6gedpr
         CjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729348839; x=1729953639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAsb3dViYkYUK08mSbBFYucBIF4FBJQvNLZYivX9oYQ=;
        b=CzZXaPKmNOyjW1Kp/tXgmGzuQdSoziuZCtW6ze8c62r3zJnGgsu/GHrRp5NcCxuAfc
         TosoejCHIBWYaD4QXLEkIsbEzMeK3u8ARmCY5e5FN6Mjb7H/Fe060KP1bVNpFeMnQzpT
         nOVaxZID52zvT/faGzahHhCKXMPEJKlFUpILQpKi0nr9yut9NFO69ofAV7c1kopBAt3e
         5jNwX08geZqf+ZtqPxTFIG8e8wY/+F4kcKkLG+NnKn5fJuj2wbxdW+jv2qJvO4aibFq2
         DzftBZjodu1waelaNN61BwL5x90B4fuM+ptR+PqQWuw8xJQ7+Da4yTqFQb1QDMUErMVV
         ky4w==
X-Forwarded-Encrypted: i=1; AJvYcCWvI1sxy+2Rr8a3D0ENHCL7pA96eH71FJu6p6FgW1Bgfz71TV4+jLvn9mdbrLmcgfBC4oOwFh0kpUwGVSzG@vger.kernel.org
X-Gm-Message-State: AOJu0YxtBeeWYQYElPJb0ImY3DtyjUDr1O6NUKTKxTGrqoxYR8ms0RhK
	pQxUF5DGMgpiaWUzI7jHwkdqMLReFYxHjea6nqljSFwgiN869VOu+4ZEYCVIWHU+QqvzAmJkCwb
	D0MpA8B/5UQBBgAVTNQmIBFXY8Qgb+2IB5jkb3Q==
X-Google-Smtp-Source: AGHT+IGqPF1hDI6npb1Ra3kQlC30zupo0zxsrPaYhHn5fC8eWJumubYNVNJKJ67xr80YljK2ct42Xs9mw7+sl7ixqIM=
X-Received: by 2002:a05:690c:60c3:b0:6e2:167e:814f with SMTP id
 00721157ae682-6e5bfc0c786mr61479077b3.31.1729348839350; Sat, 19 Oct 2024
 07:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019-msm8917-v1-0-f1f3ca1d88e5@mainlining.org>
 <20241019-msm8917-v1-14-f1f3ca1d88e5@mainlining.org> <pyr3t3kcpjj5zor226fwembjsbpp5zh7mpe2a3bqmwnbqccj7h@a55efscym3s7>
 <46f7b167220a7d54242e9457d00d67e2@mainlining.org> <jj4ky6uuidv3rdjl7q4ehe7cdgcjxtnmtcufmy462gznkjiex2@pptv6aufsudj>
In-Reply-To: <jj4ky6uuidv3rdjl7q4ehe7cdgcjxtnmtcufmy462gznkjiex2@pptv6aufsudj>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 17:40:28 +0300
Message-ID: <CAA8EJprvDhvnphNitJqKkNFB-DbXfd_oGtBmgimjRB5n5VgEQA@mail.gmail.com>
Subject: Re: [PATCH RFC 14/14] arm64: dts: qcom: Add Xiaomi Redmi 5A
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 19 Oct 2024 at 17:38, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, Oct 19, 2024 at 03:57:54PM +0200, barnabas.czeman@mainlining.org =
wrote:
> > On 2024-10-19 15:48, Dmitry Baryshkov wrote:
> > > On Sat, Oct 19, 2024 at 01:50:51PM +0200, Barnab=C3=A1s Cz=C3=A9m=C3=
=A1n wrote:
> > > > Add initial support for Xiaomi Redmi 5A (riva).
> > > >
> > > > Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@main=
lining.org>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/Makefile                |   1 +
> > > >  arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 295
> > > > +++++++++++++++++++++++
> > > >  2 files changed, 296 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/Makefile
> > > > b/arch/arm64/boot/dts/qcom/Makefile
> > > > index 065bb19481c16db2affd291826d420c83a89c52a..79add0e07d8a5f3362d=
70b0aaaaa9b8c48e31239
> > > > 100644
> > > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > > @@ -59,6 +59,7 @@ dtb-$(CONFIG_ARCH_QCOM) +=3D
> > > > msm8916-wingtech-wt86518.dtb
> > > >  dtb-$(CONFIG_ARCH_QCOM)  +=3D msm8916-wingtech-wt86528.dtb
> > > >  dtb-$(CONFIG_ARCH_QCOM)  +=3D msm8916-wingtech-wt88047.dtb
> > > >  dtb-$(CONFIG_ARCH_QCOM)  +=3D msm8916-yiming-uz801v3.dtb
> > > > +dtb-$(CONFIG_ARCH_QCOM)  +=3D msm8917-xiaomi-riva.dtb
> > > >  dtb-$(CONFIG_ARCH_QCOM)  +=3D msm8929-wingtech-wt82918hd.dtb
> > > >  dtb-$(CONFIG_ARCH_QCOM)  +=3D msm8939-huawei-kiwi.dtb
> > > >  dtb-$(CONFIG_ARCH_QCOM)  +=3D msm8939-longcheer-l9100.dtb
> > > > diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
> > > > b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..7553f73603fc87797b0=
d424a2af6f2da65c90f5f
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
> > > > @@ -0,0 +1,295 @@
> > > > +// SPDX-License-Identifier: BSD-3-Clause
> > > > +/*
> > > > + * Copyright (c) 2023, Barnabas Czeman
> > > > + */
> > > > +
> > > > +/dts-v1/;
> > > > +
> > > > +#include <dt-bindings/arm/qcom,ids.h>
> > > > +#include <dt-bindings/gpio/gpio.h>
> > > > +#include <dt-bindings/input/linux-event-codes.h>
> > > > +#include <dt-bindings/leds/common.h>
> > > > +#include "msm8917.dtsi"
> > > > +#include "pm8937.dtsi"
> > > > +
> > > > +/ {
> > > > + model =3D "Xiaomi Redmi 5A (riva)";
> > > > + compatible =3D "xiaomi,riva", "qcom,msm8917";
> > > > + chassis-type =3D "handset";
> > > > +
> > > > + qcom,msm-id =3D <QCOM_ID_MSM8917 0>;
> > > > + qcom,board-id =3D <0x1000b 2>, <0x2000b 2>;
> > >
> > > Is this required to boot?
> > Yes
>
> Hmm, did you verify the dts against DT bindings? I think you need to fix
> them.

Hmm, ignore this. You added qcom,msm8917 to the allow list in the
previous patch. Please expand the commit message there, describing
that you are enabling msm-id / board-id for this SoC, which doesn't
work otherwise.

--=20
With best wishes
Dmitry

