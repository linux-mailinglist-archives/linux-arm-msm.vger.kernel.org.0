Return-Path: <linux-arm-msm+bounces-84895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 479BFCB295B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 10:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83459302A112
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 09:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2722D7DFF;
	Wed, 10 Dec 2025 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhZlDmBj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD1D285418;
	Wed, 10 Dec 2025 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765359590; cv=none; b=FQIiaOf7w7Kx7IgcF7s4XzsLr+z3IgWTrKiPpEFtlusuaqHj1J4R2k/S79vVJSTpMkO+2stItVXAIARQ+B3uHxKwZZmwUdTBJRhWnfftkgbnmrrBtRcaOx788Fm2orGGY4epe/6G0/PG9dYWekcQgTcUWKmmoBZ//aDUymZA8xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765359590; c=relaxed/simple;
	bh=GJ8CPv7S16exQpJpGNdwn6ANx6ifdjDHTlnpwo1Lpu0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bWsGC1yjyM3SQG3ZGZFqkIKzvdANETHlj/RBJ11qgNOqeMYI+ijYQQk9hEyViKtKAYLf8l5H29twZ+Jni3oSEif9uxx3fgj9FJ+0vU1Bn+A3HL/KTEXIMsSGANw+fjSCkubyh8f7fipksJuEVP5qLU3ubVbz8G4IcGj/pq1FE8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhZlDmBj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3781C113D0;
	Wed, 10 Dec 2025 09:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765359590;
	bh=GJ8CPv7S16exQpJpGNdwn6ANx6ifdjDHTlnpwo1Lpu0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dhZlDmBjYEmKyc7pKokzqUfbT5t5Q8S0Dq+jMcvLlCHDwPp1EmMWCpWFyxkiuPeMu
	 ZD8OLHsFCfUc5ugiWDbBJOV6nM++6Br1uWOz7eWAKUJZzs/VIBNH9lN7ydxB52YTNi
	 yQdbrN9LDlc3JEUbFxhM0WD5GKJWJGwO/54jLMMsHF+GWFXjzKTTn134PszAFI4CmS
	 WiKIe80AzyN52niNVOl9tFTtOmtqMOfCrfHeHAjE+IltsMdIi9L1QoLCzroZBrzXht
	 WgG79Xl3aTwmXCqK+h+gLwHaD0GUXjW/tT8E7oiEn7e6RvPjUftKB+Uc5dCz2CkQ8C
	 X+JV3IcSJZC5w==
Date: Wed, 10 Dec 2025 18:39:46 +0900
From: Jakub Kicinski <kuba@kernel.org>
To: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Manivannan Sadhasivam <mani@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 2/2] bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and
 IP_ETH1 channels for QDU100
Message-ID: <20251210183946.3740a3b3@kernel.org>
In-Reply-To: <20251209-vdev_next-20251208_eth_v6-v6-2-80898204f5d8@quicinc.com>
References: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
	<20251209-vdev_next-20251208_eth_v6-v6-2-80898204f5d8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 09 Dec 2025 16:55:39 +0530 Vivek Pernamitta wrote:
> Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for M-plane, NETCONF and
> S-plane interface for QDU100.
> 
> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index e3bc737313a2f0658bc9b9c4f7d85258aec2474c..b64b155e4bd70326fed0aa86f32d8502da2f49d0 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -269,6 +269,13 @@ static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
>  	MHI_CHANNEL_CONFIG_DL(41, "MHI_PHC", 32, 4),
>  	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 256, 5),
>  	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 256, 5),
> +	MHI_CHANNEL_CONFIG_UL(48, "IP_SW1", 256, 6),
> +	MHI_CHANNEL_CONFIG_DL(49, "IP_SW1", 256, 6),
> +	MHI_CHANNEL_CONFIG_UL(50, "IP_ETH0", 256, 7),
> +	MHI_CHANNEL_CONFIG_DL(51, "IP_ETH0", 256, 7),
> +	MHI_CHANNEL_CONFIG_UL(52, "IP_ETH1", 256, 8),
> +	MHI_CHANNEL_CONFIG_DL(53, "IP_ETH1", 256, 8),

What is this CHANNEL_CONFIG thing and why is it part of the bus code
and not driver code? Having to modify the bus for driver changes
indicates the abstractions aren't used properly here..

