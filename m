Return-Path: <linux-arm-msm+bounces-37061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C539BCE11
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 14:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17DE21F22BDC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 13:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E161E1310;
	Tue,  5 Nov 2024 13:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aq8RmetU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14861D9A49;
	Tue,  5 Nov 2024 13:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730813769; cv=none; b=LzftmKCHMi8rHs2Xo+WVxFxbgH8baWXeIn1Jqjt+i1Ece5kS+MAsTfyBx+bqZ7od/gdvV+yeaR2v27DyDb2bU0fA6EcdkjahZKd6jAt84YZGYhubqSjf/Ps6pTsyEkv0v/dXuI4VLLYsjj5SmXlhhA0gyC7WZMVli3TDeuJ1Rlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730813769; c=relaxed/simple;
	bh=YykurtqbGlWC9tC8MPh6nSJFQYNjqf+WGkBn+I5mJYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hs4DthfZVwYNHbDfy++1aOr+Ywg2XKhRfF0Z1bDGfp0NNKe4VG+iTLgJbZz38tbrPUSuab8UmcC+Txvvuj+ZmLXGCcXaGXHKZvq0/AQy6zSScXdx+tEuVAxPCt55Q0x1W4ZsBjkGVxAmOro7lhO75PwRnTdiuowPkAgOoeV4bbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aq8RmetU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3784C4CED0;
	Tue,  5 Nov 2024 13:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730813769;
	bh=YykurtqbGlWC9tC8MPh6nSJFQYNjqf+WGkBn+I5mJYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aq8RmetUQet0Oe/6LcyzzN3BxazNTjdvaGJIMl5uqsxjhtrCwkJWYZTjAE/T+UKGB
	 shHnhJmSM/NnmNs6yAxLy0jTYVPTFwDZcAlWV3nRtWkLIFvbMeVSYGjSwGTeu+UvRn
	 ZVm9vZhnU9kI4rQsCUlx6qM3XXp7B/K9l68J5vNtuNtaAUH3iR83r1Aykl31wsCRDs
	 1vVcj9Lf9p2PKAtYcPqo/Y9MVgGINk4czg/X4sNJWosdTq0rAXaGltCvLfaqY0ISwa
	 ex4AtMNv145cmsfwiMgYmtPJzznN477DWGnW0NKSG72MH5yQfkWFKMYUc3zwkOIKic
	 GOe1BBLrJ35tg==
Date: Tue, 5 Nov 2024 14:36:04 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Zhongqiu Han <quic_zhonhan@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, kw@linux.com, kishon@kernel.org,
	bhelgaas@google.com, lpieralisi@kernel.org, dlemoal@kernel.org,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: epf-mhi: Fix potential NULL dereference in
 pci_epf_mhi_bind()
Message-ID: <ZyofRAZoAE5IgCVi@ryzen>
References: <20241105120735.1240728-1-quic_zhonhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105120735.1240728-1-quic_zhonhan@quicinc.com>

On Tue, Nov 05, 2024 at 08:07:35PM +0800, Zhongqiu Han wrote:
> If platform_get_resource_byname() fails and returns NULL, dereferencing
> res->start will cause a NULL pointer access. Add a check to prevent it.
> 
> Fixes: 1bf5f25324f7 ("PCI: endpoint: Add PCI Endpoint function driver for MHI bus")
> Signed-off-by: Zhongqiu Han <quic_zhonhan@quicinc.com>
> ---
>  drivers/pci/endpoint/functions/pci-epf-mhi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> index 7d070b1def11..2712026733ab 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> @@ -873,6 +873,11 @@ static int pci_epf_mhi_bind(struct pci_epf *epf)
>  
>  	/* Get MMIO base address from Endpoint controller */
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mmio");
> +	if (!res) {
> +		dev_err(&pdev->dev, "Failed to get MMIO base address\n");

dev_err(&epf->dev, "Failed to get mmio resource\n");
or
dev_err(&epf->dev, "Failed to get \"mmio\" resource\n");

Note: &epf->dev instead of &pdev->dev in order to be consistent with other
EPF ->bind() functions.

With that, feel free to add:
Reviewed-by: Niklas Cassel <cassel@kernel.org>


Kind regards,
Niklas

> +		return -ENODEV;
> +	}
> +
>  	epf_mhi->mmio_phys = res->start;
>  	epf_mhi->mmio_size = resource_size(res);
>  
> -- 
> 2.25.1
> 

