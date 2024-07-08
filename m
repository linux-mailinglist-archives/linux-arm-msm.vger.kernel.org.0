Return-Path: <linux-arm-msm+bounces-25533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3D692ABB7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 00:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D37E1C215AE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 22:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED1A14EC7D;
	Mon,  8 Jul 2024 22:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="fl+ilK0H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65BA14D28A;
	Mon,  8 Jul 2024 22:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720476204; cv=none; b=OK+2PPLzHnM++OyoQiEOKOZ8P7ALTy8JyjrjcHeS7PP9hwaEI25Y2L02iHFS4h9BXbJTNyLvDR9uGmzeamFB9Ja7EIQ/IGGkv5fctjuw3fZkqJFmwBbun7aC9b15VnSovlHszKSoNY15btgOlJCjcFePuLJnEOEYBIyOMF8rFHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720476204; c=relaxed/simple;
	bh=FD0PEdwlKnRybCD0FuQS/RkB7rVD1rm+iz/Cz00kSMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bdskg3VqPLXJxBmtCQNvy6hT9sFicYIAO4w6SqKVPOCTgR4BqOBmDkiwLyuw+jJWCpZFN8+vTmGuZi8gnpoNuviKW8JfJ3oivi/ZPeRecfO6yabzoyN+emJOLeVJ97m7ibL9s5857+1IJmHHqH8PaDCDvQCv45h0gtEipEGaWt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=fl+ilK0H; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gAgXCvUKwhxWf6sDpKACJ8dGQFibYCWvhGf+QFQgbO8=; b=fl+ilK0HbmEB7zLU2AV6qHW8V2
	wUuk9Hk+QHWh6pQwk81LXXFO8MKSswj0LXA9Ql9BHf6E7E1mFcr2atdMhjFLDYCjKsxkvTmXf/5FS
	ioZxO9dBuqadbUSJTVh+b7TZrC0Iv2eD9Mlo3F6X3muOGt6zCTEcf4grBdVufPvOq0LE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sQwRy-002512-08; Tue, 09 Jul 2024 00:03:10 +0200
Date: Tue, 9 Jul 2024 00:03:09 +0200
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
Subject: Re: [PATCH v4 2/2] net: stmmac: Add interconnect support
Message-ID: <0f83f143-09b3-4d0d-b1a2-c27b88a50317@lunn.ch>
References: <20240708-icc_bw_voting_from_ethqos-v4-0-c6bc3db86071@quicinc.com>
 <20240708-icc_bw_voting_from_ethqos-v4-2-c6bc3db86071@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708-icc_bw_voting_from_ethqos-v4-2-c6bc3db86071@quicinc.com>

On Mon, Jul 08, 2024 at 02:30:01PM -0700, Sagar Cheluvegowda wrote:
> Add interconnect support to vote for bus bandwidth based
> on the current speed of the driver.
> Adds support for two different paths - one from ethernet to
> DDR and the other from CPU to ethernet, Vote from each
> interconnect client is aggregated and the on-chip interconnect
> hardware is configured to the most appropriate bandwidth profile.
> 
> Suggested-by: Andrew Halaney <ahalaney@redhat.com>
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

