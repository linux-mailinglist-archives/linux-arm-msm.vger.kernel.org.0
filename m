Return-Path: <linux-arm-msm+bounces-19303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE9F8BDF42
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 12:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFBD41F22D98
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 10:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3956214EC51;
	Tue,  7 May 2024 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sbZ0Oglq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC8014D6FE
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 10:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715076027; cv=none; b=vEmifVL5MDXI5ZC+yqf/VckFHjfKeu/C1z1oIdxsTcKmL3LTzHjUhM1KDJAHl6Nb1CZtktKRLQEjGZ4sEKX3Ujne4iJ8DxWR/qtNPd8UcIswZ5+Az2KPW/Gf8ROIc+05Tn0bZZb7eXNSwCeT2gnWpy4CU+D58jH5LhsVZRBHHiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715076027; c=relaxed/simple;
	bh=WctqNRdAkvs4yyN1XxR8U/bCnTGIZkl93cp13I5DYbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pDOPWzRiFFZzmMMIKv6WnpXPC4XV/qxkHYnGCLYVArxv0THrGddQ+K+eQhAFZQoXApccmzanl3iDxJBoGc3GYUp3bqq4YSgHif/DUUZ1vsTZXTyrtP9/sgiCztLYA4t8YY+3JkZ+wd3muBg6DeIf/ghhAM6/HJvmWRXk1ecpbNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sbZ0Oglq; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-de45dba157cso2336056276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 03:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715076023; x=1715680823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFSMri8IOp5B1+IxovMpqNQnX2FTTBoMbN3fnBfN5fs=;
        b=sbZ0OglqdXpICj1NKcy/XdY7XiHVUSdwtcpxM9C92Y6s8Hxxmk4bhSbns6wr8BcCN0
         XsDdAUhotCEd+KiPH0M4Q2QbKaNCXKIXtmUNKiQik8zLMotSc79fxXsn83N5xGwZCJIG
         vJBGV09EU9LrRRw2xliknZjfJxQAs+/HrZ++szNhvZUSRoEdnFXEQDZtbFm91zoGRfmc
         f1DjJNu41fFtNKU3mweVdPGuKrAQEdnkkOUX9B5hjr15Ccspqhq7uznOYI2xVCTX3neU
         TrQZ/NTqR5aZxctPUHfOn50fZnX+84eKHCVkQ4rMBR3KE/syY8pqqCYzTZLIVNfdDg6X
         zJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715076023; x=1715680823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFSMri8IOp5B1+IxovMpqNQnX2FTTBoMbN3fnBfN5fs=;
        b=kxrTML5mQuPQbJ9G1zHq+vC+7nIc6k+jROExhA2uMOTyf997AViWPfKJP5KbmLv4nX
         QmN2ko6GNqhxemaYaTRRzDTqrXEvvMKfTJhxHfGlb/9y93Yiy1TPl5WmKkGDH8WrVaoS
         jKknxjb502GFhRc0MZq5qXbjimb0ZpcTdf3417s1tXH17RWb2yz4dK1Q3Nq2/5SrO2dN
         HNtpTkcaZQ/JSz3hW12MyP3itu9KlTfY821d45EZ1L6TMIMdR0h0xziBFbEjbih2EamL
         g4hmVX7RYtTrejOZKZK++zhjPNk7fs2re58agU7G02y/YFEV6tDB2A+U/7RKLWDs0cim
         8wDA==
X-Forwarded-Encrypted: i=1; AJvYcCUMKeeH/DR7H8lg1+xB8ttHJ2JrHw1pq4n1Edl0vcSvFM4RfplL20bNNadkRdDXmRu1cKE9g4I0m+IjAj9/IwCUYQPYypvv4MlEZuRr3A==
X-Gm-Message-State: AOJu0YzXFSGihxh4MmvmLsR5cD2Log4wLk/0rEpRMK2Y4qPhyIZf7wP3
	hq//OTqt6ENxGEvgT8id8d5kP3zH1rC2JfTnrvwtdPWZ0F93c2A3BOFRfe0ZIY0gGWoDsAxSOJo
	gq65SqGMUSkXrrBsoaj6iXnXHpYgswypjeC2zIA==
X-Google-Smtp-Source: AGHT+IFwCUGgYvRH4J64zcFI4z7cn36AwbaF/MAmzgEqtWvJFvM8pD+cROZ0JOlTC9klXAeFg/VLQQiya7Dx8lrV/5s=
X-Received: by 2002:a25:8e04:0:b0:de8:9348:b219 with SMTP id
 p4-20020a258e04000000b00de89348b219mr12156380ybl.6.1715076023009; Tue, 07 May
 2024 03:00:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
 <20240429102510.2665280-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdZUsA034L5GjF_-XELX9369PwNjONfsDV-_EC564R0QWg@mail.gmail.com>
 <20240507081441.GA6025@thinkpad> <20240507082822.GA6659@thinkpad>
In-Reply-To: <20240507082822.GA6659@thinkpad>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 May 2024 12:00:10 +0200
Message-ID: <CACRpkdbHKPBT087WZ8PN4Mb6pLLAuFLufFw69vn5cimWJmwchA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] PCI: imx6: Convert to agnostic GPIO API
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Yue Wang <yue.wang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xiaowei Song <songxiaowei@hisilicon.com>, Binghui Wang <wangbinghui@hisilicon.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 10:28=E2=80=AFAM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
> On Tue, May 07, 2024 at 01:44:56PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, May 06, 2024 at 02:10:24PM +0200, Linus Walleij wrote:
> > > On Mon, Apr 29, 2024 at 12:25=E2=80=AFPM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > > The of_gpio.h is going to be removed. In preparation of that conver=
t
> > > > the driver to the agnostic API.
> > > >
> > > > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.or=
g>
> > > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > >
> > > I think there is a bug here, the code is respecting the OF property
> > > "reset-gpio-active-high"
> > > but the code in drivers/gpio/gpiolib-of.h actually has a quirk for
> > > this so you can just
> > > delete all the active high handling and rely on 1 =3D asserted and 0 =
=3D
> > > deasserted when
> > > using GPIO descriptors.
> > >
> >
> > Wow...
> >
> > So this bug is present even before this series, right?
> >
> > > Just delete this thing:
> > > imx6_pcie->gpio_active_high =3D of_property_read_bool(node,
> > >                                            "reset-gpio-active-high");
> >
> > But this is just a bandaid IMO. The flag for the PERST# GPIO should be =
properly
> > set in the board dts as per the board design.
> >
>
> Hmm, no. I was confused by the property. But this quirk in gpiolib-of.c i=
s going
> to be applied while changing the GPIO state also or just during request t=
ime?

It's applied permanentlt at request and then the descriptors maintain their
polarity state over the course of their lifetime.

Yours,
Linus Walleij

