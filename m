Return-Path: <linux-arm-msm+bounces-9499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 479D0846B7B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 10:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C1891C26F9E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 09:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A31768F2;
	Fri,  2 Feb 2024 09:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WqIn5s2Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B504D76023
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706864615; cv=none; b=LsfZgS0DQezLw5psVZ/qZ08l662N0eoaOnI9/H8raFulzO1It/oneWRw3fqjt5tOGPvWNxjk3+heyJh6/sJQGVaQ5h7j/zQzRtJ/3uXgx+Mw6n4MKEWAScf147ZQqhHgZSpWpt8rgvmhCScNcboJAP430oGbb/qnkm0XadhPyGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706864615; c=relaxed/simple;
	bh=nmIJ6o/nKGoxCdPeNHhdm2ww0WnXp6xk8MnUITWzxRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VmLmgx7Gm4M8uVUSizyE8+DjfFf+DxxcP5ufbG4mplECqtX5E33sRmv7fPOqGB+aYxHJ5rPfqo1rBLBMQ7UljZ/nSs7O8JzkbH+v7zAqmtS4sFr04dQLMZk0AZ/Ww9rX0v6Gd7GDzlY4+i61M/phjiEFiVjJMYX1gMCp/tVJdQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WqIn5s2Z; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7d5bbbe592dso966399241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 01:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706864611; x=1707469411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCN752qmd2T78irI31vKFY9eZlBq4rpwdzKMS8r/StY=;
        b=WqIn5s2Z6bkhf3P5cAAoCC9Q3A30eCh8bUEZHZ0HV0w+yDCqC571tWio40+CKl41Al
         ix6+KWifm1ILiNg8UuNjRnacnyPdGJgJA8FxlyhHURpqIvXsY3Nc7URPmlHIojZoHnQS
         NLoqGXcDFeqqaCeGNzU8MexsETy/Ms23RhbXD1nUP+TbN5ab5qPZ+A/LS22Wbhp5RWcA
         c6+CgpI6se0Z0SPtzzjGm70oGHQ9Dy0UZCSJNQ821Y8l01aet+0Phav2n2gmWKvf2yvC
         nx2tlaU/beQO2bISeCILOp71XyFT5rhKloE45IQSXyo0KtIJtUV201PlOQ0INh6zjc4J
         FF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706864611; x=1707469411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fCN752qmd2T78irI31vKFY9eZlBq4rpwdzKMS8r/StY=;
        b=mgxS9f1vleDJLBy5LY/ezVtoiiyNsSDotGY0om8tuEDXrR1HGRd2IeJP3Ve339sP9z
         tOsmUMkzsBsK6/5/7C97oDmK9Z0aymsQoarVXb5nBM0UybQXhenU8Le87fnFlRYaRzT4
         emJRSnMCRYlDIT4oJtw1NWufJLgiSEakF4lsTzoxswdM1CKR8axCNNnk7vFtE8/u8pwd
         xT74HGYPrjezK7NEHMtmR54nCepg1i4+nQGV+SveuDJ664LNNo5llEMqGqr1F4ME406q
         jAnc3MMd/HVJ1HBUCF0b2u1RXzNIBJ5l1asM0E94GuGM0n5F2ZSbUHewMN/Bp+dU08O5
         nS6w==
X-Gm-Message-State: AOJu0YyXcFZtc8RL4rWapxxjImB1NxSeVbwtdRYZ0xIe893XqrK+WJBT
	Bw7oN6J4wj3mNVWpbhwCcEWJy4D3eUbJP7H1PGVB5MeB9+LOXNib1Kd4EowKqv2175YrsHSc6pJ
	W4QEMrSAPWOs/om8QWpuRbgsHFXRwQql67UdnXA==
X-Google-Smtp-Source: AGHT+IEqs2bNIvCzWVgomnMreMb0zjFg7P+zxxYTKm00L9KfymfIWV9u5SWsm3QuvME2u5gS+F7nU11SjJyZUsZhto0=
X-Received: by 2002:a05:6122:1d16:b0:4b6:d4c2:61d3 with SMTP id
 gc22-20020a0561221d1600b004b6d4c261d3mr8184430vkb.0.1706864611683; Fri, 02
 Feb 2024 01:03:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240201155532.49707-1-brgl@bgdev.pl> <20240201155532.49707-7-brgl@bgdev.pl>
 <4epbzsmxj2gfvjcufclfw7vnamr6hyeickrbyakibdtubwnefs@lkyt7mth43nq>
In-Reply-To: <4epbzsmxj2gfvjcufclfw7vnamr6hyeickrbyakibdtubwnefs@lkyt7mth43nq>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 2 Feb 2024 10:03:19 +0100
Message-ID: <CAMRc=Mdps2CccmoYM06W_iiNcw8QauEueGSWZOEvD5P8PFgLVQ@mail.gmail.com>
Subject: Re: [RFC 6/9] PCI: create platform devices for child OF nodes of the
 port node
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Alex Elder <elder@linaro.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Abel Vesa <abel.vesa@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pci@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 3:59=E2=80=AFAM Bjorn Andersson <andersson@kernel.or=
g> wrote:
>
> On Thu, Feb 01, 2024 at 04:55:29PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > In order to introduce PCI power-sequencing,
>
> Please provide a proper problem description.
>
> > we need to create platform
>
> And properly express why this is a "need".
>
> > devices for child nodes of the port node. They will get matched against
> > the pwrseq drivers
>
> That's not what happens in your code, the child nodes of the bridge node
> in DeviceTree will match against arbitrary platform_drivers.
>
> I also would like this commit message to express that the job of the
> matched device is to:
>
> 1) power up said device, followed by triggering a scan on the parent PCI
> bus during it's probe function.
>
> 2)  power down said device, during its remove function.
>
> > (if one exists) and then the actual PCI device will
> > reuse the node once it's detected on the bus.
>
> I think the "reuse" deserves to be clarified as there will be both a pci
> and a platform device associated with the same of_node.
>

Noted all of the above. Thanks!

> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/pci/bus.c    | 9 ++++++++-
> >  drivers/pci/remove.c | 2 ++
> >  2 files changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
> > index 826b5016a101..17ab41094c4e 100644
> > --- a/drivers/pci/bus.c
> > +++ b/drivers/pci/bus.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/errno.h>
> >  #include <linux/ioport.h>
> >  #include <linux/of.h>
> > +#include <linux/of_platform.h>
> >  #include <linux/proc_fs.h>
> >  #include <linux/slab.h>
> >
> > @@ -342,8 +343,14 @@ void pci_bus_add_device(struct pci_dev *dev)
> >        */
> >       pcibios_bus_add_device(dev);
> >       pci_fixup_device(pci_fixup_final, dev);
> > -     if (pci_is_bridge(dev))
> > +     if (pci_is_bridge(dev)) {
> >               of_pci_make_dev_node(dev);
> > +             retval =3D of_platform_populate(dev->dev.of_node, NULL, N=
ULL,
> > +                                           &dev->dev);
>
> I'm not familiar enough with the ins and outs of the PCI code. Can you
> confirm that there are no problems with this (possibly) calling
> pci_rescan_bus() before the bridge device is fully initialized below?
>

I'll clarify that. I'm not that well versed with PCI code either but
will get help from the right people.

Bart

> Regards,
> Bjorn
>
> > +             if (retval)
> > +                     pci_err(dev, "failed to populate child OF nodes (=
%d)\n",
> > +                             retval);
> > +     }
> >       pci_create_sysfs_dev_files(dev);
> >       pci_proc_attach_device(dev);
> >       pci_bridge_d3_update(dev);
> > diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
> > index d749ea8250d6..fc9db2805888 100644
> > --- a/drivers/pci/remove.c
> > +++ b/drivers/pci/remove.c
> > @@ -1,6 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  #include <linux/pci.h>
> >  #include <linux/module.h>
> > +#include <linux/of_platform.h>
> >  #include "pci.h"
> >
> >  static void pci_free_resources(struct pci_dev *dev)
> > @@ -22,6 +23,7 @@ static void pci_stop_dev(struct pci_dev *dev)
> >               device_release_driver(&dev->dev);
> >               pci_proc_detach_device(dev);
> >               pci_remove_sysfs_dev_files(dev);
> > +             of_platform_depopulate(&dev->dev);
> >               of_pci_remove_node(dev);
> >
> >               pci_dev_assign_added(dev, false);
> > --
> > 2.40.1
> >

