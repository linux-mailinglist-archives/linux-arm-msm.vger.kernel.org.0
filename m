Return-Path: <linux-arm-msm+bounces-66610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81368B10FD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 18:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BCF85C128E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631542D3EC3;
	Thu, 24 Jul 2025 16:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaR/nUwc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D17E1F4CAC;
	Thu, 24 Jul 2025 16:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753375197; cv=none; b=cpxcweGRAAQPHEFvimLuLMxyrauVHPEVPaXj/CEgZDvGUBRWTTnLqYhxbxh/8uKyG2yAux4X6j2R/mm6l1aYBJ3sNDKvHpBVrWAu/pm3iP6Khh5jclzCUY7PxNnfTRZELj/l49OZgsrqkUh3zx1inBTRI9is/ILj46WXZrxmmmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753375197; c=relaxed/simple;
	bh=ikXpfz2B4DP7ZP1/9L2ttYBtpxlZEpT7Tcj+EmAhcGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdRGl+m8mjMvmJyxU2zmeLy72E1j/Zmo8WC7o20X+Vuhce+FeC/N2bThD0wupqQmwwKLC9LmDfeuc2cRAvYvu/cSG7dZIpveVXJIrB1Zon5D25TIgi6ohxy9lGAFxdCjJTL5TJ8PEQqL9RfN3KF77o2iem/Fi0HlV5k8iEgVTy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaR/nUwc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14ACAC4CEED;
	Thu, 24 Jul 2025 16:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753375197;
	bh=ikXpfz2B4DP7ZP1/9L2ttYBtpxlZEpT7Tcj+EmAhcGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BaR/nUwcvg97rh4i/Bqn3v2nnsulfLWo9qCHEl4Zo6vZbia5vDUNUrVr3XgUsBt86
	 UmMfeJFguWjZtbMNMfoEapef4rPzsRmMaZqN8cNnLUe7kpgLkHNy1Qr8pvv2oExJkE
	 zrBlK8O3O7diKI9Bw1QPbUcOrN/ggVP7ZXeJ0xJAE0catsyHlHKMSr9hSO/3GbB3r/
	 pQXgBJarqRxIvrIDwoYPE3QRP4NFNTnUuNiYQdIfEe9Fok5kgooCzHDOZ9SNOsl3jj
	 jFNwfuhb9vnfKBub/BhwUTFgVgdqb0wLPV/sHsZX5vLpdqpY0syPLkl2ApOKJRTrMu
	 KdOWCMOQG20gA==
Date: Thu, 24 Jul 2025 22:09:42 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vivek.Pernamitta@quicinc.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Vivek Pernamitta <quic_vpernami@quicinc.com>
Subject: Re: [PATCH 0/4] net: mhi : Add support to enable ethernet interface
Message-ID: <kyecepuwbomqsjhsmrkqdf66pwbdona5neroxjeqrxdcn7i7xa@izjqxntne3iw>
References: <20250724-b4-eth_us-v1-0-4dff04a9a128@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250724-b4-eth_us-v1-0-4dff04a9a128@quicinc.com>

On Thu, Jul 24, 2025 at 07:21:16PM GMT, Vivek.Pernamitta@quicinc.com wrote:
> - Add support to enable ethernet network device for MHI NET driver
>   currenlty we have support only NET driver.
>   so new client can be configured to be Ethernet type over MHI by
>   setting "mhi_device_info.ethernet_if = true"
> 
> - Change the naming format for MHI network interfaces to improve clarity
>   when multiple MHI controllers are connected.
> 
>   Currently, MHI NET device interfaces are created as mhi_swip<n>/mhi_hwip<n>
>   for each channel. This makes it difficult to distinguish between channels
>   when multiple EP/MHI controllers are connected, as we cannot map the
>   corresponding MHI channel to the respective controller and channel.
>   To address this, create a new MHI interface name based on the device name and
>   channel name.
> 
> - Add support for new MHI channels for M-plane, NETCONF and S-plane.
> 
> Initial post for Ethernet support in MHI driver is posted here
> https://lore.kernel.org/all/1689762055-12570-1-git-send-email-quic_vpernami@quicinc.com/
> 

What has changed since then? This series is supposed to be v4. And you haven't
resolved the v2 comments itself:
https://lore.kernel.org/mhi/1689660928-12092-1-git-send-email-quic_vpernami@quicinc.com/

- Mani

> Signed-off-by: 
> 
> ---
> Vivek Pernamitta (4):
>       net: mhi: Rename MHI interface to improve clarity
>       net: mhi : Add support to enable ethernet interface
>       net: mhi: Add MHI IP_SW1, ETH0 and ETH1 interface
>       bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for QDU100
> 
>  drivers/bus/mhi/host/pci_generic.c |   8 +++
>  drivers/net/mhi_net.c              | 100 +++++++++++++++++++++++++++++++------
>  2 files changed, 93 insertions(+), 15 deletions(-)
> ---
> base-commit: 9ee814bd78e315e4551223ca7548dd3f6bdcf1ae
> change-id: 20250724-b4-eth_us-97f0d5ba7f08
> 
> Best regards,
> -- 
> Vivek Pernamitta <<quic_vpernami@quicinc.com>>
> 

-- 
மணிவண்ணன் சதாசிவம்

