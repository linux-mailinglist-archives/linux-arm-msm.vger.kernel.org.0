Return-Path: <linux-arm-msm+bounces-35695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 459E09AE8CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 16:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0D9E1F211C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 14:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC34C1E7658;
	Thu, 24 Oct 2024 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="E4MTcwgh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40371B393E;
	Thu, 24 Oct 2024 14:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729780068; cv=none; b=YlaV8x1qpnzrOWN/g5JgO7moXdlHUoT4eEW2ZQYxd5koVIhYGyk6Nn5LMFhtXzfd9jcSsJ8hQ6JmgwyZLBLRHsjVie5EPG49OjslfvwfQKk2WBPEEPwSSgMAtlSKbbKS1g4zOAm1hUqdeLHL9f2fPbTyMgkoCIGi3lfu1MyFAdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729780068; c=relaxed/simple;
	bh=J2+aXeLl5DWdt6WEQwAIXdlYTgr0+J1Z9HBQ4zDYOf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPu9viEeSVEXsY2yFRYr908QUgPfoAExE0YTgiBCm9+Id/+rFmS4d3gWfug6zNxF5y6IMsuhs/gYQcdgMESWFJZtCe/movGgHGmTsvVz59xe9fKu38Ewn18ELVP7JjcAYqY3DtH01wiMmHXC3FmeUou699KyCJ5fLUA9XrzX2nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=E4MTcwgh; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UPDtZCWQSXIyqEMMrOFW3RSbg7kYcGlFgSFOZvcOZkQ=; b=E4MTcwgh3meIWxKHk8/zFQAyRy
	0/AG0XD2Q+OitRy3tLK8anp/ixmgrLDDV08JWDCJJek0VEe7Nx8aov4ejrvKXiJk1Ebg2nIWSanZn
	DCiYbyqyZs0AU2itOf4K4tzh7u/uwGYw/26falcJ7g0+sPgL+aLOKJLlo0UcxXqOnLTQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t3yoF-00B8MN-RV; Thu, 24 Oct 2024 16:27:31 +0200
Date: Thu, 24 Oct 2024 16:27:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Kiran Kumar C.S.K" <quic_kkumarcs@quicinc.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, vsmuthu@qti.qualcomm.com,
	arastogi@qti.qualcomm.com, linchen@qti.qualcomm.com,
	john@phrozen.org, Luo Jie <quic_luoj@quicinc.com>,
	Pavithra R <quic_pavir@quicinc.com>,
	"Suruchi Agarwal (QUIC)" <quic_suruchia@quicinc.com>,
	"Lei Wei (QUIC)" <quic_leiwei@quicinc.com>
Subject: Re: RFC: Advice on adding support for Qualcomm IPQ9574 SoC Ethernet
Message-ID: <28409cbc-09c8-4c88-b11e-2c46457c9e8e@lunn.ch>
References: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
 <d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com>
 <817a0d2d-e3a6-422c-86d2-4e4216468fe6@lunn.ch>
 <c7d8109d-8f88-4f4c-abb7-6ebfa1f1daa3@quicinc.com>
 <Zv_6mf3uYcqtHC2j@shell.armlinux.org.uk>
 <ba1bf2a6-76b7-4e82-b192-86de9a8b8012@quicinc.com>
 <7b5227fc-0114-40be-ba5d-7616cebb4bf9@lunn.ch>
 <641f830e-8d21-4bc0-abe2-59e2c4d29b92@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <641f830e-8d21-4bc0-abe2-59e2c4d29b92@quicinc.com>

> > I'm just wondering if you have circular dependencies at runtime?
> > 
> > Where you will need to be careful is probe time vs runtime. Since you
> > have circular phandles you need to first create all the clock
> > providers, and only then start the clock consumers. Otherwise you
> > might get into an endless EPROBE_DEFER loop.
> > 
> 
> The Rx/Tx clocks sourced from the SERDES are registered as provider
> clocks by the UNIPHY/PCS driver during probe time. There is no runtime
> operation needed for these clocks after this.

So they are always ticking. You cannot turn them on/off? It is nice to
model them a fixed-clocks, since it describes the architecture, but i
have to question if it is worth the effort.

	Andrew

