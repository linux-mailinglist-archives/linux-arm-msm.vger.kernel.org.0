Return-Path: <linux-arm-msm+bounces-87701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 901A8CF89C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 14:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F15293011F8F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 13:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3746A256C9E;
	Tue,  6 Jan 2026 13:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOWCPHNt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FBF13DBA0
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 13:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767707187; cv=none; b=qlSlWSzdsJz7YGHLWlpjCmow7OhXCs9ub1DuRCXdzHJu2n/s2gOKH/RoKdX0BEVEIJcyIcRMmn4hmgomgG3POIqQzJhZn9mfmUMQuPafAZQmVAXYqpZSLIUUxVZv6e4M4xYHs1g5967cYF4NQxnpihqyGEGdU2cELZHXV0hkyRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767707187; c=relaxed/simple;
	bh=4ejxZJiYyg2u5WcO+ScWWe+JhgLNy6gIpqZLxLyreRs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WM56Qn4Jek7Zhop2BDnKsJOxapmW8jzAU9IUd1/1nSzo/JSo1ciKtteF7CTgvQOQlreHNT7v+3ljo/6pZ9QpLFd+eYAExIswN+tJ67SZ3KZ9Ehl0fhcTE3mmKpin8FqMO50L9dO/r3XwCISIvnn2IU6zVqFX01baJPkMM1I9k0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOWCPHNt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC899C2BCB4
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 13:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767707186;
	bh=4ejxZJiYyg2u5WcO+ScWWe+JhgLNy6gIpqZLxLyreRs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=VOWCPHNt563Jx2u2fHCi/b5iM700H2SyDJYdy7T2PGFwLGyV0W/LgDCYcoeLCYooB
	 Nad66MorxmwLBcgHK7pjpVjNgUPS7zNS0b1fdHV9DZzNJBM93H/cnQvXFzgpIhNCpa
	 bvAs5+QlKefO8T+FoxmmvfkQUfrCZoz3UhyG2UZsj3ILJAMLGC8I17nkAf5xWqio81
	 LrclUJZu2jGkWZZz2bEQ2Xxe5pEvTj0b1faEzsIrjIwEHxI4pdnOt3UZzKO3z3/Ivq
	 59akQTRUPHTlQGo++BydJqB4zLqTwj1dzebgvZdQEastXR9xgOz0W10xbwLXoCADng
	 U+PxdtFvGtULw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-382f087e6c9so2524881fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 05:46:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWq+qpmoR6BLWjI7ZVnlXQLCcjRYEVKHdqBWGgndZW/u4vhAF9YDIj1fh5M/rRdHBm3JRIqDwcVw5wXAhgr@vger.kernel.org
X-Gm-Message-State: AOJu0Yycu8I2ZHOF3rriiOfuWgaZDOEdrRfFaHiZWwfG/IzXQeXM3zEw
	2mPyHD1qUVcQtzbZP+OwlwAIRly8Kz/Pbl7ZaVJR3LXDCOqKvpGDFNVO8lFR5jA+HEXG4PCJfZQ
	vgNOPvQuEN5KzoxzW4Usz3wgjCZKwt8XhvsJhv3Afrw==
X-Google-Smtp-Source: AGHT+IGTg7Zmtb3DV06X53avcKWYzhBfEMBVWhmF13m8wxvPkNUtSzr45+bO3/dQ4qEjcnSwabFJlvu5oNqO3I+dhuk=
X-Received: by 2002:a05:651c:1501:b0:37b:9a39:b885 with SMTP id
 38308e7fff4ca-382ea9f2e1emr8182411fa.8.1767707185189; Tue, 06 Jan 2026
 05:46:25 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 6 Jan 2026 07:46:23 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 6 Jan 2026 07:46:23 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260105-pci-pwrctrl-rework-v4-7-6d41a7a49789@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105-pci-pwrctrl-rework-v4-0-6d41a7a49789@oss.qualcomm.com> <20260105-pci-pwrctrl-rework-v4-7-6d41a7a49789@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 07:46:23 -0600
X-Gmail-Original-Message-ID: <CAMRc=MfhKfQ2b3Me_CaP0Jgj3+7fOZt9Zz4bqWiC-OvAOfd5gQ@mail.gmail.com>
X-Gm-Features: AQt7F2rKqujt7guT--eWZOjkmi0PWCmduen5pdhfU1mAygZLU62-LPQAQUAQcto
Message-ID: <CAMRc=MfhKfQ2b3Me_CaP0Jgj3+7fOZt9Zz4bqWiC-OvAOfd5gQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] PCI: Drop the assert_perst() callback
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Niklas Cassel <cassel@kernel.org>, 
	Alex Elder <elder@riscstar.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Jan 2026 14:55:47 +0100, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> Now since all .assert_callback() implementations have been removed from the
> controller drivers, drop the .assert_callback callback from pci.h.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  include/linux/pci.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 864775651c6f..3eb8fd975ad9 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -854,7 +854,6 @@ struct pci_ops {
>  	void __iomem *(*map_bus)(struct pci_bus *bus, unsigned int devfn, int where);
>  	int (*read)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val);
>  	int (*write)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val);
> -	int (*assert_perst)(struct pci_bus *bus, bool assert);
>  };
>
>  /*
>
> --
> 2.48.1
>
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

