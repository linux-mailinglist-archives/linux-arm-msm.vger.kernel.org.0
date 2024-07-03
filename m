Return-Path: <linux-arm-msm+bounces-25219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CAA926B6E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 00:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A8301C21618
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 22:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3720E18C35D;
	Wed,  3 Jul 2024 22:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="IWZBrYsD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CDF13D638;
	Wed,  3 Jul 2024 22:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720045293; cv=none; b=bGZXLMTyBfMUnvpnrW+HTHRL2Mg8WRvrMSqcrXGRKMgZ54+Tc4D5cuqsgMiV+6z87A+sx/88gsfRIIMpTt8WV3RF2gisFzwML9+DyoC0tU8yjPKKrGWm1Ohr7sMiZR5NMDQ/LJuKx4ZexsF3tjXFoh7A2/pYrLV5vvjOC88nNUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720045293; c=relaxed/simple;
	bh=qzUnn7OULqI4PPdR5CslAgQmY67Olz1L9cTNx/GdJMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TztYcywmrii8mwVkmH4nPWfYmCFV76OBxsyBwZFieg4y4+efF+el91G/SobKzwIMrZopV/xkpLNQK675qv7ainiW7UvoZtRts8fD4jYFazwdVq50OhXLxRhvu+a7pRw3GPVuN/rIfV8b2AyvCkKyoGNV5elkXXGk9T9nz+K3VDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=IWZBrYsD; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8q9zES3+zTRSwBcBDNrOTV1zjiXViyGhReGb+fJ4Fpo=; b=IWZBrYsD2j71YtY44VQeBpXYEC
	7TnuKsoqMTaPuelBlItQgCSPeQdljmwpisJtHO9hq/HAw1dMfPgtVay2Vg46R0ZdjBfAGZF2IzatK
	1Y3hVLJ+5EM60H6DscRNcQflJdlgTEwgohD0jma3HnnvWODWDGBDEvGiL1T/Tz9We+sM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sP8LX-001lt8-SR; Thu, 04 Jul 2024 00:21:03 +0200
Date: Thu, 4 Jul 2024 00:21:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, kernel@quicinc.com,
	Andrew Halaney <ahalaney@redhat.com>, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Add interconnect support for stmmac driver.\
Message-ID: <72c55623-8d62-4346-8f04-506d0eaed867@lunn.ch>
References: <20240703-icc_bw_voting_from_ethqos-v3-0-8f9148ac60a3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703-icc_bw_voting_from_ethqos-v3-0-8f9148ac60a3@quicinc.com>

On Wed, Jul 03, 2024 at 03:15:20PM -0700, Sagar Cheluvegowda wrote:
> Interconnect is a software framework to access NOC bus topology
> of the system, this framework is designed to provide a standard
> kernel interface to control the settings of the interconnects on
> an SoC.
> The interconnect support is now being added to the stmmac driver
> so that any vendors who wants to use this feature can just
> define corresponging dtsi properties according to their
> NOC bus topologies. 
> 
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>

Thanks for the rework.

It is normal to have a user of a new feature. Please could you patch a
few .dts files with these new properties.

Thanks
	Andrew
---
pw-bot: cr

