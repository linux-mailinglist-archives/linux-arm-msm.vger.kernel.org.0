Return-Path: <linux-arm-msm+bounces-64658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C353DB02858
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 02:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D906A7A639F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 00:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C8F4AEE2;
	Sat, 12 Jul 2025 00:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nHeaM7ke"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0C92F43
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752280700; cv=none; b=ZRRBjcT2TN2xpEOWfHfoGDQbNz+furUQGja7h6RtiM22sI5WII6CLTQXZkR6USRfcwufjSr/iBB6wmreG3tHDxbjZ//vuUzyh7FAknmLYPj+xYY8JrqZ91dooG0mK4XiXy0cTx5VMtGR/KWzyLFm88ToZ/aQOD1ZZPz9QIxH9L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752280700; c=relaxed/simple;
	bh=UkFyYdb6Iv006IVH2XSxgBssHRSlceqPI9zmw0qg5XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHHYsGaYYwjohs+bO3xiz4qmglgAPFgsf/xV7gEwNJ+1pd/QyvqNdEkegUoPsNG1hyG0uhexLJ15Ue5KF5Xx1xXUf07sOCVgrt5U3BUzqRP3uwdDgdkA1J7XKNBRWcPBjZAniyrR4j2k2i3Enl/716UZj7U5omLqqEfK6SHNNFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nHeaM7ke; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74b27c1481bso1710272b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752280698; x=1752885498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ai5C0aZGzWah4ZFBuTYCZpMrf26VMhYKg7WxsS6cFuk=;
        b=nHeaM7keph5DJFO6L1PCa0jjZlgXQPER8qH55smAi+V0Y98ncyo45swyReedMZkVG6
         OBRgXUiQMnl0XXzWCMb52ldxIRAfBSy+55pCMFO+AMOHcYwUVUPROYN9ikXNOmoAHJm8
         9BxDlsGL+ZiiJ9TXJSFlxzDvvwDJ5/BcGWsJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752280698; x=1752885498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ai5C0aZGzWah4ZFBuTYCZpMrf26VMhYKg7WxsS6cFuk=;
        b=VN2HRPRJEcejFyBrhAirEFh2mkCHcLd55lOv6HTF/qDvLxd+QF4Bo1pmAsxEhbBhtt
         swT3cTB/6DX1HFRrZs1e5iUMAOkf4/Jx55cyMueWSkAe5KqLqc//J5pzK+j91aDPxf59
         A5JOEYTBl9S78Wm8/++n+JqQpLxckcZMq8nQUJmNxpjPvdSK41QqymxvO/kNncYlUXbG
         8ustwpixs/uIQPgHaZX6ymzLZW+nI7p0wVt5f6FlqAxl6AwZd9qDEoQiONh0nih2cXIP
         p8zzt9S02MMyYqpqEctFyTpG5ZZFrZgYjrbOGylBXQeYV8lEEgD3a6/tm7AgW5qm8PzO
         CxrA==
X-Forwarded-Encrypted: i=1; AJvYcCW9avkOwkXk5+5IzF1EpcP7vmqzklWplABaKbkic6JvIiwk8ByGF5mWCKj8i11VFtgWFlO1qZncCUDLKKPC@vger.kernel.org
X-Gm-Message-State: AOJu0YyBbJBG8diVZwgy6bdBfPFIfZoQIonrGCBpZp8N81YdZ7shuJ8L
	0s6jx1VUonsS2wt1a56G+HdDcqEWwEQR3iWwdmci0ci84sota9q2koa/zQhxcLDUkA==
X-Gm-Gg: ASbGncudsuzdYuBvvTFGPujlOqPJxdOlHIw4uzK5mpMWFiovl3cgndHatXjlJKpts9G
	meCx6DTeZn2n0YWYl0nW+/vPcjSqHt5cdNmnM0J9fCol8W+X2gH09wh8D95ycjzn+FFOR10njN1
	wWkzS9dxuvihnGQJWM6tnF7o6aWiITrcD00VhvmbuDbBtO+5GrDw9AbbPxjOlC0U6u+eMidXvH2
	GBeNF++XrbufG5G3hzlEEP/hi2sy/XRG/zx64CdLUG0bbyktYIdQiJ+QRy19s4SSeypbFY/uQw0
	TnovOq5kxS+vHukIpYU2YykxVqZCKWSBn63C0ZUD8RZ6n1t2iacedXSRGOgcoa9O8/Fz9yxNGYH
	h924w44xSwoKwwRhOQvQRPedlVBArYSJe+ePfV5xVVbmBKGKnfcGa6whEBqwW
X-Google-Smtp-Source: AGHT+IH7cTn36pVPXMTL1GrAJZlMQg6zx4a7aTWAnpBBYd+bO+7yRb9iKsSRX8MmnkAtmBgMMU/W8g==
X-Received: by 2002:a05:6a21:ae09:b0:232:36e3:9a4e with SMTP id adf61e73a8af0-23236e39bc8mr2668926637.40.1752280698443;
        Fri, 11 Jul 2025 17:38:18 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:2386:8bd3:333b:b774])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74eb9f8bd3bsm6429988b3a.149.2025.07.11.17.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 17:38:17 -0700 (PDT)
Date: Fri, 11 Jul 2025 17:38:16 -0700
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
Message-ID: <aHGueAD70abjw8D_@google.com>
References: <20250707-pci-pwrctrl-perst-v1-0-c3c7e513e312@kernel.org>
 <20250707-pci-pwrctrl-perst-v1-2-c3c7e513e312@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707-pci-pwrctrl-perst-v1-2-c3c7e513e312@kernel.org>

Sorry for so many individual reviews, but I've passed over this a few
times and had new questions/comments several times:

On Mon, Jul 07, 2025 at 11:48:39PM +0530, Manivannan Sadhasivam wrote:
> PERST# is an (optional) auxiliary signal provided by the PCIe host to
> components for signalling 'Fundamental Reset' as per the PCIe spec r6.0,
> sec 6.6.1.

>  void pci_pwrctrl_init(struct pci_pwrctrl *pwrctrl, struct device *dev)
>  {
> +	struct pci_host_bridge *host_bridge = to_pci_host_bridge(dev->parent);
> +	int devfn;
> +
>  	pwrctrl->dev = dev;
>  	INIT_WORK(&pwrctrl->work, rescan_work_func);
> +
> +	if (!host_bridge->perst)
> +		return;
> +
> +	devfn = of_pci_get_devfn(dev_of_node(dev));
> +	if (devfn >= 0 && host_bridge->perst[PCI_SLOT(devfn)])

This seems to imply a 1:1 correlation between slots and pwrctrl devices,
almost as if you expect everyone is using drivers/pci/pwrctrl/slot.c.
But there is also endpoint-specific pwrctrl support, and there's quite
a bit of flexibility around what these hierarchies can look like.

How do you account for that?

For example, couldn't you have both a "port" and an "endpoint" pwrctrl? Would
they both grab the same PERST# GPIO here? And might that incur excessive
resets, possibly even clobbering each other?

Or what if multiple slots are governed by a single GPIO? Do you expect
the bridge perst[] array to contain redundant GPIOs?

Brian

> +		pwrctrl->perst = host_bridge->perst[PCI_SLOT(devfn)];
>  }
>  EXPORT_SYMBOL_GPL(pci_pwrctrl_init);

