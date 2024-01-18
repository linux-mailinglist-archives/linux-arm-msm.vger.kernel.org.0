Return-Path: <linux-arm-msm+bounces-7551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A011831A22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 14:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B84E1285607
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 13:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30D42510C;
	Thu, 18 Jan 2024 13:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qRGqsq+1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1FD250E4
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 13:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705583504; cv=none; b=u+rHFaBLmp1gyi5pkLdjmuT58TJkjUfyYUYvOePE6PryZGAXOlFK2SKIZe4hLWnBbumGnMSTBJ72stHGlEoKsB79J0hsMf5EnmZdi7iGb77V7EoCce7bJpo1gWOv/PGdSMM6BzUqPYBKwC6FDN/E5PBSYrVAVhd0dpK9C8o89sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705583504; c=relaxed/simple;
	bh=n++XuhRB4EVG1dnVu6UFfzLPoEhlNslsnkhQrRbhM9k=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=iAlJU8gymEvtHtZ48pt2ZUbg1aUwCbZV2dnsIZKIAGarBvdU8AGNplLAVUdNcnEGFHG1n+Q/iTbWqcBEN4CBfRcz2v0Hzm+EeBd7yHo7Qmj/20+W+k0/aJhA3yDwj7pfRJG6/cb3qAgloZ8UhU0V0A4PMM2HmGKCC/gXPC/PKPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qRGqsq+1; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4b77c844087so419747e0c.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 05:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705583501; x=1706188301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHW8mrwPYeD3SY8y17cH7gnw3XovI7cNYSvj0nnf3+8=;
        b=qRGqsq+1bJuMzygpcPUnex5SggsPvLRZYTJseFdBGyl4S/GAZKSuc7bdKJ4EjIdPmO
         hdJbXf83QFKgssHvoAAGG1ZyqA9VDp1iB5g/O1pI+5UQvDmBCffzWB9C4FkEJyXknb98
         Ez0ibwxLiYz6GZ0QwMFqKfE0SPZlmRIKIZifWQ2sQrJ6buPgp1eHUrtQiUxRrKE0LXLf
         zHVOuqd704GbXXI28ckuPnx5KtXwNCjiGA+Xo3bonHuN+rwkj+srZUVeG31S8zky+GxE
         8OsymlU/9SdFKfojInsqMLnOYxQvE8J2YHnaNHmTl7QbL5IOG5UfKpFP2uT9RyllV1Ke
         ilMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705583501; x=1706188301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHW8mrwPYeD3SY8y17cH7gnw3XovI7cNYSvj0nnf3+8=;
        b=ev7zNWSysnikf+idO5MWeET4SXowwWIDyvX7o286srpC/XiKMtbKok0OLMNsTxun/P
         pb1BRGQhcJLeYdxc00AxRS9j4VLB58kWcT1gUFtLgyN4Si8qGmhGanWTp1Fn7HrhoBG0
         TfVmHqrWHfdGHrX5eOcH4JmyPyEMQ68ZyAsnjnASvF0yWQter25iffFzc7k393t0mJW6
         gK00P5nN+F5wu506Oqiz1MRN/a3Et79zLWLkgHCt053nQdCYx8weGX8byQBjLmq6RNyk
         4kmouAUqp05sio3j83DkKob1dmW+FLTHQ0Qcb4H7nLWPGAE+i+9vzHb5Skl2xT1pzZwv
         nhvw==
X-Gm-Message-State: AOJu0YwFKbZefxvnEOdSm56XrOpMPea4RpQBwmIqlXj9TBOSeHne9wCY
	r1t7CbaIDJLyqIe1DH5sYaJ+6nYrL9TpuS/z89+phbrz6pf034pOFXPQglAiT1X1FbpOKbb7aHq
	KhJ8lDBIJEKIS7376BNinH1p/rdtbJABskG8RRA==
X-Google-Smtp-Source: AGHT+IGTGw8HnvT5D8+nH/KgquXG/RE7XEsMEneP3Lg56sqfViwsfnFVV4sR0gvqRyQwQNymy/UlduMSCG1+S/3he4Q=
X-Received: by 2002:a05:6122:128b:b0:4b7:2c46:32bb with SMTP id
 i11-20020a056122128b00b004b72c4632bbmr1337533vkp.13.1705583501195; Thu, 18
 Jan 2024 05:11:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240117160748.37682-1-brgl@bgdev.pl> <20240117160748.37682-5-brgl@bgdev.pl>
 <65a7feb3ea48f_3b8e294bf@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <65a7feb3ea48f_3b8e294bf@dwillia2-xfh.jf.intel.com.notmuch>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Jan 2024 14:11:30 +0100
Message-ID: <CAMRc=McUdR5oVEpbwXF+Sc1OaEtYH-UCv0ScFwrbGyWtyh8W0A@mail.gmail.com>
Subject: Re: [PATCH 4/9] PCI: create platform devices for child OF nodes of
 the port node
To: Dan Williams <dan.j.williams@intel.com>
Cc: Kalle Valo <kvalo@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chris Morgan <macromorgan@hotmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Peng Fan <peng.fan@nxp.com>, 
	Robert Richter <rrichter@amd.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Terry Bowman <terry.bowman@amd.com>, Lukas Wunner <lukas@wunner.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Abel Vesa <abel.vesa@linaro.org>, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 5:22=E2=80=AFPM Dan Williams <dan.j.williams@intel.=
com> wrote:
>
> Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > In order to introduce PCI power-sequencing, we need to create platform
> > devices for child nodes of the port node. They will get matched against
> > the pwrseq drivers (if one exists) and then the actual PCI device will
> > reuse the node once it's detected on the bus.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> [..]
> > diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
> > index d749ea8250d6..77be0630b7b3 100644
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
> > @@ -18,11 +19,11 @@ static void pci_stop_dev(struct pci_dev *dev)
> >       pci_pme_active(dev, false);
> >
> >       if (pci_dev_is_added(dev)) {
> > -
> >               device_release_driver(&dev->dev);
> >               pci_proc_detach_device(dev);
> >               pci_remove_sysfs_dev_files(dev);
> >               of_pci_remove_node(dev);
> > +             of_platform_depopulate(&dev->dev);
> >
> >               pci_dev_assign_added(dev, false);
>
> Why is pci_stop_dev() not in strict reverse order of
> pci_bus_add_device()? I see that pci_dev_assign_added() was already not
> in reverse "add" order before your change, but I otherwise would have
> expected of_platform_depopulate() before of_pci_remove_node() (assumed
> paired with of_pci_make_dev_node()).

The naming here is confusing but the two have nothing in common. One
is used by CONFIG_PCI_DYNAMIC_OF_NODES to *create* new DT nodes for
detected PCI devices. The one I'm adding, creates power sequencing
*devices* (no nodes) for *existing* DT nodes.

So the order is not really relevant here but I can change in v2.

Bartosz

