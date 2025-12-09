Return-Path: <linux-arm-msm+bounces-84776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A57CB012B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 14:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 011FC3072E37
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 13:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026753271FE;
	Tue,  9 Dec 2025 13:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="jdnI/NN4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D782221D96;
	Tue,  9 Dec 2025 13:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765287431; cv=none; b=Uzs54JWhkAF7PkBw5WpQ/sC/+t7aNTwirrFG4bzv5u07DDPKDawdHAwWn8KYKrZpyp+qdJfc41v6jsu9qpsenx6WtJn/QbPJhjxDn1LQxJoFfXnqZ+b2Ed1ZIyqjDiHj/EsyLleFf1XhKUHvkpEHDpB41JcygcMVP6IVeveH9vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765287431; c=relaxed/simple;
	bh=muuB0RdQ1Ps1jrTh03xzMRZ51ve6oMC3M/a6DjHI4uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gslwAFCjLxuqr7myZ9lqEb9pokLjvG/n/O0rmNOQmZUlh3UijIdisSpjuNetnji4O14ouwx20x7l44NXYMsk5CT4PnTzL/EUQ8OEp/sA/OnIq0ocoOk6SJh9XNG/+1zCXstduyzif/3lqogsOUxILGZ2oeN5VcKZueRHe9/iSUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=jdnI/NN4; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=s9MvnYuP6roOHf+OO0pXHIi0RkgGQOPsyaTOJ7Yh0y4=; b=jdnI/NN4SuhC0Gc4N/ZGAbLm8i
	i00p/vJBNR0aybwvEaOf/7i+MjovUrg/H0BFHaxCmv96xunzyn+er8WnKLpUeUXasPrd/bhUP/xQb
	va3NQm+1y+68hhZfnE+k+iaEfk9Dv+YGL2nfEau0EcjCuphANAW/epf4XGHSPoR+s/QI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vSxth-00GTIF-8M; Tue, 09 Dec 2025 14:36:57 +0100
Date: Tue, 9 Dec 2025 14:36:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Manivannan Sadhasivam <mani@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 1/2] net: mhi: Enable Ethernet interface support
Message-ID: <5a137b11-fa08-40b5-b4b4-79d10844a5b7@lunn.ch>
References: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
 <20251209-vdev_next-20251208_eth_v6-v6-1-80898204f5d8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209-vdev_next-20251208_eth_v6-v6-1-80898204f5d8@quicinc.com>

>  	ndev = alloc_netdev(sizeof(struct mhi_net_dev), info->netname,
> -			    NET_NAME_PREDICTABLE, mhi_net_setup);
> +			    NET_NAME_PREDICTABLE, info->ethernet_if ?
> +			    mhi_ethernet_setup : mhi_net_setup);

Is the name predictable? I thought "eth%d" was considered
NET_NAME_ENUM?

https://elixir.bootlin.com/linux/v6.18/source/net/ethernet/eth.c#L382

	Andrew

