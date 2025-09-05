Return-Path: <linux-arm-msm+bounces-72309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D0AB45AEF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 16:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B15CA172E33
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 14:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C7736CDE5;
	Fri,  5 Sep 2025 14:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqTKqtHJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFB6275106;
	Fri,  5 Sep 2025 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757083905; cv=none; b=XtObkKrvvj/HW6iAROcL1Im2DcIkBTurlhCCP+G/FWKhbhBOet79sT361oN3VEaeWU/TrfuuGQFRkzOS/9h4SAUIfXKXm28PTqe+51R85Q4tVOM0sX6azh3E2dMxocCruTcU8TOzdOD4sFHsuYohFy1LxbgZenU/qUZ84OIyvEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757083905; c=relaxed/simple;
	bh=OulwDIpATpaTJKhVFbj1IKtDag7TbmPUGG9Y/1g4th4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhLlO4yJTAr0EP0GLUOyAn5pgsPywTdpxuf2woh/laZIM9X38/ZXL3EMRh/2vFomexY42MOGuv9xGmtt7DUB7qxnLWZuxv6dPSD6z+AYLrMCujltNnJ9gU6LypGG1Ml681Znnq8p1jW8SQ24HsXhK7K3cLKIsj5VNpjw51ysr58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqTKqtHJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778F8C4CEF1;
	Fri,  5 Sep 2025 14:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757083904;
	bh=OulwDIpATpaTJKhVFbj1IKtDag7TbmPUGG9Y/1g4th4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZqTKqtHJ/7IhKd3dkSmI3W9CZyTKo7t3mNerylRaXD+t7fcvUOMJnD0A1da/LQEVI
	 6TZHb3FMgm8pnhc+XrK/XTQ+GB9Z9DJUAsQNpGIwbtDcvbVqiYPg+uou22+HHNfmm7
	 AsxEYFfscn19ova7CuY1ElBdmDeGoDJcAmTACdnDX/gl4s64NJRLkdQHlJO5Kjw9Vk
	 K3jUs/gjrCkFrIBkvf+agSyp+F3/JLN1qcpyyv5cW4mtUcDH8uAvfZs0ex3w+umTJu
	 nsELlj5nTEXPNovLJxZymo00Gc2IOtVTnvLjZQy5DAYZtmz/ZyjcPMdu8XdLSbabg7
	 CIAZ9UDbfNY4Q==
Date: Fri, 5 Sep 2025 20:21:38 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vivek.Pernamitta@quicinc.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vivek Pernamitta <quic_vpernami@quicinc.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/6] bus: mhi: host: pci_generic: Add SRIOV support
 for PCIe device
Message-ID: <bp4vxovymcz44zqdexidroeexzlmsd4tm5ntgtju4ohmw6erhw@lssi565zabps>
References: <20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com>
 <20250821-vdev_next-20250821_sriov-v3-3-e1b017c48d4a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821-vdev_next-20250821_sriov-v3-3-e1b017c48d4a@quicinc.com>

On Thu, Aug 21, 2025 at 06:25:35PM GMT, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> Add SR-IOV support for PCIe devices.

pci_generic file name itself indicates that this is a PCIe device driver. So no
need to mention 'for PCIe device' in subject and description.

- Mani

> pci_sriov_configure_simple() will enable or disable SR-IOV for devices
> that don't require any specific PF setup before enabling SR-IOV.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index df18627a9feb4f2d53ba1ca6a4e8087dc23c7873..351b177cdf84057fb5a4e2f5b52279d7f1da41c2 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1696,7 +1696,8 @@ static struct pci_driver mhi_pci_driver = {
>  	.remove		= mhi_pci_remove,
>  	.shutdown	= mhi_pci_shutdown,
>  	.err_handler	= &mhi_pci_err_handler,
> -	.driver.pm	= &mhi_pci_pm_ops
> +	.driver.pm	= &mhi_pci_pm_ops,
> +	.sriov_configure = pci_sriov_configure_simple,
>  };
>  module_pci_driver(mhi_pci_driver);
>  
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

