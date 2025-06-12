Return-Path: <linux-arm-msm+bounces-61127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B29A7AD76A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 17:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32F7816CB40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 15:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D477B299A80;
	Thu, 12 Jun 2025 15:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="yt01YW6k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22661298CD2;
	Thu, 12 Jun 2025 15:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742607; cv=none; b=rumciY7DCPIX0dahXfuoPtvKYMGfogb7XSh8TRYI3rBo1rwchZGyhwtmfTPVQOxWzGMIFxg2r/BelYiRCfDsfcdZsUCU2vqYLwO4CLDTLQX0gBPfxfxcYqAatUvwMNSCT5mJHkYQKh8lJfZfevpWoJ+ysJSvt+LeXZDieWE2dYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742607; c=relaxed/simple;
	bh=YkGQb8u2LFs6Ny5AZDZ8dQLB2Mj5Hwh5mCAoXi9JxhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWsmdJEJDWJB9sT2RHhue+xtyo5IfsChUcKb8jystETJ3Pn5vzMeUtcLchenVD1Iw1o2TIg/qMR5Ijirc19fNOJxw8dU3pqVQzSwp/eqSEEw3XNHenYDvJtaqVHG9y+gLI4owvaYv2OEyqbY8/eIc9QvIxhnieNxWbi540fldxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=yt01YW6k; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QrJhlPmIGFpkmPRtfeqRYsI2Ia1MBPkjaqSOSbGZiSs=; b=yt01YW6k4t6UAt7H4xX6DshAhI
	i0quv3ifop6RM7RcEvjAwOADbe58RlzVgrd6fn8Sv3QwWQO+qf3bAdvAVrA1vgvJDqbaDo+n7zzlj
	4X13J99n1oGhBOwg9McPGr3hByePOxmfvQpMmNNSHgyB7xzX8WyS0yxdev82S46khAn4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uPjyn-00FYqi-JH; Thu, 12 Jun 2025 17:36:37 +0200
Date: Thu, 12 Jun 2025 17:36:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v5 3/5] net: phy: qcom: at803x: Add Qualcomm
 IPQ5018 Internal PHY support
Message-ID: <096eacfe-ff24-4ed8-b223-04a6fe590496@lunn.ch>
References: <20250612-ipq5018-ge-phy-v5-0-b5baf36705b0@outlook.com>
 <DS7PR19MB88833EF18DC634F4D7F037439D74A@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR19MB88833EF18DC634F4D7F037439D74A@DS7PR19MB8883.namprd19.prod.outlook.com>

On Thu, Jun 12, 2025 at 05:11:07PM +0400, George Moussalem wrote:
> The IPQ5018 SoC contains a single internal Gigabit Ethernet PHY which
> provides an MDI interface directly to an RJ45 connector or an external
> switch over a PHY to PHY link.
> 
> The PHY supports 10BASE-T/100BASE-TX/1000BASE-T link modes in SGMII
> interface mode, CDT, auto-negotiation and 802.3az EEE.
> 
> Let's add support for this PHY in the at803x driver as it falls within
> the Qualcomm Atheros OUI.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


