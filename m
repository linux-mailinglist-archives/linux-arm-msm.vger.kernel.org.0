Return-Path: <linux-arm-msm+bounces-25532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD9292ABB0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 00:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 127B01F21C63
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 22:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB4C146D40;
	Mon,  8 Jul 2024 22:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="SIy2gX3W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC202D058;
	Mon,  8 Jul 2024 22:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720476174; cv=none; b=Ev1JSjLw47B+u5rqR75hHDGOl/Tx140/qgODZs0R0ROCJGZ6Lc/w0fEfPB3/iIBjWviOPLmT0JbmQkzdztCL2eCLV0nJcYmV8xaCdwg1JA1zwRoucvNkVewyyYiwE+5p49cTsh3Hjr07oFCT6iG2YIihzPGKPnX4iySIEgRzbz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720476174; c=relaxed/simple;
	bh=2ARWLDWUDVA17nDDyv4uiCgPWnM41NZwWTZFnmVktsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5ywvi1CrbAypuJvzr1NHvHuUzqSlw6I6CYrCUttUkvIO/rYJ02eh61stinisHqDmqpFFcUEe+QhjPLM4OtWwb7lmre9/aO+Wx8k9S97Vj1VOQabnTH+Wc6LtVOr6V6IXAwSeErdtJEGj+A3bwihlVmjh+YuPy0N8fSjoph7RJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=SIy2gX3W; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Kkwl/8AGKMUcErKs7sxasCns8aNPh5VtttjeXalhu0M=; b=SIy2gX3Wdf33bPhJ5NwC1gDcDE
	8WniHbthaDeH+KHeChngiJL7YlZLlgxaV+yRT2/62wpVtRLhs8ob4Z7dQdCp48LbfiRpeGtUEczKI
	iJJmr4RIo0CY0UVNXfpHUCx4GELhvdUP2gA71hf4tKjzUMUI/AL9fEphwPNODgAnxPk4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sQwRO-0024zl-1p; Tue, 09 Jul 2024 00:02:34 +0200
Date: Tue, 9 Jul 2024 00:02:34 +0200
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
Subject: Re: [PATCH v4 1/2] dt-bindings: net: qcom: ethernet: Add
 interconnect properties
Message-ID: <06321488-cd8c-4d78-8291-8945b32c6258@lunn.ch>
References: <20240708-icc_bw_voting_from_ethqos-v4-0-c6bc3db86071@quicinc.com>
 <20240708-icc_bw_voting_from_ethqos-v4-1-c6bc3db86071@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708-icc_bw_voting_from_ethqos-v4-1-c6bc3db86071@quicinc.com>

On Mon, Jul 08, 2024 at 02:30:00PM -0700, Sagar Cheluvegowda wrote:
> Add documentation for the interconnect and interconnect-names
> properties required when voting for AHB and AXI buses.
> 
> Suggested-by: Andrew Halaney <ahalaney@redhat.com>
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

