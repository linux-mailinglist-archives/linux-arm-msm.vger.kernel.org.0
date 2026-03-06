Return-Path: <linux-arm-msm+bounces-95710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLd+Jz9sqmkPRQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 06:55:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E1921BD87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 06:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13BCF301FD41
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 05:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B9336C0D7;
	Fri,  6 Mar 2026 05:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IW7pXcC7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B342BE639;
	Fri,  6 Mar 2026 05:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772776508; cv=none; b=mzZ9Rp+Vj/l8Rn9YxeCN4H07Us3LTPL59vUby/f6PwXa70j1mo9ruK2vSahYQZKhI/R2T8w5od8YE+wQYpV3VVYHAkY1CSgEF1604tKWO0F2/p2D4m/m3mLKfT1vPol/58C1M3NfMuDx6EiWNNVoxEtBjaHEWUStjTJBiSu/dVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772776508; c=relaxed/simple;
	bh=GUiuj7AaGmQpmRYyqhKAtU/WnjAxfsGJW6g2GYPPo9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSKMFv7lWWOMalo49l2D5zrZeVWBZdayhI4MFozo2FyGGEzHEfj2WC71Gmj8KCTomkpuSjkx3ifLqO7jrfQnUl5aYirDT+rjo4EWG+/9DAi1Wkb+yRKnuJg7fKGdtQexp7Ya3pDwJcLj1JGLxF3xPF5AQJ5tbunH6GLnHjuhkM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IW7pXcC7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837A1C4CEF7;
	Fri,  6 Mar 2026 05:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772776507;
	bh=GUiuj7AaGmQpmRYyqhKAtU/WnjAxfsGJW6g2GYPPo9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IW7pXcC7Gacp2Gysrx5tfJg8SAu4O8J32A05d3jIcxRdmEeZmqPXGCvK2Jls9vGcl
	 3NQLOG2HZBLQhGivk6C5FjU778Pfc4afWO38ViPAy5cy9EFYXe3uPb+9nLOifQUrP/
	 Q3zSC0ZXI8wGewTCsI9PJRl5UwPT/XD8u6HUf2IdIgadOXr2MY24ylYA0X3EqK66Nj
	 oY8oFmPXTLANw9E58LDEHK3ohqMYR17IXiKYTaPr9zHCMFp8XqyIjvNXwrI7zvOdXx
	 uj94oWjEOiHk8ygzLEKRB5iC/U/EOdriIy4TQikAzImhmScb1XC7B2W2Ec2rag1+sa
	 kMjaUfiRXYkZA==
Date: Fri, 6 Mar 2026 11:24:55 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v8 1/2] net: mhi: Enable Ethernet interface support
Message-ID: <myiqilk7t6yvqrjx5ew7srbtqh6xbk5jdd5pjqfeanwh3ymbdu@xy6lledx4hha>
References: <20260212-eth_vdev_next-20260211-v8-0-0974b3a8d61b@qti.qualcomm.com>
 <20260212-eth_vdev_next-20260211-v8-1-0974b3a8d61b@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260212-eth_vdev_next-20260211-v8-1-0974b3a8d61b@qti.qualcomm.com>
X-Rspamd-Queue-Id: D3E1921BD87
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95710-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 04:30:22PM +0530, Vivek Pernamitta wrote:
> From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> 
> Add support to configure a new client as Ethernet type over MHI by
> setting "mhi_device_info.ethernet_if = true". Create a new Ethernet
> interface named eth%d. This complements existing NET driver support.
> 
> Allocate MHI netdevs using NET_NAME_ENUM to reflect kernel-enumerated
> naming. This updates the reported name_assign_type for MHI net
> interfaces created by this driver, aligning naming semantics across
> existing and new devices. No functional or interface naming changes
> are introduced
> 
> Introduce IP_SW1, ETH0, and ETH1 network interfaces required for

IP_SW1 is not related to this patch.

> M-plane, NETCONF, and S-plane components.
> 

The main thing you want to describe in description is that IP_ETH channels are
representing the Ethernet interface of the MHI device for which the driver is
also creating the netdev interface so that the host can access the Ethernet
interface of the device.

> M-plane:
> Implement DU M-Plane software for non-real-time O-RAN management
> between O-DU and O-RU using NETCONF/YANG and O-RAN WG4 M-Plane YANG
> models. Provide capability exchange, configuration management,
> performance monitoring, and fault management per O-RAN.WG4.TS.MP.0-
> R004-v18.00.
> 
> NETCONF:
> Use NETCONF protocol for configuration operations such as fetching,
> modifying, and deleting network device configurations.
> 
> S-plane:
> Support frequency and time synchronization between O-DUs and O-RUs
> using Synchronous Ethernet and IEEE 1588. Assume PTP transport over
> L2 Ethernet (ITU-T G.8275.1) for full timing support; allow PTP over
> UDP/IP (ITU-T G.8275.2) with reduced reliability. as per ORAN spec
> O-RAN.WG4.CUS.0-R003-v12.00.
> 
> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> ---
>  drivers/net/mhi_net.c | 67 ++++++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 56 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
> index ae169929a9d8e449b5a427993abf68e8d032fae2..aa65b267d5c06c76482eaede097c500edc1cdf7f 100644
> --- a/drivers/net/mhi_net.c
> +++ b/drivers/net/mhi_net.c
> @@ -4,6 +4,7 @@
>   * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
>   */
>  
> +#include <linux/etherdevice.h>
>  #include <linux/if_arp.h>
>  #include <linux/mhi.h>
>  #include <linux/mod_devicetable.h>
> @@ -42,6 +43,7 @@ struct mhi_net_dev {
>  
>  struct mhi_device_info {
>  	const char *netname;
> +	bool ethernet_if;
>  };
>  
>  static int mhi_ndo_open(struct net_device *ndev)
> @@ -119,11 +121,29 @@ static void mhi_ndo_get_stats64(struct net_device *ndev,
>  	} while (u64_stats_fetch_retry(&mhi_netdev->stats.tx_syncp, start));
>  }
>  
> +static int mhi_mac_address(struct net_device *dev, void *p)
> +{
> +	if (dev->type == ARPHRD_ETHER)
> +		return eth_mac_addr(dev, p);
> +
> +	return 0;
> +}
> +
> +static int mhi_validate_address(struct net_device *dev)
> +{
> +	if (dev->type == ARPHRD_ETHER)
> +		return eth_validate_addr(dev);
> +
> +	return 0;
> +}
> +
>  static const struct net_device_ops mhi_netdev_ops = {
>  	.ndo_open               = mhi_ndo_open,
>  	.ndo_stop               = mhi_ndo_stop,
>  	.ndo_start_xmit         = mhi_ndo_xmit,
>  	.ndo_get_stats64	= mhi_ndo_get_stats64,
> +	.ndo_set_mac_address    = mhi_mac_address,
> +	.ndo_validate_addr      = mhi_validate_address,
>  };
>  
>  static void mhi_net_setup(struct net_device *ndev)
> @@ -140,6 +160,13 @@ static void mhi_net_setup(struct net_device *ndev)
>  	ndev->tx_queue_len = 1000;
>  }
>  
> +static void mhi_ethernet_setup(struct net_device *ndev)
> +{
> +	ndev->netdev_ops = &mhi_netdev_ops;
> +	ether_setup(ndev);
> +	ndev->max_mtu = ETH_MAX_MTU;
> +}
> +
>  static struct sk_buff *mhi_net_skb_agg(struct mhi_net_dev *mhi_netdev,
>  				       struct sk_buff *skb)
>  {
> @@ -209,16 +236,20 @@ static void mhi_net_dl_callback(struct mhi_device *mhi_dev,
>  			mhi_netdev->skbagg_head = NULL;
>  		}
>  
> -		switch (skb->data[0] & 0xf0) {
> -		case 0x40:
> -			skb->protocol = htons(ETH_P_IP);
> -			break;
> -		case 0x60:
> -			skb->protocol = htons(ETH_P_IPV6);
> -			break;
> -		default:
> -			skb->protocol = htons(ETH_P_MAP);
> -			break;
> +		if (!!mhi_netdev->ndev->header_ops) {

Why not just if (mhi_netdev->ndev->header_ops)?

But you should really check ARPHRD_ETHER type here and below.

> +			skb->protocol = eth_type_trans(skb, mhi_netdev->ndev);
> +		} else {
> +			switch (skb->data[0] & 0xf0) {
> +			case 0x40:
> +				skb->protocol = htons(ETH_P_IP);
> +				break;
> +			case 0x60:
> +				skb->protocol = htons(ETH_P_IPV6);
> +				break;
> +			default:
> +				skb->protocol = htons(ETH_P_MAP);
> +				break;
> +			}
>  		}
>  
>  		u64_stats_update_begin(&mhi_netdev->stats.rx_syncp);
> @@ -306,6 +337,9 @@ static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev)
>  	struct mhi_net_dev *mhi_netdev;
>  	int err;
>  
> +	if (!!ndev->header_ops)
> +		eth_hw_addr_random(ndev);
> +
>  	mhi_netdev = netdev_priv(ndev);
>  
>  	dev_set_drvdata(&mhi_dev->dev, mhi_netdev);
> @@ -356,7 +390,8 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
>  	int err;
>  
>  	ndev = alloc_netdev(sizeof(struct mhi_net_dev), info->netname,
> -			    NET_NAME_PREDICTABLE, mhi_net_setup);
> +			    NET_NAME_ENUM, info->ethernet_if ?
> +			    mhi_ethernet_setup : mhi_net_setup);
>  	if (!ndev)
>  		return -ENOMEM;
>  
> @@ -380,10 +415,17 @@ static void mhi_net_remove(struct mhi_device *mhi_dev)
>  
>  static const struct mhi_device_info mhi_hwip0 = {
>  	.netname = "mhi_hwip%d",
> +	.ethernet_if = false,

Default state is false isn't it? No need to set it explicitly.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

