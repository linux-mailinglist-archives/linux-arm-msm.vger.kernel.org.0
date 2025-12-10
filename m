Return-Path: <linux-arm-msm+bounces-84919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7E3CB3879
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 17:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2E65300E168
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 16:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FF93176E3;
	Wed, 10 Dec 2025 16:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="fa2QGHTC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAC06F2F2;
	Wed, 10 Dec 2025 16:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765385429; cv=none; b=YfbZpFdz7VqHMKCCBgbjPXScZEJaETkRqHCODV2Jm2HrBGssZTw4pmyTnANlxBEy0iCOmRxMVngidoD1oaZ60riKOtar3IYubDd2wQtHyRYqdBrM3StbKin4yuZMSWkPeeiHA9lPfFoomUhHRuDhBVntocWgPMFEcK+tk+uY2Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765385429; c=relaxed/simple;
	bh=GCDzIb3tl5yDTqXZF6pmN2czwQ7pJdaLAGC0yIkQp9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Og46yjZ2Fd8u24V4kbV3cS7VIGgAUO/UodvFN51dLiYh9HQA5TorKiZFnrbu/fCoPlOIhXvnytToxsL5d0g2/o+uySXa97rISFlLQ8/FuyifAHRNBiNWFXkSH5h2wDGuE/IqxYAghJa1ye3A0d/5Z4GB9Mi64/owV3xE1TaB6Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=fa2QGHTC; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=Vh8A0kHQh/ODbpZL+WlirqsdOP1ybMV2pCD+bS+4Tfk=; b=fa
	2QGHTC8n9G5Q+aLOuibClNQQ2nvaIZUL4gU+IooCgAIzJcLC34X8GSFgNT7PSAlGv7QRN3zjF81n1
	QOuJ2Fre4Pxpf80oabffZ7oap5VHBTeKvv+qb5tc4pcauMKskoXw/J7vNmdtZQ9vkrTVaHP5uCUJT
	iCBSY8wj8pjWd0g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vTNOI-00GYup-HY; Wed, 10 Dec 2025 17:50:14 +0100
Date: Wed, 10 Dec 2025 17:50:14 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: vivek pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Manivannan Sadhasivam <mani@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 1/2] net: mhi: Enable Ethernet interface support
Message-ID: <a8e6a25a-24c6-4739-a9cc-0e0621f093ed@lunn.ch>
References: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
 <20251209-vdev_next-20251208_eth_v6-v6-1-80898204f5d8@quicinc.com>
 <5a137b11-fa08-40b5-b4b4-79d10844a5b7@lunn.ch>
 <eaf79686-9fcb-4330-8017-83a4e4923985@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eaf79686-9fcb-4330-8017-83a4e4923985@oss.qualcomm.com>

On Wed, Dec 10, 2025 at 10:46:11AM +0530, vivek pernamitta wrote:
> 
> On 12/9/2025 7:06 PM, Andrew Lunn wrote:
> 
>                 ndev = alloc_netdev(sizeof(struct mhi_net_dev), info->netname,
>         -                           NET_NAME_PREDICTABLE, mhi_net_setup);
>         +                           NET_NAME_PREDICTABLE, info->ethernet_if ?
>         +                           mhi_ethernet_setup : mhi_net_setup);
> 
>     Is the name predictable? I thought "eth%d" was considered
>     NET_NAME_ENUM?
> 
>     https://elixir.bootlin.com/linux/v6.18/source/net/ethernet/eth.c#L382
> 
>             Andrew
> 
> For Ethernet-type devices, the interface name will follow the standard
> convention: eth%d,
> For normal IP interfaces, the interface will be created as mhi_swip%d/
> mhi_hwip%d.
> The naming will depend on the details provided through struct mhi_device_info.

Take a look again at my question. Why is NET_NAME_PREDICTABLE correct?
Justify it. Especially given what alloc_etherdev_mqs() does.

	Andrew

