Return-Path: <linux-arm-msm+bounces-43377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 176049FCC5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE527161C4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 17:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C09145348;
	Thu, 26 Dec 2024 17:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="rv8yFZ1R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F7D2AEE0;
	Thu, 26 Dec 2024 17:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735233309; cv=none; b=bN4M0G/0QDC9AWmMmB/9zvTvLdaypoaASIuwdluoW7SL3WgOtiM5HLkHPJaDRVwQ6OhviQRP9rc7CxZFMd8qTt+NI9qpf9z7eyjQ3/pbP0leXaViy6ZtDgKwZ9wS4EN382v7pwV+HLm1YDn6apsdssE/SDSRfAoj9lThLTjAE/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735233309; c=relaxed/simple;
	bh=YpIUp0ifA/Dq0cGBT8J7DFxSFvYluY0rvcYvBvaBJdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErTfU5ROrLrJtRu3cFX+Oiqjc4ZHyOwublIx2bu9JiEHcRLn0aIG4cktTWRO4ee5Qf5CFTpTyzx05IwZIEPJxI/pY7RlCcMOPWL57Yq9LOSCS0mnX99XAUxXNATDHfjXAINoOu+m8pxiOD96JbpHl5cEy/FvKXm6y7IA79fb4nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=rv8yFZ1R; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OSSYTZhlNYuWLdojci1CHyfJ19u42cVdqr9Ovo7YbXU=; b=rv8yFZ1RdFiszPsIp2g446Jg9r
	5yCZ4KJnEFBfhmqSyNhi30sXvS55XbvmI+NrpvykjyVR9t/PrVw17g0cxYNoeFh7LfF8KdFGyAk4x
	PRg+itdJsllxbbDnd1gzsjgKcUmVulpX3uEAZxPg+UGKNz8KeH3YQWDjUIwFn2kukbSA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tQrRV-00GQ1U-0i; Thu, 26 Dec 2024 18:14:37 +0100
Date: Thu, 26 Dec 2024 18:14:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] Support tuning the RX sampling swap of the MAC.
Message-ID: <59590ff5-676a-4cd6-a951-96f66972aad4@lunn.ch>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <6dcfdb0b-c1ec-49f7-927e-531b20264d68@lunn.ch>
 <2aa2c6dd-e3f2-4b9b-8572-20b801edef81@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2aa2c6dd-e3f2-4b9b-8572-20b801edef81@quicinc.com>

On Thu, Dec 26, 2024 at 11:06:48AM +0800, Yijie Yang wrote:
> 
> 
> On 2024-12-26 01:49, Andrew Lunn wrote:
> > On Wed, Dec 25, 2024 at 06:04:44PM +0800, Yijie Yang wrote:
> > > The Ethernet MAC requires precise sampling times at Rx, but signals on the
> > > Rx side after transmission on the board may vary due to different hardware
> > > layouts. The RGMII_CONFIG2_RX_PROG_SWAP can be used to switch the sampling
> > > occasion between the rising edge and falling edge of the clock to meet the
> > > sampling requirements.
> > 
> > The RGMII specification says that RD[3:0] pins are sampled on the
> > rising edge for bits 3:0 and falling edge for bits 7:4.
> > 
> > Given this is part of the standard, why would you want to do anything
> > else?
> > 
> > Is this maybe another symptom of having the RGMII delays messed up?
> > 
> > Anyway, i don't see a need for this property, unless you are working
> > with a PHY which breaks the RGMII standard, and has its clock
> > reversed?
> 
> Please correct me if there are any errors. As described in the Intel and TI
> design guidelines, Dual Data Rate (DDR), which samples at both edges of the
> clock, is primarily used for 1Gbps speeds. For 100Mbps and 10Mbps speeds,
> Single Data Rate (SDR), which samples at the rising edge of the clock, is
> typically adopted.

If it is typically adopted, why do you need to support falling edge?
Because we can is not a good reason. Do you have a board with a PHY
which requires falling edge for some reason?

	Andrew


