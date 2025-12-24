Return-Path: <linux-arm-msm+bounces-86477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C67D1CDB727
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 07:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 930FA30245ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 06:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A22F29E101;
	Wed, 24 Dec 2025 06:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IzwWyFZP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A47274FCB;
	Wed, 24 Dec 2025 06:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766556235; cv=none; b=jgj2KFsMFcXo27E1q2kceAWtPmHB2yHYgdJRNEBFHK+wPFlYoCnBvNplTRjO3tbxF4WHUb1auAwnrnbc0Khn/wmTgTEhhjYPMf1cEshzT1K2ErnIu8cabaJIlqFS2Zwjn0f6MuWhe90wI229OZwEU4rXp8MYtB6mA76Sd4EIIK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766556235; c=relaxed/simple;
	bh=0hYZ9Y14uSC33RC8Ylv2edSznE2aDXS5X0ncuGFvlio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UuIsZ1NYSj2ZWyICP6zUaYFice1SwOg0whgVyeOvgRqr0zJGzvYFIcULmBhUp3VED96UscKc/grJnizQxn5dq7iD+tyjZjasVJSPY6JScnHRb3s4UOjeir9IVBjQzIewQiUHi34xYKTZldrVtMbXPoP7WHCiaASkc+UIyNgGC5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IzwWyFZP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF7BC4CEFB;
	Wed, 24 Dec 2025 06:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766556235;
	bh=0hYZ9Y14uSC33RC8Ylv2edSznE2aDXS5X0ncuGFvlio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IzwWyFZPa9xnzF29m1cEZb9WW7t8NKbG0evjdO5IEcun3iJ4cVgGqcUnfqALBHQzz
	 8qKe9Xq4YMWfwlHlLt2KTF6Lqnv4vVL12lXPUIHGcaFpnTbap8WkSmhw/af9t5IQPU
	 xaSWMeONR7KNbT6/8u2C2z0nHhYglZScAxthsxAVVVovSPXU1nhtp24vfH4e8ugO8V
	 oefm5k3QoDFqEcUeeBqQuvMgs6huLf0nQtOkw9eZedmx1tKZ7ds2/1lHEDzVAJHwBC
	 mJB9IFndscpJKEAf0uKKxeVvNDCV+aFnTzOSuWVUjMubLFxtzsiMZS6yzuv6IVMB4m
	 lsxxy4Ba0djxg==
Date: Wed, 24 Dec 2025 11:33:48 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 0/2] net: mhi: Add support to enable ethernet interface
Message-ID: <2sx75x2v24o23hlhvl3cfem4npzejt4k3dmwnaqgxykzrr7kyg@g7k5fp4nr4wy>
References: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>

On Tue, Dec 09, 2025 at 04:55:37PM +0530, Vivek Pernamitta wrote:
> Add support to configure a new client as Ethernet type over MHI by
> setting "mhi_device_info.ethernet_if = true". Create a new Ethernet
> interface named eth%d. This complements existing NET driver support.
> 
> Introduce IP_SW1, ETH0, and ETH1 network interfaces required for
> M-plane, NETCONF, and S-plane components.
> 

You did not even mention the MHI channels added in this series.

> M-plane:
> Implement DU M-Plane software for non-real-time O-RAN management
> between O-DU and O-RU using NETCONF/YANG and O-RAN WG4 M-Plane YANG
> models. Provide capability exchange, configuration management,
> performance monitoring, and fault management per O-RAN.WG4.TS.MP.0-
> R004-v18.00.
> 
> Netconf:
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

Sorry, this is just AI slop. Please describe how the newly created interfaces
are supposed to be used, relevant tools etc...

- Mani

> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> ---
> patchset link for V5 : https://lore.kernel.org/all/20251106-vdev_next-20251106_eth-v5-0-bbc0f7ff3a68@quicinc.com/
> patchset link for V1 (first post) : https://lore.kernel.org/all/20250724-b4-eth_us-v1-0-4dff04a9a128@quicinc.com/
> 
> changes to v6:
> - Removed interm variable useage as per comments from Simon and Dmirty.
> - Squashed gerrits 1 and 2 in single gerrit.
> - Added more description for M-plane, Netconf and S-plane.
> 
> changes to v5:
> - change in email ID from "quic_vpernami@quicinc.com" to "vivek.pernamitta@oss.qualcomm.com"
> - Renamed to patch v5 as per comments from Manivannan
> - Restored to original name as per comments from Jakub
> - Renamed the ethernet interfce to eth%d as per Jakub
> ---
> 
> ---
> Vivek Pernamitta (2):
>       net: mhi: Enable Ethernet interface support
>       bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for QDU100
> 
>  drivers/bus/mhi/host/pci_generic.c |  8 ++++
>  drivers/net/mhi_net.c              | 75 +++++++++++++++++++++++++++++++-------
>  2 files changed, 70 insertions(+), 13 deletions(-)
> ---
> base-commit: 82bcd04d124a4d84580ea4a8ba6b120db5f512e7
> change-id: 20251209-vdev_next-20251208_eth_v6-c405aed13fed
> 
> Best regards,
> -- 
> Vivek Pernamitta <<quic_vpernami@quicinc.com>>
> 

-- 
மணிவண்ணன் சதாசிவம்

