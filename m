Return-Path: <linux-arm-msm+bounces-33115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D989901CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 13:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E59501C21564
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 11:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610EF145A17;
	Fri,  4 Oct 2024 11:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sov/Vfnc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2A11487E3
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Oct 2024 11:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728040123; cv=none; b=EWHaTUIHDK0o/d6VuEcHe415CA9zsQ41HXKYOPHIzJ0qrL+k3W/uuK0EtYQX4tlewxiqoocHfwS90oVqGXe5iJ8wSPWhaeZGXF6SdXIYOJwMY/H0igcodDpdhVHjyJ63d3DoNpjctLWCc+88RO1rzFuZh3lkeMY52TTszMzyQL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728040123; c=relaxed/simple;
	bh=lnlqUDuMa2e9Y5GuWRXJKLw9R7bHb40yU9o9HsQPXyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dk5IVgg2ERWDCVBIRRAn39wIHYphs6A93NuDUsxJ50H9vFNZLzYpw6HsOfSIRkG4oWO6SwmXWRA14DLeWESj+y2cg0ONjWn1pVUHAQqqWxJIqrZ3HpNtO7E5EMoCmDSDf9tW7AxEPlqVD6ar32OVr/w4a1JprBmPim/CKP8w3xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sov/Vfnc; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539885dd4bcso2537426e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2024 04:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728040119; x=1728644919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zAv4teiawY0HKbeRkxppY/HvO/+VNGyuZ+Xi9JME9w=;
        b=sov/Vfnc79XzCSLFQVTgjyUUDap/mQbNyrQjTv2Sitoq6MQBKg0qe19ftckwALB+nO
         SjQddi8IOqMJ0aoYXaZ5c9DIEjFEMzB+Fel/gaGrdxuIUlWIjSnnqV7JKWK7qNQ/4oDu
         W1MRpJMr+qTrCGKnpLudfibjB9v3N8lw51dOO8BcB6dy7EwI4KpOtFWKjypyJQFuXowN
         UovV6y4TiDL5DZJExOfAi4vhG42+arGiybFYA2urMKJr2aQHb2RNk9kUieSTGhFe54Yt
         ofbfy+twnVhZD8s4JXg7/4a9kWTEyWU8hf4BzO/zYZWc3RMtlKeQVEvqg+DLQj4reASZ
         SNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728040119; x=1728644919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zAv4teiawY0HKbeRkxppY/HvO/+VNGyuZ+Xi9JME9w=;
        b=UI5Sxtm8h1J167HBQun5e7Kkaby6/KLBkHO1wNqo8VFwBC/zGRrOxCtsP2heBZ0Fdn
         VmCo0uickZeWbS+BoB1j7R5279qI5/75hiAraa+5RfO2kL03CQ40Jr1lN5M/0+xgNqef
         HnJzkLghuMMz9NrXepFVhwEF4R15MbGiVThy9OKHqnmqG+N5wBFT31MjNpepKmDgJYaV
         +eM4zOhuOVNe0aJwAm67imlIpVvPOyVbOVMYwB1v5fIYCBVbMgpp6+JzJp8VJtYLgAXQ
         xHqYz+7eUHEfWzMzsNhU27QRZFNJ+3MZPiTdUcj2DuKs6pM4cEqexBkVceChIVCmnXuh
         SFhg==
X-Forwarded-Encrypted: i=1; AJvYcCUBCZHzwM1EcXLAp0ayxnUIXTdoJikWpz5Kfet4Vj4YgwCVLmcyqEDs+5BkCGbGaTMhGQi95ocJ9ZOJuSup@vger.kernel.org
X-Gm-Message-State: AOJu0Yy17cr4EmyRO1JQzjdb2l0QK+iiMnpLhhYvlUraFHUokP7+OLZ3
	rihGUa0vzWF0VWcHTwNYO2WRqE91vAp33vbzvTHERW4/AE9X+l1nuDUiY0NrULY54r3Q7A+kqYT
	e5i2xm0joeoVfvDRuqkWFuBrtQGaEYAAlkZVbnw==
X-Google-Smtp-Source: AGHT+IF59bAUfACzdR9OjFr2GdrYrTAff9rnPLvDIfFSwtr3tADvLMXbak08INwh5+o50DTBVNOh9veiJsd4i7LlEZI=
X-Received: by 2002:a05:6512:e88:b0:539:8ad5:5093 with SMTP id
 2adb3069b0e04-539ab88ce30mr1670088e87.35.1728040118901; Fri, 04 Oct 2024
 04:08:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930103041.49229-1-brgl@bgdev.pl> <20240930103041.49229-4-brgl@bgdev.pl>
 <Zv565olMDDGHyYVt@hovoldconsulting.com> <CAMRc=Mc9jMe=hSXmcRLLX61abUjetCRZVeOK3G31vdx5JQNNMQ@mail.gmail.com>
 <CAMRc=Mde8rGT+81ViTX0Qj2sDrD59dkLHeUZd1xkWO_H=QvC0Q@mail.gmail.com> <Zv_Lok1BT1Hg13dC@linaro.org>
In-Reply-To: <Zv_Lok1BT1Hg13dC@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 4 Oct 2024 13:08:27 +0200
Message-ID: <CAMRc=MdXRj0oOxmn_tVKmtVQqKS0H_CGgMBhb6rAOmXz7Qxahg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sc8280xp-x13s: model the PMU of
 the on-board wcn6855
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 1:04=E2=80=AFPM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> On Thu, Oct 03, 2024 at 05:16:59AM -0700, Bartosz Golaszewski wrote:
> > On Thu, 3 Oct 2024 13:38:35 +0200, Bartosz Golaszewski <brgl@bgdev.pl> =
said:
> > > On Thu, Oct 3, 2024 at 1:07=E2=80=AFPM Johan Hovold <johan@kernel.org=
> wrote:
> > >>
> > >> Without this patch I'm seeing an indefinite probe deferral with
> > >> 6.12-rc1:
> > >>
> > >>         platform 1c00000.pcie:pcie@0:wifi@0: deferred probe pending:=
 pci-pwrctl-pwrseq: Failed to get the power sequencer
> > >>
> > >> Can you please look into that and make sure that the existing DT
> > >> continues to work without such warnings.
> > >>
> > >
> > > Ah, dammit, I missed the fact that X13s already has this node defined
> > > so PCI pwrctl will consume it and try to get the power sequencer
> > > handle. I'm wondering how to tackle it though... It will most likely
> > > require some kind of a driver quirk where we check if we have the PMU
> > > node and if not, then don't try to set up power sequencing. Any other
> > > ideas?
> > >
> >
> > This is untested but would it make sense?
> >
> > diff --git a/drivers/pci/pwrctl/pci-pwrctl-pwrseq.c
> > b/drivers/pci/pwrctl/pci-pwrctl-pwrseq.c
> > index a23a4312574b..071ee77c763d 100644
> > --- a/drivers/pci/pwrctl/pci-pwrctl-pwrseq.c
> > +++ b/drivers/pci/pwrctl/pci-pwrctl-pwrseq.c
> > @@ -3,6 +3,7 @@
> >   * Copyright (C) 2024 Linaro Ltd.
> >   */
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/device.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/module.h>
> > @@ -87,7 +88,31 @@ static struct platform_driver pci_pwrctl_pwrseq_driv=
er =3D {
> >       },
> >       .probe =3D pci_pwrctl_pwrseq_probe,
> >  };
> > -module_platform_driver(pci_pwrctl_pwrseq_driver);
> > +
> > +static int __init pci_pwrctl_pwrseq_init(void)
> > +{
> > +     /*
> > +      * Old device trees for the Lenovo X13s have the "pci17cb,1103" n=
ode
> > +      * defined but don't use power sequencing yet. If we register thi=
s
> > +      * driver, it will match against this node and lead to emitting o=
f
> > +      * a warning in the kernel log when we cannot get the power seque=
ncing
> > +      * handle. Let's skip registering the platform driver if we're on=
 X13s
> > +      * but don't have the PMU node.
> > +      */
> > +     if (of_machine_is_compatible("lenovo,thinkpad-x13s")) {
> > +             struct device_node *dn __free(device_node) =3D
> > +                     of_find_compatible_node(NULL, NULL, "qcom,wcn6855=
-pmu");
> > +             if (!dn)
> > +                     return 0;
> > +     }
> > +
> > +     return platform_driver_register(&pci_pwrctl_pwrseq_driver);
> > +}
> > +
> > +static void __exit pci_pwrctl_pwrseq_exit(void)
> > +{
> > +     platform_driver_unregister(&pci_pwrctl_pwrseq_driver);
> > +}
> >
> >  MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@linaro.org>");
> >  MODULE_DESCRIPTION("Generic PCI Power Control module for power
> > sequenced devices");
> >
> > X13s is the only platform that would use one of the compatibles support=
ed by
> > this driver before power sequencing so it should be a one-off quirk.
> >
>
> I'm guessing the pci17cb,1107 node in x1e80100-lenovo-yoga-slim7x is
> also affected?
>
> Maybe you can check if the node has one of the -supply properties and
> return -ENODEV from pci_pwrctl_pwrseq_probe() otherwise?
>

Yeah, that may be a better solution I suppose.

Bart

