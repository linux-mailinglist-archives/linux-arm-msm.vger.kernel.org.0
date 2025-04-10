Return-Path: <linux-arm-msm+bounces-53807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99111A83FD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 12:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98B767BA04A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3698626AA9D;
	Thu, 10 Apr 2025 09:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOfvEmJa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077AD26A0C1;
	Thu, 10 Apr 2025 09:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279178; cv=none; b=J/Ecou+C4S3vXIG9IwGEsery1x06yNPRuW0ZGrfNITRTcLY6jbyH+Lv7GZ9qtutNoo1nInXHeSOZbz4AIf6UJf+BJjJmOeKqzPBWyNHhpa149tFw1p5CtHgvPvpieyjVnv36xSmboKwhl3SegeSwKOz0/j6EJyuCkurbDjXkiS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279178; c=relaxed/simple;
	bh=OLoyISjxtlYxrHqthuPpR+LH054SYc7FyhmF4e900cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPc9jUaEMIZwioBew0zr+1M3amUqvOjdMmJcQC0SH3wMeZ8ydlKb+oUxwyZZ/VIPckMpXNQttptWbuQ4UvQwQVRW4gzm1bPF4VQPpbuAslhyg4zsuJ6lQzU2qh4WDsESWBfupMCI6lSG3rh1zofxrJY0Da2YF4ryaBeKFxUiE98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOfvEmJa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C7CC4CEDD;
	Thu, 10 Apr 2025 09:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744279177;
	bh=OLoyISjxtlYxrHqthuPpR+LH054SYc7FyhmF4e900cQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOfvEmJag8Vqyu1E9yS32WtIWyEe3n9B8jzdmtGpzArg0CajdiER8vtqFZ8yQpe5/
	 mG2CCmwGGaT8IcnyBoYyTg2nyltCOIXy86eVtlDOatwsaeZ72FzYuDxdzgitpqslaC
	 eO53wDmLfdSopU/m6K51IySHfavbwx1r+Hgw6Fbd8sub14si//0GjMOl5KlEG1pzxY
	 +o11R7EwY5v4sNUL7uDiiZ/cJMW7y6l40B/DgGyvalKtsa4IYsheuShaIBfLA3MXVG
	 OfIbQfTcCj2LSLf7ZyvdEhPpFM64dgoaKmA/b+vaUuX2u31Md3R8K8zp2298+Phe8Z
	 lHtEbvJBa+0uQ==
Date: Thu, 10 Apr 2025 11:59:31 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	dmitry.baryshkov@linaro.org, Tsai Sung-Fu <danielsftsai@google.com>
Subject: Re: [RFC] PCI: pwrctrl and link-up dependencies
Message-ID: <Z_eWg9Zvc3bQho5S@ryzen>
References: <Z_WAKDjIeOjlghVs@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_WAKDjIeOjlghVs@google.com>

On Tue, Apr 08, 2025 at 12:59:36PM -0700, Brian Norris wrote:
> I also see that Manivannan has a proposal out [2] to add semi-generic
> link-down + retraining support to core code. It treads somewhat similar
> ground, and I could even imagine that its pci_ops::retrain_link()
> callback could even be reimplemented in terms of the aforementioned
> pci_ops::{start,stop}_link(), or possibly vice versa.

Just want to point out that there is a newer version of this series here:
https://lore.kernel.org/linux-pci/20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org/T/#t


Kind regards,
Niklas

