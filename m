Return-Path: <linux-arm-msm+bounces-86478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EA1CDB73F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 07:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C9EE30245EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 06:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D682D3750;
	Wed, 24 Dec 2025 06:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WexLsb+9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523CD21B195;
	Wed, 24 Dec 2025 06:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766556520; cv=none; b=R45+WBRS5rwEQecHjoGub8tlOkyqdBz4GaUYyrh1cgK6q98uTGeEtCTq7TmqD0XlYSkJU+lqKc8WeWoVGJPL+24vWiaoSa9y29eRvD/x5u1etzwXfolcD1Fa9QuKNujeH7JpuTt5f4o07V27uzFinDilvpwE/G//JdGj9K4Xxl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766556520; c=relaxed/simple;
	bh=JmH0zrSQ6+/EEWnA8Jl67AkZZt0WzstjnoWbZwRqWXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRadw2+ZkT8c5uo7Ly40+uIDq8RdXKlaD5w9mEMF0hWF8JXXo40KxioNTylhLaMLvlL1j+VDpdHrVkRL4JvrYn+PeFnASLdaU5dpcaYIX62OCndLnr47cog6FwKX0PNDTkz3K2p3nwchhOaiSX9qi9FQd5wC6k7qT66WJFJl5tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WexLsb+9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF739C116B1;
	Wed, 24 Dec 2025 06:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766556519;
	bh=JmH0zrSQ6+/EEWnA8Jl67AkZZt0WzstjnoWbZwRqWXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WexLsb+9YsXtBtLsPdeTHDff8l+q8PX4ihuseK4LgObaSgUxp3yNzPAA/74jk3jG5
	 6zyLW9UZDLd8isVonziadSa3MdunoEpzcjtqYmCtVCHSIxT2DwQR+FtjvjQLx1i4Ym
	 y0j+Nue84n/FHcdW7h9qe/PpYbJLgq313rPZ5v4Rm5dTst3zEpPukggKYbjPXza4YE
	 B/h0X3ThVQucsor8s6viCdcy2TV7SE2kvkiT0AcMmyPQ1XczVUMABj0/mFgnj81vW9
	 g5ruN+FywnjBaAyHBEIicDwGS+Fau/UPPJ9mXz30t/qGdal2UmNNeteq+przhD8wg/
	 CMYoKfouPaLVQ==
Date: Wed, 24 Dec 2025 11:38:33 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: vivek pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 1/2] net: mhi: Enable Ethernet interface support
Message-ID: <lt7fco4vaztcodh7q32h2umzzksuhjwzmma4j6qxemskznycws@frmdzto3ca35>
References: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
 <20251209-vdev_next-20251208_eth_v6-v6-1-80898204f5d8@quicinc.com>
 <20251210183827.7024a8cf@kernel.org>
 <0235cdaf-4c91-4bb3-9581-9eb24cd1aa47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0235cdaf-4c91-4bb3-9581-9eb24cd1aa47@oss.qualcomm.com>

On Mon, Dec 22, 2025 at 04:13:11PM +0530, vivek pernamitta wrote:
> 
> 
> On 12/10/2025 3:08 PM, Jakub Kicinski wrote:
> > On Tue, 09 Dec 2025 16:55:38 +0530 Vivek Pernamitta wrote:
> > > Add support to configure a new client as Ethernet type over MHI by
> > > setting "mhi_device_info.ethernet_if = true". Create a new Ethernet
> > > interface named eth%d. This complements existing NET driver support.
> > > 
> > > Introduce IP_SW1, ETH0, and ETH1 network interfaces required for
> > > M-plane, NETCONF, and S-plane components.
> > > 
> > > M-plane:
> > > Implement DU M-Plane software for non-real-time O-RAN management
> > > between O-DU and O-RU using NETCONF/YANG and O-RAN WG4 M-Plane YANG
> > > models. Provide capability exchange, configuration management,
> > > performance monitoring, and fault management per O-RAN.WG4.TS.MP.0-
> > > R004-v18.00.
> > 
> > Noob question perhaps, what does any of this have to do with Ethernet?
> > You need Ethernet to exchange NETCONF messages?
> 
> The patch primarily addresses host-to-DU communication. However, the
> NETCONF/M-Plane packets originating from the host will eventually be
> transmitted from the DU to the RU over the fronthaul, which uses
> Ethernet. Bridging is therefore required to forward packets received
> from the host towards the fronthaul Ethernet interface.
> For additional details on this architecture and data flow, please
> refer to the O-RAN Management Plane Specification:
> 

You missed one obvious point. The actual link between the device (QDU100) and
the host is PCIe/MHI. The device has the Etherent inteface and is exposed as the
MHI channel to the host. So this patch creates the Ethernet interface on the
host based on the 'IP_ETH' channel so that the host can use this interface for
exchaning the NETCONF packets.

All the rest of the O-RAN management details are irrelevant.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

