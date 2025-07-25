Return-Path: <linux-arm-msm+bounces-66738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7F0B125F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 23:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F24D174458
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 21:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620DD23D2A4;
	Fri, 25 Jul 2025 21:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Uo9B/oby"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A79238176
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 21:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753477473; cv=none; b=SN8/CieQun85PwvcNnyeHB07hWzEJUqAc5LUlPBEboWusrlwlPTxvDYuLiahDuRa2AgMsLRrqrW7n5kFVSs/ulpQkKh0tzbfA/4kbr6sukpGrIsEvN5uIMPCETcbdTNrJuO/tNQCLn28t9Cmo53VbC9k0jl5rc/w6x+m3fsEcFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753477473; c=relaxed/simple;
	bh=k9YP3Ra/X8LYSmjsxsfToQtWKaZOEGp0EloUd+RJVuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOkJWrLGWRuijXYN/CpKHD74HHkaFWWKxEsL5pYQYgOo2oMr7gjjMGyeGaz9IeD6H3OU0o2g1jEge8u0TimxaOS2uR4Gu0ZXmHhLPxwQo1LUH0H8gXZiyxHQFKkKe7NUyh5PkGcyYj5gDVshVlGcAz6js64hhksF3ZFcPC0B6kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Uo9B/oby; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7426c44e014so2215446b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 14:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753477471; x=1754082271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UK5v8rSJCL4PM/PqREQEoXsZnYaZRNVQ0Jymr/9YAgw=;
        b=Uo9B/obyr9S5oVGLN/6vtEUFrKmH8bzhqMXnycHlh86wL9n8jHBMVcP+vHzeioo/ZB
         ohyXFX6dV2t+H5+tysr+gsEwM7FtpQbFlUrteivIglv2Z40IjUlHH0pJqg2DPmQo1las
         1aopWyEcWyewvs+UMty/8yYWTR5tikBgXYN98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753477471; x=1754082271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UK5v8rSJCL4PM/PqREQEoXsZnYaZRNVQ0Jymr/9YAgw=;
        b=S1U5Kki1fjnLRHH3uady66iK4T69vqKpCy9kTyREyFOPiGI/H4MJaoFNz/DY0XVlRw
         fVGhExbio3sY9nPJ2afE+Y3lQkovqrXomOK33gXxP2tJ4Sp2XrphS8ge5Qb+maW05Qj1
         GtaBNm+grqVidzy+S0HVnQR2T2iuU8MovHI7lP0ZB0cVfTWcyKcwAetzuY24MsfxkAwC
         d7fUXXONAHPRycVBVzTmJtZkb697vsh0OWEPGv7ckYdSN6X8slZtw4bGPgHyW8HSx/Ts
         on5tH88YX371Uk2aY+u99j4sdpcUzial6vBjRjVosGkcOLGvyY6dBpktoQARsv8hyqxg
         tGng==
X-Forwarded-Encrypted: i=1; AJvYcCVdHmmkBlqGajpJ9QKXvYhryx25byD+c0tPrU+ihHnngAf6XTjCzgwYa3uguOGrSi6KKfOew2Q+UcZ52+8v@vger.kernel.org
X-Gm-Message-State: AOJu0YwZFgrit2HJ5a1+G27WVStPhHTZnjVDFyjVP2Zt4bzU12dh6Lg0
	l2c79YeHdpzAbSuYb+khgOedESHG2wgxF8gP62NUktIFSn+PbrafEOdQNbu2eD+hbhqvI5IaZk5
	nvd4=
X-Gm-Gg: ASbGncvdq1/uvxT5OuWeVyEF/lwVnpis/9TTBVOTTdwbwAXIVYT9v5SE6ym/LYexM02
	Opg01pcNvGOT5EVv07ZuMSRuWM4exnjUcl+nOZnforH5YCBrKhRLxUwteO3btRB71BpujGDkxem
	gYj0Z8EwgvDZaeDDvG1GcgZGymtG7fcHpQYn1s5I3d/0jTxwPLI/2fDV6MUMssvIGWhXYJbox5d
	3lZsuujkQhbu/U1FxBw82Uengfq8MtEpiN+1ptPj2DlNz/vzq/mFrNwCbYAyk3uCwL7FEoNPa5u
	wecZ0Rtnbj3JCivb34QGqLVuaOj9+GrSfU//3U3OVVlXKw+uO9cKRU5RSbYlWlWkUPCoN79yO35
	JdxTKcmBRsv3ogCB3safgnmkPwiZD/GSNXmfjtRtpLNz48kRYKL3oSBOiJsA=
X-Google-Smtp-Source: AGHT+IGX51xJuZ7xVEqsV+pVSNZquYc8zuJTDYx0l06a/H4ODZBBC/LKP4qa7EFmirPsW+qOg7M5gg==
X-Received: by 2002:a05:6a00:391c:b0:742:a82b:abeb with SMTP id d2e1a72fcca58-76332379335mr5197569b3a.2.1753477471187;
        Fri, 25 Jul 2025 14:04:31 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:5a7:d366:b2e1:fcd1])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7640b2ddbbdsm373592b3a.104.2025.07.25.14.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 14:04:30 -0700 (PDT)
Date: Fri, 25 Jul 2025 14:04:28 -0700
From: Brian Norris <briannorris@chromium.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH RFC 2/3] PCI/pwrctrl: Allow pwrctrl core to control
 PERST# GPIO if available
Message-ID: <aIPxXD6LZp7PHicR@google.com>
References: <20250707-pci-pwrctrl-perst-v1-0-c3c7e513e312@kernel.org>
 <20250707-pci-pwrctrl-perst-v1-2-c3c7e513e312@kernel.org>
 <aHGueAD70abjw8D_@google.com>
 <k5rf5azftn4mpztcjtvdxiligngmaz7fecdryv244m726y5rfd@mobway4c4ueh>
 <uh7r37l7a2btd3p5dighewfmat2caewrlyf2lwjtslolbr5bov@jgstvnfhxur6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uh7r37l7a2btd3p5dighewfmat2caewrlyf2lwjtslolbr5bov@jgstvnfhxur6>

Thanks for clearing up some confusion. I was misled on some aspects. But
I think there's still a problem in here:

On Thu, Jul 24, 2025 at 07:43:38PM +0530, Manivannan Sadhasivam wrote:
> On Sat, Jul 12, 2025 at 01:59:34PM GMT, Manivannan Sadhasivam wrote:
> > On Fri, Jul 11, 2025 at 05:38:16PM GMT, Brian Norris wrote:
> > > On Mon, Jul 07, 2025 at 11:48:39PM +0530, Manivannan Sadhasivam wrote:
> > > > PERST# is an (optional) auxiliary signal provided by the PCIe host to
> > > > components for signalling 'Fundamental Reset' as per the PCIe spec r6.0,
> > > > sec 6.6.1.
> > > 
> > > >  void pci_pwrctrl_init(struct pci_pwrctrl *pwrctrl, struct device *dev)
> > > >  {
> > > > +	struct pci_host_bridge *host_bridge = to_pci_host_bridge(dev->parent);
> > > > +	int devfn;
> > > > +
> > > >  	pwrctrl->dev = dev;
> > > >  	INIT_WORK(&pwrctrl->work, rescan_work_func);
> > > > +
> > > > +	if (!host_bridge->perst)
> > > > +		return;
> > > > +
> > > > +	devfn = of_pci_get_devfn(dev_of_node(dev));
> > > > +	if (devfn >= 0 && host_bridge->perst[PCI_SLOT(devfn)])
> > > 
> > > This seems to imply a 1:1 correlation between slots and pwrctrl devices,
> > > almost as if you expect everyone is using drivers/pci/pwrctrl/slot.c.
> > > But there is also endpoint-specific pwrctrl support, and there's quite
> > > a bit of flexibility around what these hierarchies can look like.
> > > 
> > > How do you account for that?
> > > 
> > > For example, couldn't you have both a "port" and an "endpoint" pwrctrl? Would
> > > they both grab the same PERST# GPIO here? And might that incur excessive
> > > resets, possibly even clobbering each other?
...
> I realized that there is no need to define these properties (PERST#, WAKE#,
> CLKREQ#) in the endpoint node (the DT binding also doesn't allow now anyway).
> These properties should just exist in the Root Port node as there can be only
> one set per hierarchy i.e., Root Complex would only use one set of these GPIOs
> per Root Port and the endpoint need to share them.

That implies it's not a 1:1 correlation between PERST# GPIO and pwrctrl
device. Multiple endpoints might need powered up, but they may share a
PERST#. I don't think this patch solves this properly, as it allows the
first one to deassert PERST# before the other(s) are powered.

Or maybe I'm missing something yet again :)

Brian

