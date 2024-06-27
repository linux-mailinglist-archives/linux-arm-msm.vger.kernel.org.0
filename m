Return-Path: <linux-arm-msm+bounces-24397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FAB919BA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 02:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 982E41F24247
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 00:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B73317F8;
	Thu, 27 Jun 2024 00:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="CmIexwDU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B907E15B7;
	Thu, 27 Jun 2024 00:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719447314; cv=none; b=TenmkRQ+VEBh/OS7dKvig2S1f0xerqTRc+KHfe1ArkUZTx8lpWRtvSubImXpMas8HmwLuL4i8GTgBYYXkDXhCokzAEMUHqyXkVKp/U50OcGtw6SYZnxU4OEaEkXSlrn4oL82LdjjXL3xqZ+GgV7bq+FzHBSfOY4/kN0XHix7awE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719447314; c=relaxed/simple;
	bh=2p5EG4TxmOiPEH+t9kn9Rb8d53/6YRQ7GrDUwYL7PuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLh2bBjQPJ+hXNNvMgN5FAdKfX4Mjxk/eLFp532tAoOB8AT6YPNFy2fabLx30RTGqyEoRjYl2SPrBX0mKi0rrxymCYSkcpUnbsNcBAOaOxL13u8ZcAs63vcSRFPMik432iWUn5ewlPlQXP4Rpb/zV/Jfu4WAIEcV18P5mk2fm8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=CmIexwDU; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ggjfhvPJJwWye9h4/ZgqoG3NghwCXPnWkxN0KYeXeWg=; b=CmIexwDUID5YCYFoDDX84Ean0h
	JVAehrX0J1l4PzAy8Zrkq+yawMLvUQZfhOmhfxW91bSoFzLuXMR+fmmMMeHYv6Sqoi+Pj17rOhKgk
	uf1cLBXnzf+jWWdVQY5pVAGPt3AXtXkVsSES8MdO9S0E0dV0zuJU8z1jrAN0KhjBCCy8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sMcmr-0015jx-Bu; Thu, 27 Jun 2024 02:14:53 +0200
Date: Thu, 27 Jun 2024 02:14:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: Andrew Halaney <ahalaney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
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
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] net: stmmac: Add interconnect support
Message-ID: <c7bcc2ae-eb27-4acc-b18c-8cb584b4d616@lunn.ch>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-2-eaa7cf9060f0@quicinc.com>
 <owkerbnbenzwtnu2kbbas5brhnak2e37azxtzezmw3hb6mficq@ffpqrqglmp4c>
 <cf6c2526-ba12-4627-b4e9-20ce5b4d175c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf6c2526-ba12-4627-b4e9-20ce5b4d175c@quicinc.com>

On Wed, Jun 26, 2024 at 04:38:34PM -0700, Sagar Cheluvegowda wrote:
> 
> 
> On 6/26/2024 7:54 AM, Andrew Halaney wrote:
> > On Tue, Jun 25, 2024 at 04:49:29PM GMT, Sagar Cheluvegowda wrote:
> >> Add interconnect support to vote for bus bandwidth based
> >> on the current speed of the driver.This change adds support
> >> for two different paths - one from ethernet to DDR and the
> >> other from Apps to ethernet.
> > 
> > "APPS" is a qualcomm term, since you're trying to go the generic route
> > here maybe just say CPU to ethernet?
> > 
> I can update this in my next patch.
> 
> Sagar

Please trim emails when replying to just the needed context.

Also, i asked what Apps meant in response to an earlier version of
this patch. I think you ignored me....

       Andrew

