Return-Path: <linux-arm-msm+bounces-6941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 328E7829AB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 13:55:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C45481F270C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 12:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C093D48785;
	Wed, 10 Jan 2024 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="s20dKFSX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B87482F6
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 12:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7cc7bae27b5so1303556241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 04:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704891329; x=1705496129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ee+hHkfAfIFS6WHvmIg35YEx3vQHJAhovJ3w3cPXwo=;
        b=s20dKFSXv9X0Dth46Eq9po8i1zw++gJAeAovANgJUWtSt/94qMDdNE6z161bIEdp2Z
         atELqW/ToP33dGrkoHBTOChulkv8Cw7Kv4FTMAuyypFZUkfrX5/Kh6YB3DlBueZvYdEp
         hzs/zmifuFPCqPeNZwb1WQVnPJHOBHxMIazawurhzd9sIsPVuFMU+IygCX8PilCPsQUr
         6rZIP5SHmB3SL+0nfD6hPl1tSEpU7f7BOl8k2oh7MKxCiO5WWpJ4hE5B1l1pVP8bf94c
         1gmLonYfjIGcPzZ8dzA2N7wL0S6x5gcjnngKgw86LHphKpQvU/fy+Ut4dVwNSwtJoZS8
         MS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704891329; x=1705496129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ee+hHkfAfIFS6WHvmIg35YEx3vQHJAhovJ3w3cPXwo=;
        b=t8vVZcKUDXB4OvwUhnxwTuLd6nruJ63uDdnVFpsIphQow7ts1oWKo6LaaSU1Ja+Fgw
         JDobQwM0cO3++4xp7QIR0rKCh0XZSXahssHFsB3zpEBwKfqfBpPLu4CP//l+5TOKxTuk
         0g2Mxv3mK4Oyf0pS5jEq7pjNOHCbKn9DGSZAKKxsUxX8oZJqeqpEdTCS1/+Yta77stPq
         8cASH97JKLpuHz+hlyIwkOYjUu2fULzrgvPLpRvq+XiBnnjbdy2GSPHiAIAa5iXqui+l
         iGI/ZVpmYNPFDss6qu4oTJKMdHc2d6w2T3vwExipE3hgV1kEjSZZyV9Nj4QDMVoyKeNY
         MLdA==
X-Gm-Message-State: AOJu0YxzY4LMXd/ifo37uTHanum64Z0Bts1J6626zlgARguFBZv66jvn
	T2WP7vJufgTh7YAHIikE57//+Q88vLk8N+1+1CGzt905aUgiSIshFBdDCvVrxVE=
X-Google-Smtp-Source: AGHT+IFJf1lA0zydsqWg4MMlDwI7GY7aqZwXYX8MZwXUGKbgxRrG/GbjToxomMdYf3iIjG2NRkt8G9T0sjS/5fZgDGY=
X-Received: by 2002:a05:6102:6248:b0:466:fd31:def8 with SMTP id
 gd8-20020a056102624800b00466fd31def8mr866005vsb.55.1704891329157; Wed, 10 Jan
 2024 04:55:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240104130123.37115-1-brgl@bgdev.pl> <20240104130123.37115-4-brgl@bgdev.pl>
 <20240109144327.GA10780@wunner.de>
In-Reply-To: <20240109144327.GA10780@wunner.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Jan 2024 13:55:18 +0100
Message-ID: <CAMRc=MdXO6c6asvRSn_Z8-oFS48hroT+dazGKB6WWY1_Zu7f1Q@mail.gmail.com>
Subject: Re: [RFC 3/9] PCI/portdrv: create platform devices for child OF nodes
To: Lukas Wunner <lukas@wunner.de>
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
	Robert Richter <rrichter@amd.com>, Dan Williams <dan.j.williams@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Terry Bowman <terry.bowman@amd.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 3:43=E2=80=AFPM Lukas Wunner <lukas@wunner.de> wrote=
:
>
> On Thu, Jan 04, 2024 at 02:01:17PM +0100, Bartosz Golaszewski wrote:
> > In order to introduce PCIe power-sequencing, we need to create platform
> > devices for child nodes of the port driver node. They will get matched
> > against the pwrseq drivers (if one exists) and then the actuak PCIe
> > device will reuse the node once it's detected on the bus.
> [...]
> > --- a/drivers/pci/pcie/portdrv.c
> > +++ b/drivers/pci/pcie/portdrv.c
> > @@ -715,7 +716,7 @@ static int pcie_portdrv_probe(struct pci_dev *dev,
> >               pm_runtime_allow(&dev->dev);
> >       }
> >
> > -     return 0;
> > +     return devm_of_platform_populate(&dev->dev);
> >  }
>
> I think this belongs in of_pci_make_dev_node(), portdrv seems totally
> the wrong place.  Note that you're currently calling this for RCECs
> (Root Complex Event Collectors) as well, which is likely not what
> you want.
>

of_pci_make_dev_node() is only called when the relevant PCI device is
instantiated which doesn't happen until it's powered-up and scanned -
precisely the problem I'm trying to address.

Calling this for whomever isn't really a problem though, is it? We
will create a platform device alright - if it's defined on the DT -
and at worst it won't match against any driver. It seems harmless IMO.

> devm functions can't be used in the PCI core, so symmetrically call
> of_platform_unpopulate() from of_pci_remove_node().

I don't doubt what you're saying is true (I've seen worse things) but
this is the probe() callback of a driver using the driver model. Why
wouldn't devres work?

Bart

>
> Thanks,
>
> Lukas
>

