Return-Path: <linux-arm-msm+bounces-28251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B1794D15F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 15:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94CB01C2281A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 13:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73878195803;
	Fri,  9 Aug 2024 13:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="xrfdBGe7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AFF197A76;
	Fri,  9 Aug 2024 13:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723210510; cv=none; b=WWzJfsC2EBi9UMtkbnvcmcrWeJiXJyzJCs9jybvef0fTKrGhIpsM5zyVOmChCM208vmFwLyDV3AN2UkyPKoMDWlfdl2X+ZSzWyjW5onAtrVqo2YgrZWlSWejT6SydMLVyTxT+15hydEr77Q20Vz67iFukc4fal4tmD/zenKPCqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723210510; c=relaxed/simple;
	bh=pVyYpJH8wI5w1h0h5ybQU9m7NylvbllHOT46rlOa7i4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=het8rqoTxMfsmVxi4l7XU6ABjkuItGqEo/WOaJc2TLapF7R9TKr0FlWjpJKuF5QACFcuMdE0oxJ0Urm6Y5bImaBZX5DlOoLkd1bp+A52UhExFSfjL1DuFbpxC1thAQIPth9Swu6FZjeK+e9PmUcYPoKNXYtOwsabKwwq+w2Y6Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=xrfdBGe7; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UomqgavaT6/G7STdNi4p3UGsQ2gqpZl8dEKz+C9zLl4=; b=xrfdBGe74AxQkuF1MTbRn8Ts+/
	pG8OxzkMI+9633un2DgDUsawFCgKCThICt5jkqF4SaQo9xlrndr2zlczsQ+L+laLa/5RkdUOJB8O1
	PbBkasgAM4PR2lZdsix8Gzvr+ar1/l4b/31bOm5+mB4piJDyuiJKCNAo7lPpFAewB3+U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1scPlh-004Ndj-PD; Fri, 09 Aug 2024 15:34:57 +0200
Date: Fri, 9 Aug 2024 15:34:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jie Luo <quic_luoj@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com
Subject: Re: [PATCH 3/4] arm64: defconfig: Enable Qualcomm IPQ common PLL
 clock controller
Message-ID: <379dc513-2eb5-4d33-a09e-e8861dddc502@lunn.ch>
References: <20240808-qcom_ipq_cmnpll-v1-0-b0631dcbf785@quicinc.com>
 <20240808-qcom_ipq_cmnpll-v1-3-b0631dcbf785@quicinc.com>
 <afbf0554-56a5-4df0-9e4b-97c065d78bb3@kernel.org>
 <41aea3f3-d21a-4d8e-a91a-0fe06947c75f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41aea3f3-d21a-4d8e-a91a-0fe06947c75f@quicinc.com>

On Fri, Aug 09, 2024 at 07:36:35PM +0800, Jie Luo wrote:
> 
> 
> On 8/8/2024 10:41 PM, Krzysztof Kozlowski wrote:
> > On 08/08/2024 16:03, Luo Jie wrote:
> > > The common PLL clock controller provides fixed rate output clocks to
> > > the hardware blocks that enable ethernet function on IPQ platform.
> > 
> > That's defconfig for all platforms, so how anyone can guess which one
> > you target here? Be specific, which company, which Soc, which board
> > needs it.
> > 
> 
> Sure, I will update the commit message as below to provide the details
> required.
> 
> The common PLL hardware block is available in the Qualcomm IPQ SoC such
> as IPQ9574 and IPQ5332. It provides fixed rate output clocks to Ethernet
> related hardware blocks such as external Ethernet PHY or switch. This
> driver is initially being enabled for IPQ9574. All boards based on
> IPQ9574 SoC will require to include this driver in the build.

Does it provide more than Ethernet clocks? I'm just wondering why the
name `common`, when it seems pretty uncommon, specialised for Ethernet
clocks on a couple of SoCs.

   Andrew

