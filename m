Return-Path: <linux-arm-msm+bounces-80710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CBBC3EF7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 09:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C33AA34C83A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 08:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C8A3126BC;
	Fri,  7 Nov 2025 08:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+MzS06z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BCC310644;
	Fri,  7 Nov 2025 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762504237; cv=none; b=pQlbnu2GnndzAFT1c9W9JjBLB23jyLDzG3q7k7+m/8OyOYHBrvqZzSfQppeT3zMQAolzzwlpPKE+Q0BflGNLKl5iHoCbemV85z4zbDPYa8HVOeLagWm0PBlytYS3O8pdjjzx3C4O0b26LFbhrxXCPlvNxTLNa8qoxwBYZVAm/Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762504237; c=relaxed/simple;
	bh=tPXVlbPjql/E3f3Mw6y71YqYcOs+k/Mtze3uI5jGOqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KCkerFuFFgE63+7HhA8Md7e8GVkVDk5gFDyY2yoT/hL6Bpf6aqLqdjpGjQvYQ9tdfVgjFdTw8EPbKGocN5lzGwEXFi1cAO85s3A+TDhIhLcaOFAy5iLJYO3rQyRIML9sen3jLqcPXcWMVdmjGJNvnB5dOpFyV6E/oOIhBrgzm0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+MzS06z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC3EC4CEF5;
	Fri,  7 Nov 2025 08:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762504236;
	bh=tPXVlbPjql/E3f3Mw6y71YqYcOs+k/Mtze3uI5jGOqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+MzS06zvhof/0yIGQy/HwPmBxNjrRjmC789E6An70+4aE/67MMjCfAVd2Qqqu0Sx
	 g5SC+dv3UedbRrB+zDKd3Nb8FgZ0tEvGoHBwNIXQ7envKZ/6erlhPY8aMS3MWnG28e
	 e1PMbRvoB6kZoLf8kDC82sxP8VVGL2faFbmK5Q0/DiszN6/DWbiD4wQeVcgL4roGT2
	 3A2xUGP9jx9MBZg3N8s17iusVGfMzStMIq1ydfWKx3eB88pWTOROreqebduJX78kAR
	 BfU3OMCkFDuMVXxstDaEF09P9P0FK+1IyAQRUczULElAgJ0J4BSOdmD2AYpSIC/iET
	 sOjCN6j16GpGA==
Date: Fri, 7 Nov 2025 08:30:32 +0000
From: Simon Horman <horms@kernel.org>
To: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Manivannan Sadhasivam <mani@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 1/3] net: mhi : Add support to enable ethernet
 interface
Message-ID: <aQ2uKPThPbTFhwKq@horms.kernel.org>
References: <20251106-vdev_next-20251106_eth-v5-0-bbc0f7ff3a68@quicinc.com>
 <20251106-vdev_next-20251106_eth-v5-1-bbc0f7ff3a68@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-vdev_next-20251106_eth-v5-1-bbc0f7ff3a68@quicinc.com>

On Thu, Nov 06, 2025 at 06:58:08PM +0530, Vivek Pernamitta wrote:
> From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> 
> Currently, we only have support for the NET driver. This update allows a
> new client to be configured as an Ethernet type over MHI by setting
> "mhi_device_info.ethernet_if = true". A new interface for Ethernet will
> be created with eth%d.
> 
> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

...

> @@ -119,11 +122,37 @@ static void mhi_ndo_get_stats64(struct net_device *ndev,
>  	} while (u64_stats_fetch_retry(&mhi_netdev->stats.tx_syncp, start));
>  }
>  
> +static int mhi_mac_address(struct net_device *dev, void *p)
> +{
> +	int ret;
> +
> +	if (dev->type == ARPHRD_ETHER) {
> +		ret = eth_mac_addr(dev, p);
> +	return ret;

nit: the indentation for the line above seems incorrect.

> +	}

But I wonder if we can simplify this slightly, like this:

	if (dev->type == ARPHRD_ETHER)
		return eth_mac_addr(dev, p);

Which would allow ret to be entirely removed from this function.

> +
> +	return 0;
> +}
> +
> +static int mhi_validate_address(struct net_device *dev)
> +{
> +	int ret;
> +
> +	if (dev->type == ARPHRD_ETHER) {
> +		ret = eth_validate_addr(dev);
> +		return ret;
> +	}

Likewise here.

> +
> +	return 0;
> +}

...

> @@ -140,6 +169,14 @@ static void mhi_net_setup(struct net_device *ndev)
>  	ndev->tx_queue_len = 1000;
>  }
>  
> +static void mhi_ethernet_setup(struct net_device *ndev)
> +{
> +	ndev->netdev_ops = &mhi_netdev_ops;
> +	ether_setup(ndev);
> +	ndev->min_mtu = ETH_MIN_MTU;

nit: The configuration on the line above is included in ether_setup.

> +	ndev->max_mtu = ETH_MAX_MTU;
> +}
> +
>  static struct sk_buff *mhi_net_skb_agg(struct mhi_net_dev *mhi_netdev,
>  				       struct sk_buff *skb)
>  {

...

> @@ -380,10 +431,17 @@ static void mhi_net_remove(struct mhi_device *mhi_dev)
>  
>  static const struct mhi_device_info mhi_hwip0 = {
>  	.netname = "mhi_hwip%d",
> +	.ethernet_if = false,
>  };
>  
>  static const struct mhi_device_info mhi_swip0 = {
>  	.netname = "mhi_swip%d",
> +	.ethernet_if = false,
> +};
> +
> +static const struct mhi_device_info mhi_eth0 = {
> +	.netname = "eth%d",
> +	.ethernet_if = true,
>  };

W=1 builds warn that mhi_eth0 is unused.
I think this can be addressed by squashing patches 1/2 and 2/2.

...

-- 
pw-bot: changes-requested

